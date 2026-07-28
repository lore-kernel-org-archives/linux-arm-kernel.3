Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E823C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adJCrRLDWGkEMSyq6yOMN7R9HUUVElXlbhf1MXo9p+M=; b=UuIDoEz7clZMrOeZOc2kzGmR7Y
	KQQpW5oH+YxPNKGzvHA3I25utzevnGD6vGob9G/S13pOFBGmiPvzQTWpoxrsO2ta4gOGfuIruCc/f
	MhaZxPe9AgGSUsnyiKzDhD1GSwgZI5n2MsXGrImBCQVKFeTfITcwy5UT2b92vJ8iLp40jeXrn9apX
	wKBC5mkVz7DRphM7FvY/qIbC00uGoBz9MptjysPwkxvB+SDJtz1Dj1qAqLyBlBBJpdTCEAaTejvTP
	/GsPF/fum6r2zlFo64B79Eax+qSwEFCMIv0H2qXllBHsEmukFSDLN+WeBHYaX/GN9m4jn6lBnfLLe
	6omeUKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodti-00000004mIN-311Z;
	Tue, 28 Jul 2026 09:14:50 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodtf-00000004mI0-38SQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 09:14:49 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S91jL23583805;
	Tue, 28 Jul 2026 04:14:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=adJCrRLDWGkEMSyq6yOMN7R9HUUVElXlbhf1MXo9p
	+M=; b=jH6lDNF8/IGiMGSF8mZxPvMYxCQyhZ6aprIOiqrC9qkMajhVwjB5xXuTN
	d6tvVFB2K62A/DFm1C7YgCMpRrr9Y4kFdmT7ZS4zCQzOSTJbF6WFtTgeZz4L+VCY
	fyzQ3gnZDmWOqALYFkcPZ3J3xrapBIiCPMC05RG/niNpJqGR+7ukXOSs3bW2lkN+
	cgNh3nVl/ADkn4XsTISVzEDk8df+MsS1Gl4ZIO7thb5ZJwVrPSc56B9mx8cRNACC
	tqC6YK1XDsAlNaakK6nO2cv2ECCofpG4ctDnacvQhxGC/qj+vxibtQfsPBIAMaeo
	QX5rZJEgnlEpBG0HxjPx5BOSjw/uw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012048.outbound.protection.outlook.com [52.101.53.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpseb0211-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jul 2026 04:14:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5mMQIGTJiwITQrC3Icc5irPmfnte3999NqCNP8cPRxkYm+h3MqmrKKxJv33r9RJlQ+HzWUFDrvyV9Evz2AZ7OkE479VzCSq0wWKs5NVm1lc7oDRqPZqgi+HAw887XV6Z5JT9I7yAnnbt+TY6Nzk7/7kAXPoRT/BUgoNdbR2851SVY4/oZSyp6F80RoKjLith5tGs8aKKXX+pWAFKOFk5M4VO4OY/gkDl+dgC8vZMASOLg9mxgWU3TD1vg8rsNoBJQ/2IwXOUvRvcE7PBbn3B9+m4kDz+Ce0Z/l5nQsf5UKF2l1kg8uh3uL3FDfbBGZLno6xO/UfVNwS1pKu5/Elvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adJCrRLDWGkEMSyq6yOMN7R9HUUVElXlbhf1MXo9p+M=;
 b=vA9W3fdixkJ8Ol29Z6DUvwRFFt/YjDwce95/oCc/cxGMRszBNcaEl5mFAiWQk6SC9Soyg6Tb9HjWeNSJp85aTDk1kWg1qn/RFjta/ywPxh8s0v0GTQ65Ya3MnhmN008vY7kWmMR1jlPF3aK4Uz57Stv9xqF1GZ1CgtSWsxNQny3OadUuebGcCWR0MkqlZA48/ceGqmXat0qkP/1487Fg7cF1mzCGlLOcbc4z/KRbC8xjW4LxLv3br9mgnkO5fG8nkEvsSpc2tFVzalnvSN6Qr7uN5D4lp6qmG7h2q6xZRBr5UaaveZKOoLVGp83q8N7l9tEJkia+6d72IQEihfDi7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adJCrRLDWGkEMSyq6yOMN7R9HUUVElXlbhf1MXo9p+M=;
 b=fJAayfwbLjvKT00/jUEPl//IubQJX9sBy/VREBlnS0j42Nt9AcC1RNg/PUA/SDHCRZsfFZ/NZIL5+J2/tOSpLCdKQV/xFu/OBvwdF5MEKk4eiixkF/BBS2SYqL2g/IvkYBOmzvVIDlj3pggL9vPkrKBf75Z8131BQAiZu3kCmV4=
Received: from PH1PEPF000132FC.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::2d)
 by CH0PR10MB5067.namprd10.prod.outlook.com (2603:10b6:610:da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 09:14:32 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2a01:111:f403:f90f::2) by PH1PEPF000132FC.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 09:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 09:14:30 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 04:14:17 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 28 Jul
 2026 04:14:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 28 Jul 2026 04:14:17 -0500
