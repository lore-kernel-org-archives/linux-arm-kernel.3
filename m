Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592BBCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ECSIoPsbBe7MVS/DDfDiHhRGxqZFQJYHVqA1SbJwU1E=; b=yUyeVhRmkEyNuMuJ+Dqw9/X+xO
	3Snv8wGYZ9bTL05U6lGNgkefDe1zvctkT3bRPsn75SgTYT38ryMJis2o0ZkqNyVF0/BPl7QvkZjbV
	pv51YpzVXS3sya+Q1IXeqDm5pZha/5AZ35mSw9ZbmJxNBiEx7VkCtBAgWeHMIJ14EVuA87KF/uTol
	77fpL+G7MaaubjY0dIjHlqa+63A3850yjOlB/TjQr2tBOKlLMkGC/znVMkurDQgCGzF2JtCJEMEOo
	RGgjOZOAgsXJnAl+x6Zp7Ax6ED3M3Cmdfjl1o7Y6voBqDB9qkJzCp+IeSkqNQASOV+lixXC3g4+fY
	yN6koMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHM41-00000000Juz-2GPq;
	Thu, 15 Oct 2026 14:04:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHM3z-00000000Ju9-2wcz
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 14:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ECSIoPsbBe7MVS/DDfDiHhRGxqZFQJYHVqA1SbJwU1E=; b=A5vubTosj34sy1rqw2C+jRYHXU
	4pDdcrBgt5lwRIqkG/ehyjk0ehfGtoV0Sn1LhV6fe9cfnWkTL328vi/elZsNO2wgHqay4AZqtzVlD
	r2tgJ+yWjY1irUMZmYjjNgzmtV8WKhYXttHLYDKqcVqSvcA9KJuOwIYsBtsdscTxiwPPcD2lDP+Ai
	WjIe3ja6Q7JBa/gGltD+POhc/YO0AWJ3QRTzrb43JFShh9C/47shYgEryoWqdZGyK+LdIMFPPGl30
	U7JaS56QiGAtWiN4nbhpYlEWC+o7vfSnCCmufBBAdStzeE7D4V2yps1NRb2d7Wt3SwXn2e4Id21yS
	z1ES4pCA==;
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHM3w-00000000RnJ-3bD3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:04:06 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5bcce71205eso468812e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792073042; x=1792677842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ECSIoPsbBe7MVS/DDfDiHhRGxqZFQJYHVqA1SbJwU1E=;
        b=h5tDw3sNa2EKjy/rQNEAmTzxQP7HEhHAlQ4YiU/TlB66VB67Iu+UhJkuHFULPn/1uG
         6QQ8fEFMIGxMr75cr90V+O5gL42FY5wG3dbQw0e4DQZgIQrHgGrAEkJg5TB2j2cP9Fig
         NyT4qfi3Pxe/Qdr2pi6jcMUpSfUUX29/3ZxiVwoepp0ZVNQ3tEGKubdVwB7PUN/1lbsw
         KC6RqRoPc9+lwbQ5cT8RAq/jjRo/cZhhyvxzD92u96QC9Qz6DzGTJPurocbCO1mXIx6X
         zoD7NmKZ3g8WMd9/UgE+ZxidK/9gGsyj/Jk0J9TI8V28WQ89WjgguJ3v8w/LkGcxE/mX
         R5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073042; x=1792677842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECSIoPsbBe7MVS/DDfDiHhRGxqZFQJYHVqA1SbJwU1E=;
        b=TKREDt1NDIQ37Rap0K13CqSez7ye54En6cZT+TN1NTrS874z8mbuKVNAPOkhTzPqNB
         3ybzgEWpY/9wZtKQwOa4dmawLiSogDE0Ims9NSotIqee0jEX3/evoPamDeDP/Z+SQjRU
         Gd55Aaiy+Ql8OWYLqNr6ZCBwKE8piOo6yGTcYMuOWkXBNFb5U9XcAQiu4wwXD8Cgi4n6
         vQTX94JgUBNXmqudfaEtBOu05eogFuIquhE24jZPcVSGwOg9XRYc9ckY5Z7CwF/co5kb
         JGFlIcEkp7JvR6myjAzoArczM8VkbnfmhXiC/YrV+GELjMczxnLtgymKNuG22Z2l6Eyg
         I5WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpIF5Oq8gX7spwL4B2AX+3oZlbxcZLgYYA3hqWDesnn0ecAzkeiF6hVhXyi4rIRFNcLpPdhEzQyYwGU34RWoiK@lists.infradead.org
