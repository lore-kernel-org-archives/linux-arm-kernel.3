Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53388E6ADE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=of66qC7qugkiFYiLOj7X/DHcAAfucvWSwJFAEVz9WNw=; b=jhaSg0w93Yy0rYj1tctZg4Z7Jr
	c2tASBg90lyvAW6Tz7jMoA8dqCYuFx1YICZRwV3VqY23q291fSb1YlDg7IEyLq0rch5K73jjy9iV7
	tvi3E8C3rTONAhvFDx8lK/7qgrVJFODMDuHShtE9oK7uwXOyws0jhk2u3J427WbcRIp+NwJJjgYNn
	WMi81SCRii4nMZ9N12mfmrfoBha53o0PGs6q5zzH2Qrnu0Fq5jS5voPWdGguOJ2tMGE1MDBeupUpu
	LGBnbFcbQc38tS5h0Z0yVbsxAhW7E6U5jvzFOSAQ9Lz806LnHI6Gx6JYNTuxkNHBcoC+xbRAzpB/Z
	2h+H5oHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEkIr-00000003shw-3iUb;
	Sat, 23 Nov 2024 07:11:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEkHu-00000003sb7-1bN6;
	Sat, 23 Nov 2024 07:10:39 +0000
X-UUID: 08a735e8a96a11ef82ff63e91e7eb18c-20241123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=of66qC7qugkiFYiLOj7X/DHcAAfucvWSwJFAEVz9WNw=;
	b=Rol3+5rXBZ3kQSOzhKw9IQbt7Z5T129RQdbhWeZDI6lCDUoW4hDcTjApF1d5baqbz9+LllkFIJa5TTiVBZK1wc0qnyIzlRE8fFe0asXf8PSw1NX6gzO7hs76RYZyMuZxYBck8yFcyKWYwMIqzS5YionQb6qeUUpmLzJ25SR62c0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:074d739a-f8ab-4977-a1c3-b8bbb23a186d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:464815b,CLOUDID:8563aca0-f395-4dfc-8188-ce2682df7fd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 08a735e8a96a11ef82ff63e91e7eb18c-20241123
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1006171550; Sat, 23 Nov 2024 00:10:34 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 23 Nov 2024 15:10:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 23 Nov 2024 15:10:30 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <angelogioacchino.delregno@collabora.com>,
	<matthias.bgg@gmail.com>, <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH] mmc: mtk-sd: Add support for ignoring cmd response CRC
Date: Sat, 23 Nov 2024 15:09:05 +0800
Message-ID: <20241123071006.14294-1-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.109900-8.000000
X-TMASE-MatchedRID: Q3t+gDEGl+H7W7/9wscjdRuZoNKc6pl+ju+GX08gELBKda7Cp9A+Rm7T
	iYn7+ZHjXers26Xj0FAkAzbREWz9m28aeniRmKw1H5YQyOg71ZZMkOX0UoduuQqiCYa6w8tv8rK
	/0wUyv6DwLx34aly34aojHM/WIuK90rly6TajiUnuykw7cfAoIHE01tKb2rARmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1HN3C0owwdL7VUQqweXw1HiKsnV6jwqhAS8V3+ghPHP094nqACUbvaA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.109900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D2E444064FAB0EB55E14C3A892E9AA8715E06345789FCC8F6A380B8EA7050E592000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_231038_563435_96B7CBB0 
X-CRM114-Status: GOOD (  14.92  )
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

The current process flow does not handle MMC requests that are indicated
to ignore the command response CRC. For instance, cmd12 and cmd48 from
mmc_cqe_recovery() are marked to ignore CRC, but they are not matched to
the appropriate response type in msdc_cmd_find_resp(). As a result, they
are defaulted to 'MMC_RSP_NONE', which means no response is expected.

This commit adds a new flag 'MMC_RSP_R1B_NO_CRC' to work alongside the
existing 'MMC_RSP_R1_NO_CRC' for the following process flow. It fixes the
response type setting in msdc_cmd_find_resp() and adds the logic to ignore
CRC in msdc_cmd_done().

Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 11 +++++++++--
 include/linux/mmc/core.h  |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index efb0d2d5716b..5d669f985a82 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1097,11 +1097,13 @@ static inline u32 msdc_cmd_find_resp(struct msdc_host *host,
 	u32 resp;
 
 	switch (mmc_resp_type(cmd)) {
-		/* Actually, R1, R5, R6, R7 are the same */
+	/* Actually, R1, R5, R6, R7 are the same */
 	case MMC_RSP_R1:
+	case MMC_RSP_R1_NO_CRC:
 		resp = 0x1;
 		break;
 	case MMC_RSP_R1B:
+	case MMC_RSP_R1B_NO_CRC:
 		resp = 0x7;
 		break;
 	case MMC_RSP_R2:
@@ -1305,6 +1307,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
 {
 	bool done = false;
 	bool sbc_error;
+	bool ignore_crc = false;
 	unsigned long flags;
 	u32 *rsp;
 
@@ -1329,6 +1332,10 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
 		return true;
 	rsp = cmd->resp;
 
+	if (mmc_resp_type(cmd) == MMC_RSP_R1_NO_CRC ||
+	    mmc_resp_type(cmd) == MMC_RSP_R1B_NO_CRC)
+		ignore_crc = true;
+
 	sdr_clr_bits(host->base + MSDC_INTEN, cmd_ints_mask);
 
 	if (cmd->flags & MMC_RSP_PRESENT) {
@@ -1351,7 +1358,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
 			 * CRC error.
 			 */
 			msdc_reset_hw(host);
-		if (events & MSDC_INT_RSPCRCERR) {
+		if (events & MSDC_INT_RSPCRCERR && !ignore_crc) {
 			cmd->error = -EILSEQ;
 			host->error |= REQ_CMD_EIO;
 		} else if (events & MSDC_INT_CMDTMO) {
diff --git a/include/linux/mmc/core.h b/include/linux/mmc/core.h
index 56972bd78462..076e1c71a07e 100644
--- a/include/linux/mmc/core.h
+++ b/include/linux/mmc/core.h
@@ -66,6 +66,7 @@ struct mmc_command {
 
 /* Can be used by core to poll after switch to MMC HS mode */
 #define MMC_RSP_R1_NO_CRC	(MMC_RSP_PRESENT|MMC_RSP_OPCODE)
+#define MMC_RSP_R1B_NO_CRC	(MMC_RSP_PRESENT|MMC_RSP_OPCODE|MMC_RSP_BUSY)
 
 #define mmc_resp_type(cmd)	((cmd)->flags & (MMC_RSP_PRESENT|MMC_RSP_136|MMC_RSP_CRC|MMC_RSP_BUSY|MMC_RSP_OPCODE))
 
-- 
2.34.1


