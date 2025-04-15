Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57B0C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSVm0Sg4JNsS2Z+oM/y7piT/XSs97tEGm0noAA2h7bw=; b=qKNnSmXaJu4cPiC9s6TtZVWYBM
	tMEn5SVXM5jZN40p7Nl4ilsPVgp7NA0CIbWzk6ljRb7pTFxOc4Km22+zJAUZi98PB3so423scsrJ+
	B9DlO5aONzTa+AhLiDf/yEZc5OO7mZ/wGzWCz6YQLdUAcxlRCQx/snFmAyj9UJrNnh1RwhWQH3Q1t
	GW6Ohk0rPOsGjj37NYSModgK7gkY2kt6IKa+SCjXQZCHmcsQfT8jESko6eBEFDH/pX9b/RlFlVfC2
	ZRUtjrO+Br72QDv+69DvAhEpn6xcm59WwwkYZ1qSz6ooBsxWQLXTO9aQs2O0VPcArnJq6YbuiClFw
	QKM+RYpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b7A-00000004tBg-3trZ;
	Tue, 15 Apr 2025 07:53:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4as0-00000004pgl-1G2i;
	Tue, 15 Apr 2025 07:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744702690;
	bh=voe72fPOWYDOgKbHC5pT7xXAC4bwfo9UuMDzcL8nkW4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jcmq4UsiCrCdB57TvR1j9uL06+uNAWSu32krqKm+keC4y0zXQLoMjN0x06AZAD5WG
	 pbg9rRGMBM2YLbv+qADCCpO7E+OBB8H/iFh8c5S5Xhgi8XzS8+Sfrm5N+BniqBFuCx
	 DXoOd0zYqfWuSjpZCQPSXJ5K7eJw9Kpf7Z56v1AudCc/jyizzfXtw3eJncl/rcySMJ
	 7MkUPGTFis/mCv+LrGeQBM0S2orCbfLrdw0XDdSz38O3lARniX8hdB6Pw4oMNH5vxj
	 dl9MWULi1K6pHVsYuOpNZRQWVC4Jbp6ZHFWWXyPjo7jcUaVJjgUp3nOpA+4l9UaD/D
	 uOr8Cnz534Lhg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF36017E0CA7;
	Tue, 15 Apr 2025 09:38:09 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 mchehab@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, sebastian.fricke@collabora.com, 
 macpaul.lin@mediatek.com
In-Reply-To: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/3] MediaTek MT8188 MDP3 Enablement
Message-Id: <174470268964.14740.2655102858243748239.b4-ty@collabora.com>
Date: Tue, 15 Apr 2025 09:38:09 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_003812_486961_FEAEFF4E 
X-CRM114-Status: UNSURE (   6.17  )
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

On Wed, 18 Dec 2024 11:53:17 +0100, AngeloGioacchino Del Regno wrote:
> This series adds the necessary bindings and devicetree nodes to enable
> the entire Multimedia Data Path 3 (MDP3) macro-block, found in MediaTek's
> MT8188 SoC.
> 
> This was tested on a MediaTek Genio 700 EVK board.
> 
> AngeloGioacchino Del Regno (3):
>   dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
>   dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
>   arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/3] dt-bindings: display: mediatek: Add compatibles for MT8188 MDP3
      commit: 2971de063fa56c18b2720ab19bdebca23cd96471
[2/3] dt-bindings: media: mediatek: mdp3: Add compatibles for MT8188 MDP3
      commit: cfb00dfa1b778a8037faf6973cca226e5ad4f45a
[3/3] arm64: dts: mediatek: mt8188: Add all Multimedia Data Path 3 nodes
      commit: f0935480253ede5405045a4e733f4476343cbb91

Cheers,
Angelo



