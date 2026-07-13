Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E20C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQyOqp1+kIZAnn0vO/JmBO2ZIcBlzCsfDwGxPiU9yqo=; b=wEJGQcBDm0nkE/BKoCKpqYr2rg
	2MhDAw0h7AZ3JJJvnuQzn8hGOu/QDLAkXOD93Dz2orqm74T4JIj203egOLv9XE6Uz/OZSnTyXystu
	Kwe5K7R0+s6QbBfSgveJqWyDC4jVWQUrmpH3nhFj9gtbAPgiXFLhnOuDnpYWmFomklG9/WJ33DLgZ
	hdwQlqw9DiQEWla/O18w5gMnZSphlXRT+H3ZGm20RBsidGiW1Ul/dTBsIonyIO1qMdqM0Ikn3KN6p
	Zwm2yAXi4YMuU32Jm+xcDMjvVHDJCsQKbKGdnEL5Gx0bTX9n+4dx+fDcWF0nAbv87Ljlk5R5C3a6w
	ntlj6x4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDxz-00000008tpt-0w0D;
	Mon, 13 Jul 2026 10:32:51 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDxw-00000008toQ-1Evq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 10:32:49 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6PVWa2802156;
	Mon, 13 Jul 2026 05:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tQyOqp1+kIZAnn0vO/JmBO2ZIcBlzCsfDwGxPiU9y
	qo=; b=m4kM+YaXaFm5GRdLfa421aYFHeIpFVwj81QbAAbjIfjnnEShj03nSj8Zx
	sbS6P1WumjsxcoXS57M0iZumVSMmJETYqAJSWgkUqHhexyjsAYrILGHi/SkSG7p3
	in6feJWunoTN4aU9IelEUWS8UNXf6bZyiwq6Qy6qr/awyhcOPmpbPlmE/JJgr6VW
	n+0pwbJjIdbH9Hwyb2IWJzTwWIyMXJmk9rl5svSp0yj/mYWvStoQLzk5vq1rfH/I
	yJK6udAIEPZuoslIFuVBwCtQChu303jkXW9LLYTDstezJHeGv9O8a7T3oKa3Jnup
	fKzsppru9aGWiKQSFktI7P4FNGdtA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fc4ypwfm4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 05:32:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCuW4dBi4gJ5h8sbmWtpyyPF4qyqULfBOcih86TbjtkgM3TqHgUiz9TrMIPbDpzm0a2oEbcXIY8CfZIOKgcjY4OWh4yRyC3L/JpzpVHPbdyIE8gkAoSreBUDjN/9cJEzNtpMiXWyGfsXMpHE4aGB3NRfyBW/0hF5IyqomOZWj0Xy/cSDuA+B8coxSKsfbt2Lypzw3TdR4MXFnb9bblgJ2wOfPLOgRHILcs6LBN2oApgsTSYkpl6dAlJAR7UcNVPYx67SYAd8A89Lk65uFsw7emSl/zfWlV0edwczsh+P0nJvpqJX0jqRsZXanqiLJcMsckNJUGPfNXIzLkwWDIoIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQyOqp1+kIZAnn0vO/JmBO2ZIcBlzCsfDwGxPiU9yqo=;
 b=jaZTtiV2QR4cX1ujOoSgBVd5bxZUu0n75C6rnIF68i3X4f9ldyrT3Dkip6SHoFZVw5nYhqei9k3XHUiohfAI/eBAb1qPNc3bzBGBhybIQ0njjFUNEiqwSpUBFOhsQbEZAqOJWDz/OHjEM4zrRsth036eg/+iF4EPi1yAueTsFsUb+7fMzo0tD5CgTu7rpXFuLCvJZjkpQnNduWEZoXFV0U5nIjelZVLx4pNHwKbRiTP6zchhivZkWe2yAh2XstNNiZQ8kUkDZWO2h5wthGNWQOLuXluM5taCi9LJUpWWRJKzeonbNa5GpzJhVGM2er8XwBEfO/5kv6RTzYGZ9MPY+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQyOqp1+kIZAnn0vO/JmBO2ZIcBlzCsfDwGxPiU9yqo=;
 b=s8wAucDkAmkAq8SD0f/+L8UxnZfvjhth5GlTyKqigfHcdsQ2odNAbHEWt5HfM3QMOCocBkD/J+X3Zu2kjWsL+iDcqAA9CVOufHU9exp62106Kk8qHzwI09L3dfhafdvVhPmoQRa2XKn8OEl2PW/lUZMcmZUyX6kt2iKwofYr+5I=
