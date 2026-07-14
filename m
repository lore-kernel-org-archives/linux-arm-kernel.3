Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BF0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6JoaxlNuSJdAVWDnDQlq66PcEPAM8IlElwmBdRLauUU=; b=zYXSRGwhE7iC32IvuwtqNPmsR+
	1IzWqEJXtcxDciKrDtvzGqP5lbK8P6YKpTSdI+qFl94Akt7fJ7cAIDcTNLBtiLhOyPQoMWHRqJ2lA
	XTLPCfhgLb7838FMWiYFcYnCbolue5k2P6YoVWnxTTH8678+9wMEtdtLBlWDB5JsBIcD/k9wQrQ6w
	UCI/flL+Jjp+njE0ijRy486crnvQGVV5z+8OBX3sx5wkfm7ukuyZOa1GcBM09oWSpHQqdgbVWelsE
	7kYfc4j3hz7xtYkyWmOiYN7W6pSNn+J/eaKFvBiNOh8l9U/sNiHBNwOK745K48LobZwwkgBxYOomQ
	wKIQLyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgr-0000000C1EW-0gcz;
	Tue, 14 Jul 2026 12:56:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcgq-0000000C1DL-18lr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 12:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6JoaxlNuSJdAVWDnDQlq66PcEPAM8IlElwmBdRLauUU=; b=jigVtrqiTw/wyXqMOJTqMOEC6S
	jULakhLyF36CAEsXfUNwYWjuysMJ/g8qzfVhmJ6xk0KL0llbQtaPg3gU5mbuS46p+uyDrchb7xRk/
	YULfWo2x1u+I+SiXPKDJtjAANBDylphSMW30eX+kr8z3i2J5vH42On/DUEsdXR6JAEz8mP/RyqWJb
	BmWHpfQ9Bkjo1q8Pi3A439y1jQAdY8t313nfjI9n6pvxPanJaJsfPdKNG0+1fa0uaXSE2a5iXonjQ
	oRv/hCMftZfm/keDQ+1wexD7YqaUd04weKZynLhTuGJL2fOX60dp5Hb1iHTFm839ZxFrmy4euM0Eu
	ppo62EDg==;
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjcgn-0000000CVAl-0orK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:56:47 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBQDte2106470;
	Tue, 14 Jul 2026 07:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6JoaxlNuSJdAVWDnDQlq66PcEPAM8IlElwmBdRLau
	UU=; b=BWeVEAMiRjjs4bYfnmY8JRskU2YEYNj3PwEIQpRCusChBQfkjveZ7EIPW
	TinrFqcAXZVifgXgSoDY6XF7RhbkCvPmHRNstinQAM64XMVkEDqxj23WOTok5VkF
	B2G1yZyaGYc16RzLKcvoaL086wKmy/aGukXY/dFJ5aqSGu+jH9BWuo7hGFUeFVn6
	bQM8rgQie5Slk9AK7t1VDpBa5IokhFqecy39zx39fdwQsUn3OhxUwY+sw87KXSNF
	qUmSoHJE2OKdy3QA65lEOFEySj/VEaSWqpjOEqejUzTR0yThLOe/HIBV5UN2G3yL
	7+ek/6+Nn0LjSQQtWSUf5zGKKybQg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012024.outbound.protection.outlook.com [40.107.200.24])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdm2tge2y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:56:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+M3L/diUx6yVGNZHEkaH6Xoq7ion9BOdlXd6zptN07oB20neI8TPCZRR1BMYNNyaJ3qfVsLwOQPrELMed5nxZLjyHYNtvy8CKCCE2xq6/o4QsDtne323NV246K8RXOfTf717p9x5ZhsTBbjWefW3/9FNnssUg322H7HYNGXZb+F2XYPTdXxbHGoI74tVF3m0kLCunonZKpNPlzA57IencwN21V9seTqzAeDYFt+xE3wPWi+ttr5KdN8pFNYCYckLUPm9cT4U4rpX5c8GvO97kcgkjWowMxAk/CKokebjNjxaSfVkMFlyhdkmssAgEESErVDVoiLxB4EmsjADbS7Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JoaxlNuSJdAVWDnDQlq66PcEPAM8IlElwmBdRLauUU=;
 b=hId6B5GWeFy8cQf9ad+1A5jvWREwPIyZYUMtSx9LdqALkSsOfZWsJPAYIPg6QyHzl/iUeOOThwiD4pUGxi1YgVOf6GFlu5jcWLl0l6vG+xpfycYkfaJ+bh2RzJzqS0qDZM6g19FCyRhVjv5O9z1vmQ//c4fmA+NSUGUnKL/3IyNoeEG3VTh04Q0z2CpIMnr0MkbK+GfPqVOTFbS+UIAv7OSMyJ6qpTayzkrq7rYWkLlozMaONnUE/cXZSwUu37CXjMPCpYWeP1Z4O0Bcu5syACbkfcNvsoc59xP077+0XyBJBSeKSrt+GCie/0iZfCuu+QWm8/3er9hbzYt1hMURAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JoaxlNuSJdAVWDnDQlq66PcEPAM8IlElwmBdRLauUU=;
 b=mMmRNS8Ff7c4q8PFCKQ112ZsttkFc58ZKqFLeTZt8h0NQeARZusxu7m3P3yCjL1i+BsnyhwHfLCUM56SsV3inbudBFGIIqnTJNOmcLq5POuUDYybInOBuak06aSAlViWCNy6yJ4MVIMXlSEka0g35VyshiUHGJvaN8z/G/DOe9E=
