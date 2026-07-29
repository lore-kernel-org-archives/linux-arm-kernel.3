Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C67C54FD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vXAHMHhsz+xJ9PiU7JhB4nn6iXA5FaNsBQ9lyUDYgc=; b=YXv951L4/TkVUc8fFayjWREZPW
	nbE8DjfD+lPDgjQJTKrY5FFJli7WwVMnn2P8kAxLROERh4syEEd2hJtsn59MH0L3X/M3G4xUTE+Hp
	qCVzE2D5hTDnVqDiWV0qgjVXUbFB88FAHyjxcVpYeINUoDcQUfPU39eyvpXMkO2fZy2hTofFnQ7r/
	pOuUMrSuoHx25Tg1P8n+yP9tiEnk+QZIs7fjDQi4XhRr8rpRHWdaeoKTEVZ0hWNFBVt/Xp7FpS0Um
	qSUUoEmlvi8WrF0EwFSC1YHuGmbu4iqvQWMc93NmxjLnX7CpRj93zG3OGhDj6mA/bbXDIil2AinFt
	fnF34uFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpASB-00000008v95-2KyA;
	Wed, 29 Jul 2026 20:00:35 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAS2-00000008v5N-2z4R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:00:28 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TJ5xuw3536769;
	Wed, 29 Jul 2026 15:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7vXAHMHhsz+xJ9PiU7JhB4nn6iXA5FaNsBQ9lyUDY
	gc=; b=Y1YTW8bDBZXgxlddf7/vzOzLRgg2m4Et6e6hiH8YKVTdhRnyQ3QVvzzH2
	TqLkkQBZ/f3xvExjkQPZhpyKEP4qUR+UAe5uiI7pqCUZ06EQRllIR0EeTJT0dYsx
	XtirFUneKG2NL6cGEm/4s2thbbwMsy3XOJ0dw54yt4iLHZ97F4NFR+NOj27S/dHl
	tH5oE6pfHypO8HfVct7w9vaj82XUyi4KosiLMizJaN7/qnDSGLf5akldxz2kbZyX
	gyj4+XD/08z1tcHoF9/wp7faEehtLkfUVft9WIfAYLMmQBxwXtgOdv9tla4UHAkk
	25YkwfOyMPyfUvUu82o7cwV5dkWyw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fqqcmraqw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 15:00:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKrnbB8/ZH0csGcaJIJRUR5yZ4jAsGxw+BHnNuOPn6JxBStqvlPUxgdW5aDKoCsuJSxyPmJib+iwGdlOaZcECCH+KcWGo0L6wacDCcH3oHkBwIQdhuZiWWXYRV4U12ZHQTDsIsf01kIh6yfR0X7zO3+u+jVe2Nm/b1D8rqMWH7IMKuWtyh6cva/T6RwALR8xqvT/LmSv0eXs3FylEgwyPwalcMe/i/p+YF/FTOIApQe6DcGlaOGjRU+tFTN+dP7vRdQsSyLUzwBQiTz6C3VfSFT013yqbsHq7EPyNWuMu7DO3vdAYA0LpY+wMjJDcqBDvPHX5CZ64zjL2L9l94P2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vXAHMHhsz+xJ9PiU7JhB4nn6iXA5FaNsBQ9lyUDYgc=;
 b=gDx5edECfqN5el3Iu/54z1rDHbsMHf8WmopLA/EsS+D2H+2kGxBzN48RYc5mTcqAfv1Oct5Oa3soB2JxDmjl1vsVSnCgruHCUf3Ah2K8eSWchwN7I5dMtENDqbll56KUury4V5Qir3bWe4Ai/Yj4mRuFpP1ZbnZ5ULYZE28lm+i0LXFNv+TAM6Yg0NCl0FJlKctOzWmb+p/VbCzmz9EMvDIWisoqkpSANTJvdiNjbNQ1Bdy7OvUEti5T/GI9t7ANub2cZ0bdQ/7ZucSzjDYN/BbY+KqjJMkbCfkDqYUl2gaInUClZCfW+bR8EXgBxfZ229rYYhJEJqap4KJYQZHwQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vXAHMHhsz+xJ9PiU7JhB4nn6iXA5FaNsBQ9lyUDYgc=;
 b=XXN/79qwsVT64lv5UwzDmXWWcrsZQuomA7S9R6RMAPDCoF2U+3g5ZqTouxgJm/cP30gVSe/G/3QLYAftrb8xSPKuQ57QJFhSZRxtH9IyHmFdtGSFewPMSu9hb61wrWyWSWwU3tye774jJqIIUzM/4ZzsgfQ/PthwYkPJKlWvbqg=
