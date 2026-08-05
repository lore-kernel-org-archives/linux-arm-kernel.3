Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401C1C56202
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DK7+928hD2uZvAZ+zrM3CinM4qebpJpSZEkSfPPkvro=; b=IXVIf6WZY2BV8NMzHk6ghC2Qjf
	B65gY96zWgPunKYnq00VsdDibsUlGucn4yj3Eby1zLNAlEVye4ELMGWy5UqAxBup0K9NMgf4pBMe/
	E4ZvLVGcaPeGjhHUaxX2nLP8Og/7XUWf86TWdfb7v2+zd/hxWE9Pqyh21AIEceyQr44u+nWgRaCRq
	Wd6gWcf5ed7k/DVS6c6Ild6ABRjuMKjX2GE/Ekqpk9ZwpaCDt6t7I5GzAquk49etbbaJUrQhciJOB
	q5ClM00KvZLwcTLBfYE4M2V/HJYabFwKfS4alwDzMHRG5dp/vCy7/mNVSfZomCsFT+9+969OlDdZN
	RWTnqGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPoC-000000030vm-2mnp;
	Wed, 05 Aug 2026 00:48:36 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPo9-000000030tP-2P5t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 00:48:35 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 674NFQNp732610;
	Tue, 4 Aug 2026 19:48:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DK7+928hD2uZvAZ+zrM3CinM4qebpJpSZEkSfPPkv
	ro=; b=HiZWkpnEAGHWJgM8oZ1SNM6FhKVhdQ0bDQE9gEO9acb91Bd9u53VF4udQ
	dTowXmOX+wWnBvy7i6N15kU5gh1VkQVVqCJPAeJaPZb/8QURd5X7TNRYz7CtveBu
	WOkvqd/OsaKbbNzV8KyqnvTk8KxmFV+Rs5QQR+/zSeApI6K1ZFcPHU7YLyznhXt4
	aHgQ7FBnfbCBBqsn6kqUVfGvhl06Re6oKVPE4lA1gucBMgMdZI3hMkLc1AdiNYmw
	VO1SZslB0C5cfuCY7Ul3vDRlpBhsvPFIb1KnkecbRN8uJPcZGXM0TBUpzcbliqg8
	/qSrlwBut4ps3XMePseciHc/x1UaQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010065.outbound.protection.outlook.com [52.101.85.65])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fubus789k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 19:48:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v12KBRHwSeobCLWxmKlIZqDX0z6ZN5uZdp9+VHR6Zj+FGZmXtDMzzNSWeP0Xj8ip+WA/saOVQHx5plXVaKYRM7sguZtUdVfwqxem7cT6vjxTvZAGdZcDcOFN6juoxUxKuciDdBYMehKR5Xbi1O9ZdKmRMA2idwruEVzRo8UPdAxNfyBFkaMvjSeA6jjumzDWu/zJOEIAm0aYLC5PX5fosR4mPvkUaA78/Wpjl025Ykkl0AJQfeojeR1uUnMILc1s8+02K8iL6YZuEYpZadc/xi1R0PhXQYi1iucNnaHYF3Uxin64yGVvJ7mCdHRplDK/+7s+XMiNUgW9SYLVPtC9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DK7+928hD2uZvAZ+zrM3CinM4qebpJpSZEkSfPPkvro=;
 b=LZyMCQPZcHaAXdX4wLNGNwXrD2EipXdZXbgfq0j/dtfsFA7SPA4AvmbbaBb9FrVLYt3ae7sbsc9bziaj0s0dC+/FXBY2VR/tWISwC2LZrhZPzyZ+u0PdRv0HnSzcuhdNaNnUQDE9dRvE/poAY0aiWoYmcTGacKGcREGgBnbiwwUaYGfvRyWVMYoe3oBDtlx5CezFUyUDY/rGuvsqiNUaAkmm8SfpuU2xTJ7ZJU+CLySWe0ovxUNSS3UGbBp+EepaDqXkZHT4KnDvlacKCJ/9gMK6yiwyL09bYdCWOwFRtUApSrHHjJMCnaAC/+j6gK7MpDosTcQKVpo3btkvXbm+5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DK7+928hD2uZvAZ+zrM3CinM4qebpJpSZEkSfPPkvro=;
 b=L7LsLNFJj1j1NjW2Os5XLeFqyhKrYfSJqtpXIZaeXdLoFUOkZ8u6nuRnNrFJ4GhXC7okcucXH35tA6vRK6j3Svh4njMniGPG9O0iOleFaKhLPNwGAdOtAZy5lN0hkNiPl01rqO9SE8r9wnjJp+kdL8R6HKO0EwZ5dz8SmRSr4Mo=