X-Gm-Message-State: AFq9FYJvfxo7+cyi4rNwO6NRYMagfW0FhAwkbzYHfXct7sMjsumIVy2N
	oXwYDdVjSuiofjsORdUQxXzaywsB9IiNSr5E+VEyyd6GoGDKGBphMcaezn4DUb4W
X-Gm-Gg: AYBFou3SWQp6dthwoJo0miPLfpMLxO2H6hOKzowpId9W+hb55vB3CyeXjteK3WWSaZb
	imumXH94LcTPBqxxgRy0IdN2Rv+hniHYCc4ujlyx7FWTiawH3qVmdeV7nABWnva1ZhFUTvapJtL
	K0e2CQJ/iqzglwunX0QoujGwQytfmvdauL3dSkb3M5AUATsfhVi3AIQyE9lRnxiExhuDrtao7NT
	PcBdd6Iyw4JrNnH9v7xLLjDoenGC1JOtGu9LZSGjZPmo4neym/2J9cOGIpEr8tKTfhIEElSvBEs
	z3pxViYPR67297q843ZpkSWgzpdKIqPKR3i5E4LJnEQyu4v8esWcRPyBDFZU/rSlhRp/2BoVtcd
	Aou42u2OcCh335R31d//inbnrnG7OepTjBMDZxI+UlIwAJHReD9QtnRGAbcPAJI72oxycLNuPgV
	arVNejhPz1p5vlX7Ub9XLUdZecO53E90xh9KP7oUJrsbahkFXC77sbNSb4ohXILfn2VzDw43ouQ
	fOZUJmfzmyAnr8ukOr5X1pLT9KnkEp167bX1Marm78psYojeUADwSrk5Kfk9iDWG0Q=
X-Received: by 2002:a05:6512:3c9f:b0:5bc:f871:2810 with SMTP id 2adb3069b0e04-5bcf8712b1bmr4822198e87.5.1792073040655;
        Thu, 15 Oct 2026 07:04:00 -0700 (PDT)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-149.paris.inria.fr. [128.93.83.149])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48defca3fd0sm8412267f8f.15.2026.10.15.07.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:03:59 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	netdev@vger.kernel.org (open list:MEDIATEK ETHERNET DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH net-next] net: ethernet: mtk_wed: Fix dma_unmap_single() size
Date: Thu, 15 Oct 2026 16:01:09 +0200
Message-ID: <20261015140110.41988-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_150405_068813_0D013A57 
X-CRM114-Status: GOOD (  13.14  )
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

In mtk_wed_wo_queue_refill(), the entry->buf is DMA mapped with length
q->buf_size which saved in entry->len. However, in mtk_wed_wo_dequeue(),
the same buffer is DMA unmapped with length buf_len which is set to
SKB_WITH_OVERHEAD(q->buf_size).

Change the size to q->buf_size.

This was discovered with static analysis and was only compile-tested.

Fixes: 799684448e3e ("net: ethernet: mtk_wed: introduce wed wo support")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed_wo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.c b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
index 7063c78bd35f..4f720ec53e20 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
@@ -99,7 +99,6 @@ static void *
 mtk_wed_wo_dequeue(struct mtk_wed_wo *wo, struct mtk_wed_wo_queue *q, u32 *len,
 		   bool flush)
 {
-	int buf_len = SKB_WITH_OVERHEAD(q->buf_size);
 	int index = (q->tail + 1) % q->n_desc;
 	struct mtk_wed_wo_queue_entry *entry;
 	struct mtk_wed_wo_queue_desc *desc;
@@ -123,7 +122,7 @@ mtk_wed_wo_dequeue(struct mtk_wed_wo *wo, struct mtk_wed_wo_queue *q, u32 *len,
 		*len = FIELD_GET(MTK_WED_WO_CTL_SD_LEN0,
 				 le32_to_cpu(READ_ONCE(desc->ctrl)));
 	if (buf)
-		dma_unmap_single(wo->hw->dev, entry->addr, buf_len,
+		dma_unmap_single(wo->hw->dev, entry->addr, q->buf_size,
 				 DMA_FROM_DEVICE);
 	entry->buf = NULL;
 
-- 
2.53.0