Received: from CYXPR03CA0085.namprd03.prod.outlook.com (2603:10b6:930:d3::28)
 by SAVPR10MB997817.namprd10.prod.outlook.com (2603:10b6:806:4e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 12:56:39 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:930:d3:cafe::aa) by CYXPR03CA0085.outlook.office365.com
 (2603:10b6:930:d3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 12:56:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 12:56:37 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:25 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:56:25 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECu8fY546300;
	Tue, 14 Jul 2026 07:56:22 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <n-francis@ti.com>, <s-k6@ti.com>, <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 13/22] arm64: dts: ti: k3-am62: Add DDR and controller node
Date: Tue, 14 Jul 2026 18:26:04 +0530
Message-ID: <20260714125607.3304375-5-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714125607.3304375-1-v-mannuru@ti.com>
References: <20260714125607.3304375-1-v-mannuru@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|SAVPR10MB997817:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a333f6c-7c2c-44a1-d165-08dee1a757ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DNm9f6SehvX6lh4Qj51PXCEfpSK3tzTQ6bZkkahBdI+bn0hp88BMuFvLMSEqxvn9P0LcOZBm/vc+8AV2Rv/0yS6sfb+etOtkh0lUCvSpRZAcPKuG/A8Wzv83mbpkcZ7Df2CCcd/eDIo4A49xYd+ZWZ/EbPxdx2xTk5PJe9uWoAvKhqRpuDYIXcKtUfb4jc2QCjzgqiUK2L+dqXTZFlTUsMgc21WrnS2uKVTmL0RI/IsF/YLV47Gn+fsCWfiebuHl7IQyxGcrO2KqDSx6qzxe51to5qLFMrWrIny9cFs8v1MgKdAUV/gzMIagpjL5A3K+E5HcRt3jM0OHQEpO+0IitoMpI47UvUBvTUqoOxpnldHOqMLvsNj8fP7Nh79FMZaYE8fl4Wpf4Y4Z5QnU5zi8+uOJYb/cLGdQYTuTmnbHSrRcJ7ERV7tWVGHCt/YkIItt44QtkHpEF/f/aW28uji/eOLf/cyD2KNluRECnBZev4tcmyExG8uYq9566uX8p6ya0gXhijU7hG2m+Q7N2uDLxrMLT2ppZxIpPVOkGSJWvrQye5vavnqIGcrKyNWNdRKeOclJfQTTPrKvlz8LAEOxpdAmwwW2PuXa7qpu92xofzkW4r0geYwHcqCfHvuwvqJ4qzgmbD+q3YCTuoHmXDvIuByLU+y33aazTtxpjUd9kX0lYhQeHgB4a7RmpLAwVR0P9BLqSYqWRB2+RMO8PvrhVg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3qwZKgMrPObi48ftqZL1J55TXMaCYg16XPdxmoH9FiguX10rnSNy34hWeylBVW8sJtUbImOZzsMVSEDc3ezcSKgl86ho3LROUSBEtxiW6MOJ2vpSDtBhkS4i8Z6/sg9xTkfi4EwmWj+8pGblrYZTB8VNzvMs+jI/MuioumrymhQ58GFrcFjxHTJrkDebckskYY2LfwF1SwFzTmiGClGf8n7UsMdLfnqyKLUJvIidtJSvX+06hApHGhxwBDKleVqLTQ24fK0uNTyJZCMKgyvlekkRVkF5cr/Oz164qMeLzHciIG40ce7V5+Q+fSyQXwWlpgG1taTMf2ockoqeHgY+IrXd9RHdxB8udCvg90LLRnm29aCQXROw4UmzQ9OIrW35nmj5PiuhKM2tb7GpOskqms6bDBldJurKRTjrWYD9PbXlHJezauhC9vW4qY6E+Xl5
X-Exchange-RoutingPolicyChecked: Gw2cr3dUNJ3vdv+3PLNwhcSKrnDe7XTmQGsibjr90Fr9WH1spdUgOcBdvCKYBVRaRPx2OTe4zKxQNq9DSps4pxJe/03WblHaG7R2DlPH9xHFWPnI661pQnlmHgjeTZk7PHiA1RhVZGfd5M9RiAY9SOxk6ZOXe7J02kDlwBUWymumL16ljgtp/au/Gk/p5qeUxWzK7nZ3zVfPzsB1U0kZ1zyI23gagBvfB6sk+3ok+oV97I5syfZjmylE6bVZVAFTEpp4jVFoyFFgpzsorr+ceU3kZ27fkc3XQan//CKabkkY/TsLYK4gbnujn8m2/I22tJfWoSIvVEDXbI4Wm6+Vgg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:56:37.9163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a333f6c-7c2c-44a1-d165-08dee1a757ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR10MB997817
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfXzhdwG2UhERVS
 M5mYgAsZIvMBuI3GiKYzX8CWg5PB1tGvJj3Hzr6QRVGGcTsWQ6EYId0EvB/xh+1zWL2808Ib778
 HEFcTAY4Q7+KUd3wLuu21cq1HBWd8b8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX+WHfCDP+SC7a
 lY7Q4SmpIB3cFoFj8kGp4LaPB7cin+SoVV/g06xwxbwbPItCGKDJayt/U/N0xe+G3XzD4FL2gPS
 Lw9IqaNi7fvP/D5CBpAsEOyp48h1BjEiUHxe4441oAwkT4SpSdANOMpy/4jqCF9l5CcEDx5gUQr
 NoMtFamahFOd4p7C2xHQZPgIa/b2RCLlqSjvRr43/TlqVp9c6f2ZSEYqxXLkTahv/Xch6DlY3T7
 blqfcXBQpYiNBgp5v4hvlNHhiY7cf0v5k27lTSAOeBO+FZhJCSP89I9uK8lSjhKf8pxYVW3EI2n
 lacfSpWvpfkKc6rpE/Zyvm7OlY6b2bFXbCPxL+QuhU/mhij64QDt+EhLbnrWkugWq8BNgj9yxhO
 oLo9XpjXJxlfnDfnIEqdKAwS4nDhay9PXLYLtDItcxx2CEbXAFh612CQ77auHmusa9iq7ePAUGx
 7QRWZkDf7XxGoKp18nw==
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a56320a cx=c_pps
 a=sWRNDn+RSbH+kxTJv0thDg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=n0X3zXilOsfpjfwewE4A:9
