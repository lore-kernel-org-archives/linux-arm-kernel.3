Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FA9E668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdzPFTclVKOXYxNUhD4Tgm5k/ts6pTcO8CO9breQqME=; b=EiVt1h6OMcAXQs9ysMdndAFI9w
	P+cEPu9J03M3HiNQfZyYmDVwA4ZwXJHNmuzHwr0FTokmLBlvLcUSxx9C+La8+gbmmqC22Ypwwlowo
	rIEw4V2WMO618KdkPS+P5wQTxh/QkfsjblNbqPpwaCsyzP4VJ2I6FFYg8KabfvNth6OGmmdSyUw4H
	4/gSdggBD1cr8rPUdTOLixH/3CSIQvIL2F7xwO6yaLy/MYw3tP0I6lj+ip0v2BYzltJwB3O/RC27y
	NpZtRk0cVopj5Pf+7Kh5lexI7lX9EkbrBKgZAF5JLESmZnpW5YfqqZRRb9LT7kwYKn800du6+BU00
	ElRPMt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzMx-0000000Bi8x-2sVz;
	Sat, 20 Dec 2025 15:59:47 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzMv-0000000Bi6Q-25O9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 15:59:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHEI0xMkbUI2YdidXO8kHxCCm9nQJ29hpcpmHsO/a36qWOmrfsstRaVIo+3X89LEMSuDbg93hSAtcEW8Uat3Ks+pO0W4JhaolgRDEeDRJZAtCNkGS7EXaqYg1hhxZ3uTnmtG/rPwVUoXxM+f/8WlCBqYGHpEnkEdahvj5p67pKzNr2Rd+BlS+FePpzrHckLPYIGHwQ84u9ZRd7t/gts35pTReqGbF6oP7TUQaZHITN1wOEEfG1XW2QDkIesqzO+lbTH0FzAQZA+81qf+oirmnY6jgK9qKfoJb1X4vppJOa+gfLA33GxJfi6xNe32cJaVsxXgNGPxbAile4LsrIzdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdzPFTclVKOXYxNUhD4Tgm5k/ts6pTcO8CO9breQqME=;
 b=u7kq0TmaKAKa3cPD4/TQsKEMqbnlEK9gex3QYDvG4wc7rnVSRXQm8G3e1h6IQ9u9XeWXG7uZFo4JhVAW/GBvFjwrjQn9CNmofIih7F+9qFF98CYF6L8ngBLkiaMy8lwZZHk+XRZLWBL2LRvrvS1sGIj2iErwTGrl4WbQLfO8ulVI83LJj/7q1WecryQWBMxrbqjALYnZ8l/dkVOof/nbjDRpdV1w6wEIDLGaj/TfWTIQV2r9Q1XB/2nNe2mV6OPJiHkJYY0BTgXcejtLj1kxh68LhbrHjnw/KJ1vciakyf48mBx8zCiD41vHAbgAr8wGAfqJqyRCuuAwtKionFWJCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdzPFTclVKOXYxNUhD4Tgm5k/ts6pTcO8CO9breQqME=;
 b=NPfA5HTMLBftMF7TqX1/AzQVGQ5tOPO+CKmWPcrqEXAjOPJnzEtFpoHa6N+/flcpQT5ZoL4sm/Ot8LvQK8eaFEK5dMkb2J9Lz6XV3G7pk3ZyOxsYiJImPxOQuSmHBiugMSzu1W7VBOTtCHg2GDs8JBExo2RPaxBSflce0diZU8s=
