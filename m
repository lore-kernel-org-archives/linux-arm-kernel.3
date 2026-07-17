Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091BAC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDmjQSd77LmvXwhDhxUbn05kco3sTHCVrROmU8xMtHo=; b=gF0loTndExAMbANUkWM1kKOzxb
	NzkJoyJRIVYmDXvV64H02Y1fis25lpV7/IFXgmHIMw9NMzXKO+DinaEmXit0UqXpzKymkXdFfQ/jz
	+3xnQk8zIYZP8r41qc9MSYPkdo/+HM+m5DtWCvv0QFWwrdsYf+ceAIcB6eAEkEqxhzlrWH+EAKBcD
	DBClOGFA6iLlWtrM029W94FH3nA2ZNxGuKpiBfUIOg9ZQ9g0A4p+9oXl+Dy8Z+ZReuX9FcY2a6YBh
	xyFZMMwP3+eA/N+i0beKM3IU4s0AfgmKOs8qJtCurJhFFTdZKVPy971AnPyvM79DjTWhkvzE+CRr6
	nE1HJh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdzk-00000001eLw-3I8w;
	Fri, 17 Jul 2026 08:32:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdzi-00000001eKq-3XLD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Jul 2026 08:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eDmjQSd77LmvXwhDhxUbn05kco3sTHCVrROmU8xMtHo=; b=X8L9b0i490xV0fNsfvqklj1R9H
	terdrqRLKV8c9fFxaZAPqs+S0IjekDpFSuSYvGdQwioXNslojBBhT6vQ+eKltlbBaARSqfYALHCQG
	/XHacR13QRada2MzvPigqw8sEU0zJ2odCz7IwIONk8yftbP8FmQmbFVlaKxGHlXf+Lpnz27Cs2ZV/
	c00tBY8bh5I1lpeaRyb5fSN8UxBYkR8AVV9JeWzJhWuKxnmz/7SMoapWL4TfHaFJ70JUPplZU8v0u
	AAJ3XldQJwZMt7TSnaB6BYpUQss/iNM1iVra1wSVVK8HtLYLlnGgUKEqsC/oqIbigzWE4Ff8hYpjr
	pG8H57fw==;
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdze-0000000EfnR-1zZo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:32:29 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66H8JVMd363326;
	Fri, 17 Jul 2026 03:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eDmjQSd77LmvXwhDhxUbn05kco3sTHCVrROmU8xMt
	Ho=; b=eATylOS2qBZxh9QEiscuRKmO0oQNeR4W45zWZy6/gSZoi99rj3BnsAUgE
	9ZBam3SDcVZp2gEBPtf0jchfUna/DVWUjiwkPiDq1AJQXUpyVkg9UhGNij9fdsyu
	l0OYqGcqFUSQjTQvZEGmCfGtheBOlJFWwhx3ucKX6WPaOxhhO1i6h4nxbD80mPSQ
	trLyvZXaLONHpDsm8MPIjaZ6JHTyMa1rrx8+ULRGj/vjWFpTcZlKnpXeZZMr97df
	FL5RhOaszKwZV5JEjwd1s8fGRYBIkSSh7LvdOipzwxpdI9bN+2msZNZFh2M5PklI
	2v0RiXofToIbs6SFKKRoYkriKeQ4A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012012.outbound.protection.outlook.com [40.107.200.12])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ffgsm81x9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 03:32:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRzG5hn7IGWNRN9YjiHb9jM2uDrompuTZQdG22/u4BEkLYGruQedPtMjTnERCowpEtNSi869slOPqdTxuXJSXycGVBOicDxuIF7gJzdRNFNA8Sb+cRCmbVuuhycg/95tWcBo+6o29XWA2jsBf1KODJ3c9qldrCzRxMAuYwM5KowJ9y2T+YDXVPyp8tH8RsfmR9DstjTwC6n3wVHEr7Ce3fIIYQJ3IK3/xAEVg6bCBNOabKHqw6dLBcNFVKBn9HnCnVOugp8Aoi4cFQonsOxy/0et2xK+EBSALhjyY130C5JBGNg9cY10W+0ogazkLYTZJqcafAHezpyBp+VUkq/WgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDmjQSd77LmvXwhDhxUbn05kco3sTHCVrROmU8xMtHo=;
 b=kh+kmfL7brmV/szfCH3Ix2xFyiRd38zKlbKCrjEvoOa+HcQMGvKPLCfo07lc+NLwyHHZkQ8QWsRecqdU5pdLEW+0cxAc8j4vavjKjxvjmYT+ZiUoR5u/Y0OAJn8p4uKAGeMUIhXkBDH6pIc5preAVTTTG1j5pB3eFaK6+6iBBxcl4kEuhccOvVBr6//r+cK4qoWb+mocspfQkxLM5kyI98PyHuU978EJ5waGDLPHl2eokJVup9+a2tdMs0w/1Z85j51Uo0f1aDy3TpzFU+FobIPAjDZH7ND4KgWhN3/rnm338GQTAYxQ3SrGVoZyuqihN2CdIbyjnG+XTYt8b0pHMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDmjQSd77LmvXwhDhxUbn05kco3sTHCVrROmU8xMtHo=;
 b=gNGdMKyXOpRf71nQynm358XMyZFJTJiMBYAZ5BIkWe0tgxLZztul/1U2+H2QHsYog4t3LXry1RGvUBv+AOyI//ULeaVhjWSAtrTbEFc1MKIQWg5UU9Op345EqrqxQXbPxI83Eo6fL8QFI6JzMm4x9WZb8u0ujohBoTi8IBvpgP0=
