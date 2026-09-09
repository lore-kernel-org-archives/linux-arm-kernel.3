Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DDFC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDYxHgerAQ5zXuCidDBIrKy8z+4F2CQTDPJz/p/TZPc=; b=by8UK3F1tVV1Deyv+jxSUq9o4g
	FKMm0K0I315WZXpLtqrP2Y28oOve0pEu0pqlBVSSPluVEAvzGsnnNQuRIParPtYyg4hYl+wH/yqVA
	qnYXrewOjyrPActOxU6TMUbprvSKsEInTKGE+vCG5tx7j5toB/81HbickxbpF2gH5KgCTUNUwWTFP
	87o9APG9G0HOQQjxZlSKTxHdHLeV7PUGRJwLkQJbdwkcjLOVFUr0H8HD52U/tMDqg41q4RCpWrgdX
	LM/CbU9OCNb4orRMQGml3CYdM4TS9jaD26ZsLs1Pebn/J1l8Gllw/ccAV9T/umYh0KAtIcwVcFiYn
	oLLpbiJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QA2-0000000CvkM-0d8c;
	Wed, 09 Sep 2026 21:48:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q9s-0000000Cvau-2GLg
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 21:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NDYxHgerAQ5zXuCidDBIrKy8z+4F2CQTDPJz/p/TZPc=; b=h9Ijd93435wsCcRLPS4De1ie7j
	jqzljo6omXIVhKchuPB3dkgN+lTVi9l0G77wfySkQfpJwIy2u1uqhiINy06ZhsbXbRTEUwSnLQ8mV
	ywgbNRLE3z2QB0Iue6J0PNKZnKu0rIFstesp782hJTP9epaXkSJkEQHD8sbTgAAvnQPvQBbs+dNrs
	JfvwJjIx/wsxbn7QzaMqghc2rLhaEz/0DM/+4gA0bWWvAS5n3au/X0oTfzG2kwgkOMPI09MQ6mKKx
	NO5EfgqlVk1m6fch5SdC8z96H3klJWknrRQWbWOYSH/IbJlTAoaYJoz2KT+1zVqwG0FoDM2jdBQ9s
	s4CtH6Bg==;
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4Q9n-00000001iif-1EOj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 21:48:43 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689JFvwv3382309;
	Wed, 9 Sep 2026 16:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=NDYxHgerAQ5zXuCidDBIrKy8z+4F2CQTDPJz/p/TZ
	Pc=; b=nzToTrh+PVmzVoi9DipwOExX6QcboSvjVrw4GY6AyCEbXPy95xeyHjDi4
	nhBPnJcDb/idYQbrVfbS35b8iVHI1feJ3F2K6SqiBft8yDmiTFFie5HUQea4f9kj
	/iAJW78Rt+Zk+fo0de4fTa1Gz2LlCU1xbFVSzq16+f7FT5nKbXzcyjqmZVA1ScFw
	Mzw3lWD7nuw2FBOZ+tKrLt+PLW/Osm7ffXhUaVLBKKl1gnsNRF1QEolW9p4WzLYN
	Kj6PD1fMhj9rdozVKwiAWVRDIiaBTE0TV0KFPW0tZNLFBwxebeABO+8ctmpbGn8N
	+6RNW5YP4b/4/3GlAw2oa0czXX/jA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010008.outbound.protection.outlook.com [52.101.46.8])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxg92uh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 16:48:20 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tj5611gp8ij2F6acn1mlK7cD6B2e2HKcloNUdqMMqU44nXSaIWzGZ6KCU6tZyxWSy5BSVZkSP9FozVUkAU37UJ2irYGjAx3zoaL391HqDBu3E9TViG3A/k70F1ov2P9oWFH9IsHHDwXOepfWOVWX+wLVv/BUIexsyw6aIEBa0iC2elZW62MVS4764Dcpxhtt7dEEApyc/W0hYC2spHt7CvzcFJPp4mn0m+abb6Enaxr3jETLUA+e0HUHLWLGh27M9tfCKAezLTI4NBVu4C2o/7RYNaHQS9/spMRDcmAp0OYkKujWhTbGrdFbFaw4uRsZpVhmfpE8o3znmCSTDVbdkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NDYxHgerAQ5zXuCidDBIrKy8z+4F2CQTDPJz/p/TZPc=;
 b=Iy0qqvzyXqfh1bDllBwpobNrP+T/O5p6F5hRjEUnfjtWOgyDYwQ3yVAo7Nn9vE+CwRYDVWeh/n3Blvt8h86TSXpZ+sKyGxFwwv18HMb0uNXLupaGejvNmuVgkXVxPnnewtAt66rKy7fE0feUw4/WmYz/+NOqxqURAV7THAhxTzTLKEyOoQICXwp7TiPNrmbpN9YTanivRPpDf+8+9U4Donv0aEqTh3L6T2T+BL6fMU3fxe23E65VcClLAh+MtkKa8GxdxguQ2lS74kQp14bF0TsEYi43aKPSRyIxTQUay73X2/Xh+fCU6Vgv6VwmqAf5LYq3mfYpcFIZUJg4AHdmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDYxHgerAQ5zXuCidDBIrKy8z+4F2CQTDPJz/p/TZPc=;
 b=aClP5SPB3vUunFbbD4PBiTBHFb9vTxb7ICqE95Xp3u5Cd2BgsKoxUw/Jz8LRSXRGQe+ooaiahuHcnPB5sXX0dxxMq9+7LQ9NZozjzNhq9CZ3tc2LdTC7dSUiXe1QsXcpDAX4OyPTliYpzmJIA/VN9/xw3wE9Xmbizny1RuWRnVo=