Received: from [10.24.52.125] (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66S9EDq52362029;
	Tue, 28 Jul 2026 04:14:13 -0500
Message-ID: <6d1b5b14-2e2f-493e-bdab-45d659d284e0@ti.com>
Date: Tue, 28 Jul 2026 14:44:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] arm64: dts: ti: BeagleY-AI camera overlays
To: Jai Luthra <jai.luthra@ideasonboard.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>,
        Yemike Abhilash Chandra
	<y-abhilashchandra@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|CH0PR10MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: fc51ac80-7510-4433-ef5f-08deec88a1f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|1800799024|7416014|376014|36860700016|56012099006|10067099003|18002099003|22082099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 828iBNr4BPA40nc10i6P0NWzQqdC1Qn4R+DppJ1hkhiD5YnYCKl1OuyWvaYb2dw51cBsv1V/MPFHweKmAi+26oxW9FB1lml6l6miPNbGm/L3m6UMPPm55pRh2TlWHr/J0NkNwqgqJNQ0XWy9ZkJOVEZ8hB2dHSBuWN1NERoXSNVXuz+h3lB+nOf04lwuRAtry6gJt/Wb8w1xjEixkJstP5oNSX6QRQ40iwRn970Hq3YDmVD5rErop+nV+fBenrSoCsrVolXRbAjNtMkeSeXC5H3Om0ierhNWYrGa/J5sKH1G4RjSRS1p62umbS8qMVrccBHR3Z9a2jZb/yrmeLVR0U7Xasonv+BCdikf9rLhSg+h1G4ffHrIQgyyL/GpszB85+6XHmwtKk9+fcyUfHUF7wSWYEk5Y1xH1jS1WT2WUJA8MgV+H6XP0YlJ5ddGPsgl93wpEW5TGEL0l4G2Ku/vCzQ0nUgNTYRLuIOMg6VV3kKD8UUuT53Gd+iJj/uPS8/9enXuyMHguXWP0W/7TQkkSE8aJKIpZ2fKtz0/frocaXEdLB18WFfFLO3Umt0aHbJs9gOnPjtMcuQpDRGrIezbsbkZqQwVSAOP86E+2fqElN1gnGKStIGdB5Xda2DHaL/JW1IHyoiqZKAAKxEL+D0uGGxXtnxhxodRgVZ5QvgtX3byeYtg4WKt/f5ms51P4b2xibnIazIRSvBjMH9zSmSSMw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(7416014)(376014)(36860700016)(56012099006)(10067099003)(18002099003)(22082099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kLWagqu33dkgh2DgyQKyLQu+/PxXSm4nJGOcDAsJ0J9DVQrEqRmddkrC4tc/h/neWv6nuFThLCX14wXvzEhDUum91XLJ1gUhczca16TozR5iuxC4o27nXw9WGf22xJcx5HRoB/y/0OWBAtH22KnytVxBSBtulCkXmox73qBRtxP0tXPryzCDqqtks3+t2vEl4Goxk62jOTstLApbyaNtyEaJPR+DIr04qlJZkDp3Yzze0MxgKlej/2SaNgs6OfSkleTwZPmPwdsX0ce7xkM0h3zbOq3EWskU2DzvHnmU8hWg/p1UPg5RGWMLyGOzDlBjTrhGOArXtUVqfYbkxC5U5lCYirLUx/KlYxkSTdnG3QBYfSKq4bn0p3f+geRhyuGVZ+zj3G5IhhvJNa7L13z4Ef8FE4iFoMST57vW7XCXWav5EMrC2FAAnAhsX9fi12Id
X-Exchange-RoutingPolicyChecked: oCirq9F3CEStCrhiAh/3NsQhGBo3uTHyQSXP5jITpIS3OUDYbDlAGn8UXKUwvef52NQbd62U/UgG0Bk72p1AWj1Ouk/rRQM0m03pxfwS33Z+ix5GbEoGdPY3zGl+4vpBB2Ke1ZL8AYx3Q6L2srw29IcAEC7Obrv4Qr6I1DcyFhddWHEBMP/AmiPXHQ84tbH3Py+LPTFmebF4/UFcEoCAInShTO95sa/s4I4hjK0ooMo7dh5+SsRyx1irb2Iu5s94OJjUBorExZhWJz/llySjgB+IcHdAgU90UNgv/rPG7dA6ljlskFsy/4JOkDWFXm72i+VuWIUpwzcDrqAwcuUAKg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 09:14:30.9217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc51ac80-7510-4433-ef5f-08deec88a1f3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5067
X-Authority-Analysis: v=2.4 cv=c46bhx9l c=1 sm=1 tr=0 ts=6a6872fa cx=c_pps
 a=JX9C1NjKfd8eGP+3z/QwmQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=sozttTNsAAAA:8
 a=Soqapf_rTBzX1gwIc-sA:9 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: s3TKOQ_mv4jM1iBIJhiIzTZFtaFPeRdJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MCBTYWx0ZWRfX0XnO56ArP2Hi
 qsM6/Xo9cSpdtnwW2aYBcgeTZyALNowTB6P8y536X3CGqygXgRV1RtXnU0acAiqYntPUC8SRMM/
 aloaX+fjRORdnu+JB3rgJBbFarJtutU=
X-Proofpoint-GUID: s3TKOQ_mv4jM1iBIJhiIzTZFtaFPeRdJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MCBTYWx0ZWRfX6bTHPeMamXIb
 AumNniW0eEZEOntEBykuFXM6XAPRHRwlmzfCd7pgsHbm7wLH6E2BaecPs7YKNTAJa/PYbJGChAv
 ATF95ypXHsHMauwgmcLOFPakOQiB7KZ4V6MelL52Tl6k70/mDfrfLWVWI2ZSSDED/hf1EcWwmV+
 R43ZoCRVtYanv2gP3CZtLxDsTX56YR3KiWUFt8ZHoTrqIW0/iRZypAs8onmvFfWL0min0P4k5NH
 Y0NRE8IMPSzgxD/X4h5kL3/pX9/gVy9D9/gV72vZzSlS8tkYsgoKvnNzM1YZ4DK36cc5tBp4ZPN
 baap5mCRj68KTVzJv5dIdj1odHZobo6ZZYylg81tLgy1Lr8hHbKiZWw0c/yvQ+0klr9lEayRNc/
 8isJdxZ0j/GFzjO7jDorC8pO3UPaTKND09IlhN94/EwxZ1NB833i9vuClFEU3aVCkYXAjw85Agp
 vuOR3mJnHB5NHOivoWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_021447_934765_123159C4 
X-CRM114-Status: GOOD (  17.05  )
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



On 02/06/26 18:29, Jai Luthra wrote:
> This series adds support for using RPi V2 camera module through the
> 22-pin CSI connectors present on BeagleY-AI.
> 
> The first two patches add support for I2C-2 (used by CSI0) and setup the
> DSI0/CSI1 mux (used by CSI1) in the board devicetree.
> 
> Next two patches add two DT overlays, for CSI0 and CSI1 respectively.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Hi Jai,
Thank you for the patches. For the entire series,

Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>

Rishikesh

> ---
> Changes in v3:
> - Add disabled nodes for I2C0 and I2C2 along with the pinctrl for I2C2
> - Add Rishikesh's R-by along with a link to the board schematics
> - Add Links to RPi v2 camera module schematics and BeagleY connector
>    schematics
> - Link to v2: https://lore.kernel.org/r/20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com
> 
> Changes in v2:
> - Use PIN_OUTPUT for the camera reset GPIO pins (I forgot to change the
>    sysconfig generated line).
> - Link to v1: https://lore.kernel.org/r/20260514-beagley-cameras-v1-0-5c3500b5a436@ideasonboard.com
> 
> ---
> Jai Luthra (4):
>        arm64: dts: ti: k3-am67a-beagley-ai: Setup I2C for CSI/DSI connectors
>        arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1 mux
>        arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI0
>        arm64: dts: ti: k3-am67a-beagley-ai: Add overlay for IMX219 on CSI1
> 
>   arch/arm64/boot/dts/ti/Makefile                    |   8 ++
>   .../dts/ti/k3-am67a-beagley-ai-csi0-imx219.dtso    | 118 +++++++++++++++++++++
>   .../dts/ti/k3-am67a-beagley-ai-csi1-imx219.dtso    | 118 +++++++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts     |  45 ++++++++
>   4 files changed, 289 insertions(+)
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260514-beagley-cameras-21ce6a98a7f1
> 
> Best regards,


