Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F9BCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omy4WJN0/IH2ixY6PVE8ad6VlcN2e6pibSMeSb5zsMA=; b=tuV05s8RDbEJIJKDcKPN6PWSJw
	FeAVisaAz3BWpj+bksLJ6Xp9m8Yv/+j/+mkA1khFn0of89sI8B8gfgLCtGa8yx4CDfVld8EXGXAo0
	kdAGXf9/3qSFOpnBo6fMFk6qQWm7X3+oNJzD+wJB3+1VU6D9HAiASw3U0UEeETMMVWg22eGntstXi
	eOV/73RTBqYBNLiYuC4n+pN3orshICnhRvvHnMhdiFWU7yq+KkIsvBWP3dt+aBDM/2Me5ssNv9BKW
	IZ47lfWFtRxMJoKExNsVvKyrAZmpLAXWlyrYE2IFSg6vzOcdpxFuHAlJO48AQj+iO+ra+p830JhBp
	22gfJawQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSTY-0000000E2lZ-3M5o;
	Mon, 11 May 2026 15:23:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSTV-0000000E2ki-3lKi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 15:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778512997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=omy4WJN0/IH2ixY6PVE8ad6VlcN2e6pibSMeSb5zsMA=;
	b=TBRuEoFNV1HTwCABavdZk4UN6jfdST9k4p6qQCChQW/tBPTpAaIIx6uU0wMlg8VLSibycy
	IdrlRnVDUORV9fPeQ+LzOPZVSs2iE8X5OB4sU6vdbdsa1mzaZAWVXeagHZYvz5B/w+YBCk
	Q2SDJBtPnEal4m5TaVmG/AgbPEcachY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-3mSaZ8fRNhC64420LjFIsQ-1; Mon, 11 May 2026 11:23:15 -0400
X-MC-Unique: 3mSaZ8fRNhC64420LjFIsQ-1
X-Mimecast-MFC-AGG-ID: 3mSaZ8fRNhC64420LjFIsQ_1778512995
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90c991bfcc3so41529485a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512995; x=1779117795;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=omy4WJN0/IH2ixY6PVE8ad6VlcN2e6pibSMeSb5zsMA=;
        b=s0yPLQyIow67IlgurpqCHfUztLZLRRednb8fbNvUQH3S53o96f/u2cNzb9oSE6kxW2
         VkVXk1sVgje46QBS6GRzrptfnnwMbUQBzgd/CJohro16mRmM5z9TrwLANlAusaUn0WFT
         mhLSfsGpp/Mugkuii9EM6nPtIRX/vKXQnCkHTyVzU0ka7MGyz++Cl1qBK0sBuS9mGNSe
         HcJ3nEvTDYJ9eavVDhwFmFRV30LRH9l82oGn0+z9w75pLtAotEaoyXq85u1MTKOXABjD
         aF04h4dAHBhu8JLTSybgEkNfNK19fr1gTwFxP3ymO3/7iPZW71wWINvDaWraJbMREiQc
         u1fA==
X-Forwarded-Encrypted: i=1; AFNElJ+DimwbbxXECfTq5jx0JHE7RHsE/vrUpWxMOeezgu2waLziTujYPtVc5XlIlozqwEXl4kgIDuFeMIjnVG3rzMsG@lists.infradead.org
X-Gm-Message-State: AOJu0YzLiaTJkZgmBdsek/7abAXxpfcHyZzNp816ADcMts/dJVvftrv5
	44WfpwPFrBSPgpb2WOumSPr2+SKd4MQGIVh0NqdgYBvDd1J5EHzypLgEmzFWQT5Y08NZrxg1fvI
	mTyfli6670E4eF1LHlXXVCStPrJhKwXs0+zikUtjNqMrglq0bx+A3cKzAzEa3iwmx67sbJCcYWd
	qm
X-Gm-Gg: Acq92OGmQOjBcDhKXHbWJHdRWZ5D8NWnSLQQqvwW1Jla5XrrY1ae4lgc/kPh1Hnxk4H
	8kovHwTdWksjQtMyDk9zdhyZhSji9uY5cDcqDvtdypR2mgBce3LIAy0m219k6+FMvZ1ODLetl2C
	mNobvlvtD4La/js9yFJORAOTju4dEAc5bW5+oNzR9/sMRGIEdUI3wHI6MJqXk0PiWtw22pAdlad
	FpvDoVm4KevaL+1nOxWUEGOCa97+409XiVPQZN8vOkO7NakhNGZMSFVhSyrJ6IQtIAvxPfIpDRI
	tAXGC9tgG5p5h3zGp07WFog2gkvaLBJnUYQgv6WjAxbpwtTIlCtzxU2KtHueY9swamH7MClUw2D
	EyzLg03fLRpCioSkRvkmejrc6HodNvWXfPuTZHHO/d6ydhSWRAXxHQQbO
X-Received: by 2002:a05:620a:45a6:b0:8d6:6db0:88de with SMTP id af79cd13be357-90653728e7emr2602269385a.44.1778512994893;
        Mon, 11 May 2026 08:23:14 -0700 (PDT)
X-Received: by 2002:a05:620a:45a6:b0:8d6:6db0:88de with SMTP id af79cd13be357-90653728e7emr2602263885a.44.1778512994300;
        Mon, 11 May 2026 08:23:14 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b87c02fbsm1151478785a.25.2026.05.11.08.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:23:12 -0700 (PDT)
Date: Mon, 11 May 2026 11:23:11 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
Message-ID: <agH0Xy0hD4MHjP7n@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CIcM60nsji96ZMZ_kTIsVGy0kdInt_xo1FfTCE9oyU0_1778512995
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_082317_993510_135BADAA 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

On Mon, May 11, 2026 at 08:47:29PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
> duty cycle of 50% after predivision.
> 
> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
> pre-divider division factor is 2^n.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


