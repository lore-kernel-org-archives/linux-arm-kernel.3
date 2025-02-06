Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28899C02192
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 00:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7u4XADLr/C5eZ7qkGhMI8Yv7tVqEObjjFDJ5fXQvZww=; b=rK751KgcU1cnq5whpfQ6pDQhvb
	bG+iOK4Kxy1nUgaN4LVAH+4uhlL566lY8DiyFeVmgxX3db/1FOeqK++s/4bhuDVklJpbzDeGOvMKA
	lR6o53ymfTaLqGyTZCx2XX7zTnyXCTFNXRdtTqCir6CFJuER4bwDUeErzDMeOfG1/P/LDse2QVgmT
	8Jh78aVITg698v4tFkF0daK+cdIVZvd0XPgUxzno1OuYqLkQeIlJ95+E5lCHk8joEQKhRnCL4NeQA
	0uscxHsIyWsfHpHKkuLVUZ48VvQF5l4y+JdHCF5zdJrvqiyFqiQ/dY0tYGta9aBLQwIQHMk9H7z8M
	n8V3ckhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfpuk-00000004vqA-0oNv;
	Thu, 06 Feb 2025 00:38:42 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfptM-00000004ve9-01EY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 00:37:18 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2f9ba87f5d4so396020a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 16:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738802235; x=1739407035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u4XADLr/C5eZ7qkGhMI8Yv7tVqEObjjFDJ5fXQvZww=;
        b=GcckMJz+Nc/f3OXFxW3Lu+emJ0Qh1iUy+kYTcl0GNLVyYw2u53R/1dntGTdWm5SO95
         g5FhnRLATJ+vmu8ZAUp/Vr/vMrWCdZAXaVD7LNH3RfX40bCC1NibPgNHUD2yd39CxAaR
         LWeEKaveeYjyByQGlicq9Ve3egbexlbATP5ge6Ztn4ulKYRgkiUJj6RII08lEtU20Yt4
         nTtA/jCIHXyEnZF6c/gsNqNmns+P/r3D9o8Fg08+/87RYGixMKeE3KA8rvL6uNUZNWWX
         ZrvCoVCpljCTjmUwr064zTbzAgaygHmvy4YOXnOI3r0hcmt30j8tfp2FBFXVrx67qxQP
         lR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738802235; x=1739407035;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u4XADLr/C5eZ7qkGhMI8Yv7tVqEObjjFDJ5fXQvZww=;
        b=WqDkm0mGGCLsEMSgiGo91mcgbzbTSgYhkikHnU6Py5f3Yw6eYd+2hKLQFismRcUc7C
         bb7OOg3F5auJVm2D/7Ee70ModsSu6ipXfph3Fh9hAcpvQKMQaj2aIvCC578jX0VDxCoK
         TSQx8pLLPrYYnMyyKCVHMgtpazPJatx0WIqd4WDRZm9VQrEx1QYPW2nZLhvZZUXhGHJT
         a4zfHp6rpiGhtZr+Q+66Urhb5rcFHRocKaV1lg1JDQbml9WuqwQ5pV1+zDQ0Vgej/yG8
         YEWhl1Ic6Y2z2e5fEND3SajA3k65+t82VpVwIVXUXM6g8TEUB+Wc81hnQ06QQJiqAFxX
         cy5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXY8vdRA45C+dtHQn80dGXQkENKXizMdB5jAzZYX9iHHKtKnWWmQjHIYL9sbGq7BvGLvI5moFFsj1SfRr8mGjbn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+h/ekPLcQyNsTIxFofRUfIo8ZXzhu7tPt8qNH05YmiihFn1Jv
	3xKFx2xBiTo5rp8NqLkj+f/rwuIfd3kj3hcUUy/coqxqt/D2cETBQ99UpZzxq3A=
X-Gm-Gg: ASbGncseJjHMp9jcxzIcWDbv+zmEO4wJE4Wjk9JFZLbX13mTu/Nb+qtBbo/T9QiXx9L
	eDlXGAMCMxXpJrIVoT/8lYi+nIL/nEpBTKz6Oiyy9ZXkkREpYcmKZLkqU237pUDZP8IeJw8ogOf
	WSCXfhG7UigqG6v8wVzUmfSKEU5EjLCS+3wjL4bi7ymyCTu6Hq9T4o0cLBOjWpz7r8HY7yREQWp
	nUPtwsZ7knWdvMxhrd01x1brI4NFm4offxe0j+c6D7eLhd1qR8KZUA3CVLuI8I42WUlNuM1KGyF
	wGkX9E85nRWgrA==
X-Google-Smtp-Source: AGHT+IECtRNllbLpK+x9JkKsoGM9WVGfThDVXSbLPfFhNXjo7Zhdyn7+h2ahM/Hfy/0Z08HwPXvJQg==
X-Received: by 2002:a05:6a00:1942:b0:728:9d19:d2ea with SMTP id d2e1a72fcca58-7303513cbe8mr7280503b3a.13.1738802234722;
        Wed, 05 Feb 2025 16:37:14 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c15bb9sm61111b3a.122.2025.02.05.16.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 16:37:14 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Tony Lindgren <tony@atomide.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250205121151.289535-1-arnd@kernel.org>
References: <20250205121151.289535-1-arnd@kernel.org>
Subject: Re: [PATCH] ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
Message-Id: <173880223388.2488567.3141490107424057794.b4-ty@baylibre.com>
Date: Wed, 05 Feb 2025 16:37:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_163716_306615_E492FD59 
X-CRM114-Status: UNSURE (   7.43  )
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


On Wed, 05 Feb 2025 13:11:33 +0100, Arnd Bergmann wrote:
> When GENERIC_IRQ_CHIP is disabled, OMAP1 kernels fail to link:
> 
> arm-linux-gnueabi-ld: arch/arm/mach-omap1/irq.o: in function `omap1_init_irq':
> irq.c:(.init.text+0x1e8): undefined reference to `irq_alloc_generic_chip'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x228): undefined reference to `irq_setup_generic_chip'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2a8): undefined reference to `irq_gc_set_wake'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b0): undefined reference to `irq_gc_mask_set_bit'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b4): undefined reference to `irq_gc_mask_clr_bit'
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
      commit: c2a5f8c4f28ffea8c93d10e509c5a6e61172cdca

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


