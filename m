Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566A4CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 23:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EcnKw5Vg/t2I2OAIh++3uub4f2qFY8lrELJJkn3rfs=; b=ghyipEvWdLKqqwil7QUHeSNjNC
	8AnRa00wayWSPpcA5ICNUM2A+PDOMfuOQ05wNvelAjMhQ2cN8QeW2QyUyPDdEWCPmE3utglA23mMh
	dN209RhFEZPKiuvpsXaRREiONRMH7eBV2uZGR4euc1/btYC1HtlyxsNkcmXIuFqVQQnGv7EpHlPkc
	S/YdiKR8u357fcFttsIB8kmrdWOAHg8Za4NnRrkJbg1KNMw9fj0e9AJOi2i+YqbKfvChYSEFcBCFF
	U/e+1RpfuEFRvvx1wjH5FsaRxagVmfS8jSy+87AayGnB4II8wJlk8IiIcMGMtseOnXq2TCqX3QhWZ
	aO+yuSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQ7A-0000000CjBf-35Dg;
	Tue, 04 Nov 2025 23:07:00 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQ77-0000000CjBI-28FO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 23:06:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2955623e6faso37197875ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 15:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297616; x=1762902416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EcnKw5Vg/t2I2OAIh++3uub4f2qFY8lrELJJkn3rfs=;
        b=JklZyQPUodkAhlukrRHKMTtnjBE+URcD7Am+K/7uTlBOHNuaYcw1VbUUtUG9w/gVw9
         jXeAgZzPfXd+bUn9hMsNHH9Jf8oOIt4T/ECr7LRcbc+lua7ta0gWZnbDr2Y+CSW328lt
         nStW7rKsadhc8KRSX6lfc8Duilu5Ydql8FqFXKFfZofPGYC/kMe3tSJdSrRuS+Z5FNHl
         x4sJrrAwMcZWPSzrkN6aPXCEwSv1WTLEfNwS0UlnV120aF17h21zA+4jjh6bM1FWbcHP
         1vkPpBzqrPAz3gDAi7Zpsu7hraIDbkx+Sdc3XD0aRev8fMudy04/rsdvm1b6f+1mslnL
         0HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297616; x=1762902416;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EcnKw5Vg/t2I2OAIh++3uub4f2qFY8lrELJJkn3rfs=;
        b=ikX9CbC9kiX0jLL47CFjG/bL/pyby93s7hkpDWFP0JpyNJEkcs3SGb1wIecDdawTN4
         MiNXSz/dpCvKlMqAF4xdDiygn+FxrrMuWya7fkKCF4tjD4jLW9wdWcQ8haQljGGQUblI
         06tqNFG9HOyM9zIIjytl0ClSbZvpYb9EANd/24N4mdJ2RbWZDmDCnTu0fL6jdFMBSkIj
         pekM8Kd/cBTxVv/RTSIXqDs6u+CuUpUpDmdAqhDJBcxcczh+8ybAMUtL7HdjIOagVpHC
         F4h3fskv5TpCqMltnY9mWUowroTePD5PvM5c03U2jpxS69z1vyhJI4+PwikJi5rRc87o
         +RjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbkOdN+wm3q/yrJEo3m/1cfYyJtOJ866fDLqWewrc3kVj65fO+npLjpWCDyKJ8zatjJpAJ0exJpQPdOTn3wep0@lists.infradead.org
X-Gm-Message-State: AOJu0YwMb0D/QpxipyXK8c+2taq3wjvSaysrtLl9ZNB3wXYTiGiI5Fhu
	ANydM8fT/H0W1S3so+Z9ZIbCtnOR4K+vWNLjnwuVMYsDpF0wvVLlwah3e+pIBCWHJ/QRQnrojAF
	M0yi2
X-Gm-Gg: ASbGncsdO8CJhNCv0rgElhivu/BK+OWcde3pNF1EXBEcW2zfrmjlQxVn4mONaXJKppZ
	ryGyvb/MfMoJzaN7KgFR31sxe/vRuPi7uOq2WVzMWfGkZbgq5i5D41kd7rvx71Ug+besxaItnbT
	hi/kFvVXZt4vkdGi5KGsaKRexvSOSuaez4bylK8fdv0dgo7ciI7Ywg3YynxfyGRn3J4xIKxJhym
	UcOlveeQvM6G9NCwCzBwjXCHk/7eP0z4recGfx5SgZ6D5jgr3qJL049hOiCimTZasRW/q1dejhQ
	PakgJ64warFK279Lo4BCdsSEZZ73ND8mm2QE+U+yFUDVyGabRbdxOnQAtMGkiTlKKnIFC/D0FS+
	h5c0Iy8icSGJX8OPn8tJreHTNWZ8Izhd4+vzKplmLuqFoI9Onz+i8HpjKwuXrUKBYXCvT14G69A
	==
X-Google-Smtp-Source: AGHT+IG5gxwmAYJciLRF6foqojxmxqv0joYPOGI/9pEEe2GUeFbVqcfpF00Ix3Pu0jghtr/eG0KwNg==
X-Received: by 2002:a17:903:1ac6:b0:290:dd1f:3d60 with SMTP id d9443c01a7336-2962ae676e7mr13487805ad.51.1762297616375;
        Tue, 04 Nov 2025 15:06:56 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a696dfcesm678615a91.13.2025.11.04.15.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:06:55 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Ali Khan <abdulalikhan1337@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Jens Schleusener <Jens.Schleusener@fossies.org>
In-Reply-To: <20251007-omap-falg-fix-v1-1-545a1de74a0a@gmail.com>
References: <20251007-omap-falg-fix-v1-1-545a1de74a0a@gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: Fix falg->flag typo in omap_smc2()
Message-Id: <176229761544.2840692.11845969697062709600.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:06:55 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_150657_813004_63227EF2 
X-CRM114-Status: UNSURE (   9.47  )
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


On Tue, 07 Oct 2025 12:53:09 +0000, Ali Khan wrote:
> Fix a spelling error in the omap_smc2() function declaration
> and in a corresponding comment within the assembly source.
> This was reported via bugzilla in 2019.
> 
> 

Applied, thanks!

[1/1] ARM: OMAP2+: Fix falg->flag typo in omap_smc2()
      commit: ae18c465b3ae0879a023b4a89c032064afb78234

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


