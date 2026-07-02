Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B33C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moeswr1uLUprQD/Ko7eiYcwpJy8/RSTh1wI38gpHwpY=; b=xMxrELFxG73MC0bE76DsuG/nKO
	Saw/pWvGvSwpG9ZZVVtZK7Is99tg0Rh+as2/SEtCRmkRP+xizVNvmv9P27GXqUnqGJpvIlWo3WPz7
	GQZ/B5gT8KO2fTYyYACNXk7SDkR2l25iso1a0AjhubTJtxiP5q5Ea7SINeP+slRqZoqIv50ujoI56
	Og7JkjuysMhuxM/ysujxmDkuljlXqVm6qqVV01kCQMuinnIt/ZaInH2PcYuupo5wEQN4QY3T/043+
	OFGBX6GHGsVG+0KciVpZlBujxlCpf7g6IBFRVhNE+dS5I57lIcZM6IQgSdLEYfzpKZFqPOYzecy4c
	7LIe/Fhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKiH-000000054Rp-3h9q;
	Thu, 02 Jul 2026 16:56:33 +0000
Received: from mail-eastus2azon11011047.outbound.protection.outlook.com ([52.101.57.47] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfKiD-000000054PU-0OwC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:56:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCo1+ByiE4+SfH+E709uR6u3A+DPCkDTqNNQEhH+WBN8FYhM39vMK2vr926ndrP9QGvh7X91IR8ZgSyi20jNKDVuLJEvgOU+ZS2AIDsxNpLL79OFgcpkYVIxeii/dkbVlA41IeeuQs4uoaqJHGUjnnJVLIXQipQASMMBKhdPVIvL0BtR6iwz6mniLeHr9MC01rmNe9dpvmPNzOMQ3bDWE8cUG1/vgUdJbDuswpV6iJCVRuGNTtSXOfvrwXl0ZgQxEapyHBUz6fAx3BPtbeK/iSLdM0N8cDNQb8+vX9TaNITrvST25vSqmUnDnNbZQdomSZVpEQLBmOM0CisL8fLXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moeswr1uLUprQD/Ko7eiYcwpJy8/RSTh1wI38gpHwpY=;
 b=NHZ3FnHY7ZyiVZhbE7yugV2zqIijt3JLsK52xsmT42AVMgbF3h17HqESvfBBlxL+n0WLyuxRvnHySJaV1zMbirq4T0K0f96weBqqY8CP5tkEDulKbOTdrz11n8h91V0qjWEv99NdTry2yQTsZgFHiC4sM5j81K2uxF/wBB7JLI3/Zd3XO8kL1bSX9Uft/A97qSw+uewm+1awlZgjE7cT11ri8nSpNS+7p2dKj1ZBJmoopOI10R9HMB+PqQluO2UtiNqifr61idED2q042wvNi74NDrIgRcJRkhjpCwKfweXoWJ0SMi65U/2eF442AMeh4hyF808FuLRAj3/fYUXVNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moeswr1uLUprQD/Ko7eiYcwpJy8/RSTh1wI38gpHwpY=;
 b=rUytVQ2wnmKutjFmuq4DG6W3Xq4S4SKhLV3kaS5jddiAUiPppkO5C+U56m/VO3kY2MSKjYus9VQZE7Cw0kXK+TU0nYAPUdyJTIkepWuOJXrhJ4MAyzqLT1pBLhw8Ba4G8OjoHvm55pT8MMPniBh6xtep9woRv1/jlSO+GDGZDb/F8I7gFiVgwZ+yry2U/DQ16inelVTU8oejV/Wqf9ixlchm/qN6RDaXYSn8iz3wqb6dZnd/YR60D0xryILlCyvtXtdoCgm9nuPyVl4NYBDwiIVH6l9nU2tFc+QewCqSotUDa5ZuJ0ns/kkBHdoRhA1M1y3sP5FxsEQWSbXf29dONw==
Received: from BN9PR03CA0545.namprd03.prod.outlook.com (2603:10b6:408:138::10)
 by IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:56:20 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:138:cafe::61) by BN9PR03CA0545.outlook.office365.com
 (2603:10b6:408:138::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Thu, 2
 Jul 2026 16:56:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 16:56:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 09:55:59 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 09:55:57 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Jacky Huang" <jackyhuang@nvidia.com>
Subject: [PATCH 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR-NVL BMC
Date: Fri, 3 Jul 2026 01:55:23 +0900
Message-ID: <20260702165524.2168091-2-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702165524.2168091-1-jackyhuang@nvidia.com>
References: <20260702165524.2168091-1-jackyhuang@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|IA0PR12MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: f0db5b28-f64c-4ba1-a9c7-08ded85ad706
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: r7srR4l/uF+yualu9QtAI1y1EdPJwVxqO1nMn0pLKAjle8jOxkmjLC9bdV83Z+j2vmyZoUhtYz8Nk8GRQsrXwt+Ji1cdcGxqcat2Ko+crRXYVDo6bN/RIv1q1MT4PptixOol+BGI1NaEfgZeBLbAAbtvElTh3wYoNfMhhNy3zfyfjyY1GaVaAHxgq/zRYHWjHRYkZjwwlthf6lkUqQt1s9faPlpuBx2PzCxW8gmCGgOJ4IKLyLs4oG20j9W9SGS78/KDHWMpzkzaKtg8MbzZ+GKsW8MdWFMuNFDA+8ySYnJlr1oTtuowYlrv00oY+XU152phHR7nMKri93/jSWTZgPb1Qf8CoWOIfxFlbx1XNyhkRFvEw+ja90n4Dj1UXBBbJoO8oXEtXFYwkRrwTgL9v0JP66nS1p5uAEF/cN//KVAjElUGa7AMUR6zLggZq29n9cEgwwueSyQbneVDObIM3670tMw6WdMNApZBbXsHzHhrfaUmvUt/N1O5lMLLEecVm7JWW076Qr7dhgFddLvKVUfryJ70FZfA3RvHkUbuNvhKehXSR04EzJv+/io0L6NMp/7z4TQMv5VVJpA5v3n8ORn6s+67MbfOOfQhQCN3DNbLRC1I+0iXhvRYYcD/KbCoPPul1Zfy5NpKIbvfMifrFRCGtQHMrtvaAV98wBW872yxmlnNEmApu63RsaX6c5BLhFy+luvQJM4AnABBfXNfxw==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 805G6GAIlQw6KA7vhAx0I2P0iECa7k8T1cFjMp+ZCmM/pNMn4fp6lCC0JYO81PM+OelFmlD/Gg9noRHn3r1UBqeXwzDLfAXoETwxebYqQa21R5JN4awNjC8/L6hJusPLShbUhlAnWW1sBpJyUtfA1dM1zFnvqD8BDAtLmfT+ghjmmPavsnnhr4dsS9iWz2XfNGHMj6J9LZ6qk41009rA9bj1HAFz7MbaaHpVRX2CIU43o7YzVxmTcXLZ714uS0yGezFOKMnn8yf8zMehrhTxdLKN6bJj7+QawdYcYdyD4OXGVbdE87HEMnU9mstIvstK8LAvlWtf/hQMuEP9sHsbvrUhlZ7F312dO9fij3tMnCn8oD82rtALUgATUJmhy+50JyIDjt+uvnxLopViRc5Mf146TC0b7zfc2bmrtf8mHdzhw94hKNa1PrW2eFowBlXf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:56:19.7451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0db5b28-f64c-4ba1-a9c7-08ded85ad706
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8374
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_095629_138243_CF18E88E 
X-CRM114-Status: UNSURE (   8.67  )
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

Add NVIDIA's VR-NVL BMC board compatible.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index dd7996960de3..ce893553cfc3 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -114,6 +114,7 @@ properties:
               - jabil,rbp-bmc
               - nvidia,gb200nvl-bmc
               - nvidia,msx4-bmc
+              - nvidia,vr-nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.43.0


