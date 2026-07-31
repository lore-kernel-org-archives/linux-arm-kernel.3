Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2455C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p/zSUWBhbluccRh5Y+3PaEaBGuhqo6tGCiQ6G7WtFxk=; b=kngcTmSqjhjmILTFWd8APrIhUX
	/I6IKNUFccgsPT3S1Qpj3UqVjzDpm1nnemZwo44LF44IgpWDBulRpdrY+HzYsgWAbNkbgOl+PiuWs
	te2HA04g0pHr3sAKgDw//4S6sYzublPJWWhvaUmZMgi/4AXZSk08xotbOHp4xAmzBOREwCtpqhCwC
	fCjj8CsCEItLwZHyhF1H8xxJK/xx8Ik+pt/U4S9nXLiVy/y3mdUE4vNNQfkNj/CyduIFMnH0PFpOp
	dFugok0nuOIBOMNBZZEfgfw1JZ0DlNNRzbFzf4m+IQrRh3mtQVDVa5FUVuJgc6hCrmoNPN2I7RgJD
	kifphuJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphPY-0000000BvyK-23Pu;
	Fri, 31 Jul 2026 07:12:04 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphPU-0000000BvxN-46Yu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 07:12:02 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cedda2ce6fso5156045ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 00:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785481919; x=1786086719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p/zSUWBhbluccRh5Y+3PaEaBGuhqo6tGCiQ6G7WtFxk=;
        b=jwBTvpO0XG0DiJPJVYSmokIOkaaOITY/Xd91xMzsJqPtClIAAC9SrIZVXu4cwr6BNH
         Q6/76Hn1dlU6sc1cHqcha4mk6YseiWGIJoO7Ru5VecLKS/Xp172Xp1DVlqUbZC65Hkj4
         SfFj2x3/dzNm8nIAQpi0V1+hbnUkglo7quyoKSlY1mMkLeDKvvTMMRdKBIlXzo8FKnXg
         REHYsm3YbbQ3DPb4h4hOwXTb7hNS5tCV10GqI9QZE3NHZYXOzlw2ask+ePGz+FCLXB3I
         JJy0ybfEhAlgS4+xSdDxCI19BL8IAma7uzeKBBmDfWOu7ntPlp0BECKAQ/hUR8+Smbiz
         zCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481919; x=1786086719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/zSUWBhbluccRh5Y+3PaEaBGuhqo6tGCiQ6G7WtFxk=;
        b=DZ9Ocw+biZ6UmPfEhxzShfi3igUTcTQtxVJayILeXBeW2DlLYsg51IzNt2E9m6AaWD
         huNH6q83ZfSX33Ok15x/aMpauB3DNlty9Fi7vU4s5BTTu2tWIfopf9vrT4NJRIaQre81
         R5hRjPl61gUgzY/hudmj57HTRaZ57+pAyYUQrVoaLHyl8+BQJmrfKEQqv2yfF6CS7U7R
         G/X/bltwppzUkKAbukKFANCp2DQyU1/+lqgqul6o9wO/WhBLDmSNelWOX15vwTlHDqQr
         /Ek3J93kMuiqJKCxKoYGbthPLoZN1wdVjFcsr9AniFvUt5TM8W6R7OLB3vIFvymNtUSR
         azYg==
X-Forwarded-Encrypted: i=1; AHgh+Rot/CB9PWlLLhDQkp+shHsG/uVsz/TcG4pjRCq4YddCs5AmDkS4ydFRJhoYbLtOk0oGsabBJFs3Sl5UZ18f4rMy@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3k3l8KtR+Se+jNj6Qnt95BxDMCbkuS5iRz7Fo/6B67Kq11gnC
	RZd53sh26cgwNJxQ507jZB97BVISYZZfgm2Pb+JauLUqv0gDXCGpOauF
X-Gm-Gg: AR+sD10mm3EKLwYyDfsyaspx/7mHuObryUz6Tei9u718XlgxAwMfgu13pVHpsnrHRqR
	PoBepz+ZA3PyO+lB21cmaX4XQ4AIfu99JX1mgR957emhh30Z6zyhWq4UuGk6lhGSL25n89ncI/+
	RxkF6iZ496jYbGjNpMGERLT5Xb5U6p2qsCStsXJNajm++ogAzp0bQ6urVStPZQXEGqQprNxaViZ
	PFAk079h3zcL4CVnwkMcNChPaW07CiFC1GosDAYCl3VeZRMO+QskctZYs1Y3CTfugzg0UYuZcdZ
	N+pctj517LeMYE7sM3h6exzYO7VmpiRUIjpyXXfBOPRgFBzR8/InaeaJsNajFCaCcfpdyPozoh3
	j0QbX9PEDEs2GwEmchz3d/+znF8mxeqF8EgQcSaE7AcuDFSeT+FGUxJQskSkHJg+yq2ASrgfQAK
	tA6fLeBIBk6IkWyyDQIfiCkZiQNo7z2aGrBaSzoN0ATSUYD0VOmx8bsHXZrKKJlR5qrzVgZ3Ev0
	59KSa3kjoVg1c/e0j7bt13imLg=
X-Received: by 2002:a05:6a20:4308:b0:3c3:a1ed:3c36 with SMTP id adf61e73a8af0-3c91b266a96mr892351637.24.1785481918740;
        Fri, 31 Jul 2026 00:11:58 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4f0f0sm2308226eec.2.2026.07.31.00.11.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 00:11:58 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: mt76: mt7921: validate CLC indices
Date: Fri, 31 Jul 2026 15:11:48 +0800
Message-ID: <20260731071148.74484-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_001201_027541_B29BCEA1 
X-CRM114-Status: GOOD (  12.20  )
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

mt7921_load_clc() indexes phy->clc[] with the index stored in each CLC
record from the firmware image, but does not validate that index before
its first array access.

The equivalent mt7925 parser added the same validation for a potential
array-index out-of-bounds issue and later corrected the comparison from
> to >=. mt7921 never received either change; see the linked commits.

A malformed CLC region can therefore read or write past phy->clc[] while
the driver is starting.

Stop parsing the CLC region when a record has an out-of-range index,
matching the corrected mt7925 parser.

Fixes: 23bdc5d8cadf ("wifi: mt76: mt7921: introduce Country Location Control support")
Link: https://git.kernel.org/linus/9679ca7326e52282cc923c4d71d81c999cb6cd55
Link: https://git.kernel.org/linus/08fa656c91fd5fdf47ba393795b9c0d1e97539ed
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 25b9437250f7..1c99645b8122 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -467,6 +467,9 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	for (offset = 0; offset < len; offset += le32_to_cpu(clc->len)) {
 		clc = (const struct mt7921_clc *)(clc_base + offset);
 
+		if (clc->idx >= ARRAY_SIZE(phy->clc))
+			break;
+
 		/* do not init buf again if chip reset triggered */
 		if (phy->clc[clc->idx])
 			continue;

base-commit: 4a0bd262df757b25fc4e2a53c947317c119ced4e
-- 
2.50.1 (Apple Git-155)


