Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3044AC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB2kNAgzMieRqYSPV0KBvmi4LSYKqx1CEdPHDC0yuHo=; b=GJvx0w9w5oI72+1Pzrw4S2QZo6
	uMp9cDYtjoBad4vKG8G2iBeOwCGvHR/f3zduS6KIMIzoXU2ysyv91V3BKTlqfiX/JZhaH5BMVwpvo
	H2DwEM9dl4GdgcKmA6bel9/ZORw6Av9aOnnR7j2f4mFIJcneja0aI57gcSgNPoaUV8ogK296AjWXt
	OBckHeM0lQISLREK6bmS7wtG2l10inkpDtMQ4jId98Ta7E5e3xPoZjENbsB9DVwFzkEpo2SYqcx1I
	cAC8S8T18+RGJlorKtvf/Ez0yXevAaLKpQOKMkQfz7mDMbQkc7tXCGti9gdX44+vsOg4imib+z/+w
	Sucxzrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7NU-000000011Kf-0IpV;
	Tue, 04 Aug 2026 05:07:48 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7NR-000000011KG-2Bah
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:07:46 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 674190oJ1209132;
	Tue, 4 Aug 2026 00:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=qB2kNAgzMieRqYSPV0KBvmi4LSYKqx1CEdPHDC0yu
	Ho=; b=nIhopIHbAkhgLHXjXsc3Sn7C8DqdHZDKTt39nOm6ktCvG5o2tNiFFGk5a
	0IeePfffibqy1Gi+B0MBCBdtHbRy1TSCksGIKzhMEvAjLT22Eq9HeU/C6OVA4qVb
	o+wdzTSC9VTZIBxmP5t9RpCL1UIuSYNZe0FPwPvEzuR/un5psh0UBiRfBYtIy4qO
	ILIctpuC8sHzHhyEBfcpnzDO8D8Cp2a8v1eUoY0UUBeYglGNvS5roWyJZDJV8o48
	VaCZkXUt2IY9hZ/jInXSEO07DzNChYLBRdjx/n4uWe9Ma5p1EL7+kRazSomoj5o0
	r+Db499SjSZ5ESDEBW3BI6WF+Lx9w==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012065.outbound.protection.outlook.com [40.107.200.65])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ftsxpqnh9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 00:07:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msW1ExP/b8P4vNrVKLk4MBvfkbeFFH8V4aaZWywpZqZI+A/2uoicfCDoD/5d+e8ZZ4REmze5afSdJEm1wZE8KSqHSD5dT2We7Od+sn/xtjYZiotJQNayFaMmUjYVWakjfK/n4PyqzzldQN39+znwJW7np8MkmA6FIsj7yr1/xKqJfAhr6CJW1JrV7Rxn0mXQ9cOBQ4LRsg2c1bpEtO3/GDbmn+7dI9gF8x+SBYxkkX9KlwN0jKGS7Np8OfWoaREg9ZCEpsFUjY9MHYPe7vT0Cnrl9HP4L5fcB8SzUHfM9Gstk/WfVTnpQ5r70Jj9/ho+pA8QZKM0We3coUtM1TVdDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qB2kNAgzMieRqYSPV0KBvmi4LSYKqx1CEdPHDC0yuHo=;
 b=FtBb0RdMSxkdSTDLLtqYtSi+j9t2ib4CWIO04sX31gwQJwIOP/aHa1dOHLnhmf0Sw+nYeNCU+wH9C+eNkotDx0AZ5lFkBPoLa5/Isu2eQjroJ6demqe+/BB0psrG2BvDbHmdqtQhSw6f23VX8Rss/IKtjnBEnJEeUnOGQX+VHmjcfx+HmgxZKOPpa5FuEh/N4Pluax3mg8UmG/lvAukaCTiVRVDgJ8ICq+RxLq/Nf3mbHe4FVH4mgZf9ClnhtnKNFheapUMbFTTBNCrqvDI4RUUClkEv7Qr2QFM48SnYBhdOzixlnexwUFXI2/BClMakgWH2+7dtniL7Zmi77tfULw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qB2kNAgzMieRqYSPV0KBvmi4LSYKqx1CEdPHDC0yuHo=;
 b=tKmoaPL5UXPQ3VYCrLdYESEIo+BF+t4AzXQose+Cl658WUkP4dd5gIf3lsrKsW0bwiOa2S4bPtMAQ0/f+0YweOpLtYreONmtBJBZvj/deXN1I4iRiI3dY3j8xoq/Rl4cXGCLD/PKvgSsahrlu8FFi6bkFfVcwGMJTYzsTVHvfwI=
