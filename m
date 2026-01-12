Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93011C9EC98
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=covm/HGiw0ucCW2VPzaD+ksdZU/SGQRug0e2csWYutg=; b=SDO5WZ6ibzPGt+Yiq1uTOZ6tS/
	ePNHIlDqdVVfVXFIudxA9xwbGwFi9bHOLR0uPXiPptNZ3gp34EUTIFRU0BqxxNv5mRENBLxoe6Y9K
	KsOGpEoRqeBDCcNlnJfm8XvzEBN7f/hgFALvs8Cqj3Abpuwnp5ZN/UVAU4985U5MblX22D/R80J32
	Cc/KzC98aJknCJQ6k6c0f9fWEmxGybtwkPKNR7Uzsg4WgmU0HBFCNLeTL13NjSuFLlWSEGWsiUhPw
	NNIm/wboGXlILRl+2Dvlef7AFWXs86uu8sdjnrxzNH+3fe9KRqxgfyOCsCQ7lbvpJ7Sk38zN6zPio
	wJqrIlZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJKx-00000005aC3-27ev;
	Mon, 12 Jan 2026 14:56:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJKv-00000005aA6-0NHo;
	Mon, 12 Jan 2026 14:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768229761;
	bh=tCoHB+9VbDLSgUJNKgtCaz1rSx1hAZupwzWxkTySq3w=;
	h=From:To:Cc:Subject:Date:From;
	b=mfM7M73s6rzWwjFv4SPWhwSA7Cq3+Wfcd+DcGC3yyHIZWvo1mKOmxGucpe9M/K1+8
	 Qcnu6Q6uALbI6wIB1GP1gHNvmwB2ljpv6BCPlbI54ZvyRKTHns1608Eht4cVCnrTzB
	 3osoub6Ljl8+HR6nCVNZGZrNwUOEA+LaMiXscdnxMkiirmefM7iy6jp6pFyFnUAqxZ
	 eVXw5YErKOQ4GUI7uxlg4iidRNSiiG5Vssa6V/LxMG9wM58deyv0MHdOeFA7NcXseX
	 1SgvgTzgUF+C7IvzcG1weTRzr3yapMGHFkgb+6DwL+KC3/yCB9KhC5ySeYuYRtlbEb
	 SfJi6L0BoXfog==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9791317E0333;
	Mon, 12 Jan 2026 15:56:00 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	conor+dt@kernel.org,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 0/4] Fixes for EIP97/EIP197 binding and devicetrees
Date: Mon, 12 Jan 2026 15:55:54 +0100
Message-ID: <20260112145558.54644-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_065605_281994_D0F600D7 
X-CRM114-Status: UNSURE (   8.31  )
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

Changes in v2:
 - Reorder commits
 - Change to restrict interrupts/interrupt-names minItems to MediaTek only

This series adds SoC compatibles to the EIP97/EIP197 binding, and also
fixes all of the devicetrees to actually declare those in their nodes.

The only platforms using this binding are Marvell and MediaTek.

AngeloGioacchino Del Regno (4):
  dt-bindings: crypto: inside-secure,safexcel: Add SoC compatibles
  dt-bindings: crypto: inside-secure,safexcel: Mandate only ring IRQs
  arm64: dts: marvell: Add SoC specific compatibles to SafeXcel crypto
  arm64: dts: mediatek: mt7986a: Change compatible for SafeXcel crypto

 .../crypto/inside-secure,safexcel.yaml        | 22 +++++++++++++++++++
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi  |  3 ++-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |  3 ++-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  2 +-
 4 files changed, 27 insertions(+), 3 deletions(-)

-- 
2.52.0


