Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCC8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkSUsCPz2BpOGizEjmwOm226FDU7SbdXREgcUgr0I60=; b=ZL49YmemFuvOsTthcJcjtsqhZW
	IssM946PVX7isw0CX+Nb5R8bdN6gmwsGM7qIQLLmzzvm3Xw/wKJLIGY1NJ9i1N5RdzGRfeyeJ3/MC
	bsMqPGu7bYjOcHmuG8OxO7sjkQ4uZxqOBMmwxsoBSVdL1O0op81sz0Ge7/u9MHgubQsTvyrBuI5QN
	/6l0ardr3aEXcT+LhtGz3B8y4hzp1fje1MfbPo1YZVGCbEz8IBQuyGU6vDV2a7gNyNp+iAJ+i0N0o
	t/2bKua5s8EyWv5pWNNqkJzMFOuVfbQipppGMydShloX60FCs4F1TpqyHkMvKw8W7kGG2lKAtJ9gW
	+Dm91C1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjchA-0000000C1Xj-2Jfk;
	Tue, 14 Jul 2026 12:57:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjch4-0000000C1Re-3Yhi
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 12:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IkSUsCPz2BpOGizEjmwOm226FDU7SbdXREgcUgr0I60=; b=OA1YEAj2qebm52oCkSjk2gEknA
	JzP3qCA2MTccz07OHeEwCkGk6MCe/YRbqwnck7UKMcF2dJ9aVyZ9MVw1AFNvqoHhx3lqBseN53yfF
	a6f2xkph966UEwm7w8Mz52FbBMixahGFayG0fyFoDnF4BfN/qJSRksFQ9kSgNNt6kJLKte8IlAr9q
	8EbLOCi3szYeI43AGW8XOAWg0g/02wuv6+xIiNhlEEY1A1EPktehnY2dwDkb1CRtLQDdoq11KSKXb
	e99pMOaULBWFgShfhnk6Nu1DcilDFi2aLc5ya0qwzIe+g92OmqIowHPyTfLh4rlxZxParuxcdiDO8
	Xrxti4/Q==;
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjch0-0000000CVDd-3SJF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:57:01 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66EBPq1g695407;
	Tue, 14 Jul 2026 07:56:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=IkSUsCPz2BpOGizEjmwOm226FDU7SbdXREgcUgr0I
	60=; b=K5eqcKb9xxxOGPvXCmGdZkxU92KUEnbA3+gcukaDrusKeKYVDet2zIYSA
	njAoLMI7MbR5Ppn5yNr1xybRvCTdcz/UwVo/+As5NhcShlBLknYlgHECWfyxQ4Xb
	oZh9d8/0t4u0krByyCJpfzvIl7+e08ADQgsn373AAEwfdeX/BhzBiznL2usytmgf
	oArWsIhg1lTi+h6pSrUopuoCFDNEmDaNVYf0Ubq1Stg795b0qOu5Tw/Xjawd6l93
	u2gjtGHzhSx3lHqd1h8oMeArdiOOXnKZqDsSuynY9+fH+dsg4yWwShHtuh/SIDwv
	/IT+wBn6+22OBEYvv/Aov5xmG7kYA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fdm2dge1n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:56:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiCEzg//6XntdVHOf1/7MeV/e00qOLm+nyrhHX0gzdEKDs+xGWmm5WNa35W8+94BPPuKJgfqT738zqVQqunuqCArB+ITjLldm9g7kK57jjU2ry2cpCcmj3ExGUvtNkEnW9+j9NRZWhY6e3ZfGmHN8oSelLCVDkDf9IopyyiZuRZei7KmVA7TdBfztIWOFQH7MNFo3e+/ffuzJlXBwYVQ+/mSR9pBhA1git+yhMzckiLDRGw1Djcltoj+KWnSUzl08PeVw/uhl5IjFnBQZF/HfBuIqe9kUKEnp6ejbMRjYyaTiJgXBVog81F2QElw6h/hOjb+i5Y6EwRAfKIO67bjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkSUsCPz2BpOGizEjmwOm226FDU7SbdXREgcUgr0I60=;
 b=NuLyrTg2Fj6vdMdQ5RtebnMMGYwgXHxftWkTLWnbJvXdV6nxOAsdkPa6D3WBQhI2hv45UCmLZRrSWfsWxi65GvhXxHv3cunU38TqToIzYNH4myhOWGDSFkT8UxFuxdF+zHo7r/ZWLFa3W4Z6Ex94x5jUK7+WsBs5uReBb8adPpb6zasa6Axqt47B/JiUqWYlJLkh0GnWGb3FRdvZGjR5kPAljVXKJV2rlGrhi5OkmTzuMJOm3r292JcCMcrfaOYGDN3tFEHhGaS8gWz3Oj0GbQ0IKmRUuzPWEo/CNoOTbPXuMNG3eXtFDJR6lm06ji7cY8oCyNkOB8IZJAXKKR6xVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkSUsCPz2BpOGizEjmwOm226FDU7SbdXREgcUgr0I60=;
 b=TJCdZwmUNwqc5ZgKW596kV3+UpY8Zrq1IvuWaXxTqQaObXulKin1tFRzVlYY340RNMfuGmdllZ1QHa2h/WjkxOWFiGze6pgNOfqV5yE3/LzE+JEV60+BL0wJT6oMfdZxITu6P0tVyINRbwbw3RkoXXfzwHoH6dIt/BlgYO7lN4k=
