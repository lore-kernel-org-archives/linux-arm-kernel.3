Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68A8CD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OCz0yvzzGM7N6CWaoUKNULteL4WQuTdkelNtOhJgFD0=; b=EcnC8U+iMhPbwTOzkgZA3boMdc
	cPRGBB+z9Cn2InJV7zfD5IPf14qSWyGVHJfS6MvTluo1nFFnzkbpkARSMTSVl/PTR2hjAWLnJcmy5
	RlmPoiBVPy+lEON8X24GXNfhSx44tdCKMrgx7LXGBUUCBwg0D1rVMBxkMCaSBF6s0wumif637qLK5
	r/P8vZgOYOr/6v6OAT8M7zWHqjcP7cqZvtkwq0kZEJutk/71woGO6ieun1qvwpoBwjTg9mN6Jo/YC
	64hOVlcozLqLQpMUIeZ6QiRZu/2ryoPajObT4B58ECarWRdZ4JqZVkLSRR5XZziPe+mL1cIHQ9sju
	j5S8l50A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrww-000000054rI-1fpn;
	Tue, 09 Jun 2026 08:36:42 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrwt-000000054qP-1F1S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:36:40 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so5511260a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780994198; x=1781598998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCz0yvzzGM7N6CWaoUKNULteL4WQuTdkelNtOhJgFD0=;
        b=YHVSo07+Sh+TNIUGWEiouOi+LWohY/upqlcMTnbx1nFLWGPOke6ICePLEuQ5kZKJQ0
         a6DFIQYOD4iN/HvDasFxflVGlWJxaLJZdX6wg0zCUbxAupcjc7gaa2xoDpn0UmiYeJFp
         qFicHYmVZqxjj3hR7IpwNw9EqxM2f1Zmat8Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994198; x=1781598998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCz0yvzzGM7N6CWaoUKNULteL4WQuTdkelNtOhJgFD0=;
        b=Yrl0wHAdTs57Mm9llN0YPsArAau1YOO3tDNtRqE/M+Hm+ydUZTVc4y+68Jm14MVMVj
         NjqXukyp/a59uGCu8b6opnBiBAC5H3UagvoofVUZYyWHAIarSrWyEJj7h16KBpOpNptg
         0y9f423FTVj4fccFnzTcq+Y/lt6KyX5rSg/UPUbcr8boIjJbf9b75SNf3ejDjmlBI/R1
         ksqQFUbfTulyFI2KCGHdiY48dF6irAR/47lZsu5ab+tHCYY5qRyPxyn7L4Z6r+Jk9PQX
         j5IFIUYNMIHRvzP3CoRFULJQPhR/JvmEPBAgDyz0BgMWpLzvjW7U1uLz9Zsoz8jxK4k0
         0Zew==
X-Forwarded-Encrypted: i=1; AFNElJ9Pr1E58Qxr/5AvCbNKZWv9zeOWl/tJgzr6fi+pFq8mWYlF4B+Usbzh7BQP3TMSgDer8sqoh1g5pRam9AtcbdU1@lists.infradead.org
X-Gm-Message-State: AOJu0YxaFqCU6ZsiyFgaIsEfyeqHgdR+5HIttSmWkwy8wdZxO+kkdz3T
	KidP8GpELX3vpofJX7gthkgmf5LZaeg/ayFVlqUVCb+vDTyHRZ3U67MEQinPsISScA==
X-Gm-Gg: Acq92OFeidVaJ4tJ7fPHsNyZwWSNe0phRxQD7sXAgf+mTNPhGaJACENhYZIhbwZuFy5
	hgqsRX4gfwi4B/QVn2r9zIr+d5L5M5khCilFm2506ZPNMzyqKHknAelKTYxxjaJ2xdNvOoknI9a
	4pgGFzW8QcsfwLIWkMErRK6lKjVA74+mFswlTqHdI/zZL8vcJZYbfF9GfnWDYpxG+5Af/DjQqzs
	Go3Qcij4HBZtjuk2q9UdYcOq504GlSeFdHUy1J+m9WNBneoSyf4XNUDovcMUxntq7jw4GEAMyGE
	O2G3v4/Uji4Q0W1w2ZkGmYkm7NqhFJ41Sn1+6+0XHHf+nEG6+aeJHQ3IH77y4kdcl3E3YH+7tTt
	yWzsJCzu38Ca8bW3aB1k3t4See7sVIlX7ho2HSaOFvwewdbsHam1y4ezqP9w04AaMGcIX0zrtqQ
	bgM2gyxNDOj9loGeMU0RHUo0Xa2Ncg3r/KIXe2JoJd0QtOOzsxFjIDVS15piGc/JUObyDfEipTY
	13UWsjKNscPo1GKcec=
X-Received: by 2002:a17:90b:3c02:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-370eeb160ecmr20413100a91.10.1780994198511;
        Tue, 09 Jun 2026 01:36:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e2d3:e3de:692d:5f7e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm18211629a91.2.2026.06.09.01.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:36:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: mt6359: Fix vbbck default internal supply name
Date: Tue,  9 Jun 2026 16:36:27 +0800
Message-ID: <20260609083630.1600070-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_013639_365799_96B2BAC3 
X-CRM114-Status: GOOD (  15.05  )
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

This issue was pointed out by Sashiko.

vbbck is fed internally from vio18. For the MT6359, the default supply
name was incorrectly set as "VIO18", instead of the supply's default
"VIO18". In practice this still works, but it causes the regulator
description copy and replace to always happen. For the MT6359P the
name is correct.

Fix the supply name for MT6359 so that both instances are the same and
correct. Also copy the comment about the internal supply from the MT6359
list to the MT6359P list.

Fixes: 10be8fc1d534 ("regulator: mt6359: Add regulator supply names")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6359-regulator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index a27427974186..d9afbcc6a97c 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -706,7 +706,7 @@ static const struct mt6359_regulator_info mt6359_regulators[] = {
 		   MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIFT,
 		   1920),
 	/* vbbck is fed from vio18 internally. */
-	MT6359_LDO("ldo_vbbck", VBBCK, "VIO18", vbbck_voltages,
+	MT6359_LDO("ldo_vbbck", VBBCK, "LDO_VIO18", vbbck_voltages,
 		   MT6359_RG_LDO_VBBCK_EN_ADDR, MT6359_RG_LDO_VBBCK_EN_SHIFT,
 		   MT6359_DA_VBBCK_B_EN_ADDR, MT6359_RG_VBBCK_VOSEL_ADDR,
 		   MT6359_RG_VBBCK_VOSEL_MASK << MT6359_RG_VBBCK_VOSEL_SHIFT,
@@ -947,6 +947,7 @@ static const struct mt6359_regulator_info mt6359p_regulators[] = {
 		   MT6359P_DA_VM18_B_EN_ADDR, MT6359P_RG_VM18_VOSEL_ADDR,
 		   MT6359_RG_VM18_VOSEL_MASK << MT6359_RG_VM18_VOSEL_SHIFT,
 		   1920),
+	/* vbbck is fed from vio18 internally. */
 	MT6359_LDO("ldo_vbbck", VBBCK, "LDO_VIO18", vbbck_voltages,
 		   MT6359P_RG_LDO_VBBCK_EN_ADDR, MT6359P_RG_LDO_VBBCK_EN_SHIFT,
 		   MT6359P_DA_VBBCK_B_EN_ADDR, MT6359P_RG_VBBCK_VOSEL_ADDR,
-- 
2.54.0.1064.gd145956f57-goog


