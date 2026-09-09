Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A858CC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2s8uYoBSnPRtzrtxy84WXDVLveffRjaRrPrEHzO3Eg=; b=JmhvGnKGLp6QC5GfSkMxq554pz
	pmOEvMhfnx2C5ac4dd7k6GsyjTRjj2MSSUqprJm7Y91vr0E4F8mamAepc03jzlUZk7xT8jl4wNqdz
	Fw3+IFPg++WjJX/gCwA+jVH0dgPSHudcFFDMMp5w2FOSbxh4awbpkEIhOVVz4pr7+KPLLtNBGJwOo
	0ptOUi7FaMlIExpJ222FFiK7Hn6mBg7bPVntS+XLpAd96ZrrcH/6EzIwSfLfKeXk/2VEGsxA2FWfK
	6sdI7QUfZ7NVStCNttO3yVb7aI9SDFpFx4lWE5G6SQo3Oz8Qq+wytLdQk2o4EPJvNo/DIa8rbdCW9
	EQ+1wQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lhg-0000000CQ85-24UF;
	Wed, 09 Sep 2026 17:03:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lhf-0000000CQ7Z-17Qf;
	Wed, 09 Sep 2026 17:03:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E6FCB405F7;
	Wed,  9 Sep 2026 17:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C281F000FF;
	Wed,  9 Sep 2026 17:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788973397;
	bh=p2s8uYoBSnPRtzrtxy84WXDVLveffRjaRrPrEHzO3Eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XkVQ0vIuB6RQIRTUzSey3nGs+UX/fU73qGe5rLJyVH74queEPlJAnPabs0WWtPtc2
	 AxwFcbtRNCukAPEqEW7rAq4WamRm6e5w76DIxmlGofvrUfKd0d4x75v7u9tRtkcbDC
	 JOTgcuqnOx117t79O/6qN0+IE/2TJ9rK8MLBBsHqfRu8ueC01Gs12akCoHc+tPQTpu
	 R85FtifAhbIUhJFuE5Xt77KmJDvQv+HKr6+Q5nDAcNzmAfny9H3TMDj7eeyFonpnuq
	 tDHH4fZvp9tjRevl4BB7ecdS22L6GBeX2minc5iWSMTNe7DbPL8JP52sSmaZFVZSqc
	 7XoXLn9sP/kQA==
Date: Wed, 9 Sep 2026 19:03:08 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 03/12] phy: phy-mtk-dp: Allow probing with devicetree
 match
Message-ID: <bkx46kvsmovy2rbjnqwov65whmwnbkoig27iihk7w4qcosqoqf@jymp7vcu3ezi>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-4-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 07, 2026 at 05:42:36PM +0200, AngeloGioacchino Del Regno wrote:
> Make it possible to decouple the registration of the DisplayPort
> PHY driver from the DisplayPort IP driver by adding a devicetree
> match to probe the PHY, registering an OF PHY provider and this
> device's own MMIO regmap - if, and only if, this PHY driver was
> registered with an OF match.
> 
> In order to retain compatibility with older devicetrees that are
> not declaring the DisplayPort PHY as a separate node, the legacy
> code was moved in a `mtk_dp_phy_legacy_probe()` function, which
> gets called if the driver was registered by the DisplayPort one.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