X-Proofpoint-ORIG-GUID: MdLuYgvz4u1Z2t2QClE-lWjpxcuhRJm8
X-Proofpoint-GUID: MdLuYgvz4u1Z2t2QClE-lWjpxcuhRJm8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_135645_626363_D8370DC7 
X-CRM114-Status: GOOD (  10.49  )
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

From: Santhosh Kumar K <s-k6@ti.com>

Add DDR Controller and LPDDR4 node for AM62x device. This defines the
memory controller with its register regions, interrupts, power domains
and clock requirements.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
Signed-off-by: Gandhar Deshpande <g-deshpande@ti.com>
Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index c5ee263d34a62..d873928c1bdd9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -1265,4 +1265,29 @@ elm0: ecc@25010000 {
 		clock-names = "fck";
 		status = "disabled";
 	};
+
+	memory-controller@f300000 {
+		compatible = "ti,am62-ddrss";
+		reg = <0x00 0x0f300000 0x00 0x200>;
+		reg-names = "ss_cfg";
+		ranges = <0x00 0x00 0x00 0x0f308000 0x00 0x55f8>;
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+		power-domains = <&k3_pds 170 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 170 0>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		ddr: ddr@0 {
+			compatible = "cdns,k3-ddr";
+			reg = <0x00 0x0000 0x00 0x69c>,
+				<0x00 0x2000 0x00 0x564>,
+				<0x00 0x4000 0x00 0x15f8>;
+			reg-names = "ctl_cfg", "ctl_cfg_pi", "ctl_cfg_phy";
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


