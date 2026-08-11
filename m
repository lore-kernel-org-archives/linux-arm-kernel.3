Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DAAC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 06:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pNciPDEjJe143pMGtdFI7z3wG6AdI1OyapEcOtSAJZ0=; b=44CT0mtrX5M172L3q6AucolCz8
	ni7o3hAk5UR8Vv/tgb01qkj9SPCH8Cp45vtgMUp/f6SUo7KxeotqN2vbVKWB57s0XepKDLfl6IgNG
	0lcSz4UrrtXCw5XCSWBv/XqCHn07YcBPyxoe1UtIwWUsIa+Yt5uKCgv1SFePD4gMb2UMHiBSEleS0
	acSvPb7yU3tCTs0pmCH5i9vxKiOOFh+Zl3zQHZENT5rFJ2jGrg+fnehGQgfD6fdSUVuIzcJ6uBbll
	e0b0X403myZal0rrRvTAOP5wFf7CVOs5TqIpEukpzgKs6SdwMw1rVDEwT/JsTEHos7lmsTwtzHkta
	Yq/F91dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfh1-0000000DO3B-2WkP;
	Tue, 11 Aug 2026 06:10:31 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfgy-0000000DO2i-1dgo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 06:10:29 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67B5EjYn378147;
	Tue, 11 Aug 2026 01:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=pNciPDEjJe143
	pMGtdFI7z3wG6AdI1OyapEcOtSAJZ0=; b=El7PWy0W5ypqRATVVKMIEa7kxiR4J
	d1bH4AOsRYbBBZQdbva2yBuVc1dZHqSa99VqNW4RSH/QHu3gzyKVMXbksHyMDP4Y
	sePeQg+EBjApOU9C1ItkqIlp/GwzN0YH7dE0+kfl6zs9EQUxWTwmnhgsp2nKz6oc
	ffsPCgK7Aih1kZsOCLCU0NfoScsUwHkyxQVp2yu4bEPL8cSOvuBLbAgi5I216A/d
	Eh5bgcctj6unfWb1xwX355LDdvYgENEqeNUCje866CwkxN5BsbQVqa2lgOa0jFC5
	aVR73oe83aXYtotLQxyTXII9k13XePbJn2hS1UFdAYT+OH1DYi+IvderQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013040.outbound.protection.outlook.com [40.93.201.40])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt7eq5x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 01:10:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeT3ZEfPmpUw6eghxqNKOzAZMjVQKQp6ZB0+lfbz5IWtDXCkwc4v5HUZZPqv7M4b19cUhQ+gsN0xCJlPaBW6FHaAyCMG2ywTrjs8I8kazC/Tsftq1qTI5CgqDVxjPWoJlXiejea2uImQ7c9QVEuhEKSpmos7gsyl+9jqrS5vzDUE/57qmACwZTpNE54ULihKnILgbN2xz79JnE3QyuIWdJt3DMnKF9HX2SYrlAWSMjoAnOiLmylR+GKTMS4sfv7cX3eYs8hUuzxPyEXPuRbqdN6dNPxXY91Qm4FRb3HM+2mhVT7MFGy/C/K2qKm54YXJvHhd4hv7DLzRpuOfXjZA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNciPDEjJe143pMGtdFI7z3wG6AdI1OyapEcOtSAJZ0=;
 b=qmlUTTa8jsv93xFzyZq/mfpEcI2rSaYvZUdt4Tl73kv5JedMc540Cf5Az6rgn0o5TIq8QX9hIGo2oJdO7r943/kIEZJw6ZajTuMlPmdGtebv/xZmEshCK9oMnw8+jU45XdoqUL/7giQ01CrmWkCt33tYI6f4uzEo//EuBNn4Vw4xAla9dP6mJ4CDEmsy+GU6DxIXLoHy4ifQeulxDf+gjdJgJ/+9+lGHxN1H+70YALDL/uKfeKXBs4zdqLe/j/pqREMO98Li71lEvVgoOKnT+GiRyzLYkkpUAi1xOvUNLXYxxAdS/cOEyCG8G+FyKBjUVAz4/CkVK63zhEoHiBMW8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNciPDEjJe143pMGtdFI7z3wG6AdI1OyapEcOtSAJZ0=;
 b=xLUmmKRaNBzyNpdp7ylF8bEsvHxLPKZrXiNJ4UOscBwUscNf//l5revhNQpzeD9vPQf4xHbQzoFpmpzJ90uyHUUdW4U9G16NvwtJnDRKDJhUrJW/7YihCCCth2+fCZS2XfiVKeRlbcfyi3fUahDdaZFOs6wQ554gfSUvJRtm6Kw=
