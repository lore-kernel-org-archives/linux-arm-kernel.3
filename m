Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE0DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 20:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90m89bycDR1kwxbMnAznqxv9dNdPHpITXo3Mx74TA8M=; b=lTQ11qK4d/meQkjfeIko50ZmKH
	0H4jjhQBAPEiolNwvTHyz2Xn1trdPXct4YIVNgPce0mNQr9Ep5iNhxcU5M6He+DwbdHrQpuOBTdM3
	VCJN44hEFLYqvvDbil+wM37YfOccXcjP/EJ3EBfVQh/uElpa+lQkFMQCov1dxOrF/97oB94OmDkS/
	WC59BDmE+xwb4QacA0tQh/XjcQXTjEwOyfo/+JY483+uALA7GPMeXofWE3wvx+1ykfO9IXJtkQFQO
	L/+RdOM4viD72SXebDa+o9hpLuyrESSFxtmYscb9GsQKxcte5+4vPEnPVb3jylHPa/KfWESCEJnP2
	AzeaJTQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPs4-00000003Dkt-0gGn;
	Mon, 14 Jul 2025 20:33:56 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubPnL-00000003Cwp-2mo1;
	Mon, 14 Jul 2025 20:29:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vs7umq8W6FzE4OkUkVRuXHBokkPy06K+CITiPvjVrUT4FYzXYoo5L4nfvLTizjSMF+M88C4rpVfL1/DfFCQy/+Pt5Zv/GWb2Yapi2ha0puXj15ry7IaiZStT5XNCq52pDzPE/CRETQ0dRw+Dw9d84ttVGxDh1ge24NpZ+BAWUWqpeWLkfSlzIh68z5Sevh8HAtCxH7bmAxdPjFwuNW5fg9piS9QrbFrop9p+37nfWFgSN2MgGzxnqLGDToDqjhLlMAappQ8BNvRDLZMJA2rbIZpwdojbkg7DsGtQKoAVpkLVUY/VymtLLyGa3RQ17kbCVuDXBC8OJ+aSS1yGROs9OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90m89bycDR1kwxbMnAznqxv9dNdPHpITXo3Mx74TA8M=;
 b=fpkLZBQe/S8D8y6GYSakeoTl+wXE1cA+Kx8MUAtJTBftlOANaOzo7ndH0yfYCxHy1/3VlIRC0xZiCBqPUAW/j8agVRilw0Dkr6c8OTcoWAJfHz4MuFf7za5wdHQiZDjCzUpZt4ZFfrkJouEVDe3t5NiZ1PnGJn1KcaAjjAMih35UKnQWV/6kpLHG66VWygyrXizyn44gG1rmuFfhdd7yblv079Y4hf3kyKsxHBXeMAuN8uVigsBRsgFch+aWxLogC/gUDY4gYeD8A7u5dWX2g0YLL94tpZqUOY7XQwEBdTanVnlGb2Bnx2ofMYEZwkgB26Xp3fXP/VIN3tTGuwVyFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=holtmann.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90m89bycDR1kwxbMnAznqxv9dNdPHpITXo3Mx74TA8M=;
 b=Lo6bf5DjLTTcu4oYusXOKTtLiMVpsWacN9zCLxdJ8AIZwpNeAdeZWgfWmizlQdcnK5ed7Oe6zDeFaieJv2BdMepHPFD5EvtYRxBfC9wLn+LWczVBoQG55F+0W91gmLKfF296YTSy26f8PKKMTtm89YGXgNSQvBHci+axmqaJ4QY=
