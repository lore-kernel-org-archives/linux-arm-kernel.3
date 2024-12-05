Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D2AE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/B1I5N2xeKfK8R/D+70986mlOdmcVT7uRmkqjGWY6DM=; b=AQJ8ca7pzD55CocNHjmVOpBLrP
	qIUf+qMSA7Ka5oYichVOanu76vESISpAmxAZxJN72RN6WMyHDup4pduHjbY3iirMtWFcvc9AhVSLZ
	OccYu8YM7d+Xs6QsNQan7Bs7IVlO1NeP9WgEm0+mmVtA11NngDo9Fnp207kbmiuoCJ28/XLhwArg+
	rbNy5Z1BinD+zp4RNE2F8EGAawqFW0wxT6J9RsAo5onco6NaglugPDC1V63AGkT/PQ/racyLnu1uc
	Eyb114UPFznYfm6AVPSzOf2rZotfCmrIkhWZrIGzg7txo9EcEbLNS2/M8/5yv/R++eWFhYuYrVhbo
	5bwP1TCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCpa-0000000GKIQ-0V5R;
	Thu, 05 Dec 2024 14:27:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCnX-0000000GJqt-0uCo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 14:25:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CE4C5C72CB;
	Thu,  5 Dec 2024 14:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B752DC4CEDC;
	Thu,  5 Dec 2024 14:25:41 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id CF00A5FA91;
	Thu,  5 Dec 2024 22:25:38 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Cs=C3=B3k=C3=A1s=2C_Bence?= <csokas.bence@prolan.hu>
Cc: Mark Brown <broonie@kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, 
 Vinod Koul <vkoul@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Amit Singh Tomar <amitsinght@marvell.com>
In-Reply-To: <20241122161128.2619172-1-csokas.bence@prolan.hu>
References: <20241122161128.2619172-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH v5 0/5] Add support for DMA of F1C100s
Message-Id: <173340873878.1777403.11710031355609971039.b4-ty@csie.org>
Date: Thu, 05 Dec 2024 22:25:38 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_062543_293316_E96DA759 
X-CRM114-Status: UNSURE (   8.80  )
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

On Fri, 22 Nov 2024 17:11:23 +0100, Csókás, Bence wrote:
> Support for Allwinner F1C100s/200s series audio was
> submitted in 2018 as an RFC series, but was not merged,
> despite having only minor errors. However, this is
> essential for having audio on these SoCs.
> This series was forward-ported/rebased to the best of
> my abilities, on top of Linus' tree as of now:
> commit 28eb75e178d3 ("Merge tag 'drm-next-2024-11-21' of https://gitlab.freedesktop.org/drm/kernel")
> 
> [...]

Applied to dt-for-6.14 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/5] dma-engine: sun4i: Add a quirk to support different chips
      (no commit info)
[2/5] dma-engine: sun4i: Add has_reset option to quirk
      (no commit info)
[3/5] dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA
      (no commit info)
[4/5] dma-engine: sun4i: Add support for Allwinner suniv F1C100s
      (no commit info)
[5/5] ARM: dts: suniv: f1c100s: Add support for DMA
      commit: 7336701f6467381af87a462008793178925a03bf

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


