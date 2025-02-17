Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A41C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 05:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KE2EP/65t8zALUqL1fIuDlBuV/BM/Oz7CPXClRtLJlg=; b=JRGGx1c2TJQ6SGKR7l3AGRW/8H
	T3aboUH80ISLtyB4YUO9K0b/I3MBHFQMsxMwaDfWTXhinq3n1Q5U7d10ZSr0Wp8Z/ldtSbMXzltf/
	EfgkI+XolXiB0d9+61OvoIJYlGxreHs8XTHUqKvTviidjDZTfTE8mqTWJ7oxkcuNeLaY8VMz3fqDw
	N/QYfGLaf6UQH88VML8SWwkuLEji8Jp5fVvlruvqaMc/S7ehz8AsrztmMv9XKSpTTfenEATNu2DYr
	DFtnz2pFC0PYdg0a4HpumWorPCtIXPeyh3VhG1ql7226obDPxCNXwanIQ5Sp7KVSspOloGDUWZ0Yl
	wjlDDitA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjti4-00000003LYG-1dHu;
	Mon, 17 Feb 2025 05:30:24 +0000
Received: from mail-japaneastazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjtgA-00000003L9i-19tI;
	Mon, 17 Feb 2025 05:28:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2tI3c+8dXk6hFw3JLy9r4MvbuOgILbe5pLOXuFtKNtrA2+y7FPwIVuXCvp4DmROrCFCps0237kX+8aABjMQnkzTUlL3LpBe3XPESi61pMsS9XB0splqbRIMVBcz1eJpqden/Qg/curmBhXfT8CZbOORRzXvtAMDRemQytTu/acgxroeqwDf6SF3TGD/ypK8P9Nkl2xjodcbtUJ7P5jnSkiiUdgbzoMT3fvwgKaaUb5BpqHYttp4HAn8lpUbHamzhM0po0TEuwCQswh0epD9M7pb9AU5piZ8k8Xdpxs9WtTmJpGTPi9lhm8Cail4YLTeO7fXWishcD7c8kYE5gacLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KE2EP/65t8zALUqL1fIuDlBuV/BM/Oz7CPXClRtLJlg=;
 b=JvYE3hreSxZA21ClUelJSVRh+06JA99etqZMfim0qJBW26SW8Uq2n6J3NZEgZNU5TfKpGV8UluqXMrabSbsDUorkwhAUfAo0CdjgIgEcrNhhM29D5dZjUFdzE5C46g9guenzKQ8ZYsXUp1j/jX9ZRF+MU7chOKfYrNZbcrj54CWOaa4G36O6F3dY52ySS/cpB89KXitkqG21pZheFStJSS4dqMv1+tawhuadVDjMcPgOWq3ddmhPj7hdiU3fvhUw+VTv3sflpFAKI2mCZ51/laIVusY0k79h1kPWWqSq1SBvr6H71yIVKhUSTxUXUuKmyDWcHldBlzHEfSlPnAfdOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KE2EP/65t8zALUqL1fIuDlBuV/BM/Oz7CPXClRtLJlg=;
 b=fEkb9bOwzOCCzVd4odEkHvO3uwVBrlQhyZ+3Wvwkv278IHg/8i5a3YxgUjru4t7YrizQ5fBpQt0tD+2vAKfJV56APKLUOg9gRCe3BKxJZRd8UeLerN4EMIiyWa1sg4P4cEEigmfH2tWUZLpK9DRPIrf2HaJsaqSdycxBUniLLmhYt1w8DQHY5sEnPwm+1daaOUQuiFXtnLPoWiSN3xczX9bS465ZoPqsKJPwEiEU5/8rZIvASffDdNPScalqvJg1Cd2yU0/nD5jyvbMMY9QaRbQxLG9Qt1vZIlO/WJqwksJ1adXqxl/ikQPuJTNcWJzmchpV2KYzx01KMWuQ5x25Uw==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by OS3PR01MB10249.jpnprd01.prod.outlook.com (2603:1096:604:1e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 05:28:04 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%5]) with mapi id 15.20.8445.008; Mon, 17 Feb 2025
 05:28:03 +0000
From: Shengyu Qu <wiagn233@outlook.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	johannes@sipsolutions.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kuba@kernel.org,
	henry.yen@mediatek.com,
	Bo.Jiao@mediatek.com,
	edumazet@google.com,
	miriam.rachel.korenblit@intel.com,
	emmanuel.grumbach@intel.com,
	chui-hao.chiu@mediatek.com,
	nicolas.cavallari@green-communications.fr,
	christophe.jaillet@wanadoo.fr,
	chad@monroe.io,
	sujuan.chen@mediatek.com,
	StanleyYP.Wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Shengyu Qu <wiagn233@outlook.com>
