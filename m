Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85235C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWTKjOPYHYbBCUgjwCQAeP5e/oUzLq3t7mP4ZZ5O21s=; b=GjaLmqBcds3T5D/9Ce2suRzkwg
	ZlxK1KLG9YB6oDtKhVIKyElDuIigngh36RUmcM5pLymVZhv8ZY6oX2eMUXg8ocKu/Rm0ouGHuX6F7
	9BA84cjpaPlfzELFWk9ND/IfOYRLGIbItrZ5mj2HtHBC5a3f7HubRbNcTMm9WhngYzi/YzUIJsF4r
	EN2W5aVORYnFeUSST0setYRBtDzjVewOIpvdhdrcxU9dWKMldASte8yBG9fwZrAZ0nbxfSKcsNJ0H
	9AjB5I86SiWLiSUj33Wh+5h3QSHSbnOPM6ZuurUdP0sHON5WYw1dyayGL1fJoxjNgiXDdt6aK4oRi
	XrvbGVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPio-00000005aNY-1XWG;
	Wed, 26 Feb 2025 22:17:42 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPW0-00000005Y9W-0aCN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 22:04:29 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-220d132f16dso3394005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 14:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607467; x=1741212267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWTKjOPYHYbBCUgjwCQAeP5e/oUzLq3t7mP4ZZ5O21s=;
        b=Wngst1qaazk8U6+HiT9PSegZKLZf+IOyJ+bQbDI4DdVv3/TQUFMvE9ztGXepElQZVv
         kUeHrmiR9nYQgG9xoyRjZjKA1ZOeMTWx67e4S6VRpBLO5L40y90ZusYmpHvM+l00tfyS
         buk1Ty5j2xDaE3CBdnxvBjVCJO1+uxkhaInxQmwHroP2d6F87IHvB04DdWiWKcwRRgJe
         tqoE0mMuz+g+Wr1Zap+H/pnbazWLgp4LQvmGln+cRG2rPryxtT2u4NZURfArn93AHefM
         45eQ5l8cGmx+X/Tu/oMp6N709Gej3eUFaO7ZAguCR4Gu3glFyscaZWul6Ov/ZppFKMr9
         cqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607467; x=1741212267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWTKjOPYHYbBCUgjwCQAeP5e/oUzLq3t7mP4ZZ5O21s=;
        b=rFjWQvS66C5E6ol2dDa0ScAGL5U5er7SXkKw3olwsEk2Kd7n19PMRgjorjbRhhmN9J
         FiJuqb/+iGhEIMVc8g2vtUV2Ipa8h24y/JmnOn3fFUVYWkvO6Nli8Jbl3rMT5bHW77gB
         NSQAZW/8QRVRayUW+reDnv+EZd1camNRoqLAm1gYNyf06at1aJGluhA5UVp8qvDi3VfL
         eLbL+KIuDF0tE9hIAL/GHi+nxgoQKjcGelvGXbwVEwo+CwniHQ6E0cKK717KcIsMuoU5
         1je37PKrEjWzgha3HSBkc2Jj/2tx83wylUJTdBTYM5AoLn2BleZrSfTCcHF8gAwAJVvK
         bvKw==
X-Forwarded-Encrypted: i=1; AJvYcCU89v8/ojLqQsCoDM0G9+zoew31cnuZEiJHYi57RRN02Hc6+7qts3cBSfsa8xwuRmBN81Tkp/rtZLIUEgLFZulM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj98lvhLu4ntCCcaYjcMjYTheh/v+k9I9AUZAFMNDZNGDYLn2H
	gj62IVN7w0R4URrjVRoreOvFroL9HPtHi2JZ+kRojiX/H6FH57c3h37TwbQATbY=
X-Gm-Gg: ASbGncsFA/qaJvmNDVtCWTwcQGco3Ul7goRuP4f0ET/rfFXOTpm66fH2onRLcELe4ju
	IPlOdeyhDUHgIuiNdMhHYKwe+f2ZYBRVUXH1nElK0mk1EdK8Smhm+QhBBRQiHZgA9z7xLyTVGqO
	kCdKn3WH7yhQ5awAiUYAEj4M8nLJx8z46Eb8Igldy0ngN3p1v7TIHS00YvhjP+2p/AJNiI7oqrS
	ahl3q0IemzVbh7dSdX+XS6J5p/g4ITPc1QOHaobZo2LRjzcTtmnC6lhzAo+vAc6eoxX7l+JFyPW
	HwCgrmOpfVqfMY+CPByUe67a2xy48upoB9pEdKbee9dcJAHYGblAlNRm
X-Google-Smtp-Source: AGHT+IGCx2oLKcB5bpzVlnTDWzwAr4Blf9QYoJQocatHQosYv1is1Be436vWJXS8IWNGbLlM5P64xQ==
X-Received: by 2002:a17:902:dac5:b0:220:d439:2485 with SMTP id d9443c01a7336-22320094d51mr69995645ad.29.1740607467660;
        Wed, 26 Feb 2025 14:04:27 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:27 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	krzk@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	ebiggers@kernel.org,
	bvanassche@acm.org,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 4/6] scsi: ufs: exynos: Enable PRDT pre-fetching with UFSHCD_CAP_CRYPTO
Date: Wed, 26 Feb 2025 22:04:12 +0000
Message-ID: <20250226220414.343659-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250226220414.343659-1-peter.griffin@linaro.org>
References: <20250226220414.343659-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_140428_177055_D358C78C 
X-CRM114-Status: GOOD (  10.95  )
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

PRDT_PREFETCH_ENABLE[31] bit should be set when desctype field of
fmpsecurity0 register is type2 (double file encryption) or type3
(file and disk excryption). Setting this bit enables PRDT
pre-fetching on both TXPRDT and RXPRDT.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 943cea569f66..27eb360458a7 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1098,12 +1098,17 @@ static int exynos_ufs_post_link(struct ufs_hba *hba)
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 	struct phy *generic_phy = ufs->phy;
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
+	u32 val = ilog2(DATA_UNIT_SIZE);
 
 	exynos_ufs_establish_connt(ufs);
 	exynos_ufs_fit_aggr_timeout(ufs);
 
 	hci_writel(ufs, 0xa, HCI_DATA_REORDER);
-	hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_TXPRDT_ENTRY_SIZE);
+
+	if (hba->caps & UFSHCD_CAP_CRYPTO)
+		val |= PRDT_PREFECT_EN;
+	hci_writel(ufs, val, HCI_TXPRDT_ENTRY_SIZE);
+
 	hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_RXPRDT_ENTRY_SIZE);
 	hci_writel(ufs, (1 << hba->nutrs) - 1, HCI_UTRL_NEXUS_TYPE);
 	hci_writel(ufs, (1 << hba->nutmrs) - 1, HCI_UTMRL_NEXUS_TYPE);
-- 
2.48.1.658.g4767266eb4-goog


