Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507FF10D14A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wz6XwalJokhYcVR1f6lT3VamIddG/z2OGHjGFwc9qTE=; b=28KZG/ixP6C9qsJwvsto7NxyQw
	9SyBBzoJdQO0XDyUyiuOShqAwEyzeqDYMFJeodrl5m9f59FIHXdVAOPwpT0QWlNcnQFQMDjcUEU5T
	+0DZOTW/75E+4ZhsPf6VkAZ2zYgMs6Lc5MCda5UsYguZkQRmoMcbm0nkV8S4JdhIUqr+WDHsX7Wzc
	laTbjiBt5RaYSwk94Upjgm3/KtucVd3mXlWmEjXpu2Bpmk71y3CKjKQF9ZX+gQRkkv39DZuN7lGKo
	9Jy/pNCkx9sr49zobZLGkek4vGI5pR5qxw8NXlixh4JysBFUjTjwhCzzmnvTPceVamKQEnKxX6n+I
	TCShsUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BJN-0000000BCgn-04cx;
	Mon, 30 Mar 2026 12:01:41 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BJF-0000000BCe6-0xof
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:01:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T80YIan10lGXPAr0TSsct6v3PFWpwXWIs92amD173OcvMXfhfedE7DbkWIS7YMpnZWdyZ7r1JUlpQhJDdHunOszAPbSe50WIbMYaTOEWqGh6BEWo3iEOoUPwmr2l73U/u9/wIQZsYC55+8QPKu1crPZQo4/ay2AGsBMg6JHHX3/EIYxElFGhxbhFSPw4oei0oigkOziaCK1PD/UqFIdHnXViV8JvRNJjtmsOhQVcf4tthwrw55i5ealBFh4g8e4XVoJgs5NTBRH99+5s9pzmsLti7fCg42Q5b6FjA1MKOT7zqa/b+dAP/ZezdWYeWtCkD2JjZq5ugCb8NLtE2vlwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wz6XwalJokhYcVR1f6lT3VamIddG/z2OGHjGFwc9qTE=;
 b=peN8Pb9XzA+dGXk8OAM21ja4RsnL6xKh17XaK6W0bwX2QFF0LawHbuKmxL/YupSZadgpO3tsH65d3iVoFlKj5QGsYhOJTMOIAerM5z0jHnWOwMlThMzGxR0NP98KxlSJ00tDMIZWmjchmW6f1JkIxLghP0bmGlqyIjUqQLTle6xpPLPmhFxAFyaM+AK/XpqNH7hHyYvm12WbOkCmjwOcARkDE4+py5vfiTsA9RpGQDSvxF+umQa2/qovM209aavDjqZ9+0BcRhEugidzpc+KtcsN7Y7ZSRCz8zg3ug6L1WM3RnQOaT6LP0zVCcw94T6cAcStgKIYLbeBos/6OkdBwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz6XwalJokhYcVR1f6lT3VamIddG/z2OGHjGFwc9qTE=;
 b=VQASYPSaX59n3w/SAQ0bHJUcrZlDsrdnB3KkqqC5/tY9RTaLp6TYktL4IMCipT+/DZ4J92Jkn7OFL35Dpcm6FGrEdIaMMQ9dAqfl0Osahi5nax1zgYew2jfTNLAwAu4kRP74AkOKhcFQwEHgLhMuitgNwq7xw3Rg8u080rYVbMo=
