Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42132C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 11:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YcOUVWVG1AAUU/kF4IJvSl+9zDVrwqBtFVUW2rq0rjY=; b=vRpqggZOf6oZp3zHJHbCTOr/2V
	4Ui8Em52/6B9yqjfNmyBap08QkGMt7r7IUqGyHDzvF793KLlJb9PXPT+S/aD/QeY8X6+JgMGEoUQ+
	fkTTyZUqgyU4bWYe7FZhzmwImpTlf3G4iIfB1OmzZqDR0D+APvf/vMAPM5PrqXOq/wA5z5IabE8Vz
	6ztnl1K2qUXz+cF/2OxILjNT2U7VCiZaKWhHSI+bDuLfG1CILhgQIpziE3q4Z1beqT3QFhJFW725V
	UGg2LME10XvLOdlrJIFR2jBcpGa+mb1vY63JtG9k334eFmgU5ct/9Qk6WPjJeleV5Z5O4fIDxpVl1
	fIRG75Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwq7-0000000HKM4-0yPq;
	Sat, 22 Mar 2025 11:16:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwoR-0000000HKH4-328E;
	Sat, 22 Mar 2025 11:14:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39130ee05b0so2723140f8f.3;
        Sat, 22 Mar 2025 04:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742642086; x=1743246886; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YcOUVWVG1AAUU/kF4IJvSl+9zDVrwqBtFVUW2rq0rjY=;
        b=CaSWZ/rKW3MhwRhgJzpkSdJ6xKxBX/Ixx8gdjEE55Ka7tGcARs8RoKeDrRhWa1QLdh
         kgGuO9dIquSSuniOJIXBaPB62rAKRNkuzj2s+fO4KHFaeR7Joptf6e4pOxThHPJsX4BT
         BEAjUxsr3uErFGKAqR2kIp3+xo6dib8Sr9F7T6oSLiN94JCBPeBvl/NyCb+nvj7DqP65
         Ha0zivPudTT+uERaVTmCNPwdNjmHtKwCuAGtuNoGlYi/qYsrM17Z83orcZtzwzj9OEwK
         OlZqH/iFt0jDoSBEishH9UlorALyQHrgjA7NaMLJP+vNFrN9u6SWg5EEgm3dGuwAkew2
         QsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742642086; x=1743246886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcOUVWVG1AAUU/kF4IJvSl+9zDVrwqBtFVUW2rq0rjY=;
        b=YXJfZzsdz5Vkz/1SxJE1iu6aWrfmNjY89uZDOQVZY3/QTORDUA4AzeHdmP+PvgYmNX
         yE2A6W10nO2etTyhU1r9QGpotBLDyRL6iBNi+SGxA2lC4YZGPdnutVGyrT0SXlz4kaaB
         ZAWr+folTbF0RfMkUkc7t9POEmhpoL95vAOM079bvGyheZGxDKdGVTxAfvx6Ltl5lcp/
         wwEMLk/wn3ozN+5dhLcft3zNRMQwuPUl+Slx5JP5QnUWUH+dZnxTZBs1S1vbyvkC4XaY
         IW2iM7QH4mXEPs9lrbctDN3589i2I2KQJluHF11I3+PZdpLLaRGcK36L+XG8CVksJrEa
         1HLw==
X-Forwarded-Encrypted: i=1; AJvYcCVCT68QC5uc6INbK/PCUG72DyxfuHd0LhQQckbOrls2oI+y11NWwhcsHkUDKUUrapMlPl5FHdZOA1EyWb9wFN6R@lists.infradead.org, AJvYcCXQHqQUFbCaDd1LT/bD8qngfkK6lMRJ0sa3MiTh8Jvs9lX+AEuvetup6gh+ScfufehNX3gQdl47jexZCRWKvXA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpVzK3jMeVbbmTEWUYMOI/IWsnF1FOD1GrshWnnWpMnl4y7+jm
	N/5gDJlNgEdC5Hyr0i1wzAg8NM530AFtxK7H/8mAD8zwU3Olb+23O5xASA==
X-Gm-Gg: ASbGncsz3I6/st+uXnx6mW3bvfeMXqWzr8Zt7lweLQtrOve+JyVL3r+67F1DANIEXsF
	+m1cVtPILrw0FLrSnW5qYdU6pgg9d+6yqGhzPCwYvvvN6yli9gsKy6yCtjVdM1/JYmBAYPcjIqS
	YhBH1nZeW1KtSf0/wx3mUBsH2/8ddMCtk7H/DAfIu/1JYgaAjc60EaEFojvXGVVsO4yag9DOvFa
	OqrU2k0SRiMKRY4UV5G1rhKmSQWBOmfCd0l57EnDyfEBb9mZO9FCSo0y/F5VqqY4O0UVycqdXGy
	QhjbBeKcx+z4nnsJz9AORr3JVIUltS4d6GClrUnCO+0xpQ==
X-Google-Smtp-Source: AGHT+IGchg9n8/yPP0SuJTfuLDSM/w6Y3EW2Ar6OGCb2DW0i/FHZMr4cygIiMlkLddfSwZStNNvPnQ==
X-Received: by 2002:a05:6000:2cd:b0:391:412b:e22b with SMTP id ffacd0b85a97d-3997f903a95mr6587111f8f.18.1742642085903;
        Sat, 22 Mar 2025 04:14:45 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:924e:a190:c73a:b6bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9eff79sm4906628f8f.95.2025.03.22.04.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 04:14:45 -0700 (PDT)
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
Subject: [PATCH] wifi: mt76: mt7996: avoid null deref in mt7996_stop_phy()
Date: Sat, 22 Mar 2025 11:13:54 +0000
Message-Id: <20250322111354.23800-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_041447_759930_9B93D483 
X-CRM114-Status: GOOD (  10.16  )
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


