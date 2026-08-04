Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BF4C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 05:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVwGrukwydosge9RuPsWvxAFcMtLh3gKWFDWnQjmP64=; b=G4Xg53yDqKb8jW3Uh5zK1+wBbw
	cWYdrTH1z/9zrW2hWDj+oFi2/y15uDALRxUVxTqgB36XGyXs/TgTXmgavPD7LqHjihHKKpNalAddN
	L9ncyL31qUqjWecBPU3LIRJWf9nQoEchNBwTxYRdWkoizmrgAqptX4vYWQmDlui16ZeZJuEhc9Bmc
	LVuNZn3k4WWu8HxoAN5MlHtjg5s0c3/zTBV41smg2ySc4Rn6h5c7kec5hBtbDdaxkOKugBs/DnNjL
	sR3/aFVAzDNNUFa6MkFxGoHWmr9CRtoJg14OvU3vlIut1Ii8seyqhGFVYXuU7SSMSbpBkmxhGYMXU
	hSVIo1yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7RV-000000011o4-3paN;
	Tue, 04 Aug 2026 05:11:58 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr7RT-000000011na-0EIn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 05:11:56 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67418uko1209033;
	Tue, 4 Aug 2026 00:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=qVwGrukwydosge9RuPsWvxAFcMtLh3gKWFDWnQjmP
	64=; b=TgAyfcGUvVfTiGTJZCOkBW5VozzbCqjfsgytWwwjbM6BD7sMm3XcKYrId
	hm1mY7QumLwXFBbnBC87S5JB1wT+Bl7zlOq4UC4rQm80DtOuuceCc7gvguITSC3h
	dqJ5XASHBno+70W5r35VgBo+25mxQhSTvau99bxohz4Lpkudi4DWuVv+uVs/nn10
	1eC2sfaW6fGxbLgzB1lRlhrL+A8EOu9FpCiqs2u7ofTFZ7J+mSXfgnjmcfi5j5u1
	v9g2Sj4CleE2KxuN/siSXK8qi+JBYcKwS/yxn3z9XYZiDzoBmXi3gjbatLlpZ+Ex
	iTEDbWnOv53AogZ6T1cAA6SzXl/WA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
	by m0380145.ppops.net (PPS) with ESMTPS id 4ftsxpqpa2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 00:11:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myDyPcgWdTXKZ3BMJa4mIlOArTT+wtUf+a5j/aX1Qg6tI/OWNcVe5wiBRZ/P3/Nf/MtJQ12A3A/OtXWChH+VpjnZOlav6yg/AiCStvvv3/T1YDGjmD6twNbJys8LvUpN+vWDqDkVJP9HsZWYersSuQ5Dugc9hJ+EHLO3AIhPCfJRYbPIgRX4UiqX3O75HrJduYboOEK9MFOoCOR55cIGM6BTWhKDzKPGALJAkTSG2TGdG816Vfqd/zORRQYSpKch4ORfcbC4W6bJd6axQ94cX2/s3CA/4TY7L8CnbfeqijyhtlphQRj7/FpXMW42t4N7nWXKr47MBw2Mik7NEqVGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVwGrukwydosge9RuPsWvxAFcMtLh3gKWFDWnQjmP64=;
 b=uu0idkmZHfh8iJpbyhiNLWYTGx6ZMVbwzZIJo3RmtfnCT9IX/0xZTGbCbtPSnWV7joorvRSoV61MEvEQu6u7M8ETZrg7bt1H1+0+L7tnAEQVwhbrJN4QdNNYy1GHZ3nv/IZhJRATH4lGwbyo6JGgZR258Wt1BHIubBecksOulqcpQPKupb+gCjqNPT6Nicp9yVMeAwhOCGxmzRBcESOfw/Cdtzzffj756suj0GMqFLMErOj+lA7vZ3VSkEFQShcGXtdoK3R3mbJlILabezYsQrj8QECR5pf+nk0A+5weMJp8X6GIR87UJtn5gwV2mweUmMYtaFdocueAFPanpQtHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVwGrukwydosge9RuPsWvxAFcMtLh3gKWFDWnQjmP64=;
 b=P5IUkBi9AAXNF1+7u0wIyCh5TeGKLAaDm02U7Egn7p9VslwX829YnBeg3bNuIDjMyt3rFq/btLVjjbSFIDKhw++fOdbyk+L3fy/FBo5juhB3b9aAjpX+bK2d5eygeWiaEE5UeJKIcldpcQE8IlqadReTwREGMOLRoYP9BJdY8M8=
