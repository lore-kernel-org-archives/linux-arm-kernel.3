Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8A5C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9Rxd8XI2zrt/c+E+pYRJC08SNsZb1dYnYoL6ua/0IU=; b=IOWYTVnM4iU5TzEiIV681MBTDp
	OS15jD/Zqta7/F1hKZmMpuPjoeVdI153jR9ssQdptdoZmhY/oyqNfKqzuxtQwhH8eunFJ1RCxdao1
	HcS04AJvD4zVJMYV7fUvep4fGe2ZIaw+dZhWoL1hJINT2NRWarosGUxTP/0lgEeS3p73MiRgTcn86
	SnRHjvjTkr7+tvlzSYx58fwDCaRrMzKB03VQNw+mY34wOxBFPkmy1qtxkvgiSEomkeO9PY5tJqSZZ
	cLnuqz3vHDWT9pNjxIt1FpbphB/N/GkzrhYL9yqlIEYdlUSfPgmoHoQA0ZF3UJzBYnLOfbsk2nJS4
	066Kufrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q9q-0000000CvYM-1imt;
	Wed, 09 Sep 2026 21:48:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q9m-0000000CvSx-1KpO
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 21:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=f9Rxd8XI2zrt/c+E+pYRJC08SNsZb1dYnYoL6ua/0IU=; b=nN29o66OgKvMCwud1Wnnhc/DbK
	8qcq9ckh1kNltJVFWgvmw3ro+VeQDAiWQfV2PQgjpvH46oSy9cDJQs8xoQepoOStwyJ/zJCub9U3f
	+BMlz6ym6RxNIlTj5QN6Zl6hlRGc2S6HWg1w6d5juH1JRgjqymbcxN5Sy2B0oMk83YJMr3ijsnowP
	v5OZFqUhlg7UcQfnEQsn9j+YAZnumwoUT6Ng/ZMVEEMijWkE+q8ZWxwszLnefVcpAgBJeq2aw4f2k
	kTIg50E7iwZ6w7Zpu5s5ZjTdZuYKOuhlwTxtdYvSFqasSZbtKZ1jBRd8DcnKNtfqS1DGzQFKd86U8
	hmCHBwFg==;
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Q9h-00000001ihE-2di2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 21:48:37 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689JGUbP1159509;
	Wed, 9 Sep 2026 16:48:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=f9Rxd8XI2zrt/c+E+pYRJC08SNsZb1dYnYoL6ua/0
	IU=; b=bl1n9CAle4JBJJ85ykQNOON+HFotSuxAudglHaCJhwyvVRNbKOWvjZ1w1
	rRqCEVxBerAJ8NTmUQJ3+SCkL/Hj++tWTOS65jQq0JllcpG98P4MA/axIJjhxd35
	ltXVNns4bZJA4obyYeFbVAE5toYhtVckHpMsu5DpaxpvNm++Obhjc+oIRDF1V4O3
	uiy88B5T9HxwrcTnEDYG2nZr87ywOKfHzoMG6g8E+4zmJtxaWXnBB7HZcom32ATq
	KaEx6I0mtQcp2zLE5E4UJEdjW7PfkTuGf5zVNKezix26QxEn1nUV7ghD08DlCNeH
	R5WpCCWWk2c8vzvcJA+sdRXp6ejrQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011009.outbound.protection.outlook.com [52.101.57.9])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gkcxes30n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaaU5ENwcu2lsIr62anHYu/lnFrnGsBE0lQV9V95Kxi41ovcOpA8q/AfDuML1Tl/vfIZh6PaQWvcRqBZY3Q55IsHwz2BuZLw6ctihczSl7YlKs27uwCD8kKIAPodNasx4hOUGOK8ME2VxZKsY5oQvk3ExADBW3FQJ3innyd2Yekvdjgczxak8R1WoowDYBlZSyi9RyQRKDnEBXUfFssNqCk/5X1eSv6L7WtQGNyIF0YD4VeL4mYt+zhk1ddDX40TWWwXkbDVBPDNYS8mylcBv6ZBtDUOhul1jpMydgYcgbdCHaRv2g2MqpBXta8vvCAMjHH+ZZjYnXgPOgakgL2bJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9Rxd8XI2zrt/c+E+pYRJC08SNsZb1dYnYoL6ua/0IU=;
 b=eJRdPM//q3bdIUN2oCR/SNTbC6gj8SUJPMWmDxPYALSeZjfV/gNvjpldIlOvg0juAb5+SgVMxTkpZYucb9Q5Icq1dRyBNDXeRTQLA6gVxWl3K9Fc2lMnfBtOSBFc8NJymt+Vlfv7dMM/3C/iwWE2PnMOQQETB96kiIUPTVeHDiAJImgyOfIlYa7pyMCeKkOpB7myTo+Cf3iO+7vRK0OWvsQHDYfVGMjr1daXMwk7B8JNAtvvnMU/mrwTBKPcjFb2itCyMOZtKUD2NRIooJqN6xHEjNTGjq8jByL1/4S+3P/J1jB8my97SFF66AivVPgPT7AUl3GBVUPNfa3CqbWf+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9Rxd8XI2zrt/c+E+pYRJC08SNsZb1dYnYoL6ua/0IU=;
 b=oADHpPFPqmEJRwzQEq1450rMIzgAEAiNTGl7jTbYfF8t/wj7iRkqRFQeXjKN4tmHSofCyLKbXpOiZqHUJz1W+yqTI90+k+itH/ujOqj2TjbPOStaAjOFzGZ93KWghzR/2EQwB96+Ji9LDoKR0p0U/IfNr42oFibvEdEMnESCWh8=
