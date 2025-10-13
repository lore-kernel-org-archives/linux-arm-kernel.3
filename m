Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965B6CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RomrXBxa/0J0s0xCsFH109XZq08Sm+LyevRYIDaVrII=; b=hOYCZZrSXNhbPv5CnRaQbo5Eox
	y3LbNbung5mkil3PbA/B17eWThbkLXyvyNiqdCJITksZp/aNx6kql0Wou6o2PKvdiXSXVCKnPoj1/
	bHZjqpZdiYXGu7bEjWa5yW2eBLLvmavAx2fQIUcEBdi6EaRMjrDs6alOtsTj6G9Y0tnHTD2ccIcGb
	jYhbRjq3c3DdrQyY+8eD/yy6gnzJa7dvIfDfpk29s2qupwuVSL+3u+POYw7F9cBtGP3xj3tpxkepj
	rqqvzJYoi2MTquFvezjo1pu/ma0iXRdGtAZgdp8dDc7rgUVmrsxRWSfkg2t3AnScbgAgIPBDJoF54
	4WW1fw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Eua-0000000CkJY-207l;
	Mon, 13 Oct 2025 09:32:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EuY-0000000CkIn-0qfX;
	Mon, 13 Oct 2025 09:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760347927;
	bh=gJp0KJN5JsnAs44g7Qv8Flla0ZPEoI3EDaHQ5Ie/TbE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oWA4MZYBiGExivnYMXUDxTPU+xKdquwfvIIDwrBYfG+KGl9zWe9TAn80ESph/rNit
	 +wn9QGLV+81ZMhtsp9Mq1T0uxX3r2eInBu0BCsFGY2M9ZBE8fnwTonMf2Bt+HufGpZ
	 UHqRfvVxkV/Cet+U/y+oqGUxKMJTamPfdtk2SOuh+QZfAV6JxaHjGnTYA5VfbPfeWn
	 QzvQtrbMTRUSijnDknZ0Nl+HzQ56kRKoL9z2/r1BQNjyv/AYqzKXOQAAcXypfxozmQ
	 WfQWASb+hJiB264YsedQBiHVjcGBbhEZrnnLKGurpispFL+zUGJ9Fo7qGUBWM3JObN
	 CTu6ShfYITw+w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 847BF17E0023;
	Mon, 13 Oct 2025 11:32:05 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Julien Massot <julien.massot@collabora.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
Subject: Re: (subset) [PATCH v3 0/6] MediaTek devicetree/bindings warnings
 sanitization second round
Message-Id: <176034792547.20821.16275876241287095581.b4-ty@collabora.com>
Date: Mon, 13 Oct 2025 11:32:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_023210_402905_07CC7148 
X-CRM114-Status: UNSURE (   9.34  )
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

On Tue, 26 Aug 2025 09:39:33 +0200, Julien Massot wrote:
> This patch series continues the effort to address Device Tree validation
> warnings for MediaTek platforms, with a focus on MT8183. It follows the
> initial cleanup series by Angelo
> (https://www.spinics.net/lists/kernel/msg5780177.html).
> 
> The patches in this set eliminate several of the remaining warnings by
> improving or converting DT bindings to DT schema, adding missing properties,
> and updating device tree files accordingly.
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[4/6] arm64: dts: mt8183: Rename nodes to match audiosys DT schema
      commit: 872fa3ea0c0e4602e4775d0fbe84ed3d6aa60e67

Cheers,
Angelo



