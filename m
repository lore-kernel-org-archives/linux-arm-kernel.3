Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C51C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YN+whNfFVHAN1yVorBnwM+rzd10hocZvoH52VNbIpYI=; b=WCP99kUaC+xi4VhMiPCwLWtTJ6
	QbUzHFzqWWKP4kUtJRKp931ARQ8okRd3I0YEEfZ0xXmoRqqKujk+XGCvnQe/qOJ60JM3wkxC0AO1f
	ryvdeUEqwXzV+jQqxQD9CrJ1qh51lx7N2K0QR8nTW/S+lgfXgpFrfp4XNX4Y+Oa1Exz2WhmLKgB1i
	Mg8bFzeoHJUXw6ciW3oKN38zDeQf72oIvXC8fPsGXDGGDCjy3Yy5OZ5S9VbPzq493RZurixbI/OmR
	p4FVf/TvLlFaWmOcqx73FX/7ITpQb/nDkoTVSQUNmaOCXIUE4KqYUReUYSZoCUjDmxYvO/FT/QhKF
	IBjHgRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyt-0000000CrCO-0VlF;
	Mon, 10 Aug 2026 20:52:23 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyn-0000000Cr7q-3dmv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:52:22 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AJjSX23510671;
	Mon, 10 Aug 2026 15:52:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=YN+whNfFVHAN1yVorBnwM+rzd10hocZvoH52VNbIp
	YI=; b=igmh0uvBKT4AbkgEZzZwBfrFye2bw3a4+gjNOavE9kp7XsI/KINT01VpO
	IY2zvQeglMT9TsnxVIraxJ2L3UvkLHZANb/x0iyD7fo2lpqIiFt9wg/dqWe/sUE8
	BCVqonRZmtNX3FXAhpfYUB4J2eQ9jAhdl9MJ2ILl47fWxZjY3SZC85PPhqUaaZI3
	nE1d1G5VK9uZbTwk3zjt30cz4x2kgVAAjKg3VcDDVXJvAja2KHggBV9JqF9bGpPF
	k84Bb4Iyh75Q8/QRcaktf9ImX1GxjFwIJhK7WYtbqrcANG2HamZ2WhazfzyGzn1s
	TQbTJIdchmb0+v4vWCUKPfAT2S7YQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013004.outbound.protection.outlook.com [40.93.201.4])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fydkmv1ta-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 15:52:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDdCDZxPX92GLPPIUinz7/E3eFoy4mFLr+H/24O3Qe0MVyCgGpzIUGpdxdQ8Yr2oeJ8ODectgVBSjgUdz5aO1O7Pvfk7n7ev+hS5TnVgaqSxggWLcFklyPwUegciHjE/a4za0xIOHUfSD4PdQE5lKVr5Myn3//HL5gJ0APSEysLo0SiCOexikYOub274++UhHF6GnIMVuLuJ65IwVyEOFqNEgZVewn9VE/U0/knEoXHIzOpFDkFtLo0S0ztaQbPtcJsepvl/oJSfzCDkZKUihUAd4jh69ZTluig436gWurRaHKb1ER3epu3tySMoikkcoqf79BXiIXEpNwRwnSz6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YN+whNfFVHAN1yVorBnwM+rzd10hocZvoH52VNbIpYI=;
 b=cA+jlfbNUFBRTUvNYC2ZtblS6Ws/sv/PeicMvzDJrjKrk/kM0fFMmlPxT5lm1zCBrIMs9FYK0TFS6eip8HkBsVBT74iMR4BNvjO/STXgRYcxfUO7j4qRHVPJg6TJ7p2NtqDFymj9qL7eMf1P11h/AkP8LWNoO4PdTz/Njk0DLiVTJML6AYPAoACJEskXQtaeI+SJ/4+nh/ZKoRy9J9G4OrEJ1+7xZxrYr4k1NR9FbgNgQ3dr/y+rBbkzpWTKgB8kxivhhJz1Gau+I1S6B6VndZX7yyyNQtRJAx6Vj0tQhddmT1tkD2gXZ1kYtJw+T11t/bpAeUc7/1gVqo2lWktP4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YN+whNfFVHAN1yVorBnwM+rzd10hocZvoH52VNbIpYI=;
 b=QbtfMK25kzVvTm9EYXpfifk441cFodomFpPwM1xw0htGv8bMcfoKs12a31J8bwz+vps2jkt/5JaduL29gOkZ2+DF1h+qhUSZbc9bNS8PHwj49LSnpFOtEfeyrGjZswqPGT4FM2ns0Rk7TWkbavL+Fy/AtfO+pMc8V3Qy0ZzfVjw=
