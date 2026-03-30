Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D372D10D14A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 12:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98WxTkibNx2XjSK+a9yGkPg+4DzgWf74Kod9CtRK6Mk=; b=nPc1fL1H3GxcKdHxs8waKiGuWo
	uTbmlYmRPQqF1BaFIAnMm8fJDL+SOuVYuFFd5W/ykKmwbwK/PDPYAFcLdLeppPIwpLkA/eM2dCDOW
	Pv08tPw+oUiMddtbICLjefKhXisCmbFW+cPEHNF21cDkIZ917CTBuCKqAy6lpEGVBb5kG6guXTI4x
	3+GBxXonCqnAD+DfTWskPpLsopDs6b9RLXpsWDLvuT7IlhPMTd3jgxp0k3+su/M3W/1GUWbAGtLST
	R7cs4RhHOg11TtzV6twkbLl0QFt4T1voOaRMWUUHj4cb4HliZqey4V2Du7fal3GBMAxYWvNtmgmr1
	6GqZf0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BJG-0000000BCel-2PYj;
	Mon, 30 Mar 2026 12:01:34 +0000
Received: from mail-northcentralusazon11010017.outbound.protection.outlook.com ([52.101.193.17] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7BJ8-0000000BCc8-1rRD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 12:01:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnQOxq2JZXLneOCBbiSucSR/0yK8yMoLe+lmmpPnA2BToDi7scmlj7TwHbuEO52WSeC9J/NcBZGSg1XZQ4DlN3tDUjH1i7NyrByys2l2TtT9xxcG9dMK68efqm0f0/0igYZ6Jiy1H5W9mMf/ydGlP+/8az22lwXuzhnvaDvdIqqaciNkNDDtgOx1P68PhmN2Lv6Rn+pLaELy4pkxSetgtLH8yv1tWpp7FuucOzwzDJZ/MSjyQQiFzGd6J8ke/AVkJeCAPd1E8E7W7fodGYJ7XK/rpWbzs17Hw64BXXZEtS8V36nmwn/9VVnqfFVx9W0aK912nBMI8IL8Fnqk3wEdcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98WxTkibNx2XjSK+a9yGkPg+4DzgWf74Kod9CtRK6Mk=;
 b=ea+SbDdpDWjS6pFIONMOCO3f0pN96KXcwSq++4XtQr+Io9cQTokC6nmTw5u0oCAFlw8X7rXReJBq4r0mgFCHrCqhq9HRcsJsp8BlN2kfRV/L7drCremPt30XsKM1dZ6/3PzWsAe6M3Q8cdXQmwwJvyyrFn5GYEO5o5TpOU3J6nIpxTi0mwapKB8aoL3Yk9QaKDCPtDQpeGrYdjNW+cBPKQUNbp7dF/2HPy06zYynAsVh8KOBnMX+wMYZylnTRaVyaC2nhDFk8P/AFR/8G6QCFIkpC25rDjEY+dX8vZyuGqnSWrCG9+55n0fJlyN2Em4KZZac7TNWDJeB8If4q2hZ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98WxTkibNx2XjSK+a9yGkPg+4DzgWf74Kod9CtRK6Mk=;
 b=JnOBuE2qByTo2loMoQgcxo1srxbT9ufouAK/oDXUPJV4mqjKoYrnOksAK1EV4qBwC7qLtRHjJJ86TrzQPl+q6djNUqPP78H3Iej5VqBQ4g650y7b7NoStWMZ3Iy5i0nv+P+fy4/hT6GCOrQ78c3t1XmdRyMKU0Fa+R1Tn3El0sw=
Received: from SA0PR11CA0183.namprd11.prod.outlook.com (2603:10b6:806:1bc::8)
 by LV8PR10MB7798.namprd10.prod.outlook.com (2603:10b6:408:1f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 12:01:21 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:1bc:cafe::6) by SA0PR11CA0183.outlook.office365.com
 (2603:10b6:806:1bc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 12:01:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 12:01:20 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 07:01:19 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 07:01:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 30 Mar 2026 07:01:19 -0500
Received: from akashdeep-HP-Z2-Tower-G5-Workstation.dhcp.ti.com (akashdeep-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.68.91])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62UC18tD242506;
	Mon, 30 Mar 2026 07:01:15 -0500
From: Akashdeep Kaur <a-kaur@ti.com>
To: <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<rafael@kernel.org>, <viresh.kumar@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>, <d-gole@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <k-willis@ti.com>,
	<a-kaur@ti.com>
Subject: [PATCH 1/5] cpufreq: ti: Add EPROBE_DEFER for K3 SoCs
Date: Mon, 30 Mar 2026 17:31:01 +0530
Message-ID: <20260330120105.2985200-2-a-kaur@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330120105.2985200-1-a-kaur@ti.com>
References: <20260330120105.2985200-1-a-kaur@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|LV8PR10MB7798:EE_
X-MS-Office365-Filtering-Correlation-Id: 419163c4-6c57-44f2-a982-08de8e540e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: 1J0okoizaxAbOb9SOcWmTu4NNzKYS/Qh0xXbsnFjOLvYyXHqxPICYIBSKyhvVQ2dGyPORmAPBxU+oQ4nru9jm5D0YMYhtM3y2rnVdR9wMqHZiwd7hrjQof+t1QR9a2D9PBb/qXp2yVVzmNFsZE1Mtv2VgIaNnlt93VSwExgWEJDdzWgdF4+qR8ka8zW2g58Iy6xwMU/WCs7SpbtEqceA1YfxkAQ/xb0Q3zeEI5GGqGb/8zt1wqG7jmDSXMusMOyM3izaa3SACPmo8BuVt8ds7Q0J/alTvbg8mWZmIKfKTdmeElLQphPvEBfW2xUEYVA8muIzwsNmeZcLtdelYKSIpubTdFFP0rk3b0XLWAyXYVyydE8iuYKS0ulCdvcp3byzzRxX+xDOk/H3pQO35q7jZcSKlQjPktN/4vf36wcGi5gZ+2lBZyYSXbg2LYr5Ws/KbLfColjzUkME2UWVp3iuqQ3cL7gveEVS6v63wh+7p17prinAO8hRY8AO+cbC+GSMNpArCId/uaua1sO9f/ExZQaUMQy8GzgEUG0iqEzTjuLe3ZH+Z6HJ4tb/SIiBe78fI8tvkXxqtP+uxrVKv+owDEjH6hB6UkhdRbUvQ3A8Y+ohoI87Jq+VlPCr7Cv7U8Sp0sYaP40QZOGT2h55lD/YAuw2Y8NjECYF02slelxhWtrlKPfH2j+QVGp9F10PhxIDzZtgkQsybQuwDQnD9tbALeypoDcLHyUpqzSwVSvmu/P1g7eXpkZNjyINjw28PrXH/aR1rs9PbSEpzAJbqGlDKjHjFSA6hK4yXUo2hwepio43keTEk7/t+1h2LPs9m8F9
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: c8ZRyqsx2vnv1+A10r/TvssU2f//RQyYq2aFBTClUhQLnZPQwmNMj5LzACK3dLlMwqthreuhKH7ZCzVNEM5050O0sDsb8dILsu/8pWgwtPXWRuEhaO3jKb3zb4NrTpS+8h2KnfhmMGie0bV2RVpZOi2PysnaqqYsgSdhmAnr02WPKcoCktd2kzV1yShUZ8n2Aac01w7eAY9HTwJ+7cdgePWwWoMu3pcQZwv+gwzKDYsCPzo7T1oX4/nE70Zfcev3xku6qE7ewxmEGtqk37QcrAFBArUN6MKswG3ifj/knAdkDlBxaRy6OleocPBU4iN8rt5051BrsZ+N4pcUV/QLFvLfDzkVkSQvyczOxjvNVDrpPqA1qX+7hGcU8FCTqoqAZe+fQG/8ci7eMBZi6+ETuncbIdepxgIWHRdyL6dlWX5ZJADdPCZoaeobAJaRJHEt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 12:01:20.2526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 419163c4-6c57-44f2-a982-08de8e540e66
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7798
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_050126_634120_E38EEFBC 
X-CRM114-Status: GOOD (  10.23  )
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

Defer probe when k3-socinfo hasn't registered the SoC device yet.
Fixes incorrect revision detection when ti-cpufreq probes first.

Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>
---
 drivers/cpufreq/ti-cpufreq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
index 3d1129aeed02..88f7912ef6a8 100644
--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -441,6 +441,15 @@ static int ti_cpufreq_get_rev(struct ti_cpufreq_data *opp_data,
 		 */
 		*revision_value = 0x1;
 		goto done;
+	} else if (opp_data->soc_data == &am625_soc_data ||
+		   opp_data->soc_data == &am62a7_soc_data ||
+		   opp_data->soc_data == &am62l3_soc_data ||
+		   opp_data->soc_data == &am62p5_soc_data) {
+		/*
+		 * For K3 SoCs, if soc_device_match fails, socinfo hasn't
+		 * probed yet. Defer probe to wait for it.
+		 */
+		return -EPROBE_DEFER;
 	}
 
 	ret = regmap_read(opp_data->syscon, opp_data->soc_data->rev_offset,
-- 
2.34.1


