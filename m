Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57D0C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 10:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lfyUI7+Tc/Mb2QBy6WdYhNYHUjaxuxidXp/ImzOKso=; b=1x18ibXrR1/viMP5GqjMJesJYf
	7VQ5Y8NHWmPERR99fioJE8wV5NxCH1vv3/gsVNaGU+7JqFy7wfjLx8zt4Q1FzlC1SmnQiIUhfvShG
	M06bE9m+LCaDESWHtkr5+rulSPFEi/GcsxcD/zgpIiRVs9Con4O3qHl3Y8RH7CBXjVSDK//gFMPDg
	/McH8elXHlffQI6oCGOP7Xr45AYdnwpGVHKGpT5XbSOqL54F3wLSOZC4f0VXXR4kb9o5ufLrh5BPg
	dHhJBoPsJqOiBaETn9suxqG05tAEJUBLZ2L24XqLR3jsCqUDekg5MIkeLB7W+4knA6FzDVrPgf4Gc
	dxP4Z/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5hsl-00000001bRF-1oVo;
	Sun, 13 Sep 2026 10:56:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5hsk-00000001bQq-2uSa;
	Sun, 13 Sep 2026 10:56:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D6CFE44838;
	Sun, 13 Sep 2026 10:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E5A1F00893;
	Sun, 13 Sep 2026 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789296980;
	bh=4lfyUI7+Tc/Mb2QBy6WdYhNYHUjaxuxidXp/ImzOKso=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MDNgxXDs/qfL2+bBSwRLh8Zolqio39Jl2Ern1bn9MCzxsW+oSFKQJS1Ag/E2NNYQE
	 e14DpFo1W8eZ5U1lB4f2VodT805452hsUQFEYWg/ztg/5nBtb9d2p9tSV2MhiQSCRq
	 lJrxb90/D/9pRDWI+iP4dCVJYt9YLZPEN9MiNi/J8KpSUxaHXyE1rceDeQNQH5MqCM
	 RCc+I7/Nesk9xls0DYV1SvAMFRNDqtzZCV96Pkm/LWh/u/r9jwoRCHJddcTowkOxmw
	 xL+S75lju5jxzAbWA+mThhmgjgLiYj8Dx0KSilRz/qK9rZiW76Y/4PlmpOpqbl22tq
	 pyk0j8dMTnUSw==
From: Vinod Koul <vkoul@kernel.org>
To: mani@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, neil.armstrong@linaro.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 kernel@collabora.com
In-Reply-To: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 00/12] PHY: MediaTek DP PHY refactor and MT8196 eDP
Message-Id: <178929697500.215437.15947728409079441751.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:15 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Thu, 10 Sep 2026 11:20:26 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v4:
>  - Removed error checking from all regmap_(bulk_){read,write} calls
>    as those are on MMIO and can't fail (Mani)
>  - Changed some of the error prints in mtk_dp_phy_get_one_cal_para()
>    to dev_err_probe() (Mani, Sashiko)
> 
> Changes in v3:
>  - Added missing bitfield.h, pm_runtime.h includes (Sashiko)
>  - Set calibration data before registering PHY (Sashiko)
>  - Enable PM Runtime before creating PHY device (Sashiko)
>  - Continue poweroff if some write fails, but still return failure
>    as that would be a partial poweroff anyway (Sashiko)
>  - Added zero driving params to fix default calibration data setting (Sashiko)
>  - Added NULL check on device_Get_match_data (Sashiko)
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: phy: Document MT8195 and MT8196 DisplayPort PHYs
        commit: 1e432224ed9b31607802ff4e370b73468ca9a452
[02/12] phy: phy-mtk-dp: Rename regs to regmap in struct mtk_dp_phy
        commit: da3c07602f6761403a2ee1b155e7645465c0d36f
[03/12] phy: phy-mtk-dp: Allow probing with devicetree match
        commit: e78be6a5410cf74534be19b3be1090c325132f56
[04/12] phy: phy-mtk-dp: Migrate register offsets to SoC specific pdata
        commit: ae859204b519a384ad0136c21599bab9321090ce
[05/12] phy: phy-mtk-dp: Implement power_on and power_off PHY callbacks
        commit: 10e7b846fc5ed8d3420fc8eb1c0b4524e952b4ac
[06/12] phy: phy-mtk-dp: Support set_lanes in configure and properly cleanup
        commit: 0382b9948627e091aeffcb8be311ea2b26dc1665
[07/12] phy: phy-mtk-dp: Support setting volt swing and preemphasis values
        commit: 283aa3fbbc80e1c1b23264f0bd00a96f5cebbbec
[08/12] phy: phy-mtk-dp: Add support for digital and analog calibration
        commit: 7cf38eb0ab595fc312bef06faedf8a0f0dcb8fcd
[09/12] phy: phy-mtk-dp: Rewrite and document default driving param macros
        commit: 5d907e1bac8a4bf3209fca42ac93c9d2c7f723f8
[10/12] phy: phy-mtk-dp: Add bitrate register val definitions to SoC data
        commit: 53e25169561a500dbcc4992dad17795a11e3e6bf
[11/12] phy: phy-mtk-dp: Add PHYD Lane EN register mask to SoC data
        commit: 09782cc51273ba594905633e1e59ee3c3b82fe6a
[12/12] phy: phy-mtk-dp: Add support for MT8196 eDP PHY
        commit: 6fe4d5beac728b447e77dab158985550ae58718c

Best regards,
-- 
~Vinod