Received: from BN9PR03CA0193.namprd03.prod.outlook.com (2603:10b6:408:f9::18)
 by SJ0PR10MB4526.namprd10.prod.outlook.com (2603:10b6:a03:2d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Tue, 4 Aug
 2026 05:07:36 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::39) by BN9PR03CA0193.outlook.office365.com
 (2603:10b6:408:f9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 05:07:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Tue, 4 Aug 2026 05:07:34 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:07:01 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:07:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 00:07:01 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67456wkB3049883;
	Tue, 4 Aug 2026 00:06:58 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Nishanth Menon <nm@ti.com>, Chintan Vankar
	<c-vankar@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Add bootph-all property in cpsw_mac_syscon node
Date: Tue, 4 Aug 2026 10:36:50 +0530
Message-ID: <178581977089.4185396.18351853569994632710.b4-ty@b4>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260625113223.1711052-1-c-vankar@ti.com>
References: <20260625113223.1711052-1-c-vankar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|SJ0PR10MB4526:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ba8f6dd-e798-473d-fe8b-08def1e64b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|56012099006|18002099003|13003099007|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info: jGaHB0toagaY1+Xy//9qKg9I9CaYrM82Bf70lnUZVNkiSipOj+cnJ5s16M/XKMylLU7rmi6wnibQmBHwJuFU2Vz1UqYbCzhpFPK+qG4Cj+milsannBW00wdbP7FE4E2jTNI23a2R6Av9TmEXROZLQZ+Nmjpo+OhwAAAo+DPkkc/d/S8UIvXTDpprPFV5WNNnw43Q/E08fVD6vlfs9L+aTW1Ylwx+aFnO1bRaVfeXJRHZmc5qNGSj8Q9RPz6sa97mNYoqNT4Rtfbo3FTa37nR7Z8Ut3F1na83VZpkoPjRGHi+c3jq2wMKfYMgqV1sAbeuS9he80cKByvLN+hgyCnVhpH0ipsHYLeMFvBh2pus0OgTw9A0zxuzlcC4MwgbhhH7rgOUezVfSLpezKtzQ6CI/YHfi0r0BoSRm8PEc5A4jO4EBxmA0lwFuQLmoP/HHX2RKw9H44iWXuHzQCSVEGvXftjzlRA28/dwFYlgKsEnhkQfgPQd8ahuy8KE2+vrQtqqjJULGxd+d1SkSyOyoDVaqN9ueJ9dCGl5nHHDWtBQj20nPnFyPWLufpFPLauh7TVmjzY6Tlfjic6QwsZLj5CRISC3NZufRzhXERVbehEQJgSRx5LhuDM0BNqnYn+a4t2C+4TyzJDvDrFIOLsZ6nrzguPeVNuMZiu3PuETLBjqnOb8Sq0a/Xqpy/O0P4c68IzU6L+VObYdSoHBJPtgOVmUuQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(56012099006)(18002099003)(13003099007)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qO3KlAiNnP5jW+lP8C0WPboQOs18XGAhoaMQCXsLx5+rPK30vDFExVXu0lv/Xvz+jRzYqDtdsSg2bDkvYEx34ezCv3dJoke9ZZttW1ae851ib0RIwWYgVx6zIAj9ZTQvXn1X41zKiSGN7dj33DtFdNb5LCKnSXIv+1ggSywPHBfKJsmaGRnS/4uFZd1Tf5/4t9RVA97s29EF+M0DOET0WgXl4YLMPGETybGGXoM7P4bfbsAxoMYEa3FeYsGefQLBoOrGygzqjTNEBoaI52RPfrGgmKKHb5oVkoiLyiHINVVPIrgGhx5y21DF7ZqOPo2YmFjGkC3PlwDlGLVZeeRN7+kNMrOvsdfmCbsgamqXYogB7P77RQR6JWDEKt4X9jC0RP7svxxIC+38uGrvIm9E3VREJUOZViYgfZl9wbInWfa+wEMaY/o2hOtQ3EIJi5pe
X-Exchange-RoutingPolicyChecked: dzpTOmkZaaSQW0S82ll2Xl2DSXW/EtVQDgJVIlSLUcjrbil8AXPli1E0nqAjk0a5f06F6XbMq7V5OZrjbfm5ZgHLpT5pXjbUjR6HjVImobSmeCvRhPXfR+a1jjSxOXAJzZ+16vxNQ4Nk+G6mvHs4TXjfQBpju9iYiYVGUyscDJ8u+7amUP4BVULWavqkbWh+ERRGcd0DzKuILF8WfA33DRoA27bacyjyhG6gzgHSHmFjz22fEqyQkYRcnwKtl/t4sBWTuM/TMNbIhAU9A/gxiMR3ve7MRcQY2+/c7U1YE135L53gk3zrdd5nyM2mPubMoTm2O2XdRJu04BWejFFunQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 05:07:34.3301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ba8f6dd-e798-473d-fe8b-08def1e64b7e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4526
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAzNyBTYWx0ZWRfX1ADEaXUtdop4
 VNsp5Sh1ZfzKunlqybEwgrJEevEMlsSMfMxFfzn1HnT8fRwpmDnALEKqGQrw5bdCjeiFZcRNaYy
 J/SZXhKlYjk8330Jfjnn8ANxPE8zzIgP60dryucnD9h/sJbwnKqIe3Q9iL5HYyYqwWNHNltgEV/
 DOIRsvfOGl7UvtG9xGZzFyYaSFK1B0LzCgBD37aZyUuPP4zfoP+3Pc4CCMDbB5oTUkWZx8S1af8
 E6WP6evmOcmPaE9P3eIxGCUjuCjUxeL5cAHUiJC3Qlg/tQHYc+Oul23Tb7PucgbZlZCclA8Wipw
 pc3PhVXiepDdx0T99+/ofwjZXVAown5BEl9Mt0n0oAVyq4u/mpSvqbujou3JqIjHLG4zTGR1GDQ
 /AtVmyIG/hvaQXYWqNziCM71qXpBvx7ySfYKk58sru9ErcgkrkdMuonBIEFpsSoYR98157XGS9q
 6YvGtcS686sLkMvmVBw==
X-Authority-Analysis: v=2.4 cv=YaaNIQRf c=1 sm=1 tr=0 ts=6a71739b cx=c_pps
 a=c5DtkGEGy/pke2otaEk1DA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: xEoKHyZvQTJS6lnaKM1Oi1YF76Nb-4jE
X-Proofpoint-GUID: xEoKHyZvQTJS6lnaKM1Oi1YF76Nb-4jE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAzNyBTYWx0ZWRfX+Sl0b9XoVm7D
 bYhjQdRIO79PS0Zk07M30UAcJRPWdwi1d46NY5mzMwCuIMf1bOvl+5MSbY74CdnKnJ3yPCpJ8dm
 aSY8Z1np2GRbcLXaSFUrZFPbZoZsqQk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_220745_562966_ACF717D3 
X-CRM114-Status: GOOD (  14.94  )
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

Hi Chintan Vankar,

On Thu, 25 Jun 2026 17:02:23 +0530, Chintan Vankar wrote:
> Ethernet boot requires CPSW node to be present starting from R5 SPL stage.
> Add "bootph-all" property in CPSW MAC's eFuse node "cpsw_mac_syscon" to
> enable this node during SPL stage along with later boot stage so that CPSW
> port will get static MAC address.

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62a7-sk: Add bootph-all property in cpsw_mac_syscon node
      commit: 41fe2049d282a86034acd24ca77016d4279a6b04

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


