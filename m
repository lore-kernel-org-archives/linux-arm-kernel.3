Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1206C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4GfZCx/AOs5z/9uyqQWGDGm3l9R9Xg8cdca0IgfpDE=; b=vnlNfiO2ZSMjVy2OMOlOazSpi1
	N6WzZ/TIWURFEwrlS+lnZwZPGT8oFjUItbkHeUAe3zaapXCZw21xcX8Ts7qeBNfBl1hijPnr5O8+C
	JH4mbSLDRMTPviwQPMd+lF0GGNpjGX49iFN1wkWFf9JtQMYAN1FDgoUaly+CS4s4J3uRsrpuG+UCq
	1rf1M5BwWdeYDofNEuOgdVHfm+0mSSyNY8ntX6/f/87r8bG6wHt6Tx1k0PyQ7HO25XfOdRtT9YZZo
	hJV8SQC3l4EwCcURwSkj6vTeZLqYb+IuwnAdBoCYTyXtjCu+s1ZtkWqr90fLg9q4oS+gqh6lztUtm
	SeAfE1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjch5-0000000C1Sb-0znO;
	Tue, 14 Jul 2026 12:57:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjch2-0000000C1PC-1vyr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jul 2026 12:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/4GfZCx/AOs5z/9uyqQWGDGm3l9R9Xg8cdca0IgfpDE=; b=NDrzUsT6QZQcAWmGEln2mNijMY
	U5RBYnB6R2Rrc/59O5i32U76jVXu2LJy2q4/FeIzhUU+U6h2+ZUVfn+VMJIhwz8csty7g3M+uiAIr
	IQXLKNJ9wEpxQ1InidqAjS8xRSp2Bgzigcyhq4jVjpYCHIWCILhZsM4ueVKJv7RZp2Qi28akepBXH
	wc74Luq9c62LmmQPF1u8crYABF3XT1t6WlGqHAwDoGRb2VbaF+BOGjNRANxtEiCKmF9IAgl4uTogs
	fHcrXpiSxSXgbKaCN9fPl9CIv9g83ydADlH0mJHnEFxkECeH1Iwl2VG19+U8aIe4E52A3rupg1QEc
	l8NqqMNQ==;
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjcgx-0000000CVDC-3Jjm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:56:59 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBQ9qj2106428;
	Tue, 14 Jul 2026 07:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/4GfZCx/AOs5z/9uyqQWGDGm3l9R9Xg8cdca0Igfp
	DE=; b=UIa5Rf+Uk889NGnYMW+r0dxV6vOKqH4FBm5FduV0lbK4T/INHH2B2EzGu
	w6wKFaODL90NdbYY/xC590ct+ko5tUMQtbgIt6VCbPKiSD/cUq1kJD0Ag1LNxpgk
	1/FK69QzAENrbk1RrnVySQBcqppqk/H2Nnda/9HV+rAmW681aldWw+6WgoWdzZQo
	jYMgXht2N9MtbYF8OsglmD49DDkymi9ghDh1WYUBFx7QdiFF1lz8GH4DyU/qTjZa
	WyE7/d9jCf3elJft1LrxUNR2If9RT1/UhStDR/3Ag4aR1iYnsYqTfsjtJKaYvBh/
	9Hf/IN2pySssMyaxDxseM5PLZLTug==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010037.outbound.protection.outlook.com [52.101.56.37])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdm2tge3m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 07:56:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSMIFm60bffwYN4PPu+oIaud05c4Yq9LaiK9RM5fbupushjOnI2L8W7B7coEf5ffUg04TjMV1Pzq4821n8PzPOIgYhe9zsgcnj4szf6aVsDVIbe/cWWs/51C831MwOEYUz6fPRs1J6ZjGH9pBvdoHIdPiF/m1t67csWn8bAKnmI2VIyIEe+91LhqZITGvduIfa/+aFj3WdN7Itch+eMIFOp0ZFrfCQ57FpaJ/elfzAFE81Mp2KKL54H0ObVPGt72zZcErgpDzf6i1NbZImcWMq30z6cXEzsW0Aw/+nJF3sbvS6qs4t1vpTP72nc7w+zuQuWccfJ0kHGhvEIkltLrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4GfZCx/AOs5z/9uyqQWGDGm3l9R9Xg8cdca0IgfpDE=;
 b=cOKyUas0Y2Nt60/3ICtzY/6zKd5EtEio21d8O4kyzrxhWPy02dyVPqYbdlxWYIPOjlAaKlPp2MW3HCQ2kP6UEFmCFje+R+iBEBPKFAzsBLtDnbZ9zxjATveqE/j+U4T8LVzwlagMlgdt7hAPuI9d4rgK5elkWmrNRnAIGJyMSnqvYXKz64Km0I84TnSzCNVp3DtHmngBlsFebln11cFIouDrXJe4W8Hjf50aDVUYiEFs80RquVKNESEF1bpA2q1DedY7RpfehuRHijaw7SjGjHs1x2wupW6KbVkUnX1y8k3PpE85atFPgFcvgrA4L3TeelP+3hag1nm/kyyp6Sdexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4GfZCx/AOs5z/9uyqQWGDGm3l9R9Xg8cdca0IgfpDE=;
 b=wNacdp6ODUO5vX4GmqwtGL+l/e9ywVxxoFioMVj+VRyyjZgUMem4x86Y831wNOBUjhboGhfR+ZZrFrtdtoXfkBCfh/czyDs20rGhWA/YlOnVgk3rkn3PLrK7G39Dr7M0UjeTHbqFptLdG8CTeBZU2heMhvTCJg2YMFxGSPRp2mI=
