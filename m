Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC67FEE4F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 19:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FQMm92FyAQJT+uBQvsnjueB09ZieXbwDxF1QO9oPOOM=; b=MYB1x6kR7OTeKKqScLcHz2YyCv
	F4mJYnBfADtLtdurBP0uopFC0KDN03OBJq/ti44VPqtQDbIL8gjjBm1X4NA2TcdHm3vMoY4RfnAEC
	6tjIrjfORhN93cQAG/kj+LrbgWlCOx964PR0rNVFRNR4VWV8A2HqWEZJZZzeKWyS8XhN3X4KLCS7W
	0nL2xhdewS/gdT/j6AOcnP+cUgyZ9VgB87e/zNWsFFgII+Apoiq8DNKrDOkm39cAksaApXCUKWClQ
	TmGhRUJniFWYvQEi5noX1ZMgMIm/MfKErthI8mokHIqKCF7e4Dtz7VzfM8oz6oI8U0CxKcVG+0Ido
	XAImI54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwPgT-0000000ABGT-3v7y;
	Sat, 28 Feb 2026 19:09:01 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwPgQ-0000000ABFX-3PRE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 19:09:01 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso1807284a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 11:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772305738; x=1772910538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FQMm92FyAQJT+uBQvsnjueB09ZieXbwDxF1QO9oPOOM=;
        b=Rg7rcrILzOsTVQ1GknSs+Qz24Bdbnh34m1mLN+/JupsQZfaaO07Tqth+vienf5Io+F
         zHuPt8FsxfDACPPDjVcMhW3bHKSIDaZ/2OmTDXCvs9YVFrW1zBL5uhqThiqUms9N0JHi
         Y1HZMwS7uGy+Gr18KCm41fKJqt1jO/2zyH8L5VeSjzOE9RV08ai2J/TB7av/6VWqElcQ
         8DPcjV2HS5p99rOGmb6aGcSTNfbsG9bO8L3RMEIb7lhmLvUadB4oLt7ZyL8kb//vcpVl
         xKqXGurckC7yIeGcmdCGqXoiXYBexQZVlWbP660VT+O4oT485R3eFTciH+3q70J3d7On
         nToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772305738; x=1772910538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQMm92FyAQJT+uBQvsnjueB09ZieXbwDxF1QO9oPOOM=;
        b=fLX+BMhBPF53pIaRAhGbhbwpqYZPspX+wGAgsXUxFO5Rs9Wefxu21ameffdjutISwI
         U+tcLFIFwFMYcp0mwaCztPx/3u2JS9Yqx9wIE+IC5Jh6HKl6UKUrGB7bw+1D79eo0Kur
         yHWJ5Ce03fp66XEzVPn3GC0S7vS7NK7L/3I8mJA28QCgliYYqzNvZrZMwMrv7maAZGFT
         V4xIqJS7r6qyY8QOp1+Rh821XMbe4O8d+kkeQjsdIUhOK7iNoV/3qLg5QKKgrRRnKVoS
         hgUbBm8QI8PKnwvy73J0PLCqfbgFb1YyYe/MBDr22DP9hm+MMTb+vGVpe+hX5OgGfBtW
         FZRg==
X-Forwarded-Encrypted: i=1; AJvYcCXoXgIBloSqcBESzsbGdsTW8H/4oZdX4yx+EaBwLPn+/z9GjJkq1rLFpJjDcOr/xbYX+t2N+yUpkB5Rulpc8joG@lists.infradead.org
X-Gm-Message-State: AOJu0YzFPWFfAvoclxSuoTVG+m7HHFHHxwPCclmFxPpJkKGya8MlKeMQ
	+PjGvcFF7BupKS+H1+oOTJPQrpw6R5pTmcHFT5q7ehfglLDIVbM63AAI
X-Gm-Gg: ATEYQzzugxpxLAohQv/I2ZBeWOKbNorVGiygoZNVSnJ2KV0IFvVucndOSuAOqSPD6hW
	xDeuMoS/YMHU2zCOuoWqrkDiACT/tW9VhfLXvH6Ez465YYmWqAfW4bo4rBFRCQ3sBXUpjAeJ0HR
	p+HzygpvsOg46Fgs0b3lrluyjpSg9+zoWpAiL8zzZsavQORrBhV0MI+BLrdho9wMAZCMaYA58cz
	gxsvundSGD2OOhI3A2dBX8MQZLwsFSTvNm/xDdE5RMSxmNuvd9v8QSmBKliVKYP2yfwuEQ7L1fk
	fBoAi+6iOhwrkA2KGoCZvWpnDwJjYL67IuDGuEeSw2uLJcktV+OHH0HN5FqY8i66bM9TSkKZ2jG
	nyzJRya3B1OWoqlGNS0NETLI7+XieZL5fZzX0z4aSZo0zDun30OwIpB+PjuiRrVt4q5/3hKLBcI
	QNgxOkK8OmcGRs0YUYra2ZRhrjgRgNj5aRB7xWNVUQFj54vpZdaFT7xg+JQqlT4cC04jR7+y4PS
	kIQRFw=
