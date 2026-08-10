Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9283BC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mjrg0WtDpxbszpMGjZgCkRdY4lpWQE/3NZVUBei1KV4=; b=i1QSiP8A3DxvpGi2YJCr0tePWo
	QKrKKjzMlBc5XHGnVWcucfBlJiy+eI1Y5WBOJZBg2s9X+nibQ6KW/SLc8ezEqZoANmzBeUqHbwTak
	oxZFxkf+WUAYpUsWf7ocFRpb7cm0Prov5kg8qAFb5qSIKNPKU5UQ9MjEVjlqwwUMSRBYJkfi6Fh1S
	cmlJGs2dLnneEBZWyHecXTaXIx3WZYNeNW/fmcP7umDb0R2sKcBTZecnl6hL2BIKeatbCDTFAvD83
	vFWZKyBKW5qhfJg2vjaaqiYf9u4VB6rmP69dHk6sJIcJEdV7CTE3p82sFtw7CpyIVlRkMIMsdb3Vl
	+mfjn/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyw-0000000CrGC-0xf6;
	Mon, 10 Aug 2026 20:52:26 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyr-0000000Cr9l-2hKG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:52:23 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AJjRl23510643;
	Mon, 10 Aug 2026 15:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=mjrg0WtDpxbszpMGjZgCkRdY4lpWQE/3NZVUBei1K
	V4=; b=arGOuiB1VTz+URwIyttJG3SDNa+ZcdC09os0wAQxNhLM0T465NtQ0eTMU
	BdMQEJyupWJ/2UgeZ1JvGzfpyaRWg3nkI+POuecJl34Z8mSlxVJn/CWyb9KpvfbQ
	zeOuASBl/LbL/t+3jV12hhzmtmyQL9s3/eoBN4ZEQZ5kqM+psoCYgc6Auwn8EATr
	QVxTmwQz0P39c7RM9g56neMoSbeIrBbKXwZkOop1eKdgeDWcMDRj5ZRn0uTThodw
	NdN+dAxgfMCBtXD92sop0ASPu7cfvwaxZhhtbwGmrrer0LoR1a3Yrjv47MdqCRpC
	gsriyOQkjMBUEGB4ZxdGZ+JIYBMUg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fydkmv1tx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 15:52:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kjc4pTmn9Eua6wN9+S4cqDmHL4ENPPHSzV4zshvXmdUFE0g7r5r3aGcIuVMfanlpQpV5VmVDuvCayUh2r3bMj/Fs5IRuOBLQv0/LX5hFcRgy9YIyACzmyXMkLMkdH7v5UfpQa7rnPSd/OfiUZ2G0wopE8rd0XkhNHPbsCa9GZHHb5dEAA7OupnsQyslX5G76tLbzKZm/0J6mHsN9na53TZt92r5vqpKeSvyd8QinWKZ4lYb80lUaVx9XOv9LUrPhr6UARXGkQZOg1ZDDRj5g9iYkPx6X7iZo2jEh3s6pkytuWJ5MlsRPLd+gIQ//pn23I/Jk6I/bbyr4UMv2cVI4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjrg0WtDpxbszpMGjZgCkRdY4lpWQE/3NZVUBei1KV4=;
 b=IT6VJjOjdppOax5vq7pgygRMvibSQBVg/vQk08w6XoulLsyRJjK82rg9eZgT/U/tIgCTdOfnUbTIMSoYAjODH8z/rpcPbAy3/AafCF7Y83Ah9PkViHYsct+IPRIETZMV26aCk7MUpttAkhhajGiPbnISylE77SHdbFuINHDmh+k72OJeXQ02xYnGC4jKItfiKVdRiD+/BJJB07fgIkK4piAAS08VgFRE2sSpy596xq3WY8iU5T/4lbIB8hItTVJZfyQNmQFWQhT3J4vgv3bKhVTPlV5psvRnrJwActsnt7Anc5NdG7LPXVrHAHnwmiDmUDORCeJsxEWgGFqDvwzYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjrg0WtDpxbszpMGjZgCkRdY4lpWQE/3NZVUBei1KV4=;
 b=v9G5C3A662a1mFqljGUpnOrBgSPPf/jpUlzOaQtD4KDcTPSqTlcUoVdSscNkbGN3kXPtrmrr80wmIHHtBELZKPE+rBsiNYKFHRxmnCnPNm36jigUJDh7VwdFtWdawFPk5P1NQwnTLBjnZUDIb0CTeLURy6iOOjMFl6K6C0ESld8=
