Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E37C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byWCGpv2eswc1KL4YyWHR2TlLBP7TgIN2iX0dW1K9Uo=; b=YvOTpXlydInPXJjx2Msq54MP4i
	EakWvBS3bBQXRqo048CgiPcHPkRluOO9xNmwE9w505VS/eyjRCN7yxL2aRVre8N0wq4ILjwuXrG1I
	tu7lh8MzOy3uYtLt/HYvj95LGhC9ycQbMNxXiKqZZb45HVqXcq/uFD1ZxzeAQiVjdyVbzBL0Z+ROJ
	cRYvo3qNrEPFJLDtNkbXxtmpM4O1mJoKyutDTVyNFdm/tiXTp8HOBdzX8JISMmwurSZCxtEP0qhZu
	hrqUlKvX/JXMlvjbwozeRlua/Z7BOWUStZ2o6yWU4D8DDe2aM8E3BazfPW82U2YR/jrFhRZ49uWre
	lhmIE59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeMP-00000004rOG-312y;
	Tue, 28 Jul 2026 09:44:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeMO-00000004rMp-2B8X;
	Tue, 28 Jul 2026 09:44:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C588743E68;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0D6DC2BD00;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785231867;
	bh=iLjI2xGY7aYfQUrOtg9XNfbu0er6ndeZCUjH8cD+5ss=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VrbombCeDQLQbu/xDYXuPjk1selgnO31z1YbUPwcR28stYAdmEm+4fXtWzZAeU2Xt
	 KSftJPay1T44cGD87UQpjz5FLnPKVzDEsT01pLDZ4pbp5dgu1jDdWNQfskGq3e63og
	 KmwMVlzhYvmpkDJ2+wq4bcjmsJ/sdyx5jgNMttpVzSgGBmh6O65lpRCa8xoppahCri
	 SBS6FMdxXPi+PuMPQv10VH0ivygR5K/mWztE/24b/HxOLCOToPxsNuu7XDUdPQBaVX
	 Cjx9CucrF014QhjamN2UALMlodNnIGcUKdm8sZ5hoWFEAd3huJCnZX3b9AsBGO4FSw
	 oy3h3lX2pVPBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813D3C53219;
	Tue, 28 Jul 2026 09:44:27 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 28 Jul 2026 12:42:47 +0300
Subject: [PATCH 2/3] soc: mediatek: cmdq-helper: add legacy GCE ISA support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-6572-gce-v1-2-750bba32689e@protonmail.com>
References: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
In-Reply-To: <20260728-6572-gce-v1-0-750bba32689e@protonmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Houlong Wei <houlong.wei@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785231864; l=3004;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=zZ+T88ouE2HEHrb/+XDv8Cd6G79UZoiQS67bfvvjzg8=;
 b=d+Cfv4lBlSgH8mHhR9Egf7NQmDNkbdPnCidcXHN2SrHTq2hp/DS8z69fXvHB4FeKpiTDq5Jjq
 2o9gl25TkoLAPLvQGia7716wO312VM3cPWmTA/dgRVaX9D1VUMK+Yqv
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Some SoCs, such as mt6572, have different WRITE and POLL instruction
encoding. Instead of 16-bit offset and 8-bit subsystem ID, old GCEs have
22-bit offset and 2-bit subsystem ID.

Extend cmdq_instruction struct with additional union and struct to hold
the legacy format of instruction encoding. Add legacy_isa to select
legacy GCE ISA when writing instruction. Finally, add special handing
for legacy_isa cases.

While mt6572 GCE supports 22-bit offsets, the parameter type for offset
remains 16 bit, because all mt6572 GCE mmsys consumers are in the 0xffff
range.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 55 ++++++++++++++++++++++----------
 include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
 2 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index f8ee6c9ade89..094732405080 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -31,18 +31,27 @@ struct cmdq_instruction {
 		};
 	};
 	union {
-		u16 offset;
-		u16 event;
-		u16 reg_dst;
-	};
-	union {
-		u8 subsys;
 		struct {
-			u8 sop:5;
-			u8 arg_c_t:1;
-			u8 src_t:1;
-			u8 dst_t:1;
-		};
+			union {
+				u16 offset;
+				u16 event;
+				u16 reg_dst;
+			};
+			union {
+				u8 subsys;
+				struct {
+					u8 sop:5;
+					u8 arg_c_t:1;
+					u8 src_t:1;
+					u8 dst_t:1;
+				};
+			};
+		} __packed;
+
+		struct {
+			u32 offset_legacy:22;
+			u32 subsys_legacy:2;
+		} __packed;
 	};
 	u8 op;
 };
@@ -219,10 +228,16 @@ int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
 {
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_WRITE,
-		.value = value,
-		.offset = offset,
-		.subsys = subsys
+		.value = value
 	};
+
+	if (pkt->priv.legacy_isa) {
+		inst.offset_legacy = offset;
+		inst.subsys_legacy = subsys;
+	} else {
+		inst.offset = offset;
+		inst.subsys = subsys;
+	}
 	return cmdq_pkt_append_command(pkt, inst);
 }
 EXPORT_SYMBOL(cmdq_pkt_write);
@@ -459,10 +474,16 @@ int cmdq_pkt_poll(struct cmdq_pkt *pkt, u8 subsys,
 {
 	struct cmdq_instruction inst = {
 		.op = CMDQ_CODE_POLL,
-		.value = value,
-		.offset = offset,
-		.subsys = subsys
+		.value = value
 	};
+
+	if (pkt->priv.legacy_isa) {
+		inst.offset_legacy = offset;
+		inst.subsys_legacy = subsys;
+	} else {
+		inst.offset = offset;
+		inst.subsys = subsys;
+	}
 	return cmdq_pkt_append_command(pkt, inst);
 }
 EXPORT_SYMBOL(cmdq_pkt_poll);
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 07c1bfbdb8c4..9fcebc4ca864 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -72,6 +72,7 @@ struct cmdq_cb_data {
 
 struct cmdq_mbox_priv {
 	u8 shift_pa;
+	bool legacy_isa;
 	dma_addr_t mminfra_offset;
 };
 

-- 
2.54.0