Received: from MW4PR04CA0249.namprd04.prod.outlook.com (2603:10b6:303:88::14)
 by SA6PR10MB8040.namprd10.prod.outlook.com (2603:10b6:806:447::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Mon, 13 Jul
 2026 10:32:41 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:303:88:cafe::41) by MW4PR04CA0249.outlook.office365.com
 (2603:10b6:303:88::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 10:32:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 10:32:39 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 05:32:39 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 05:32:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 05:32:38 -0500
Received: from [10.24.50.130] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66DAWZ4s1946246;
	Mon, 13 Jul 2026 05:32:35 -0500
Message-ID: <531d7396-c581-4b5d-8008-db5e9ee5e7d6@ti.com>
Date: Mon, 13 Jul 2026 16:02:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: ti: var-som-am62p: fix Ethernet PHY
 configuration
To: Stefano Radaelli <stefano.radaelli21@gmail.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
CC: <pierluigi.p@variscite.com>, <matthias.p@variscite.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo
	<kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <cover.1782680023.git.stefano.r@variscite.com>
 <4d1ba0d1b9bd4957224213cf17dca93392788e03.1782680023.git.stefano.r@variscite.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <4d1ba0d1b9bd4957224213cf17dca93392788e03.1782680023.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|SA6PR10MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e14a9d-4f78-4eb7-bb3c-08dee0ca107f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|13003099007|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: YY+h3J6GrgQQYKBiTITnPcEY56T6HzpkhE6TKBzK1l/ngV/lWH1A0CfCnhJ5YAsBemY22l508Gn60nqxrbZR41suQe+Nl9vaSCYxGnqGt4iLK2gyBaCoXx9e5kRzUA3LWWeHqWYsrcV/YPM2S1hTBOFhbzqFTDxofwYZwLJggPGRyAWCrBDufvs72yNNY4+d/CtzPK4XkzlyXR0YDFLgK/t7BNePu8sjurC1Mfx9BkPBHDRQlSrhfHWpx4TznxwT4t1JOAaH45iNWjQfYwZtlBH+kMtRl573FgIlNSpuaY5hAEtxBbve/6yFSVQv5E3Bb4tneUOnucU+9TTgU2viBUVAGJaT2ULoqAP+RqucgzRLf56f9gQs3BMdqc8heRLWy4Wz2L7g8+tV+/sZNSZjCJD5JoMQ+tzvYNVe894vijdFu1sONMbfLi/FDseUSiN4MezhXqDre+EYSVLSkfwWS2lD2t4Ir2q6W8qD1rkCtLWF31sO26RZP8qCcdB5HtlNuUnCFLlEhpGKCj4QjhyYMhc8IB22U09nTctdd5kVAq+H+Kd4Gqx59Y7l90iTWgfj7/te0aeS0+AWlEqy7abjry4jswDc2dXhkbKbCUIXr/Iv1cOF2CWWv+tt+1dwReWn6/r2D/9Dgql89utunQPbRSKCIA1cZYBzKII9hyfLi4qLBo+oGaYtARZlihWdhJaVg8ZhgPT5wrMZ910RE0UFyA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(13003099007)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uUY7HO3YHkuqh/n5hbtO2o4DMjNE1IJ5tvKE3UjD4CItUVk5Szpkv6uf9cZwO9ZTa3MpsmmgCGpmriJXem2L72T6gGS2JZBaQMJ3s4PgVEhF6lsYecU1Wt5emJg3IxVIxLZ2WzzTECnkWURz5Ckh5o0HAtiechhRiED8muKD31UHTVVvNce8L97ZfaYsPEd9+488qm6BTT/tfcqLFkzeYX73hMG5TlK9x9nA8uLLJ/zevnYeRzxnnq1RzRK7xoZv6u28N4J5F2GVqJH3cTkUGHHb5UGxdatYrznLGntKUR6vrvuff2IVkUN+GwV/zs9nhnwujj9UvWGfLJDQsUfxHloaYaOWNha9hdn46j/At2xwI95Mggw/2rPrBMrqOzHN8c5BCkqpHl7t4xMqkWxEcW/1DgUTILu1YHsFZTzslzL7fsTXO2EAIuO+xXLi4sVe
X-Exchange-RoutingPolicyChecked: YAVhYHv6/mwwrzMfYXxqBPLxA5QiBvWeJqeIK0C8oOx2fg2nOXdwRtjhTcL5oKHU3o9XBwR4NAbV/lqXVuvI0KI7ogdDRsNgTxjmq503JJusXts5JumGnPMm0jZzzkdUbFJj0fCMPqjkbJeUMSirMch2CgO4KKl+/gnwZDKtl6YrsKCHhZpUGoWtfgNoDmVGlRtH/OvisUvcMlaCv3rneN/yqaXp8Sc9DS/cVDf8RFeguokI7T0u2/AGpF/i9mwQGugJQn/moJo/4eym05kvCET9mnxawqafgv9p4Gp3FSqUwQrZcwDGi6wSw3m/pLcFbxP+4AaWIoZiwk4B+0O0gw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 10:32:39.6611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e14a9d-4f78-4eb7-bb3c-08dee0ca107f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8040
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX8H6QwDvQsuNL
 AaLFtSj0g4pbr8LyPd5RshzJs1o2hBfTg9OQwpLgH2O4BYDSlSAbRc6gHB4KXMzzCXNaPpvrdn2
 Dcnzctu+tWn1qlcjrL69G39IVBGDN1LYqhyplhMoIrw1G/u5h2N5ig8KXJAzYpFzHDblEiBbM1y
 juNmMzqyo1saU+QK4KugIFuGVUtjXPWs4vrV3onTfphtCGNdA5PAungpExczhy7vHPpPcSJtU6t
 E6QyuE5kOIRtwSfIRYdcV7W8mMb+lW9GKnamRiExa7Lcm//I/Ja5qgJsyIlEL2wFZNRVUDUI1yA
 YxzoOhv2nUvfWfVP7+eytBHmhwfc+zUb8BCk1zWpT7iUNSSeWIpNR/UatacR03o83gmibSdnDal
 YzSkgYJV/eB9iHpZ++h29VY09arCpF3WpP5qqkULyjojOwvnb2uvjz0nrijuVevqauPFlCB8hfI
 ASBYJeG5vd/W9oUdwuw==
X-Proofpoint-ORIG-GUID: LNnKdTT3DQeT74D7zZ461ovxATl98rzO
X-Authority-Analysis: v=2.4 cv=YaWNIQRf c=1 sm=1 tr=0 ts=6a54becc cx=c_pps
 a=uRUxjcjQKWf8PwUSRA6o1w==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=cMDUSdu-AAAA:8
 a=TZ_73hOvgUTWyP9239gA:9 a=QEXdDO2ut3YA:10 a=QRaI_VI5Kbc4sAalow4w:22
X-Proofpoint-GUID: LNnKdTT3DQeT74D7zZ461ovxATl98rzO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOSBTYWx0ZWRfX9dbno8fhWaV2
 m8WIhcxNoxWnV9ImSk1a+hdK9+JH8a+TbguHsbRkMVdJsHGKiK+Fyq/A2Yozr2c87BnL+3fEZWK
 4AdQc1Os7wDtx5QdKZ0s7p4wB6hJx2c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_033248_455518_666A20DA 
X-CRM114-Status: GOOD (  15.73  )
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



On 29/06/26 02:26, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
> 
> Fix the Ethernet device tree description on the VAR-SOM-AM62P.
> 
> Enable the CPSW Ethernet controller and correct the Ethernet PHY
> description by modelling the PHY power supply and adding the required
> board-specific PHY properties.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v1->v2:
>  - Remove unused eth property
> 
>  arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> index fc5a3942cde0..ca2483a04b9d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
> @@ -113,6 +113,15 @@ reg_3v3_phy: regulator-3v3-phy {
>  		regulator-always-on;
>  	};
>  
> +	reg_eth_phy_vdd: regulator-eth-vdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "reg_eth_phy_vdd";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&main_gpio0 46 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	sound {
>  		compatible = "simple-audio-card";
>  		simple-audio-card,bitclock-master = <&codec_dai>;
> @@ -149,6 +158,7 @@ &audio_refclk1 {
>  &cpsw3g {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_rgmii1>;
> +	status = "okay";
>  };
>  
>  &cpsw3g_mdio {
> @@ -159,9 +169,9 @@ &cpsw3g_mdio {
>  	cpsw3g_phy0: ethernet-phy@4 {
>  		compatible = "ethernet-phy-id0283.bc30";
>  		reg = <4>;
> -		reset-gpios = <&main_gpio0 46 GPIO_ACTIVE_LOW>;
> -		reset-assert-us = <10000>;
> -		reset-deassert-us = <100000>;

So are the reset delays no longer required? Or they taken care of
somewhere else?

> +		bootph-all;
> +		enet-phy-lane-no-swap;
> +		vdd-supply = <&reg_eth_phy_vdd>;
>  	};
>  };
>  

-- 
Regards
Vignesh
https://ti.com/opensource


