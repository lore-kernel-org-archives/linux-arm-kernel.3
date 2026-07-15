Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B3AC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d49O000VpZf89/gEzusdUOILIrMCPdNMwu/YDOST7us=; b=czaFdYnfBKg4leJgbp0tyGaFy3
	MGs6ir6w5Bxe2jGrJEJUs2CRaBKzOQR6eLMFTsOGmD1YKNaBsNmJxH/IzBeqm/9alfkFBtVl+MHKT
	f8JzWeGPhoY4aMG7MWmtlH7tuM7Uz3Asgg385R/lKc34Xhdgrr1OBunC5a0jSSh+wPg4m5PoanlBp
	DjZW49eHNasu30gHP8+qh6Lee2lxEVp+qYMU4L+mzou8s7AOohaw0iqbfBxb+pVj4D0W0OWcHqBWp
	MHYCFFQT4OkLoLnL+6EUq2jWGdc7IRBXCFUxPvZMINvmfOFHfcZrKJQB1RFx1vGbpteOwCrkq99jn
	Qrh/y8cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPQ-0000000EiGh-033X;
	Wed, 15 Jul 2026 12:08:16 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyPM-0000000Ei9w-0Nim
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:08:14 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBfe6i805750;
	Wed, 15 Jul 2026 07:08:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=d49O000VpZf89/gEzusdUOILIrMCPdNMwu/YDOST7
	us=; b=QLIPp/bciWcB/GZUl0Ypzu+qt6bOssJ50NuNBpkfkSz0nh4KGA34ikSv7
	7p3lL7rsSy8na2N5YfVJ6M+njDAOeSWGtfWXwAiJu8OKEiNV8da7MKugDt+3Vu0H
	pKiPhO/z9vMkYLIE9QoEmYMn74ktAaV8D9JdlhzwrAZhy9gaf9FKUZZKCTlXILzQ
	ejkyvNgxNpEKbYPUJ0ALtWA0lskVc9NKd68HO0nE1tdijA8RDE9bB5OFys3SC1Q2
	01oLiM4JpN+HrqKgk7E0YbYkB2mRWblE3hxPL35IoodkvE2KKMGeqdgZXD71HeAZ
	cbF1E0PFQojD6TKSJaf6li7Oasc0A==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fe9jb04hw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 07:08:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeThDML/fie3/NfC/5ktDF/oEEeVRmqtVQC2GCwyp0DcwXeT7lNNref8kuBkulH1ReVx+ThTTdhgc3fXWcELj+6OCIk/P/DIEp4T8czwtKJQURdtuWLT3OSLRFCRQ4x0hVNHRxnMgkFK7QrI2rDjzF/yM3Ft1y8lWswlDkFUm3K/qqe2iO6VpYDHCDFEXcTsCh1aZJJxiQImmfGHKbqUS4WEBlc5JEqztTYImcyiw9ID7Q6HoVgeiEcLtLeua/iW3pP3S3qR9BI5ReC7ot4CxA9AEO/jh55KyP9ZZ4+hMiyyB1n0QwoK9fPVH5QGsR2TOcI3s0md1IPrVeXvFJxt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d49O000VpZf89/gEzusdUOILIrMCPdNMwu/YDOST7us=;
 b=WNqBSFWiES9LDe8+Q68jdh+wd+Gz333DKkgJAkq97mcmbuwjd7I+pyShd2wXAt8Zb0mHvwi1Lo6IjItlBuW/J8aetINxVoobxrHO6gvZkqNLnoZ7YZ4rV5nQRNsW9XunMY5ex+hhwWE7owgJdzcCWYgIuL3USely1lLDdBozbW5zPfzz27Dkdzq2lmQ+oQZxHfdhuvoXv1OUsWnyft74Sx+A5qFVo+EnCvt92btRzufGIUbphvy73KiBhpiQZB+ezT5o3PnMAryt+USJxZvBfBDbBpaKnra4TkDbZ/RNAZVTq3hrao7zSpfduiFdkPWH+sSCkeoLF657SMdCgemggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d49O000VpZf89/gEzusdUOILIrMCPdNMwu/YDOST7us=;
 b=qeZeTWa03VDC/sRe1s1sQZ7leV4QbKMIeLbBUFjhbWV57vWoNFjmFCJ/eoTWqogyTMuGBqYSQN4gwhKIb3KOBDPO98t6Ke4CqIePo/aQ0DyVerASelxiMmdhMcO814wLRKuWc1RzDCMjsFR8mHROQC1Cqrq+iKqyF4pYTxZHTWI=