Received: from DS7P220CA0069.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::35) by
 IA1PR10MB6219.namprd10.prod.outlook.com (2603:10b6:208:3a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 12:56:46 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:8:224:cafe::91) by DS7P220CA0069.outlook.office365.com
 (2603:10b6:8:224::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 12:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 12:56:45 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:28 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 07:56:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 07:56:28 -0500
Received: from venkey.dhcp.ti.com (venkey.dhcp.ti.com [10.24.53.161])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66ECu8fZ546300;
	Tue, 14 Jul 2026 07:56:25 -0500
From: MANNURU VENKATESWARLU <v-mannuru@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <n-francis@ti.com>, <s-k6@ti.com>, <bb@ti.com>, <v-mannuru@ti.com>
Subject: [RFC PATCH 14/22] arm64: dts: ti: k3-am62a: Add DDR and controller node
Date: Tue, 14 Jul 2026 18:26:05 +0530
Message-ID: <20260714125607.3304375-6-v-mannuru@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260714125607.3304375-1-v-mannuru@ti.com>
References: <20260714125607.3304375-1-v-mannuru@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|IA1PR10MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 84039d88-4fa9-4d0e-c96b-08dee1a75bec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 9pLHkPgKEPOjsqKkmxXJvgOTKkw6Ymu2seXqdZ7L4duRNUqBbR5kizQo8d8kU9RDZBoNpJsehoESn1Ha0YTBlRc3IRiEhy2vgrZzazVG3vZvwkV85aGQ0HfVqkZBR0Vwv+XUi8CLnP3rihmIgXcJpVWCt06R9Jan+PxtIUAOEv5vmVW82YZNdo+TLcHy/qJUYCWT7HdtAA5SKxgEusenl2Yb7v6hc9sA3TO3L1svCYr2fb46NNfJfMvQjKUJj6bQ2InR2nWhZAS7M4mRdHiL971OPdmYhkYmS63LwplyWaqfGl+bZ5lH7lpl8i2jyAIT+X/UwSSDXJwSFz5wgZvyNFKu+7iz+xVgY54MUxaQR+EIaJ966JdpiblAXxWS9on8Y7szQXoxomphzeuQO/Xiuxjn72zG21Pz9Fw3xcWIi91bNr2CsEzLM1PFzSOg+E2ohMURYN/L9Gt426tA7NSLKHl0mnWpZ7doiGjTST5ayAJcazVpJqB6rJ9jlEVXoyYKQzefeqRP5FT42DH5I0/GyDNKlU5alEBmd7cf0h0LIagoPYZlFEY8zIBv1YRkArOi/fc6cIjJ8+yfstW6z1ocD2uwO5gRrUMZXf/TsqQl0gWrmaL4J/2TuujoGgzS0V/1p7l/QEy+i4NpFTvmvLQRZ1y6fBED4YcGoC4T88p194XgffaZJFEfQ1+cghPm/taFQxWFd2DtXu2piApy+fmQXg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5L24ZVmwI9Vn6mgtBIVRR2WPCy5opxaSdEDsJq8WLVncCQRkUhgor/K6yxmGdLhXQTssDlCQG6Hy4LO34GxjOXQUu9sj+gMwv2+hYYYVlVqxBN1KvCMfssW8m0/95eqKRNqEh2S9fj30OR1E86tYS9dUxfThdyd4PsHmDvVugxTx4aOe1feblokBAsvcUSAI9EFAGFdRA4aCEy/JeR+JZ1u23UJFrWGnYT5xCFXgq8sadTv0+4esGG1Kr2gOrQsIDrU5i0EsCLhV8pH8yhmrqledjJ7eU7sgRQPGCJsosUcY0kryxkwMZi3ALy56HTNV+SPpAGiTjvaWU71szGnzeTwApiqUvpC4LsPqsOlPUVJYAWxDRShrqJo7ZMe+YA9IXXg60T2dKoZeRQNMv9NQEyhU84wdNK4ueUWckiAdaJ5DGo1h+OUVTdzxV6TAVruh
X-Exchange-RoutingPolicyChecked: oUQZEdVTXhTZUhGFYjedx2crysK5MTILntvdhfjIwLoJ4JyjvWO/UAECR3qo+Rh36VEQYPx2/XOyKOABIDmYvK16695YUMn2DBrfxtp1/esIHGZIiagvyevK8SDniENmm4NdGNXCXISOvntfPUpWbn5z3wgQGf0RPcu3Hn2/1s2ri8PNuFhse9+dknxY3Dqb6TXuOiV4SLZd25p5TqcE9FVghzjAlgN4Xfh7MO354mTxJeK9RgV9uUbsdvofbnrErbBnbpRMaGxzeOktL6QzTmfcqd7XDnXgEkViJ5OveCBmc5tlKROI+TftDqY/1gKIxW3pv6ZRviJAE2v+LLVIxQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:56:45.0192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84039d88-4fa9-4d0e-c96b-08dee1a75bec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6219
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX75+p/ZOknfRP
 LtdblQp+Sa58n0bKg+hpXxxdbtcKCb7RtwMG4PQl4yzUnzcNgZGfF8889NYB2qFszp/vppnohYm
 z3woRJYVTqQOykM05xSfikIC0bjyKmY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfXxUgE8PrmUf/w
 XEunc79AtolPX9+YcNg1Cq5DmJMhlyNpUC6RuzUEEu71O4QhEDcCNZqthfBSIsOCW5HoIGW7rCj
 vkMppYZPIoZUaQAWjPHmUXlF3VbyY1yzgyJgw5oZm+WxyGPVw5beiZYxdfn28BW33tQTo7TjBd/
 x0Mob2QlUyykIGihxw9o2u4ghYipZ58Yt6ypFc4vgUbSGZ50zhrmRUZNsrerFu9Jxc5qrEuHQ6a
 z/SJd5cLw3k7QIkaK/lipvpSgCBbFYD/yrHcnkXqW+/CmPbVr+jqMhQqKFYpifsn4JYbjuFt6kC
 V9A/QJsSima2KPaxSGg//Ik57M6/HYhbfZxiUinqNcRuknSrd3cqnB1E9RG7J0GbCXucQcHZZmk
 knMsZvyU9MygkamkYHEloa9lvFf7jfJkO4zLQYEErj+wmaMhPMLnmf43U3V45xSPdjDZDbuauob
 tPF7dJcB2g5pUT8YNMA==
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a563213 cx=c_pps
 a=+7NNu1siU3MXiwb9s73WHg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=ZgSLTLv9cJPNMRD4accA:9
X-Proofpoint-ORIG-GUID: y7JegDNg0e1JihO57YvzuSZvm56fLfpg
X-Proofpoint-GUID: y7JegDNg0e1JihO57YvzuSZvm56fLfpg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_135656_444932_8559F57A 
X-CRM114-Status: GOOD (  10.40  )
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

Add DDR Controller and LPDDR4 node for AM62Ax device. This defines the
memory controller with its register regions, interrupts, power domains
and clock requirements.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
Signed-off-by: Gandhar Deshpande <g-deshpande@ti.com>
Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
Signed-off-by: MANNURU VENKATESWARLU <v-mannuru@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index 9e5b75a4e88e2..9629b790aa25a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -1172,4 +1172,37 @@ e5010: jpeg-encoder@fd20000 {
 		power-domains = <&k3_pds 201 TI_SCI_PD_EXCLUSIVE>;
 		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	memorycontroller: memory-controller@f300000 {
+		compatible = "ti,am62a-ddrss";
+		reg = <0x00 0x0f308000 0x00 0x4000>,
+		      <0x00 0x43014000 0x00 0x100>,
+		      <0x00 0x0f300000 0x00 0x200>;
+		reg-names = "cfg", "ctrl_mmr_lp4", "ss_cfg";
+		power-domains = <&k3_pds 170 TI_SCI_PD_SHARED>,
+				<&k3_pds 55 TI_SCI_PD_SHARED>;
+		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x00 0x0000 0x00 0x0f308000 0x00 0x5e10>;
+		ti,ddr-freq1   = <0>;
+		ti,ddr-freq2   = <0>;
+		ti,ddr-fhs-cnt = <0>;
+		clocks = <&k3_clks 170 1>, <&k3_clks 16 4>;
+		bootph-pre-ram;
+
+		ddr: ddr@0 {
+			compatible = "cdns,k3-ddr";
+			reg = <0x00 0x0000 0x00 0x6cc>,
+			      <0x00 0x2000 0x00 0x6a0>,
+			      <0x00 0x4000 0x00 0x1e10>;
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


