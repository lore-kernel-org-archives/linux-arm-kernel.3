Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0746EFF8850
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 05:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IrWP5CDvZT0EW03kM+B3gbb16k7M4gE4dJ/XgHLlCEY=; b=WjXuoJLNbkBsUjRhlrHnpgV0gL
	O+mlYLxCBZfgx+XCOvkGBP7jCguLM5Vid0q15xG084urhUDdrfHQANm8DmzOOHiGU3KMhprARy8qs
	8LCfOY2noSflHk+fzEhv5pIcTGaft27ntNAZbWGZ0gZJdnuydoYURB7ubB/uGRb4id9HAvZVV7lmr
	8OvXQxwlZyQROHERRR9FSaYsTgd/QOh4YzceuaRjAyZWj+hg/S7BRhswTzaYmdIMhG7Rl9VEWozJG
	PF747ZRLWQZI5AaBSB8lAxpNp3fdYx1yukiSUytK3A+m4Dx50UdCPzTPy1I2dGCPv3jh90oHwVQkX
	ryjpw62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHEMC-0000000GAbN-21TF;
	Mon, 27 Apr 2026 05:18:08 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHEM8-0000000GAYC-1ZbX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 05:18:05 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso7462524a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 22:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777267083; x=1777871883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IrWP5CDvZT0EW03kM+B3gbb16k7M4gE4dJ/XgHLlCEY=;
        b=Mw+8px4H2WtUKG3/IuynUQgmuczghK3oR79d3x7WfwuhA4nuk+jHMKmuNSPrpDl5xv
         YO6MU5IDicwUDt7zed88LZpOjO3ruVIEOiCO6XP8w39CBwQaJAbexAHcIvzvdsdSzDTF
         7SFc2yC0udca7T/EmqHNUEGLdczIXLm1PXy6tE5FRzdAaWzs/yY4OiOoE5AbGVJZctPI
         3kUyKQnjshXHkoxr48idoRMZCuY0h/62bhdz7D1P13RE4Ra8+mVJc63N+9qSuGde7j48
         hZPt/iY+toajEy62d/8rsHFKBpDcSGALYv9csJz9SRuZhCoCMTuMtbWshT4qKbdTvC9S
         8Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777267083; x=1777871883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrWP5CDvZT0EW03kM+B3gbb16k7M4gE4dJ/XgHLlCEY=;
        b=la+FOS6Y8J2lGHaAL8pBEPFAXLyZCDojM8aCvxGzdhhxu32ChPqzxO6f7qqEzmwanJ
         UxHOUN8wVWaOMtrD79NEvRqxHWpuLqXm0HWMfk4jvsdOkMtMy083KPuF26VA78mdRoyd
         ocE64rLvAK6qVdtxSY8ElCQN2/r81xatr1NpqPdoCykyuveythTcRVOY5CTBVl5xJ1vO
         85E+IGvXHvdei8Vk0Rtn4g0v7jnAXH/aislpisIGhDtsVH35CVDWpnKo5UQCBb/Vwttj
         r3RyaIvdyP8cgVPX/e2eW98ugF78zdmGV7mjrNyTBmPKbaNo4cVQFimWb8sWcbuXLIQx
         +xuA==
X-Forwarded-Encrypted: i=1; AFNElJ/fw4qL1yCu8nveUfiGPBPPtem0+n/IjUlm2Cx2mGRUmQDVCQQdhOwmlrZOtUk8PxU0DGnnWUMUr29ATsFgDqha@lists.infradead.org
X-Gm-Message-State: AOJu0YwR5/hv06aZewQ/kxVl30xPdGbKGhNZzkCF9OGmyADJpLiEG3dh
	QS/YBIg7HkoDVogrQcXxAmt8cnH1rk8kOJK8sbxtPiZq8ndVs3mTDwmU
X-Gm-Gg: AeBDieuqdrVoogx9N86JU/np0TAG2As5Bh++KF7ReEqgsruRv3RDxHdL3FeoNzCCcDc
	jaB42cWPqOw5/UnVd3kC6ymwOgrAo+vfVoXWokjgfRXSturY7bd69QmSAUWMIC5KWfz9y5n8vQV
	5vklW7yEtSBT1mY+aY7nFe8zLTh2OyrCFkvSijxcahDq+JhW89Rz1LOIAKxDB0zAWk7oeFdHebu
	4EMOsMiC4KPuDztZmPCJObpqVQdvwQf/ArTQL7lO9zYQvjHWhpB6a8sxiJFc1R/hlIyBevqQMv2
	rIQL5hQ0Dl6JzUK4x60DWvMgHrBEJADifLMFErYrxGuZ9gtSLWmB5mgwV7POK+GWtWMUvEsYM0Z
	rz63FTMbdrtb6UWkg27526OxnYL5Fy/hGMPummCNUm2khV4Fokbw01nqed4b2Wr3FPFDIUjQ6C9
	u+ItlXHanxC8IgLmmKFPqGRUu3R1GgjTO7nbuBNHRQJUlSBbKXBiiGK+KhsVdLC+RyBjXKddJ6S
	G0ptNvDG8YOxNTZvSNourbuBA==
X-Received: by 2002:a17:90a:e7ca:b0:35d:8fdb:4f36 with SMTP id 98e67ed59e1d1-3614048a21bmr43367074a91.18.1777267083487;
        Sun, 26 Apr 2026 22:18:03 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab2112csm280636685ad.62.2026.04.26.22.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 22:18:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH wireless-next] wifi: mt76: fix of_get_mac_address error handling
Date: Sun, 26 Apr 2026 22:17:46 -0700
Message-ID: <20260427051746.954704-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_221804_754607_133518ED 
X-CRM114-Status: GOOD (  11.60  )
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

Check return value instead of is_valid_ether_addr. The latter is handled
by the former.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
index 93d91264687f..0f6ccf6ed53d 100644
--- a/drivers/net/wireless/mediatek/mt76/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
@@ -93,7 +93,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
 	if (err == -EPROBE_DEFER)
 		return err;
 
-	if (!is_valid_ether_addr(phy->macaddr)) {
+	if (err) {
 		eth_random_addr(phy->macaddr);
 		dev_info(dev->dev,
 			 "Invalid MAC address, using random address %pM\n",
-- 
2.54.0


