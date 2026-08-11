Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980F0C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qG/AVOsFnlV7V2/LzQ5KRmzkaVFG+vwZ226967/+O0=; b=o8aVKAQ1478Ahxt4PjxwmE4aCZ
	P9zvEPqKP4B7sJlwyzDNvoet2xg/HAg8HTy5rSJVG0d3TtMIebB2HtZy0XdtubLJ0HloLfe2yKNsg
	tLFO/eCzJK0g5m11BSoRNmsvxvT4Dwzh3FygtTNANlgznOx5qFVpesPsGOBkzPscbU9kfwq2Q2DIu
	6KPvSRAQNrxQHr2EkpO9juzPSKuavCmbiWqwx1kOTQDuaAOxQ8O5l7Qs9PLXGEUHzh1FFQl8YV7rJ
	jmo9FE4M5hpuaUIkO9b/bYhqs7poz9ytqIGlFFMW6fg6wshfcZk2yfow3dHXabUBgO5GcV5Y3k2sT
	lIiyL11Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmuA-0000000E8Rz-3sxF;
	Tue, 11 Aug 2026 13:52:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmu9-0000000E8RZ-1biE;
	Tue, 11 Aug 2026 13:52:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AA9C4600AE;
	Tue, 11 Aug 2026 13:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1C41F000E9;
	Tue, 11 Aug 2026 13:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456352;
	bh=8qG/AVOsFnlV7V2/LzQ5KRmzkaVFG+vwZ226967/+O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S+nTF3gJiQPYAcTAZoHOCwldwmZYTApVKlAGQ5OHDwblvTbppmG96zmpuUaHytdFa
	 12glA6kDsn2qi0uYWYot+GSNI6Sp1nvJMmWTGk6v+Fee/RLVwcDybWeoA+JbRYfESm
	 cdDvrkGe4G6/gBdEYKdihcvw3uDeYxwM7NtKFE4krBTKIes8DiSFRd2aBWDM01u8Td
	 izPUzDfy5oZEAhgErTYQ38arQ9gKf1zA965m8JGfDQkzxQv+yTJfOSnWhRoi56ax7Y
	 CKIx8ypFD98t/jEpJgz8cCmGSbsUyul0qzeLnWNqByTNsLqTqrbA3hnUz39ZFZkEsI
	 2KHjFgEAWNoNA==
Date: Tue, 11 Aug 2026 08:52:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Xia Jiang <xia.jiang@mediatek.com>, Keke Li <keke.li@amlogic.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] media: dt-bindings: Correct white-space style
Message-ID: <178645635112.2073056.6980920721242765478.robh@kernel.org>
References: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801195528.235230-2-krzysztof.kozlowski@oss.qualcomm.com>
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


On Sat, 01 Aug 2026 21:55:29 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/media/amlogic,c3-mipi-csi2.yaml  |  4 +-
>  .../bindings/media/i2c/galaxycore,gc05a2.yaml |  2 +-
>  .../media/mediatek,vcodec-encoder.yaml        |  2 +-
>  .../bindings/media/mediatek-jpeg-decoder.yaml |  4 +-
>  .../bindings/media/mediatek-jpeg-encoder.yaml |  2 +-
>  .../bindings/media/qcom,msm8996-venus.yaml    | 40 +++++++++----------
>  .../bindings/media/raspberrypi,pispbe.yaml    |  2 +-
>  7 files changed, 28 insertions(+), 28 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