Received: from CH0PR03CA0408.namprd03.prod.outlook.com (2603:10b6:610:11b::9)
 by SA1PR10MB7855.namprd10.prod.outlook.com (2603:10b6:806:3a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 00:48:28 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::69) by CH0PR03CA0408.outlook.office365.com
 (2603:10b6:610:11b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 00:48:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 00:48:27 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 19:48:22 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 19:48:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 19:48:22 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6750mLQ71184200;
	Tue, 4 Aug 2026 19:48:22 -0500
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
Subject: [PATCH v2 3/4] arm64: dts: ti: k3-am62a: Set MMC clock pins as OUTPUT
Date: Tue, 4 Aug 2026 19:48:20 -0500
Message-ID: <20260805004821.416613-4-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260805004821.416613-1-jm@ti.com>
References: <20260805004821.416613-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|SA1PR10MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: e070f67d-d025-4ce1-9ffc-08def28b4376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|56012099006|10067099003|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: BUOG6q9+cfyeesJ3t1fYSGVYw68J4RbYYlJM4fPfmfsJhuH393QgpnToSQuwHTG8M2f2yumZAHB+jOKLLH0SzJHKTU0+ktoy6NDLFYcAFsMX4Wcrv2yQovyVvhgLuas/ba0HpxNllf9/yeyhup9J/QBsxr0yBcGktflHs910jfoMLBlIQDo0em23bvcS2RaGndQhq1rPUKGK5dnzoEPCrxJ9OM22JSxgkD4Di4ZR4WwNbFC67WR5V1DNWt1TwRyDSvxMeqV5NnU+XPdXG+7eQjrJ2ETiRlrVZDfoDMIEAz4oCNeEHtSb5ifw21sRXLreLy+1oMFHTXD8AEg3ykvMBKOJSixKhkdRojaSBTZIKLqheXvhfUnnY42UA5p0Z9DIxkhnjzItp5OG9ulaNaYeP/i/EnGBfnSAyqY2TfwXIvMwUhddPXiA0u4JpihDreC4SLnA64CbJnLgMpEaXfUlavM+N1a/F55bi/qezhDBxGB/sxGlWyQyxTVSd8vQ8nwvg27/EKuQkl7dL8JVKY2awOqw9GYzKVT4kxfLRZAtvjV2a7W5edVaVP2TFaE7wlH9V3b3027M8aZOH5pa4K6rAXlmv1yS9mm4SFMkWizTumQ2Aplqa3LtjFcItor3zQqr/etOcoc0EgAPAZaEBB2//uwArgdZWPZC6RTsC2g32vfs2xild9gfuB0AzpWnFc7310Fcd/kgZTjvvUmCIlRObw==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iDbQFNzXPNBm7TR8vfXxOVvRuKz68xg5q2v0WZzSMJDS84Ocs+nhZlmYzvTmhRNW2cdPL99PN9FVR1UC0MRZNlutoUH1KtmTZfJrOU4PlHIJd/9QtzoASyMJowpE8PUxy19KwrKpZkqW3Zr5J0EISraWQgHU3fNMFfVaF11mrWyX9DOmptGnDUb/uIcE3hZkbW6Xkss1DdT1zswSAF0VnlOQzVGC1Fj3vR36OrkQYCZdWZQhwdOLthA7n3hZa0Sjjmxnv4LGMqzKs1gDAuM1CMQ9UcHOo1uPWhPoyzMd/Y0ia+KB9LDsdG7aHxsdF5cuFzc9dD37TaK42fxeGB27rQS29AE52zlnAUEjcL6h8l+qPUnUr8M0Xy9ilzo4pUkjTv6eNuNndsGKoAijVhzwjEvJ49SjtQD8ETs7BsYHFeGTm0kGBlJHr3kGPedBJtsv
X-Exchange-RoutingPolicyChecked: JZ9SjGMtRPK3wsrFCFDnweJd0l3UdPHY1Is5k2IYIiQMi+XhmC2HeldWeunjSNLueCMBK+z41AoGLcAEuzTe8T+znliF1JLwNQ5ZUuLTdH5d61GSPmT1e1/deIg+Grf8bwij8iVjhb8Yy7TTstHGtei/ov7aniDs3XGSu3QLjLtBVCmvbX4wkAEtHSA/DeWsODSNRdaKt1d4w+N4ZeL50igYynqn1fwzyp0W1IoqK4iJoGlUmlMRcWwEHnFaYyJLHmwWEB0bY1F00FgvF6V7tzyglovQUwRPT3mul0ZeoNNOryi313KXhIviOKABJdUVDRis8Q13yuIXxeyhTpJ7Hw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 00:48:27.8384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e070f67d-d025-4ce1-9ffc-08def28b4376
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7855
X-Authority-Analysis: v=2.4 cv=RaagzVtv c=1 sm=1 tr=0 ts=6a728860 cx=c_pps
 a=ZfP+Ya0swgQO+W9lSFUZ5g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=7hcFKwaUi2NZJbDi7I8A:9
X-Proofpoint-ORIG-GUID: gVN9tuGnJRLx7OnxtyroS92QPDdvofs8
X-Proofpoint-GUID: gVN9tuGnJRLx7OnxtyroS92QPDdvofs8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAwMyBTYWx0ZWRfX3gmKEa5b38KG
 tMrkpe9YWLMq0p0a6yN6lqvSkeVgSzfgCwIp+ewhDm7ZxyLLMkqIJSc25Ur5bRM8qbEPuc+1NSk
 xqPELVwnfOqW4mZsHodhxkwdl5WhhSFiI7cdogAde1gfCNcZCtVDLOU1NNplREKO2ptxLY9Qk8F
 jJnddLANKWMGUu1uJ9I8tSG24UMEfrf/dPgaV3TSiZUxUso1OMYKXr7/HCaHJodJnHW/UzlTixw
 jVFcadSvNhhi/73yjP4ko/I2iikADOxncXpEK2eYtbjokBRTAyqUerjQ4Mf/cmTnXHHuToWps2h
 iOSoklHuhnDMjBI7L0Tu1O7POlBBPy2NeGWjXHWAf5BiNyXysYDcQTPLHB1MZK+pKt2HoeHpROw
 Q7B76vqtss86+3/Wibjsoq5NoWC28MgC7Ly92sbMHXbRcfWa33Fx6gs3wdNMvq7RSMq7OaQcuou
 yuJxs5CMkKZvuYXTN5Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAwMyBTYWx0ZWRfX5eyNKIFJiqh5
 aY0x0tOpBQxVoUHQziMktvqrASmU+rIJec5fPe3fWX+BIRRX+PH07uJBposULRlVqo2TXzWB6Ll
 8rph89wDiJPBsZnc2m5oRb1UdSEkzh0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_174833_658956_25350B7D 
X-CRM114-Status: GOOD (  12.03  )
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

[0] https://www.ti.com/lit/pdf/spruj16 Rev. C: Table 12-257. MMCSDi I/O Signals

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index b04636cab71c7..e63c5200a2370 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -328,7 +328,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
 	main_mmc0_pins_default: main-mmc0-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62AX_IOPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */
 			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
@@ -344,7 +344,7 @@ AM62AX_IOPAD(0x1f8, PIN_INPUT_PULLUP, 0) /* (AC2) MMC0_DAT7 */
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
-			AM62AX_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
+			AM62AX_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22) MMC1_CLK */
 			AM62AX_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
 			AM62AX_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
 			AM62AX_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
-- 
2.54.0