Received: from SN6PR05CA0012.namprd05.prod.outlook.com (2603:10b6:805:de::25)
 by SJ2PR10MB6991.namprd10.prod.outlook.com (2603:10b6:a03:4ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.27; Mon, 30 Mar
 2026 12:01:28 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:805:de:cafe::45) by SN6PR05CA0012.outlook.office365.com
 (2603:10b6:805:de::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 12:01:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 12:01:26 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 07:01:26 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 07:01:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 30 Mar 2026 07:01:25 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62UC18tE242506;
	Mon, 30 Mar 2026 07:01:21 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<rafael@kernel.org>, <viresh.kumar@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>, <d-gole@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <k-willis@ti.com>,
	<a-kaur@ti.com>
Subject: [PATCH 2/5] arm64: dts: ti: k3-am625: Add ti,soc-info to OPP table
Date: Mon, 30 Mar 2026 17:31:02 +0530
Message-ID: <20260330120105.2985200-3-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330120105.2985200-1-a-kaur@ti.com>
References: <20260330120105.2985200-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SJ2PR10MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 69fecfd5-3737-4a75-f36b-08de8e54121f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: Qrb5d3AoKL7iOvu1tSm0i8Ntki/cOalqdQGKabzDG2CdUfuZVgXZq4chZiD+mXEaWmoAnGyrdT7jPic76yWAQpINbxR4B3KaYHH5U29hSrST+AT0TiihPUZR4ReIDwcCobmeYfcFHhu/lodQ7yYc7HvV/mOl9jJzGe66GwYSALnLB4QZdcTgGb8gV0YC6cxBDF7BcnoW2zh9QA48mB+jTz+wdHYO1NvFRQ1Ukk9ZOrtTOqGmnFx0A6d43JLlM+s9c+CjO4pghnRMahtaIwSRe/g28jgR9g+JrQ8Vdc3+km7GZqiMomYwXq+ez0oL1ZCBIODj+3Q5NCQo0QI+6nd9iMf8lZggYLDx2TLnvhZ3EaqfvnDz+sco1adKgW51E/hEHwB2mYhG0ufI3HyuOvZIKuFm/1YmZ3wD7cg1+iGiVFqfB8Z+p2koAmaIw/H2B3II1oMgTKAlYD4o1nh9mueSAqXodRC7hqepb8Hf9w9N6Em+XFitPOTJCoKPYQs2uqv3+8Hi7SvS0DWTXnIjvpL1Qk656RN0j/coU2u2HjBcnkb+BdIOZ86dxlJcmM8MzrSO/I3O7CVmoP0VXVGkFP3fDY50CbriKKS7gjEO3MmahYVDyeKXoms9rt0qMtMuipBjGQeUT0bj7997zEHu1gGOhOigAnaTW1+yVheDwpcRP0Q3xdIPYL7cjbtdFXlEeorp6rTfW1lDFxz9T1oL4jNBmX2KJIGGCmd593Cz8zHtlxVeyjI+hKRp5oU3oc16sXKylkM1VOmd7gQrMp6N72Xw7h+Jb60OxtIdw/kHHiNuBzPw2rm5eDvwqN9R1B8xwFwi
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BSBp5GnbXPFx9e/kTxy4bYkk8ryJatGBBON2lnsMqyXgUIuqIcZv039RCmURFk2pmazGXMSXl6TzE9m6hH9qnCdmD/xwWTPPiT7rVE7rTGA6mBvyfKDsyYDBAhi4o2XCCrkcMMOFgxr7XooZRHYqLJnxhq9vNTmwhkPD0qcPGzLxeXOIt2iTmQnb5O7MA8lJ9Agc8iJo27dK1J2P0SYhFMT9dTv8CXDy2KbuzzKJjAinsqPuV+Kn/yF990WKXGxoSQGPLUJ9xZuywylERbjN/4qae9wg7NjCnlKVO/PqZQxjHKWGA52Sv0iJi0X6LZfNidO3v39ZgVS9RTt0dQjJnCGuU9rI3e7YLJGiN3Av9NY6hrOHo2mrbwJyEWR3KBTO4HAykYAcFO4YkWfbvquhSwynAqTif4VjmGY+JfnmUIGSvUEwuGb7Yisayux0Flln
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 12:01:26.4949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69fecfd5-3737-4a75-f36b-08de8e54121f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_050133_353469_21B1E222 
X-CRM114-Status: UNSURE (   8.53  )
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

Link CPU OPP table to k3-socinfo driver for dependency tracking.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625.dtsi b/arch/arm64/boot/dts/ti/k3-am625.dtsi
index c249883a8a8d..b0020e667882 100644
--- a/arch/arm64/boot/dts/ti/k3-am625.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625.dtsi
@@ -109,6 +109,7 @@ a53_opp_table: opp-table {
 		compatible = "operating-points-v2-ti-cpu";
 		opp-shared;
 		syscon = <&opp_efuse_table>;
+		ti,soc-info = <&chipid>;
 
 		opp-200000000 {
 			opp-hz = /bits/ 64 <200000000>;
-- 
2.34.1