Received: from BN0PR04CA0158.namprd04.prod.outlook.com (2603:10b6:408:eb::13)
 by SABPR10MB997940.namprd10.prod.outlook.com (2603:10b6:806:4f0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 21:48:05 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::2) by BN0PR04CA0158.outlook.office365.com
 (2603:10b6:408:eb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 21:48:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.0 via Frontend Transport; Wed, 9 Sep 2026 21:48:05 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:45 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0O1072162;
	Wed, 9 Sep 2026 16:47:45 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: [PATCH v4 11/15] arm64: dts: ti: k3-am62-phycore-som: Set eMMC clock pin as OUTPUT
Date: Wed, 9 Sep 2026 16:47:39 -0500
Message-ID: <20260909214743.899477-12-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909214743.899477-1-jm@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SABPR10MB997940:EE_
X-MS-Office365-Filtering-Correlation-Id: cef2252d-f57b-4c93-1e6a-08df0ebc07b6
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|23010399003|13003099007|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RP32PPFXdFCcyVWbbWzDbH83z158OKB1D4at804F5MP0aZloAnNs0icLm9d6N2XkDRFQ/tjgWzoakPTChtXOXXBl5vW5bXLYWNtPQAdHBuRYM2rEb+2fXkCDDnQ4s7x+M4BzIpVZuPR4AdAg+FWqKBMQgpCSIzfPxamwcP3cbr7QyBDSH1ppJRVZBiTbMvVWOfAKSthJrRk5RpRRWwTR3F8QUxzF9uew+NvxcAwOdsTr06HN/kAsrGv79oJ2kfvrWTSZ0PQScCfglmwiezBG1X90GMbz0rR/rhXt/NEDC+o1BpFS7nKojOQiXmJLFiNmFB2M8Ugv2VQgsVcBQCQRnDxKkxvA0nDtgxiwJ0CUGJfpcuu9B5NE0UMhLSuRDDDThmWM474IWwGRna5l+edHO/NGkskRuABDBK+oZMMwwJ+QK+lfiUUpPHBPsEdNDITHvgj0JdpGHm3Qjk23C6N6ZN4LBjInAnwwudCtaHqTxh1IxfBrlVCmRIGFHuVSnPFon+Q+Ku0PwPJ1vZDa0MZKMPTGO1c9x6E2CP/tv4MPyrKgAMWLFyfAHLZAQsbQx1azQyyQfjaE06N6kQk4gGsVwTt+7RLcqtpqw8Zi1g2rQRX2qQG9SC2FUjEjcVCxk8JV8ik19viiqjcr6NWT4PQflecszUeUcWuhWEmrgv4TGek=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(23010399003)(13003099007)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dNpg+tzE1DW2tmGhlVxVTnvuZwFu4gbHsL8Ne7a3t+yD3wPlCbJAD4YKkmnx9KDlCtSk4pXmlYi+LJ0TVQfrEJv0LCjBr+TZoirjz0E+0xeCtpwT7hg9hMH/Hcl8bGe8MA8MbTPz6JNUjPj4WSQBEAv2ZifWCv138DvtTXHFKAhuZ2/W6IvLlh9sLVuq8/9CP7isU4PVXwARUS1eJP2MXtu9pk6r7YcPlO36vIG48oQ80VJ7IYPzXubLSG5nGx/+FtBGyOwtoZwAiTTi7f+aX4/WADy/2Bsjr2DpTC6RzvK4FySg/Wy/i5OuUImo0UBD4fI8imMtgZ0Kkd/7GbW6NKRBWxLzN18R9Eh1A45peGRJtD2NL0Q6WbrDJob19yGu2EIXn04ojfSeHbes8ajzEDjFa/umxSGHl4tnzfS1sFyKBgi3NXvuElN0Xd82MMJi
X-Exchange-RoutingPolicyChecked: 1el8PCu0bNim+8N0gwUWYzZhO2JA5dnTFxcFQriEnFCFPrcemxOi/J2E5fRZzpdLt7i5eG/cteLZDowISUKnc4nxr8HoE2y5rUV8fw+lhxYl8yvxG1tF+wIdMFMKou17qLgUKvKixjPMuZr+4128zamel6iYLQieKAElcjiTCix/iFYUHkyvPyinS9h8fLXmoxn8zUvbQSXCjFPs23p/37kXLw9VkA366nPWO/v6+TiEbhuvvukc+OthN8Am58Zga6zcJHa0N2IuGDj7skY5lF2bBVwWvqkLZ1V9Bw8ftyyTTU+UMGgLKE4uxlohadgwoOtNtXMprV9TLxC3Q6fSyw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:05.4752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cef2252d-f57b-4c93-1e6a-08df0ebc07b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR10MB997940
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfXyeOIoGs1Rdtr
 sJvSRPlBY8ai+5HUDUZ1B5asYv6K1zd9DesdlvELSU9TUfBCBseCxd/xsxzSh2vkM0S2Tboq4DO
 OkOnvUKbJ+ePv8pyeZyJ2mr3pUDeqq4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX2qyek/KC3dXV
 l3wRaAxgLhZUtLKxU/YlWN8zRWryDltfPbpAXQalgQBwoWKOT/mnPRKshMyYxOYcXhkEN0u0WDw
 wsE4Ac+W6O3PMXWA9xJLeXix2jFsQ8STPZIsLqO3/mR7eJti8AMiOqmlSSH5FbtFQC/U/sSTqcO
 FWMxCVUZ6b+/2qWUkZna/vHiSX9/xzgOhaQs9VSbbLOpud8v3H/PjpO0vb68j/VTwso+Leoa8ga
 YvJS/Go7HmnrY5WXSTwaKZoEjn3BieND9ub97EcZCWOHlfxLEsNl4Q0m8zmOfqqMSW5AH69XvqC
 CbG2SoZpVai8OcBZyoLcaWuORhyF9BD0pkta/80sl5HkfcA+6rKNlrR9TI/H3WTslanXp9Z3eqF
 OORu+wwbNg7nMnG4/gbFfI2CluLLtdznE7e14WjAeup+Ns4Ir+A6FHx7LgeLxoq+bWw8NJawd3L
 jrwhJPkeIzfeoTD/FHQ==
X-Proofpoint-GUID: KrdrkF7m-iybJdpzumAw8UNJv1vBFz3e
X-Authority-Analysis: v=2.4 cv=F8fC5ahN c=1 sm=1 tr=0 ts=6aa1d41e cx=c_pps
 a=0F+T9beUwIReeq27KEkavQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=UkJH29YUMvoFbFVjcwkA:9
X-Proofpoint-ORIG-GUID: KrdrkF7m-iybJdpzumAw8UNJv1vBFz3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090244
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_224834_107526_D2C7389C 
X-CRM114-Status: GOOD (  13.15  )
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

Fixes: 3443c1c4ed61 ("arm64: dts: ti: Add basic support for phyBOARD-Lyra-AM625")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
index 3baa653257bb6..ce3e5165bd310 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
@@ -153,7 +153,7 @@ AM62X_IOPAD(0x15c, PIN_INPUT, 0) /* (AB22) MDIO0_MDIO */
 	main_mmc0_pins_default: main-mmc0-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x220, PIN_INPUT_PULLUP, 0) /* (Y3) MMC0_CMD */
-			AM62X_IOPAD(0x218, PIN_INPUT_PULLDOWN, 0) /* (AB1) MMC0_CLK */
+			AM62X_IOPAD(0x218, PIN_OUTPUT_PULLDOWN, 0) /* (AB1) MMC0_CLK */
 			AM62X_IOPAD(0x214, PIN_INPUT_PULLUP, 0) /* (AA2) MMC0_DAT0 */
 			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
-- 
2.34.1