Received: from DUZPR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::14) by VI1PR03MB6159.eurprd03.prod.outlook.com
 (2603:10a6:800:141::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Mon, 14 Jul
 2025 20:28:54 +0000
Received: from DU2PEPF00028CFC.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::aa) by DUZPR01CA0088.outlook.office365.com
 (2603:10a6:10:46a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.33 via Frontend Transport; Mon,
 14 Jul 2025 20:29:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DU2PEPF00028CFC.mail.protection.outlook.com (10.167.242.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 20:28:53 +0000
Received: from N9W6SW14.arri.de (192.168.54.14) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Mon, 14 Jul
 2025 22:28:52 +0200
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
Subject: [PATCH 2/3] Bluetooth: hci_core: add missing braces when using macro parameters
Date: Mon, 14 Jul 2025 22:27:44 +0200
Message-ID: <20250714202744.11578-3-ceggers@arri.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250714202744.11578-2-ceggers@arri.de>
References: <20250714202744.11578-2-ceggers@arri.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.54.14]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFC:EE_|VI1PR03MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 852ec9e1-3251-4807-fa44-08ddc3150d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vZLZ/c8MrTIQH9ZcWf6uOinv+SXkaPW3z0zhtBHaftaGUg9q3J5j7YvZvd1p?=
 =?us-ascii?Q?4I6T8UI01xhKJXt9ZB/KkyHDO4X5l6JLxr+khfhWsPDUJC7sYjSpiZsF/xKO?=
 =?us-ascii?Q?zda4T9fior0SurV0bVh/T1ZvAz3xUkhIOKl8qi+GJOcoRxdRUnqp05wW/6w0?=
 =?us-ascii?Q?SjN88VZ5emTxU8zN4k5qeoxoH7D74qVMLPGlo7wtgTzx5UHSLRPdXKGcQ/ZD?=
 =?us-ascii?Q?BelOS37rrMM2YT5jLp3gocIkSP14CUIL0zvWQSZrFdOsaOyerurwfZIIZuxF?=
 =?us-ascii?Q?qBipH9dvYm4RYrVvd2+cprB4UHPo1Kt2k9JBiTU+Rib5BVttFnT0VF/GFM1T?=
 =?us-ascii?Q?Nups9+tnlresXi7cZCMkbaFXdm1l3i5bQiJ21kd8k/ZkiEDnVJrVpELdZwyq?=
 =?us-ascii?Q?FrIJwa5mTSBIX5joDknZGAWBJDOTfpKFxOTxiOFAgla+9afD9ZnVmIrh5Jo1?=
 =?us-ascii?Q?szYelnszZkSpAZQM8BaVCxNTDK1C7eXWNkmFPw2EfRm+1C5dP2GCK5/q/FjN?=
 =?us-ascii?Q?WTZLxsugJB2ldKAoh213z7Xo4eJCcfmXQ6OOexDxu41P9aJ+6dAgk9089gG3?=
 =?us-ascii?Q?bw+jlY/H1YAP9qkZNH9/rcvIbV3fV6+5k7GCHWqcTgQypSSHWlv0OOpXLTnk?=
 =?us-ascii?Q?IRswmFmaR62UMDHSmYbfyBKF2zgiTDlKUKMpmSBvsdBETuzmUgX2EfGGgAmn?=
 =?us-ascii?Q?mZmjJAqGp+ogoqMRIK1j+taxQb8/8xZ9MPk4/4etoOnMk19/cHXNoe6yaQ26?=
 =?us-ascii?Q?UTfAiZobgBLmKOSlRPp/BTitpPPyF6qgr7sJsfUGGpAzfng1ug/ihyEQYDmB?=
 =?us-ascii?Q?o2BZZ7KSOK3dP4dxmZXSItfUs/r/LGfz2SSzvXISq+FN1w3CRoFT48xE8Zu0?=
 =?us-ascii?Q?uNeCqd82/HToT9wkIgDLVWe76Z+iPT9gJ7stG51QFM+eJYhzZfUbVMkbWXDE?=
 =?us-ascii?Q?w4GjPvMzWP5bF577cONHakT6R+jicO3sGhqYTbfntMaxbhUUKueYsbE4NueR?=
 =?us-ascii?Q?+c215UXxhTetRoUk2hZJ0petn/JHnZxenj/rAqgtJevqLmUh6vhT/kF0VlSA?=
 =?us-ascii?Q?35N67FuNXNOb7tFDvuRPcWKwYvwRIjdv2K/D42YtOz+PPTcOn+pK6wx91WZh?=
 =?us-ascii?Q?J9ZB2REFhP/U+LHNJhvmb09arvei2Qpi87kxuAUV7OjPoIFlONK8aKzT7RB1?=
 =?us-ascii?Q?XGzdqr9Xskzpr7+hctOjWvWPl/nTmj+QJa+3xnC0z4fbR4D6+8nvxaVsmp+c?=
 =?us-ascii?Q?Ufl4V3G1maQ/pl9VlLA7BHTk7pBGCpiLSNPNkp/B/TFU7E8cqcjVm6uCVTGx?=
 =?us-ascii?Q?C+cyaPqydhQOP+bGX1pTfCKMrVgdJqjFBUyrPOc8ZapeQKdFt8H6pcu/IE0R?=
 =?us-ascii?Q?yXa35zbMHv0ptsIut/uBTxDgwoNeAmxxcE1MfcUpMMEs30P6MVvsVtN8tjxP?=
 =?us-ascii?Q?iPlmd1dZI/6qnxRzInJoHso1vPFeGBpzFMuJ95dmjrtikb6VUtpj5Ry4ZM1h?=
 =?us-ascii?Q?p3BboCBDRrjsFRiJhGUgp31Y0fPdNDTKaYE1?=
X-Forefront-Antispam-Report: CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 20:28:53.8298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 852ec9e1-3251-4807-fa44-08ddc3150d29
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_132903_704970_8390BBAF 
X-CRM114-Status: GOOD (  11.40  )
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

Macro parameters should always be put into braces when accessing it.

Fixes: 4fc9857ab8c6 ("Bluetooth: hci_sync: Add check simultaneous roles support")
Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 include/net/bluetooth/hci_core.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index acaaad55e75a..01ae3f433a2e 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -829,20 +829,20 @@ extern struct mutex hci_cb_list_lock;
 #define hci_dev_test_and_clear_flag(hdev, nr)  test_and_clear_bit((nr), (hdev)->dev_flags)
 #define hci_dev_test_and_change_flag(hdev, nr) test_and_change_bit((nr), (hdev)->dev_flags)
 
-#define hci_dev_clear_volatile_flags(hdev)			\
-	do {							\
-		hci_dev_clear_flag(hdev, HCI_LE_SCAN);		\
-		hci_dev_clear_flag(hdev, HCI_LE_ADV);		\
-		hci_dev_clear_flag(hdev, HCI_LL_RPA_RESOLUTION);\
-		hci_dev_clear_flag(hdev, HCI_PERIODIC_INQ);	\
-		hci_dev_clear_flag(hdev, HCI_QUALITY_REPORT);	\
+#define hci_dev_clear_volatile_flags(hdev)				\
+	do {								\
+		hci_dev_clear_flag((hdev), HCI_LE_SCAN);		\
+		hci_dev_clear_flag((hdev), HCI_LE_ADV);			\
+		hci_dev_clear_flag((hdev), HCI_LL_RPA_RESOLUTION);	\
+		hci_dev_clear_flag((hdev), HCI_PERIODIC_INQ);		\
+		hci_dev_clear_flag((hdev), HCI_QUALITY_REPORT);		\
 	} while (0)
 
 #define hci_dev_le_state_simultaneous(hdev) \
-	(!test_bit(HCI_QUIRK_BROKEN_LE_STATES, &hdev->quirks) && \
-	 (hdev->le_states[4] & 0x08) &&	/* Central */ \
-	 (hdev->le_states[4] & 0x40) &&	/* Peripheral */ \
-	 (hdev->le_states[3] & 0x10))	/* Simultaneous */
+	(!test_bit(HCI_QUIRK_BROKEN_LE_STATES, &(hdev)->quirks) && \
+	 ((hdev)->le_states[4] & 0x08) &&	/* Central */ \
+	 ((hdev)->le_states[4] & 0x40) &&	/* Peripheral */ \
+	 ((hdev)->le_states[3] & 0x10))		/* Simultaneous */
 
 /* ----- HCI interface to upper protocols ----- */
 int l2cap_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr);
-- 
2.43.0