Received: from PH3PEPF0000409F.namprd05.prod.outlook.com (2603:10b6:518:1::4f)
 by MW3PR12MB4410.namprd12.prod.outlook.com (2603:10b6:303:5b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Sat, 20 Dec
 2025 15:59:40 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH3PEPF0000409F.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.8 via Frontend Transport; Sat,
 20 Dec 2025 15:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Sat, 20 Dec 2025 15:59:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sat, 20 Dec
 2025 09:59:39 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 20 Dec
 2025 09:59:39 -0600
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 20 Dec 2025 07:59:36 -0800
From: Harsh Jain <h.jain@amd.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<mounika.botcha@amd.com>, <sarat.chand.savitala@amd.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<jay.buddhabhatti@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH v2 06/14] crypto: zynqmp-aes-gcm: Return linux error code instead of firmware error code
Date: Sat, 20 Dec 2025 21:28:57 +0530
Message-ID: <20251220155905.346790-7-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251220155905.346790-1-h.jain@amd.com>
References: <20251220155905.346790-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: h.jain@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|MW3PR12MB4410:EE_
X-MS-Office365-Filtering-Correlation-Id: ffa3f420-ca85-43ca-40ca-08de3fe0c86f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bXOSiZehl7QCHRrcjQM+zgMDAKnTmyxZRZbuhl73tWeeK0oI2OQhzF6Ys9LI?=
 =?us-ascii?Q?IfQ6FlqC8DFbwiwbTcnzFTG7ua1CapoCCjM3IeY9TzxfqAiUmDQ7Fj81/kQH?=
 =?us-ascii?Q?sHMGSRFrTw2PU0fproMNgseo5kx6DWT4d1VlQY7dlPQdRJiuLy+mJE5lk1EH?=
 =?us-ascii?Q?eLyM7lAfakIwJCetvS0RHopnkovp4OgIpVJxB0tQh8c14PijV7saOmgXBqcK?=
 =?us-ascii?Q?ltfAojpCubhRqh04+n441a+MTBFgex5VViJLG/MhOlAaCvfDQ6KIuZ3aDo0n?=
 =?us-ascii?Q?N0bRfQJrEcdleH40Kr+paf8vBTPnQ7oajyWmzgzAgYcJeL5vaauIXI30DAT9?=
 =?us-ascii?Q?xf5QWS3jSHEtYHF4r44DRk/Qf0hbOevTM8DK5D5qgu6QAnpAFZaurdGzL+LM?=
 =?us-ascii?Q?eN67C+9KWvmI3cgP7hVdEBoqMZ8RIjtVfkVRSfbUKQo6Dv4d3qznASdUjlQV?=
 =?us-ascii?Q?Jkb9acYwnjPDBDrDo+bhRMg2oxphQFO97MPMAnixA96yiwv38PnweKMAUJLe?=
 =?us-ascii?Q?xZTDOExVNOBRaW8mta+OLZL9p8PJpKlcsYLFbAG6xCHpoKSV/AjnuZLL8gNt?=
 =?us-ascii?Q?vGbApOlJqmcCljSk7QgAgOHVtGJQg/IRlo70xblISIsdGZ8f5on0NXQJemRT?=
 =?us-ascii?Q?ENLHFa71rz7e6Lj7tNsyIK2msKyemNcvGMgoJfH23c4+VG/hrB8GdQR1NmJ2?=
 =?us-ascii?Q?l6YAwuhHJ1/IZeRae3Tk4a3pyBJAgIuzKcJ+Whach21TcDOo6nx9EPuA2kGz?=
 =?us-ascii?Q?rYatv8FM033AYmhf+ChxubrNVMmBYDWH8NumblbRVti3YvZnrPCK/BWYxS49?=
 =?us-ascii?Q?3dJD3N4N+c3GMSJNgLIpWWtoJ0kc20BoyiptX0iMdKbAtsWl0BvjFJN0UzBV?=
 =?us-ascii?Q?biooa2ggd+H/YiA0zUayO9Er4rLuqxbmUunxpS32t4UESyJsFqGIXIcrIwKB?=
 =?us-ascii?Q?C9Hnw2UNezo1gaVpAPFLPEcKqCLxgYFhBVZo+xsBhi5wYz30DaanTS6Or2SC?=
 =?us-ascii?Q?auAB5feM6kL3eitcczZ6hgt9fP5KkV1hnGyjbSC4sVXiI5tiBOl71ihN1mYr?=
 =?us-ascii?Q?FnnrP7UwNVEG4rz47+Pe7ze7cPCKpk0thvATAcKSkXnp+bWw9MfRWNp+sGLO?=
 =?us-ascii?Q?gLB+qwLb6ISDhgRlAYnNbawMhLUspWCnNQ4OLvsTxAs4O4/fCUv5+uzERE9a?=
 =?us-ascii?Q?83Fs/qCGhD9Pz44OyVoLyF0QAAwleacuWbtNIXCSW9Z9K/5Hen6MI3EBR0Tw?=
 =?us-ascii?Q?i+BM85tAFMU+3eQ7GVtjMcINlIsX0TPs4aqlsqRoNFvJUrrhnyrg9EfkfRx6?=
 =?us-ascii?Q?j79lN466PfW1b+/rL/2LWpJGCyzGQaqmg0rlzJn5mLjb2XMerdrWAHzwdGzz?=
 =?us-ascii?Q?p6xOKppYuL+r5WQqsgbghNMDKkgJ38uOuxAtQW/TOn3W6yJ27h+9Px0jXGXL?=
 =?us-ascii?Q?uEu09iSayxnHXyt9o0bcag2Cl+/uzliJhZVm1dbEYkN99buYLYYNWGhpRXXL?=
 =?us-ascii?Q?/BO/xtVPXbYTtzqY7bIzaeAJAR753ZwV/cqE5NJkWitGdHBERGbl6WE4vVMe?=
 =?us-ascii?Q?+OkcGiT7MBotNh9ltJj9gIiUdBp4Uduk5JYotcRL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 15:59:40.0270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa3f420-ca85-43ca-40ca-08de3fe0c86f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_075945_542944_95175AC7 
