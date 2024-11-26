Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7F3D3B98C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 12:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddGXrlsNVofZVqtyw9ZyO42fEPecY4EOHW94yOtt3ck=; b=L5VebES7S8S6A7Ce/tUyuDEQQb
	nhIFU3TP34fTAJPG9r7ZFXUX4Nt2isS5aUvDt91cgjGyGsNzxfqzpWR6lLgFakU3wg/U2OEUT0E56
	jtxlDIc9yfrmJCsBI05TRuin8Ox8blY7W/zk5O1PE7qIQdZASZADvPYa7IjruXD25UBEre3+SO2Dk
	u4YUl19Liww9A0HdkFSPOLKEw1mO+hPZKfENKxnpqY3Vg7NimEq0djlFpzSXYVDISka9IEvLzLdtf
	2aKCTso6HOs6NVfOFiNXVHY7SXMypukhFk1bGkhsiu9yyE3N6vq//fPQ28kOpGka3/qfWEn7wbOZT
	JSrR05Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv4j-0000000AcLr-3oGW;
	Tue, 26 Nov 2024 12:53:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFv1v-0000000AbTZ-0XXZ;
	Tue, 26 Nov 2024 12:51:00 +0000
X-UUID: 122d68acabf511ef82ff63e91e7eb18c-20241126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ddGXrlsNVofZVqtyw9ZyO42fEPecY4EOHW94yOtt3ck=;
	b=TTPpw5YIT1xQDTVz3JmLjcgvxakL1CmHl4WC4rUfMOA1IqSq7GRchP+yJsXu+LNR/hrs7lo61E9gShBLsyuDjTBCiL4p3VsquugBmt3JjbiY2SZRd5a47T2HDDcjAstYblMJN28OC3iwiiSZOpYSLskDi8ejI0WOBkJnmIbtAsM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:12968b64-a9bf-419f-83d2-7a1cde17ae41,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:464815b,CLOUDID:4f396cb9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 122d68acabf511ef82ff63e91e7eb18c-20241126
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <andy-ld.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 249743599; Tue, 26 Nov 2024 05:50:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 26 Nov 2024 20:50:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 26 Nov 2024 20:50:49 +0800
From: Andy-ld Lu <andy-ld.lu@mediatek.com>
To: <ulf.hansson@linaro.org>, <angelogioacchino.delregno@collabora.com>,
	<matthias.bgg@gmail.com>, <avri.altman@wdc.com>, <adrian.hunter@intel.com>,
	<wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH v2 2/2] mmc: mtk-sd: Add support for ignoring cmd response CRC
Date: Tue, 26 Nov 2024 20:48:23 +0800
Message-ID: <20241126125041.16071-3-andy-ld.lu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241126125041.16071-1-andy-ld.lu@mediatek.com>
References: <20241126125041.16071-1-andy-ld.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.369700-8.000000
X-TMASE-MatchedRID: yALcya1h5KX7W7/9wscjdRuZoNKc6pl+ju+GX08gELBKda7Cp9A+RkJW
	dVOufBPR/KZpBkEBJHqIY8ivHy/5E6XzgcphDfm8A9lly13c/gHt/okBLaEo+C8zQZ2rR/Op0Fi
	DqDlQgH4SIx4SDL9Y5uuLFZZYlisfHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAUI51nWVDVVfWhFL
	FIsK0Cw+lupQ5Bsw7jcU72BTeNXW5Nk8cAoC9YSLojLyfylXvJqPdSBhdySgg0qsN/ix5JTJi88
	butrgo98jae4OD13tAV7Mc+rowcVKtX/F0pBwVJjSV5hDFby7aUTGVAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.369700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 78C610F20AEBBD1AD5EEE534EEE4D7022F688123028ED1F227EEF820CA4E8EB82000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_045059_167829_B03BE901 
X-CRM114-Status: GOOD (  12.89  )
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

This commit applies the flag 'MMC_RSP_R1B_NO_CRC' to fix the response type
setting in msdc_cmd_find_resp() and adds the logic to ignore CRC in
msdc_cmd_done().

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>
---
 drivers/mmc/host/mtk-sd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index efb0d2d5716b..e2c385853eef 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1097,11 +1097,12 @@ static inline u32 msdc_cmd_find_resp(struct msdc_host *host,
 	u32 resp;
 
 	switch (mmc_resp_type(cmd)) {
-		/* Actually, R1, R5, R6, R7 are the same */
+	/* Actually, R1, R5, R6, R7 are the same */
 	case MMC_RSP_R1:
 		resp = 0x1;
 		break;
 	case MMC_RSP_R1B:
+	case MMC_RSP_R1B_NO_CRC:
 		resp = 0x7;
 		break;
 	case MMC_RSP_R2:
@@ -1351,7 +1352,8 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
 			 * CRC error.
 			 */
 			msdc_reset_hw(host);
-		if (events & MSDC_INT_RSPCRCERR) {
+		if (events & MSDC_INT_RSPCRCERR &&
+		    mmc_resp_type(cmd) != MMC_RSP_R1B_NO_CRC) {
 			cmd->error = -EILSEQ;
 			host->error |= REQ_CMD_EIO;
 		} else if (events & MSDC_INT_CMDTMO) {
-- 
2.46.0