X-Received: by 2002:a17:90b:3c4b:b0:349:3fe8:170d with SMTP id 98e67ed59e1d1-35965c24309mr6728918a91.3.1772305737797;
        Sat, 28 Feb 2026 11:08:57 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359037af175sm11303251a91.13.2026.02.28.11.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 11:08:57 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: lee@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	akkun11.open@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	y.oudjana@protonmail.com
Subject: [PATCH] mfd: mt6397: Properly fix CID of MT6328, MT6331 and MT6332
Date: Sun,  1 Mar 2026 04:08:20 +0900
Message-ID: <20260228190820.357538-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_110859_122404_AF02C5ED 
X-CRM114-Status: GOOD (  13.51  )
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

CIDs set for MT6328, MT6331 and MT6332 are not appropriate.
Many Android downstream kernels define CID as below,

MT6328:

    #define PMIC6328_E1_CID_CODE    0x2810
    #define PMIC6328_E2_CID_CODE    0x2820
    #define PMIC6328_E3_CID_CODE    0x2830

MT6331/MT6332:

    #define PMIC6331_E1_CID_CODE    0x3110
    #define PMIC6331_E2_CID_CODE    0x3120
    #define PMIC6331_E3_CID_CODE    0x3130

    #define PMIC6332_E1_CID_CODE    0x3210
    #define PMIC6332_E2_CID_CODE    0x3220
    #define PMIC6332_E3_CID_CODE    0x3230

The current configuration incorrectly uses the revision code as the CID.
Therefore, the driver cannot detect the same PMIC of different revisions.
(E1/E2 for MT6328, E1/E3 for MT6331/MT6332)
Based on these, the CID of MT6328, MT6331 and MT6332 should be corrected.

Additionally, the incorrect MT6331/MT6332 CID overlaps with the MT6320's
actual CID:

    #define PMIC6320_E1_CID_CODE    0x1020
    #define PMIC6320_E2_CID_CODE    0x2020

This causes a conflict in the switch-case statement of mt6397-irq.c,
this prevents adding support for MT6320.

Link: https://github.com/parthibx24/android_kernel_mediatek_k35/blob/4853d1fd9e40563573fa6d6b32b75d571a95e2b7/drivers/misc/mediatek/power/mt6735/pmic.h#L10-L12
Link: https://github.com/meizuosc/m75/blob/80ef1d26c5d73e131d064138ed09ff5a2be2bed8/mediatek/platform/mt6595/kernel/core/include/mach/pmic_mt6331_6332_sw.h#L9-L15
Link: https://github.com/toffyjan/android_Ticwatch_S_mooneye/blob/4f2a73b26f3821afc452cdce660cdbc73daf4e4a/arch/arm/mach-mt2601/include/mach/pmic_mt6320_sw.h#L29-L30
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/mfd/mt6397-core.c       | 4 ++--
 include/linux/mfd/mt6397/core.h | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 3e58d0764c7e..1bdacda9a933 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -297,7 +297,7 @@ static const struct chip_data mt6323_core = {
 
 static const struct chip_data mt6328_core = {
 	.cid_addr = MT6328_HWCID,
-	.cid_shift = 0,
+	.cid_shift = 8,
 	.cells = mt6328_devs,
 	.cell_size = ARRAY_SIZE(mt6328_devs),
 	.irq_init = mt6397_irq_init,
@@ -313,7 +313,7 @@ static const struct chip_data mt6357_core = {
 
 static const struct chip_data mt6331_mt6332_core = {
 	.cid_addr = MT6331_HWCID,
-	.cid_shift = 0,
+	.cid_shift = 8,
 	.cells = mt6331_mt6332_devs,
 	.cell_size = ARRAY_SIZE(mt6331_mt6332_devs),
 	.irq_init = mt6397_irq_init,
diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
index b774c3a4bb62..340fc72e22aa 100644
--- a/include/linux/mfd/mt6397/core.h
+++ b/include/linux/mfd/mt6397/core.h
@@ -12,9 +12,9 @@
 
 enum chip_id {
 	MT6323_CHIP_ID = 0x23,
-	MT6328_CHIP_ID = 0x30,
-	MT6331_CHIP_ID = 0x20,
-	MT6332_CHIP_ID = 0x20,
+	MT6328_CHIP_ID = 0x28,
+	MT6331_CHIP_ID = 0x31,
+	MT6332_CHIP_ID = 0x32,
 	MT6357_CHIP_ID = 0x57,
 	MT6358_CHIP_ID = 0x58,
 	MT6359_CHIP_ID = 0x59,
-- 
2.52.0


