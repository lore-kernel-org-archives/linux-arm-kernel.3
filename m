Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB5DC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uDuCxK0mmyTeapoMsCrvd2j/BIGG+Bux6dmS2mT4ZCE=; b=D/ZWwBKSL9tX1w+xpIx6t92OVN
	OSFnkiZfS6ggQaSEKN0+GeRCa7lyttr/4fOCdqoDJOYyf/l+5/zidbgWfP/3VKM+7/NZNwinFkM4F
	e/roCPM0fm25eQrPBUjpRsc2h2oRoKMwBVm+ziMlAPF9cSbc3Btjh2y4k7EG1fQxdpHm4v7Re3O2Q
	CrtAFexEyrd2Z49Hcy1z2v5zrogoTwOKvF7rIsPaB/sL2o9UbwSYoVsCFmsRbJsSur/x7KBrgvjmo
	xuqxPdX8K0YdCzLIcdrNVIumlWSWhelcI4I9VdULgjLrDAkVcbRMaf23hdFQAHQcGkpOIxLPjqxLj
	8TgUAzBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqwEz-0000000GnnW-2Ykf;
	Sat, 08 Mar 2025 15:37:29 +0000
Received: from mail-japaneastazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d405::1] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqwDM-0000000Gngn-1Odw;
	Sat, 08 Mar 2025 15:35:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJpJv7g7C3Jsp45ESpUOjvcVPdT0pddv1ZE5UJrp8HBAsNJWtX13aIw0pFQN9J74ftDXxqeMy4ov6D0neM0FkDZqOu9YhOiTatBp7yiQVgazyd0g6NZtLejcdzOtV7/jrnYIZdkJfK9vCAd5pKe/uaeXJy1AJrr8OpQ63VKS+O7xTXqo8WVZizTatYXqG1RTpfTy4nvYa80QPz5DmDOw/TB/UyAMFD1V2fY0OM1GTJ6lVcC9HNFiknH9EmS2WyeCGfni0r/8m5wDcejEBcdyumSnL5B72zbNodTgO6COd4zS5uc0NwR21waI/xEvt4ZGQmeYa3sEtfMU/3vGfDXJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDuCxK0mmyTeapoMsCrvd2j/BIGG+Bux6dmS2mT4ZCE=;
 b=AZDcOF/K4uy6/eB2bKj1XEnyINNpWanwlIf4L9t6/LmTdMRPuwsBm1ecSDwFbQFYEEWiUBz0Iv8HLOEqQvlQ6QicEaG+LbfeXrXGTUQvJx4SpCD8PG02fclNkrGB4HzqwWE3mwEVGda+uwQh1IFzfVQcFgxaL6olR8U2K6UoEGnhYOXMquTB487rCyA92+oPoKokMN6FNO3oul2HWa8w+bSCdTbGJUQ85932NqbJz4ftWpeOW0Oe5Fx/dCeSpKHmLfD9ZNAEs2lecJ8IbMQDhr6dMOd2sCHP6OOQxw2HVINb9QBAoRryilY5LeuqgKVr6UtUlLPGmCzYrdDFZjjmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDuCxK0mmyTeapoMsCrvd2j/BIGG+Bux6dmS2mT4ZCE=;
 b=EY5kv1ZMUzN2E9UH/AkGRNVHz1RV488r78YKp0oc6pm4Ot4+DlDRFtDP0fiTCM5zX5knN+yMVEPU3SfjIxIRVJIYV4YjXqGwLzNh+mDTuakxA6P4dVjnGbT/yFmvBkFUynRetb19K4m7pYXErHHB5+nxd2ADeepTGQHwez0Sq/T6BIFAQtqR+ZH8ETOg1vRgaajtVu0BkkAi+qr0COpcA8ZLLF182VXu7oWvX9URdZrSLDRwg7KvozVdbB3MTzNLPoThFTdPoRHFwJwSMbjRshQLTamxgfTpOmwtUCazKZuwoqHsv9lv2AuBVlZjgRUf5GAHTGLDquLcpWN06HFHxA==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by OS3PR01MB8729.jpnprd01.prod.outlook.com (2603:1096:604:17e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Sat, 8 Mar
 2025 15:35:31 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%6]) with mapi id 15.20.8511.020; Sat, 8 Mar 2025
 15:35:30 +0000