Received: from CH2PR11CA0012.namprd11.prod.outlook.com (2603:10b6:610:54::22)
 by CO1PR10MB4610.namprd10.prod.outlook.com (2603:10b6:303:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 20:52:14 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::21) by CH2PR11CA0012.outlook.office365.com
 (2603:10b6:610:54::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 20:52:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 20:52:13 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:12 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 15:52:12 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AKq8Sg3838072;
	Mon, 10 Aug 2026 15:52:12 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v2 3/6] arm64: dts: ti: k3-j721s2-main: Assign SRAM to VPU node
Date: Mon, 10 Aug 2026 15:52:03 -0500
Message-ID: <20260810205206.685971-4-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810205206.685971-1-b-brnich@ti.com>
References: <20260810205206.685971-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|CO1PR10MB4610:EE_
X-MS-Office365-Filtering-Correlation-Id: 657275e6-11b0-432f-f30d-08def7214129
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 8LFCMlDt7ngzqYEmxT7fiAt0b+iSTdfSJbWi7k+PQo5h+P89C0/VSy6ZlhgxlEajNFKGLuuvgnzr56shmo9Vz6+DB1TKATeB2woJ/UCIs/oe+I3cO5BR26naBnYjSaYN5QCyvwHVrz+EUmR9ZqMpjRx0fNyHD9Gs/9Rg1gT89oW6B4zJ/n8c7eeXn92RVJZsBEZVLXx6MiS+zU/QDiNDMj6SyyUXMEG2cK2s2tXgaaefsucI6VkRltv8b+p61QknVVIdhB2kKIvE3rb2dqvnbq4TDRwyVAeVqbS2zxivmwlECRJWTd/6Hs2ZGUDhmYjg3SZpk/pHb80HnzwoZ5IUZLq+laQ9J+UG51rVI5xShFFiqn92v+JQPzyRTuwiTjhVRf0zf7W4IF92lr8ArgPMhtNRKvdRhstOVvCg6+EytITLJEYk2t9HF2YC5CJlHnio9un4ezrai0lqpI2Dbg7kUvof5cthrtVENNsvwoJWZVf7Iv+OVd855dbk5eJJM/k2W73sH/kFfHCVbzR4sBJQHLAF9aYVQON/R8JaKpCYupVhNaq2y88t03vorJNSxGPqGpahvewcfaPR0n1fpPrh3+4Xfx5s8KczMGVQGWF9HOk5HszpJ2xWtMPmaAp0auQZe15Zr9r27TP6pJlGxPuGEzKglkbgbpT5SF+8/32FuNME6vO4DFUecgeGyKE1Hhyeudos62m2S5hwAk84sXBFmg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7sHO2ys1oIUmIAo02LOt0iVw/2BXYmLr+gaCXGaJaOfUUhuBTsVoM1D7Yqpgb3a1kCeAGGcp4hlnMF4pcBYzpcb+XtssLOm1zJTkbQfKTwMip0eoDAY8DnFtDfrmrHchoUI5HwCb9jgz767sIG3LkdlWBDAqHAwZfVY18oGXT4xAWnWx4tRErXOmWoVl0IPVK3YooA7NTC1L6k8wfelrTWUOksNFwL1if5/Re7UMf8rKSswquDsVc1gWU1zzPj9vgpTO5derM/rhj46Wm9hw+HAuXxhbYRw45U/2J5qYpUdyh0kA4LDp3kxZjZP65tB8NQF4V6oKNgkRR7Q+FQbKkMEbxYok198N76c/iMOZbBuLWFOmPdo6ZVJdJibQPAR5V+tbSqteTR9emRaHJWGUmuxAhOrS2Y8d6FZRTzdh79KX8kFF7k33w9A/N/dQj1nx
X-Exchange-RoutingPolicyChecked: Z5Cc1dr1WaQKcm/mn+VvbP4Ps95lUXbmX4/K9IJUnk53dGaqDU/7U+xe8jDTyH4NBO6ldmGcpelp4uHYOEdrxeqmt3PsYgsYfTKVb2YwDt/18RgY3pZ3AlpqoyEtm85m8Cm5nefnvVHdD8mbh0rbwsyg6hKUbx7r0zn9oGuk19w30pTA2FuOlSgjAH8bGhB/BLFkOCj5urGVGbRbbgskEzMWZeAOzygQo7sTZnEpggOS1oQlI/woD6E9w/sLYH6Qt1Ox8LafAAAi7ugoLD92RvkhyXALdH9vCgOwCVRc+d8/DKbY4sWjlyqZ9UwlQr2UPvTNJNMxsI4gXmGe6zAHFg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 20:52:13.1390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 657275e6-11b0-432f-f30d-08def7214129
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4610
X-Proofpoint-GUID: fEYUOkdBXY6lJo16BskopqULHGsJnSap
X-Proofpoint-ORIG-GUID: fEYUOkdBXY6lJo16BskopqULHGsJnSap
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfXzwxRhGG4WX6A
 CpH5qQLgy+lBXY5CKIpjAgOBPssCWZ4d9Gw31r1w24oZwNkCGSukVF7dUX2f2xJYi3Cxxbl2YeS
 IpIqhO81VS+3WeVRLCh5VixzCL8EfGRvvNbz1zjliFtKilt9LJrzeBj37itq8v/OTDhH4LZ7sFY
 prmmZyTe7ioElHmErlWm1EMoDTKU0DWhqciOsuLnWi1IhDZGa3P57EeW8lmeY73167OhBqiF5nD
 LREmqVTty3mwRit8hS1NjVIGZihlYLwPwwuX6qCVDd1TSlIqKxcsKljN+m57AkwLUSQlpU7j+5F
 fQCckR2aLjjMxev9g3oUTTeJ4Cp2E8b6uO34DUBTB56Js18kBzzqBvMicEMvm+Key+fln/M10US
 i2d1fCrqys6TwGXQsENX9FenFM6bVqPiLjV49cV5cESjZamKdnJTprKhkwv5SalyJ8hHrk9M/ud
 nJSQgHzqOGg42vUW3dA==
X-Authority-Analysis: v=2.4 cv=Ms1iLWae c=1 sm=1 tr=0 ts=6a7a3a02 cx=c_pps
 a=Gv32SYzo0qTo49aZOIuVGw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=s826d0Vf4ljoQKYSzyQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfXyMas3tUbMMt/
 WvtknVTWIwH75fWGJ89ntbciebF/15+wRBrrglFyfULQ5ZeN+wqm+jZNsnVJgqlYAIly5tqiK+L
 GtzP2oELBk0K1uoVlpVLY2T4Ggw3rAk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_135221_835121_8CEA2D1F 
X-CRM114-Status: UNSURE (   9.70  )
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

The Wave5 VPU supports connecting to on-chip SRAM through its secondary
AXI interface. This allows temporal buffers to be stored on a per-stream
basis, reducing DDR memory traffic.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 1fd173a68c0b2..233aedcbf2ec3 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -716,6 +716,7 @@ vpu: video-codec@4210000 {
 		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&k3_clks 179 2>;
 		power-domains = <&k3_pds 179 TI_SCI_PD_EXCLUSIVE>;
+		sram = <&main_navss_sram>;
 	};
 
 	main_sdhci0: mmc@4f80000 {
-- 
2.43.0