Subject: [RFC PATCH v1] mt76: mt7915: wed: add wed tx support
Date: Mon, 17 Feb 2025 13:27:56 +0800
Message-ID: <TYCPR01MB84374459E6D6B7BB602977CD98FB2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::21) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <20250217052756.33073-1-wiagn233@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|OS3PR01MB10249:EE_
X-MS-Office365-Filtering-Correlation-Id: 257931f4-68fe-41ba-78eb-08dd4f13d9e6
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|7092599003|5062599005|15080799006|8060799006|19110799003|5072599009|1602099012|3412199025|4302099013|10035399004|440099028|12091999003|41001999003|19111999003|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?as49qkb+IrZFdZ+HJVx02rzu9RyX3RKxwY1agRwrHqzSBTVepJo3MeSEToH1?=
 =?us-ascii?Q?iIAw+3iZFkGYC/QiiP8vDxVe/W9Fwl7GpeI1D1ODYZoVKuMsiZto1Nzoj9yF?=
 =?us-ascii?Q?o3Di7PZSxhQQvzjJbGRn/iHI8vGORAqRjMgSTZltLSeVBvnxh6MabAgwiuur?=
 =?us-ascii?Q?Ven4IhV6/P2pzcduv6+bed+WY0hyBBSH/WFAAkZzmlnLZv5fcFQEtIFGE5RF?=
 =?us-ascii?Q?UbdXgthg/xqOVCDC/7A8tdu73U/TjAPBkw/rgRJETtLfl0nkqolBMT280kwC?=
 =?us-ascii?Q?FguJgWZZ2TiHGTcD4bInA9qp0/muDieRi9FQzoIY9/mciArWNZaoVW2HsAYI?=
 =?us-ascii?Q?ZwYMp4deAP5lfTBI+MX7CR9xj4/AStwB8o74woV5Sk+kE/r+aqcWZf4HZ+c0?=
 =?us-ascii?Q?YnfcPdw6L733MdZX0Hu2LT2r7KfzNxKqmVqhnsPNSdMbsl5OgYb4uzvvm2l6?=
 =?us-ascii?Q?v0v7FIUm3/4dRSc6ND89Ij2VX2VcpO33Gi4eoWy0/oG0zsZO0MeZkB5ZrGue?=
 =?us-ascii?Q?WSP9lcm0IPElUWZsrRr6hcZkBH8NQAwCbSe3FMtJzXJk5K0fTNJfRVrmguub?=
 =?us-ascii?Q?fQ2uTG9HqhnIbq2g+dgCuyR/ZX4JcSycLWUXoovV+Wd6eAxbAnKos2wxK7Gg?=
 =?us-ascii?Q?iEzSXEhkydxcqmLyT19OiTCePyH5NZEjxthYLwzHopapQKloar4iuHbLKhw5?=
 =?us-ascii?Q?xjHHQG6mEv94S2z29RBZ0PawE5RJKVP/QuaZ6U4yfBn6QWHmRU9TzR+3J+3d?=
 =?us-ascii?Q?t2O0G8Hg1k3aothIIAQpBlUkcKu6qNama9yA3gDcfThL3R5/Pq1+Ncv6+l6I?=
 =?us-ascii?Q?o7Nn0hbkz9I/LW4OfGbrWNM0EH2X8PO7S/3LrhLyzvQmPdgZAyvs1/5dHCuJ?=
 =?us-ascii?Q?JedozdiFzv2qnQSpvvHvDvjIhp49LfQJCmQ+OY0zCK2q8zYVqdqNw91cDqQP?=
 =?us-ascii?Q?6hDP6R510asAwT5uCiDIYkZrktpLSvJCPKI4Kqa9hrw+4lybkPcHOGYOuDx9?=
 =?us-ascii?Q?yOx+nmkmhVoTSsd2rzLNQQwL+zcZLLFyPHG1lHyeIub746CUV7GlWQVZzk52?=
 =?us-ascii?Q?C2wFwfwqCDmlADqbJk367xpmQMNIuK25sqU+WXbd+cnI8zjmZ6subp/xO76n?=
 =?us-ascii?Q?C4RUJjk2CpGH3VD8v2c6NxQp1rYsvVxqvwE+GaBgP/P3GjVLguAWrSQDl/dW?=
 =?us-ascii?Q?vMnicC1WySoMwTAD+7/K/qYQJLQRMf9/RrvHlTWAPr6ZWUSVt4Zqy3vRKF72?=
 =?us-ascii?Q?lLbALOH0aG6DsViiCOte/2DbKfkTBm7RPYNuBNC4WUwzTc74Qrwy/eyYDEs3?=
 =?us-ascii?Q?f/7Z2v9K5ol3sx05vP9tbNq0YrjP+m54YBOihkK+DRDZxw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+l4uQEajaZd3Q+nUAMtCS3C95Rbdm3Y7XJcvkqjikq8ZIDY+RB4a/MPQpbSP?=
 =?us-ascii?Q?8wRKDxrbm6roZTw02N6FMwZUmM88dRNIoGLynyfsq320QDBOO4zbkjvxxYfM?=
 =?us-ascii?Q?O348VfchjCtmzwtPMKm3h9gIxgFJqMgbgrD2NRhML5h2JaCpVCPlKDwyasBR?=
 =?us-ascii?Q?f54EogkZQ/MpO5PBtUOAfVqIgzg8FstNgZwkMWmOlMLgYT29TrmvebGFrFdI?=
 =?us-ascii?Q?Ve7sWLbObIzVVpWo15T4QXSXvMDXjqw0JJZ3RlTT7wR5PhetsL0LUmzjJfD7?=
 =?us-ascii?Q?z+jLMRMkiPBH2mFcrjXGzo/Q6AyWGd+W/xApQ4GlUE0aJBOYPUUmKOyNgqpP?=
 =?us-ascii?Q?W6/JxecO2mZt156SDTbh66SnMbwtEzh6fDyBYc2MnvQBt23E/UK8eHcEEdJO?=
 =?us-ascii?Q?2TvYG6v8GAwCQcvvo6l59aryThn+5yicDIObghR5Ddxe0FIVCgSegPEkeeWX?=
 =?us-ascii?Q?CDdlOxGoxQBVHf4ZXxNZDTF8+EdncWrmEaoDvONzcoayphHjGS2koxjBEFFF?=
 =?us-ascii?Q?QX2+CZ0y2AxrPvAI3l+PvcsDhpCqFmXS38xnAo4MUb98QHWQRjFk9zAucwRL?=
 =?us-ascii?Q?XO//Igupiu5Ja5yt2ZTk/udO6MELff2DvsKyNwguwjeQ00UvzvkfZgDhwSo9?=
 =?us-ascii?Q?/V9HHA4bAF8QwleLE3uhyuW3oA8/VU5wZNAqvqpKCJ2zYrmAd3NialrKOGdT?=
 =?us-ascii?Q?ZtJtoXU+QxTZjauS/3FvpZPuVqbS8tcBHEMpvXr6UfEus07n47WLgUEm+4Lm?=
 =?us-ascii?Q?Eg5MM0f9f8EVzjzo2xeCOI5hLPExQlq42czw3jQJ9DwzQdIeyD+UD8nivnVi?=
 =?us-ascii?Q?if1Va6v+BiEPCfPxoVaJN+XG9EHtUC4qV/AAVljeWzyLVOt+2XrtiohLyJO5?=
 =?us-ascii?Q?MHKzizsFFth7Aljij20L+zcAdUDMbICfmlaTSywxz6dNsbBTduCKMT7K+ng+?=
 =?us-ascii?Q?qkbCs2xf8yJef24hZ+frkveepvcXSFQZyya/t5gsUM/oAodB7epGWhWbZbkA?=
 =?us-ascii?Q?i/5HOUjibCJeteiT3YAFkPohMk3MHgXL3W15oC+roWvTbVK+vXyTyejBF1vD?=
 =?us-ascii?Q?u9SElnFLlKSOWP4+55ZZvIV8gZdRsRlW0lnckWjddAU2yJBPm593bxphG7xr?=
 =?us-ascii?Q?PDv3eQI6k7UTVyQiTsDxQdr8TSzYaazlBdiF8sxbUt2dXNewk9p/KyFgmsOL?=
 =?us-ascii?Q?OgAbHt7rwQGk67aPmeJVQzUmpIJJ1n7tRibeAONE1J1kT9I7Tr/u3PqtZAoM?=
 =?us-ascii?Q?YpC6fDssRYgFFAuorHpxDmufew0wQ9CPe2q70v5MqIkBgtImf4l9IbZB1kOg?=
 =?us-ascii?Q?Qu4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257931f4-68fe-41ba-78eb-08dd4f13d9e6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 05:28:03.8709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_212826_310962_34729954 