From: Shengyu Qu <wiagn233@outlook.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	pkshih@realtek.com,
	johannes@sipsolutions.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	miriam.rachel.korenblit@intel.com,
	howard-yh.hsu@mediatek.com,
	greearb@candelatech.com,
	chui-hao.chiu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	quic_adisi@quicinc.com,
	sujuan.chen@mediatek.com,
	gustavoars@kernel.org,
	bo.jiao@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Shengyu Qu <wiagn233@outlook.com>
Subject: [PATCH v9 RESEND] wifi: mt76: mt7915: add wds support when wed is enabled
Date: Sat,  8 Mar 2025 23:35:21 +0800
Message-ID: <TYCPR01MB84376C7074C566865654F05098D42@TYCPR01MB8437.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0043.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::11) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID: <20250308153521.2298711-1-wiagn233@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|OS3PR01MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: e0334f32-e144-4add-a32c-08dd5e56db80
X-Microsoft-Antispam: BCL:0;ARA:14566002|7092599003|15080799006|5062599005|461199028|19110799003|8060799006|5072599009|440099028|3412199025|19111999003|12091999003|41001999003|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vp3NPNUt3QqhDLrnDIP8P77foYvtS60d2xoZ7+OeVI2ah34dDVVO3JNzvWUn?=
 =?us-ascii?Q?1PLZe3dGC6CeOzuTdIxKIgaQne1ZLMk5sAgxX3ytfS2O/dcFtux2etz29Oez?=
 =?us-ascii?Q?RXEI8Fyk+sxdMuhV7zvMgpp8uu8m+wbwlg9LnQu9W1tbTuRGxLlowl06S1WD?=
 =?us-ascii?Q?TDRRmosmE1pZGvlIAuuP5EsY3R4thVnPOGYccE190FamXAyXwvhLQBtLYRvr?=
 =?us-ascii?Q?9nsORxjTXWfxatS8u97w651x3x5CQh02//iIHyaPRT0LvwPmZj0dFoRT7DOG?=
 =?us-ascii?Q?a0uebPWqMNG3nr7HKafW1QGfx7HuPRoWUjjt5EIQRZhUnBiObBNYOWMOItUp?=
 =?us-ascii?Q?sqlFQrsqm2GgyMVjYAvo93uQc7zkvG38ZClzFgIO5r+j3P3KS65zd3CAOLdc?=
 =?us-ascii?Q?uWQVt6flRE4GLV0dslMxihpyU2sTIuCYhbSpdu1uxYPwAKVECm1ee0MPifPB?=
 =?us-ascii?Q?jCQb610Wi9X5oOOvU8SMs4NwdN44stcIs7WGUS1Gz5k2lguUVlAlgDxx2Scq?=
 =?us-ascii?Q?utTThPEqU8xp5w4RmHjEi+1E2fT85bZBD9eV09vKCIda1Y4/GFYylWjgRqu0?=
 =?us-ascii?Q?LKfYaHfUuCW3sfPruNLG8Qeutvju970Wj86d/1WLG+1FOjfcivm5McSk6umS?=
 =?us-ascii?Q?71OUp7SKZh8NkIXnshtirxJcQ9q7VN1AbfoHBBlJC5QirrGhfsqLg54f+jbk?=
 =?us-ascii?Q?pFe5EYwm32t5sCxiTrdx9ozfaTXT5hkpDOn3IlVFMYbEhPlmPsFKFVMllEnd?=
 =?us-ascii?Q?8wHNHfCMV24g2mAaZW6OwYdIaSe3ACLD+EuZpeEzGh+CKBOxVsFi+XnLRNSo?=
 =?us-ascii?Q?ERG3k67aHB59P1zyRb0Qcw1nGJdmVxWafTmt96TJUGjsm2Da0taqXTh0fBfZ?=
 =?us-ascii?Q?gXLIlhyOTlEa8SW8xbpHjaP1bznPRS/Vy/lCaNXao4991NdUZLhIXNon4rnM?=
 =?us-ascii?Q?SWk/7mUbYAxMQHzBt6kuo/Z5muSm5vQq/QEULMr1qzwPV/bCgqXtP0v691kY?=
 =?us-ascii?Q?L1PwYClD/cIVfdcgtLRxMTcHGZNkkzYjcvWH+ZoTXvFB3ygUmrBH1o+c6ddJ?=
 =?us-ascii?Q?Sn+cvydaUcB8BPjdcd0JGmugLJWUVje7ipl9KArdHsUpJ7VeFmlsz12T6x9H?=
 =?us-ascii?Q?Nq2B8xdGgKUIgHifKWCO9fGd5wdIAokkjQ4QIrWnA08b6ccRkZ+HOUuJZYBN?=
 =?us-ascii?Q?bTnlAHGHj91qdEeKs4VQ6L+3kehzqRAbqemCfJMboOzuOikgPXqrrf0j0Co?=
 =?us-ascii?Q?=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fX/5cOX6uOs/bQmIP5MYDvtIYwc8Yy5qifgqYB4AccsDPlILn/fXwqhWd8lX?=
 =?us-ascii?Q?7VetAicOrICk1X4puEZvyHMuYx0iMt/gsg13IWd2HTBfxBXu6Lq76wHQ0PO0?=
 =?us-ascii?Q?ZF2NsU7gXZTHs60P4idtK6Rq++mqj+VucjUmTShW7ms3MqIRI5yL0Dxi7Qxt?=
 =?us-ascii?Q?Qf7ix3hfrsvsXittqfceQsFcixiZWYYUrTkRP4sdx+2Q7UlJFXOz1S5FBXtH?=
 =?us-ascii?Q?HH5fi94qZk3v24ZV/j13XzqRpYsN/7uy2xfS3gaqNCZiiysrjiSkYI1GO97f?=
 =?us-ascii?Q?k4NS0BdbcJDGk+hKQMt1bNLbRFm1Ss/ExtlviwyO2dXozT0kWxSWjmLJnwsb?=
 =?us-ascii?Q?Y52+RnzcVRVfAlN8X29zLUPNhKxa2JcsQfCNgKfdEmDt7WDD2sce69aN/xye?=
 =?us-ascii?Q?A4hiNd9lM/KiBtbVuW7Xkzizvr2dgHElc/k9rrNU3bKAKG1Q5/8n/Sa4/PHm?=
 =?us-ascii?Q?XvH5FYIVJMKx/QFCSUY/1M0E+HmoOThLPuauf0JfFwcjhNWnCeLHkJ+10Itq?=
 =?us-ascii?Q?RJVgdNfA67fWwniyaOWiBOMdJR5L0fgmoUbdXQCNp+dubieZT3pfSWuQIFcB?=
 =?us-ascii?Q?2QNBlGUFoQLnpq5bEuLh9srVOCQSBBHAZdk/xsgNNyWAqmdwclvW65PDwkSQ?=
 =?us-ascii?Q?lWDYE+GxzQAy7JMFHMvN223iuhPyfPweqnCb2V7m7wPQRDkbaSwzmia4/0Q0?=
 =?us-ascii?Q?FIYYq81sDRDq6wB1OJ0l6mg7yQYcgvy3SVy34930lNJrO4h2TOw/3sdxGSKv?=
 =?us-ascii?Q?IZ4Op8M5aeUH2cMaYMlPhXzAptPXqb53xuI8yZGejzAYflSTXD+HOLDhvnUc?=
 =?us-ascii?Q?YS8yY1INZ8s9ymLUPtlyb2JcJwK5MmP4OUIyhicjlNZoQAbhlnVcgAEPha4H?=
 =?us-ascii?Q?C/SZxtQ0TzHbTQE3s/0FJtkSDmMSuF7ywTZb8jFBmklKs6UJY6oO/sMiUryz?=
 =?us-ascii?Q?E2mMy4IO+XrnqKBldIc3/scfrDZS+7AJygmbzXVJ5PASXQ514JAa1fL37oKg?=
 =?us-ascii?Q?aH/C4fZ63emGgYXZOw6IH3dPQZTomS3Mpp3ga68B0GHot1Rz3nUebLF2KuQa?=
 =?us-ascii?Q?bdvWaY5NlbAdjvXL4jG1ZuXwtUrLO3UkJz8NJl7WKPj3cNOTX0jjF9DB+76I?=
 =?us-ascii?Q?hb01iosA8YVXEXjywTBEM4qOH3NRrqCTQ8h+pz2DtXWvWhFUf6MwrFEdwEVq?=
 =?us-ascii?Q?7qgCzSOyYCKz5DDBXxsd/MqhmdAk7YEpnbDoi1ofrozESFdEr4rieZkBwNFv?=
 =?us-ascii?Q?CWtqgMOHpJrrEWdnXa/tuJrnIKo4jYEMXRfZCUJeMZrbfcE/s0kK65gGtsTB?=
 =?us-ascii?Q?oGY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0334f32-e144-4add-a32c-08dd5e56db80
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2025 15:35:30.3300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8729
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_073548_472567_F676ED95 
X-CRM114-Status: GOOD (  19.72  )
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

