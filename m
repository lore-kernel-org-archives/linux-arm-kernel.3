Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428D6C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBgNSeAKy3V9+glxTJ9u0MSNETvwYObNm1rdwrrdkBY=; b=kBbQBs+Mgwi/9fqkkb2hNG3d//
	VOSvFlQv+Ub/zkmRoCeIdhNS3xHlewwomoRxcQequWeYNAYJfkultCS7u0llveejY79Pibko0V9HA
	arl01jLj5QoeXuKCd+EKdJxZFmrWiIU14TwzDSHU/jc55/Zthmz5B35VtqtqecculJ1QqxHPsLvX/
	stIAa8GGsS7S001nrP9AYmGRdeAzMtI3lht0txNYUYLpnH8JfCSaufhw7rdyrZS0Z+KALJojb4L9f
	e/TDL+ls566qZQI6tr90rbCX6/gxrDh23XLOQkfi9PsnJiZj4Rxx+BcmQq2LKA870WjdxsC8xEpW1
	1XRPgGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lLz-0000000BO9s-1O2q;
	Thu, 24 Sep 2026 15:27:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lLn-0000000BO7D-2Ljo;
	Thu, 24 Sep 2026 15:27:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D0B2560200;
	Thu, 24 Sep 2026 15:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0431F00893;
	Thu, 24 Sep 2026 15:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263626;
	bh=zBgNSeAKy3V9+glxTJ9u0MSNETvwYObNm1rdwrrdkBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a5dqRwRL93QqwgSHbhAUOu0m78/vPnTDAi1chRy/CZASJetpaK0ln2X/uA6nAQEGT
	 I6dqVGptKhE4GHYQE87CvdqAESw8/56C81+kdUytU7UweHHXRH5yiARqKM7BYH3n2J
	 g6s7/zuIakZpPv3k518q2O7MdoVwP6cINUxbsf33tPPl8Mrm1134kY92zahoMwdA4t
	 elbQGOLDh+7+VqaWR9xVRZdVcPDx8DP7jxt98ujI2mr8Y2gCqvTIHNeOOfpMCQpcoM
	 UO7Ey57hD1iUhSRoIDaau/31H87iRlrLIUOGGBX3qIYnhQzuDIOFWBwWl+xsLXkreu
	 Oj1FchTVG1Wng==
Date: Thu, 24 Sep 2026 10:27:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: "Martin K. Petersen" <mkp@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Avri Altman <avri.altman@sandisk.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Mark Brown <broonie@kernel.org>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-scsi@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Chaotian Jing <chaotian.jing@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stanley Jhu <chu.stanley@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	Peter Wang <peter.wang@mediatek.com>
Subject: Re: [PATCH v12 03/24] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
Message-ID: <179026362398.156393.9411770952322426875.robh@kernel.org>
References: <20260914-mt8196-ufs-v12-0-9279d7ef814d@collabora.com>
 <20260914-mt8196-ufs-v12-3-9279d7ef814d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-mt8196-ufs-v12-3-9279d7ef814d@collabora.com>
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


On Mon, 14 Sep 2026 13:38:49 +0200, Louis-Alexis Eyraud wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The MediaTek MT8196 SoC's UFS controller uses a different set of supplies.
> It is therefore not compatible with the MT8195. It also have an additional
> 0.9V supply pin (AVDD09_UFS_1), that is specific to this SoC, thus not
> currently described in the binding.
> 
> Add a compatible for this SoC and new property for the additional supply,
> and modify the binding correspondingly.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../devicetree/bindings/ufs/mediatek,ufs.yaml       | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


