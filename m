Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADD8E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDIzcQ6vbeuE8FDNby2S0zBxGVr9TcWaanupyXqFi9k=; b=BjSEKi70yh7mdmLU/sE7YrtKTR
	c9qg7qtfpgnIpdSOUsCpWR9RGkKfiLmCQl/msmPpO7kVR98SshJFw0TGADIvZaBewQtBRLxQ/nq0p
	nFknFY/51tjX6NNRcYmKn3WRRjtyUY+Z46f9oAYrt1JpnsVBI0PgCSrLHQ9oYIxHP0UsmHty+e+0a
	r0YfBxRvS6oxsLDPTA7Sw2TxrJECZHJM4bZ2V21nV9pIoa1WJMfTl/zQIpHtj84TPR2N/DP8RQwnP
	yqf+7lJXNYMBqMa86KDFWIGelDmR+qceKLVhjVNOJNl/ju3M8EvH+GDUnZywIDcboIZdN2b+fqSL/
	QoerIpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqjd-0000000CtmT-21zF;
	Wed, 04 Dec 2024 14:52:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqiZ-0000000Ctb4-2tlo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:51:11 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7252f48acf2so5104133b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 06:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733323866; x=1733928666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDIzcQ6vbeuE8FDNby2S0zBxGVr9TcWaanupyXqFi9k=;
        b=rvi99DbriHd3BJbusnhCLGrV/bNXtLSL4nexI5Efy3vLE2hAEExD1dKN8wnHBqcH3S
         tnha5ZDrlY/Gg4nngAYkf/0+PHM+BJyEmgM1uusG/0xWsAHVWL2YfBP3TOYe/aVeNir9
         WtTudwfSfjk7sL2KSrPwEEA/2N4cPdkM6lI/kfBkGIFXrSRJAgEAoj+bUMkh28gGAjcd
         w8l0AHUpQAYpimsGihYq7EXcAqYYcHWMcoBA6f1YLQ20TGAlp5G1mwj5APSLhg+fvoDb
         P+H4jTNVnK2Mx20ULRkaS4/HMEnIcYyeKYEuhxnR2x3OyMmXeLbsG1Tle9aWgVYIPQdu
         yy1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733323866; x=1733928666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDIzcQ6vbeuE8FDNby2S0zBxGVr9TcWaanupyXqFi9k=;
        b=T98CZce0zkWaPpJcdUQEkVemwoPYG6YeuqdAvuaiBGYdIEoxjqHI77veayaqi97O/c
         6M4tHCfCCci6AopIMIlIiXfjcLoK2qCTYMCeVMLi+gaL3q16ewk65UUiAWaTH6OJ8lo1
         UUVKwPXph9os2u61b7+/i9GzSjL9kW+FvqtxpnszDFt1DKAfgrNSJ6+G085LGqHfNNGq
         WdE+NcY83G33ALQf2GK/hfw+QtdKxqcXQcVmWjit6k1rsZj/nl4Uzt6G0YtZXJkwChuw
         fi+gaOU1ZcUa7/XSxRPu875FaAzMwkGUGokN3uy17hGEDlXeY8xQfgLqISaUpGW67ntd
         5pXg==
X-Forwarded-Encrypted: i=1; AJvYcCU4nCCCFA08lDRHmjE40DgdrHhc/L3G7L8DRpb1V74kYYXOEpTMVl+j/E2Y4TGJjSCAIQMEbUVh1NCgkn6r0VxB@lists.infradead.org
X-Gm-Message-State: AOJu0YzYAv1LZ8tS7qn6Evh+ymTRgENDUH5GQfyOQB8K8a51iytJ7baq
	+apIJ/vmo32nN67zsKQqFjh4J/nLH1pdxZJN5EBM9W8M++WownW74OMgWF9Gi1yShOCiuar4i0f
	GPeC3MBUWDIGk+Wmb6vRKhdaKixpPwyoPWGyI2A==
X-Gm-Gg: ASbGnctCFKc85v46Pa2IRda08DwpzSbin8k/r5p6+KbiiyPhozWJPVv1SXh6W6XsP97
	qt/JYjCb7itTsR/MXvXviRIGo3AH2UL/bKw==
X-Google-Smtp-Source: AGHT+IHhPo8ZM+oBcAXAmoAGuYzzQRkMbjIfXqq/wrIpoANjBt0loJwIy6Q+f2LjyQLs6AQneluG2KMYSXOqhbfNX3g=
X-Received: by 2002:a17:90b:17c9:b0:2ee:6e22:bfd0 with SMTP id
 98e67ed59e1d1-2ef1ce997f8mr5608820a91.21.1733323866059; Wed, 04 Dec 2024
 06:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20241204102904.1863796-1-arnd@kernel.org> <20241204102904.1863796-3-arnd@kernel.org>
 <CACRpkdY243J4C3A9_13eTN84T2SeOjyoh0bWk6U1mqffUd6urw@mail.gmail.com>
In-Reply-To: <CACRpkdY243J4C3A9_13eTN84T2SeOjyoh0bWk6U1mqffUd6urw@mail.gmail.com>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Wed, 4 Dec 2024 09:50:57 -0500
Message-ID: <CANp-EDb27XE0SMpDFUKm-L3j=rZhugbK20cQZGtAmP5D0r2C6w@mail.gmail.com>
Subject: Re: [PATCH 02/15] ARM: limit OABI support to StrongARM CPUs
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>, 
	Daniel Mack <daniel@zonque.org>, Gregory Clement <gregory.clement@bootlin.com>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, "Jeremy J. Peper" <jeremy@jeremypeper.com>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_065107_725766_06A72916 
X-CRM114-Status: GOOD (  13.21  )
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

On Wed, Dec 4, 2024 at 8:59=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:

> Hm why do we need a separate netwinder_defconfig if this defconfig alread=
y
> supports it?

AFAIK footbridge_defconfig is for the "Compaq Personal Server", which
is different than NetWinder. They could probably be reconciled by
using devicetree and converting any platform devices. However testing
could be a challenge, not sure who has working hardware anymore.

> I am occasionally booting the NetWinder and then I use this defconfig,
> the netwinder_defconfig wasn't even working for me.

Interesting. I successfully used netwinder_defconfig a few years ago.

I have several times thought about updating the netwinder, starting
with a more modern bootloader (I got u-boot working at one point), so
we no longer need ATAGS. However toolchain support is problematic
("bx" hack anyone?) and there are so many cheaper faster boards (RPi
for example) which require much less effort.

Regards
-Ralph

