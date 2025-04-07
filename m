Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F82C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 10:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6kbSbXHPBVSHg6CGOwZj7BvfHTx3wvN8nMae6QOTEac=; b=zH5U/jF4jlSI3EkKjOigUWZS1w
	fFjh6ajQh0C+ShhYyvTMj2rrnnuaQRY3/zkqmbWOaUa9FytjDh72aeKn69HmkccCH1VnWeaJdvDIr
	2sfZYb5ijd9A3lFFF8WCjccT1umSy5QtMCnOov4OIsDTTYm3i3NF1QzPJ/bmfWFBhRjSbwuak9wht
	JHDA9iDFTFV2zbx3bIF6vCbRvlS9QHCbxyIZLwWAOniIeF9QXDW0Fv3j6PiqZSwPNPFVRJtr0rYE0
	6Jxt8BEdVOuZbdGS17aeVhNPidflz87EYVxNiISdRNhtQk2bjABbEcZg3soUZl0Pe93aO8UAsl93m
	YQazgcew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jIV-0000000HJJz-143f;
	Mon, 07 Apr 2025 10:01:43 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jDH-0000000HHFW-2IYj;
	Mon, 07 Apr 2025 09:56:21 +0000
Received: from jtjnmail201606.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202504071755536257;
        Mon, 07 Apr 2025 17:55:53 +0800
Received: from locahost.localdomain.com (10.94.5.217) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server id
 15.1.2507.39; Mon, 7 Apr 2025 17:55:54 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <sean.wang@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<howard-yh.hsu@mediatek.com>, <StanleyYP.Wang@mediatek.com>,
	<chui-hao.chiu@mediatek.com>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] wifi: mt76: mt7996: Add NULL check in mt7996_thermal_init
Date: Mon, 7 Apr 2025 17:55:51 +0800
Message-ID: <20250407095551.32127-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.5.217]
tUid: 2025407175553cfc5208c70a300baf4f5d5e9bd496b54
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_025619_849587_1FDDE57C 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

devm_kasprintf() can return a NULL pointer on failure,but this
returned value in mt7996_thermal_init() is not checked.
Add NULL check in mt7996_thermal_init(), to handle kernel NULL
pointer dereference error.

Fixes: 69d54ce7491d ("wifi: mt76: mt7996: switch to single multi-radio wiphy")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 6b660424aedc..5af52bd1f1f1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -217,6 +217,9 @@ static int mt7996_thermal_init(struct mt7996_phy *phy)
 
 	name = devm_kasprintf(&wiphy->dev, GFP_KERNEL, "mt7996_%s.%d",
 			      wiphy_name(wiphy), phy->mt76->band_idx);
+	if (!name)
+		return -ENOMEM;
+
 	snprintf(cname, sizeof(cname), "cooling_device%d", phy->mt76->band_idx);
 
 	cdev = thermal_cooling_device_register(name, phy, &mt7996_thermal_ops);
-- 
2.43.0