Received: from CH0PR13CA0012.namprd13.prod.outlook.com (2603:10b6:610:b1::17)
 by CY5PR10MB6117.namprd10.prod.outlook.com (2603:10b6:930:37::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:10:22 +0000
Received: from DS2PEPF00003441.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::22) by CH0PR13CA0012.outlook.office365.com
 (2603:10b6:610:b1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 06:10:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003441.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 06:10:22 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 01:10:21 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 01:10:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 01:10:21 -0500
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.68.110])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67B6AHI3580944;
	Tue, 11 Aug 2026 01:10:18 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH 0/4] Add ethernet aliases for TI K3 Boards
Date: Tue, 11 Aug 2026 11:43:39 +0530
Message-ID: <20260811061351.2538688-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|CY5PR10MB6117:EE_
X-MS-Office365-Filtering-Correlation-Id: 7efcde1c-6206-4417-e371-08def76f3a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|18002099003|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 4r1awKmpuQ0cJwXfSsWV2Pix7UB4TEgrnTt7UtkrF6wd8cfti2SYpQeP2nmOEcIwTKQJXNmyYlEIEFyCvt9eMnitQ9FFTkLl3oPjvzc2irSy7JxC5RBAx9EurK/MUuEKVNq+R/tgspkAn38ZrxRPwn3utFhasFUuUwnvOKZeJDRKMYw6lq6fQLMGQB+0twPhYYVSqirKTLLX/37ByeUNUJBdGA0rX6InPU7x/L2b5EEz0zPp2WxePDtLGuo9Atle/CN5gT6/8isrUoasLfl5kGFQByIdan7K4bA0l8a5u3n1x98d07n56B5YnRpfL1ljiRPhtAGyuILVOBATRAGSgOLS/Zc6K+4OEPsPm121+2bSHuDUNK6dzkdqqKa5YC+49SPJhrUkQf/yHe9/n0DBXWJe6hbOVWYzWa714R8AuRZEJ9pwyi7HTh7E9WtSWtlSKOiJ1OXq2d1wtGUnKcWk6tGGQesSgQgMVzZUKSwaDosNItQMeWEXSLkV5OZTiLbkb+Ee81eLFnI1p8iVEXj6O2t8IHdX/hq2xTZf5434DIvCUi3kkzYfe0VnAPtt+39TC5hNppf8AL32aYAitnx5m9JNm7vxeRAXAiR94TAcVQphr6BTSEL6U0iT5tX+bW2E2LsR/7RC+VN+ERGN+Y4z1HxfBya/Di3Rw6/hNedhFE3n43SdUyrMKh5zg4dpkCuigRGWsxmaBbarxwHnyyqBhg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: reXW90+IswvC1xZ6xr+UEsDI5fxDLFsgQ7ITTjCR7X4RZVR3gbEoxf2HzdiLI7FZUielPmNxkR+a3kq4eCui/mfIQp7Icd2TxRcz0v0uBcqJ1vyJBP4ygfzUPghoRZlqHq051xD2xIB4AmYTIom82Pg7NshHPc5aHLI/BuQx5LZAAsCoLYxjz4i3xM44KHPFcqoKH+nh3R5RG50XWhXJzFukUj/m7RR8t3dcPEkqurVcFhngcuvMPPydOOQwMgXzlREKrjZ0WLmchieFPEuwQeiU5GJumw8iqepg4PO5a6gvi1ZqKX9oouC/ZZFkWf//soayN+NuBCCARCni7ag7NptM4bPJ76csDRMbGOYc7khllAb/Uu2xCt/DOPRtXbcsOrAajkd3aURnA0Kbsfaw6BH3m1QgkqMf1zd4+nGxSu2jGSkZqLwVpwaIYf78hMAS
X-Exchange-RoutingPolicyChecked: kZXSkR/J1qXcAlwsSxOC8fxNlBkVKGY9L9H3nKF5sC/GcCPWCcDOQh9yMub+QRW4iz5iXTft4s2UGLXK3DNUCasdwixVorMX0QEfWbKWVYaRDxcKd4pK8M6unD+xvaXiO2+xp3z8VVaN4omyGVvf5c2YOyOWEabc5DYtgMyfPLgVpZi9ykYj2Ox0bygPWJWhPOk+m08EL/sN6J/ewRQ4wNun4Rs5hv84P/+tAetKgK5m2vtB7QiiuQfIDurbDaTSa2r9UbPcyAmbnYy1+ju6VjzD3630TKjWRhyR4vzaaWdvG1Exz7Ind9ZjrhiPVJcHTH1jpfeuoQTnCtlAlexCKQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 06:10:22.1031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7efcde1c-6206-4417-e371-08def76f3a23
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6117
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA1MCBTYWx0ZWRfX1cutH+xzVlsZ
 8Fe0qVLszkM72+uxCuU+AUMlaC2cwcyhPC9i8njaCR7fpNmQHp/nJyJclRNdtuA0/5Fnw/9k7Ts
 LVqjbtpvFzlO+Qm5YmRaCVjAFQp275Clcr+iChxVmI4IskrO3NXtUXmgN8wbfzuhQqRxJGLu261
 kpc4zYUdT6Rl/ZvXyRlUXuEYGCITP+glK5du14qIW5Z+qF/2sBHxwnUsU5WYhc5+aDXzVq7cUqJ
 6yMaMRJyEhyIH6jBzYgFshVNELlDN9L8MJRdP/NPC7Q85yO+qWbbX00Na8r7xhv7t3E3JvnTFGj
 +cSwT+LnX0RJ0mNb2KLW+7d9ml/7ldeKi5lLHwcjPgm6KPn+JYgOGTPQyL9+h6W3FWrzf/OO6Gd
 U8w0KqgC3aB/YCwAsv/NQutDmLTQd4LiMbYR/ktJfe2D0pJqMPGZgfWVqaV53VZmvDm0j9ZKYmk
 gVv2aCiSoQQ3I39+h4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA1MCBTYWx0ZWRfX4EURFw0BWF1P
 J14oInvq5OQCfKfHhcc9msufwnc/09rNwMhQ5nJYSFxB0oJSOLN3tCLJo5WV0SNhkL7csgrVEIu
 6MkVdlMinZVNhpBe1c/nOVYQhDTYU7E=
