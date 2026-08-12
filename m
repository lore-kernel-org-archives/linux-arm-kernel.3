Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF68CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEcPxU8m+18GeT2jP8PxZa27ZwUZ/ci2myOHn7MEUyQ=; b=yRqq4G/KAze7PIrIHBIxe7TJj3
	DI1vyUyNGGMrLGzECau/kVF7i8YgPC4X+qTXePLFlPxaMwqvuSiICaeJafVO0JBQT8563oIM2vTqz
	MPTBNLNZztkhQSOu2qOkoB8uCh12YHQ44KzG1ApxVEfNH8+mBxNk558YOto3kTZLEySnGbB6okFXf
	5X3VUHw507JGxeIEo6X7s7xF/4ck7/t1YTAy343IxS448CAudnnSY26AGoSpFDqD6p+C1QzpvFrsV
	JfQCKwbq/QGpeHA6lxNFTZ8zhlPd8K+2BQcTi96C9EhU2MG1ibB0HSFaEim0imNExNIP7pWMCa6Gg
	HXr2VHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB8v-0000000GWvj-3QRD;
	Wed, 12 Aug 2026 15:45:25 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuB8t-0000000GWua-0gli
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:45:24 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67CDZ1DG695974;
	Wed, 12 Aug 2026 10:45:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oEcPxU8m+18GeT2jP8PxZa27ZwUZ/ci2myOHn7MEU
	yQ=; b=ZYZjdnLVW+RZDpA9Ia8RS2Bsqpb7CU/maXQDKW891FToOaORyTc+tsgKl
	y/p4gk2Zgf1E8DTxCrUYnG6AHpjSaEtvJF+KXKuDVZi8V6o/DJEdChWaElsdTqWS
	RsbbilmEG3fQjFMvZ+CeqCPMexjbntub/2wuD03rKrxsQfHCYxw3a3gtRzeOnEaV
	kpKxHOf9KZgeoErUsUTnejQSnMw7XgtrZeLAtqI89fBHSif5YS0ZSWtL8Vr7VWQy
	EDxLKcNatBr/2U0mO6jSIzYdtEGTmsH8P9XhO5fbjrCqSxzEtHNgMWsPuv4rjR+E
	0Gt/pL9wk2oAP2GxMJOal68THGUlw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013003.outbound.protection.outlook.com [40.107.201.3])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g0musafrd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 10:45:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTS3kQ4JeT/rM5LBWBHztCofWYi+uajwMKqtj2de8CJLrlQHoESM9n7JWfVW3N7MKWpI882w11TIASh7oPfQmImR9ph1IiaVHac5Wohi/7FMGXBQnM7KTc499HgJQi/6Q6prT9j1GQPJDxNdFt4wUxU+ZrbxX2hYZRJ79PHOQZctC04BbRDgP7ZaV1NE65vqtY4Ufs9u15+KOtcZD0zHa/u26Mec2rwh1vIpuZmX16CZQ2Ta4QGBOBeGTucKfkGkCKjrl5cyRfpZpoUCMB+Jzp7mnkKZJq+zSS9GQrcRUL8EAIwhFA2U1cDrnLEUxdSjVDQg+hIEQvSPvMmjdGdSoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEcPxU8m+18GeT2jP8PxZa27ZwUZ/ci2myOHn7MEUyQ=;
 b=u60WmYkIo92nwmtDHNOZXm3jZ01UnqafZ2vKZVgEVcbEfG5tOoWHCROeghwtcnOl4XsRIB4dmIYjfLjoBdfxJ5ahLyhzbKJz5jVdeBS8ZNHBb7P/qFD563gX5bRwBpFJMLkRTzBbxsj5PGKuwMpdT6BEj1d9G1oTwzYYqUrx2+nt6foLIpgsiCfqOxk/I/tA0ECZJvByxSb3XVRTt7Jrt8ddut939+t+9mWUPqXWoKhTw+Ou7EvVM2sijmJQPwtDUUlq0UrktWaelwAI6lIeG5jD6JVIg3UnKhFF5uYJ1jQMGq//ifFr+NrQhFPAb++CGSR/Z2ywt9v7jpVekqaTsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEcPxU8m+18GeT2jP8PxZa27ZwUZ/ci2myOHn7MEUyQ=;
 b=KIaAZZPt8InnPARln2GqgXHq0g6BwRDmcK/UbtyMXPrEBLpaGSsYcZfY5yMyCRzqn9o7p3e/Gcr0hRjCVjFwst8eLCEYS8od77zfxoehNISBGpRgWfWmWEK0u0G2BNdGz+EtbJLJbiZEzdNYUbu7OIulIlMguUewltl8VhB8kdg=
