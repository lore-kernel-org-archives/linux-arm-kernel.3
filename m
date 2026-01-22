Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F4ED62613
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xppAMfWdi7mv+Ucu6zeKaYJcSttHbYpiYPICNNOKj8=; b=3Aupbes4bEmE+0OTdmI1ppx2cg
	ywQ/5kAkYajo0fjSStnAEO/oSPKb+1UDuAcpPWBgs7/mF3wjH8U7MA/f2k99c2hpjutUSs7exrOtA
	+hzXFOFSEOR9q/YQorPEeZR1G3p4gzg1uDPtcxN2QD+ev+kiVb7EjV4UQK6521YokgMHTIlH0mrqB
	vhc/B+uTYGz1+qd7rXe1z4rq5a9yM16gkP28l6POWV8if/bmP+OWVDcJ7gQzXn/fxEaTUyE1+Xb3O
	BYu26WjzfTwGuFERQJUkkTMxQoobkOaMd6PH9hWFcuheK4aaWavd9SwvC9G0PSjg2S3iYcTpj+ze3
	KD1+pVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7H-00000006rsH-1kCG;
	Thu, 22 Jan 2026 10:40:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis72-00000006rd5-28mY;
	Thu, 22 Jan 2026 10:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7xppAMfWdi7mv+Ucu6zeKaYJcSttHbYpiYPICNNOKj8=; b=NcmBo0N7zBY/iMqu/kSjFTMD26
	98JX1Rn4lPRn10pmaYNg1rOg1DhLuLOI2Hw7uesNdfVHmjQnZR7tbhPvSQBrS8YNwqh4PDKDKbSBm
	4n8AyfnT/DTozF22OwmEcJHvP95R117P3mUiA2AC9KTbZpawh1DjPqvRyPQAza/f43DvVO2yYD2Hy
	9LlqRCZThPfm7ovpfS6LYZWmT/bvT5YAHtIi+dJkj8on2Racsd9ELt29tNwOqV4PSi4TwneG75BRM
	cz+VKjZfwNxlsoIuY2iSfXU/UbRuPgda58JAZ+vqI97CueB4DKDb1+yrfPZSbaky7tjWJ8h/wP9oE
	5Az6rOmg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis6z-00000000ALQ-0ieP;
	Thu, 22 Jan 2026 10:40:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D376241AFC;
	Thu, 22 Jan 2026 10:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6024EC19423;
	Thu, 22 Jan 2026 10:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078423;
	bh=C1Q2M20w5iprpmF2hd7cvREVmh5k4IY7m3ETKgzcQ6s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sIFQJRF1fVhLCnTsnH5+gxMNoBlQg2KtUYZsZ3Veviw0CzTXjPujVDSz9iUIknGdS
	 1bRHorfphYnNHB8awi2+hVzxleOaRQ7pm939zalOUzH4QKqjfywX7vpUH2STXRNuMY
	 mUiBNMzZ5F1JwDU8EAd9ovomoCvJvGGcXZVDxgHuldoslOrz7FCgTIOyrNrGhVKr9P
	 TIiaAvlrbyMv9cN1h3nPKJegQP0++/m1gFiec/rHkf1P7J6vWXWNQrzW1/df6M956N
	 SHeH+LCVP5bhhKLypHTGOzCXnv/2WFlVR90yYDEK2l3tnI3ZXR124sxLTOHeTtkDBW
	 wlGuQhzNPx9IA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:51 +0100
Subject: [PATCH mt76 v2 07/17] wifi: mt76: mt7996: Rename
 mt7996_npu_rxd_init() in mt7992_npu_rxd_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-7-2374614c0de6@kernel.org>
References: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
In-Reply-To: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Kang Yang <kang.yang@airoha.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104025_653967_92817839 
X-CRM114-Status: GOOD (  10.86  )
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

This is a preliminary patch to enable NPU offload for MT7996 (Eagle)
chipset.

Tested-by: Kang Yang <kang.yang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/npu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
index d79f8dfbd7faa7695ea54b632ac86063fa8ffe3a..a9569278f73bf83454a0357e93602837c6ccaa86 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/npu.c
@@ -122,7 +122,7 @@ static int mt7996_npu_offload_init(struct mt7996_dev *dev,
 	return 0;
 }
 
-static int mt7996_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
+static int mt7992_npu_rxd_init(struct mt7996_dev *dev, struct airoha_npu *npu)
 {
 	u32 val;
 	int err;
@@ -304,7 +304,7 @@ int mt7996_npu_hw_init(struct mt7996_dev *dev)
 	if (err)
 		goto unlock;
 
-	err = mt7996_npu_rxd_init(dev, npu);
+	err = mt7992_npu_rxd_init(dev, npu);
 	if (err)
 		goto unlock;
 

-- 
2.52.0