X-Proofpoint-GUID: vK53j4LdWCWJz1JCkXYLkG3s-9rhemCj
X-Proofpoint-ORIG-GUID: vK53j4LdWCWJz1JCkXYLkG3s-9rhemCj
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a7abcd1 cx=c_pps
 a=5XLVA79qUcMA6Bnn+7FYtQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=CbXlOM-xGQpJbqXLUlIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_231028_509597_07DD26CC 
X-CRM114-Status: GOOD (  10.86  )
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

Hello,

This series adds the aliases for Ethernet on various Texas Instruments
K3 boards, keeping them on-par with other K3 boards which already have
the aliases for Ethernet.

Series is based on linux-next tagged next-20260810.

Although the merge window is closed at the moment for TI K3 DTS, I am
posting this series to get initial feedback and prepare it for the next
merge window.

Regards,
Siddharth.

Siddharth Vadapalli (4):
  arm64: dts: ti: k3-am62a7-sk: Add ethernet alias
  arm64: dts: ti: k3-j7200-common-proc-board: Add ethernet alias
  arm64: dts: ti: k3-j721s2-common-proc-board: Add ethernet alias
  arm64: dts: ti: k3-j722s-evm: Add ethernet alias

 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts                | 1 +
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts  | 1 +
 arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts | 1 +
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts                | 1 +
 4 files changed, 4 insertions(+)

-- 
2.51.1