The current WED only supports 256 wcid, whereas mt7986 can support up to
512 entries, so firmware provides a rule to get sta_info by DA when wcid
is set to 0x3ff by txd. Also, WED provides a register to overwrite txd
wcid, that is, wcid[9:8] can be overwritten by 0x3 and wcid[7:0] is set
to 0xff by host driver.

However, firmware is unable to get sta_info from DA as DA != RA for
4addr cases, so firmware and wifi host driver both use wcid (256 - 271)
and (768 ~ 783) for sync up to get correct sta_info.

Currently WDS+WED config is completely broken on MT7986/7981 devices if
without this patch.

Tested-by: Sujuan Chen <sujuan.chen@mediatek.com>
Co-developed-by: Bo Jiao <bo.jiao@mediatek.com>
Signed-off-by: Bo Jiao <bo.jiao@mediatek.com>
Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
---
For unknown reason, the v9 patch has added a strange include header,
causing it fail to compile. So I resent it with that include removed.

Changes since v1:
 - Drop duplicate setting in mmio
 - Reduce the patch size by redefining mt76_wcid_alloc
Changes since v2:
 - Rework wds wcid getting flow
Changes since v3:
 - Rebase to next-20240703
 - Sync with downstream patch
Changes since v4:
 - Rebase to next-20240802