Received: from DS3P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:45f::19) by
 DS0PR10MB7050.namprd10.prod.outlook.com (2603:10b6:8:14a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.11; Wed, 12 Aug 2026 15:45:15 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:8:45f:cafe::a0) by DS3P220CA0011.outlook.office365.com
 (2603:10b6:8:45f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Wed,
 12 Aug 2026 15:45:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 12 Aug 2026 15:45:13 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 10:44:43 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 10:44:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 12 Aug 2026 10:44:43 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67CFighG2343963;
	Wed, 12 Aug 2026 10:44:43 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Srinivas Kandagatla <srini@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 1/3] dt-bindings: nvmem: uniphier-efuse: Add ti,am62p-efuse compatible
Date: Wed, 12 Aug 2026 10:44:40 -0500
Message-ID: <20260812154442.3379851-2-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260812154442.3379851-1-jm@ti.com>
References: <20260812154442.3379851-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|DS0PR10MB7050:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbe5496-c8d8-48ed-0e9b-08def888b335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: o8f5XIJHzYmQ8YPPUjLOJ0EUqLJe8BmlEnsCjeagQsEpGGp+yhV4VSHvFFQxVt1RIwgiHrYgDU6lpCyesloVySHH0XzHMAwMUTMW+QHDdKKhSADKbuSXnJfi9Ep74z1WSIo9PvyXlTqqjCdnEsnFFmiR+ym8NJc4c0lDKk+4p8W8xjDLIMcyUnyDi/KWqxZjrnoZ94O6IwEzeWJpHJVLCTkLN3PSMnEb2SQZIHl7C7A5W2duS51kZely7xEp0AzyCAktfkai4rBQlyLUI+Rx+aCuPovsYaT30i/XGRzpRAoeDOl1p6w0CggqPbKBtJuvYbrd9lrJyS4jSOFhdqgJiPvzZiwWtPRq4lKPvNIWGO0Lpmeu4elzip9FSIByIHoNnB56PnzO6z4zdV0ED+JgOGz0SW6n9ISSjYZGnt5DrNsaLFKtXsEmHuNvmXbT8fsJBNQ/2VrTeAReDFWwBOwfeGFZTdhw+762tm3/rjJcssFiyQ3unldV4xjgGPTuuEwh8TIQpoLhNNzE0quVLyJ/efxgh321Js6+gm03fPsm6WN2vc75o9eUQ85Je0XSPGpD9c0fIuupn6nIAY/XrZIZ9KuvAXJ8M+L335LuGw4DRrfa8yK9qNRJeWtvYec2YfI6xGaO47kPlXmkO3I38s684uqeJTNM8YXiiTr37bRp+/nLnskm+xsIi5vd5fKBu2Ly10gJRL+ExbOhMf2TQ/JGlQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8lNcdJveV2705P9Ic8arUNeLkvqnbUCFs3rTkELObpyiHMCEN7QovvPR9nRp674qQ7mELszbYDTcuOqkTOq+IGNpGfOPFCR+ev1f8WjsOyDsscnnHmgD89BfhwIG5wQrdt3iCiH1E/Oh9UL78XXCVHH64tYdbDlqgly5bUBqDJTIR0B9h6FW9ErFMLeT/QRfWZti07IE4KU4AVjb9dBXp0Vs1dmBsJrQMmOF6/3SQZGzT8lUzA/hoWsgWcSzFaPbLVg5jNdeoaBVuoOsRBl1x60C+M/pjFrlWDeulrN0evz92e2Ur55lIM7d8xR057gEfgoooEFHVOjMIm2YX9fWyVlJ5zX/4p/sBbIqXUw925qh/j9uXQPs6J4wp4vUGkNz5vqTwEr7071/cKl+HJLwBapMk7Ukd4DdULFHoAvp3QGwKHnnPkiiW30GeHVNEVUq
X-Exchange-RoutingPolicyChecked: oj3DWJhIEeSeVm53y/qowu4n+yKb+7pPP/DYsjhUSbJ1bvixjtlXvG2q6EsNZbKOUViFatOcNCArk1f37nZfJszoa2IwizrRCU9zZ8IvVhLqr0Bf+AbeCSfnM097Ea9Mq9fKJvWgzbgcyK03U8ep/Phu/0wEFnpvf2W9Jg5405yjGHh3cq3Pi/nQmMC/V2HfbWn9EIy0mi/8R+WgG58UiVnvmmsgLbqjJPrJgFLGD4+Zu8+IpLK8UVFk6Y4k2h2XWhVaXF25I92h1od0zEAnZSf0hUQt8ju3UPCMdONPfozw5bdeQj+JvgN7cSDRneiFNPtHad6l4jcHcyXUOYlQaw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 15:45:13.8188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbe5496-c8d8-48ed-0e9b-08def888b335
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7050
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a7c9511 cx=c_pps
 a=6KPqUB2zuHFFswelnWAHBw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=JS_-QrVL7TsgScaScJcA:9