Received: from BN9PR03CA0256.namprd03.prod.outlook.com (2603:10b6:408:ff::21)
 by BY5PR10MB4244.namprd10.prod.outlook.com (2603:10b6:a03:207::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 05:11:47 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:ff:cafe::3b) by BN9PR03CA0256.outlook.office365.com
 (2603:10b6:408:ff::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.18 via Frontend Transport; Tue, 4
 Aug 2026 05:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 05:11:46 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:11:37 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 00:11:36 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 00:11:36 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6745BX0d3789344;
	Tue, 4 Aug 2026 00:11:33 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tomi.valkeinen@ideasonboard.com>,
        Swamil Jain
	<s-jain1@ti.com>
CC: <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20260723073341.3229436-1-s-jain1@ti.com>
References: <20260723073341.3229436-1-s-jain1@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: Add Microtips OLDI SK-LCD1 Overlay for
 AM625-SK
Message-ID: <178582029083.4187098.13196316031117403089.b4-ty@b4>
Date: Tue, 4 Aug 2026 10:41:30 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|BY5PR10MB4244:EE_
X-MS-Office365-Filtering-Correlation-Id: cdce86b4-9dbd-44f5-8b50-08def1e6e19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 7HFqYhwmtU4hlE42suby+rR0xxJ9X8JgttNEXjKKeFAot8NMSVCrCpbkzSmAdQtv9jIirki9mbNr8zz4az1bo+0pAkDN99uLmVpeKCOBrOPVMsZGcw0fWDDwJtqBlALitf7yOEMfUZFBiE+duG77kj6TAQukMzV5FkcZdM4HGGfDrBREmDmNQwVHj9XRxUnEj9SGrz0s9ak5LFt6kzSWKyYDmf1wcefhBcQn6zGbEwo3C43prsXWpb9Jo62y7arObgegOEv73/CCJgSL5DUSXGVT7uWW63/YFbW1LHnu47OchBmOgGBPZdkAHfffxxMzadfYgj/cJ1ExyM3JcZR0gLOehxMFpwX0lC81AUB86pC1ToeP1oAJJHUk52NKpribEopGqlKFCO6L8YHvKGTlPdWmcA/kgkkcx+PaM7/oRE5lH2e87CPFXkdjQJ4QpT00xB16dmAiBookSr3xuRtsqWV9tb/WtPjnlgvNvUS/GW1e64GfYfu6crUINbS7btBRAWGQ9/YWZ3VvzYg5n3S+THI52KtTI7aBvgy8SlSlw/HoPCZp7XNj6+Tf7CKzY8PXAf6ZOwMi860tyxcJcWGdf34lGNNi1trYbs8R1+kxBTKPvDImmaXnJ1+txP44+kYvyFKuZ+spmNPlFB+e/Rs/iwg02pDqyJYA2aNtIMcWKlddYCO1o/GvAnMarXY1FR49dhqG9wJnvJKfzKYWoVZ7og==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: j6skbzrAEaFrkdRao5cwLnUVtJbUdE6ZS4drhJD5BGqz9j+ccc/bSaoVGWwZePbd4yRcMitFdRRh4DYgzOICWANOUP/LFygfaivKi+MhcVdO69GJxR0qjrx8pXa4QQSsRcgn4TohnFimvZBRja+FK2wUe5q17gsq8RHCNNoWK3k93vysVumE8PrdczsoI6CBjw/fuKvuH/Na5vZjjgjYGgYvBuMfw8NwpwA9TtJfw9gbULeMXMNaCObRkhBeW/9yceWCFBO94nt4wdtDWV+VOAP3ClrUdGnXq8PzTH6Uzhp8H+ZbuEvYt5/qG2gdvPBg2Y/1Dovrztd/NxV5oOLVT87gzyez6kBCh3Hhd7zewRlK8CUn9MUwMXbHgBUILcLB683bXCeJRtXv+rnZHGbk++eZAQeJAeaY/Jg/5Rx+49Oyr0q9XgyLBMYEVqRc7EWm
X-Exchange-RoutingPolicyChecked: bbLF2Wsg8ghVK2PbcfpR4V50VhM0Iljb9ZHp+1pv89MPqnmvcT5LDCqIOsix+relIBj62XZxyHAcuYeDCHnlKsEtgAoPQE/oGcIJbph6XoW3GoMUcXXMlvkgbIjzhhFYQfIDA/AELEawf6Cg2DqZZExDlb2mlAh63FHiDbI9uTJ6VHvf8fS96M16vZOLifjq2rwJ7WlurRUF9VSmwlgjQ8BedX4WEqnHR4ceU6suEwZJsTHLi1SOBrW6IYiy/Pmn85909Vzgc3eYSUBaFQOHErf19MBY5glYlyy3yDNBLLh1eD6hfN51fBf0rx5c00fAUiLC2hC5h2Y38Hifu9yl8g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 05:11:46.1928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdce86b4-9dbd-44f5-8b50-08def1e6e19c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4244
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAzOCBTYWx0ZWRfX9wvrYVy9B/dc
 r0uBJzLWC5xt5ktJj+Yam2Vb2bNTDa67b7cZvrpEgO2oqDV0xJsUc7fcgsI1JdgViIq/Ny+kuXA
 MlMPARIqLKAUPpwp4mtT6IsGBrCF7+84hG7hvknp6rN52DZdR9qJ6CeS4SlK0FN6mT9fFNApxvX
 dDqYoGHTSXGW4S1Sf99Wi80YKaI357HJVrzRJQaDtraW52Dh4eAYzQBD2JJd1ftp61Q11k4FKms
 4CwnXvE9uneaXb+QxcdQNIQghtPr0wvmX7QLOq/KHQck8IIk5EUt8aWnjUPUF5SD+GEckfhD1LI
 yXfCVR9kTYOBKJsHb6ElcBSH6APnrRntr8oh8LFj2vQ9Z0dsnJ8R63QQnjYobBuFTfsmR8Ul9nS
 VswyhsH6KR9J0msc5nP1DmJ9vN+jzTG5BsJbS+b6RlKMrPwatg2yPS+ccS2y022UnQUI5qTqCXT
 rybv1JGfrPOY9msCDxg==
X-Authority-Analysis: v=2.4 cv=YaaNIQRf c=1 sm=1 tr=0 ts=6a717496 cx=c_pps
 a=GcdpE1at2Es8HfJfZlkF2Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: azGvlVc2Ow5jpblKrvWsZxvLfk21mxx6
X-Proofpoint-GUID: azGvlVc2Ow5jpblKrvWsZxvLfk21mxx6
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAzOCBTYWx0ZWRfX+bsyw2SjjPgh
 9XUHL8/lkl8X3qS8zNvQaDoiPPefU8ge7jENIpcP9AAreMFzcdFEVysFwOAPMSdag75+XvD+7c6
 v00Sayl09vZH8PZSmrCeDAi6Scn6Mto=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_221155_309643_801CC319 
X-CRM114-Status: GOOD (  12.61  )
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

Hi Swamil Jain,

On Thu, 23 Jul 2026 13:03:41 +0530, Swamil Jain wrote:
> arm64: dts: ti: Add Microtips OLDI SK-LCD1 Overlay for AM625-SK

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: Add Microtips OLDI SK-LCD1 Overlay for AM625-SK
      commit: 77b7c62b50f95443865fb6e10bafc8739362478c

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



