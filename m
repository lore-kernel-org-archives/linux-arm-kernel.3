Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF26CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 20:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jye6GvFlEjzThLUvmLkambJ/dmm3iU6zf37i3X16hC4=; b=Ps1GtUZ8SGQeTaBo4Ri83Lf/xe
	pXfcp4W6RhTPn4+NTIE9ZC0e8f5ci5nG2NNQ0nRwzzXkqcgVh+qmiToWkVVBrcJFRDB4kMBdcI1Gn
	mtj0E0apwgMta+3FclKRS0/cT9NrN+8Kfi6AyRWhzajqahBelr2vBvSiSAECJyIdyKR0Zx7SkRCLq
	DSvw/hxv+IPDMvCLNABLX14BG2Ra6dT+5fxy/XCG4B5DOh2S6nAo9T0cIRnxnD83FSusBZxpnBSYW
	twHYoDeJFjRaUnKWwR8KOOyml9niy4dKHvpTIGbN2KI5KXCdea0MotUDp9/6wDu05JOWR2g5XGr2A
	18XzC8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWzz-0000000EgGO-1xlm;
	Mon, 11 May 2026 20:13:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWzx-0000000EgG1-1qok
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 20:13:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E178660103
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935AEC2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778530384;
	bh=Jye6GvFlEjzThLUvmLkambJ/dmm3iU6zf37i3X16hC4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f5F/JnQHSKYkh1ZDoeWc0yFbkA3ZlVxuZe1RZYlXXFqzidoA5HlbOcLTxiK3W7N6C
	 SBpq8Ql8L5DzkKbCGSTqXYwN8cjP5vHAiAXIJaLDObBnWKjXhUHL1Yeub6z2c9Tgis
	 gYLFbF/JWJP2ymiBrR+9eq5aiYO0n83rc5H7/pzeDmvC9vCSypoMZJW7J7/5aKguCx
	 pARHjI2mFhaxJbYy/hUzCjyYMB2ulCHjCDd131nTytK4p/ov3GJ3tQClaeGEgqMhhE
	 Xv1CYUsTHPdRPMzGpwuFW5d7ToUpMGLGnwpv+ch6F4r0t52PMdMs95TAZS0ys4WAq4
	 uIHvAQ1yaUUyw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso4672452e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:13:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+wYvnqJveWVYbdRSO/QrEVjYxacc75dQ6w5VZf4ZwKXjVF0rJw/0nnQEudT/kkT60KEMiqXoRgxgsufIJyh4pC@lists.infradead.org
X-Gm-Message-State: AOJu0YzD7QnnlY5p5DgoNztMHMnlAtITbXS64aRCYhVcL7CywZJO5rvn
	heOH7lGoHJSkITnIr0JNz+4M5cHeFd+GVaQs+fi8yvyGFjsPgyO9lXXI2AePKG0ypnh1MJFjEhG
	aDrygxh1SFYl4wIAEg8x7VsSOltqMNDw=
X-Received: by 2002:a05:6512:3a88:b0:5a8:9aae:3c99 with SMTP id
 2adb3069b0e04-5a8b6e8f606mr4490300e87.16.1778530383250; Mon, 11 May 2026
 13:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260420213529.1645560-1-l.scorcia@gmail.com> <20260420213529.1645560-5-l.scorcia@gmail.com>
In-Reply-To: <20260420213529.1645560-5-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:12:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLnypYKUmKjnPX811m5Gc0guUwYeN=cQuxpAT3_gS9JWWg@mail.gmail.com>
X-Gm-Features: AVHnY4LX3rah_STGf3_slNDMEwQfgJHe21tHW014S60VT0tshZIqHNAjHJXvWcE
Message-ID: <CAD++jLnypYKUmKjnPX811m5Gc0guUwYeN=cQuxpAT3_gS9JWWg@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] dt-bindings: pinctrl: mediatek,mt65xx: Add MT6392 pinctrl
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Val Packett <val@packett.cool>, Julien Massot <julien.massot@collabora.com>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
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

On Mon, Apr 20, 2026 at 11:37=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> Add a compatible for the pinctrl device of the MT6392 PMIC, a variant of
> the already supported MT6397.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

This patch 4/9 applied to the pinctrl tree.

Yours,
Linus Walleij

