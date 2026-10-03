Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C3BCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 20:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDQY7iuVWorvARYB/kxbcDCgmHiMd48YCWb9KH3HF1U=; b=rDIYevih4l77GrYfoMUSJt9Zof
	xGC9vC35F8ONdwxY9TuJ30d/gkw4VkjUXgswl5VcKYkSr1vlsRtYuCyb6jFYfs/XPJwe+k/qsOVDQ
	9C7eNTQk/hBQPmlP+BIfD+S1TyXWWBrq2FP2Rv5tVZ2QclLrTIfDCF2iFzosnzcf3MxxkAnKjWb8E
	BGADbxrU7uGliKpKCdEcIruVPFNzZTUZg7odHq1g0uyW1CrUIzmJ1jpg6d+iHVU9PETz1E7d09IL5
	5zCRc5AYE7ctpUHoxxFevMLuzigK/xIB+IxWCE20tEn1cGiVBEZlgFhn88a58Tv4lIvkfsDoRzgkQ
	oQM3PXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5vg-0000000Dz4e-3e9Q;
	Sat, 03 Oct 2026 20:01:56 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD5vQ-0000000DyyP-1DEj;
	Sat, 03 Oct 2026 20:01:43 +0000
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791057698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fDQY7iuVWorvARYB/kxbcDCgmHiMd48YCWb9KH3HF1U=;
	b=oUuDmln3hJLxmPeIVjLm1YxXDtxmICcQ/c4C0hKxW6ACLEyjeDMMe8ZHGcTHsOD3Jd2THt
	qFs7gYco51kfVj98/wHh6sN8nRvvUwdhfnw4KuQE530DNs+pSuu6zejxpqlUfkOV/spdpk
	t5sXucYqBCQoknZPtCQkP/FUpTtVLh0jF+o5kEUok7EhL63UFaUIueWYzEnNpdNQRzZydg
	Wkk8qEivD7zK4tuZaFyKkzlMr5Hvwk6Xpf3FZgmLYXYowFZ8rS4AvPHjxsrF5o19IGmsjv
	lISDVPP2VreDdW38qZzTVr5UvXDO/CWajpG5PiJZTZYXHDpOoBZ39OKTUPs6UQ==
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8188: Add the MFGCFG phandle to the GPU
Date: Sat,  3 Oct 2026 22:01:32 +0200
Message-ID: <20261003200132.866240-4-michal@nozomi.space>
In-Reply-To: <20261003200132.866240-1-michal@nozomi.space>
References: <20261003200132.866240-1-michal@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_130141_473633_54A408EF 
X-CRM114-Status: UNSURE (   8.23  )
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

The GPU driver needs the MFG configuration block to enable the GPU
timestamp counter, which otherwise reads zero.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 14a320f0c70cb..b4be89bf55bf7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2266,6 +2266,7 @@ gpu: gpu@13000000 {
 				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
 				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "job", "mmu", "gpu";
+			mediatek,mfgcfg = <&mfgcfg>;
 			nvmem-cells = <&gpu_speedbin>;
 			nvmem-cell-names = "speed-bin";
 			operating-points-v2 = <&gpu_opp_table>;
-- 
2.55.0


