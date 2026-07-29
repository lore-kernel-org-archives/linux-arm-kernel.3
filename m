Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DD9C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nXNe19qknNt1gwuRt/GJjnicCk1lvk6ehLrTkxws1q0=; b=4xoPJYA6ov7vBdNrz0VqCh4U4w
	oDG4HaiSXOpMEJ98436oyhsyZGNSMVfNeQmGyUoHuDlxJhTvsIaTQO6iYm17M9TY7PJ+OJBJPExTA
	/2npSjCT6Fg5YVtBindmLNioZBjbTtYrqWvck7PHqINVjf4OPlHuOc1+5lFUQh7TJUe7TdKtXYALb
	IHhf9sgGet26ERWNW7WrujXFckn1ZloanHIBpFJ5XImH8AqWIhCCz+gIbXwaJJq2mQAxNJH5ggSKS
	Llqiz0d6XgAFtWs3GM1Mm+HW3VNyUIF+tpNUPSRsAsXuh8ME3N9bJiqrJrfhYJsjjghl4HIrFsW5P
	aLC1A6dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpARv-00000008v48-3hEK;
	Wed, 29 Jul 2026 20:00:19 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpARo-00000008v2H-3Fm4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:00:18 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TJ61ne3536823;
	Wed, 29 Jul 2026 15:00:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=nXNe19qknNt1gwuRt/GJjnicCk1lvk6ehLrTkxws1
	q0=; b=gkFM5BNiWCytmyGwfcidMcNgc/IkIaNztwP5tEvCpxotcVsbcBx+5LH/N
	n6o9fv4v28xyfWf6fvRDPuz1Q3tLTAfBas0QlPFvmhWj9+iyEBXahA8AHyiA4/CJ
	JeAcyaddVbz1mYuiFysLowfZhneJHyb4jVOUwXyQqagUSxGvrwiUVwl6tM8uAcfj
	gCTeeoSF7AGVqRgX5byjXKm6Xa4HdVqGhY4Hlf8lZ2uHXIFuXxqjmtc3Lob9Q7T0
	GrHHeI87HU9LIhi9eLh+HA6ychev9q87Iles+4Rj6FTyreBxzSJkbT2UN5HoD+ps
	WkB3Z7Daykb0E8VZB3zuMw1Y4YTCQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010070.outbound.protection.outlook.com [40.93.198.70])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqqcmrapd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 15:00:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5sQ7NiawfuffdzTGALZ+MYO0ZXiiArNUa2PP8HMth1k+fhAwekTQ/dQxur5ja6FBNqPKfyf+A7SFRkZ3qAf5S8b5zfyJ/5nLHcmOrv2pZuPCOFzXi8xw+Gd37cStl/c+2hTxZ3ozkN6xIZSzWgG0YsntT2rG4OR2szoQNlEue0+rJuMhLSTjO1KS0M8dPTFTpDDqqNBCo5yCNrAsXZ/yh1R9Ujm93MTMprU2tHb7ZW0uChWQ1p5zqn/WJPW70vmM19qngsX8aWWkNah7dtdHpP6lbGeS6gMMXQ9d5TRRVP7+2ouwrwNl07Hm6QtWjYCNVxwyB1f+OYLtnPL7R8NsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXNe19qknNt1gwuRt/GJjnicCk1lvk6ehLrTkxws1q0=;
 b=JZmTcfgwd1TxjJitWj3OvSxCKGQ6XcpGNYFOUPCsrpEYVNRKy5ztkFi0/eYo+YICnz4rpcZacwYPunMYkFYeoGq4mUIGIAHw9z3gcmd/hOxBw4A70FBtaM1EiOVW4mSIfhhwnuHwtOhrGZ6lTaDw1wjQbtJNzByhpfdjwVgCg9IKD3QY7EyN2zJDFKmLFjM7LFn1HcJ9KYmDD3nlCVYkuoFP9T7b6aC04O6RYBxeQaah5BD4nTeEPt4EtVV1ALumbmD8cFAtj0QzbzEVUFJlP9z5Th2xXrmhdQpjZ2bNMA1yjeFUWf5MclybRZ5McQbQGWmfKikbyQRKIUmyZNqgdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXNe19qknNt1gwuRt/GJjnicCk1lvk6ehLrTkxws1q0=;
 b=RZZ8PHwF4q8rs6xiBu6rgyqrpCopcg7gR6P+TQrLBWPdxlWTuP4E99CD6uDcmK8TurI48GUi4ZZxrauWvXf7Ewoo0opFH4exVAgUkd39J9DzZ2Fl/wObNgIFUXJ0zdjmbhZYNCd805UpUz1KL9m/DUhqwfSD/j1OXtMeGzJl6GQ=
