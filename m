Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAA0C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6u3N2T6sQi1Z1c8x0CoJeove0ost1XCLW14esiat9kw=; b=pdHBxCPy0Er728NKrAHFPjSiFB
	cGkx9rgY7p3+GsV8uI4mr6c2TAEH2B2hY8UprRLjndsAY4/f8NxXBLpNsXKObs6hygKqUnBuX5OlD
	evIHvap2dcTmLEwbeTA61N2b8DyhDMmSybcNZ456K0MAns0l75CEzrRCKITIjqO8m+p4ykkr3U0Yx
	ndR9CuPi4jYm1zz7pHuaIYlA7pScDgmhWJgS1uLwjWzagmenEEooafKHAIG1oVry20VV6jqHhi6kA
	6IgKolm5gERUTMkORAsMGyAFMh2tWM5CBlBgMEiA6nVU7FqO2Vf26iasJ4GPxBaKhrz3PYzguYVMC
	RU5UOJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LyV-00000008EO3-1FPM;
	Wed, 23 Sep 2026 12:21:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LyS-00000008ENR-2NUm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:21:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso41825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790166079; x=1790770879; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6u3N2T6sQi1Z1c8x0CoJeove0ost1XCLW14esiat9kw=;
        b=jmFubC8uCrrmSq4BMNeClUNiL39U1u7Sme5LfhpkGUUQ86mX5ldxZNfN7FSoCytcVH
         5VDaXnu0sdAMCW5J8A0Ecu5fyc9ZNC1xHHUfFEX2NIwbUH4HcNs4/k+vIVlaDnSUHQII
         6KkbR/wEbjkrNH5LKuqjItxqsYp61Ivz0Fy4rnSTJ51LlljA2bTmLRVvbCbztxMRk/R0
         hmyEeqFBtepme/8N0o7D0rU6dSngjWXG+cBa7UWyqWyDx8A6w9Js+YSqjUxGmlRhgZNG
         gyXrW6ay4yCdXt5sWfOKe1pEQ9dvQmEZUn+b5TVW8MvWMjVCSYNnkwLXiSi6Q49hrXkY
         UzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166079; x=1790770879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6u3N2T6sQi1Z1c8x0CoJeove0ost1XCLW14esiat9kw=;
        b=Q7DrIONde/G4RYvrAOjeZ5JMDDIYV8pu4q4Da+EMjOS1IifHcb6LhkhhLEV9yqzirE
         nDIl1XtnEJA+9Iy1L3pXvfexKHoV6aqtQLww9Y4Im52Tn5ibUcFVd3aerjWyGW+iCYEZ
         zz2pH716PU0rxUjfsb0dJXH8rvbsDZrV0Rcfu2wVOWcC3bf6WDUgWEpKg8AnqBftvupx
         GoATi3T6QCN7YZXEu2eN+MT/ueP4BYbSZyLRf5z7VYpA2b/0c51odqHGTlfttVrCglRG
         I1bmb/kwiQQOueGGZ541eO0L00u29hkM24ssQW2pARqxiQTgfYq6hRP4Lslqipj+iBny
         8i/w==
X-Forwarded-Encrypted: i=1; AKwUvBz1nj07wXVuoD8Y0AMMRHAl2N7xgC/SvDL5HIHGDiJjYK9n5anRLskbwzr1udNB3S4hQJE+xS2Z+2vREfRkA92n@lists.infradead.org
X-Gm-Message-State: AFuF++kbZUXU1jcjZVWYXIobzQqV2uMymrQVlap/Ca5Xcd1eM2WE8pFv
	B90toPqzaLNYKNld//pRklScEFaM59VngyHlk1kneHte5pLbyNP/gJlkz1VV4oSonA==
X-Gm-Gg: AYBFou17cwaO9SwMmruMqp8FTe5nwoCu6koXWPKuK5h2NDowx6icbm3C+10VvArg+qV
	rRiAIi6BEOj9lSi0uNVrqj3Hb6Wnnj2XdThNMgSNfX/wvGUXLxz4BGYO4y8Dl9q+MSpPbLBRB+9
	Yq92eWGUk3meAKeRuHoKNJPTiAMQCoOua0qziiH3jDbl2ynFacoQ0xQcIzeoObQ1GBGmRdQzfux
	BzshKgIwogydpplKSAtInYsGTiAA+QceJbIHnRuQO/erhvrX5PzOQUdzQ5drpw+nN7ocFVNZy8c
	tnWTck/DRsXL+9dZyOR4BppavAS2J030oxKoRIRwRtMM2JuGC2/2uuapfgNBGKFLzF466/k7Qub
	FkDdek/ujuYMElZ3TQIgE7SdGwXBxfhWlA87B2ZI1qDKJw0b7qhwdgTPvaVMs61FRq8CtIh+mVF
	1JK22vxGEohB3CBdlNdpv0iE2SxpTdeN0a69/ljQuG5friqMA7vpcXh7coU4saHpB40XWsxRPWR
	nDPbrnzHCzMGXoimLm+sqWjxPrEaMvyjg9mnDx9
X-Received: by 2002:a05:600c:a415:b0:49e:65b0:7b7c with SMTP id 5b1f17b1804b1-49fe0c3692cmr754895e9.7.1790166078185;
        Wed, 23 Sep 2026 05:21:18 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1c159esm82068375e9.4.2026.09.23.05.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:21:16 -0700 (PDT)
Date: Wed, 23 Sep 2026 12:21:13 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 04/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <arPEOTzER6gberB5@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-5-smostafa@google.com>
 <arLa0E3xq5dGuPpd@nvidia.com>
 <20260922214818.GA2545495@nvidia.com>
 <arOmSxqRxhd717Xy@google.com>
 <20260923115501.GD2545495@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923115501.GD2545495@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_052120_620461_A7C4496A 
X-CRM114-Status: GOOD (  20.84  )
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

On Wed, Sep 23, 2026 at 08:55:01AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 23, 2026 at 10:13:31AM +0000, Mostafa Saleh wrote:
> > > If kvm doesn't want to dev_err log that's fine, we should able to
> > > #define that away too shouldn't we? And maybe it does want to log?
> > 
> > The hypervisor can not print to the kernel console, so dev_err()
> > will not compile, I'd rather keep that outside and let the caller
> > decide what is a probe failure and print it's own message that keeping
> > the code and stubbing dev_err().
> 
> I'd rather stub the dev_err than split it like this. Every driver
> should still do these checks, it doesn't entirely make sense to omit
> them from the pkvm flow.. No print, fine (and really, pkvm has no
> tracing, printing or anything?)

Tracing is supported, trace_printk() might be coming soon to upstream,
but console printing is not supported at the moment.

> 
> As a stube I'd do something like arm_smmu_err(smmu, "blah"); pkvm can
> do whatever with that.

That's ok by me, we can define those next to the struct typedefs for
each one.

Thanks,
Mostafa

> 
> Jason