X-CRM114-Status: GOOD (  14.22  )
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

Adding TX offload support for WED on mt7915 driver.

Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
---
This patch comes from downstream driver[1], I'm not sure if it's
needed, so I sent this as RFC.
[1] https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/cbc4fee8452e0fd7168a332915eaa23a356101c3/autobuild/autobuild_5.4_mac80211_release/package/kernel/mt76/patches/2000-wifi-mt76-mt7915-wed-add-wed-tx-support.patch
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h   |  1 +
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c    | 10 +++++++---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c   |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c   |  1 +
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h |  2 +-
 drivers/net/wireless/mediatek/mt76/wed.c           |  2 +-
 6 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 455979476d11..4495f126a2b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -131,6 +131,7 @@ struct mt76_connac_sta_key_conf {
 };
 
 #define MT_TXP_MAX_BUF_NUM		6
+#define MT_TXD_TXP_BUF_SIZE		128
 
 struct mt76_connac_fw_txp {
 	__le16 flags;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 2ba6eb3038ce..ea5fdd9fc014 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -840,9 +840,9 @@ u32 mt7915_wed_init_buf(void *ptr, dma_addr_t phys, int token_id)
 
 	txp->token = cpu_to_le16(token_id);
 	txp->nbuf = 1;
-	txp->buf[0] = cpu_to_le32(phys + MT_TXD_SIZE + sizeof(*txp));
+	txp->buf[0] = cpu_to_le32(phys + MT_TXD_TXP_BUF_SIZE);
 
-	return MT_TXD_SIZE + sizeof(*txp);
+	return MT_TXD_TXP_BUF_SIZE;
 }
 
 static void
