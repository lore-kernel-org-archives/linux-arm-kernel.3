Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6FAC5B567
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVxB+HpF5gJwn2MewfiHQ8qVkVDyA4ChZQAvP9r8du0=; b=rOFVRdo1FxNEWp8Oyd5sjO00SC
	xx6l9cAI5he1u7h9yGbfpBDd+wMSmpwnyUUzFqWE12rwuOwKJxsGuMtmzGlQNxq0ZjYlHoj/S6yEq
	en+l79UzkBWPuQZEgZMrjrOzmUfm+VB2QlrjZhnXtkS15fQJbIuFEd+Apln89Z30lrYHCIbZ4mrdo
	bVzU4WnOzVp/absTnkEN+47fbgCm6c+enktdb4Bo+ScmiDNAY21omngt7FWhXbSucnn7ZFyvuobLT
	4EVqTx3oETM1WEM3DU7qbLrJSMwwkIKwXnOyh0KfJFC6PdPPaqUEYaxyhyFY2NyKnFPlC7rd2hwr6
	wcp4YUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWIm-0000000Co3I-12Mm;
	Mon, 10 Aug 2026 20:08:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWIj-0000000Co2k-0KbX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:08:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 865F6600AE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 20:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA8D1F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 20:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786392528;
	bh=PVxB+HpF5gJwn2MewfiHQ8qVkVDyA4ChZQAvP9r8du0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iPdlCCN1WHTnrcp4qPCqZCeN22izSXVTan9/YjPJthQrocMAP9W+RrvsB2pUbj7G+
	 oumeICBSdrpNvAS909YhYiPabCdMcYvyWCXXsW6zPPJ5Ewq+h1cthK//m9a4CFjwof
	 KjnvVTm+MidK7yw+mJOlN89Hu0bMJR/SrMdhNry1B12zgkZgDkhrXHVCOYVhWLcLaO
	 4yd2h2RlyVAmRlHahaOlf2xMoYS3C1r8jHu1ByyOrg5exuLpbfL2AAjpPxfV4NF91I
	 +4k/j8+aug8l14E5/obNdCxyhoLVGAJllAxbJsCIUXpjm9nrUrupRbOAc/Un0HA3d6
	 7XxJiIGK8f++w==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b015b2d792so2221572e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 13:08:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrt2/wdrWwOk3in1Gqx4IErjz3SVqnaNpo2Z102ERLg3QEr+v7nY0lpdpTTuZkTk9zw8k4CctynA476V8DdSfvs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+GrcJDbeQTBu0VkIclSZWOdoBkvcWAGaREtA6lYVn7arskUFs
	X7otsQkj4GJOGfScK4tW3QGcgzHxixU5jsVHnElbSFRb03QfGmi255Av4MtQ/4iZ1M6RBFz91t9
	xkhZVMj6Pv66cN4tXT2IA/78kOn6b3w8=
X-Received: by 2002:a05:6512:668d:20b0:5b0:23b4:be97 with SMTP id
 2adb3069b0e04-5b2f4b801a6mr3693256e87.6.1786392527084; Mon, 10 Aug 2026
 13:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260729132736.3807082-1-sjg@chromium.org> <20260729072727.v3.4.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
In-Reply-To: <20260729072727.v3.4.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 22:08:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmXtsWNdJ3ecPcpnSHK9E00fQSUmv5r1ooCC9n_zp91pA@mail.gmail.com>
X-Gm-Features: AUfX_mxsREooqobH0O-veo6ClRCAIrzdMTMqoFk0qwAXfbPSfoYfYy7nEvygW94
Message-ID: <CAD++jLmXtsWNdJ3ecPcpnSHK9E00fQSUmv5r1ooCC9n_zp91pA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] pinctrl: rockchip: Add RV1106 pinctrl support
To: Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-rockchip@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, 
	huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
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

On Wed, Jul 29, 2026 at 3:30=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:

> Add pinctrl support for the Rockchip RV1106, based on the vendor
> kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
> 5.10.160 kernel tree). Each GPIO bank has its own IO control (IOC)
> register block, referenced by the rockchip,grf phandle of the bank
> node; the register offsets are relative to the bank's own block. The
> drive strength uses the RK3568-style exponential encoding and only
> pins 0-6 of GPIO0 have drive-strength registers.
>
> The RV1103 is a package variant of the RV1106 with fewer pins and uses
> the same pin controller.
>
> [1] https://github.com/LuckfoxTECH/luckfox-pico
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Patch applied!

Yours,
Linus Walleij