Received: from BY3PR05CA0024.namprd05.prod.outlook.com (2603:10b6:a03:254::29)
 by DS0PR10MB7320.namprd10.prod.outlook.com (2603:10b6:8:fe::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9; Tue, 14 Jul 2026 12:56:51 +0000
Received: from MW1PEPF00016159.namprd21.prod.outlook.com
 (2603:10b6:a03:254:cafe::91) by BY3PR05CA0024.outlook.office365.com
 (2603:10b6:a03:254::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 12:56:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF00016159.mail.protection.outlook.com (10.167.249.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.3 via Frontend Transport; Tue, 14 Jul 2026 12:56:50 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:35 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:56:35 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECu8fb546300;
	Tue, 14 Jul 2026 07:56:32 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <n-francis@ti.com>, <s-k6@ti.com>, <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 16/22] arm64: dts: ti: k3-am64: Add DDR and controller node
Date: Tue, 14 Jul 2026 18:26:07 +0530
Message-ID: <20260714125607.3304375-8-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714125607.3304375-1-v-mannuru@ti.com>
References: <20260714125607.3304375-1-v-mannuru@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016159:EE_|DS0PR10MB7320:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d4812d-23e9-4415-81b7-08dee1a75f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: z0+8jhzehPCbCxqkNkR6WDYfWr12kKjinBqQk/UAj68rhIGfiO7JhwFFPacqoeVFUZkunL+hj8SJEYQDe3jYWCD48rX3N1yvknsFJ3Mc0NOuOGrLBxuHQcOIW+SPMPOaNVDDD8L1nrYV/iBmdjfuX8TlTeZ4kaa4OVF7S+5R4ijVI9CO4bWe0lUk+dpTwdtXYbZsR6oMn1rRuJFXUIyeq1YXzO+FGNOHCqLpN06LumK39cbLyHt50i2Syhdh3gu2p4b2wKBFMWujEctN9Ms99MuZxbAAwx/go6vRrsnW6LL6YTIJ+HS1ETige2gf46032fo3+GiEmWjRWSaEapRQPlOIFFKHpZ3YTcKgmAo1KRFNxcUB169UE8p7UaoYPDEQF2h7H7CggWp9U91HYDa0Ols9L8DUxCENe71z7fIBM6Sv5HCMHBk5PMTxG/RrLgVYX5LUkNMIMbW/ilPGTA2DECOxGZlZNPvzVQ360OT4wPe2CBmkUlX3DRo2KKmH878JNuXa5aZvss4JDWvQx7oEw6QB3b1VaIGByokoN30sUxkdJyC8Attcvv/zv3HN09L3WhLSICLndMgoWdWtCVXywX1gnfR5moFxeEbwHlYB8ZQk1DaW8OrNNgcqekIRVlzKm3PWcQDVpUhkPWMkL33LESepJmAIC5wU7KotOa4zUT2//CeiLBEoozdobRmjYZfWHCwFVUnTT+jRY6JQfb0mJg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kkpqKShcv8LjrCJ8DbYF0yfAVa/2EAKwrb+QyBzuXw+Dg/JNq9RriINck1pyL8VkRZQBL6p5PIYWHTF0tyYZRFNX3lp24NtyFLB/Xmqr5BFeO+Kswz4WlNGkD21NcB8vl4nm/v6uI5RKCUNja4de12lzB5yzydERA9H/e2s56sIBetu/7ew/Tu4XKXdKGYLnMEwvKZZmzslfAaErO/vzkABDFYLlnqllgk1Bgj55Sm+O21bcrNP9yiRzT2FkXBPrA9HFV3Yexc3v2bQGxuLtpGpuEYR/14zE4tsCIT1+emqHglGrH5t+sWBzWtxcRwMntHN1B9p1BaFZlG8iqbp8YscMYS1xLyZfpK6c0OjWHZljQbiOL9RpaYqoRocWJNmvDPo1bjlMxkvE970O2nBXImkx8JeTsDezfIvhJADUwWLkspLNNDJcdvImU8OWn0ws
X-Exchange-RoutingPolicyChecked: d2P/hSO4XpzE9PT6UyTUlVNu7+L2P+Lt/M45dH61HH4JmHxRAjloI9Pg4hBstLlD0V76/aCdmU1nTILIY0XmkqftmtMzndQI0Le7+SJ/YhLZjxUp7OilWXEK1tuA5FnaocUoGr6+d5Fj7S4+HAgpd1ifVDzEO2JPJlDN+9vJot1mHM082ZUJxjLEH/6RNYOKB+ijq22dgwPMrt2mzZqlHVxTODrMVbddtFFZeX5UQkB5+CrSvZ90qKEugib8oUD9441Z6pxuCxPQtJNZlQj7p2Sh9lC3IDo1epZbp6mJX7X5Mcl+hQJgPCl/66w2hxN7QeUXEMUwSNVdFvG4DP5zQw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:56:50.8511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d4812d-23e9-4415-81b7-08dee1a75f6b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF00016159.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7320
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfXwNiDBTGjJ16Q
 32va5MHTnCvEb4MNZR2l7iRrputK9dOK5bYbqADboj1mNoXclRK2Ui7Vq7/X2CN/WIcSTy1jHxf
 syaFGJckNFnaU1DK2lKhZ3c3W9WLNLc=
X-Proofpoint-ORIG-GUID: gKNhxAXWRm3CeKRsy2t8GNHMdodpHkEr
X-Authority-Analysis: v=2.4 cv=f+N4wuyM c=1 sm=1 tr=0 ts=6a563215 cx=c_pps
 a=vP0OKLXe+mBq485nSWAwQg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=o0chtgAPjuOxbS9V6VIA:9
X-Proofpoint-GUID: gKNhxAXWRm3CeKRsy2t8GNHMdodpHkEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX2zHY8Pd5t0l+
 7fnjVBJjpT9+3PmRTQSF3i23UH5/wTuJlisSfI2uWEa38VFAT2P830LZJjLRJA3Gge5UunW0GOT
 ui16WmROznaCDe/3z0K8LXr3H1m0xPXmcKpXxCpZf6RXSjUjHxZ1TwSsnSXifyPrkRnrA0th6ti
 Io0yp6RWXcjIpqCS62j+XIdtbFanN6y5BEzDzHOtrf9YQF8RfgPdy4ZUS4bhICGxtdNdF4IQd8u
 TD46KatnQr1YhI0XuQLbMCdODxD1IA0QqVVstEoVrkdHuGd9i+tnLsteExc7YZEUdLOnqVXYALF
 ZCJIemS777tjQtKDb/0jVhtveLuwZdGdCFNQOuXBfpMhAOgsNaix09m+AmojBLjvIyr9uT8DwxA
 BMfn6KqlzxTRJ8ezu/AX7byKlIAY9ZNy4/aZ4NxsMwXFPEaUJwTV/KGgzmAWihY2bfgyaK8vPTE
 jMVDuyPwt/DFr7pv+jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_135659_443743_497133EE 
X-CRM114-Status: GOOD (  10.71  )
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

From: Neha Malcom Francis <n-francis@ti.com>

Add DDR Controller and LPDDR4 node for AM64x device. This defines the
memory controller with its register regions, interrupts, power domains
and clock requirements.

Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
Signed-off-by: Gandhar Deshpande <g-deshpande@ti.com>
Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
index 1b1d3970888b8..f7a331ed00e28 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
@@ -1675,4 +1675,37 @@ main_vtm0: temperature-sensor@b00000 {
 		power-domains = <&k3_pds 95 TI_SCI_PD_EXCLUSIVE>;
 		#thermal-sensor-cells = <1>;
 	};
+
+	memorycontroller: memorycontroller@f300000 {
+		compatible = "ti,am64-ddrss";
+		reg = <0x00 0x0f308000 0x00 0x4000>,
+		      <0x00 0x43014000 0x00 0x100>,
+		      <0x00 0x0f300000 0x00 0x200>;
+		reg-names = "cfg", "ctrl_mmr_lp4", "ss_cfg";
+		power-domains = <&k3_pds 138 TI_SCI_PD_SHARED>,
+				<&k3_pds 55 TI_SCI_PD_SHARED>;
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x0000 0x00 0x0f308000 0x00 0x55f8>;
+		ti,ddr-freq1   = <0>;
+		ti,ddr-freq2   = <0>;
+		ti,ddr-fhs-cnt = <0>;
+		clocks = <&k3_clks 138 0>, <&k3_clks 16 4>;
+		bootph-pre-ram;
+
+		ddr: ddr@0 {
+			compatible = "cdns,k3-ddr";
+			reg = <0x00 0x0000 0x00 0x69c>,
+			      <0x00 0x2000 0x00 0x564>,
+			      <0x00 0x4000 0x00 0x15f8>;
+			reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
+			bootph-pre-ram;
+		};
+
+		ddr_pmu0: ddr-pmu@100 {
+			compatible = "ti,k3-ddr-pmu";
+			reg = <0x00 0x100 0x00 0x14>;
+		};
+	};
 };
-- 
2.34.1