@@ -891,6 +891,7 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, void *data, int len)
 	LIST_HEAD(free_list);
 	void *end = data + len;
 	bool v3, wake = false;
+	bool with_txwi = true;
 	u16 total, count = 0;
 	u32 txd = le32_to_cpu(free->txd);
 	__le32 *cur_info;
@@ -960,12 +961,15 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, void *data, int len)
 			txwi = mt76_token_release(mdev, msdu, &wake);
 			if (!txwi)
 				continue;
+			else
+				with_txwi = false;
 
 			mt76_connac2_txwi_free(mdev, txwi, sta, &free_list);
 		}
 	}
 
-	mt7915_mac_tx_free_done(dev, &free_list, wake);
+	if (!with_txwi)
+		mt7915_mac_tx_free_done(dev, &free_list, wake);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 3aa31c5cefa6..ca3612cbab85 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1726,14 +1726,14 @@ mt7915_net_fill_forward_path(struct ieee80211_hw *hw,
 	if (!mtk_wed_device_active(wed))
 		return -ENODEV;
 
-	if (msta->wcid.idx > 0xff)
+	if (msta->wcid.idx > MT7915_WTBL_STA)
 		return -EIO;
 
 	path->type = DEV_PATH_MTK_WDMA;
 	path->dev = ctx->dev;
 	path->mtk_wdma.wdma_idx = wed->wdma_idx;
 	path->mtk_wdma.bss = mvif->mt76.idx;
-	path->mtk_wdma.wcid = is_mt7915(&dev->mt76) ? msta->wcid.idx : 0x3ff;
+	path->mtk_wdma.wcid = is_mt7915(&dev->mt76) ? 0xff : 0x3ff;
 	path->mtk_wdma.queue = phy != &dev->phy;
 
 	ctx->dev = NULL;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 876f0692850a..5addaf61bd80 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -723,6 +723,7 @@ int mt7915_mmio_wed_init(struct mt7915_dev *dev, void *pdev_ptr,
 
 	*irq = wed->irq;
 	dev->mt76.dma_dev = wed->dev;
+	dev->mt76.token_size = wed->wlan.token_start;
 
 	ret = dma_set_mask(wed->dev, DMA_BIT_MASK(32));
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 533939f2b7ed..bd1006be37c5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -60,7 +60,7 @@
 #define MT7916_EEPROM_SIZE		4096
 
 #define MT7915_EEPROM_BLOCK_SIZE	16
-#define MT7915_HW_TOKEN_SIZE		4096
+#define MT7915_HW_TOKEN_SIZE		7168
 #define MT7915_TOKEN_SIZE		8192
 
 #define MT7915_CFEND_RATE_DEFAULT	0x49	/* OFDM 24M */
diff --git a/drivers/net/wireless/mediatek/mt76/wed.c b/drivers/net/wireless/mediatek/mt76/wed.c
index f89e4537555c..d963928392bb 100644
--- a/drivers/net/wireless/mediatek/mt76/wed.c
+++ b/drivers/net/wireless/mediatek/mt76/wed.c
@@ -171,7 +171,7 @@ void mt76_wed_offload_disable(struct mtk_wed_device *wed)
 	struct mt76_dev *dev = container_of(wed, struct mt76_dev, mmio.wed);
 
 	spin_lock_bh(&dev->token_lock);
-	dev->token_size = dev->drv->token_size;
+	dev->token_size = wed->wlan.token_start;
 	spin_unlock_bh(&dev->token_lock);
 }
 EXPORT_SYMBOL_GPL(mt76_wed_offload_disable);
-- 
2.43.0