Received: from CH0PR03CA0343.namprd03.prod.outlook.com (2603:10b6:610:11a::14)
 by SABPR10MB997940.namprd10.prod.outlook.com (2603:10b6:806:4f0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 12:08:04 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:11a:cafe::53) by CH0PR03CA0343.outlook.office365.com
 (2603:10b6:610:11a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 12:08:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.3 via Frontend Transport; Wed, 15 Jul 2026 12:08:02 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 07:07:45 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 07:07:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 15 Jul 2026 07:07:45 -0500
Received: from [10.24.52.205] (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66FC7dlG2419369;
	Wed, 15 Jul 2026 07:07:41 -0500
Message-ID: <47b4916d-88c1-41e1-b035-2e3d9ee609b5@ti.com>
Date: Wed, 15 Jul 2026 17:37:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62l: Enable HDMI & DSI display
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tomi.valkeinen@ideasonboard.com>,
        <r-sharma3@ti.com>, <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260513210942.692269-1-s-jain1@ti.com>
 <178393005159.2885601.13711892620228139345.b4-review@b4>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <178393005159.2885601.13711892620228139345.b4-review@b4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|SABPR10MB997940:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c3c4b4-6c6a-4f8e-70e8-08dee269b83a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|3023799007|10067099003|22082099003|4143699003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: jT33FtKha7MsXqaKcZzj7HbRUPgDp3NPLdcfHuWjDBhLi5zMcYDbtwYvaaEQKPzi76jJtilirngLR0L93U3d8QgoFI9COz40XQGD/10MA3/rdkB7wKJhKGZuyMZS6CvCP7dTBO1JGu9R0JywU9DPheP4NooQSc2969S8KNSP738IRslhKQbY9sbo5gH2O0sl+Dvl4l8cftfONaIxQQrzhzOSHSv9s9FehbLlCq0mZUs+Zx4E6g+qzaZtujfKelyqL/Y33TDziTh6CauGTWdqx5rhOk4O6aELIYIc3p7+Y8WSqlYdLYgEf9xz6XmRL2aEFudB2BaCYmROSllulXJR1fhJDw0b2XtlKf+upSrikmIKyabrFBqk47ROMA5PKnk+k+/U62atfvOLjqjel9qm53tMow4JT+6OhE7tGSFUw8Z0VHPv65QKHmbj/q0lLTDrxjgcRp4bCU7QiQ/EPoWyl908YuKkCSsnrsq8+PHwjQDP/AI8OUw4cvO65IoKke99bkgBKkw80ysPEHtS30kITqoK9mGpuJLZ3tGg8Zb1/k3yI4eUvpXmyHxNn9RcVLwZzOy2yegL+Ec3s7nszROxk5Lc7dd1w1uC+WG/yUVbCr1vIqmHsn1dwzIsUFa5xB2YqN+ub2IPU9+26Eia3dgcoffIbW4L6wWeVdvdY6ooLAwDF8WpwNdAXl+MJ7yys0Elf2SZPqe85KH29djxo2uvmw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(3023799007)(10067099003)(22082099003)(4143699003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +Y27gHhBJ4QgT0USCU/edA2NRgdcNXM1fokXzW+p++WkQtzKCp7IGuPelJ+Jn62x2Aq0ktMrCmciDtSt0ax0ljXcY4EvUURbe6L6gvgUjZAcrLiRb49UHGyzo/t6IA8s7OyOPVS7eg5YpLoEylqe12ga63YVfgMN6QPf+0cH7Qg92a3AfF9G2jRJdEDwAI7XBThTLBffK1QJ5haNhhpWmyplvcra2IgJg6buxORWZrPBOx+rQqa7UG+u8xYf1fRfAs/XsGH5Q/J+P+96gE2IbVkKSYoMEL04FpiV2+10cWxRYhq34eDJD34CTfbiDfSu7YkU7tLNQSEQ+AWOvVir0vJdWIuQ2PmARrxzB/HcBRCoWceMMqifb0wAmtrl4nJQN45aj5ugICqdLNnpcLWktyrDl8l5v0bdvetwEUuxrto8PpuKbYlPZDrSioG3y58M
X-Exchange-RoutingPolicyChecked: Teg6KbIzkKslkP3RZ/KIPVL+q7i2K1OgUs8DM1l71jzup5EMTCIXsLc2GqeI+rQPImpGX6BmVLW6a8yCPLGdWz76i5LgbZY6C5cu1XuwcnM41XRxKdJ7Nh6uNuOsv1t4uWNW/9HQAEsJO8jVYkQCxh7Y/kKDL9tscsWrBI0Mxq+tPnuZm/YEwtLiKBGATkTiXOI9JU2+P4iRcvH7ElmF2kUkJ/5PFL8306UVJe1UZDWl54GbU9BcjGSfhmvRReLZJVnUEwd5so00Oga0epH4VpvChCSL3CZYBw78IPE/sTKXWz3wCanGyGk/AJ4UuxFipCUx7Eccmqjg3ztMwkA8Xw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:08:02.2547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c3c4b4-6c6a-4f8e-70e8-08dee269b83a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SABPR10MB997940
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyMCBTYWx0ZWRfXwiVNpZ1OTXZ1
 aqDGXJJg6gBnpoghrSHINLUweTEZ7IMQ29P3iIUct4DH5VMrjArXAZOH8vEM+iKD86orIe50H9R
 C9K3y3kUwsmdjuHJD+WqO34l/3UlDmPVOduARNC3HVbpMCOUSQsAgt9WKVK7DT/++AKv4yJXO5K
 CNDbOFiO4Ehx/glMTwB9X6CnYmfMUB1P8/B5MNyHBgueOsV/28pnneN2wDMkfOdI+sYR4dtpzPW
 guJn1natcu7chqSg9j0wo9dtCfN2dbRLJEt5tzZfhHEM5jScHJMkzBAYoPv/AmPG1iOM8+95xnX
 ZkVoWo/iNpT9CYbKqBErnKIB/dcL3kVNMuDFRbSdUFIQvEjYQ3AbZqg5qTTsEcs8L1SB/ZlEeGr
 smfMDuF0CoPzYpgFwUujwRmwo0zwqlXTjZqBlTO8g58rAGFjYLRYDOlh+YmET5+EDpNywKqRbyP
 m+0gxVexNph4cbkztlg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyMCBTYWx0ZWRfX0lX5kU1OD0KV
 hhGHXd/JhhndyPc3Xp9bfFvpr7bOWSP78pOFfMg077wJCRhm+a/ny5akN1lYmVEXD2e14JHPSUc
 jEx1D1lnEGNp3Pi3sBFzSn6NlrT0uAk=
X-Proofpoint-GUID: uaJ1YUcgprUHH7mcrty2w1AcqWojWEJw
X-Authority-Analysis: v=2.4 cv=ROqD2Yi+ c=1 sm=1 tr=0 ts=6a577826 cx=c_pps
 a=LQDsqUhXq6x2TIKBD9Oruw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=nIZuoBpWME8S4zVf_BkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: uaJ1YUcgprUHH7mcrty2w1AcqWojWEJw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_050812_383865_FDB90037 
X-CRM114-Status: GOOD (  17.24  )
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



On 7/13/26 13:37, Vignesh Raghavendra wrote:
> On Thu, 14 May 2026 02:39:42 +0530, Swamil Jain <s-jain1@ti.com> wrote:
>> Enable DSS, DSI and HDMI related nodes and pinmuxes.
>>
> 
> Don't see any Pinmux node added? did you miss them?

Added in v2: 
https://lore.kernel.org/all/20260528133529.3476499-1-s-jain1@ti.com/

> Also, DSI still remains disabled?
> 

Keeping HDMI out-of-box, dsi can be enabled using panel overlays.

>>
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
>> index 80615ca1e01a..1d255c9138db 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
>> @@ -584,4 +584,51 @@ scmi_shmem: sram@0 {
>>   			bootph-all;
>>   		};
>>   	};
>> +
>> +	dss: dss@30200000 {
> 
> New nodes need to added in sorted order as per their addresses in this
> dtsi file.

Yeah, sure.

> 
>> [ ... skip 17 lines ... ]
>> +		};
>> +	};
>> +
>> +	dphy_tx0: phy@301c0000 {
>> +		compatible = "ti,j721e-dphy";
>> +		reg = <0x0 0x301c0000 0x0 0x1000>;
> 
> reg = <0x00 0x301c0000 0x00 0x1000>;
> 

Ack.

>> +		clocks = <&scmi_clk 348>, <&scmi_clk 343>;
>> +		clock-names = "psm", "pll_ref";
>> +		#phy-cells = <0>;
>> +		power-domains = <&scmi_pds 86>;
>> +		assigned-clocks = <&scmi_clk 343>;
>> +		assigned-clock-parents = <&scmi_clk 341>;
>> +		assigned-clock-rates = <25000000>;
>> +		status = "disabled";
>> +	};
>> +
>> +	dsi0: dsi@30500000 {
>> +		compatible = "ti,j721e-dsi";
>> +		reg = <0x0 0x30500000 0x0 0x100000>, <0x0 0x30270000 0x0 0x100>;
> 
> reg = <0x00 0x30500000 0x00 0x100000>,
> 		      <0x00 0x30270000 0x00 0x100>;
> 

Ack.

>> +		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
>> +		clock-names = "dsi_p_clk", "dsi_sys_clk";
>> +		power-domains = <&scmi_pds 38>;
>> +		interrupt-parent = <&gic500>;
> 
> GIC is implied, drop.
> 

Will drop in next rev.

>> +		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>> +		phys = <&dphy_tx0>;
>> +		phy-names = "dphy";
>> +		status = "disabled";
> 
> Don't you need dsi*_ports ?
> 
>>

Yes, Udit pointed in v2: 
https://lore.kernel.org/all/cb4c1b80-40c0-4e63-bfa8-65a68c577999@ti.com/
Will add ports info. in next rev.

>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> index a1af4571a815..7462921e2180 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> @@ -192,6 +204,36 @@ exp2: gpio@23 {
>>   		bootph-all;
>>   	};
>>   
>> +	sii9022: bridge-hdmi@3b {
>> +		compatible = "sil,sii9022";
>> +		reg = <0x3b>;
>> +		interrupt-parent = <&exp1>;
> 
> Is there a reset line to the chip, I see GPIO_HDMI_RSTn in exp2 GPIO
> expander, does that need to be hooked up somewhere?
> 

It is optional, HDMI output works fine without reset-gpios.

Regards,
Swamil.

