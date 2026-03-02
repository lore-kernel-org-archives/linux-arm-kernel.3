Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF24EA4E07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 14:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BpP3A8r/Zsel4oeQ6sBuhbmtBjglFyQ+KJoiCGZoZ0=; b=QSFWn+/nFCFiDozVoqhHxT07Wy
	BXd1CMs2KGarPlliRK2p63SKqDuftmMKhHnOrtVPD8dEz0xbRtYrYh8i2Ft8iryCFS64ZbNYPI2+/
	/xqBGgAE5hSOGc7UdHyozv0oPaBmdv9bD7gVh8dbb+7JxPTscP/RB8KuQqI/XdtuzmSD6ZeqvdI6l
	CwRGicYTTqPfoN/XZ207Zevthl/PJH5uvkVVrvZTsJP+8pm6VtTIW9DcOoywOH2hFCg/TKw3JAkIH
	fkG1k9alKWBTDCxZ5PTDENoKlFdZTUbhCWlZ4CqEyu+3UdbHyDXmvou7Pykh7R491C5E83ygvw71z
	1TR3dWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3q5-0000000DC6s-1Sij;
	Mon, 02 Mar 2026 14:01:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3q2-0000000DC60-3p2y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 14:01:36 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3598b2318c2so617071a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 06:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772460093; x=1773064893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BpP3A8r/Zsel4oeQ6sBuhbmtBjglFyQ+KJoiCGZoZ0=;
        b=AokUtbkbOUG9HVaks5TX/6h+6pfcLQ72Kkta3/bnBCiJlZ3Xqdm9kEn1fDZ9XJyhPG
         rD8GBf+i6Vu4hsBCP2n54KYyDYlgf6kGQLO8H0eTqANZxyK/k5PBWA1VeGbpIw7Lvp1N
         Ov+gOdlFJwULPdM3T5pl01YXZN5FB0Hwpc9R5G3hzDm2oxY1k4gCc5Aqr0NUlVjI1Iz7
         2lmehPE1zaEikmCRr/S/JUavLb0t4JhWFxiCrPHngFQ1XNS4AbK+ix+vle8zr5Oqnxij
         JC4MCYOYmC3aWO2mV2W2F1yN3v1UaEFTsoLOpOfBV1oxLhdUkNNhO3euO1d54l98xGnh
         7Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772460093; x=1773064893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+BpP3A8r/Zsel4oeQ6sBuhbmtBjglFyQ+KJoiCGZoZ0=;
        b=OfOlo/atsJiA9G7SIbY0OdIhP+HQmBJS1L1Mas5oNRRLhmOK0/bJ+kQlWg8pG6pmmO
         BgSt8IJsybyRmbK7n82elizzO7WiU6Vuyvxz0N9IdX5TYJyjqRkGQRjgUSjh2g3RbvNP
         oaI18GpHVjL/GNl0zDpe2eMN5smlzSlSdulZVe5VU0FXDbITcItmy+xDwsvCG12XI5mS
         R+YUFtSGvAhxuy2BPUFk/o8sFI5QPZ4Zp8uoC80ZbAU1A9uDDJI7EOPP7hsG6ZrGqLbX
         kagSYu/mJSeYeqNr1WnA9VvYcb4uUFqymZBeFr/og7IJZOle+/NcIennyxJzMa+m3raz
         KEUw==
X-Forwarded-Encrypted: i=1; AJvYcCVuSqGIh8oCw0fUlEunj+azDkgbHkG6EhLvzXwz9YUkc3Gh0EI1sVfCNV4Mdy1NfyQNX1bv1dRZx5llFjyGqWke@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx9BpeSJt47tWSV8lOjP4JwQxlt8BWhsnIpq79kFzTy7Kv/Uuo
	hFgKRPM91O5c6D4HILIASR5bL/1xxa4c4SLAa2Lg+tzXzAC6oKuLuq7H
X-Gm-Gg: ATEYQzxLB6RTCw+J9mvS51NpK3SjPkahFoXwo2vouZ6HKbVkZGiRvu0/cEe7WD0FHFm
	p0ofwiZWQ11cQjN+nQwdvOUz2h7x6ZDgWORR2zp6IHIaJeq+7LRJOQcWKgi96gB+FtQPscdaCJE
	hJFNTb39MTQyGeKCkTcd+DSEkZKmcxGYiY4dNd4EdPGvu/rAR9ji6uOcvyH9Cvr+L19OIH3fO9D
	gVPqNP4j3CtWvh826IlZ8chegL7QkUGAoxIfmw1HoOPU3v1KCLD+VocPrSkavxHKbB5FuaVFgiw
	hDkkBmBk2D6+WQwqnf0KxcTa+NIB/AfOeyBwpckMgp0WdFYVvp+wNPShtmYqZOOha+SOwUySg8G
	dqpCZMOYMJnJo0e0KVHczg5xLI/06Q9beKz61QSP3os5N0Th6a1Ada71Talw85sK6XzE9F20PhC
	iJDkk4QcKI2VL9gc0y0GfDyIijLGmzLPtvOl/TsnAZV7ktf5ZeyTNa87eY+HEUmFutmJlPAcTFT
	wjMcyJJRU94QfPlCQ==
X-Received: by 2002:a17:90b:5550:b0:359:8c21:ef46 with SMTP id 98e67ed59e1d1-3598c21f117mr3504906a91.13.1772460090604;
        Mon, 02 Mar 2026 06:01:30 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3598d0b793bsm3330283a91.4.2026.03.02.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 06:01:29 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: lee@kernel.org
Cc: matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	y.oudjana@protonmail.com,
	angelogioacchino.delregno@collabora.com,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2] mfd: mt6397: Properly fix CID of MT6328, MT6331 and MT6332
Date: Mon,  2 Mar 2026 23:00:45 +0900
Message-ID: <20260302140045.651727-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260228190820.357538-1-akkun11.open@gmail.com>
References: <20260228190820.357538-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_060135_083831_54AA580A 
X-CRM114-Status: GOOD (  14.93  )
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

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes in v2:
- Remove GitHub links from the commit message as they may become invalid. (Requested by Angelo)
- Add Reviewed-by tag.
- No code changes.

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


