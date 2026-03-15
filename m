Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D31F30282
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 20:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CPceeNJxYcOrj32GCH9mA8vAA8Kap02ECqmiWtmSPh4=; b=RMCgIkOcYREm+4hxvjLPkDwb2K
	wOA7dfBg8dxvgIssh5dvTt+3QP6v/eMDZtjB+63ofECYIEzIeipGKBTxKx/3w4bts/KDKQ2Bpzc0t
	4Bf3BGTnPYL1G5EYwWAo0aF7wp8+5iJe56FC+k7X91z78Dtt0kfKy4VUSVdFG4r7QXvWnv8gtbAtp
	4EWIJL62X4Qrat7jhg2Vxb97uHO88s2pgyIFbCeOCf1lNhCq6Vn6ElLytQsmj+AcbtkdjC+aTeJQH
	YGPXUxbjQstxX4I9gZnPpxiQLM/90EURlxOJS7Kr7dYO0ZWpQwvIILEEbDWnNp7V22T9nldvdY6DQ
	IbWdwEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1rvT-00000002tTu-2xn5;
	Sun, 15 Mar 2026 20:19:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1rvR-00000002tTY-3Fhq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 20:19:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43b40003d13so462103f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 13:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773605940; x=1774210740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CPceeNJxYcOrj32GCH9mA8vAA8Kap02ECqmiWtmSPh4=;
        b=NAhFectuHVI+rN+t371KNO+e/yNdPZg8y79vtu/NoaZYLU9rV/aREoFr4zaew7Iskz
         z098eqBeuCVO2ZEpZcYE7hcDswfgwMRvgKAqRZvcRBYDr/Eo2VOD6utpdxc0mEsMkNLw
         zC+7xin5vkozFIbZw2qqXzdnX5M2Lw1/XHfv2tPiOCKoO+S/shAx17JfSiXzO4N96ZCB
         MotDhUqgkDVBuxIbZYuvpmFd2ln0omRzxKGocFw7AFRROHkLpZMXS4jvQ46sE81xYV9U
         q0AZWvQXmPCT7mDpQMfnyet3Ucn9Ngu/DGr9ksE/Vpwxy8c6b5hFNl7eOAnhTMpQrCaz
         ad8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773605940; x=1774210740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPceeNJxYcOrj32GCH9mA8vAA8Kap02ECqmiWtmSPh4=;
        b=VMBqR/KBjTjSaPzEg9jKMenh8KQen8lEXF3t7ouYMzA+gLTfCS3zOX/hCODGIjY822
         Jhdv9kuHG4NgxYgbNC/VUFJBzbO5ntlnKuT8mC+TvYBxf6HCGFzMszWgsEEcuFNFtYJW
         NiYoHTnbsFk672iUM8zmJHjJoK1ilF8cfHTBEvPR1cRJhrubhI638QULKcA0zt0HErYk
         SUipU3pUQGNHgQaPfFXRN4XFdxrpD3bqL+Llx2eVQ+TwH8DGRgb6Ow3bLdHVsMPkvLFj
         lVJKqo+4wbZ2LTvA0MUgxeTBxQKt2n6WV/w6YLirECKLDtwKM5/fFjynVo4jFRmko3Sw
         smdA==
X-Forwarded-Encrypted: i=1; AJvYcCWr9WrpYusHwafuA6xt2SsCpvL+o5lkYwmkJTN05aklP+lGcN9SAYq1qG1iXpsuzghUjTZzv/C3USshqW9EC+fU@lists.infradead.org
X-Gm-Message-State: AOJu0YzQo3t6KD+Ultf0HWGz95kmGF3WjnKhf2pKN6gxzuFpSiSF8nEZ
	3lbSN9iahylpS4GoF0gayUs0CPZzGkCdH2fvyV+720UW8F+NNPtuthB6
