Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370FCD74949
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOkAHQrRWR68mUWgK22Q1GiCQ9kh+zI0wkYMgC8eCUQ=; b=nLyguUFZxOksdW77krER4h8itJ
	xV8kQ/MProhzYRbsiHwvJ3tQFi5rrP4XqfIDzEXIyBobvdTv+BvMh4jKTERh4gAu44yG3NaEfSPM6
	LIG6mieRb/8w7ZOpqCur3Y0V3Mr5xokvLMnXcobCGat/Q6WdY6ofjGdkBDYsJfc36x8OjMMQHDGWh
	yNjlu3hobuNRPAUEzDWx/9P/1w6Xdt0zDlNQqEdyn1tLeR88mkppfA6BVAl4cufGo+7qY9ep9IXGb
	3McMRRMq9ZKcMvnLfWNv5M7Yl2KX6zqBSAtlVGdx3M0KvHr6f8HPDSOpEha7F2YKnvTGddQhp8KG5
	4jcOFjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60Ly-0000000GfhX-3Cq4;
	Wed, 30 Oct 2024 04:30:42 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5zCc-0000000GaO0-2xjg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 03:16:59 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2e2e6a1042dso4769475a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 20:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730258217; x=1730863017; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uOkAHQrRWR68mUWgK22Q1GiCQ9kh+zI0wkYMgC8eCUQ=;
        b=im5coxMdnNplbCZhQGgo+QgnMu2Zqm4Wt6n6V7VYqg/R3cz1lUf9Kbb9gNgv2MNJEv
         8nap0XZOT/joBjveX4ehlJo3RLdQI6Cf/wQLFLPTtcqJwEyKxV31vQsIcN5x8VAu7qIX
         yGcFwerqNuE67uI1ZicgVTfi5li1iKe73jFRR3iem8kWJhZfVzVCJ7lF+L44XHNEgSuR
         0Y8wiaiqNQa8yK/4Feg+1ewu46ATLu2YsMODA4TlXk7+ci44TwqiJdmTo7XzRugzBi8l
         6S8uA4SFeVPoLxtcM6zLvFREGBy5byMx0T1NpFkUcSO393OicCl9FbKNG4s1N8JdgWNb
         lPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730258217; x=1730863017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOkAHQrRWR68mUWgK22Q1GiCQ9kh+zI0wkYMgC8eCUQ=;
        b=B0QmIgGym2QxBWBg5oAkqAh/uhjG5Dfjew1K+tnvU0BEaNYC3CfMqWSoglZkwvZoII
         EXRQd78f/rnxFdO6+ADIauF9YicX87ZoQrWZejv0474iov//987IrYjNWbDZtg8Rg/4y
         U0TJvXCjw/VQpQ6DsJOGjXeUkQ/GhUcdRMPq/k0CFCOs4eS45bEaF8mM8u50oBE3dymH
         vLxRVibiLUlYgeTsG59w87ZeOBO0O9AyTuEY3Ccm96GY/5q5X81SzWBwg0gOwWvzBPiP
         n6Luf/WqsDcNEUod/Un7zchz2ThH2VC+/hdOBeKSWs/tvppovRaJXd2pODqnhHMOK6ke
         IF5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDb/Cq4fSC/J7n5tZ2rFjHCPhvtNldzVL0fxx3EEwwNPHllPJMBJG3Z+5dB+NPkX3B5+WZ8+N85vMyvJrETGQQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzEENTEvN4Xepg9lsl6DAvMvSTubiDQB5rm9h+fK89dA1Og8ZvP
	wicsKKuO81TpWVfLDC2gahVVCYkvdQb/JNZk6sJuth5B7Qa7u7uVxWHRaSUBlOM=
X-Google-Smtp-Source: AGHT+IHCWZPqicu+zBEO5ISCpJXDjDagWTSuQ1d4uht5fImHKQzKKPSKGEOWL+8DYHlMq7FTvt4Kxg==
X-Received: by 2002:a17:90b:50e:b0:2e2:e6bf:cd64 with SMTP id 98e67ed59e1d1-2e8f104a4d1mr15472363a91.5.1730258217352;
        Tue, 29 Oct 2024 20:16:57 -0700 (PDT)
Received: from localhost ([122.172.85.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc013378sm72539135ad.171.2024.10.29.20.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 20:16:56 -0700 (PDT)
Date: Wed, 30 Oct 2024 08:46:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Markus Mayer <mmayer@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	"Rafael J . Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "cpufreq: brcmstb-avs-cpufreq: Fix initial
 command check"
Message-ID: <20241030031654.yfksespjetnirecb@vireshk-i7>
References: <20241029152227.3037833-1-colin.i.king@gmail.com>
 <51b6692c-4e71-4f4e-ac73-fc87b9f2ac5b@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51b6692c-4e71-4f4e-ac73-fc87b9f2ac5b@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_201658_797999_4FF4FF74 
X-CRM114-Status: GOOD (  12.14  )
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

On 29-10-24, 10:06, Florian Fainelli wrote:
> On 10/29/24 08:22, Colin Ian King wrote:
> > Currently the condition ((rc != -ENOTSUPP) || (rc != -EINVAL)) is always
> > true because rc cannot be equal to two different values at the same time,
> > so it must be not equal to at least one of them. Fix the original commit
> > that introduced the issue.
> > 
> > This reverts commit 22a26cc6a51ef73dcfeb64c50513903f6b2d53d8.
> > 
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> 
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>

Applied. Thanks.

-- 
viresh

