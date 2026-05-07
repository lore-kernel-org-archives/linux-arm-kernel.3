Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2878ECD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 12:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIql3ABFxBxfhPdKS/rwS+nEJrZPiQL67AN4+VOVMso=; b=BByRXfUlchHmf1H54XxmfP9K/M
	ESF5rhN52G27qBbzhvAzrIqLOEdeN/gKmkiG8J88zpKrrn1DQ9GaFEqFeYZm0LjFdOunY9rBwOoVE
	Z4zU8RpdSXzeCawEK4olWPBR/pBw4N3OtSHQgpYD5Zna0HTiQtTw2lWS96qFCs9W0hKRON5LZNmJb
	S/pyiK55V83Dw3V7QBrJBtGmkwMV3mVnLUUktIgrHWlgcwicxIzgjD2+/y0Vnjw38cj5BJ6oxy6Y3
	CMuv+ZwGvhn5Hlw3H2S/k+wt1aLc105D4GzKUSFrOwdnbLlvWyPaTmPbnF103nX6yvSUblVyurmBQ
	kxDMcNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxmg-00000003lqw-10ec;
	Thu, 07 May 2026 12:24:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxme-00000003lqo-2CcQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 12:24:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A7AD61119
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 12:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F777C2BCFA
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 May 2026 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778156691;
	bh=QIql3ABFxBxfhPdKS/rwS+nEJrZPiQL67AN4+VOVMso=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RKv5nDNm8HFBZ/inumudOz8bq/9D0RjWYEYvjZAonv+XeRXE/imJ8Qqy8AMlTq2/3
	 hiTSyhuBXJEe1/W4ad2WCVpo4YydHtCpkviJfrU6xwIFA0JwyxqjujRuYf9M3mFfgZ
	 7lIZdnr+Z9aOWGtutXOFLo+ub4pk0mUe+JTqNPeyDm3eQ0h0l3/SSNBuMpfIGRw2AZ
	 6y6nh+Yf/G0uWxYfAZHMB0VBhBoP2DzpehNT3YjR87Ei7luHPc5avzFuwBUeFTcsPc
	 /kJgYH0QDk4OdOX+6ZDX7xLOdrnY8yxTOwqZz+ezUcEyuj0XEXfELugJSPs4IQyjWK
	 5chGoE6TbBt+g==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so709880e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 05:24:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/8/ryz2doRljV+PRsIBqik0FkT/BqcW0lecjeKYhGRdoglXVxJ9zS7j19ijC0yskVl1og2a1LpWXAuLRgu10Bo@lists.infradead.org
X-Gm-Message-State: AOJu0YwbdRw0azGrDTf+OoseGp2DZt697bXAgTDWxUJWBKl8ovDGl5A5
	lShHN1igbIdFO2elyEqJS0koTTDukHTvDNSVugKbIlBL8p8ZqrAyq4GBI8AESy6V3Ke5CXX9FSF
	ZTb7UAi4HdgmwVRJ1PveFhhW+Ro+u1RE=
X-Received: by 2002:a05:6512:3c81:b0:5a7:4783:a13a with SMTP id
 2adb3069b0e04-5a887adfe0cmr2797785e87.6.1778156689988; Thu, 07 May 2026
 05:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260429-send-v7-0-b432e00d2db8@gmail.com> <20260429-send-v7-6-b432e00d2db8@gmail.com>
 <CAD++jL=S6DSOuC-PXFn76SA7e-Lgueu9Z2wuF7icXCVX7MBpJw@mail.gmail.com> <5379905.31r3eYUQgx@strix>
In-Reply-To: <5379905.31r3eYUQgx@strix>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 7 May 2026 14:24:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLk02QnkXYwJ0b6x=qw9stR4nPrjD3sYPOvWAQz8t9OsUA@mail.gmail.com>
X-Gm-Features: AVHnY4KG1i7F86ysxgeSAop-bGeT8IWW7pLynGDyGg64qsvOgzwotjy6zksXjl4
Message-ID: <CAD++jLk02QnkXYwJ0b6x=qw9stR4nPrjD3sYPOvWAQz8t9OsUA@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] ARM: zte: defconfig: Add a zx29 defconfig file
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Stefan,

On Wed, May 6, 2026 at 7:39=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> I'll send a v8 with some of Sashiko's (very impressive)
> findings but keep the defconfig.

Maybe not send all patches to soc@kernel.org right now because they
end up in the patch tracker.

For a new platform that may be OK though...

Nominall it should be three pull requests:
1. Platform
2. DTS files
3. Defconfig

But in this case maybe it is better if we cherry-pick them to the
SoC tree.

Yours,
Linus Walleij