Changes since v5:
 - Fixed build test error reported by robot
 - Rebase to next-20240805
Changes since v6:
 - Fix potential race conditions on tx/rx packets during the transition
 - Rebase to Felix's newest codebase
Changes since v7:
 - Fix build fail
Changes since v8:
 - Changed code as Shih advised
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  9 ++++
 .../net/wireless/mediatek/mt76/mt7915/main.c  | 50 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 18 +++++--
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
 drivers/net/wireless/mediatek/mt76/util.c     | 37 ++++++++++++--
 drivers/net/wireless/mediatek/mt76/util.h     |  7 ++-
 6 files changed, 111 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 132148f7b107..638ee9fae0c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -28,6 +28,9 @@
 
 #define MT76_TOKEN_FREE_THR	64
 
+#define MT76_WED_WDS_MIN    256
+#define MT76_WED_WDS_MAX    272
+
 #define MT_QFLAG_WED_RING	GENMASK(1, 0)
 #define MT_QFLAG_WED_TYPE	GENMASK(4, 2)
 #define MT_QFLAG_WED		BIT(5)
@@ -73,6 +76,12 @@ enum mt76_wed_type {
 	MT76_WED_RRO_Q_IND,
 };
 
+enum mt76_wed_state {
+	MT76_WED_DEFAULT,
+	MT76_WED_ACTIVE,
+	MT76_WED_WDS_ACTIVE,
+};
+
 struct mt76_bus_ops {
 	u32 (*rr)(struct mt76_dev *dev, u32 offset);
 	void (*wr)(struct mt76_dev *dev, u32 offset, u32 val);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 3aa31c5cefa6..9be5937727cb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -745,8 +745,15 @@ int mt7915_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
 	bool ext_phy = mvif->phy != &dev->phy;
 	int idx;
+	u8 flags = MT76_WED_DEFAULT;
 
-	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA);
+	if (mtk_wed_device_active(&dev->mt76.mmio.wed) &&
+	    !is_mt7915(&dev->mt76)) {
+		flags = test_bit(MT_WCID_FLAG_4ADDR, &msta->wcid.flags) ?
+		       MT76_WED_WDS_ACTIVE : MT76_WED_ACTIVE;
+	}
+
+	idx = __mt76_wcid_alloc(mdev->wcid_mask, MT7915_WTBL_STA, flags);
 	if (idx < 0)
 		return -ENOSPC;
 
