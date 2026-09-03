Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFFBC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 15:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pjlizrWboIfwnZS2oWukdlINpTQI4dn8vHdtaiT7QzA=; b=lesuuwytyHy4oQVHdxerOrDcsq
	RqVmVLgJudqVT0G3uLnZ/Y6pem05UXTL2DAjCFHMUrSbbM80Q9KgnmtE2PIjqa8+/BtYBpvVcHMmb
	70QwPJwgk6qHq0GpJcrZ25si8YKTal3BVQCFZEERnmwrDqMBHxQbDb1UwLxpX09aro5IqZXat2tCs
	CYMJFeEKrG5yZsGehYLVJlUKUystRbrJJ5Px8kmz4qsDlPBv2rqAYskDKvQJ6333UV1Fytd2hOIIW
	DQQGMd2x6r8BNYoKA1AZNwDNzZH7G7BtiQxLn7anieJtBPfBnXtV1Ua2hRKsQJT8Tqi2NN/ZxgSoS
	RJG6W8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x296u-0000000HaDJ-0JOZ;
	Thu, 03 Sep 2026 15:12:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x296r-0000000HaC3-47QL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 15:12:15 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48584dc164fso449195f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788448331; x=1789053131; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjlizrWboIfwnZS2oWukdlINpTQI4dn8vHdtaiT7QzA=;
        b=RB6Sz6HWSdc9WrEK/BwMmz7m/If21+ocOeDya81Q26KqpSlU+KYdK441itUT++GpeM
         4VpOn6zKvN42w6Q4SrP7vk75lJsBLGZs8Y8m8tZ0B7vRmin4aHqln3RGCAc4Xr+yg74K
         G4g9S/QTiWSP+S+5I6zwfG1GLKTkiDiGCGummllLl/FXoP9FIYbQv6FprQ3fgPee8NjT
         5QJO4+zn3IP3QlondfIreQN8qiJggPnDCePCa2ACYWjhRMszPO82Mw3c2O+yQu5RQc1Q
         LMnibo7qgKnAoNAN/MQS6a8uoNTxffYWu1FrGZDCbFHS1reYZSdbMi7lHFOGzRK4XDIP
         K9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448331; x=1789053131;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pjlizrWboIfwnZS2oWukdlINpTQI4dn8vHdtaiT7QzA=;
        b=nwkYFcmoJlLdsKH1N7iv2u6AGXMWNKqSOjf6eV4SCYeV3szYLytWVDKzTsfM9k88l5
         w+zl63mZHAORAr2K9F74JcU0yrf2d+xg01gCVHqqh2EssKQyi0pcj4CRu2dj5ncD88Qd
         7u6WQo+32kqvvb42ZGCzFmEx0SbcD2lH11bswWAAgUgyFsnf+8uz67yDHs5Wb3d6QsmD
         /k+zOzYox+yg+VQ0x4DKpuFE1Xb4Ttc9dMyDNEzyLcQimGwSf/WbpHX74YI1V9YBt8DI
         hAatZIGQJoBEQMoASQ5F7saJvTJPRW+8cijT34lpg2j1u2EGKoByoxXMv84gOhHz1Awj
         GWZw==
X-Forwarded-Encrypted: i=1; AKwUvBxQXlia0KKsSopKqXf6OzfYJN2ZOORC+C9XL3SZqsrvxa+oxGsVNjTHjHeUFIKtsF8SNsnWYhVOTnTAc4QCfwXZ@lists.infradead.org
X-Gm-Message-State: AFuF++ndndI2G/aiKGKcnGvSscj3N3cnc36HCZKrJyADjbubAQJXncIT
	ml7xDqSIKsaa6xyiPtCeX4AvkWnTHx9K1Sa2PCI4zu9k83pz4UYauKjT
X-Gm-Gg: AYBFou0ltI/FR3feCa0CLYgZx42zI3StaAYYAXBIkMLcnXGW98Cj5bOm7fpOTaPCJVY
	L+XVEMjv2t7mebBwHk3xxbRwHPd1GyHimXEnQTtHCZcotZXDJ/k9WSau0jfCIhov9q46d1mOwnW
	7OVRb1cU2s40bGCODqh0BTujJKEbszPtPtGRdrXXH/bywnlcmpL9zm1Jr9VkoPbvZViq7XrBknb
	INLsSs9S9WtYyEXuuVFoj2DmvLoZnwp6QVOpAHTM8G1zhLg8a/LrRAOczbxr9X5TdX+e76ykuWi
	DhXLnFUWNrWiR/Z8044wF0UgQbcYUoZlpZwluvF2yTMKJvzPaXUwfvT/nZ+DEaDBayIs46OwVOm
	NHBbsJk7NPWv3AXoHPrt9/8AyEhrxLYYgDDfxakA9UGVtaDuivlGjwQxUSf8uzMzNYdcoMWLxrK
	0xf8JD3POZ8xdzooXgcr9bk0/QZDcM9HmTUn/VNwccMTIX+e5809Orut5qYSQ=
X-Received: by 2002:a05:6000:2f8a:b0:482:e64d:a1f7 with SMTP id ffacd0b85a97d-48488e0371cmr21537891f8f.11.1788448331284;
        Thu, 03 Sep 2026 08:12:11 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e6f604sm14396587f8f.2.2026.09.03.08.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:12:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: mt76: Fix spelling mistake "dowload" -> "download"
Date: Thu,  3 Sep 2026 16:10:07 +0100
Message-ID: <20260903151007.14832-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_081214_023932_5D9CB0E7 
X-CRM114-Status: GOOD (  12.31  )
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

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 2f925d22b9aa..9552fadbc17b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3130,7 +3130,7 @@ mt76_connac_mcu_send_phy_ram_firmware(struct mt76_dev *dev,
 		err = mt76_connac_mcu_init_download(dev, addr, len, mode);
 		if (err) {
 			dev_err(dev->dev,
-				"The request to dowload PHY firmware failed.\n");
+				"The request to download PHY firmware failed.\n");
 			return err;
 		}
 
-- 
2.55.0