X-CRM114-Status: GOOD (  11.55  )
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

Convert FW error code to linux error code and remove dmesg error print for
authentication tag mismatch failure.

Signed-off-by: Harsh Jain <h.jain@amd.com>
---
 drivers/crypto/xilinx/zynqmp-aes-gcm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/xilinx/zynqmp-aes-gcm.c b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
index 04473ed9f08d..e64316d9cabf 100644
--- a/drivers/crypto/xilinx/zynqmp-aes-gcm.c
+++ b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
@@ -85,7 +85,6 @@ static int zynqmp_aes_aead_cipher(struct aead_request *req)
 	int ret;
 	size_t dma_size;
 	char *kbuf;
-	int err;
 
 	if (tfm_ctx->keysrc == ZYNQMP_AES_KUP_KEY)
 		dma_size = req->cryptlen + ZYNQMP_AES_KEY_SIZE
@@ -132,23 +131,23 @@ static int zynqmp_aes_aead_cipher(struct aead_request *req)
 
 	if (ret) {
 		dev_err(dev, "ERROR: AES PM API failed\n");
-		err = ret;
 	} else if (status) {
 		switch (status) {
 		case ZYNQMP_AES_GCM_TAG_MISMATCH_ERR:
-			dev_err(dev, "ERROR: Gcm Tag mismatch\n");
+			ret = -EBADMSG;
 			break;
 		case ZYNQMP_AES_WRONG_KEY_SRC_ERR:
+			ret = -EINVAL;
 			dev_err(dev, "ERROR: Wrong KeySrc, enable secure mode\n");
 			break;
 		case ZYNQMP_AES_PUF_NOT_PROGRAMMED:
+			ret = -EINVAL;
 			dev_err(dev, "ERROR: PUF is not registered\n");
 			break;
 		default:
-			dev_err(dev, "ERROR: Unknown error\n");
+			ret = -EINVAL;
 			break;
 		}
-		err = -status;
 	} else {
 		if (hwreq->op == ZYNQMP_AES_ENCRYPT)
 			data_size = data_size + ZYNQMP_AES_AUTH_SIZE;
@@ -157,7 +156,7 @@ static int zynqmp_aes_aead_cipher(struct aead_request *req)
 
 		sg_copy_from_buffer(req->dst, sg_nents(req->dst),
 				    kbuf, data_size);
-		err = 0;
+		ret = 0;
 	}
 
 	if (kbuf) {
@@ -169,7 +168,8 @@ static int zynqmp_aes_aead_cipher(struct aead_request *req)
 		dma_free_coherent(dev, sizeof(struct zynqmp_aead_hw_req),
 				  hwreq, dma_addr_hw_req);
 	}
-	return err;
+
+	return ret;
 }
 
 static int zynqmp_fallback_check(struct zynqmp_aead_tfm_ctx *tfm_ctx,
-- 
2.49.1


