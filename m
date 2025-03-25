Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D51C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 16:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C6tDaH152ddstc370ylWAGo2n6arEJx9aEQNMKGmXeo=; b=hTjDpqp7faNnzsoSnvERYwJmLd
	e+ex7rYG055ug+vWzzQqOnuPzRfH6p6jIIJMpl70X5l5CYLTBnHXHQb2LeENR5hEtUT3dl6ri9K53
	nsDMxQdDoveCF6b3HQWgiORCgJrLtnNu7CaItY3SHUcv5CsYBqF0NO58NQbmNzBb9Br8NCopkvEzF
	2bL9kisanvEjz/3oEGJMPqfZ3aJIcfW9O8BDs9ki/LinCMOfxyBasheVCk6gbUbAd3/YlNcB04oaX
	r8FMUD3DONxbTv07P06GNx0a2vEIP+3ZOvfpyBGEB8hbFb9yL9UJxK9mwnQy0koNv6jFZ/dJKngsA
	GcMjkQyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx741-00000006TDK-2DGr;
	Tue, 25 Mar 2025 16:23:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6t6-00000006Rj0-2MyB;
	Tue, 25 Mar 2025 16:12:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DFC94A4AB66;
	Tue, 25 Mar 2025 16:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AF0C4CEF5;
	Tue, 25 Mar 2025 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742919143;
	bh=x10G0rQd2+3aO6XNnYYfLJ4MTWFAc+fz/p3Z0HiRCLY=;
	h=From:Date:Subject:To:Cc:From;
	b=bP2Lq0rmbWZ5q4sl4PMBiIkfx8AY6iW23ip85N3j8L+5zzpZeit0OcbqW9W2Qx8Jp
	 ApkRCmjCqO4CRXEdDrjejDarVu6Qux+GFIrPmCdwsrIiBczcEsQ3GpNPbaIz0/gCjD
	 jL5oTM9DpiTIAnZpmOizCxIaLmAcM0vYNrtjDMKrG62oDb/ZX9+VS2yAeJcKYQeFGp
	 xehHMgejWT+WY3/htuiU0CQP65MfMcFt/1lNtjOxZpTqIyvynAr6RAjXH0P2OlKG6+
	 7t4Y2x+A/s64FihgPjeJqnzmIyH21WKB/GEhogXiq1qnmHhzSMGsiKSlt3fmu9iK+P
	 tGFk7q99iRdzw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 25 Mar 2025 17:12:05 +0100
Subject: [PATCH mt76] Revert "wifi: mt76: Check link_conf pointer in
 mt76_connac_mcu_sta_basic_tlv()"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-mt76_connac_mcu_sta_basic_tlv-link_conf-revert-v1-1-b84efefb74ee@kernel.org>
X-B4-Tracking: v=1; b=H4sIANTV4mcC/x3N0QrCMAyF4VcZuTYw69qBryISYpdqcOukrUMYe
 /d1Xv4c+M4KWZJKhmuzQpJFs86xxvnUgH9xfArqUBtMa2x7MRan0jvyc4zsafJfyoXpwVk9lXH
 BUeP7WANWTFLB0Lmeg+vYsIWKfpIE/f0Pb3BYcN+2HYAevSCGAAAA
X-Change-ID: 20250325-mt76_connac_mcu_sta_basic_tlv-link_conf-revert-f467af64a2a5
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_091224_669377_08C1207C 
X-CRM114-Status: GOOD (  10.46  )
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

In mt76_connac_mcu_sta_basic_tlv() link_conf is always not NULL.
Revert the commit '9890624c1b39 ("wifi: mt76: Check link_conf pointer in
mt76_connac_mcu_sta_basic_tlv()")' in order to fix the following
warning:

drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c:394 mt76_connac_mcu_sta_basic_tlv()
warn: variable dereferenced before check 'link_conf'

This reverts commit 9890624c1b3948c1c7f1d0e19ef0bb7680b8c80d.

---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index bafcf5a279e23ff007d9052301cd2f6b899c491e..d0e49d68c5dbf0ed4eab084d9c6f1cad230bed93 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -391,7 +391,7 @@ void mt76_connac_mcu_sta_basic_tlv(struct mt76_dev *dev, struct sk_buff *skb,
 		basic->conn_type = cpu_to_le32(CONNECTION_INFRA_BC);
 
 		if (vif->type == NL80211_IFTYPE_STATION &&
-		    link_conf && !is_zero_ether_addr(link_conf->bssid)) {
+		    !is_zero_ether_addr(link_conf->bssid)) {
 			memcpy(basic->peer_addr, link_conf->bssid, ETH_ALEN);
 			basic->aid = cpu_to_le16(vif->cfg.aid);
 		} else {

---
base-commit: 1794d7ab34d2221ac7eb921b171e75b856e10561
change-id: 20250325-mt76_connac_mcu_sta_basic_tlv-link_conf-revert-f467af64a2a5

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


