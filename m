Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B776FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXKeSE96P/DSTkSX0hfZLI8OogkntC/gTUwapWrQ2Q8=; b=ZsDNKyegF70Pcs5Lsn/SsYazbe
	qutvBm0XqeCjhUcFWk0U+vv7+LeBQnQVL653XOGv2Smo49+bM8NMW9ja8IrERIpJdSTTy5NEc5olX
	9uujKGfN+d0+DBXW4fq0p+xDWCJFwmCeNpYZyp/iU1HzDCXbumF8aGC+mFx8LrI+R57NGmuz0GGrb
	GRJ3u6E5Ct9YYdTAAsvjVNv4Qm/2sSooGCjeMs/qgkVHQyuZ0CjcOcpu4I6U7eaKTMWWe/SiG+Uti
	9VXlKKzMBe/k5W8Eb0oXQgUg8AVsVwQQyt8VwYFVa/lFqxv+ij+Q3EzCXpcPA6jK4JNpLz6TfctYv
	CCagnq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSpA-0000000HELB-1hi8;
	Wed, 08 Jul 2026 14:00:28 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSp2-0000000HEIk-3FOQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:00:23 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so646971a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783519219; x=1784124019; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MXKeSE96P/DSTkSX0hfZLI8OogkntC/gTUwapWrQ2Q8=;
        b=rlznMN5Yam1T6LM2qeXrdCbM8TWAk6L20SwptVsi+MAeh3hv8XYD9RqEYqPY8cUPA8
         YvZghSfQN+4R5V35nHKTY6oMT2S7wkjys8QWu7cmyGUWIckwCmtvGo/7CEcJNujIIY7a
         +sd6u8FSuitr6u/UYEMrMvAUS83Ac+lwszZUAs5vVo/Wza6N11b7I5iapAGu+Tgg18Ri
         Ak5WViauGUb7skBR58xqADur9EmYEZ+agRqQY+KC8byZuHsouXChdURtjNa4gCa9DH71
         ptkK3+NKkLpw/ygd74L0PfT3A8qkD+R0R3YnR8HL1I6r3ytIvtPgaZCD6TqHS3AGefcN
         1akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519219; x=1784124019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXKeSE96P/DSTkSX0hfZLI8OogkntC/gTUwapWrQ2Q8=;
        b=MsBJ9Nvejf/LqrAytcrE8NLZBFtGwAqeCllMkivc+l6owvoXRKG0U8ha9c5xH7A/6A
         fCPbeyvTVkWIOOEcPTx3Gd9D4vZzRibsdfJI6y+QmUmfma5TgzOG/WL8NnaApJBzv18F
         UcwOB1AgPdAxY7ObHVgSJ9EEM5cu8jpsaGIWhcdlJqRzS6oLdNj3N/GWaem0rFvxQtcj
         dTjllfrEAAqrtZW4gGnMz7OdyFBrYAEueE67cbSvFL32/1YBtFC7UNlLusi8NFyOzzks
         KIpO8Ayt1MSgVA6M8xL3U0zuaSvbBMP7ysE4kd3dvUfwecZEeqfU3WFahZCwMkrsffCd
         1MDg==
X-Forwarded-Encrypted: i=1; AHgh+RoTnjOl3d9TSsZsxrZN7rMQSfev0/hZOBLY+2LomT0CnfJe9jliVSa2I3Kpp6/jpmbHAo++NViofeySeL4oh4ua@lists.infradead.org
X-Gm-Message-State: AOJu0YxPKFsuD4yd49lTgOcJNIaX+PGQN/b4kQ5cVPE2aJLMM67svKSi
	VjPzQyvY7ojjRwW7jAQRG2bq5vCYe7UT9RzohJEQOfc0nmiPiawLLJb9
X-Gm-Gg: AfdE7cmae+zpv6oOUZ4jnkgdgT4Sw7a+ksYtP91fsnVpbCoh6+XfSpdXCeRSS0a9s0V
	ObA2CL7Y077Kh89nCTUfNAoxPFaBdHkvSj9ponCCOQ8gcaqz8RKMuGP1+Mp5YTzXYHnZDFqsNf0
	1/SM9VNimMBg6CWEd5qeFUWZtLmskbIAF95v1eyNe9kwiwxqzS0bTMSSNaJ8N91wrR+ZK063FtF
	p45N59aXTlrHsNSa1ADvjdhDv/k8c/p+v1Wpz6Syd+OKBMKYWiGkj+dPiE03Scn5RZCCBkzYNSj
	JFtUtq1zQnsEF25sZ9PCPO2mO12NVA3a44JE64caiU/lfb+vYrUEh/7o9w3+Xhk06/C6zYy8yU3
	0GVjIpKSEad+V4qFuFBVw9FUD8fxW6MuNfPDf7mpHboiNVT4sI58ev5lfAvlyTjcIslHNAKejPW
	SqDnsFls1WSBIdmpEtYGtWmtUHoA==
X-Received: by 2002:a17:90b:3512:b0:37f:ec5e:12d9 with SMTP id 98e67ed59e1d1-3894034404bmr2572315a91.16.1783519218978;
        Wed, 08 Jul 2026 07:00:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-388fdc9a066sm569937a91.1.2026.07.08.07.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:00:18 -0700 (PDT)
Date: Wed, 8 Jul 2026 07:00:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 03/10] dt-bindings: watchdog: apple,wdt: Add t8132
 compatible
Message-ID: <a03c19ee-cf74-4f26-826d-f2bfb816fb3f@roeck-us.net>
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
 <20260705-apple-m4-initial-devicetrees-v1-3-e5655ee56523@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-3-e5655ee56523@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_070020_809428_C2E9ED94 
X-CRM114-Status: GOOD (  12.00  )
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

On Sun, Jul 05, 2026 at 03:17:22PM +0200, Yureka Lilian wrote:
> The watchdog on the Apple silicon t8132 (M4) SoC is compatible with the
> existing driver. Add "apple,t8132-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.
> 
> The M4 wdt block additionally has a secondary watchdog, which is
> disabled by m1n1 and can safely be ignored by Linux.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

