Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C4CC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDUlsOY2g4cbI6jkplqzWBt102OVk+/yFxSGtRt3veM=; b=Gemu9culotUYTl3L33Rw/4x/jD
	+Pdqu1uD9l7pO33hHth/ixzCUhGVVKqXXBk4qBqgJ7+zvIGSGti/RYm8SrLAc1wiHkCb15oJBPOiH
	Nwa0Fw5RCsi3+5xCTDDQhUpfst7xDXkwWq0Jr5A2GewdEkbtPIqgrqBEMajvi4iLwKnyRbK1E4CXo
	SzzN+zjY2I6HeN1blrTsR9D3eLI/IV6HCSCn+y/b0MTIEhl3dK70WGZkiY5VgDAuuLLZ5Ux+9xFeB
	+u7eWixTxief+60sN14VFXYmYrTcfKzq6ywgRcUPye894ijC699o6XBghIU4KeZZK0UQeUJwFWszG
	hvqdKZ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRjO-0000000CBUa-3kJz;
	Mon, 10 Aug 2026 15:16:02 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRjG-0000000CBNb-1AL2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 15:16:01 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AEUZim3239394;
	Mon, 10 Aug 2026 10:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=aDUlsOY2g4cbI6jkplqzWBt102OVk+/yFxSGtRt3v
	eM=; b=EovgAeOTBxRPGVfXkQUVKW+/Sx3dM6hn1Cg6g1BN09sch7N6PYjUIJTHz
	903yrzw6U+4b7BbbnWMy1BtbxrGzlSk36xP70AFzJN86Rn0mDZnZzkxYwDEIiHRt
	fnLlH7S32kDpgKWGfYNmYk7Jr5Oapl1LdRZAuQ0371Mq76FDJ3NFwXqzqh8t4RPd
	JFLHJMJOD+pqUfTnc493Ymmutzc6Hd2KD6plECYSu2SaLkP9UIMgOWFUmeP+eRQx
	J9/L3mH+qItbvI5d8kSAayiMrCOwbMZ+MyfjAB+NuQsTcI+6lalIoAgjoeFnVqMA
	6aRK1UMDFE22WKWrwFXHh48QDAuJg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012059.outbound.protection.outlook.com [52.101.43.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fxku6fp55-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:15:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QP96HlGeMGQVgSyTya8q4sTUG40Jh9UftXurMVer+NRJwrb+ToAqyLRx7sjNeIbZJMKRFrKynDc4jb+Rvh5zvpQXCFGe2pLql7aVwpMJV76uW+jzisyIsLAEKX/t8QbRBPLv02ogiZVKHnBKORA0uk2+rcIV0Hy53Y3R3tISX7eSElMjQ93XgIiAVcDvGdFbFiPWA5r/vItzmUwrMsFrtSZzK/Hqj8KeSCHYCDRZPCfwPUPFWf7yvaxdw7BhF0hoYgFqJSKuYUdLDshbE2gEEAfebQmkf2jqtHPlGjhBKjfAhy1o7FyGH9qsu6DgthRJC/mKSLJ5se+5ByaiUWkCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDUlsOY2g4cbI6jkplqzWBt102OVk+/yFxSGtRt3veM=;
 b=jny8fWhXPQlK+WL1YbX7N24I6vrS1MTcRTjWLtO05uMZd8SOK8zXv3uGpDC5TIXoZF3PRaxyNb+ciGu7c+roYwMqid59iDgLWpmeF2LUyLyQLuRsB3PKLwKMgkzcqiUUAqUnw9TFYa8vA+F9dhMWhTrtdg8NOfR2hM/dr79WA6ed1PL+Dhz5Pl5UKTw9Z0gWSnnbJ5eBt5jktuzoimEU9oz4D9ysdcvWt73CmtmujW7SIrD+ZaFKcv7+foHUqjUs0DtuN+kamidQ96nJCEVpTP4MDmY/0tL/wKYjOlcqXKEXbAiwpXfjxXp0/XetXonKG4RGJzhWnkF1InnRDJ1E5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDUlsOY2g4cbI6jkplqzWBt102OVk+/yFxSGtRt3veM=;
 b=KYqiVg0G83cSJTdclUynACjIUWvKnOWrfyAfaD7l+QzkMDBlG7XnvxyMNrHsd5Vb9Sk+Nwtdq1UztHHhWssrrR4nZpxjWbe44+KCyAWqFH8BAjJb3ugbdceSWW0HZqHIthbfguVD8iW4b4H03e1jkyWZBwZ93kHv7AgaMk9unmg=
Received: from MW4PR03CA0133.namprd03.prod.outlook.com (2603:10b6:303:8c::18)
 by CY5PR10MB6095.namprd10.prod.outlook.com (2603:10b6:930:38::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:15:41 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:303:8c:cafe::25) by MW4PR03CA0133.outlook.office365.com
 (2603:10b6:303:8c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:15:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:15:40 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:39 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:15:39 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERWA2648613;
	Mon, 10 Aug 2026 10:15:35 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 15/19] dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data
Date: Mon, 10 Aug 2026 20:44:09 +0530
Message-ID: <20260810151423.1948224-16-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810151423.1948224-1-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|CY5PR10MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a83cf8-43c8-47af-7348-08def6f23db3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|23010399003|36860700016|18002099003|22082099003|921020|10067099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: DCF/BnmelNDitYHJ4fLk0LO+RLNIbarCFv3iH340kPhpJFlfeLY+unkObe9TtCpj/bwimt9T0wCcFdQV3FpJCiqb0zssz3/MSOk90aaOrqYwa59xHKZ4sBM48W5i1EYdYTlsrgZowoMVJOK2AiYnFhjkloBu/yqx11TOCyznCO3+UoSulTs88p3oXaQ4QjWVywL6BwyEu0ZiSca5cNxFdebqW2Avq7om/r4W8aMK7qaIy55nTJLRVdUEmJp4DvaW0DtvUfmo24M/90q99QpFShUtlBla98vMYcHwLYdElghrSBfDZJcdN+u0LQWyFaOCUSVh300g0QPNeOCR4/rwqZ+SFKHTbsqo5bbrVcs6jLtgihvSkJC83pSUq/PAPEXFNrA2hWAubZ8s1P8quexT494GycNjTkIcmIN7tVDDxUM+hFkgIGMvr4M6O7NnvZqhsghJk3iXRYFejeP4TqcjkOUG3sHcLjJ4tsyhVUpWZ2Kx5hzmFCOyJ+g4nINedTkZ60TaW7kNWDAlKxO8JonnN80tcp3jOrF1FL5fMEVk7zWFgi8b5GcqYZNSOTvTligbdurgKknLT9JmqPkqAA8le2ec77htatD2gJ2M5f+eXYtKrEhpOglPPp0tNe9h+3kpmtIQ/QvGLuQO383vt7s6xoRVT8T4h5ucjGVU/78XeZFqN7GmCkEH8WMryEUWigmo
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(23010399003)(36860700016)(18002099003)(22082099003)(921020)(10067099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /OIKIPAebA/1iMpF7w7XUGBhx8ElLYfBciFk+n2PSEKZofgRgllxMP86VidZvvEL4CgQJt3OzIv7Hj6+9nJVmohflWfDuSedM4B8SLl31nHWN+nW2vFWk3t6uJsq5JbAYMQJ9tRpmkGpICMSMai/fx4v/frzoeRS579Z2OmDXue4ZY0K+5maCsfT5P3nZ797YKMheIQiVc/ewOEl9JVTb2JdEdGZ0o8GxD2voyZhuWM4i6ij/3wBvyLVMVMcPmwFPI82Z5c+HZlNGM+UF+xxZK68oCCMZNdLh7OD/XmXkV8xsjqPMZAvTU6GQptWK+7HmLH7HZtncEJ6+UaUSsFlg79D++06eTU4+QR3yeazzqzMYjPrAprBCPasottwaCaAzDYVKcEXfa4uInHEqStQpi49U7bFSp68ChnFrj7w9mt9HxMo1CGO9GWOAQuc38hL
X-Exchange-RoutingPolicyChecked: oFugMCFScvtjn2yJKvJl7+2AohcL1+cUc2ZKf0kK8TmI7dRxy2N+OnQnj/3md9q3N2H/XDcGLuIVaQkHIdbF8GIxc5SrJb2q0m4hP5014Fhr2nlQzfeI7aufWpOzcHAzmDUDLMp5EH7ZudYZMcP+mhBMe/FkduiLoFfOK0tapLQkK96j9WlB8ds5EaILiP6oAQwQm8c3WnEaoWN7AyP2wYP59J49GWoL3wzE94UJxGLzfcYDn7IWzUDD7c34mx0KO3VKfvIb0xWHGGsJmTKZE6NaWjNp0lvFU4fgj3GdFUTJcTe12cDbJ8PUK0h/MxNNI+bE9lGtBhx7ByjKT5U8cg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:15:40.9530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a83cf8-43c8-47af-7348-08def6f23db3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6095
X-Proofpoint-ORIG-GUID: bWyyxW0TfX3wEIGCccjQdyh905XIpBu3
X-Authority-Analysis: v=2.4 cv=crCrVV4i c=1 sm=1 tr=0 ts=6a79eb26 cx=c_pps
 a=tVU0SsWZS/EEg8/MReKahA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=SxTibnW5tSAW0Is98DsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX29UazT3ruWIO
 pRigA1e/l47+hfWJZPE0rfiaT+mdMX2274ik/wanVgfIhbnmws66cZnVYlW44efFLigo5k0alLS
 Uv2b4IB49dRK+5W0PPPTyHGzF+q4its=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX0fmEWthbc5/V
 Vs7nAtco1WKMBik9wUxUUqpVn8FChEMorbPwHSGyi/dnoIKWEvhwi3WZm2Masaujf4R1XPDnWov
 Prd6LBnk9f2C9sxmiYuYI3QTo7p0/+7WUYQwcYVVrlJaBLgh6TA2qMfAof4/G3NYabRRI2jYxn+
 SvHgbDpAVH7GNgi5hRxvdD0jpcIqjhbO7gULFm0R/pFkkp1LjGCWd7iUgWMt89UUVQ02EnJlws8
 jOdUN0J749vrNh9qoc6vEI3TOfgm4zSHMmlTGLdVyCTIczcRDaR8jAFCqgxYugfEguSjHrUIbpK
 HtU1/Dux05kVGXEmnwXzMe5UqaNUhoQ+TuVfu6YL0zaosgGHSVpa96D1493Fh4ci+urMaU69fb+
 5gAdOPDUQe4gVqawDb464ZjYJMK4Uw==
X-Proofpoint-GUID: bWyyxW0TfX3wEIGCccjQdyh905XIpBu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_081556_326646_A35705D9 
X-CRM114-Status: GOOD (  16.94  )
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

Add PSIL and PDMA data for AM62Lx SoC.

Introduce new PSIL_EP_PDMA_XYMF type for channels that have multiple
selectable fifos. Also add a new fifo_id field to psil_endpoint_config
to specify the selectable fifo_id.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/Makefile        |   3 +-
 drivers/dma/ti/k3-psil-am62l.c | 169 +++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-psil-priv.h  |   5 +
 drivers/dma/ti/k3-psil.c       |  78 ++++++++++++++-
 include/linux/dma/k3-psil.h    |   3 +
 5 files changed, 253 insertions(+), 5 deletions(-)
 create mode 100644 drivers/dma/ti/k3-psil-am62l.c

diff --git a/drivers/dma/ti/Makefile b/drivers/dma/ti/Makefile
index 3b91c02e55eaf..41bfba944dc6c 100644
--- a/drivers/dma/ti/Makefile
+++ b/drivers/dma/ti/Makefile
@@ -14,6 +14,7 @@ k3-psil-lib-objs := k3-psil.o \
 		    k3-psil-am62.o \
 		    k3-psil-am62a.o \
 		    k3-psil-j784s4.o \
-		    k3-psil-am62p.o
+		    k3-psil-am62p.o \
+		    k3-psil-am62l.o
 obj-$(CONFIG_TI_K3_PSIL) += k3-psil-lib.o
 obj-$(CONFIG_TI_DMA_CROSSBAR) += dma-crossbar.o
diff --git a/drivers/dma/ti/k3-psil-am62l.c b/drivers/dma/ti/k3-psil-am62l.c
new file mode 100644
index 0000000000000..ee77fae3787a4
--- /dev/null
+++ b/drivers/dma/ti/k3-psil-am62l.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2024-2025 Texas Instruments Incorporated - https://www.ti.com
+ */
+
+#include <linux/kernel.h>
+
+#include "k3-psil-priv.h"
+
+#define PSIL_PDMA_XY_TR(x, ch)					\
+	{							\
+		.thread_id = x,					\
+		.ep_config = {					\
+			.ep_type = PSIL_EP_PDMA_XY,		\
+			.mapped_channel_id = ch,		\
+			.default_flow_id = -1,			\
+		},						\
+	}
+
+#define PSIL_PDMA_XYMF_TR(x, ch, fifo)				\
+	{							\
+		.thread_id = x,					\
+		.ep_config = {					\
+			.ep_type = PSIL_EP_PDMA_XYMF,		\
+			.mapped_channel_id = ch,		\
+			.default_flow_id = -1,			\
+			.fifo_id = fifo,			\
+		},						\
+	}
+
+#define PSIL_PDMA_XY_PKT(x, ch)					\
+	{							\
+		.thread_id = x,					\
+		.ep_config = {					\
+			.ep_type = PSIL_EP_PDMA_XY,		\
+			.mapped_channel_id = ch,		\
+			.pkt_mode = 1,				\
+			.default_flow_id = -1			\
+		},						\
+	}
+
+#define PSIL_ETHERNET(x, ch, flow_base, flow_cnt)		\
+	{							\
+		.thread_id = x,					\
+		.ep_config = {					\
+			.ep_type = PSIL_EP_NATIVE,		\
+			.pkt_mode = 1,				\
+			.needs_epib = 1,			\
+			.psd_size = 16,				\
+			.mapped_channel_id = ch,		\
+			.flow_start = flow_base,		\
+			.flow_num = flow_cnt,			\
+			.default_flow_id = flow_base,		\
+		},						\
+	}
+
+#define PSIL_PDMA_MCASP(x, ch)				\
+	{						\
+		.thread_id = x,				\
+		.ep_config = {				\
+			.ep_type = PSIL_EP_PDMA_XY,	\
+			.pdma_acc32 = 1,		\
+			.pdma_burst = 1,		\
+			.mapped_channel_id = ch,	\
+			.default_flow_id = -1		\
+		},					\
+	}
+
+/* PSI-L source thread IDs, used for RX (DMA_DEV_TO_MEM) */
+static struct psil_ep am62l_src_ep_map[] = {
+	/* PDMA_MAIN1 - UART0-6 */
+	PSIL_PDMA_XY_PKT(0x4400, 0),
+	PSIL_PDMA_XY_PKT(0x4401, 2),
+	PSIL_PDMA_XY_PKT(0x4402, 4),
+	PSIL_PDMA_XY_PKT(0x4403, 6),
+	PSIL_PDMA_XY_PKT(0x4404, 8),
+	PSIL_PDMA_XY_PKT(0x4405, 10),
+	PSIL_PDMA_XY_PKT(0x4406, 12),
+	/* PDMA_MAIN0 - SPI0 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0x4300, 16, 0),
+	PSIL_PDMA_XYMF_TR(0x4300, 18, 1),
+	PSIL_PDMA_XYMF_TR(0x4300, 20, 2),
+	PSIL_PDMA_XYMF_TR(0x4300, 22, 3),
+	/* PDMA_MAIN0 - SPI1 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0x4301, 24, 0),
+	PSIL_PDMA_XYMF_TR(0x4301, 26, 1),
+	PSIL_PDMA_XYMF_TR(0x4301, 28, 2),
+	PSIL_PDMA_XYMF_TR(0x4301, 30, 3),
+	/* PDMA_MAIN0 - SPI2 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0x4302, 32, 0),
+	PSIL_PDMA_XYMF_TR(0x4302, 34, 1),
+	PSIL_PDMA_XYMF_TR(0x4302, 36, 2),
+	PSIL_PDMA_XYMF_TR(0x4302, 38, 3),
+	/* PDMA_MAIN0 - SPI3 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0x4303, 40, 0),
+	PSIL_PDMA_XYMF_TR(0x4303, 42, 1),
+	PSIL_PDMA_XYMF_TR(0x4303, 44, 2),
+	PSIL_PDMA_XYMF_TR(0x4303, 46, 3),
+	/* PDMA_MAIN2 - MCASP0-2 */
+	PSIL_PDMA_MCASP(0x4500, 48),
+	PSIL_PDMA_MCASP(0x4501, 50),
+	PSIL_PDMA_MCASP(0x4502, 52),
+	/* PDMA_MAIN0 - AES */
+	PSIL_PDMA_XY_TR(0x4700, 65),
+	/* PDMA_MAIN0 - ADC */
+	PSIL_PDMA_XY_TR(0x4503, 80),
+	PSIL_PDMA_XY_TR(0x4504, 81),
+	PSIL_ETHERNET(0x4600, 96, 96, 16),
+};
+
+/* PSI-L destination thread IDs, used for TX (DMA_MEM_TO_DEV) */
+static struct psil_ep am62l_dst_ep_map[] = {
+	/* PDMA_MAIN1 - UART0-6 */
+	PSIL_PDMA_XY_PKT(0xC400, 1),
+	PSIL_PDMA_XY_PKT(0xC401, 3),
+	PSIL_PDMA_XY_PKT(0xC402, 5),
+	PSIL_PDMA_XY_PKT(0xC403, 7),
+	PSIL_PDMA_XY_PKT(0xC404, 9),
+	PSIL_PDMA_XY_PKT(0xC405, 11),
+	PSIL_PDMA_XY_PKT(0xC406, 13),
+	/* PDMA_MAIN0 - SPI0 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0xC300, 17, 0),
+	PSIL_PDMA_XYMF_TR(0xC300, 19, 1),
+	PSIL_PDMA_XYMF_TR(0xC300, 21, 2),
+	PSIL_PDMA_XYMF_TR(0xC300, 23, 3),
+	/* PDMA_MAIN0 - SPI1 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0xC301, 25, 0),
+	PSIL_PDMA_XYMF_TR(0xC301, 27, 1),
+	PSIL_PDMA_XYMF_TR(0xC301, 29, 2),
+	PSIL_PDMA_XYMF_TR(0xC301, 31, 3),
+	/* PDMA_MAIN0 - SPI2 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0xC302, 33, 0),
+	PSIL_PDMA_XYMF_TR(0xC302, 35, 1),
+	PSIL_PDMA_XYMF_TR(0xC302, 37, 2),
+	PSIL_PDMA_XYMF_TR(0xC302, 39, 3),
+	/* PDMA_MAIN0 - SPI3 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0xC303, 41, 0),
+	PSIL_PDMA_XYMF_TR(0xC303, 43, 1),
+	PSIL_PDMA_XYMF_TR(0xC303, 45, 2),
+	PSIL_PDMA_XYMF_TR(0xC303, 47, 3),
+	/* PDMA_MAIN2 - MCASP0-2 */
+	PSIL_PDMA_MCASP(0xC500, 49),
+	PSIL_PDMA_MCASP(0xC501, 51),
+	PSIL_PDMA_MCASP(0xC502, 53),
+	/* PDMA_MAIN0 - SHA */
+	PSIL_PDMA_XY_TR(0xC700, 64),
+	/* PDMA_MAIN0 - AES */
+	PSIL_PDMA_XY_TR(0xC701, 66),
+	/* PDMA_MAIN0 - CRC32 - CH0-1 */
+	PSIL_PDMA_XYMF_TR(0xC702, 67, 0),
+	PSIL_PDMA_XYMF_TR(0xC702, 68, 1),
+	/* CPSW3G */
+	PSIL_ETHERNET(0xc600, 64, 64, 2),
+	PSIL_ETHERNET(0xc601, 66, 66, 2),
+	PSIL_ETHERNET(0xc602, 68, 68, 2),
+	PSIL_ETHERNET(0xc603, 70, 70, 2),
+	PSIL_ETHERNET(0xc604, 72, 72, 2),
+	PSIL_ETHERNET(0xc605, 74, 74, 2),
+	PSIL_ETHERNET(0xc606, 76, 76, 2),
+	PSIL_ETHERNET(0xc607, 78, 78, 2),
+};
+
+struct psil_ep_map am62l_ep_map = {
+	.name = "am62l",
+	.src = am62l_src_ep_map,
+	.src_count = ARRAY_SIZE(am62l_src_ep_map),
+	.dst = am62l_dst_ep_map,
+	.dst_count = ARRAY_SIZE(am62l_dst_ep_map),
+};
diff --git a/drivers/dma/ti/k3-psil-priv.h b/drivers/dma/ti/k3-psil-priv.h
index a577be97e3447..970afd46a79e6 100644
--- a/drivers/dma/ti/k3-psil-priv.h
+++ b/drivers/dma/ti/k3-psil-priv.h
@@ -35,6 +35,10 @@ struct psil_ep_map {
 };
 
 struct psil_endpoint_config *psil_get_ep_config(u32 thread_id);
+struct psil_endpoint_config *psil_get_ep_config_by_id(u32 channel_id,
+						      bool is_pktdma,
+						      u32 *thread_id,
+						      bool *dev_to_mem);
 
 /* SoC PSI-L endpoint maps */
 extern struct psil_ep_map am654_ep_map;
@@ -46,5 +50,6 @@ extern struct psil_ep_map am62_ep_map;
 extern struct psil_ep_map am62a_ep_map;
 extern struct psil_ep_map j784s4_ep_map;
 extern struct psil_ep_map am62p_ep_map;
+extern struct psil_ep_map am62l_ep_map;
 
 #endif /* K3_PSIL_PRIV_H_ */
diff --git a/drivers/dma/ti/k3-psil.c b/drivers/dma/ti/k3-psil.c
index c4b6f0df46861..3a9b43e179d1e 100644
--- a/drivers/dma/ti/k3-psil.c
+++ b/drivers/dma/ti/k3-psil.c
@@ -28,6 +28,7 @@ static const struct soc_device_attribute k3_soc_devices[] = {
 	{ .family = "J784S4", .data = &j784s4_ep_map },
 	{ .family = "AM62PX", .data = &am62p_ep_map },
 	{ .family = "J722S", .data = &am62p_ep_map },
+	{ .family = "AM62LX", .data = &am62l_ep_map },
 	{ /* sentinel */ }
 };
 
@@ -71,12 +72,68 @@ struct psil_endpoint_config *psil_get_ep_config(u32 thread_id)
 }
 EXPORT_SYMBOL_GPL(psil_get_ep_config);
 
+struct psil_endpoint_config *psil_get_ep_config_by_id(u32 channel_id,
+						       bool is_pktdma,
+						       u32 *thread_id,
+						       bool *dev_to_mem)
+{
+	int i;
+
+	mutex_lock(&ep_map_mutex);
+	if (!soc_ep_map) {
+		const struct soc_device_attribute *soc;
+
+		soc = soc_device_match(k3_soc_devices);
+		if (soc) {
+			soc_ep_map = soc->data;
+		} else {
+			pr_err("PSIL: No compatible machine found for map\n");
+			mutex_unlock(&ep_map_mutex);
+			return ERR_PTR(-ENOTSUPP);
+		}
+	}
+
+	if (soc_ep_map->src) {
+		for (i = 0; i < soc_ep_map->src_count; i++) {
+			struct psil_ep *ep = &soc_ep_map->src[i];
+
+			if (ep->ep_config.mapped_channel_id != (s16)channel_id)
+				continue;
+			if ((bool)ep->ep_config.pkt_mode != is_pktdma)
+				continue;
+			*thread_id = ep->thread_id;
+			*dev_to_mem = true;
+			mutex_unlock(&ep_map_mutex);
+			return &ep->ep_config;
+		}
+	}
+
+	if (soc_ep_map->dst) {
+		for (i = 0; i < soc_ep_map->dst_count; i++) {
+			struct psil_ep *ep = &soc_ep_map->dst[i];
+
+			if (ep->ep_config.mapped_channel_id != (s16)channel_id)
+				continue;
+			if ((bool)ep->ep_config.pkt_mode != is_pktdma)
+				continue;
+			*thread_id = ep->thread_id;
+			*dev_to_mem = false;
+			mutex_unlock(&ep_map_mutex);
+			return &ep->ep_config;
+		}
+	}
+
+	mutex_unlock(&ep_map_mutex);
+	return ERR_PTR(-ENOENT);
+}
+EXPORT_SYMBOL_GPL(psil_get_ep_config_by_id);
+
 int psil_set_new_ep_config(struct device *dev, const char *name,
 			   struct psil_endpoint_config *ep_config)
 {
 	struct psil_endpoint_config *dst_ep_config;
 	struct of_phandle_args dma_spec;
-	u32 thread_id;
+	u32 thread_id = 0;
 	int index;
 
 	if (!dev || !dev->of_node)
@@ -90,9 +147,22 @@ int psil_set_new_ep_config(struct device *dev, const char *name,
 				       index, &dma_spec))
 		return -ENOENT;
 
-	thread_id = dma_spec.args[0];
-
-	dst_ep_config = psil_get_ep_config(thread_id);
+	if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-pktdma")) {
+		bool dev_to_mem;
+
+		dst_ep_config = psil_get_ep_config_by_id(dma_spec.args[0],
+							  true,
+							  &thread_id, &dev_to_mem);
+	} else if (of_device_is_compatible(dma_spec.np, "ti,am62l-dmss-bcdma")) {
+		bool dev_to_mem;
+
+		dst_ep_config = psil_get_ep_config_by_id(dma_spec.args[0],
+							  false,
+							  &thread_id, &dev_to_mem);
+	} else {
+		thread_id = dma_spec.args[0];
+		dst_ep_config = psil_get_ep_config(thread_id);
+	}
 	if (IS_ERR(dst_ep_config)) {
 		pr_err("PSIL: thread ID 0x%04x not defined in map\n",
 		       thread_id);
diff --git a/include/linux/dma/k3-psil.h b/include/linux/dma/k3-psil.h
index 5f106d852f1cf..36e347311f8b2 100644
--- a/include/linux/dma/k3-psil.h
+++ b/include/linux/dma/k3-psil.h
@@ -35,6 +35,7 @@ enum udma_tp_level {
 enum psil_endpoint_type {
 	PSIL_EP_NATIVE = 0,
 	PSIL_EP_PDMA_XY,
+	PSIL_EP_PDMA_XYMF,
 	PSIL_EP_PDMA_MCAN,
 	PSIL_EP_PDMA_AASRC,
 };
@@ -78,6 +79,8 @@ struct psil_endpoint_config {
 	u16 flow_start;
 	u16 flow_num;
 	s16 default_flow_id;
+	/* XYMF FIFO index (0-3 for CS0-CS3), Only for PSIL_EP_PDMA_XYMF */
+	u8 fifo_id;
 };
 
 int psil_set_new_ep_config(struct device *dev, const char *name,
-- 
2.54.0


