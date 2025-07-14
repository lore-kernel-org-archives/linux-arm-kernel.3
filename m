Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5810DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T2txVBWpSxQdy3Fcrxbij62RZ7YTlFf2Ww55k0vS1/0=; b=megSarlej3rhtSHGdGb/HqpxIR
	huYDqRKyhNSl/UQo/GzR7gGx/2MwvEXW1LVoyy0jsRlTItqf8E4nXlMUzV2Gw7fHuB8NcU/tWX820
	/TSPg0cKZ/di5CR/L3DtQMwQKAOvWWPsG2mODR7FmmZY41w8vQlnPLWzr/nimBLXKdimp34n709fS
	RWwEOvgc9HKI0g1G9gqgKLaWUlwfOwUGHzHhFBXq9RFqbNHqrtSLAaSQbz/Ccw2J63RFuFH/HhsAg
	ojOwmbArouUJ/6+9IzHRW4aRJWOqHDlZOB6OIF4ocime7kAOYqbVxtm4rBNF31hU/5Uvpz9uCwD5n
	F+pJxeNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPpf-00000003DKE-0ajb;
	Mon, 14 Jul 2025 20:31:27 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPnD-00000003Cur-1DDE;
	Mon, 14 Jul 2025 20:28:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVujhpmw2uFfNSHfLaCkVNRYqUPclLi1vTRciYOxJhMvMH9aoENmF92OOMByXMO06nLsmvOmPiaCT7l7laTL04sc7kQb96yU7tRV+6xCqtATIIvJOPPkyc1/JklwjlF2e6yQNfRqu1Iz1W/BrwHd1f1LYyzw8LQjKGn84pmPuqJ0LqQZAl0PDf9LAQCuR8nOVLafOPsq3serzIXbH+4O9F7jzIpGYF/FIwSqydLJu5HUBZRDvkNVxgK5bhFVT4rgDC7QaYKLs87BsMkOqbLlV+j8thRz916DYJ6KRCEulqniOACNio4fvHsp4vO+5rBNzriMPSjjf4VpBARJDsqEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2txVBWpSxQdy3Fcrxbij62RZ7YTlFf2Ww55k0vS1/0=;
 b=YcMHtFGoHZoMRN1cmzZ8N+uOWzDHlshbFR6L9yXAmZBhzXu9fEL4yEHxpDeZds3tzF+LCV9313YpFPWR0YD/qXJWzd6sd2kfM/BTNLYi10XbOcMYoNSkzmYZKoABp6J9ehgmcQti25UAkrafN5XyxpMO7hcITRqGMk4I+A8+D4LWBviUP4QMVgp1uAV0RfZ0noNH3p8kNCrNUdFOjWptWZElx57xFgY9bU9FKgxHf6z1Tzd0CBEH17q672vafLtdUDGKNLHyyDEfotQtmaeL36wRrHE58+hLvlSwUZnN0xT2+pQ8f2RyGRimlY57pHa/8dOwsWjP3MzQcA6wNhznGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=holtmann.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2txVBWpSxQdy3Fcrxbij62RZ7YTlFf2Ww55k0vS1/0=;
 b=lRT7mq2YjQI3aUNhfAK4in8v3gYv4hmfol59LrQ7LVP880N6pDPuuuOXtBWNA07b187lmjgkwW0ez8JFSVNigqEkXWpK0f6i8ObnYghtbdepIT84Xru0N83BseklUJOZG6ofjpPBunZJlE8h0QK88IdLz1m2fhyBOp4Kmj4vqbs=