Received: from SJ0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:33a::21)
 by DS0PR10MB7202.namprd10.prod.outlook.com (2603:10b6:8:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 08:32:15 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::2f) by SJ0PR03CA0016.outlook.office365.com
 (2603:10b6:a03:33a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 08:32:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 08:32:14 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 03:32:12 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 03:32:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 03:32:12 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66H8W27I3390257;
	Fri, 17 Jul 2026 03:32:07 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>,
        <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>, <m-shah@ti.com>,
        <sen@ti.com>
Subject: [PATCH v7 1/2] dt-bindings: ti: Update audio-refclk binding and j721e system controller
Date: Fri, 17 Jul 2026 14:02:00 +0530
Message-ID: <20260717083201.1887640-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717083201.1887640-1-m-shah@ti.com>
References: <20260717083201.1887640-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|DS0PR10MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a23f38-3442-4404-091f-08dee3dde7c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|23010399003|36860700016|1800799024|6133799003|5023799004|56012099006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 52BLvbjSxsPqN8nRaXCDCXu+umRxMNOdfycNlSR9MBOtpyfI1T21Nx9ZRlWzCnbu6OZEXDqDgWpjVq7sveL0TGoeSYVM6bfEN5kQdpDrn7uPvaRlnAwPnuaTNvbNxoK/ocelUVRtSI9peuZQNQfKu3O+VrgK2xl5BVh80R33g6VFeL1aAfbzFFgLghfdWP/PblYN0AV9g+Ob6zA7/Ph5jmnKctoEPYQgjgCfkQ46ROBOjpYGCJ0BHbxJbqT4miSgGzYKUPcqp+/sjbFh+8KaZI+Syj3oFAOondn6TKNMpdk6k+3gybRakQa/W3cDqjY6I29t8y5ysdrUim3jm2z066LHP0CmypfEBNzWT5RBNEozCE4hNjYXS3h3XKrehRTC6W16dfIOOaaF9+J6bAFF28KcbMA3MeEGhilhFR1oDhY5eI/nnEU4XscS9u1M4piHMEIu6PbrvItbaWM4VNM09tfl8GBV1OehQkjbfTJ4arWj+nNISN9nipmwaDKrav+MguTfVNv8INW7FCcFo4zSDjXV4g5FwoUXgRmse0KiInJzLFZLvSuhUgGa3pfMdWKT1xFxE+HuLBlFVUQA6CJFW19UGHsFaPEPr3BeGU6BzDCRCW2slFPeVqsP7kacc+mb/7TEac+ev606UZmtIuddPTy9gDUvSS/1hAUH48b4rjpftkPDjNRoTAx2m4djC68Lxvf3++80zBods545dp3nYw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(23010399003)(36860700016)(1800799024)(6133799003)(5023799004)(56012099006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ihcAcQgj6Bv2jVv8CpbeqqYGpiNO5W6hhGTzYvsYd61RxRRrYxiNMkdteGSazlOU9g3l4THxBBopW5oYV1LJA83bPCQTX6Vn1u/pYkPYwGyqe08a/e7qTFTouIxGAUoB4r+lXzOy38A8KPlA5gh4nOaOarNnlC2kxxFWlTJVvhJ9nt7ByigVZSHg0jmRy42AO1yhvKvlCvRhlsmUsgQZhAHO3rQfmkkFIsFxaU7kyshMjbGRfhRus+e2E7qcq0oSTqtNUkt55OJxaskwPRuyJvtADASaNN4fA0BeIzyFDVZvc1FqJucwnxf/rPaQx9KOiILUKKJ6+aBvw4xOTmzE6O8uZhRA0GSIPEx2uDpRbcWVtJe5X3+zXd8lL9JPwoKv9KHh9Ouoj2irvusGg46nAVrsBtq5uLEcfaQmsH+atKbAPRYbWgrvGlFEmdvA+zGA
X-Exchange-RoutingPolicyChecked: sv7K2qHiI0RbikUUvykKku8XJ/6tb6kdUqYwu1Y6AUFKV/w+w3TOaf/1cWdxcQdeA+i1MWEs08SML4g6sGE7s4rvDNZmGYllAJtwuZ7jhbJ//O6U12oIfVjxHjswwoX9jacKamwG74qoa84vMqecR4AhJIMgGwpfNgIQraFurOVO4MMw4AlhnSzBwPAYr/84qiqMLxx8CQlgZeZHJugMGlltZispCPTE2KK/EdDFuS36ZCui7JWLuM8GY9M8IrAEgovwVwzoTZKhnnv8l3zmkm3nju3XtBbPgYoNTobnM96tHgpioVQX6mMgFDEPdFunVjcj6cyUsLQ5KWnBfXlQLw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 08:32:14.7794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a23f38-3442-4404-091f-08dee3dde7c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7202
X-Proofpoint-GUID: LbAY5lObaVeOR_pEfJeLP8a0iYknrah7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX2hXp+IX8qg2J
 YcCb/yVJ+/wottNGa9AFD0kXjdKnErtDThaqDOOc9n054DGko56EHasy7QutvW52U7MiaDQYwWS
 g1XBjrpII/b9xhnD6asp6IeL1nDtWiJ8iIT2/nm9OlZ+0OiR/wV54HkvxIyUlUfT7slQxT9ZxSH
 SHAP4OVRuVqw9PLyTViUDPNtzhq+Z0WBMCdIFcTs6FgjbdPEupNJ3vwFgiUdyyY0ZM0Ocd2nlT7
 HGxNYyWWQWfULXla0l+feH0143JOWjd+ivusr6JS5Vmdr6yA9fXpOnAWIelWwgxddQ5TzNBlKYg
 l6Pg2BKzoVZcRCYzE4TpxT6T8cfvxJWBFyChbhpNfRAX4pRRvKrEycXWUde3l3y4+yNtB54T5Dh
 lTWsaieRxyS+j+W5R5vxDGDfZqa3FyCqsUfK+m8Rrv1GFPgbWrzowjBaZ4/U9eDQMb6/DJH+XVj
 /hFPYxN/+h14v+Dnldg==
X-Authority-Analysis: v=2.4 cv=GJ841ONK c=1 sm=1 tr=0 ts=6a59e893 cx=c_pps
 a=dctP2Ni10a9Sh7weZd+SyQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=o73yBMAOqiBwH8_aQz4A:9
X-Proofpoint-ORIG-GUID: LbAY5lObaVeOR_pEfJeLP8a0iYknrah7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX/Ns6wCZ582Te
 P9pA/G85z53ak1YJtp155M5gaPOaErGMNevof0+Ahq2WPNiKQblINZwOXJ/nOs9SqvEVyOrdjYK
 mXIFAdA8mg8bEIAULdvPHlvIpuHUx5w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_093227_446448_92F0D6CA 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

Add ti,j721s2-audio-refclk as a supported compatible string in the
ti,am62-audio-refclk binding. J721S2 uses the same audio reference
clock IP block first introduced on AM62. Per writing-bindings
guidelines, the J721S2-specific compatible is added as the primary
string with ti,am62-audio-refclk as the fallback.

Also extend the ti,j721e-system-controller clock-controller@ child
pattern to accept audio-refclk schemas alongside ehrpwm-tbclk via a
oneOf constraint, fixing the alphanumerical ordering of $refs.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../devicetree/bindings/clock/ti,am62-audio-refclk.yaml   | 8 ++++++--
 .../bindings/soc/ti/ti,j721e-system-controller.yaml       | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
index b2e40bd39a3af..6c8fb0793070d 100644
--- a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
+++ b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
@@ -11,8 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: ti,am62-audio-refclk
+    oneOf:
+      - items:
+          - const: ti,am62-audio-refclk
+      - items:
+          - const: ti,j721s2-audio-refclk
+          - const: ti,am62-audio-refclk
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index f3bd0be3b279f..364be49f8c7c7 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -53,9 +53,11 @@ patternProperties:
 
   "^clock-controller@[0-9a-f]+$":
     type: object
-    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
+    oneOf:
+      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
+      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
     description:
-      Clock provider for TI EHRPWM nodes.
+      Clock provider for TI EHRPWM or Audio Reference Clock nodes.
 
   "phy@[0-9a-f]+$":
     type: object
-- 
2.34.1


