Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3920BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YcOUVWVG1AAUU/kF4IJvSl+9zDVrwqBtFVUW2rq0rjY=; b=ncX7WL8UNiydX1FT+X5GMqae9R
	YORMbEY5+wunBSbXUuoNfM3r9t1yNQZni5t+5AIFSM/ltolBj5qU+l2r03I6lr8sXSsn+2rlaRgqM
	yAZ/hebqcli4tclPGUiOc8N6TR8vcA7CHNNwwqMcPjLrjbOWBum6AnSe7Wx30MCVRcE3NEXhZkfG1
	qMIIvUfSSycpZ9fn8wq7Lav8CgCu/m60Vng8sopU6QnFIdSp8PRFDo3Zw4mJQhsaGPRfbqhgxS+Yi
	bjd/uSSIS6yVZ9beR3anSuADR8XqZK3uFGwhUTAWwrGrQJU0G1bHdaltByfSQ3yJkslArEgaPng4q
	xetGfciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pCk-00000004BX1-0ieI;
	Mon, 21 Apr 2025 11:20:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6p68-00000004AuR-2OJI;
	Mon, 21 Apr 2025 11:14:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so21775745e9.2;
        Mon, 21 Apr 2025 04:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745234038; x=1745838838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YcOUVWVG1AAUU/kF4IJvSl+9zDVrwqBtFVUW2rq0rjY=;
        b=YDUoL9uyYSNMQrKymjpaMDOvUHGMXdJXWnJxZRvWKMeEOkLYTuQM6mosRnkMzYEU0X
         z5/6jonYt/ir3zMZcgrTo5nl2cEiuwlMW2gqAB4IKYD4hPVaDRh/ykeS8rXCis7yQ02f
         CFCrqit3ft1oeh0SD7iAnVlXEgeXcThGVRRMWzFSrWME8acjT/fmpACCnRmX0zkS6YaE
         1Nu2Xi0ze4tSoNTLyhf0mNYWd8mTZPl35bIedaso1nSe10Fq49tBIaTZH4eJmEUD+jId
         sKJaH10HV9+7sj1ETL6wliPWXzhit6cOd8c+vYrRMUsBNPBpx6nwAmj2/hXON/8Oy/6/
         NFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745234038; x=1745838838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcOUVWVG1AAUU/kF4IJvSl+9zDVrwqBtFVUW2rq0rjY=;
        b=V2z5XvrJffOu7XXmbOpGzQYp2nfaAE9mJHFLnI+zHa5vZUhqtCc3jRqtJIKtd5T9yM
         si2mB4+oe7w29NqU3ue10BpYvEncnbycL5hcBTQC6loDO9GDIf7fy6v+ayw2Vpw/9vUB
         K/yIWl5kONo02grUYpNIvUpKTLZ2nKkJ3cvqfB05+JRpqh7bDLRKxP2nxyEgz1tCFHGE
         x3guqqOuxXdksjVBk4Qwhavo5O7EakocUsY6iht0UayGd1fELHLQ4HgSmPDR2YgmTUBJ
         sQGWEq0TBfw7hjvj2laBEL/CmEYTSudLkDnL90Vgd8DdKbHuznEX+lBnrV6Bq5fn/cc0
         IQlA==
X-Forwarded-Encrypted: i=1; AJvYcCXODQ1gO72gcMFzxjzqqjCH55qwIYlIYBRKTMjzHJLfjWZTqs8TxlkRKhcABckAEfgmgiBm8AqW2qVzO4Hb2vOx@lists.infradead.org, AJvYcCXszvwxF1YOjj1i6CuzMycMCt6zAtTTokiz9QHjKFVF7W/oe7Pr5EwDssGBrojWOhtKynOZ1aHKQ7Vk74Us3AI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/BuPkbhEiAskuNKUw3zVI4kONNo3PfScUSGmfFaSvX35KkMFb
	seZTmh1DfiCyVBYaSTca9ISvtjetKG/UDhKDM9wLyDtLAYLg+ziM
X-Gm-Gg: ASbGncs32WYiB0oLsYtXjaSBf4jWIpbYW6uqMOvT8N2XCzZQvvxlEUegA3fNjQM0Zza
	D0XzXzAbDkiDJBD2tXVc/ajbU2Oz8fCMxOZXhOBZxctPxANDYWu07WxF7WGKzxyEE98XKVWaN7q
	an7edzpCzEcY+JnD2Uo2DEVTniqPfTQA5WWY93Dyo9lc/VeGlfwrZBwZBMKCQcBiQY7idupuomZ
	xcsAJ3tn314CiI2IInsT+YHVtf3rh9+4dUjqJAy5HnHCN7aAf0+X1IvTIgeFX1c7oJaeVwaZb8E
	P50xT89gjkhtCJ9MGN+GYxwcVvBdKVf3QuGwTeDXf7kjU6Hdeh3rengrMGYa+JGLrg==
X-Google-Smtp-Source: AGHT+IGG5pvhTvxUXN9hKzMCBUViCI/TKQPbUz9Hd/bpbRnURHd9ELf6tKypqvzOgo2WE7hDsvf+gw==
X-Received: by 2002:a05:600c:358d:b0:43d:7588:6687 with SMTP id 5b1f17b1804b1-4406ab96945mr102781655e9.12.1745234038247;
        Mon, 21 Apr 2025 04:13:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:6696:8300:fc11:84a0:480d:20a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4330d8sm11848418f8f.33.2025.04.21.04.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 04:13:57 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chui-hao.chiu@mediatek.com,
	Bo.Jiao@mediatek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND] wifi: mt76: mt7996: avoid null deref in mt7996_stop_phy()
Date: Mon, 21 Apr 2025 12:13:44 +0100
Message-Id: <20250421111344.11484-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_041400_608674_710297DA 
X-CRM114-Status: GOOD (  11.34  )
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

In mt7996_stop_phy() the mt7996_phy structure is 
dereferenced before the null sanity check which could 
lead to a null deref.

Fix by moving the dereference operation after the 
sanity check.

Fixes: 69d54ce7491d ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 66575698aef1..88e013577c0d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -68,11 +68,13 @@ static int mt7996_start(struct ieee80211_hw *hw)
 
 static void mt7996_stop_phy(struct mt7996_phy *phy)
 {
-	struct mt7996_dev *dev = phy->dev;
+	struct mt7996_dev *dev;
 
 	if (!phy || !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
 		return;
 
+	dev = phy->dev;
+
 	cancel_delayed_work_sync(&phy->mt76->mac_work);
 
 	mutex_lock(&dev->mt76.mutex);
-- 
2.39.5


