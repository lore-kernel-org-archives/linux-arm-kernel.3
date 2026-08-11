Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0FEC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SUbAO3L7kpk8w2biYEFJQ16/zQPqX9K7gIwf2A8TWwY=; b=Oo0p7JKzqhDIQW9NoQavJUEEMv
	eX02If5So6FoASoUOTKzyiycVS+BOE8lRQwRAuJsp2PYDNnAk0GasC1H16n+Ae9ZPOcq0ufVjhhMX
	vLnCwvanQFddn1MZX9XSsDCU3RqkfBWwg4jp0IKYcCt4U/4KxSiKzSWO09rbcvDy/vDsu5U9Fgjqj
	epWoYS7/bZL95Gv1z3cpV9eMqVdTVrW7828TZ3a1tP1BCNS4QujckaUPQBN3vcZ2HKEvtyYD96lYF
	H8TtS58n8dP7hgSyaZ2pzGR7wMD5doAo/IhoCVA06pKMkY9eZ6/Ff32xzhkcxjEwZBM6fc6E52AEc
	PzRMFYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmDf-0000000E4LU-20Ar;
	Tue, 11 Aug 2026 13:08:39 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmDc-0000000E4L8-2pYT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:08:38 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67BCSOo51521589;
	Tue, 11 Aug 2026 08:08:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=SUbAO3L7kpk8w
	2biYEFJQ16/zQPqX9K7gIwf2A8TWwY=; b=dt69AnP2TpZTuX60J616chbvGGsJN
	drET/1p2N8lU+OVvUD9g4aJ+O8REu2NBvSj6xIRJVQK/H2viqa0I/Z5AO/NeQiaj
	eZVU17ruYjlN3sIXMhSsO4QnAVDTHWWj/x0fhN5U1pY8if6JekVBUg1isP3GSq/u
	9iBx4at1t6ELuxv6+4cOAe5d9ILAjt8bXVaRQuxAGgukmn3Lu3uSOdFfvInz5DC0
	u2psO1vp4wKfnhUWr0U3jZRjB0bzOzsNPm2XAy4d0ryXxGSGqiD/tUE4FY+RkWkl
	WTaii/+fhjLcUfKMd5CnALLInKmq8oAnNKgEGxYB/nzc+5k+tgsXbD2aA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010038.outbound.protection.outlook.com [40.93.198.38])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g02pb8hgs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 08:08:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJD0WUFw2ZE3dxMNfuL9tU8LS5h21EQtKGT+UAvhlPgjntm/1FEwlpuanpvlx4vH4mUW9mYtwT+uDaFJvzxYTUq5bBhqc1nrtsWyZbUnr0obe4gfkjJ+dtSKoZUxgfrHilhf2R4TbVfiDB12MzyVdl0gCAUvMAqdn/xQ4Zl6HKsfbcCTNbipPr2x6PzCNzSkEcOvIttsXwjynlLzzVi6FQTfkMgGqq+BZfACQIW/Yk/nxuoNdU1CIPxKyjyHb0P+DBZdiM39UFDQl47OT06pNCuV3rIUWw6gQo/g8ZUYy+yI5xWw4EzOcv/X3hBqvuqDAo4QGrMZNsEmdu355mTn+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUbAO3L7kpk8w2biYEFJQ16/zQPqX9K7gIwf2A8TWwY=;
 b=LKcS4jfQVkj4BrEEqrwHP1n1LaqJNPXqupchYD0XfaeqpYExbDu3HaSI38QOJ1p4zD1hm4KtVTCwRJcTH2Y/ZQCCGoSTf4rZDLQNxTOk2JJHUHhVBhXU2xDkcdr+J2Gx8PLZaFDusckTP9yvBPFQzLmdjkKmx7P6XIPMZALJoUDLHCwPQRiXBSKz1xRAqwxLbIwMjuTSsTTxpWJFjRzW81xcf/UJEM4Z3mDQ72PsnxRMu4M1+mm9I513AyrdVFUnwsmVQmXV4qOnzbEJddBiXKTk+JSRLPKG+92qgGzzpdyREeb7xgL6A5BtiutI7eeY4dWXk/M/0QguSyJP3xPw1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUbAO3L7kpk8w2biYEFJQ16/zQPqX9K7gIwf2A8TWwY=;
 b=Fl5rgbig71QIqXNXZT5Lz1YiKoukCXLu8UN/R20CMARjM2yfs84zDL9Waven506G2iqII8G2Ax8M2abcYMmOiN92IuFv/1ZCxPopJIZ1otR5vbZltUxIf8S2gD+dHl/T0VYAvLZne4XKe39eQKdL0dgN5rWPkHzxOvZhfHzVv0g=
