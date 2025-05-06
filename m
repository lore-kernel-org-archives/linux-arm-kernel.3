Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC8BC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6d6BXuUJXXlNwGnFenAMUb1+dNhi1LLJW/o0DoOYUc4=; b=s/hPzALZXz7CqbZHKqHFJApTrT
	vz8gCDdUenc3IesHxvKy+5KRnRUjJudVxJNmtttWdqW2YeuyHLViwwEftFl+aP1+SE/U5ktvU8/7g
	NFXFla3DTaLSmb9fWg8dRFiBSgdaMtBovDyKK7cUjQvzztoNa6c98JqQCLgGe2p1BU5w5TnL0OD3k
	NeK6vUFpRou5iDtnKPRqKTTNnzFXu8AMpfCK9q4szen77RDSUGiGHhTESkTF9oTO4GMVbEfIVfIml
	uBjMMDWr6LTdeuuDsG6gkwWNzck/PmOeLTyoChJjo1UM7DhJe5xD1kY8+zliWDrfX61wi05zjVnKr
	7uixm3lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCEiL-0000000BP9m-3jUD;
	Tue, 06 May 2025 09:35:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDtA-0000000BCfJ-0BaV;
	Tue, 06 May 2025 08:42:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520974;
	bh=F3dtZtfd8sl1XZfT8M5NMHOnj5cKiMAgsEOR1aqdr6U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rv++PX5YnRbe1dXiOufvraYla5D0NWb/6s+6JD5AA3B6FoN/SegaGrRC6IHGdxVD0
	 TNIsIj0OE9zu65/1Qpmjhpj8lhBjHCcLa+ceewQZFQ1CgK0CHjob1zBMDC25c17rIc
	 pzod58fsLIUPj6W/LkxLNKrVmY6r29JBY+BDKT/xslesJ9oS0EMgswwM1vmbKdJujI
	 fDN2xvIH2Jpey+9r1zRx1jfA5TZAcvIegh5NyubUmaohozZ00Utw9tzE6KcdSDuFBQ
	 juSiKrI+o82NKlLKgqWUo2C3qe98W0abkcAxWDsfz3DNrcIYGP35Y1W4nFd5/TQb+0
	 dPg2LT6M9+17Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75C2C17E153D;
	Tue,  6 May 2025 10:42:53 +0200 (CEST)
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
In-Reply-To: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
References: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
Subject: Re: (subset) [PATCH 0/4] mt8395/mt6359: Fix several dtb-check
 errors
Message-Id: <174652097340.119919.13115180921625978268.b4-ty@collabora.com>
Date: Tue, 06 May 2025 10:42:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_014256_231205_558E64B3 
X-CRM114-Status: UNSURE (   8.93  )
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

On Mon, 05 May 2025 15:23:36 +0200, Julien Massot wrote:
> This patch series addresses several dtb-check errors reported for the mt8395-genio-1200-evk.dtb and mt8395-radxa-nio-12l.dtb device trees.
> 
> The fixes include:
> - Adding the missing #sound-dai-cells property in the mt6397 binding.
> - Allowing up to 5 interrupts in the MediaTek IOMMU binding to support MT8395 properly.
> - Defining the required compatible property in the regulators node of the mt6359.dtsi.
> - Renaming the rtc node to match expected schema naming.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[3/4] arm64: dts: mt6359: Add missing 'compatible' property to regulators node
      commit: 1fe38d2a19950fa6dbc384ee8967c057aef9faf4

Cheers,
Angelo