Received: from BN9PR03CA0694.namprd03.prod.outlook.com (2603:10b6:408:ef::9)
 by CY8PR10MB6538.namprd10.prod.outlook.com (2603:10b6:930:5a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 20:52:10 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:408:ef:cafe::81) by BN9PR03CA0694.outlook.office365.com
 (2603:10b6:408:ef::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 20:52:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 20:52:10 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:10 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 15:52:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 15:52:09 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AKq8Se3838072;
	Mon, 10 Aug 2026 15:52:09 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <afd@ti.com>, <b-brnich@ti.com>
Subject: [PATCH v2 1/6] arm64: dts: ti: k3-j721s2-main: Add mmio-sram node to main_navss
Date: Mon, 10 Aug 2026 15:52:01 -0500
Message-ID: <20260810205206.685971-2-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810205206.685971-1-b-brnich@ti.com>
References: <20260810205206.685971-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|CY8PR10MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: fb783216-0f76-4b62-21ce-08def7213f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|56012099006|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SSmv8/NRRKULToPskm5BVpGJILKJb5iC8vb+imAL43OiUwkEYOy2JwXjs2Wi1Mqkmg20OKUrXqxauKsjEUF40db0h2a3wo/tbIFr2dDqhIEB6iFWAP8JvZqVbsFmxRqJaRtZQfgBny+QEPCi7lBskIm09upSMLuLcohNmMrdVgj27P6tq5xdNpVO6x2pOxYFNkHsMEuYw2r/x86WZ7ZHEAds9aApjpM4byryoDFSMtmAiZrI3+HQ08qnlvxUwP81NLQRxKrIkJbEqruLri0RTluo4xc3jGB7gq61z/s674Xwf4y1LDNdz//u1WH6P0R4iAnctt8IrtgiVP7teePPGiH67hmPyhb7QO6+3s3hjSV0IIZjJHqcqkDrrTMBI10ZhsK0Uv8PazINOcN01Wb1HHqZyKI2ZGFZ1aujk7pjbUz5LrcKTLUYRIrt/G878FOGGLf0mQqwI/NAzDNRxRB3l59ViHM/h3PjrIER5dftO25gYbnV1Q7rdP2r1ja9DRarVsS+eibTEr1Z2rFlVm7B4Gehuv+TJOxi6h4cgG+/BOmktgpra29CsmVvHYX3zr7tBjLuQ68yLudMgAmnv5z+e9eRSeOdIHw+DcaNw/Jsv1RxW6wz1TVnwpx+zVJObYibFTBhiagfL3YqWvL87S61bKWOd/A2cHFerG2gULs/P2+0SZdN0AIvGDXMlkIieeXeRrm04vtyZBstbF6BG0yeig==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(56012099006)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ms0QLia7/fDX91kfWr9rZz89F2FALH5uWWhVTN8XIX/MwZvllcjkkrt/KzXuhTabnuH00HeDzBWSFmkypbcSa2YIclLHnVYyFJVBo/GbPkEyBxy8Pskm49ZYbeILOWNwzrkXWRa3sPJnYwjXyHxTnqTJrf62Bjv04bzUmte7b0EaIbdnzNSRmALNsp8Un9vG9ZWb5TZBR9fu1au50ZL8GCTDOGc6EjO4+Sqn5AG9zKOGdRQINL0nRihXPFejwcOMx5jJbggo9CL7CL3DA4mwBzC9ogsOpHE3a0H5x2+o6v+crzmS0nSipHr0n40vvm7iNWaXZeUCXXqHh7SXuvJRcSQkOaZ/rep34FTDe6apcFtv9wmaidJnfJJ0tSTyA/ex54c4qqsn0F5ULUJgB3ag5otVLA6rX/T8jDGSBL9qNFrXmQGnvLU2XPc6Ce+SDOYX
X-Exchange-RoutingPolicyChecked: N2+cAMaICuO8FG2TxzhfUkEj5G0b21fYis2WBDBxl8wRVv135kP6IfTp/DIum5+rdTD3dBpBwT/EvNojBCieZD2BXFhZcs30TU05zOtVnWNVEp46LLAl+GUlLCrboVDtkhyt+dOhXULN+DXWqapGnBr91K50zvqj4KvHCs3Z1FsKRYU0s17m9sXCjkZ36GMcwZiUoqGteRJYddfGckR0PmqudTY3lCqaHn2oO/E7ZfKy7J041h4NNtjNJviXQeemVQYc7cCptfkjBYiXI2jDQs/KeotMr5GoEZARHxC8fe0pKObXu5ChzCYDyJsN0vekwExeE5J+KTbv4rfoZT2gvQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 20:52:10.3122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb783216-0f76-4b62-21ce-08def7213f7c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6538
X-Proofpoint-GUID: 6TXShnXSkayNY5pYmNM6aNQzIR4ZFfru
X-Proofpoint-ORIG-GUID: 6TXShnXSkayNY5pYmNM6aNQzIR4ZFfru
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfXyeq1K9fCnEGw
 uaLGc0TKv6R/4jMYjcciSGTq5PlTOsETKw3qf+GL+Bmau2yhtGpYeV84+a6Yy75GgpFsMzkHIqQ
 fZDOn3tAs69N1eK3t0vsKMra4HQwxpWNiuRpn7xfsQKQAe/ZbLglP9CZLNJU81+wXZ2lIK1AMhk
 YSguObexMZhHVYBZo7nxU0h3Gku+8pYD6p2Iyp3R5+GeTOX8L2c/Bwm3v0/8sHXEiYbSK+1Zbbc
 Qf3Jl98MyKLMiJbiO/+NtOLxA6wS67Lw9fTpjoV/XK2gWof/0ryqTsmI5/R4BT3XMlfCxpsMmcN
 75kYm+gU398oMxY7CisJyn77zhkQgb+KeXx5ovLF+o+iA4zzZbv8eDAunEILaWVNwQpLldN26E1
 bqoDb6WbN4jyLn/YculsJNK32w0i4WK13Gyb+Tmd29lLZJDrsa2fSgCP5BGaQNWoMpagRPZUa+p
 sBXfSVwo0eHHRMHLrTw==
X-Authority-Analysis: v=2.4 cv=Ms1iLWae c=1 sm=1 tr=0 ts=6a7a39fe cx=c_pps
 a=WUa4KgmVXsEXRBJPWwSZ8Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=t2EuUbTCF47BKSFJwqMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE3NiBTYWx0ZWRfX8uL1SR9fQ8GP
 QaH9mEYGsvb4adVa//jTASTv4HvZRBcgn0Lg9DhVayWSIYgZKCDvz186DiumLHdUQuOq3vWX9gP
 /ZJFnBCaVvpZNn2ic6Feha41Tbmy7TU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_135218_150765_65F5E1B6 
X-CRM114-Status: GOOD (  10.70  )
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

The NavigatorSS (NAVSS) address space contains a 64 KiB on-chip SRAM
region at its base address. Add an mmio-sram node to expose this region
to consumers via the generic SRAM allocator API.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
index 1228ac5711bf0..1fd173a68c0b2 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
@@ -784,6 +784,14 @@ main_navss: bus@30000000 {
 		dma-coherent;
 		dma-ranges;
 
+		main_navss_sram: sram@30000000 {
+			compatible = "mmio-sram";
+			reg = <0x00 0x30000000 0x00 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x00 0x30000000 0x10000>;
+		};
+
 		main_navss_intr: interrupt-controller@310e0000 {
 			compatible = "ti,sci-intr";
 			reg = <0x00 0x310e0000 0x00 0x4000>;
-- 
2.43.0


