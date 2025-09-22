Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A18CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpW7rYAxjBymElN3zC8FzAPYo3nFs/KXy+Wc4Z6+hL4=; b=dyx7BsYGFq3rsNSSI8mRyQm1bF
	oQFfw8FHuG+N7fKl16t9HqLC3ac/B4dfWX+m3gyH80Gsclm9viOLUk+CCckJrZkZ3nVNf0smfh61h
	ZMXi7MrSqal/C7Fb10q6KqRzmp87wHclmCks5ToLJuxylMouC3qs4TuKlxsejdfHrdpP75R+6e35O
	qLr7XRkmbIwsXg1VMjVVFM9hxHMPwixAv2jjQX2MZb5D0MWHeRwFOKRBPvP1dX056klWxNL3pPHih
	FanpZFph1PwSu705n9m62LeQUbnBMnEigmA0kc0Chwrqur+KI0IWi75u5/GpMQu2qooxora27bKdz
	TRNcgLHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j0f-0000000AvAR-1nlA;
	Mon, 22 Sep 2025 16:03:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0j0e-0000000Av9z-46Rl;
	Mon, 22 Sep 2025 16:03:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 09C5B6020C;
	Mon, 22 Sep 2025 16:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05220C4CEF0;
	Mon, 22 Sep 2025 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758557003;
	bh=SBGcHxTA1qXpjYcMN2XvPCz4NeeP4t9w4dEm7rTj6mI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Okdk4HLpW7Kmoxgxc97pQ2qYlroVJ/LR1qBFjpayn3uKBBhgY65vvD5163oCK9WgH
	 hpHrSkjmcc6hzLlajkdmPSJiDTq44kQzw2/jZaHLba2rTWEEGCydLFy3QhKZsN4ZXC
	 Vjq5Ly2WbORSmmMberQB7tT42jTifK/WO50CloeJ4LpSZQlrN36/p8u3IWvu+PYGpd
	 llpAF5PGvW4gn7LbQwItU6acJSa2UjKBpARczJa4qmhZzuKQMUc3+BOK7LMSX1Vem+
	 0qd5B/8DFOZw9mtOdBWfi1YR0BQu0XbhSvy8gY/Iv74JmQcN+kHjIhg3QdmldLL/mb
	 6D94AhDK7WiNw==
Date: Mon, 22 Sep 2025 11:03:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-media@vger.kernel.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	George Sun <george.sun@mediatek.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: media: mediatek: decoder: Add MT8189
 mediatek,vcodec-decoder
Message-ID: <175855699590.126634.9163224835580363424.robh@kernel.org>
References: <20250915091958.31509-1-kyrie.wu@mediatek.com>
 <20250915091958.31509-2-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915091958.31509-2-kyrie.wu@mediatek.com>
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


On Mon, 15 Sep 2025 17:19:51 +0800, Kyrie Wu wrote:
> Add compatible for video decoder on MT8189 platform. Compared with
> former ICs, the MT8189 decoder use iommu to instead of smmu, and
> use scp architecture, the frequency is only 406MHZ, and cannot reach
> more than 700MHZ. At the same time, the decoder supports the vp9
> decoding protocol for the first time in single IC.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