Received: from SJ2P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::6)
 by SJ0PR10MB5803.namprd10.prod.outlook.com (2603:10b6:a03:427::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.5; Wed, 9 Sep 2026
 21:48:15 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:a03:5da:cafe::ac) by SJ2P220CA0003.outlook.office365.com
 (2603:10b6:a03:5da::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 21:48:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.1 via Frontend Transport; Wed, 9 Sep 2026 21:48:13 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 16:47:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 16:47:45 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 689Lli0Q1072162;
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
Subject: [PATCH v4 13/15] arm64: dts: ti: k3-am625-var-som-symphony: Set SD clock pins as OUTPUT
Date: Wed, 9 Sep 2026 16:47:41 -0500
Message-ID: <20260909214743.899477-14-jm@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909214743.899477-1-jm@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|SJ0PR10MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 2147ee95-5a19-4a2b-8b1c-08df0ebc0cae
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|7416014|82310400026|1800799024|10067099003|56012099006|22082099003|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: EfFKWd2ng9wSKi5+3z8i0leqbvy06bUgcp49tR4aVMgR0GuNCa2mRr89onYL7pLHNxW/Y4557Y9zJg8Z8B2KcrQ/lGjbV0eIVfVUu1QgKkQlEEHP4ZJsNhH1kVwACcBlHIbu6vh/gRWogzIqCFOua0603u/NX2EsRpGP+aA8AyE3Tm3JEqbDVCKPrP2vnlZ4BYOXyz14NLD0f9lMOplscCqz5Q4IjH0inmSRWWlDE1yy58YkKZTb6FVIZ8Yxa/xmPglh/TK5QDAVvZ4TNAWIXz46Mh8G31UQ8TCis0saUclVV+/eBzUvUIbjuGUVDry1VH4OQOT8PtrLpp/mePD51Js41TYQyNjmPSxahWov3cY5B9l6pbzWcOk2MhB7K4GtlVJL+n9yMgVVHwNgB+0/Fi//IOVb0ZKU4TSdl+UyTM6w7YPLxz97jZntgUPVBKIGgexVdTltr/othEfc/T0FtiNE+w0IBqKtZFDF4OVV2zUwuWwJAiziVf+LfvWdNCVAUMZX/KAp1jF5FVGuqpoew7Q083rCS7k6ASB2FM4JctTexnMzMvrBBcGt3nvh6mABubde/VYFqe9r7X2lGuhAy7UWmv2dwsShefgPx3LN4jqSG9SkOvBP9g7p8v9F+FzQS8bH7cmRW3T2268HUNcSucJIq7V9MuP60uT4GfEwC9kq51i5CQgHE0c5YswU7lQIlEPQ4PRXcZrPZAafGyuc0Q==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(7416014)(82310400026)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P5ZF6YK1M95aKuMzp6JkKxC5ajjNv20SxXBIgI4d20lpkXWNwqjC5jsuzVZfgDudAUtjMRDL6/LQsV3lBo6Km+tIs6irbw+SN3LLKGLuZ4OrP7puc+9khkyafYmxEhzfVjFXnqJVQLLjhEzYAJLR+WdbLmLv4NiEeLLpYdjtvVjY8wBfBgiBtBCyn0pEDK4aKOSPXdP3hXxDDUnYwmKUOvqa0rwDYAmPJEtHC8q4orLlpRWmUzVlSo5O7HBr5P98NrEyByvAjEUVFt0Hbq+V+0mZjddC14yYXFwIBm6LlwneFyuiTCoEjPTVcT67Zq6oM+Yi3AZNLcBMOccWzyfOuInO98oUY8PxrKziQiO8SezPn8/Srr0z8pYOGYelsHlhR7gEGKrWAuk7DD5SuXZn9vk8mJlbLKy+J16nhlnr8jrWVFU24tMhmslT5cbAaqR/
X-Exchange-RoutingPolicyChecked: IoLUv6xSsfpoBLTLgE4C2Y0Jm1qquczTr47yCh65OciuZdEWDt944DLgslmaRbBymmReqnC86GtNC2etSW7MABTVdgOuWCfPktXobHjM75u4jKHTpPfrJmmqNROn0ef+4Cenw1bsa2Pl7ebnGGe/vLaUvjlctGn1dabfKieqWvTjerqH0DtVjlme51h3GsdmvkFkFDYn38t3SPG0DedtrbIc0/u4KIdok1/AEre8zdhHPi070o8hpQwDlKJQosW/BWZeSxYVaZAu555srqU6KfTwODtTasIGcEatuUv+gdQlnyL4g4jbT+benTrsQJSpqAJUp7GXsPjaCjiaQLlSBw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:48:13.7926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2147ee95-5a19-4a2b-8b1c-08df0ebc0cae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5803
X-Proofpoint-ORIG-GUID: NJzLSovz2FGpHbH0Ms2IsW7w8wb-WYLJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX4DytbD7qzHV+
 1CJI9S6ksdUEYgD88QzCFykeE4no5rdA0ojLn6XREYpPAOV7tQoO8b/v/wB6xygU4NKPeOB5vhZ
 j6d1dfqTQdZg5GDhWqmnGM76tB4aGG4=
X-Proofpoint-GUID: NJzLSovz2FGpHbH0Ms2IsW7w8wb-WYLJ
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa1d424 cx=c_pps
 a=BRu7lVsKyHj15bVqb/Fc8Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=DG2nbqSQO9C4fQ70P1EA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI0NCBTYWx0ZWRfX0DSFwwmxET55
 cV0AP9OgKVb5NXRmB0GKAD7hB6vv4MQZl+JbMr+lJyLkR4W3K0vRfEj0c3Iio3EFjQiewzhBff1
 ophSGdEzkrJrM4VST1or+6/J4OqHeXCFadnVxEMSRlNC4e2YdWGBa/1lKSWd9U+svlXLxiBDzzo
 98AX0hUMbRT8+jYfWS2lVJu2ycjq+yhkhtqof5TgEECyGCbdUBot0bwIFS/Un6MTtO11+wE2UOB
 EPCpTpZAK4l8WCjm74npIvTcC8oAsiur2DB2OuuSC0+m8E7UC5Mrbvf6kacvy01p8ps1y+bKwlT
 41ZWThg4pKVAp5GxbYH7uj3LkSVLM8RadgAaD8L6XuXjio2t6vNw6V9vFZSTHhwOIH3IBVSMo3L
 rfmJkRlHkzVWRI1AXn7vdsNIFAumBKz8s4PwGTMwFCJEuS2UQp/hUJ5bzTUpvLIBbQjGdyg9TdL
 NjUWxkdhkiMcp9hTCXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090244
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_224839_738013_26A1401A 
X-CRM114-Status: GOOD (  12.50  )
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

Fixes: acb4cd35dbd2 ("arm64: dts: ti: var-som-am62: Add support for Variscite Symphony Board")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts b/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
index 7951d7ec952b5..082bf81143dcb 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-var-som-symphony.dts
@@ -391,7 +391,7 @@ pinctrl_mmc1: main-mmc1-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x23c, PIN_INPUT, 0) /* (A21) MMC1_CMD */
-			AM62X_IOPAD(0x234, PIN_INPUT, 0) /* (B22) MMC1_CLK */
+			AM62X_IOPAD(0x234, PIN_OUTPUT, 0) /* (B22) MMC1_CLK */
 			AM62X_IOPAD(0x230, PIN_INPUT, 0) /* (A22) MMC1_DAT0 */
 			AM62X_IOPAD(0x22c, PIN_INPUT, 0) /* (B21) MMC1_DAT1 */
 			AM62X_IOPAD(0x228, PIN_INPUT, 0) /* (C21) MMC1_DAT2 */
-- 
2.34.1


