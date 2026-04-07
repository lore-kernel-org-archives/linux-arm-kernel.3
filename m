Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A58FF510B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mdgebIX8WCshNHCphbYwlC8WuuoYhJuJww2bMe0846A=; b=B6puXsNCBfz4ggEJCmq5g+pjhu
	L/aR8oiUHzpP0zupY4hlzvXtC6Tqwwve4Wsuw7f56B6lkQ2WBLhKATqSN5Sgf99/PsMysWQMYN4Se
	xngH7TLhoRAb5R3GG5VeDrYtxoWqMk2ZJHPH4Qo9aYDbat/ZZrbqCaV+AHQz/EEmaFArlD+LsR/4B
	Fv530AZHpd3YPPxDHMyw5wbzFOWgtmkWhmse32hgtcLx3+bOsiX9zWxQj1Zd2dnH+Wt7Mf+w2FQP+
	rCdU9v/nappu2hvttQNtlIOx2m973HALz2MPQ0GfKuOQ9HLh/vik1KvDG+IZ8++KYDyW+6DPma/lV
	nUoP01nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8c7-00000006jjo-3cTA;
	Tue, 07 Apr 2026 15:45:15 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8c5-00000006jjN-41ur
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:45:15 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b0afa0210bso25896665ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 08:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775576712; x=1776181512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdgebIX8WCshNHCphbYwlC8WuuoYhJuJww2bMe0846A=;
        b=rD15C5gJrDbCxsPg7AfZyp1cXMK9BECznqTyIzJqDYeBF4rXtZw8ILdoIx9EUVXpUK
         Yt7mJDvz69FIt/N/ojQpnS/yyyLcXi4AklseUYzD1QIeJMefkWWQatSMrH5WvbC/fZ8P
         Jxii+9zVr603Mj0umwydAKUmVIwY8UR2wmannv2foHDrjfm8NWpzlrqxxFfZnqj1YHTA
         oAa22ZE24hWmpxnfHeYC4boGh+e52ac4k03jpphEtPeG+E5hPkikc9jLUvrAGLgvChue
         q33xkXEERN0TvSoyv0MS5eKGT0nHYMYwgmxojrQ23W2OF4hTL5fguntO/gWsvnk5wvyl
         t5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775576712; x=1776181512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdgebIX8WCshNHCphbYwlC8WuuoYhJuJww2bMe0846A=;
        b=mjGzLHC291I8tv9er/KGSwxBVJP6r2gNmCvDQD9sjIyGNzeM1uuMZcPbRzvMSSoiHF
         xMOnyEkWLalRf5m/A53cnL+BD25JNBT3r7DEKXJR13uzK/YWzKRSeG8z7ZbEfDrHIXjZ
         PTNKdSjYBrRl9D4Ny3+hnPzKXv4LlaMTWxq8O82r5J3WnwDsz4V9Ihdr2L+lwXXXNgbk
         ONu1xiOzB7f0tQi23x1LflaKdRtjgrgGK4UNdA7cC7yC/kCbx1vfYaUcEHzKu6ORMXmD
         FHD4hV/8iLmnJh7PmurfhGJImeGVy2buagslXL0fTxFY4M3m3uk6jlMdhgiLay9qNPb/
         j+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCX/o0zKqp8HMrAhA6kNutTr1hDTPFE4O/tm/xd+odGTsiKrHoy0tN7cAIRCHbj1UPJhzpIzhOwfWIWvJNxpvk9S@lists.infradead.org
X-Gm-Message-State: AOJu0YxnYJ2kn8Ixt2mAgaWlbNyzIRmL7SJhYhj0+f/ZV8rDC94P/8BK
	8bKb7LsgVZ0ctCoXmVkYBXOawlwINSX2OXqDNTiuPgrtMGmhD4tEKsO9
X-Gm-Gg: AeBDievdrY25ufy/ngSCxrvj05jsne9uH5fcjjCyDjiHTGjoWHfsFXW8WMrVQyZ35BS
	e6dNBfF3C6tE2H1apBkD0MaOwbKzj/1faaOw9c0zSX/w3yg8ifCZRexEKKv1msZL/0phYl+83ag
	TRV2JhLRhuBMLBTlVD1Ckeu+6yb1IO4VyxuAgMf6uA1a1AgItrdJjbAxd/bFSC9IBvbPLMzBSDC
	Awh/Wv4T66FBdPvbOIZCbG9x1TpssXBfneNGriDT5M1OmIcgD++Uvs85dZ6nr1CgLTKsd9rjl7T
	5cU5tT2wrbx2O3QPbHot81ayCtk52qr0QsMf0tuz5rYQOfyvayUsAUsS3NnLdzFbESs3OsVxtVE
	y12GcF9m7PDD58appYeQBGmcMEmIcD0mPLipIOEdP4KMIhcQK7/MJYpM69P7T+fKW71lR2YMyS2
	TRMT6Tc7ivIZSqmISfH9gLPAI=
X-Received: by 2002:a17:903:1aa8:b0:2b2:42b1:ad9a with SMTP id d9443c01a7336-2b28182be11mr183382875ad.19.1775576712346;
        Tue, 07 Apr 2026 08:45:12 -0700 (PDT)
Received: from BM5220 ([49.215.226.71])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b27472d55fsm230992905ad.11.2026.04.07.08.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:45:11 -0700 (PDT)
From: Zenm Chen <zenmchen@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: zenmchen@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH mt76] wifi: mt76: mt76x2u: Add support for ELECOM WDC-867SU3S
Date: Tue,  7 Apr 2026 23:44:30 +0800
Message-ID: <20260407154430.9184-1-zenmchen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_084514_002401_4BACB630 
X-CRM114-Status: GOOD (  12.17  )
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

Add the ID 056e:400a to the table to support an additional MT7612U
adapter: ELECOM WDC-867SU3S.

Compile tested only.

Cc: stable@vger.kernel.org # 5.10.x
Signed-off-by: Zenm Chen <zenmchen@gmail.com>
---
This ID was found from [1] and adding it to the device table should be 
enough to make it work. Hardware probes at [2] can prove its existence.

[1] https://bushowhige.blogspot.com/2019/08/ubuntu-1804-mediatek-usb-wi-fi.html
[2] https://linux-hardware.org/?id=usb:056e-400a
---
 drivers/net/wireless/mediatek/mt76/mt76x2/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
index 01cb3b283..459c4044f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
@@ -16,6 +16,7 @@ static const struct usb_device_id mt76x2u_device_table[] = {
 	{ USB_DEVICE(0x0e8d, 0x7612) },	/* Aukey USBAC1200 - Alfa AWUS036ACM */
 	{ USB_DEVICE(0x057c, 0x8503) },	/* Avm FRITZ!WLAN AC860 */
 	{ USB_DEVICE(0x7392, 0xb711) },	/* Edimax EW 7722 UAC */
+	{ USB_DEVICE(0x056e, 0x400a) },	/* ELECOM WDC-867SU3S */
 	{ USB_DEVICE(0x0e8d, 0x7632) },	/* HC-M7662BU1 */
 	{ USB_DEVICE(0x0471, 0x2126) }, /* LiteOn WN4516R module, nonstandard USB connector */
 	{ USB_DEVICE(0x0471, 0x7600) }, /* LiteOn WN4519R module, nonstandard USB connector */
-- 
2.53.0