@@ -1271,6 +1278,11 @@ static void mt7915_sta_set_4addr(struct ieee80211_hw *hw,
 {
 	struct mt7915_dev *dev = mt7915_hw_dev(hw);
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	int min = MT76_WED_WDS_MIN, max = MT76_WED_WDS_MAX;
+	struct ieee80211_sta *pre_sta;
+	struct mt7915_sta *pre_msta;
+	u8 flags = MT76_WED_DEFAULT;
+	int tmp_idx;
 
 	if (enabled)
 		set_bit(MT_WCID_FLAG_4ADDR, &msta->wcid.flags);
@@ -1280,6 +1292,34 @@ static void mt7915_sta_set_4addr(struct ieee80211_hw *hw,
 	if (!msta->wcid.sta)
 		return;
 
+	if (mtk_wed_device_active(&dev->mt76.mmio.wed) &&
+	    !is_mt7915(&dev->mt76) &&
+	    (msta->wcid.idx < min || msta->wcid.idx > max - 1)) {
+		pre_sta = kmemdup(sta, sizeof(*sta) + sizeof(*msta), GFP_KERNEL | __GFP_ZERO);
+		pre_msta = (struct mt7915_sta *)pre_sta->drv_priv;
+
+		flags = test_bit(MT_WCID_FLAG_4ADDR, &msta->wcid.flags) ?
+			MT76_WED_WDS_ACTIVE : MT76_WED_ACTIVE;
+
+		tmp_idx = __mt76_wcid_alloc(dev->mt76.wcid_mask, MT7915_WTBL_STA, flags);
+		if (tmp_idx == -1)
+			goto error;
+		pre_msta->wcid.idx = (u16)tmp_idx;
+		mt7915_mac_sta_add(&dev->mt76, vif, pre_sta);
+		rcu_assign_pointer(dev->mt76.wcid[tmp_idx], &msta->wcid);
+
+		tmp_idx = msta->wcid.idx;
+		msta->wcid.idx = pre_msta->wcid.idx;
+		pre_msta->wcid.idx = (u16)tmp_idx;
+		rcu_assign_pointer(dev->mt76.wcid[tmp_idx], NULL);
+
+		synchronize_rcu();
+		mt7915_mac_sta_remove(&dev->mt76, vif, pre_sta);
+
+error:
+		kfree(pre_sta);
+	}
+
 	mt76_connac_mcu_wtbl_update_hdr_trans(&dev->mt76, vif, sta);
 }
 
@@ -1726,15 +1766,19 @@ mt7915_net_fill_forward_path(struct ieee80211_hw *hw,
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
 	path->mtk_wdma.queue = phy != &dev->phy;
+	if (test_bit(MT_WCID_FLAG_4ADDR, &msta->wcid.flags) ||
+	    is_mt7915(&dev->mt76))
+		path->mtk_wdma.wcid = msta->wcid.idx;
+	else
+		path->mtk_wdma.wcid = 0x3ff;
 
 	ctx->dev = NULL;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 9d790f234e82..32c5aa1a361e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2385,10 +2385,20 @@ int mt7915_mcu_init_firmware(struct mt7915_dev *dev)
 
 	mt76_connac_mcu_del_wtbl_all(&dev->mt76);
 
-	if ((mtk_wed_device_active(&dev->mt76.mmio.wed) &&
-	     is_mt7915(&dev->mt76)) ||
-	    !mtk_wed_get_rx_capa(&dev->mt76.mmio.wed))
-		mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(CAPABILITY), 0, 0, 0);
+#ifdef CONFIG_NET_MEDIATEK_SOC_WED
+	if (mtk_wed_device_active(&dev->mt76.mmio.wed)) {
+		if (is_mt7915(&dev->mt76) ||
+		    !mtk_wed_get_rx_capa(&dev->mt76.mmio.wed))
+			ret = mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(CAPABILITY),
+						0, 0, 0);
+		else
+			ret = mt7915_mcu_wa_cmd(dev, MCU_WA_PARAM_CMD(SET),
+						MCU_WA_PARAM_WED_VERSION,
+						dev->mt76.mmio.wed.rev_id, 0);
+		if (ret)
+			return ret;
+	}
+#endif
 
 	ret = mt7915_mcu_set_mwds(dev, 1);
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 49476a4182fd..c3dd0cb4a5d3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -278,6 +278,7 @@ enum {
 	MCU_WA_PARAM_PDMA_RX = 0x04,
 	MCU_WA_PARAM_CPU_UTIL = 0x0b,
 	MCU_WA_PARAM_RED = 0x0e,
+	MCU_WA_PARAM_WED_VERSION = 0x32,
 	MCU_WA_PARAM_RED_SETTING = 0x40,
 };
 
diff --git a/drivers/net/wireless/mediatek/mt76/util.c b/drivers/net/wireless/mediatek/mt76/util.c
index 95b3dc96e4c4..7fac9c79ebdf 100644
--- a/drivers/net/wireless/mediatek/mt76/util.c
+++ b/drivers/net/wireless/mediatek/mt76/util.c
@@ -42,9 +42,11 @@ bool ____mt76_poll_msec(struct mt76_dev *dev, u32 offset, u32 mask, u32 val,
 }
 EXPORT_SYMBOL_GPL(____mt76_poll_msec);
 
-int mt76_wcid_alloc(u32 *mask, int size)
+int __mt76_wcid_alloc(u32 *mask, int size, u8 flag)
 {
 	int i, idx = 0, cur;
+	int min = MT76_WED_WDS_MIN;
+	int max = MT76_WED_WDS_MAX;
 
 	for (i = 0; i < DIV_ROUND_UP(size, 32); i++) {
 		idx = ffs(~mask[i]);
@@ -53,16 +55,45 @@ int mt76_wcid_alloc(u32 *mask, int size)
 
 		idx--;
 		cur = i * 32 + idx;
-		if (cur >= size)
+
+		switch (flag) {
+		case MT76_WED_ACTIVE:
+			if (cur >= min && cur < max)
+				continue;
+
+			if (cur >= size) {
+				u32 end = max - min - 1;
+
+				i = min / 32;
+				idx = ffs(~mask[i] & GENMASK(end, 0));
+				if (!idx)
+					goto error;
+				idx--;
+				cur = min + idx;
+			}
+
 			break;
+		case MT76_WED_WDS_ACTIVE:
+			if (cur < min)
+				continue;
+			if (cur >= max)
+				goto error;
+
+			break;
+		default:
+			if (cur >= size)
+				goto error;
+			break;
+		}
 
 		mask[i] |= BIT(idx);
 		return cur;
 	}
 
+error:
 	return -1;
 }
-EXPORT_SYMBOL_GPL(mt76_wcid_alloc);
+EXPORT_SYMBOL_GPL(__mt76_wcid_alloc);
 
 int mt76_get_min_avg_rssi(struct mt76_dev *dev, u8 phy_idx)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/util.h b/drivers/net/wireless/mediatek/mt76/util.h
index 260965dde94c..99b7263c0a20 100644
--- a/drivers/net/wireless/mediatek/mt76/util.h
+++ b/drivers/net/wireless/mediatek/mt76/util.h
@@ -27,7 +27,12 @@ enum {
 #define MT76_INCR(_var, _size) \
 	(_var = (((_var) + 1) % (_size)))
 
-int mt76_wcid_alloc(u32 *mask, int size);
+int __mt76_wcid_alloc(u32 *mask, int size, u8 flags);
+
+static inline int mt76_wcid_alloc(u32 *mask, int size)
+{
+	return __mt76_wcid_alloc(mask, size, 0);
+}
 
 static inline void
 mt76_wcid_mask_set(u32 *mask, int idx)
-- 
2.48.1


