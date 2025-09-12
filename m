Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A43CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 06:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lB5FktB8/5J4NSxT9Jjpfp64bihH79idm8uD0pyv3Sk=; b=WxVKvdNrJp1627+7tiN1cbXIXb
	GBzhJYX/MTE2bNVmh1JimiMx+j6349WAYEYm31ymdqlfYZy4Wj+qyTHFWjebs8c5dJg4JMDfQVY3l
	81HQ8ZJApUuOWet+dOCrxxPQmz/EUmiNCVZ5ERGx0q0OTKp90gOtWGMcJ0cBnVPXXfWXzFUVHAg3c
	8jVuzMWH2zoeSvLV//pYZxHWBtaH7ashSFPrCIl/yyZcGNXJsx1338i2V0Gi44HppBjnPJ26g2MSC
	r4ErNyaUiz/0hGWZWzBvgGBlKep84QjhUz+RY/5GhXTzoOQYTH/RPU/eqXo2VfnVuRt1Gz93rFpWd
	YJNS3yrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwww2-00000007IqK-3Dlz;
	Fri, 12 Sep 2025 06:07:02 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwww0-00000007Iov-1A5f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 06:07:01 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5607c2f1598so1711684e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 23:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757657218; x=1758262018; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lB5FktB8/5J4NSxT9Jjpfp64bihH79idm8uD0pyv3Sk=;
        b=e6TWrzL3R/a3JmCKKsErkxuhm0G7ZAsZ0d/WM97bBn+49tQdxPrL/jF3AF1e2OJLJK
         PzxU0JjGdTAoNjMpQlEN1Mfp3ttqCxGNW7yJYoZz9AuMxP1v0EYXnIk346zjlapu+NPl
         zrNz2oyGKOOAOZ3RwWrsZ439gcBhTUid0Nofk4e8PXWOWY4pIx17NT2e0T0mAzvSvLDq
         sWyNvhj+hNzkVZRIflJV8gy6fVv8YAPMVOs10wS/6o5vLHEDpa7Z2As7Ej89Ury52iKq
         Da6Ve8w0t9AoY8vV+P4pJjLXb1SNwfmBh9JpgmGVSY+md2YD4sGABYRSYzOYsSoRasZs
         92jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757657218; x=1758262018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lB5FktB8/5J4NSxT9Jjpfp64bihH79idm8uD0pyv3Sk=;
        b=Naql9jYcfcZ9/a7rC8+VEJPC8/0DpMDjjugOsZsN/f9EPakgIgoORuIHOPVpPmqzuK
         /P0EO8UZjjZNqNJFQJC3/y3OC+B64rddrjHdpSLKG05+CHFSdZebNESyireG5dsDcuKH
         KcYIK0Mgem7ntzMjsnACI47yU/LLrVAnp5766cTFAymkfd3Om2lVU0k2PHfxqkJ9vMFJ
         nlKNqXnIhQ6sO70AcHUwuMvLDiH47BCz0GgT1IuK4MDrOXEIXmdWxGQjozBkTP7UsBaH
         RxhSJZPLVfeRsKb26eddsnwJxppyOIDYVudPnEpTaUYUoQlETAIzVEmmezqcN3qaqgH+
         wgPg==
X-Gm-Message-State: AOJu0YymC9fNvxFR9bB4JxIj2JFsiUFTkUkuNzUUUd4kXOCOXa4L1a04
	9IZmxXiQ04+leucahuCtQDaedxCTyeDHbE802Mtb8GcdFa+pV385EM8VldGp6TKx2hQ=
X-Gm-Gg: ASbGncudXRysv6FbkqFYvqga2g+gpRZt9Z1a93RdZL9MEpq1E7TX8ZwrFxDDELcfNVT
	00RUlo9VN8ir+z3C8jadNJJooBlFiMsYvrntZDENcURei9P22TMP8vOsYNtm1aOOBIS8hoxp5jv
	r+7rVTJKKgY2+ebKV9RFsF+hshD0yA0O+/ryvtulTkDUmpc4R+MmQ7YWglssxDqRuAljN2phcU2
	QuWOu/qkW8X8S7Q+mYfLYkjKYdR+8WwOZQiZW1pP2ioPz5YZ6+rRXEeYuNbbZqoFhGCi+s2WIb8
	y3GRQPe8WNN+grZubwTykzdGM2KwYAxJaBqP7aUyGg/fmSQS7BSbTOC1R3/eK3aeoXYFX/de9pm
	VPfmzrZAfKSZhdw9naNOj/YNRxOGCRoteDxqd1M3JRJx+s288qSJ06BN3EDUJLB9WmQ==
X-Google-Smtp-Source: AGHT+IE71rEGB081PBLdScsfzSjSdSw6Z/pFN6aBX9OQzO88wLDWOZrCaDv039zv6HKilPxbDHoxow==
X-Received: by 2002:ac2:4cb1:0:b0:55f:7be9:7a32 with SMTP id 2adb3069b0e04-5704f1ce6f0mr493677e87.37.1757657217951;
        Thu, 11 Sep 2025 23:06:57 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dfa5sm887553e87.112.2025.09.11.23.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 23:06:57 -0700 (PDT)
Date: Fri, 12 Sep 2025 09:06:55 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de, stable@vger.kernel.org,
	Jon Mason <jon.mason@arm.com>, Ross Burton <ross.burton@arm.com>,
	bruce.ashfield@gmail.com
Subject: Re: [PATCH] arm64 defconfig: remove CONFIG_SCHED_DEBUG reference
Message-ID: <aMO4fzACWKFtwJ0v@nuoska>
References: <20250911144714.2774539-1-mikko.rapeli@linaro.org>
 <386a9d77-f708-4a47-8318-b83f862d5c1d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <386a9d77-f708-4a47-8318-b83f862d5c1d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_230700_323956_1432D084 
X-CRM114-Status: GOOD (  14.99  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, Sep 11, 2025 at 05:01:11PM +0200, Krzysztof Kozlowski wrote:
> On 11/09/2025 16:47, Mikko Rapeli wrote:
> > It has been completely removed since v6.14-rc6 by
> 
> In the future please use kernel style commit SHA ("foo") style.
> Checkpatch probably complained about this as well - are you sure that
> you had no warnings here?

Oops forgot to run checkpatch :/
 
> > commit dd5bdaf2b72da81d57f4f99e518af80002b6562e
> > Author:     Ingo Molnar <mingo@kernel.org>
> > AuthorDate: Mon Mar 17 11:42:54 2025 +0100
> > Commit:     Ingo Molnar <mingo@kernel.org>
> > CommitDate: Wed Mar 19 22:20:53 2025 +0100
> > 
> >     sched/debug: Make CONFIG_SCHED_DEBUG functionality unconditional
> 
> So all above is not necessary.
> 
> Anyway, this was already sent:
> https://lore.kernel.org/all/20250828103828.33255-1-twoerner@gmail.com/

Good, hope this is queued and lands in stable too. Would be nice to get
this to 6.16.y.

Cheers,

-Mikko

