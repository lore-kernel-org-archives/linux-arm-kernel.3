Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF94AE668B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 16:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJDevIpkWTZk3YsOfIFvj9Y4Y8PtDHVseS1UQHZlKYk=; b=CjBsKyV8AszPtS3yood7dEUhEj
	euZYAmsKdpSDjGn4ozVBglR15KiNjHaaQDa/+v5GK4JVKgPqd5Qnw6a2bl8Gxka60ptmKnhgG/WJG
	yvfqlpamOr/6+48690wG9u5QZZVk5pdK/DCNhji7aam7LLQrQPIfvwtLERYcyQVHteJbCGTg6dXFn
	gcrqgXhyG5SgLX84uPv2pbCd8jLkaYQ4DmVrq4OzF/EPnw9n44asnm5V+vg0PUPKnjC+02uUKjdEx
	V0nqsZEGR9+QdgDEZOTZeJ6884QYxvjB85Wm/+TEhy+x+Pbvw8jAg7AbPxHnBzGcTV2lJYqGxpplD
	XMkuA7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzN9-0000000BiHU-2Yyt;
	Sat, 20 Dec 2025 15:59:59 +0000
Received: from mail-eastusazon11011028.outbound.protection.outlook.com ([52.101.52.28] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWzN3-0000000BiBq-0uIO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 15:59:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBvC+s8jbMqZ4YNdwx4lpVC8XVmXs2eNvHP4gVDvCo7lehmVmZqkGY+XDPYjrf0klYN13BLHKXKSHvbDnJFGhMqhGPMz/4B27ZTpwf7PUiljOmIAIDkreiMrYqn1lmW1x+5/6GNcrXeABqyqwWrr9Q/VASLjADrMiDg4lwMpd+Voc66c25mtB9xzaDEXOCCZDJkmruxDd6dLLSbBKbIb5cUKwpEEnckoy9YC4zNdICoofuxXAJnu1U3fNYwd+Rn0en5PzwqwVZ8ECAaNCS1xMmvQ5Pfaf/SinSauot2puerdM05nbxv+RsB8eAnXdbLmHgn0HRoHo134P0h5iahgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJDevIpkWTZk3YsOfIFvj9Y4Y8PtDHVseS1UQHZlKYk=;
 b=i+si1GttwfTn6Pc0QnrnRG1tcOtN9jY7VmDfeAJAwI4c7CySXPpXEe/EjB6E0L4KLSK1TTs5GScIe7XBc1We44+OIO1YTcIwvkFwWI8JQ4//ZsnynJaMhvflV+PiBHwoORkwwkVBvEFJG1qZhX1/qgD75vs7JfT+VZ93/8fLhJ3UEcWARCBIHxogm/LvAVu5zvaWngp8nAmjoqoFR9QMzd141aHB1wwZ0Rco+XLIAkTNqGHom4EyoOLU7a+Ln4qnKr0PxRuJxxfjGg4AKmFxR1rR88n9aBl5/nicaFHejUxf5jKzOA9KZmALKJQ8G8uHNV5pT4e0IK+vtZX1xcokaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJDevIpkWTZk3YsOfIFvj9Y4Y8PtDHVseS1UQHZlKYk=;
 b=te7MAbWo/w6SppMMsWQZ9+HYI1MYd+XCNdC06ZzIYBjHiFpuRROAiP4UsOPJNra6KTQZWk/M0R8+mPj4nXo+B/sm7rIqSXJ6mBBIBdaVykzlLY84sSrxLG0zzgLWuvt07uO0MdVGoqwn7ObbKtU1JNpZ3oIRdkE/cxcsTFXOtVA=
Received: from PH0PR07CA0085.namprd07.prod.outlook.com (2603:10b6:510:f::30)
 by SN7PR12MB7881.namprd12.prod.outlook.com (2603:10b6:806:34a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Sat, 20 Dec
 2025 15:59:44 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::24) by PH0PR07CA0085.outlook.office365.com
 (2603:10b6:510:f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.10 via Frontend Transport; Sat,
 20 Dec 2025 15:59:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Sat, 20 Dec 2025 15:59:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 20 Dec
 2025 09:59:43 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sat, 20 Dec
 2025 09:59:42 -0600
Received: from xhdharshj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Sat, 20 Dec 2025 07:59:39 -0800
From: Harsh Jain <h.jain@amd.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<mounika.botcha@amd.com>, <sarat.chand.savitala@amd.com>,
	<michal.simek@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<jay.buddhabhatti@amd.com>
CC: Harsh Jain <h.jain@amd.com>
Subject: [PATCH v2 07/14] crypto: zynqmp-aes-gcm: Avoid Encrypt request to fallback for authsize < 16
Date: Sat, 20 Dec 2025 21:28:58 +0530
Message-ID: <20251220155905.346790-8-h.jain@amd.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251220155905.346790-1-h.jain@amd.com>
References: <20251220155905.346790-1-h.jain@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SN7PR12MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: 89cf80f7-917d-4f73-4a45-08de3fe0ca82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6ayKo1ObsWTeacgm2w8PnA3dGF/1WNCKYO5Jg02AeWxDnPvDW3LGMP0FA5Mp?=
 =?us-ascii?Q?URfx5dv+Eqg4MDJ6Y55xjUcm3QiSZ2deahHsW9bBA5QLlR/HApICK72L+zll?=
 =?us-ascii?Q?AeMamcAr7F13aO6iaG5/wiiRYhU7n5jZ6QzRwuSMjZXl3qCVAi7SHySbU97y?=
 =?us-ascii?Q?ohaMXpg5JdZWPCrsAiavzBYtAJUzyX5AtzS5GDtAPOVc57g61CnMdROQw+C6?=
 =?us-ascii?Q?9nNINFeYc8I78Oe2YUzLApBFtuLLj+s6eUHVRJdjZgCxFo2KLy07OsJEWnFr?=
 =?us-ascii?Q?n+Qt4uTkJJRc2UY50k6VcOKCJiPC1Z4EOQXRBL7sIaCt3er7e1o4txRwDwN6?=
 =?us-ascii?Q?ecZ3u3B6n1fWfeg4p736+Vj2vwfbexhPL8/vrPdoGLZJ1doL00pEE2OAE+BK?=
 =?us-ascii?Q?QH0uHepZoyhxSd4+Aphxddminko/Q4Uz9G0Y7T9pS00i2qoCGrSvhwVNDjpU?=
 =?us-ascii?Q?K1f2CdWkDXXFdidDfyPwxDb04q6jf0PLSK747chmcK1ETthojBMQPIAxNNOL?=
 =?us-ascii?Q?b3Q4TCUmVyiXSC5iItRBzqC2UoZiimq3Fr08nfOmk6ME/DrpUtiHmSIKoOyb?=
 =?us-ascii?Q?TzeYVHbLb3O4OeQkHCPkGJOh5qSfNZ9NPsrb7nYG1zeABgF6Bsnv3NX6Mzs8?=
 =?us-ascii?Q?BQFSyCnpbTioRqARVkMENsHAxWRhwizjMTXDlqYHDkqfJ6XFTi0fjGNykYM9?=
 =?us-ascii?Q?hF8oPSyQDAzKrPTx6danjI7lpjnyZlzBBJoxUGgi9DPCCYHMbdz5/Vp/Gs8e?=
 =?us-ascii?Q?S8s768p40K42ged9c/mW74vqqzaK2Z5P0VOvy6UzESYgkn72G+Yu851JBTpO?=
 =?us-ascii?Q?k/oKaVleqJ+kzjNI/43bIfUvIzaurJQvuJxG3Giadj67Mw5dvecv9E+TgH7R?=
 =?us-ascii?Q?69+twyVdB1orrXDlruQ83+9GssieWBFU4KKgyQdgVgLRVnKX5lwPgBFd9Sa5?=
 =?us-ascii?Q?71ET/ICqN9yoEugL1yM/DDBqRaSuI0+yV5c6ohk6xUbSZLe0YahJy57CBpDy?=
 =?us-ascii?Q?nI/bWaciqZzuE0GJ4FBEq+jDm0T4zNjYvijuSXviBKUNDeBMKQtiZREjwOGn?=
 =?us-ascii?Q?wfmcrYWgoxJ66/j67O4qnOVMgBRxcY/JhuObhtTUtyWKK93uFl4ns7Ji/L1r?=
 =?us-ascii?Q?545wU1sSq6XncF2GCudi8vO8xmZGmJcrMWaf3GbEfP+ppMxri91/owPXGtVa?=
 =?us-ascii?Q?X5v2zaNNLIgRO6bL3zll2QQZzqUrNSgNrkVwNXKhgUIGFUnrZjbgWMx9H0Vx?=
 =?us-ascii?Q?0IcTrvvFkT9A+tiUXYJ2wg/XqPLKbXelI2Gj8mpZE3tDtkd5tVi+Z8HzCZ8Y?=
 =?us-ascii?Q?HMTJ1rPrqkBiCg3dsa9NyMMehdZNoZhiT3NjCiJmMTs7xcig5c8p/gfnjn7I?=
 =?us-ascii?Q?uuX4fYy5niUfa0mdKv2G8SpEQsTwPA2Iq8cVrVQUrKXh8NBl6tw8v2tHW5V7?=
 =?us-ascii?Q?RWCYzBVZ8XUvLsKIs/XGY+K1eOkGOzoj0qdDu6iBpL1tBb5yBkdIbC4MT+bN?=
 =?us-ascii?Q?AiCWaBcP3sILqSIPZEprrRvmQfp3Td/xjZG4Hc4L46ZqJGEW5itL3vcpC6Dd?=
 =?us-ascii?Q?eDO5g4YMSy7kZAMSgxsErlfJYR1ZSpMlxNgybjnz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2025 15:59:43.5085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cf80f7-917d-4f73-4a45-08de3fe0ca82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7881
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_075953_275734_32EE4C2C 
X-CRM114-Status: GOOD (  13.23  )
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

Encrypt requests can be handled by driver when authsize is less than 16.

Signed-off-by: Harsh Jain <h.jain@amd.com>
---
 drivers/crypto/xilinx/zynqmp-aes-gcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/xilinx/zynqmp-aes-gcm.c b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
index e64316d9cabf..3b346a1c9f7e 100644
--- a/drivers/crypto/xilinx/zynqmp-aes-gcm.c
+++ b/drivers/crypto/xilinx/zynqmp-aes-gcm.c
@@ -150,7 +150,7 @@ static int zynqmp_aes_aead_cipher(struct aead_request *req)
 		}
 	} else {
 		if (hwreq->op == ZYNQMP_AES_ENCRYPT)
-			data_size = data_size + ZYNQMP_AES_AUTH_SIZE;
+			data_size = data_size + crypto_aead_authsize(aead);
 		else
 			data_size = data_size - ZYNQMP_AES_AUTH_SIZE;
 
@@ -178,8 +178,8 @@ static int zynqmp_fallback_check(struct zynqmp_aead_tfm_ctx *tfm_ctx,
 	int need_fallback = 0;
 	struct zynqmp_aead_req_ctx *rq_ctx = aead_request_ctx(req);
 
-	if (tfm_ctx->authsize != ZYNQMP_AES_AUTH_SIZE)
-		need_fallback = 1;
+	if (tfm_ctx->authsize != ZYNQMP_AES_AUTH_SIZE && rq_ctx->op == ZYNQMP_AES_DECRYPT)
+		return 1;
 
 	if (tfm_ctx->keysrc == ZYNQMP_AES_KUP_KEY &&
 	    tfm_ctx->keylen != ZYNQMP_AES_KEY_SIZE) {
-- 
2.49.1