Received: from CH0PR03CA0369.namprd03.prod.outlook.com (2603:10b6:610:119::22)
 by PH5PR10MB997756.namprd10.prod.outlook.com (2603:10b6:510:39e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 13:08:28 +0000
Received: from DM2PEPF00003FC4.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::94) by CH0PR03CA0369.outlook.office365.com
 (2603:10b6:610:119::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 13:08:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DM2PEPF00003FC4.mail.protection.outlook.com (10.167.23.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 13:08:28 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 08:08:27 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 08:08:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 08:08:27 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BD8NkJ1231536;
	Tue, 11 Aug 2026 08:08:24 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-jain1@ti.com>
Subject: [PATCH v4 0/2] Add DSS support for AM62L SoC
Date: Tue, 11 Aug 2026 18:38:20 +0530
Message-ID: <20260811130822.2324438-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC4:EE_|PH5PR10MB997756:EE_
X-MS-Office365-Filtering-Correlation-Id: f1cc030a-bcb9-4148-d12e-08def7a9a2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|18002099003|56012099006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: CZoOQWY3GfcOe1NqDkUZwBpYz1rwve3rapdaY1kxsliZQgy/uT9PArTbSDKQLiA5kN4KA6sokDSdRp9HxJMio2mNZJgUoMlaSfIfShk/bnIkuhZLZeN9FfdbkpqMtHSolAKN6iNj2KdnJaUYYUqmYy773wMqFwzQ0ixdFSRf4xFBkrh/3Sqa1DiVQDt6q0Hd5d3PxsrcJndpjKV9Yue3vJX1G1WNnEyk2pBVHEXzsFR+Su55a0t5H9g39LIOG1KHNNPobnLzVMqGvvvkNwrENkwwR0u12lFVygGbaHrtIf5w2+OF4Uj/RUnwX1iVfhNvCU2wobrYc/Cp0W8BjNgU642KUDc9Hf//ESawbfpLhQUiIMI7xWgR3AeN6x/ZQMUCizH9CrUhOU8MtFSuC+1CC4aaMjcBA0Nr+nD+nXeHP2KdDa/TSDVcmz7jnD5q24VgJDwpfwpX0XytfVE46QgRbUMbvpEu7gSAIdRf2iY80J1esh5Ni7c5M6NfZxqIHxXPBQPoIUqtRfhi5HDUV3gRD2B8RP4bOSgby9qtx3xY+eVzBub1rQostsWxwy27dSdqBPVZOFg8SwAG5d0Ou1shP/eEZWXnOAmkHbuQJgNZ89jxcTrKa+ZJenKz2Wpy9DFiEBgXAUgIpUytR1a8VxLdq0sW0LMrcDX0EpceN7+BWXm1O5XV0Pa7fD4dq1JubBiJ/cfxpvZqmY6IwgADahZCew==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(18002099003)(56012099006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pKVlLZ+EP8vimQ3Xv26WQivXU5sXnxYEd1IbckOmIKs2i3ATejzO3v8UjyGrsfMTEFgNo6CiRAl8zThyBDi13XPETtTBpelNcdS8pxuBQuF5G6jEYw+4TNmV/teQQBc7CMNTGRu+eEDCM1MUsz0e16LPZxlxEnEs1iRZ/EBrTnTdSdQjWWQ9QvBR01e6l/vfSRGgVETd+FV+EgKxYtegsopiM0YicAG+7iArLdn+rfTmMNlSeQVa1DeaHIY82Rpb7AlWOqq2G3yLVPREv1W7BY/IOhpJR4Qc4CcLYrjDUeYMMaenViWv066SQ0kNpU+esFstNSqmdux4Juz0LKJilLWlaQuxLbJDlmzMNw38JxCqGDCCLZv6Pdi5EvW2zS7Z4MwbnYEvolzD+/MYGuSS2yYYTkrPrBlIBzREu6fgl6R0x5hBx63vjGXfRDvIJwBc
X-Exchange-RoutingPolicyChecked: n2v4db3uHBSaRCl6PD3JUkKRw371HaCsQTJ5qiptUu0YhWuaurDHi+l0HIcYt8+QXRhYzuhQKjExU5aftlw8AYegIl+hAyeYSkRTT7hq/ZYP9y5N3Z0SqpOuEkn4USlQvGJsOp29d3b5sD4idFzci1zYjePlVAeK5xJgrRlGSIP8x94h3rro+jzJrfWdV5M8vyOHbBUOmb/zWptyN94sN//dDgcm9proHdIeGH3MbhL/N5asYwQADhlB/jua5/c2t0Sv2gyH30Et+Cq1YpAYp5CY9+a+Gk9b2Ps1/i2nsd+o1ipFZv1Y7MgOzVfRXG//a4I33i4KH77U2Wz98Su64w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:08:28.2623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cc030a-bcb9-4148-d12e-08def7a9a2a8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997756
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwOSBTYWx0ZWRfXzJI52YBzaE7u
 N2dXxLOMENySN0FLO1l3hbCpbWO7VMbCu6OmmKbejuGcjhJir/arKeBmqDLKZf6bw/xT/1dKZvQ
 KIUcVx+H4Ibu6YBI4Rzn/85q0Y2TUG0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwOSBTYWx0ZWRfX3nC8gxsOM0WF
 Kn0dVJwH3tSx0vR1L2HV9JIXbO9TrF1/UY5qin1q6Ch+Jc8sDbiBFWnM+UNfh552eQwPbsKzeyF
 Q7AJoOUamj+cpolxhgEy1Zb7lsymaKGVc2jcmsVlq7ugbZBYzvSmY2CDMEnYRAnFQgJBONhQJTV
 qtXEn0bNFw3fqto1qMgNh10SkeYwpmbkCXBv0Sfh8FezNxa07zPMPs5zRJyVTTDZ7gvcIgLzjfD
 to0K2TawN5itOKVt0c27mXtkFS77vzeU0yUZQsQ249+tBkLVUjvcuO4KPfskeDoPoYcZAM/xuyi
 /rMp1jvX7ElK0aXE3G0uc0Kyw/Ank6zR/OUAO8kyKJ7x5QS5V2PgMvLlUDJNzPDKrGepv80GUiH
 dzLS1d54O/eHSvZJkYR/5AA6LJt/IJ+8+xCUI2+EA5f90erZZxubGQrpvMClpXN6crYFOPVcpML
 BCx/eJHMVi3fsfSuz7g==
X-Proofpoint-ORIG-GUID: vFUGrxtekjrNSInv8OK-xksOgd2Q1dKZ
X-Proofpoint-GUID: vFUGrxtekjrNSInv8OK-xksOgd2Q1dKZ
X-Authority-Analysis: v=2.4 cv=Ic+3n2qa c=1 sm=1 tr=0 ts=6a7b1ed0 cx=c_pps
 a=04So32024hOmtaefayDOVw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=JLQES9i2aRcSmLGWkN0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_060836_717968_513726BB 
X-CRM114-Status: GOOD (  10.83  )
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

This series:
- Adds base support to enable Display on TI AM62L[1] SoCs
- Adds base support for DSI output
- Enbales HDMI output out-of-box

[1]: https://www.ti.com/product/AM62L
---
Changelog:
v3->v4:
- Change pin configuration from PIN_OUTPUT to PIN_INPUT for
  VOUT_EXTPCLKIN

Link to v3: https://lore.kernel.org/all/20260723102519.3581762-1-s-jain1@ti.com/

v2->v3:
- Split patches for SoC and EVM related changes
- Add dsi ports node
- Correct styling issues
- Drop GIC

Link to v2: https://lore.kernel.org/all/20260528133529.3476499-1-s-jain1@ti.com/

v1->v2:
- Update the commit message to elaborate more about the patch.
- Add dpi-pinctrl configuration.
- Update the interrupt routing index for HDMI interrupt line

Link to v1: https://lore.kernel.org/all/20260513210942.692269-1-s-jain1@ti.com/
---
Devarsh Thakkar (2):
  arm64: dts: ti: k3-am62l-main: Add DSS & DSI related nodes
  arm64: dts: ti: k3-am62l3-evm: Add HDMI support

 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 60 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts  | 95 +++++++++++++++++++++++
 2 files changed, 155 insertions(+)


