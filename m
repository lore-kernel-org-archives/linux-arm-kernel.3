Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B710BFB44BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 06:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1xKDipGgf54U9o9dE8hUvLsSiaTlrXktu+nKGuvzuE=; b=1N5uZL4rGDchJ+co/Nj0DJBe69
	wiOPEp2xdJoJZ28gxqS/oeU6SKve1lKx5lqMKnWr0e9IgVDwkDzvhQv9jZ8DFUbIehXaTLcF6rkX8
	9tvXeGnaI9GD09Mad/sA0zUX0LCFmYE9bPvG8BpCIW4pScPzl6X9tS4WUW0qREUBer0pVfJapEWPY
	XNrtabC0WaLHEQzeLfHGKtHij6s09RV/5hnvhslOFANJhlHO33NiHzppg0vI3GelCMs9bH4NHKzpk
	DxMgtuwjybcKrMeWslBlgGjl1smRpIwK376XqibUlXFYcsk2NQx7g2ii//qZNshsXdpLWJAssc4T9
	6YmfSwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAUO-0000000Ckxn-3DIl;
	Fri, 24 Apr 2026 06:58:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAUM-0000000Ckx6-1pKR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 06:58:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0438A43995
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E09C2BCB5
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 06:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777013889;
	bh=O11JtHJCuUQAT52gCcRyJqH4zG9oPQf0zzzYM4UNinA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GxyJNBZdusOPbqwOVMA4YrUWqN31KyyYo4jfjWpXsEDdwGEXA593ipe04PLJWTpiY
	 bVdcDuUHZCgsq321jBV6QY9glQ3TQ42PyM6wdDM2XojskN83MesJUSbkU1FYhAdH5J
	 inSKG8//QrVVNJHP93/wuUoa9xtg299CH/rbzQ6OPCkzWRpi9LBuQoFfzqv6SyDpUO
	 BfxWUiG44U2pld2NeeJNim/rV1lELcoJLSSB24xdufWa9RHRF7f4TeQXV/3XnBqhuC
	 cY2YzOpihPpAwsvmsOgz/FAtK0IpKCk5bQxW7YmD1ErUJIhm7h+6vixMh4IM2iAhY/
	 XHamUexj6LgHg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38dd9f0fdc6so88232191fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 23:58:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/jGeVN22c8Ci03z21aw/MYfQqzraBlbtWBgCFE+cFE3NFTMAicL5UKGDQXaDvgD//l91mah2EkVf62t5sc7BVG@lists.infradead.org
X-Gm-Message-State: AOJu0YwQhEsVSdcDl8RR62mryEW3ym9he4ngkQFBQXfKmnlHbd3tIMR4
	aQ4nkI5X5YbLTXxpPl5eD1hmm5KaiIMYMe/hWFPlELW5K9dwy6pKdQueeRNDXFOSG6UZqEXJD6q
	m6e4dxU2beWNW1dSZT7w9A9gHRfw1VLs=
X-Received: by 2002:a05:6512:224c:b0:5a4:558:33ae with SMTP id
 2adb3069b0e04-5a417299938mr7908003e87.10.1777013888402; Thu, 23 Apr 2026
 23:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260412-b4-defconfig-multi-v7-v1-0-e76de035c2df@oss.qualcomm.com>
 <20260412-b4-defconfig-multi-v7-v1-1-e76de035c2df@oss.qualcomm.com>
In-Reply-To: <20260412-b4-defconfig-multi-v7-v1-1-e76de035c2df@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 08:57:55 +0200
X-Gmail-Original-Message-ID: <CAD++jLm0zZiDW2L5AODjEjEX3qcfqGp0NwbYZiPgUPRX1CRh0Q@mail.gmail.com>
X-Gm-Features: AQROBzCF4lvN9FYPmvasg68YE61CB4Kb6l3zRlu4SgJbvuenKhbHowY75TWFu9U
Message-ID: <CAD++jLm0zZiDW2L5AODjEjEX3qcfqGp0NwbYZiPgUPRX1CRh0Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: multi_v7_defconfig: Move entries to match savedefconfig
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_235810_489663_E6698D9F 
X-CRM114-Status: GOOD (  10.14  )
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

On Sun, Apr 12, 2026 at 7:12=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Only re-shuffle entries to match savedefconfig, without removing any
> symbols.  This helps in reviewing defconfig when comparing with
> savedefconfig and looking for obsolete symbols.  No impact on
> include/generated/autoconf.h.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

