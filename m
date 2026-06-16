Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FBBCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1IUW0YuXoQNF3mkk4e2D/l4Tl4n61zrxX8gulenhgs=; b=kT67M+pdK5hxOruyUPR52YSlje
	wypVTvhsE5C50NZyxtyusQqKMiY2f4tt8I5TNDPsUZ/YFeUYg0vVGm7JgSmbOBYOnYULztKUt3uUi
	gOAcmacLb+adRXymzKoaBegKRAen/SDsBv8+KGnk9OMOQsQyxtI3keF14sOdF+AiRm+MU68jM00nC
	4RUCkFtzUzuDE4hJAhHL7WbTeEbQQKs4Tw9KBXUi3c4lAFZ1z3K7CHLD/BBlRD8ZuXmuby1/WHioI
	z8iVo5N9Z1/u60h2T0xfwvC8hn28E11t3p0nnRvcpE9A4P5d4h3koKx3pBXw7W6RthyhKSyiQS2jB
	p3Pl2HEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZU0i-0000000Fr5C-34YH;
	Tue, 16 Jun 2026 13:39:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZU0h-0000000Fr4l-0TPN;
	Tue, 16 Jun 2026 13:39:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EAB1600BB;
	Tue, 16 Jun 2026 13:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95F1E1F000E9;
	Tue, 16 Jun 2026 13:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781617161;
	bh=I1IUW0YuXoQNF3mkk4e2D/l4Tl4n61zrxX8gulenhgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XVV1whSQWB41WuVV1r4v3yYfSlR3mLMRp55Cntega8SxOjPogc0mfXP8WT+uhaSJW
	 JgCbQud8QVViPyJM3lGeIUU6b82GiuTGTzcoAmAacoo7rIgx0JPvUZFtEml/CpqtN3
	 GDzWakcjqblyxEXbrRmCuU7IsJrdoP2LBmUMawy1hmOGk4t3c2dYOoAlXqxLRKbqyy
	 2+4dFRnTFIveE6FMeVdpY+8W3kkHhtgZ1/5/Myy8nh4U0GRbtPuozs5iqmIaQlSvbO
	 6tYm4XgttPiE+yDwx/dTSL7MgsX3vQMCtp+2qOcKdL+I2WpaErWkhn0N1ROZeI7qEK
	 ESYhQD8eAGkhw==
Date: Tue, 16 Jun 2026 08:39:18 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC
 dtsi
Message-ID: <20260616133918.GA2335264-robh@kernel.org>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
 <20260615071836.362883-10-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615071836.362883-10-l.scorcia@gmail.com>
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

On Mon, Jun 15, 2026 at 09:16:15AM +0200, Luca Leonardo Scorcia wrote:
> From: Val Packett <val@packett.cool>
> 
> Add the dts to be included by all boards using the MT6392 PMIC,
> providing support for regulator, keys, pinctrl and RTC.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt6392.dtsi | 75 ++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

Nothing is using this so it is a dead file that doesn't get tested.

Rob