Received: from DB8PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:10:100::27)
 by DU0PR03MB9056.eurprd03.prod.outlook.com (2603:10a6:10:464::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 14 Jul
 2025 20:28:40 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:100:cafe::9b) by DB8PR06CA0014.outlook.office365.com
 (2603:10a6:10:100::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 20:28:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 20:28:39 +0000
Received: from N9W6SW14.arri.de (192.168.54.14) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Mon, 14 Jul
 2025 22:28:38 +0200
From: Christian Eggers <ceggers@arri.de>
To: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>, Pauli Virtanen <pav@iki.fi>, Johan Hedberg
	<johan.hedberg@gmail.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang
	<sean.wang@mediatek.com>, Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	"Neeraj Kale" <neeraj.sanjaykale@nxp.com>, Yang Li <yang.li@amlogic.com>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
	<linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <asahi@lists.linux.dev>,
	<netdev@vger.kernel.org>, Christian Eggers <ceggers@arri.de>
Subject: [PATCH 1/3] Bluetooth: hci_core: fix typos in macros
Date: Mon, 14 Jul 2025 22:27:43 +0200
Message-ID: <20250714202744.11578-2-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.54.14]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|DU0PR03MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e161f26-55a5-4ba4-bb41-08ddc31504d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Gz/dlVafk5R7I/Fpl+RNxKASHbNrgJ+sGsW7HX7uiQOV+IRKIkkGGmTA2tcB?=
 =?us-ascii?Q?vdzIeB8rGysgysWa1pC5ixKi19R8nwtjm8xGri821k2ifrZVgwtI5TpEyJn3?=
 =?us-ascii?Q?/LrsMy1LiKMQXbpJUrwZqtD0tsifLD6E0elbqjv2HyGi2v2F40OB1Djip5xc?=
 =?us-ascii?Q?8iGz8IbrW/H66JeTzdrJaJ12UvYvAfKVhadwupqQyTqo3PZ4uZ++UOvaslG8?=
 =?us-ascii?Q?8Xdxn5c8obAHNhUqqntUzBbQm/PFv9UhRUBGqACOwlWgxkq2YEw0cBxenvxS?=
 =?us-ascii?Q?scO0v5vJtj4/fhFg0T5JNrO5ZMPch6Hle7GAGulGa8dHgXy9UJvJLn2rFMd9?=
 =?us-ascii?Q?yEGl4GJ9bhtD52OyMGA1+9egHY1qIhqpchpSJnF8a8sGTofhpgNircKOOJel?=
 =?us-ascii?Q?/+OKoLrs77NQX533kjgkWwhl5KKvy//0yplz8N9ukXYwhED/KIYLQYsOBrnx?=
 =?us-ascii?Q?Eg63VkTOW6zQ5kvSStpVEbc+42VDLFDw9rw9VuXa9ONAOB68jY+7tkB1+LeP?=
 =?us-ascii?Q?QDpfus1rD4sJ8X6ShXjOx4K35Zkw9jMt0KNdDmK/4aWiLInINvh/uo8L6pRN?=
 =?us-ascii?Q?r/zGcEeuURgJCsA/hrPZYhEFnLCgpiLTA7aQO5BeRRNeeSh07SvNCplGUCup?=
 =?us-ascii?Q?iv/uI3dc6GwwzQkh/mJWEwIPZq66paXEKocJg/ryYUzYrX8z5Nj2TGsBhU54?=
 =?us-ascii?Q?y1jXHFM2RSI2hu3XdY7Pd05ceyGwB6u54760od+dDa2phye+bCHf1aBTo9pq?=
 =?us-ascii?Q?VbBIvpSYJH7Pi+51GZSTrPJ2efWZwPkQPNWsiDgiyE61n7ufkq3x6RMk9zGP?=
 =?us-ascii?Q?IgzyJaVKJIVIAYvYSKzjtQcGzjYiUp0gEXX+xjZtKX+snzXalIms56wYh39B?=
 =?us-ascii?Q?3DI3WGkOcP5At7XoQGEOJl1e2NeMaAoSytrJhGZ0bs0Su+efvp1WrpdZ9BcG?=
 =?us-ascii?Q?Ygy/mLkmHOs6v3RqIy0/Lc0q/lPL4jYBRcYbcTawJdkz4NA37494FgFsuICH?=
 =?us-ascii?Q?pDeDnX/wvbSZUnKi5ukWBu5LflJI59hL309rurg5GlOqNgt4xRkaXdOUKeM1?=
 =?us-ascii?Q?M5RpDl2N0HxsaE/Z8B94Yn08UH8qnvTui+0wlq6DXI1HwAg/SDqByqRQQV8c?=
 =?us-ascii?Q?Iv9iOksYm2aYYsNFUeQ8YUdV87XkVCGMKCik5wLv+icDmG4xWOQy1K2iafuM?=
 =?us-ascii?Q?Hagy/FCXC+afgkBlssbLJcaix/0aF0o1F5elLXPW6lWE83t6B3ratXQQF8hC?=
 =?us-ascii?Q?82GVo7Mbp2uTM1eOUz2Q4GDKyIKJF+xwF5/hnNPTN0+Orc0S5WByFTFGbmfN?=
 =?us-ascii?Q?km+BiIhl59m1IKE3FxE1ARqJAZ9bleDlAQiphp6lte+chsLcXgZ4WeP8tk2W?=
 =?us-ascii?Q?/cALc5YQ0bCQ7mrdKoRizuc7yXezGY8NFeLlWaOzfQK55UpNdk7kfFfT0xLo?=
 =?us-ascii?Q?DXDNYwtIM9wbM0lTM2u7h+MPhNIkpUJ9wBairSK9sub+xp+myvtaYevI4w1J?=
 =?us-ascii?Q?L4zDnmFb3rRnmq1Z/zFi1QGZeTnPfnQW9DAO?=
X-Forefront-Antispam-Report: CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 20:28:39.8537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e161f26-55a5-4ba4-bb41-08ddc31504d4
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_132855_528018_6A5DAD68 
X-CRM114-Status: UNSURE (   9.56  )
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

The provided macro parameter is named 'dev' (rather than 'hdev', which
may be a variable on the stack where the macro is used).

Fixes: a9a830a676a9 ("Bluetooth: hci_event: Fix sending HCI_OP_READ_ENC_KEY_SIZE")
Fixes: 6126ffabba6b ("Bluetooth: Introduce HCI_CONN_FLAG_DEVICE_PRIVACY device flag")
Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 include/net/bluetooth/hci_core.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 3ce1fb6f5822..acaaad55e75a 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1921,11 +1921,11 @@ void hci_conn_del_sysfs(struct hci_conn *conn);
 #define ll_privacy_capable(dev) ((dev)->le_features[0] & HCI_LE_LL_PRIVACY)
 
 #define privacy_mode_capable(dev) (ll_privacy_capable(dev) && \
-				   (hdev->commands[39] & 0x04))
+				   ((dev)->commands[39] & 0x04))
 
 #define read_key_size_capable(dev) \
 	((dev)->commands[20] & 0x10 && \
-	 !test_bit(HCI_QUIRK_BROKEN_READ_ENC_KEY_SIZE, &hdev->quirks))
+	 !test_bit(HCI_QUIRK_BROKEN_READ_ENC_KEY_SIZE, &(dev)->quirks))
 
 #define read_voice_setting_capable(dev) \
 	((dev)->commands[9] & 0x04 && \
-- 
2.43.0


