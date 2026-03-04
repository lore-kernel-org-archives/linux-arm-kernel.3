Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A212AEFCE4D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 23:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S8/7Iq+R5X6wke7kdfyu42X+a9yz8jbqYH+qW9takpM=; b=0E65fZjg+O2Nck0+EDb3f4Oe2D
	LPoUb2SqKeTN1vpH8DOru0kBmXlnbfDrjtLMys8nMFef8vPOayoTdrSrG9IM+8wH3tkYlT1+RykrY
	jKQ6j6Vabtl5t2p0R5OiScf39KbWbxjwZySKFPczvnDlWJLvPBpEFHqoQBlUl9LlIsY/O0qHk92pi
	iG8Ub2+h4O+mZIRi3JQ0PHFQVXmbBiNbSWuLMnxJRvu84E7ampypqlH9CqblqxbC1g8UW4jcCSdsq
	oAhuBktycEBXTU46/7uveuPN0/Wi6OdA7/Zji8SS+e9AHNfWWlsehOM/xOaaFugi9mcOWOpl6w9L6
	K5nidGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvW8-00000000ck7-2WpL;
	Wed, 04 Mar 2026 23:20:36 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvW6-00000000cjR-0tKk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 23:20:35 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8273e0fb87aso4174821b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 15:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772666433; x=1773271233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8/7Iq+R5X6wke7kdfyu42X+a9yz8jbqYH+qW9takpM=;
        b=FjWG0ndLM2cixSo9LkkUdtdgVslSwTjLVe0uZpVq1TjQq8DMldlCMTeD2XsK6v24XH
         RZRMBpZb45bXTA2cgPFCt76ItLDXtW2kuCtK14u+mXDo62+lqJONSn/YnueqlPfpznFm
         ZHdtsqAZqgqW3qvfd4LclIO5xg4W4nIebmcOCQ4LbDHP/mNbkm3NNJoXIhvd6cPHlZ0g
         KH4hKvpB1VHv9xER3zs4uVWnWauJGFhwSnmNq+/XzWB5550Zm8aZtH0RX8Ker4/DNCTb
         A4ID1TcJd5Zt8X4ImdqdpAr2p1D+XMMrvWw0ww8uY2Lgb0LpzmWi9jJ/5txZfFT8mb50
         4xjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772666433; x=1773271233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8/7Iq+R5X6wke7kdfyu42X+a9yz8jbqYH+qW9takpM=;
        b=BP7U8Afe7nKfvrv1xp8U0gV/fZCmJqGp1v+BmpQ+e5OKFgBwYWK/+cINAED+O0gkL6
         rE66++E4L1xHP13ZCz9euPEX11RWLgnL1Ge4498MX38sQ8i1EXcugk9DDQdCI+lbymkc
         YU0JF3MtcSI2JWfXYNy1wuoY4llVun8igdS37bZ6nH3zRToqbsbphPbZkhhwYFoZCRbe
         ldCOibFa1k2TcQhM5EddXasFM7SrF6b9hjPgcjg/3mtQ1ZljRnvYjnafHCWXSTzNqXz9
         7ZdtpNoqdHVkdiTghEDlnwNiEqtOd40vgsRxgyX+x2GtNUZjLi6H2RfASVRpcYYbLEC6
         lycQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTQjY6WZkXugOrjBSAiQV32dGIc3kAkQGN6KTkNcPOFgWTkGlVKYAbTru9l4DXtqFVR46ZqZ/FCxxOyjJVzhVG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz56KxLYXhkn9s40AkkoHIBvXgFs52dCtdE09uZTAnr67a2efk
	VZaYKh06U7uX7BLL4lQTfIn7P+R6C9wJzuW+mTkeqaOVEaF/Ztpwg+60
