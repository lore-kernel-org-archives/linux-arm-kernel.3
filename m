Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A61C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 11:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ai/qrUJ/3ExIMBUOgdZi+V1kaGZn6ftPFCLh/kFwUjo=; b=of0wIDbL47VWiDEVZzjmmbx2jX
	iLlXGFzJ7cH2heMZYSnnaBTwLMTZgTIifoQRHFE7/R2CP0iMkrGSwT7+eiuJ+f45Iyxh4N3rRO+zC
	4x5fTC+O1gq6aW6ahXYdLRnFiELZAlPSakxymBaAxL159VlEs2cMp3O26Nqs22QnMpAPOpJ+gB16W
	EuZFokC2VzzjVpYU5KvO3zXjvDDCb4YxwLUHBpUXffyPEknESCnf2dTXy39ardotjIqX+v37i1Xnp
	Yr+alJoEBwYLwdA166QYBvAbHPh6TcroRwd1VbGCHKCubQdN0bzqyO9JueTD/kkKdmTCrVMxNXTLU
	oM1Z8VJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfyCH-00000008Mxt-0dAL;
	Sat, 04 Jul 2026 11:06:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfyCE-00000008MxV-0EsC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 11:06:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so12079985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 04:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783163163; x=1783767963; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ai/qrUJ/3ExIMBUOgdZi+V1kaGZn6ftPFCLh/kFwUjo=;
        b=TWsvE9t4uKeo9rF+lJB7vd5xlKgKIbkrvF7GbD/XK1Gvs4+OF+0/qo5kIiTsD+y2pk
         Ii/JBcEImaCvTzn57dgDAXd6y5QM1hUjl3ZKlGIA5qbixcfVCCJ0PAo/KmrmaAn/qSR9
         fw7FI1fpbv1z48AFNg3SrqkjoD1yiJRnU87IzLelg2E07tBZTvEFu4GFRoPKotiOotXI
         lSDa/h3Fd60PdIBJvhOf62D72r0Vv/Hukes0KlPcWGjOcjRCkDhJ5KPOETdZiz0oUA4F
         xQRn4oXxJUMII0fdpzPGb3UHVFvQerEHW4Bezb/PDuMkoZGmq9wOhowvND486VtvYddQ
         0LRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783163163; x=1783767963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ai/qrUJ/3ExIMBUOgdZi+V1kaGZn6ftPFCLh/kFwUjo=;
        b=kEwEPf8yKpEzZ2RNIi686yzPfTrQjnI8DDLpwul1qRh++wK4yH0rY/u3zL25JwvUeE
         JA6CvWQCMMuOSZMKZ5Zcv9zc/pbqY3Xq7qgK5PywjhHsUTe+ObTohiyhLLRTipH9Lz/K
         xnOkWGUSWFdlHf6zzZURfYiPUK8t4h4F8Xm3fdrxnQzfAVWkBPZhVChAKeT0FXUg4npB
         W8FdaVHaqAqfwSrDvsAjdfuPteeWeSW8uKZQ3uwnZ2Tk7a1Z3oMayBHEzipoE/nhsTpa
         ONOg1fOUBILQEq2RX1pft19BFgEnCgPJvuMeuqEfunqGaMe7V6YddjZ2/5TpwCy8ooI/
         IFsg==
X-Gm-Message-State: AOJu0YzG8XlkdvuLpT+2sZvlitDcJll0E9FWEWTVm37piftN5A8g358n
	YE2ybb+MxnMbWRT0/ExqzmSgg9pa+EbIzBdNfDekL3hiwzxNH6QsN/+s
X-Gm-Gg: AfdE7cmEmwRP/tDgQQcVC/s7ImVjeQ9CqE6Ow/y2NQZFibmZ3r64erVgnbz82sO597d
	jdWVnF/bJGBVWer82xl0WY5ItbrKee260x7V9ktFR11a6VVw2Myqgfgl0sIonbV0aTUgfQ6nNSP
	P2fIvIuYaoI0eInywkH1qWMVUWiUQ9YQR/t53G8/IAdHLI4ISH3KZahk6B7KRO+hGhktZ1HE04K
	4uTYZaIZnE6u/5JNW5fF7CjlSRjKp3/sX8bUlcT/vM4Tk7oEGt0B6pueHEUsgKCpAdnnMd5hDcz
	NdWsnlh/Lzo+ofSxRlGfbedd6ZSygtN/T+CxRZlVBmHgGFq09yjsMv5TQGMakFxH1J7geoHqiOv
	SNEoikRJ9l0PrBUSaHoiDjcbHoGmDqemJL5RB6bohdYNPVKIqzGZR9Coo8a6bytiTgBO45LEsms
	E6WEHhbZyBTLbDKJDDUaGZYKPjm7XljVG/r/hcYMJPlbl/dTKmiNJYj+i9WmlRX1MC3An7gBGnJ
	wGmYTEYSEc1ghkIQPc=
X-Received: by 2002:a05:600c:a213:b0:493:b962:4abe with SMTP id 5b1f17b1804b1-493d11fb898mr20361315e9.36.1783163162957;
        Sat, 04 Jul 2026 04:06:02 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm7121987f8f.32.2026.07.04.04.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jul 2026 04:06:01 -0700 (PDT)
Message-ID: <dcaf2e98-ba91-468a-a9a1-fd0e3247bedd@gmail.com>
Date: Sat, 4 Jul 2026 12:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/19] ARM: mark CPU_ENDIAN_BE8 as deprecated
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Mack <daniel@zonque.org>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Stefan Wiehler <stefan.wiehler@nokia.com>,
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Will Deacon <will@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-7-arnd@kernel.org>
 <CAD++jLmX9Kt0TJ7ZV5z6C71STSFasj+tteAuRZf1kskLPyg+8w@mail.gmail.com>
 <60541bca-b0ec-4ffc-a2f8-31f196f43dc2@app.fastmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <60541bca-b0ec-4ffc-a2f8-31f196f43dc2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_040606_118703_747C136C 
X-CRM114-Status: GOOD (  12.88  )
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

Hi Arnd,

On 7/4/26 11:33, Arnd Bergmann wrote:
>  config CPU_ENDIAN_BE8
> -	bool
> -	depends on CPU_BIG_ENDIAN
> -	default CPU_V6 || CPU_V6K || CPU_V7 || CPU_V7M
> +	bool "Build big-endian kernel (DEPRECATED)"
> +	depends on BROKEN
> +	depends on ARCH_MULTI_V6 || ARCH_MULTI_V7
> +	select CPU_BIG_ENDIAN
>  	help
>  	  Support for the BE-8 (big-endian) mode on ARMv6 and ARMv7 processors.
>  
> +	  This is deprecated and will likely be removed in the future.

Maybe it makes sense to add a 'transitional' to this option?

- Julian Braha

