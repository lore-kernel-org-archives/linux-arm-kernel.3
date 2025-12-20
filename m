Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED46E668B4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wK0ei/OSjUWHyOwH8wsqDexPsLojXBh1F0AkhHhyUMs=; b=hexRig7TPe+iUul4GXB6GWTUyl
	1fw+LnZD3RPxPnxxT/6hrQXNgIrOT7M1H3WWW68AVt5UrMSjuV7ydfVWi0wxC9xj/UZ4krbZPss8o
	r/sfy/2D5tKaeBnuYzzxQOoy802WbLgfuZxvGyJsSmGUAZlltui6PEP6N5hBfMX7GVJ2WGJL0/B0B
	ciuWf+uZJB6UBuVhSF1geEGFem0160sdW0vfi0iVIWjuDk4cmqwjUcJONJuFF6iHtwf1hABjN+9iA
	nN88qcQPsd/h9kdQwZl6zTiCuZSAAXN0DJJ3IFajk7c0ilNyHj9UuS27n/QaiQIkN84t9dbGvDbhu
	IgXOedkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzNA-0000000BiI2-00OE;
	Sat, 20 Dec 2025 16:00:00 +0000
Received: from mail-westus3azon11011028.outbound.protection.outlook.com ([40.107.208.28] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzN5-0000000BiDU-2AAG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 15:59:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swNyoLo1Cmuuzwxge7e8c4LVuyJp6j6uPjvjEf0nO1sdsnZt/E+J3MNSvQoVMJvWftqwJgMANbj1NT0qVdaSakcp9p1QJfG9++bvWGYP+lignB7esmiFTMeOWUDZ65zopi9DVU8kV2xC9vNwJhNbyAtb3Q445SYL48Q+HiMr6FtYlWLhQj6/r56T3SrU87gy1BGOhKrG+F6qU950aPWTFaf349PXDNiOOkLV4rp3L5Iki0LtjoDQoodGBhnQraofg8yc9/CkvTBogefmmepN8b7iapLrnqiFmnMCJEqZFKKK0dDkjlw3lNkm5tAYgnzQ/nNp0ti5VQ5aTrupeSFrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wK0ei/OSjUWHyOwH8wsqDexPsLojXBh1F0AkhHhyUMs=;
 b=TuQ/mr84ofSLhy7QfUiIUG7EyO8ZBwgYLoEQItoDCKtOA0n4NoSsJkDRonBku8baNLN4LJbXFi6T0UhAOivVtmU2CfyzsmM11QvhNDgssM0PxNizDMWNe5XKJxWp3jT3UupyzeK55MLulqENb0yjleWlQEt9qdCXMEr+4N6PXa+CohpG2sZS2G782Dxyd3VhHZoMqjwqSDU098pWzSDU1JhhqfalLQ5EiPQGNIcugn8e4fMRVYeS1lA2PEq/ny4bX/Qbaiu8RrfXJN4RVqhqJAbmJvDsp3O8myVNvljMyfb4eofKTBr5CQnX5Pq7MokDxOczl3vi2b4kiUY5uPeUiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wK0ei/OSjUWHyOwH8wsqDexPsLojXBh1F0AkhHhyUMs=;
 b=F7THlD39gVQmnlRnSohkweYXMqzUHeZa7faFz7KZhTVqzhAL9TPNB6cNe6zTEFBbdjprrXU4S8md7qgJL94q6pgzySwI+iLXGFgc5Bdd/TrAOnDU7Y/Hv0H4lJ6Ja0wmt0ZJ1Q66dQX9rZQVUAXa79jggYhxKzoWkK720sqN/RU=
Received: from CY5PR17CA0022.namprd17.prod.outlook.com (2603:10b6:930:17::12)
 by IA0PR12MB8228.namprd12.prod.outlook.com (2603:10b6:208:402::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sat, 20 Dec
 2025 15:59:47 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:930:17:cafe::cf) by CY5PR17CA0022.outlook.office365.com
 (2603:10b6:930:17::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.10 via Frontend Transport; Sat,
 20 Dec 2025 15:59:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Sat, 20 Dec 2025 15:59:46 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 20 Dec
 2025 09:59:46 -0600
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 20 Dec 2025 07:59:43 -0800
From: Harsh Jain <h.jain@amd.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<mounika.botcha@amd.com>, <sarat.chand.savitala@amd.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<jay.buddhabhatti@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH v2 08/14] crypto: zynqmp-aes-gcm: Avoid submitting fallback requests to engine
Date: Sat, 20 Dec 2025 21:28:59 +0530
Message-ID: <20251220155905.346790-9-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251220155905.346790-1-h.jain@amd.com>
References: <20251220155905.346790-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|IA0PR12MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: de13a45b-e4ef-4ab7-1147-08de3fe0cc84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hf2RYebic5fcTMXkr5mGPA8VobWbQbN9t1EdGJph/vl1+RdvEulZHoL3rHAi?=
 =?us-ascii?Q?whYblReW0FBfsisAyUpwEAo6Gvk6vwotDJQzyzyme3gwk5/3f7+xY2IGK8Mn?=
 =?us-ascii?Q?ugDT321omsoerIMrIRGK1DPEuVBpMrFiVPcOg+bAAAI107dp8ajfGK6vFAaL?=
 =?us-ascii?Q?vZICnDhKQTXcUJAU7tQ5h98THJp++XwgeI0hSAJel9WN19Bh9E2o0tXjVxVx?=
 =?us-ascii?Q?ec7XPnbLeH7oJtJnHGzbPxEBiXKMw1Qv/CZOpo6dHQXdtwMEIzsWbp5zc/29?=
 =?us-ascii?Q?Cye58WHLeIVXZx32Zjrr6/UMw4rQcAqbaSd2GBFMmdtlYjrumB7vKDmg2Zzy?=
 =?us-ascii?Q?vOSR5ONT/YzqhOoui/PCcz47X0Yu8TTLb+V6PdF31j/UOLklZP77DGwtmhwO?=
 =?us-ascii?Q?7Eef7DHcyCfzAAc+bdTcr1qXdb1lw5YhDgA+t3AhnL7TwF72NPIFeDiX482H?=
 =?us-ascii?Q?ieiCGQBWhybq5j2XxpxZQXrH8bBKhO23Rd72vJdtO5HPiINcRuq83rzIrUdB?=
 =?us-ascii?Q?Ez5AzOdVUevJmnztmIECQSNapw4ZRv3OvcGvUGEAFtjyXhwDDn1Z9cb9X4NM?=
 =?us-ascii?Q?i3CPd5cUf/iK86DN7bHXBl5bgwJHjEGz94r+JhIyNGB8GVQgvo4BRGEf1SxP?=
 =?us-ascii?Q?rXJZdJpXa78toT93uIMdy1kdP1Q9S7lV/7wOTCqz6vwRWBDgiJtFeogkfPvH?=
 =?us-ascii?Q?vukAvKUdanGnW5+5RuEzOl1KYLaFVe/SyC8e9gO8ngRsoPIOxRfGtbp/twB3?=
 =?us-ascii?Q?+qd9Qe0E5XMT51stjKAH5OyffOgkHAlheyFH7rbyV5qa9HN+6Wot5ZhTaoqM?=
 =?us-ascii?Q?eEirNgMpDyxwOZOnwTM/qX3BfWEFoAW8rqbqzN5s7czkkwjBJmnz3ix8JcOh?=
 =?us-ascii?Q?XmOq8EpGCdYJ/lQxixnjd4Du08NeIgH6arITvVTMoOyHlvytGGcCyKgfz38U?=
 =?us-ascii?Q?0/1s9VzpjzKJbkcrl22B/Ceao7P+6AIYH0Ezwi54Ap4YhtyISuJwXwY+nRDM?=
 =?us-ascii?Q?Lss02wG4yHYSdNtlZiuEkViPGLuV9wwl+10igo2Jhr9rPIi9PU/yHZa1lvCY?=
 =?us-ascii?Q?BV57iXRihK9xRFQmPuyBBe/xFXSFhtoyW+jrbXSUeDHIE2BhJ4HDwB3u6/sO?=
 =?us-ascii?Q?Q0IRaj31jqvKPvSKU5PWLjIL5achB4azKczsTInmO1dXLfdcdUvPRsX1Z6L5?=
 =?us-ascii?Q?2BMOSILF7JPzRlIGM1kZJIFpvPOwwN/8b2TLM0Zda2SLEOLolKYbTSj3JmdN?=
 =?us-ascii?Q?wja8VoW6a3B6lXj6JCWDG0nDPMEcZ/9CPicEpPmWL3ZCzeO/+z3Oe2WNar53?=
 =?us-ascii?Q?bUGmwg4YjbPfj/MiU5yve7pARUdyz0oZuGLq6jEcmvStUVwfJjQhtx0L7XMV?=
 =?us-ascii?Q?TTAFOAwleFZHtI4eI8lwfTQR3lNATvQ/4TCQR2xmHq73Yax365woMqnGwznA?=
 =?us-ascii?Q?uqsWGDKV3Mx4ziVpHdx8fzOnEPU54J4gPlDaRmi59rcw7fc2HgMPX03PQrwI?=
 =?us-ascii?Q?7JuEDSaWUNFL6AQ77huAVI/AN7CmXfzBakeE4ofcJhZbslQ9+cLtO0Ag/Vio?=
 =?us-ascii?Q?seQIciY9RTdmNEUO2pn09ICdjs7pKkpe0XUVZEv0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 15:59:46.8745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de13a45b-e4ef-4ab7-1147-08de3fe0cc84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_075955_581959_CE8C302F 
X-CRM114-Status: GOOD (  11.99  )
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

Don't enqueue requests which are supposed to fallback to s/w crypto.

Signed-off-by: Harsh Jain <h.jain@amd.com>
---
 drivers/crypto/xilinx/zynqmp-aes-gcm.c | 62 +++++++++++++++-----------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/crypto/xilinx/zynqmp-aes-gcm.c b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
index 3b346a1c9f7e..b8574e144f48 100644
--- a/drivers/crypto/xilinx/zynqmp-aes-gcm.c
+++ b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
@@ -204,31 +204,9 @@ static int zynqmp_handle_aes_req(struct crypto_engine *engine,
 {
 	struct aead_request *areq =
 				container_of(req, struct aead_request, base);
-	struct crypto_aead *aead = crypto_aead_reqtfm(req);
-	struct zynqmp_aead_tfm_ctx *tfm_ctx = crypto_aead_ctx(aead);
-	struct zynqmp_aead_req_ctx *rq_ctx = aead_request_ctx(areq);
-	struct aead_request *subreq = aead_request_ctx(req);
-	int need_fallback;
 	int err;
 
-	need_fallback = zynqmp_fallback_check(tfm_ctx, areq);
-
-	if (need_fallback) {
-		aead_request_set_tfm(subreq, tfm_ctx->fbk_cipher);
-
-		aead_request_set_callback(subreq, areq->base.flags,
-					  NULL, NULL);
-		aead_request_set_crypt(subreq, areq->src, areq->dst,
-				       areq->cryptlen, areq->iv);
-		aead_request_set_ad(subreq, areq->assoclen);
-		if (rq_ctx->op == ZYNQMP_AES_ENCRYPT)
-			err = crypto_aead_encrypt(subreq);
-		else
-			err = crypto_aead_decrypt(subreq);
-	} else {
-		err = zynqmp_aes_aead_cipher(areq);
-	}
-
+	err = zynqmp_aes_aead_cipher(areq);
 	local_bh_disable();
 	crypto_finalize_aead_request(engine, areq, err);
 	local_bh_enable();
@@ -279,28 +257,58 @@ static int zynqmp_aes_aead_setauthsize(struct crypto_aead *aead,
 	return crypto_aead_setauthsize(tfm_ctx->fbk_cipher, authsize);
 }
 
+static int xilinx_aes_fallback_crypt(struct aead_request *req, bool encrypt)
+{
+	struct aead_request *subreq = aead_request_ctx(req);
+	struct crypto_aead *aead = crypto_aead_reqtfm(req);
+	struct zynqmp_aead_tfm_ctx *tfm_ctx = crypto_aead_ctx(aead);
+
+	aead_request_set_tfm(subreq, tfm_ctx->fbk_cipher);
+	aead_request_set_callback(subreq, req->base.flags, NULL, NULL);
+	aead_request_set_crypt(subreq, req->src, req->dst,
+			       req->cryptlen, req->iv);
+	aead_request_set_ad(subreq, req->assoclen);
+
+	return encrypt ? crypto_aead_encrypt(subreq) : crypto_aead_decrypt(subreq);
+}
+
 static int zynqmp_aes_aead_encrypt(struct aead_request *req)
 {
-	struct zynqmp_aead_drv_ctx *drv_ctx;
+	struct zynqmp_aead_req_ctx *rq_ctx = aead_request_ctx(req);
 	struct crypto_aead *aead = crypto_aead_reqtfm(req);
+	struct zynqmp_aead_tfm_ctx *tfm_ctx = crypto_aead_ctx(aead);
 	struct aead_alg *alg = crypto_aead_alg(aead);
-	struct zynqmp_aead_req_ctx *rq_ctx = aead_request_ctx(req);
+	struct zynqmp_aead_drv_ctx *drv_ctx;
+	int err;
 
 	rq_ctx->op = ZYNQMP_AES_ENCRYPT;
 	drv_ctx = container_of(alg, struct zynqmp_aead_drv_ctx, aead.base);
+	err = zynqmp_fallback_check(tfm_ctx, req);
+	if (err && tfm_ctx->keysrc != ZYNQMP_AES_KUP_KEY)
+		return -EOPNOTSUPP;
+
+	if (err)
+		return xilinx_aes_fallback_crypt(req, true);
 
 	return crypto_transfer_aead_request_to_engine(drv_ctx->engine, req);
 }
 
 static int zynqmp_aes_aead_decrypt(struct aead_request *req)
 {
-	struct zynqmp_aead_drv_ctx *drv_ctx;
+	struct zynqmp_aead_req_ctx *rq_ctx = aead_request_ctx(req);
 	struct crypto_aead *aead = crypto_aead_reqtfm(req);
+	struct zynqmp_aead_tfm_ctx *tfm_ctx = crypto_aead_ctx(aead);
 	struct aead_alg *alg = crypto_aead_alg(aead);
-	struct zynqmp_aead_req_ctx *rq_ctx = aead_request_ctx(req);
+	struct zynqmp_aead_drv_ctx *drv_ctx;
+	int err;
 
 	rq_ctx->op = ZYNQMP_AES_DECRYPT;
 	drv_ctx = container_of(alg, struct zynqmp_aead_drv_ctx, aead.base);
+	err = zynqmp_fallback_check(tfm_ctx, req);
+	if (err && tfm_ctx->keysrc != ZYNQMP_AES_KUP_KEY)
+		return -EOPNOTSUPP;
+	if (err)
+		return xilinx_aes_fallback_crypt(req, false);
 
 	return crypto_transfer_aead_request_to_engine(drv_ctx->engine, req);
 }
-- 
2.49.1