X-Gm-Gg: ATEYQzwqGgaHuZDA7IPVXBVpqZbBsI1x3U4j0UeXlwzzhxHwYbdhACpcUP3IqwuLiC5
	qPqrZU5SUF+FSGCRxb4tO1MIld+VvL0i4gWA3iaYtTWILTU8odAyJmFWhPUHRtsx5wJ1jQfWWBX
	ZDmPz9MElPHKSgyGSzASa0tAUpMttSbz0Svp/kIW/JL21gJNkN/Nj2FcTJT1Z1ZCxO2wZMj+Jnr
	hxHMXTNMdaz59ULOIogyTrFQarulom2yN/dyECXDPRoLg9Eq8Oj2okCd3vyTGb7bivhq58eXkPU
	YvRfWCwCPqv+jAAVojXnR9QGAWgzeVfmf+crhyqUAF8iPAvs/V7bPO6lo4f9P88qBeh3xFjYS8I
	m6IvGfcbYqIBkCbDetbjaIYyUjh0xQ8BsP3T9EI0Mdn8PfdUjmx/pplPgWNWt5COIMppubAXS6A
	yeAak4aT+GaeM7Ay8EMsSFe48HsOTE6HRhPw==
X-Received: by 2002:a05:6000:26d1:b0:439:d750:42f6 with SMTP id ffacd0b85a97d-43a04d8b557mr19733952f8f.24.1773605939326;
        Sun, 15 Mar 2026 13:18:59 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4389321csm3295618f8f.29.2026.03.15.13.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:18:58 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH v3 3/3] mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
Date: Sun, 15 Mar 2026 21:17:31 +0100
Message-ID: <20260315201853.15552-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_131901_833367_2115CA28 
X-CRM114-Status: GOOD (  13.46  )
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

Consolidate esdhc_imx25 and esdhc_imx35 soc data into a single shared
struct since they share the same flags. This reduces redundancy. Also
add the CID_MANFID_KINGSTON definition to quirks.h for centralized
management.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 drivers/mmc/core/quirks.h          |  4 ++++
 drivers/mmc/host/sdhci-esdhc-imx.c | 12 ++++--------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/core/quirks.h b/drivers/mmc/core/quirks.h
index c417ed34c..d736bb4be 100644
--- a/drivers/mmc/core/quirks.h
+++ b/drivers/mmc/core/quirks.h
@@ -15,6 +15,10 @@
 
 #include "card.h"
 
+#ifndef CID_MANFID_KINGSTON
+#define CID_MANFID_KINGSTON	0x70
+#endif
+
 static const struct mmc_fixup __maybe_unused mmc_sd_fixups[] = {
 	/*
 	 * Kingston Canvas Go! Plus microSD cards never finish SD cache flush.
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index a7a5df673..9cfa26722 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -256,11 +256,7 @@ struct esdhc_soc_data {
 	u32 quirks;
 };
 
-static const struct esdhc_soc_data esdhc_imx25_data = {
-	.flags = ESDHC_FLAG_ERR004536,
-};
-
-static const struct esdhc_soc_data esdhc_imx35_data = {
+static const struct esdhc_soc_data esdhc_imx25_35_data = {
 	.flags = ESDHC_FLAG_ERR004536,
 };
 
@@ -391,8 +387,8 @@ struct pltfm_imx_data {
 };
 
 static const struct of_device_id imx_esdhc_dt_ids[] = {
-	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_data, },
-	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx35_data, },
+	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_35_data, },
+	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx25_35_data, },
 	{ .compatible = "fsl,imx51-esdhc", .data = &esdhc_imx51_data, },
 	{ .compatible = "fsl,imx53-esdhc", .data = &esdhc_imx53_data, },
 	{ .compatible = "fsl,imx6sx-usdhc", .data = &usdhc_imx6sx_data, },
@@ -414,7 +410,7 @@ MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
 
 static inline int is_imx25_esdhc(struct pltfm_imx_data *data)
 {
-	return data->socdata == &esdhc_imx25_data;
+	return data->socdata == &esdhc_imx25_35_data;
 }
 
 static inline int is_imx53_esdhc(struct pltfm_imx_data *data)
-- 
2.47.3


