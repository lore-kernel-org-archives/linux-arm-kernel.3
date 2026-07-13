Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oViuO2sCoQteBk2D5YIevU2ZTQu/79lCOpF5NEsarN4=; b=ltllUnY5S3vXOi+uW0G9589IBz
	yY2aPtsRcPknL7UUhpzCup7kvt8Bfcxhpl638HA0TgrxeZYc5i9yV+bUPWvk2Xtzx65TN+XisKCl2
	//v1HC8XlxQZpnjO1Y2dn19j06l7KgCADZ3/2U87mEUD4CQBrDKu5K3x2Q/UoGV8Vna3WNvM+UhwP
	f/3Ot5zzHR3GeSJ6XEx9R3mjWoeWcp+VrD6JvIKMY9yDgoPmwHVMNpNxiKBmILNVlmRp+Hr+qCNH4
	yzJMK9UeNdDn7MXNtvBMEbAp5UP0wCXKFL96W9m1g3PpF4EgSu//jRx902LGLV1iRbDAuYic0Dn+c
	cT7wTakg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBDw-00000008SR1-0XHs;
	Mon, 13 Jul 2026 07:37:08 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBDs-00000008SOy-3Ar2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:37:06 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6PjsT2798312;
	Mon, 13 Jul 2026 02:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oViuO2sCoQteBk2D5YIevU2ZTQu/79lCOpF5NEsar
	N4=; b=asaUwhaKbaX8U3OqacJeBmVEthpWRdUTGRu9XsxTnqjlZmSYxVgLIGx+S
	2P+XV/s+3IQTko7jD8+9r+fpBoSD/8T9WF8yNpE5p+2GOPkoL57m7n6RAlL/Cj0p
	Q7wGCUxQGRX8WZE3yRUp0xA9mX3c9xlLmasl1JhrOoZokqIrs597u13QXE1EoLUT
	dg7CkvKSpyhPvjlydwmD3F08icH0+pYfqB0/KKyCA/U8IX79Z0gQ0cOtHgVTZnZ2
	EAP+b6xWDl3qkVPNz6RRsihWwlLWUQkWAXXomNQ0QmGFYlEBGxt/Mu+vMjkMj4x5
	P+n43RHyOjiEbQrQM0aTbhEoF5m2g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fc574mkdj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 02:36:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dd+YVwbMHY2mW8hRwHNJYprzbcQ3b0PEWc51424rdu6OiwOWE2Kz4kXHCtmCP64FUc8j7LvCEcO4TIC8kFsE8ggQ5iStKfGhyCDMAqES3HyG3aV1xl/pKPqwavWQEXeMo17dVHoyWfMOEFSvrvWNLGVY827V+V+OYGtCKIOMLpoV4R/cuiZVT67//y9u6rrO01J0YJEec5QiaM/T05T276csaawYwSMX8nCagpQcRQt3EF/hYKM9JQe9dg0BuSEl2PI7BOkgUbVXBUhXy/xr8QEiHQMKor86uOqsJt+ZLaoaf7QGHyiStx+EgIkTFf9x6Z/izcsNNF/8Ylur8JrUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oViuO2sCoQteBk2D5YIevU2ZTQu/79lCOpF5NEsarN4=;
 b=QinD9iRvdJRMj203Nco4//h9o+eHquKm6CRe1okK8HUEGAyETZlwrcPJiGESqWygK2+ZcmtRslJ+ddtqxbmUFvWKsvHuZGDvITqP+MT+9w2/DDrTI30cf+ZzASUqkzvEg7xuw9ftAjSrhFTqjPuj+t7maiKptWVs50yWEqSDXi9+ICXrwQiMwx2ZVO1Pc5VKxAm8nvZg/+YoQ7HsT6dkQ7fZP55yrXoKrLv65xkwzMfEfFv5sDHfTI6x0GoVgS3/yqORKu7oj+XK7zx5llKcWeQvvvuM0YkAFcHzhdmeSh3mlTKfGuvSmg6LGJfPU0W2ZlKn+6ESIFKFlOazCL0Jtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=ew.tq-group.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oViuO2sCoQteBk2D5YIevU2ZTQu/79lCOpF5NEsarN4=;
 b=AJSGTY2HLwWeGZK6wtf3Dl8l2y2tEDeXCswRxQmlX6Z4YhClilqV4uOBAKpQ716nsCvJbZHSe9mi2bEiDw8GmkR3gpUQeuEWRP5Lj0cCkO9T5nFcOHEsw7Uog9LU9GBdi9FDxJayo4oUdrk0Y94m0vKoKr4oX92dptRf2//7Brw=