Received: from BLAPR05CA0011.namprd05.prod.outlook.com (2603:10b6:208:36e::26)
 by BN0PR10MB5031.namprd10.prod.outlook.com (2603:10b6:408:117::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 20:00:21 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:36e:cafe::4e) by BLAPR05CA0011.outlook.office365.com
 (2603:10b6:208:36e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8 via Frontend Transport; Wed, 29
 Jul 2026 20:00:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 29 Jul 2026 20:00:20 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:59 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 14:59:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 14:59:58 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TJxwfu1923570;
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
Subject: [PATCH 3/8] arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT
Date: Wed, 29 Jul 2026 14:59:53 -0500
Message-ID: <20260729195958.671147-4-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729195958.671147-1-jm@ti.com>
References: <20260729195958.671147-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|BN0PR10MB5031:EE_
X-MS-Office365-Filtering-Correlation-Id: f6bfcde0-d5e6-4247-29dd-08deedac04b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|56012099006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 7exL6UoYvALpMk8FdvkBqwGLfJVDGV/5Q1X6gq2eRalVc2HNEHL2syRSFEybJIaH7OSLHzoFPEDApm8QNd7/Zq1o8eSrtFRsfnA6YIBy5RdaSDM+vMFijIMRBXUr+G7cz1+W9+tOKtN9xeNUmjseHcwQ2RdmulWzFh2eZL0NxWy1H4RHuluPZOCaM/YPNGfnXNzdO62YdgsAacQzLs3C5HeBe6yjG7Yo6I6DfF4iflHjHga0gqN6l2Sy25K/EpLQVgVD1b3Kx2T1AfQGUXwuTDtKbChzY0gg0VbB2GrMOMJ9NZrIFjkqm1XA7glaqr7ocOCfUMk/yDO+L0BFXoJUJou5QU6GlOYkXaDB2sQHVApKswwPuxL1DN6ScPCQQ7YjygtLNkDfTya5iCy/5tbxMiH1mAIoi0Q2OfYKouRs5L6oh3y5jPaPPtNkKFjt47PAhgAxmEr3uoCtSH+Ex0CzpaTpxq3xbtOl7ndoCFGrMzePOu3eNaFhMHdH2Ztx++sb/TeuA5P9HgGNQLlxDNIHQNMQqYMyAZx6L7vLxKP+1c22kYchoLaXaVDCQWXziEL5gTeF81rvMoHI/p8sAsX90YWw18pB2SRjvTT3t/5b6v21BuyDV2naJeQE6o6Wr4xJlUZsWnvpceyNmzSD7pcDkgNfcdo4b7YKHmc7duMxq6S2P17WZCXKDDVh+8zS2pz7zS0yI0ly+E3khvhftESB3w==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(56012099006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fNIuEvRm5J8dZWSqeE7Ks3gxn9B4NwnDqayPuYZa6hLPIJrA1PEpXHAGw4dJ4ANMx/kHVAgHBGMjk6ZLbuhuwGdS5V6FBwUkb/1rRQZ8gpQXKDqo2BqEM0WCKo5fXx1zNXw/fk01DRkbQmUCcuT3UbC9bgxDGPinGjsMU+vtvBYcR0LvCrGuc/qs98t2SzGE2/qlhgrOyQCjvAdugQ8rTy81t1KTYr5ZXRWbNtgM+tH2YbPrijxyBuS0XL8xwDjmP4IKt0L1YV7lAvgLYY3HTJfywFU8kF8iWGuMEzGOmx9/jc7GNFmJvfKR4zmbefER6Let8nrNXMz6MsHQin7d4d875F/ECE9kwX8KRpTkX4IsH88BB7do8z91fCr5paG8DquSvDSZqir0FqVzbE1nOGRX58rbd8jSuZA/j00IZG75FD42Nmd4hOoRHIAiIMbI
X-Exchange-RoutingPolicyChecked: O6+/e0UvkQBCvifUAAbPpGj9I89sqHp5LHKiELo8IG2wQN3Q/nmLgrN8vao2qQ6XDwHJgGOO/XQLBZwP5/omO8C62cfWugzfm55fBa/KdtFwvqcwqhfYJiv1ByKa8w5BlUkJZvdmAi7J55z9hnZysdHTNIA/F0SNGfDGRSNTGUte/83lFCY7K64xWE+Pb01jpUiUQZb5lsYifLyjoWGQ7C6u7aCa4yIstHCkk4WNrcIiVYdkAJ5JEZFxjw5FRBV+wkrrVAZSBDHubwCA7gjfIYK3jpX/OEXJVHuA1nw8uglQ5PXN8BnMoy7iVtGguPNv6dM/ePFDXKNVrHTrbg8ZLQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 20:00:20.0798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bfcde0-d5e6-4247-29dd-08deedac04b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5031
X-Proofpoint-ORIG-GUID: epC9VVqw0YborjEoKlZSLmfonhlyxzXo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX8dACDpEFs5Sh
 RDzlEjd8JCRS2ReUtOJ6VNS4ywfs93WtOYOzkvz7P3vNXVKWL2JIZLKlHl9yLfByd0C1kCuyWcJ
 Q75FC7lb5FM6LsKkLZnAGl9mLcJ49dA=
X-Authority-Analysis: v=2.4 cv=UtZT8ewB c=1 sm=1 tr=0 ts=6a6a5bd8 cx=c_pps
 a=qH/fS2hzlQnCJHG7LpbWtA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=ea4yy_Dv9dZP40v1UOYA:9
X-Proofpoint-GUID: epC9VVqw0YborjEoKlZSLmfonhlyxzXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE1MyBTYWx0ZWRfX0TLV0PzcN/ff
 gOZvhxtBUG/Yb3DK3+kujr/Rwb9Sv6P9juJf9RUws665I2sffVYyqMMjDP2TRunEQFWnTQhG4Bs
 lfTXCi1ESq55apremzARILmH1i+yNUQMYJyPAtY4TetkVf+JetTkFR9WMNdkaA2vmevg4EU+jrZ
 q4Gy9C68Irp5QekCEDSatKHJa8LnkGxohaqMMeoWj6FPLGlMNnGbmQB5PHjXvjnbLIhr3/bVLLL
 Fm+LvwGTvHjNDmwLDrAH2qb9LQkrCKPYI+EEPbvZl7M2aCBPyrKs//K8frrUj6MLnigwDG5ry0N
 pOsZB6RqYDtqJSIFgXQmPk91mtyGm+QANBJSByuBH5RZpe7Ulx7vPV6GROqx0UhG0FXZNPeG2Fr
 44kwp0V7ScveX6/IHHhsgt50mW/sQb4e2OZOMePdaKCKujSp/HglkeETnxio9VGoBP7XfP9BEvi
 0Ke7Jka6rj2lduJSetw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1011 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_130026_889266_C59D1424 
X-CRM114-Status: GOOD (  12.04  )
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

MMC clock pins must be configured as OUTPUT-only per TRM [0] with
receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
PIN_INPUT to PIN_OUTPUT to match documentation.

[0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts         | 2 +-
 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts | 2 +-
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts   | 6 +++---
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi   | 2 +-
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
index dfd65c00f5b95..7fd508f4eddf1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts
@@ -86,7 +86,7 @@ main_mmc0_pins_default: main-mmc0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (V3) MMC0_CMD */
-			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (Y1) MMC0_CLK */
+			AM62X_IOPAD(0x218, PIN_OUTPUT, 0) /* (Y1) MMC0_CLK */
 			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (V2) MMC0_DAT0 */
 			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (V1) MMC0_DAT1 */
 			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (W2) MMC0_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
index 7a4cffc27bda3..1c691629d4ad0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts
@@ -235,7 +235,7 @@ AM62X_IOPAD(0x0020, PIN_OUTPUT, 3) /* (J25) OSPI0_D5.UART6_TXD */
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21/C18) MMC1_CMD */
-			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22/A20) MMC1_CLK */
+			AM62X_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22/A20) MMC1_CLK */
 			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22/A19) MMC1_DAT0 */
 			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21/B19) MMC1_DAT1 */
 			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21/B20) MMC1_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index c468b9c5fc09a..898e4ca3fd87e 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -323,7 +323,7 @@ emmc_pins_default: emmc-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x0220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62X_IOPAD(0x0218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62X_IOPAD(0x0218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62X_IOPAD(0x0214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62X_IOPAD(0x0210, PIN_INPUT, 0) /* (AA1) MMC0_DAT1 */
 			AM62X_IOPAD(0x020c, PIN_INPUT, 0) /* (AA3) MMC0_DAT2 */
@@ -346,7 +346,7 @@ sd_pins_default: sd-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x023c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
-			AM62X_IOPAD(0x0234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
+			AM62X_IOPAD(0x0234, PIN_OUTPUT, 0) /* (B22) MMC1_CLK */
 			AM62X_IOPAD(0x0230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
 			AM62X_IOPAD(0x022c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
 			AM62X_IOPAD(0x0228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
@@ -358,7 +358,7 @@ AM62X_IOPAD(0x0240, PIN_INPUT, 7) /* (D17) MMC1_SDCD.GPIO1_48 */
 	wifi_pins_default: wifi-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x0120, PIN_INPUT, 0) /* (C24) MMC2_CMD */
-			AM62X_IOPAD(0x0118, PIN_INPUT, 0) /* (D25) MMC2_CLK */
+			AM62X_IOPAD(0x0118, PIN_OUTPUT, 0) /* (D25) MMC2_CLK */
 			AM62X_IOPAD(0x0114, PIN_INPUT, 0) /* (B24) MMC2_DAT0 */
 			AM62X_IOPAD(0x0110, PIN_INPUT, 0) /* (C25) MMC2_DAT1 */
 			AM62X_IOPAD(0x010c, PIN_INPUT, 0) /* (E23) MMC2_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
index 9c83626826453..085b067d96fbb 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi
@@ -98,7 +98,7 @@ main_mmc0_pins_default: main-mmc0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62X_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62X_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62X_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index ab9e58c2d225e..d2f41e2ed6239 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -194,7 +194,7 @@ main_mmc1_pins_default: main-mmc1-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21/C18) MMC1_CMD */
-			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22/A20) MMC1_CLK */
+			AM62X_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22/A20) MMC1_CLK */
 			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22/A19) MMC1_DAT0 */
 			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21/B19) MMC1_DAT1 */
 			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21/B20) MMC1_DAT2 */
-- 
2.54.0


