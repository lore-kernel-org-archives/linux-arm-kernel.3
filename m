Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A336A606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 00:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B8OZCqWF;
	dkim=pass (4096-bit key, unprotected) header.d=david-bauer.net header.i=@david-bauer.net header.a=rsa-sha256 header.s=uberspace header.b=SRuvU2eV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=McHAtaoAopLY8VKLOPI+I31Q7QJw2mGgzISVHigw2PA=; b=B8OZCqWFk4S30OPg+bXGHAXYQj
	MCHxj6VhgexieuekNYJBGyBDh1evSPJ8wQ0tH6GGubd6YrO5/ydtjzmFKDgv8ZJHAs2bhPlfs6K8Z
	vuGsjpjJ5QLLsYNjmDeQ4+IxO8I5iiHPZPc2PSV7EBmKsaP3ShTpGqU0uoq4AswczteJyP33JtP9w
	o8GWL1s3i8yVEY6OIdPvDuOYy2gWz/rR6ivNeJNP070SBaiuZTKAKv5DvTAPSQMRtT6YYIAvJriOz
	QA4llgheDPL3ZUFHFqC7WogHVV5r+IeON80VYAsLMqe0tgUCSEzcx/Nob3dBixlClC8ma/yBbUiTP
	RWbrvTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2fH-00000000kw6-2JmZ;
	Tue, 03 Nov 2026 00:46:15 +0000
Received: from mailgate01.uberspace.is ([95.143.172.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2fE-00000000kui-3Du3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 00:46:14 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id DA00660CE2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:46:10 +0100 (CET)
Received: (qmail 11057 invoked by uid 988); 3 Nov 2026 00:46:10 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Tue, 03 Nov 2026 01:46:10 +0100
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76] wifi: mt76: mt76x02: only read QoS control for QoS data frames
Date: Tue,  3 Nov 2026 01:45:52 +0100
Message-ID: <20261103004553.185692-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=mMof3IyROvhgq1PIWw+P3zt9Tbi9VUqagMwtUWT9DJw=;
	b=SRuvU2eVpwSAjPCeghAAjLgO6SicQeZqeD2yQHU/m3yVoq1V5m9AOZvQbrwgF2GL8nJ01UdqMd
	DpnSSkxImy288R2zGRoktpkxJKfwzYvgEZvjfLsK3wIVN7/LhqtMGXJN/Q0EVPBK4jmtxNvNh8cQ
	ryffdJcQxnfMBelL6tctXgZ68juCfZPUBS2cVkcnz/kQvM5KDg76KoND5kHcgPNNrMhfhq/XV9np
	v1a9VH7DvvXBdX8LzduWtu02+mCF+BfNc4Fygej6iWpIG7ZHP42adWs1F4d72OlYLd624HfbyOX9
	PrVvGgqRzCQm2gVZZFxstFlb5suwWLU8euP4tMovRSI9DBudq6XVcf84NQk5PuKCAdcjUoAGHnz3
	NP9qoTariJ5rf+IAvAGwqy/HwTIRxghT7ymFLe/Sy00ZRnVU8Cw4CjcgklqzcZHFPfmbnkp7ktDf
	UjZLH8Uuh06WygW0T3LT03zZ9/zmn0L5WcQnaMXFUpV53xHLcYnrZuNUXjcA+cAAm1hBhq2glxB4
	CkuXtRNfDAJ6Ir1sWMe5lme+7sUXKjn0MXDIL31K/GoJrg1sUpoxpl1ucZdtxltlydGVNc9jWpbH
	t/0XcJ3a6uDMFkMXErg8xYO9fwUPinMcfJwq/m6/TNAxIoTbpb4IlV1px9IIiSA/3t57Z73kgXb/
	4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_164612_956304_56F53A9C 
X-CRM114-Status: GOOD (  10.11  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Only read the QoS control field for received QoS data frames.
For any other frame the pointer might refer to bytes beyond
the 802.11 header, so the read picks up payload bytes or runs
past the end of the frame.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/mt76x02_mac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mac.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mac.c
index 457767bbd8b60..3a08b57bd8de3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mac.c
@@ -897,10 +897,12 @@ int mt76x02_mac_process_rx(struct mt76x02_dev *dev, struct sk_buff *skb,
 	status->freq = dev->mphy.chandef.chan->center_freq;
 	status->band = dev->mphy.chandef.chan->band;
 
-	hdr = (struct ieee80211_hdr *)skb->data;
-	status->qos_ctl = *ieee80211_get_qos_ctl(hdr);
 	status->seqno = FIELD_GET(MT_RXWI_SN, tid_sn);
 
+	hdr = (struct ieee80211_hdr *)skb->data;
+	if (ieee80211_is_data_qos(hdr->frame_control))
+		status->qos_ctl = *ieee80211_get_qos_ctl(hdr);
+
 	return mt76x02_mac_process_rate(dev, status, rate);
 }
 
-- 
2.53.0