X-Proofpoint-GUID: oqRs_7z9HczUTeG2DCLLF4O2rYifAqZS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEyOCBTYWx0ZWRfXx1gE/K+2MLDV
 wtd1FMdE0qdA6JHK1dCCHPAITPwyFIQeGZFAl7+K9KJlmdX+wD82s2dm5IhPx5FwVsrv0UeNJDs
 bfZbbZLk7aWqPK1Jqr1wUl/OK9OwYB6CI/PbA/jX5S5q6Yfxwu0k84l6JFyyZ7NjEr27FEwbu5D
 WsWA00+B5yOGAXAPCFurlJW8pogpNZ8coWC2hZq7GhLh/nF8Ym/J5+jL6Kt74veHw4nvjOOudkv
 LWYioKr8hfzDw9HcIFGgA0EIQlapFct8f3/XIiIu5DzygEeRaozU/tZOx3Fj8xm4a+0fe4EAtYC
 wyFDDrqWKWhuHegzcgadEsqPDJYtmO6XwKmYgsBAVmJDaBO5T02WE+3uNlX7ICkT8ar4ptavrb7
 Nb/PTM+Ubh4vz9Z1cEyPsChwClO22CIKzu2mlrWEtBWI2QNeYkxQvej5l1JXa6JVQSpzYmxHw8+
 NQE2GlRlLcau/NpM2ig==
X-Proofpoint-ORIG-GUID: oqRs_7z9HczUTeG2DCLLF4O2rYifAqZS
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEyOCBTYWx0ZWRfX92A/dn3r6Sfb
 ilpQdxpuvh4iGNQI5ZSBcu9KVwzP6WrbI1iHaZ+w06rahZLGZXmRnMozRT/99s7l84fykggykbz
 0jJQ5Tit9hYkTB3dyhLcfsASLd9mPcs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_084523_206031_367602FF 
X-CRM114-Status: GOOD (  12.52  )
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

Add ti,am62p-efuse as a compatible string to the uniphier-efuse binding.
The uniphier-efuse driver can be used to read AM62P efuse registers as
well for GP_SW silicon revision detection.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
index e27cbae2d63a0..5e1b90fc1ae45 100644
--- a/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml
@@ -16,7 +16,9 @@ allOf:
 
 properties:
   compatible:
-    const: socionext,uniphier-efuse
+    enum:
+      - socionext,uniphier-efuse
+      - ti,am62p-efuse
 
   reg:
     maxItems: 1
-- 
2.54.0


