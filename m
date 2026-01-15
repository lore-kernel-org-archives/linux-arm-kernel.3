Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44FDD3CCB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 06:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Vky4xlT/KdK6YWVitpVisDdHQI89YOi/CFwhM/gHQU=; b=EDpCgY2jByyRnWcZ+Nb1th6XqE
	xs3FwN2+9G1i057l5MzFVD6rImvPhyX3j76ckzAV2VR39bBeNP+/kzLsSCZ4hNN7IEj/cXsQ/Q8iS
	fackaRVnBmYgN1ZJNArIjouqQgXjGGMd/Y+1ixFDvQgDge8drTJjuL3sYfjVYHirC8Voassf+nN/9
	QDW/odHID2OGdPYL+NhFUiDpW1imiR8t+mKtn4GZJyUAqLmCKFaZ6fIzvw1dgGJAQ3wapN+JPpcAj
	Y4S+2nrHV2OVsQnIQAVA7Mb8mzJdXgpkFKDQYQFYwhDK2ax8hLyFCNxXW3kzJywGnFi4mS9LB8OVY
	4uBDuXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgH2R-0000000Brmj-1fP5;
	Thu, 15 Jan 2026 06:40:59 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgH2O-0000000Brm3-2ErQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 06:40:57 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c026e074373so262868a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 22:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768459255; x=1769064055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Vky4xlT/KdK6YWVitpVisDdHQI89YOi/CFwhM/gHQU=;
        b=ZiHTN4SeeY06IxJOLXQ+mSq1p3+BSynKL8uVFZDZQNz8Cf88zWQm0QsPtN0s7v1ds1
         /6eiGE/6aOKMzu9utbQOw5iidxeqZR6n6m6ylDnKUt9g9CyLVRR4KeXsQY5GwAB9oxhD
         HO33bLWvN+7Du6F197iM5ckZwM1Xhu5LSJi/UiLXP5kHqm88HPYAdn6WLu0OlCzmixNF
         ImtTnsfrQSuH1EWXIoyFKCi6YAiK2aHAlkx2yJy9xkJLjvQePCDp+vzNUs0/wq+QJy6L
         rWUp/2GK6bhOW8sFbzG/26w4jHiBnRglRelhEpTgPHSh4RhMCk+EUvZzAr8MAWiZbgkr
         +/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459255; x=1769064055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Vky4xlT/KdK6YWVitpVisDdHQI89YOi/CFwhM/gHQU=;
        b=e9tEdOp2vySZ4Hk4BdzCAfxHYg4X1uLbiPXeXsOv1rYi/ZKYYT6PeW3guVBwy8TzWX
         toFD5E8g1bvgdHERsJydFM0Rdq5L9U0L3pg//sxHDUfoTn2ASuA/fXTAyEZcEt5VdtD9
         0pfm7stONJMLkgbaf31OcnOeXyo6JEyhm+gmjCEwpogheE67tQlzS93BnsvP/FIsKdJf
         8tCxO2cCUXXD6Ba22PmuloLCJxinqrUCWBwNLJpmupjk7h1kACz35TwHtRzBT7S7f0lA
         fwnCYzEFcetWwejPPTz0THy0mL9MGpFMBE5W3Y6TzlU04DV7Ljrl+u3LH2Muv25Gbtvg
         gUEg==
X-Gm-Message-State: AOJu0YwKKE4oQ0UZWIZsysBKMzY/dlGNIi2CUMagckZhrgNF8wUtlsXU
	FqY0tzOvHXWYj2kB6aNK//iuBXdiwmzmsOcscEPQD5glOqJ911t8g5scucWNgQ==
X-Gm-Gg: AY/fxX6geOZpp8hZF7JIltwETAaEciXEffejJx0eBsV2GcynBy6Y6+GpwDx/PA4NJu5
	uEr5sllR8lneTYM2T2/kvuXtT/oLd6D0yzIVsMpNMqyKKw3ntz5Vcf5hzxSTZPX5GpkjBDKH9vo
	uPM1KUnEWilEYLsJhcTXbSKr1LlWL1R5jTrvL7ZC6IMcBGVXMBGPWFxaq7OLdkFOo5Lt0LXZrfP
	Huy2DiU+/3fPiQXve/dZnJAgh7g/tsmrCjtMimQekIqR5T4AgfnL4U7aKogzvFoJc5IvpgU4j62
	BKdlt7yR3JdMYOwPBz9mrM+TS/5GnThNz33WARTZ3wqjJXHw8gK6vmzXPdHCyeABApCHAyA7u+J
	uyRzkvTxmlc81jjIm51KgtLT6Xvy3LGEX5wJra77B2SA/oatp1aTCKIPhxcHMdTrw4Ry+dMfel6
	zP/E3vb01DSVRRWGAdxC2r
X-Received: by 2002:a17:90b:5211:b0:340:b912:536 with SMTP id 98e67ed59e1d1-3510913ea6dmr4852462a91.31.1768459255024;
        Wed, 14 Jan 2026 22:40:55 -0800 (PST)
Received: from nbai25050028.lan ([2409:4090:807d:4601:85d:6566:6475:3c1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc9e7e824sm24129855a12.30.2026.01.14.22.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:40:54 -0800 (PST)
From: Sayantan Nandy <sayantann11@gmail.com>
To: lorenzo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	sayantan.nandy@airoha.com,
	bread.hsu@airoha.com,
	kuldeep.malik@airoha.com,
	aniket.negi@airoha.com,
	Sayantan Nandy <sayantann11@gmail.com>
Subject: [PATCH] net: airoha_eth: increase max MTU to 9220 for DSA jumbo frame support the industry standard for jumbo frame MTU is 9216 bytes. When using DSA sub-system, an extra 4 byte tag is added to each frame. To allow users to set the standard 9216-byte MTU via ifconfig ,increase AIROHA_MAX_MTU to 9220 bytes (9216+4).
Date: Thu, 15 Jan 2026 12:10:43 +0530
Message-ID: <20260115064043.45589-1-sayantann11@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_224056_563933_4F52E344 
X-CRM114-Status: GOOD (  10.64  )
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

This change ensures compatibility with common network equipment and jumbo frame configurations.

Signed-off-by: Sayantan Nandy <sayantann11@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fbbc58133364..20e602d61e61 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -21,7 +21,7 @@
 #define AIROHA_MAX_NUM_IRQ_BANKS	4
 #define AIROHA_MAX_DSA_PORTS		7
 #define AIROHA_MAX_NUM_RSTS		3
-#define AIROHA_MAX_MTU			9216
+#define AIROHA_MAX_MTU			9220
 #define AIROHA_MAX_PACKET_SIZE		2048
 #define AIROHA_NUM_QOS_CHANNELS		4
 #define AIROHA_NUM_QOS_QUEUES		8
-- 
2.43.0