Received: from PH8PR20CA0006.namprd20.prod.outlook.com (2603:10b6:510:23c::11)
 by IA3PR10MB8491.namprd10.prod.outlook.com (2603:10b6:208:576::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 20:00:05 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::14) by PH8PR20CA0006.outlook.office365.com
 (2603:10b6:510:23c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 20:00:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 20:00:05 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:59 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 14:59:58 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TJxwfv1923570;
	Wed, 29 Jul 2026 14:59:59 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH 4/8] arm64: dts: ti: k3-am62l-evm: Remove unnecessary internal pullups for MMC0
Date: Wed, 29 Jul 2026 14:59:54 -0500
Message-ID: <20260729195958.671147-5-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729195958.671147-1-jm@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|IA3PR10MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: ee05acee-6fd0-4c60-9874-08deedabfbb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|10067099003|22082099003|18002099003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: vjx+/HWSmw4nsmKZnYnvqBPHHMP3Evf6R/u3kOAsRP3xtyMur+YO7VAJbxUer3RLF6ZwlhbOmn3x5Q5wZGYnG2sDCI2KtFOdXHaKauj1w1Nq2rWRFYTU80G0fk/wPU8EqHJt5kxCU3nTIrxixY1mG0h/feDgJYBzhpJBKbaosZikLb+xABW2AGWcAXU18ftYaS15i3q0i6IrRxC6kSLCwMP3rFokp4JwjshtronfGQo9ObAQhuhPjz33u6AUqUMFiAs5zBLMlWn7k1sHNiVpR+3RW540kysNOlphDJ2JfgTRHmB+sayvza6G397vB6t0Q9WbDWs3ALv0yno9rQncYDLuAzEFh/G6c5lwsyRvMIlHNa2GJKJEYW3yRf2dh/Rr15/rJN6EVKsgS3lnyJgi/FEDcOft8sjLzOuhBgT4kcc33y6PiiaGio98NbUabzMcawIzivpjdAB7iRWALAYqVB396m3NEN07QPKxJaRh/W3vuralzsP4kYlkZc0JrsSIZOMJrYWWr4e25ArZ9EAReRPtPe0Ev1HIJWhBxJx+/D57U8XJ2epjR/lOR19vlYxsHO3y9cv2Y/CMMee/guXGxzLlZ1jznVFk1jHvVE++y4OVz9U/OJYawZ7hLIisrpKPqHC+N+Yjt5SHnuZFV4ySdxCuZe0WdJQ11TJUNsm9GNE9p5kc30/U0ksFmBSi27sbuSgdcYUb7ulVgxxmZAdJ4g==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(10067099003)(22082099003)(18002099003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tNYAdO/Yhmeh4mKKab/tryc63VSuHI0lr7sVzCymoUF2gU0AD+WcKRCRHoWaELuGn97CIyGCxWo4xBUJ/W5e8CQjW4JXA94fTg6GgLMyiIHwnus9untVsYeNP8xnNr7BdsaiyO8MwTVviesmmC4BJEAhzmrJpwMo+wmthQPmAZFn581Cd2DOLM9z+xrZDbWpVmH9efjnQgZkr4n45ajb/4/2B9JP+FpLENb6YlZfcyhOxB7JX9PHFaf1+t/aCU4wyRGxXXGjPGnc3Bl0imYsuO2GH4hZrERyfcq2NGArMsiuo7OQTn3QRI+gy7PEZkroPchHnivP1sYIarKyVP/oawSrRtRAllv/F6aX8oiS7fm1xpSH0KW8C2k7EvuGVPQu3BT+GxMBnhbkT3RBK5hXKWb8TcRfzNDQD0jSeqPD+V4tBi1u7MmvyP7YXhrg5FyE
X-Exchange-RoutingPolicyChecked: GYtWQikXkCx/uXY2o6oEhl16/qysTkGrhhP/l8/VMeBul0VvM0m+JKoYzQdenViSCYEVtGkIuikEjjXkgyW5bGO58i1hZrniNxWErYqrKc6kV+59V1/crgqwsoJmLLxfrr+92EcuOKL7R3uORz4kE9SQuCr0rFd+WOMLxsazw0ZlWqg1YCVR69jk5J1ljwGG5r54wCs9k7e9UZRJOT7uWzo//f/hiqpn46GBonnsfVYF/rOLOwJXEP/CUzGMJfGTg+Bth+JMkToOZZplMixiVlWIvPq5isQdHmuNGRJ/QMAbbmtMOF7+28ms/FbgPVpyfiPqzqcWCriqhji7A/ewww==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 20:00:05.0507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee05acee-6fd0-4c60-9874-08deedabfbb5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8491
X-Proofpoint-ORIG-GUID: ONZEN_HfY9LAC561S7Le5B8EloAO51en
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX2Ns5VrAbWESt
 YkrOJi5ePYnttp7njr6MpGiTY7UoNvVWp6jesknJRaUDxTgoD4mq+H8IOsSYOEiMiM/lsjYnEWf
 kvIqX41qftiTW3yjxtFiNXFtqn4aZW8=
X-Authority-Analysis: v=2.4 cv=UtZT8ewB c=1 sm=1 tr=0 ts=6a6a5bc8 cx=c_pps
 a=6pz+1SGHl1vfFjSiae6wlg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=ejCK19o8EeXzOiwc5R0A:9
X-Proofpoint-GUID: ONZEN_HfY9LAC561S7Le5B8EloAO51en
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfXycF4VsuT2W2s
 SH41suzydFSfZ5o8eFhGmLpJrDt+r1y5YOdZZJLoIVY3fSWrMkf1rGTofXPTS539FL6qfeGox4O
 mRqe7NIxuNr7uvd40jYIgMGX9UVsV+71p2cZXv09HSj+vD6IlSPoPhQyKcKuuyMpa/Tptt8T/1C
 QISY6YAnJFciQuLeTB/Omvec8j8ucOm75uvRlJvTCud9e98zUuYbBgNZ9wd7AY5bwpPN/paLvF/
 YWgbiQT+KlcpbWxOE9W2lkxE1meneGD37I+QlHY16uwDjFjeCycfcgMjtI4G78ysnskd2g3zHZR
 T4GpAYpE0gaxYHV6VCdoqKFjWSqQH9aL3aHWye+bH17YnuFZlSfd/hZ1nl6yQ3FIwm8WwEvQaJT
 Ya0ilS3Rt6F6R1crYQ66D70xA+CgvVE+Dy8hu4tHhtXlq2/88xnpNAE30uAEjzDN/gvcJg0iPlp
 5dOFhgDd42SAsm8xQcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1011 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_130013_071835_4C9F3EB8 
X-CRM114-Status: GOOD (  12.67  )
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

AM62L EVM has external pullups on MMC0 CMD and D0 pins [0]. Remove
internal pullups considering:
- Internal pullups are not required, without internal pullups, RDAT and
  RCMD values of 47K are within spec
- having both pullups (stronger pull) results in unnecessary power
  consumption

[0] https://www.ti.com/lit/zip/SPRCAL6

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index 84a0cfaaf196a..964387eb51788 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -253,9 +253,9 @@ AM62LX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D8) I2C2_SDA */
 
 	mmc0_pins_default: mmc0-default-pins {
 		pinctrl-single,pins = <
-			AM62LX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (D2) MMC0_CMD */
+			AM62LX_IOPAD(0x0214, PIN_INPUT, 0) /* (D2) MMC0_CMD */
 			AM62LX_IOPAD(0x020c, PIN_OUTPUT, 0) /* (B2) MMC0_CLK */
-			AM62LX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (D3) MMC0_DAT0 */
+			AM62LX_IOPAD(0x0208, PIN_INPUT, 0) /* (D3) MMC0_DAT0 */
 			AM62LX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (D4) MMC0_DAT1 */
 			AM62LX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (C1) MMC0_DAT2 */
 			AM62LX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (C2) MMC0_DAT3 */
-- 
2.54.0


