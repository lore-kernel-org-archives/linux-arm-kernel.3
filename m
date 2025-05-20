Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0B5C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t45H8AnJQCSBXhFYQ25cFHuMbOamcZ1tcxNwyolFUU=; b=i6WgBhhaXAwqoZ+jA71HCsfcEL
	eOP5MbanqOny0z3lhAxyyjc0zBW99Ibhku3KH3UTQn7mN+0IQ9bVE+cLsi/xMpD3kgW/h7mZ1SOnr
	lcZSC2L6Je3AOuDIE7tw/+aiJCDsNkxtYhSqhv93w53Yez46alKzfpT3/rOGykMZa8OxkWLYId9ph
	9rf8Tqb3sLKh6+Tmb3mMHhkww4C92GDOu3LoMevhtjmFEUb+OVq9KHEKYP6Q3X8n/KRa4ctFdNbLv
	iVM4DaR6DSUfARbe4rJhRft/A2nxSmrCgg+p5rPPRmqnayBU3cX31vIKgahDGo+DiJlaV+VLNFoLw
	znCOwYCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKQb-0000000CPdi-13g5;
	Tue, 20 May 2025 10:42:33 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKAO-0000000CKt8-0VEV;
	Tue, 20 May 2025 10:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747736746;
	bh=wryatFIkuLCQN1Tc9+q9e8Buj5FBmAx9YvgucNUuu8k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HMx1bEbrCHVfTNhtkwmAQnyGH+cil8ZJjLu7WM0axeM4Xu6mwkPfUgeggucWqIw/J
	 DTB1Rw0v97BVUqV/lNXMMSLh55Qbwg35dNShVzzSYiuEp1gh55VO8wUWBvcGmLLWUP
	 RWnzqBZ68Np+s0Yy8VT5VX09Qk9jpi086CCt87j5WGWYICB1rS3cSwExPUR6apiosq
	 ggIlHMiZqRTW2Xz4DckzQayhwoHxM8fAIEMzq1AKNb099yfKsYJ1zm0g+DYhCVg/+4
	 rZxLtZeYc6EPZ+WvD3FGWPBwx/BiDazpKHj8HnAvFYjKZlPQfw4Y16abt+PXJvoRO7
	 W/UBaYHYTkl7Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A6E4917E0393;
	Tue, 20 May 2025 12:25:45 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: kernel@collabora.com, Sen Chu <sen.chu@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Hui Liu <hui.liu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Julien Massot <julien.massot@collabora.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
In-Reply-To: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
References: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
Subject: Re: (subset) [PATCH v2 0/3] mt8395/mt6359: Fix several dtb-check
 errors
Message-Id: <174773674561.3414755.11029706067816008255.b4-ty@collabora.com>
Date: Tue, 20 May 2025 12:25:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_032548_310421_9CFAACCC 
X-CRM114-Status: UNSURE (   8.69  )
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

On Wed, 14 May 2025 10:19:55 +0200, Julien Massot wrote:
> This patch series addresses several dtb-check errors reported for the mt8395-genio-1200-evk.dtb and mt8395-radxa-nio-12l.dtb device trees.
> 
> The fixes include:
> - Adding the missing #sound-dai-cells property in the mt6397 binding.
> - Allowing 5 interrupts in the MediaTek IOMMU binding to support MT8395 properly.
> - Renaming the rtc node to match expected schema naming.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[3/3] arm64: dts: mt6359: Rename RTC node to match binding expectations
      commit: e19de38cca6d037bf3ab5b9908d49e230f817062

Cheers,
Angelo