Received: from MN0PR02CA0009.namprd02.prod.outlook.com (2603:10b6:208:530::12)
 by PH0PR10MB4597.namprd10.prod.outlook.com (2603:10b6:510:43::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 07:36:40 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:530:cafe::4a) by MN0PR02CA0009.outlook.office365.com
 (2603:10b6:208:530::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 07:36:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.3 via Frontend Transport; Mon, 13 Jul 2026 07:36:37 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 02:36:33 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 02:36:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 02:36:33 -0500
Received: from [10.24.50.130] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66D7aTSB1599799;
	Mon, 13 Jul 2026 02:36:30 -0500
Message-ID: <67187ee8-bfed-46e0-a9b5-ab88e024b420@ti.com>
Date: Mon, 13 Jul 2026 13:06:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-am642-tqma64xxl-mbax4xxl: add
 icssg1 ti,pa-stats
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <kristo@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux@ew.tq-group.com>,
        Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
References: <aaec2ddf7cecb58ca0af37d4f03afec571804757.1783348781.git.nora.schiffer@ew.tq-group.com>
 <a03189aa138f74955a03b9fe6018a17bf7e2ce8c.1783348781.git.nora.schiffer@ew.tq-group.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <a03189aa138f74955a03b9fe6018a17bf7e2ce8c.1783348781.git.nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|PH0PR10MB4597:EE_
X-MS-Office365-Filtering-Correlation-Id: 59a5c9a8-b1b3-4a51-db9e-08dee0b17936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|7416014|376014|18002099003|22082099003|56012099006|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info: OVe7X3gR9Itn9MT2GSocB0J9yaHcbZui2+o+Ee/pKJGfH1u9S5U9t53C9nIIJ6F9jbdg7mxw2DmUODAy+FtoeweWBRrSi70JQmQnb2WmLrcOkSW8W4mFBZcQaGbT3l5EezHfau1xMCzAGQ+T7P8dvP85mPOQSrSd6/ATPC7NW3Uhiww9ZMr+c95n5D0XAYWYP1Wfs7oB3txXpUWlPoE8Sa9HoCjZRj0zIu8uOXAvZXeb3Zd9wNFOePU4UU9ACEWZSuZ8zgHydCFzGznmv/tYmEhqt0sdQXKD3r84y98h5ZBwBLfr+NtJyZJ4MvYRQ4AhTNza0j1riBbPjHHG5y+Fnn4WUteDho7uCV+38CN7Q/lPT8eElyxMS0Hjot1TYJL2rZKTZ5j/1cA0RWwEceEgL/3rdeyv0xa1ZsIuLB88MLqMx/aGHm8rhc5MaQgtq79ncrZ4D/i31dz+iuIJ8swfWAjVaHs/vuyhf3MwGPZfFVIobHhLPP0CEbEQHvDeoks0BlldI3WyFP9Y7IIGd/zsxPBrZaJ+acOaPSgep8FPK999S6WVI9QRCdX24iioWTo2PAu1nmQLI00xORMH3+mWyBVedFr6CoiMoNdV3QRleY8RsQ8DBr6gFHM+3kPmmrlKb44Lil7R1cs+HEmgy8hkS5aITDlIVcp1GKwELO/pqseXwCy4fLeXz87aSkg+Ua0BdJCwnxldbstaqi7JxAF1iA==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7ibjvYx4FaDakWfyP48sZ3xVb9Whg30vDKoJ7t7mROzXBFNzqsCMcAbRxwd0yy1opfKGmr3jWAB7HJQRROm6buCOWGUmQIcxnFjTKeU1OvYqz0TS6g32sHxZVgAbque6GPo54t9kggOjDvY4MmGLmE72ro9n9nrKOeNw16orZAa1RPDyVZLIopEt7nQ9fM1lxzzazYonHi/FWUtusuXqxTmWp+3+RiP1gnbAxeyNCEP6QHw8yU4rkRVX3pMkSzUb3LBBCNiC0kY7ppZT7LS0mhh3d4RE4l0Lenp7mFWXRxuBqSkp3/wFq8NkED0/GCzww65xoiFQDcu5gRjnUrw9iezaCS55yVdtUQUQrrZ/hTacRkmJ/rsKM1kcL8meJMiftWNpHkPHAWHoKeIxUoiceusd6UlwzhPlEwUIwAJsODjj7OWdShycw8saOk4BbKY2
X-Exchange-RoutingPolicyChecked: iOLtYoE0VXCMGs8yVo6FeduIZoGOa8EZRCj68M28pysZE8Rqbw0U4S+NlTg5JbEX5IdI5FGB5Ug+lipRycbqXSkgC15yD7hFay7cdQiKiG36s7lUTq4xtAVC+JIg58SxBYDtgm5oD+P2ywCuEq2WXdgJIhW4+iVYJt6bCKZs6K6I+M9LvxLdyVUUWKiUA2Xt5xxCKd9ti/juJR9lzQpU0l1vNjpBPqpGBelle8j/h1biwXnfqic35Tc+ii/bpl2LdRchAOJ/uiw7t+UAmmp4ExzVWq79W8UQzYgSV351O732OOL0oJi9ugutatT2Yx6bsvkf4gHKnOKuGRbGCjZi1w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 07:36:37.9537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a5c9a8-b1b3-4a51-db9e-08dee0b17936
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4597
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX1vYHBr5LYLc1
 EArxFXKXWhgKzfHryXsCpYgTyIatJr31WEtAueM/pC55yVeaB7zE+N9LcadiRzm0P4rDv620hjq
 5IIx6/NI323H1mKpzD8GBAWawQvVock=
X-Authority-Analysis: v=2.4 cv=DpJmPm/+ c=1 sm=1 tr=0 ts=6a54958a cx=c_pps
 a=yA2OuHN0nunLSqluPLsRVQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=8f9FM25-AAAA:8
 a=BtD5_yk_Cc2jFCf6pqkA:9 a=QEXdDO2ut3YA:10 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-GUID: 5M7vSCxyNi3wFGrlhPqz0H5NfW1bh_mi
X-Proofpoint-ORIG-GUID: 5M7vSCxyNi3wFGrlhPqz0H5NfW1bh_mi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NyBTYWx0ZWRfX4vXTrAK5JdyD
 Z7L4gT0cTlYFYm6Frd95viO5g9dfKdfnHbxk+64Z3Bau5/WPUI+hAOcMC99i4DYmVIXkQqf0pxT
 QUufAH+/Z7a49CaAmDp4R5E9qIrUbTqDS3OqTnr/1aw+WopLM/L6xHoDayrDPK59QVkMiNW+7LW
 Zjy0oiJG3HfqA2Rp5ln7KRpnlNitfF+S7Zri770TGpe5f1zuUQ4lN6oU1iJg51WHBLWHVPWBpO0
 tjBK7UuwkZ/H+cBuHpU0SNc2Wn6huG1GbemDlch9TCOBv+igL51Smm0sn3ud+laVw/HQGMagXe0
 +4j/F3CORpT1jh/Sq2J6r2aduDjp+wn9VKRZ+qlpmlKVtWb0rNGRCdRlSh0FjIA3IPqUII14fU1
 mW1+L+x0w32/OMoa7pY5VMb/5uX0dwL/QdYPg9CP8y05O+bL/45c9r9OCg762NjYNbei+Dil20e
 kQgNVkJVLtucmJ/P3iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003705_064606_956231D9 
X-CRM114-Status: GOOD (  13.46  )
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



On 06/07/26 20:13, Nora Schiffer wrote:
> From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
> 
> Add missing ti,pa-stats syscon phandle. In addition to providing
> additional ethtool stats, this avoids a "icssg-prueth icssg1-eth:
> couldn't get ti,pa-stats syscon regmap" error message.
> 
> Signed-off-by: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
> [Nora Schiffer: edited commit description]
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>

Does this need a Fixes tag then?

> ---
> 
> v2: update commit message to correctly describe the error message this
> avoids.
> 
>  arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
> index 46be6824dd163..b9e52d8bc8524 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dts
> @@ -110,6 +110,7 @@ icssg1_eth: icssg1-eth {
>  		ti,mii-g-rt = <&icssg1_mii_g_rt>;
>  		ti,mii-rt = <&icssg1_mii_rt>;
>  		ti,iep = <&icssg1_iep0>,  <&icssg1_iep1>;
> +		ti,pa-stats = <&icssg1_pa_stats>;
>  
>  		ethernet-ports {
>  			#address-cells = <1>;

-- 
Regards
Vignesh
https://ti.com/opensource