X-Gm-Gg: ATEYQzyJLREXFUwxFPwRB/PcTwBiZeQx9S+BSJhKWFsshvF1khjaBuSHr3hcIK71C3/
	cEJTboojKA+9GHZQ3vyr8pTAhOH3AqcTEbY/UT8saXOwV39p35jbqRcCj7Mvioggs9II7wd+Jco
	xMba3fjVxlycm9C0t9aYzsc4/ojL8EjB4qI9IGcnm5Y6j0sI48pjnZ2QMTEsZwEO/aybJfI/trB
	w69AT51184YiRWmgRQBGa960tYchw17NvyYAWMdKsWWj3zn3sfxvyaCjbq9WooAQhIqfL2iRSNf
	5c0Vaqaf3m2GqtPKd/X48ol9UKSq8tBGQURg33+jUkht8TBZ1PoXIi+q/MZ1/GyVLoQnG/cjtUx
	46egAATf2omvas5wELn/HVMP4k67V9LEjjO20Op6hROy2kzlXhju2jBQXjdJ+Mla5nXLHJRA4HV
	tZuZ8deTWtgajhsQDuJ9i98pBkT3Bi+KF94h7m8cH0Q9KnECNIDsMxtQ==
X-Received: by 2002:a05:6a00:1c98:b0:827:2eff:a29e with SMTP id d2e1a72fcca58-82972c655e8mr3140323b3a.34.1772666433049;
        Wed, 04 Mar 2026 15:20:33 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d544ffsm19730769b3a.12.2026.03.04.15.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:20:31 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] soc: mediatek: mtk-dvfsrc: use flex array
Date: Wed,  4 Mar 2026 15:20:14 -0800
Message-ID: <20260304232014.164408-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_152034_312374_E0CCC55E 
X-CRM114-Status: GOOD (  13.30  )
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

Simplifies allocation from kzalloc + kcaloc to one allocation.

Allows extra runtime analysis with __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 548a28f50242..48b1fcf3e101 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -71,8 +71,8 @@ struct dvfsrc_opp {
 };
 
 struct dvfsrc_opp_desc {
-	const struct dvfsrc_opp *opps;
 	u32 num_opp;
+	struct dvfsrc_opp opps[] __counted_by(num_opp);
 };
 
 struct dvfsrc_soc_data;
@@ -489,7 +489,6 @@ static u32 dvfsrc_get_opp_gear(struct mtk_dvfsrc *dvfsrc, u8 level)
 
 static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsrc *dvfsrc)
 {
-	struct dvfsrc_opp *dvfsrc_opps;
 	struct dvfsrc_opp_desc *desc;
 	u32 num_opps, gear_info;
 	u8 num_vcore, num_dram;
@@ -520,24 +519,19 @@ static int dvfsrc_get_hw_opps_v4(struct mtk_dvfsrc *dvfsrc)
 		 num_opps, num_vcore, num_dram, num_emi);
 
 	/* Allocate everything now as anything else after that cannot fail */
-	desc = devm_kzalloc(dvfsrc->dev, sizeof(*desc), GFP_KERNEL);
+	desc = devm_kzalloc(dvfsrc->dev, struct_size(desc, opps, num_ops + 1), GFP_KERNEL);
 	if (!desc)
 		return -ENOMEM;
 
-	dvfsrc_opps = devm_kcalloc(dvfsrc->dev, num_opps + 1,
-				   sizeof(*dvfsrc_opps), GFP_KERNEL);
-	if (!dvfsrc_opps)
-		return -ENOMEM;
+	desc->num_opp = num_opps + 1;
 
 	/* Read the OPP table gear indices */
 	for (i = 0; i <= num_opps; i++) {
 		gear_info = dvfsrc_get_opp_gear(dvfsrc, num_opps - i);
-		dvfsrc_opps[i].vcore_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_VCORE, gear_info);
-		dvfsrc_opps[i].dram_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_DRAM, gear_info);
-		dvfsrc_opps[i].emi_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_EMI, gear_info);
+		desc->opps[i].vcore_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_VCORE, gear_info);
+		desc->opps[i].dram_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_DRAM, gear_info);
+		desc->opps[i].emi_opp = FIELD_GET(DVFSRC_V4_GEAR_INFO_EMI, gear_info);
 	};
-	desc->num_opp = num_opps + 1;
-	desc->opps = dvfsrc_opps;
 
 	/* Assign to main structure now that everything is done! */
 	dvfsrc->curr_opps = desc;
-- 
2.53.0


