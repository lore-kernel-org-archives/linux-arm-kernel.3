Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AFBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8V/Ig5Kz/owRshHX3rNyc+rwbBdbaVOPy3Fvbc2JkE=; b=2TcBHnZexZqm1IV3Qryrx6Znlf
	mHbETMEmfH6WFAyDOri3eLh3daaC/km51YKfgHkhG/FFK4eGKyqg3PEmruu+XxLCxbSL21i5TJNp7
	kvoCJJ9IWkPDK1PZ5a1YHc8/RX53XjSLYaID1oaJrfYgPVW4op1W6Y9GGZ5Gyvt1ZyAv6yhSYu0MA
	p+n2UiMW+J8RIHFyxvR0HUHFzOuZXcEh5Ayhk/Gg4ba+dhpow9O+U5qWJE94M6csG1IbvIAs/jd2q
	VW4fadhWuRTgMz8cZu1YQZsCWKIyxDz73jrARcTRb32J9buTCFiW0vDCMcPlSrdUE162NE/C0BrKh
	ntm5peOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9yF-00000004tGR-1Ihn;
	Fri, 10 Jul 2026 12:04:43 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9yC-00000004tFb-0qde
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 12:04:42 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66ABDRTk2640731;
	Fri, 10 Jul 2026 07:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=O8V/Ig5Kz/owRshHX3rNyc+rwbBdbaVOPy3Fvbc2J
	kE=; b=Zcoxqo/bHDny8RvNUgcSdeLKot9o4j+Wz3a8w5x3+W80vP4jMxSUDak/P
	ATYMVJOBAxYE+XEN4g3QQVEsEEW97RsaQkSvRcCfz9WGXLvNL6zR/7O2cmb8zWwC
	HS+ILejNEf5jeT6NksOHh160YiTo4Pyx9FL9AFXpxEDTHI2sFqxNk4XtshRGft1t
	lRk7nNRKvn5HzyRp1TiB3mD8xiEEuBM4FVKr8L14FOXW4oThOVoVl2tB8mB7F7yS
	LRCCJ5efSZzEP5nOwI5MuEPZj9bWfCjXzGl4xcrbNFCTHe0C/pbp5v1Dr69//1Ro
	R0maoygQGgbaWAmdzmtK/+TaP9IXw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fayp4r7qs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 07:04:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRVtUDWkx7ttnFYYS0/CqdpVa+9fJu1+qzXqRjtnHtmGGtA09IAX2MTCdfL/s2vew2zI5ooQAcJSUkZv/5D6mBSGiyOTuEOk0ljYTaJvDZ1ggzRcqqrdj+RnEXfFMuRy3P12Z1TMHLdMbFaIM9qVxTolWrf3nk5hvwY6TyIekg9VzXk13aDGUj9CGtmmXHqNuMuQjvwkZQJeDvj9jgrmVzP/Sou80eTmq+8IUdkYcgvV+Lk8e8cUkP/Adt10dXw/eGPelBDukjP8SuBGfHjWA/V5akzNVRbJB4v3Fh+5FxzMUVadLP0b/FwqS1e9KuQy8G+1yt8WX0B/Xn/GbKWLrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8V/Ig5Kz/owRshHX3rNyc+rwbBdbaVOPy3Fvbc2JkE=;
 b=j9d/pIp2YHfMnPFspDY7/vTdTc2h8dOOUSXAcldMuK1/DL+xd00h8uKs//m1usOwOPkbF42zovPfZlzvSPMlahqujRwrsHU+accWjYkAIW0zJne9tgxx5JL5ovVzj2iZGV0xUL/AaWYrbqrDGGHRNxxyi3Ir4y2NK69tGM+inlTa/uA1UD5o9Qp2UGRoYBn4W4Dis4apjcxWd3u/4Eq7s8L/fTP66iL7ziMVv8XrSCdVJ7CSTGVvZZAk4u76+75Hd7ptKfzl7bOe6rbGe4ckOMpoSIXFSmGfAsHXGlR7uvfGp+j/1azffRagkdf58GAzYcak9yO2yOitjifXnWOF0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8V/Ig5Kz/owRshHX3rNyc+rwbBdbaVOPy3Fvbc2JkE=;
 b=vQVk/uizybdDg3L9/wzS2fC8QhvUvb42BRbOpcQRGrnSCAP68gZjNhOpydmUgBmmSBOg5M1xwvIfEXDtnGMKP4m9XyIUJ7Co03C86o8r1BuPR/EaJPFQXaVcbNNxghaJPmVEEBERgUfFn/LBUiueN80tE0465cQN8z7k3STCRdo=
Received: from SJ0PR03CA0155.namprd03.prod.outlook.com (2603:10b6:a03:338::10)
 by MN6PR10MB8021.namprd10.prod.outlook.com (2603:10b6:208:4fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 12:04:25 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::29) by SJ0PR03CA0155.outlook.office365.com
 (2603:10b6:a03:338::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 12:04:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 12:04:24 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Jul
 2026 07:04:21 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 10 Jul
 2026 07:04:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 10 Jul 2026 07:04:21 -0500
Received: from [10.24.52.205] (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66AC4GlQ3039796;
	Fri, 10 Jul 2026 07:04:17 -0500
Message-ID: <915d82bd-254b-4cea-b96a-5feea54c3e59@ti.com>
Date: Fri, 10 Jul 2026 17:34:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62l: Add HDMI & DSI support
To: Nishanth Menon <nm@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>, <r-sharma3@ti.com>,
        <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260528133529.3476499-1-s-jain1@ti.com>
 <20260529141232.dbtqg6mudjy3dlwh@grandkid>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20260529141232.dbtqg6mudjy3dlwh@grandkid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|MN6PR10MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: 982f6324-7f47-415e-65d6-08dede7b6299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|13003099007|18002099003|22082099003|6133799003|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 4wqmYYU07cWEQl2icFn5nIiLxZuVzw5ryeC2gyoUvkxlKm7GJ2psiVQ5L6Uag/uY5nqogRkfupZVtHzoQh49mOfP20tHFraDprCT1Kmb2d5ti+9gmJF3cHXuwyDjzkm80TWhqhxDDhz4IY3cRmMEDjG5ved3p+igiax6vxFVGIFB6J8UcQXe12w5MIR69rWFUlUqK2e2VpYHe9cpDzdv/52JkBFh+tll18tlyO/bcOzvGxHm+7vZ1//tyUgplI2n/J5vzOr8BDQejoXaP7+y5pULNC2gkySGktQDGXrXUSg0lzXh4IC1R8/Vz/FfZrpmPGLA6ZiW9EgKiAYAdnD+7felB9C6XG7Yw6wWdEMcqv6wz5IC7TcBNxs0Mee5NCImACbEPSaTBCArri8eLYU9yTt5rqGyL0wd8z9ryuD6AZydPpCfCJLV5UGM4e1SqVMkJ8p2nmdHAlFveMXQ8iO1yRcS52py0sPbUWoXxbtEzse+VuseGkvNzfOtSFCp2PM8MCsJ2aF9gSl8h4hAna4T4oJ9xo7RStVVZEJKvBYmXWJhUOB/bX2uaT0sz2cHmn23ZRC2IDj61OWWAXwBTAYyTh8sDiQn0LI8m4a0ABpbS6Fb7TXinEpxNDaj9p79LQ1tiakLTsgDXPFKVo8PqBVkEtnIPcffD9Jd9WXTnDvAI89w2yTM6GUYJ8CMIkdn/y43LRhWVveaRNEMCEiJ1jSQCQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(13003099007)(18002099003)(22082099003)(6133799003)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KlMl9aMF++usXVAvY0b+VTsp/WSb6ehPtc14O4jYgttwTaUtSG5HZCXf3CrPJuqgicc4sBb82YFf2mrOFLsKHxLyh6Sc5W3DOns7MtATbh4seh0p/GlcRW69gadIz0G16i9ZNZ3pliTMP72KTQtJwWP72+er0zDLCeSJTsnfZDjZ49cRImqFbZzbdbFOlf2piwHAvsIAkUmeOTVsic9OWOgBM7PAEhPs14yI6ICRDZjLoR+ye2acbAPcx6juF0FEAnj0rFXlSvOmOIoRcJtKsFt4EGES45WQeXVq+BQI23V948p9+e7IKdghdN3c3FOLgBkv+Nb4xDZdB0kQuCaAokNLsejFZetbF02V+QSiMuPwf83n0/MqcqFkecSbbHjndB6lfN+3vaF81VpiDPoIVwsfyGScKERzCW9jNCEfSFi9xBHu7wQNAaA3uFey0EsH
X-Exchange-RoutingPolicyChecked: ogf36xBpJJCMGGgNEWvCbsqqao7INAY9TMxIHydkd9eDiz/Zxvs6rVEoBk76HMVbOvilovGxSFkLJY6iD/nVldrz/ljJbRz0HLXussd2KJvOAWX+ufv6eeQV/1NvqC46Hw/CvlDrNSh02BaaSrP/w4X9ZpCzOvxQ7/IA+AKEtfl54joVVzjTPcLAOXb++r2F6HLF/t+ma2ZVHLnlUJep8jNHH8550mXBxnOzWLkh8faXrm2zTob4qJrXj2QVaITSPLT+ingavdVkpak4dwNJfkxO+U1N0VsZDekDK9iBekPuA1sn6TR7z5iGS4YiJx1Lx+yZZW4LyP3Y4TYcLmsopA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 12:04:24.8458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 982f6324-7f47-415e-65d6-08dede7b6299
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8021
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a50dfce cx=c_pps
 a=yOesU4ZViNrJhpLvMmxu0A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=vaNIA_z9s0K4UNR8-EIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDExOSBTYWx0ZWRfX/ASgDgV1UBEH
 gOJ6m1LJTQ3LAWEy2DPEKPhlDF49Dx2C7UZT1y67iXofCsXcDo21ZHoUGg7E/8qI2pCp/K3wmae
 SwmUOgi4yVm9gbTwKB0o0vj6zsjM7YWYKzUZie/aFHTVnbnMD0vQe5LJRyJPB5KuBteUCYmA4g9
 j3fkyBey7u9UoK7OPf1efT2KQ6W///w/axNsD8jBxWTxKvfyZ+L6a04KjVpHdN19QJNflJbOrJl
 rs7fNNnl5tzruj+W4iIEAx+IyFY9T4p2YCbQQzMrX3pLCwHl8EFMZ56YX4TPzDwf86syo1HquMJ
 vaJZZFOlUl9fFJxG29I9ezykzN0QHJFJr+qeQLhLY9KRxkUlFFzI0a/8ojQhpsqSXvcAwnK1b2x
 PNhzRcdn4YJ3I54CVSUIOeTtYY5muCkNNjxhIBR0c8XnFhYW/VkzlhYMsi4wPbtkMrZR96NLl/n
 cs32hrl7kv7/rigNsdg==
X-Proofpoint-GUID: 4bKCEW59Uwl5ruXWbSxPz6W2RNo1mojz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDExOSBTYWx0ZWRfXyv6KQOs0aChQ
 +/VYpZAEKpKkcgCs14o4ipBFxxr/d1UHnYN8PBhRhJ6vyYGM9rmDwcuNQ6HVX0k+aFEOjnEEwN/
 0TTQ7LU+601g9grZbMdoiAlPq1nyXWo=
X-Proofpoint-ORIG-GUID: 4bKCEW59Uwl5ruXWbSxPz6W2RNo1mojz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_050440_280541_3CE9D88A 
X-CRM114-Status: GOOD (  18.36  )
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

Hi Nishanth,

On 5/29/26 19:42, Nishanth Menon wrote:
> On 19:05-20260528, Swamil Jain wrote:
>> From: Devarsh Thakkar <devarsht@ti.com>
>>
>> Add DSS, DSI, DPHY, and HDMI bridge nodes to enable DPI-to-HDMI output
>> on AM62L[1]. The DSS uses parallel DPI interface with pinctrl
>> configuration to drive an external SiI9022 HDMI bridge.
>>
>> DSI and DPHY nodes are added but remain disabled, as the AM62L shares a
>> single video port for DPI and DSI output.
>>
>> DSI functionality can be enabled via overlays when required.
>>
>> [1]: https://www.ti.com/product/AM62L
> 
> 1. please split this up. please dont mix the SoC with evm stuff.

Sure, will split it.

> 2. I suggest DPI output be a overlay as well
> 

Out-of-box HDMI(DPI) is supported, dsi nodes are added here to have base
support to enable DSI panels using overlays.

>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>> ---
>> Changelog:
>> v1->v2:
>> - Update the commit message to elaborate more about the patch.
>> - Add dpi-pinctrl configuration.
>> - Update the interrupt routing index for HDMI interrupt line
>>
>> Link to v1: https://lore.kernel.org/all/20260513210942.692269-1-s-jain1@ti.com/
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62l-main.dtsi | 47 +++++++++++
>>   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts  | 95 +++++++++++++++++++++++
>>   2 files changed, 142 insertions(+)
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
>> +		compatible = "ti,am62l-dss";
>> +		reg = <0x00 0x30200000 0x00 0x1000>, /* common */
>> +		      <0x00 0x30202000 0x00 0x1000>, /* vidl1 */
>> +		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
>> +		      <0x00 0x3020a000 0x00 0x1000>, /* vp1 */
>> +		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
>> +		reg-names = "common", "vidl1", "ovr1", "vp1", "common1";
>> +		power-domains = <&scmi_pds 39>;
>> +		clocks = <&scmi_clk 162>,
>> +			 <&scmi_clk 161>;
>> +		clock-names = "fck", "vp1";
>> +		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
>> +		status = "disabled";
>> +
>> +		dss_ports: ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +		};
>> +	};
>> +
>> +	dphy_tx0: phy@301c0000 {
>> +		compatible = "ti,j721e-dphy";
>> +		reg = <0x0 0x301c0000 0x0 0x1000>;
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
>> +		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
>> +		clock-names = "dsi_p_clk", "dsi_sys_clk";
>> +		power-domains = <&scmi_pds 38>;
>> +		interrupt-parent = <&gic500>;
>> +		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>> +		phys = <&dphy_tx0>;
>> +		phy-names = "dphy";
>> +		status = "disabled";
>> +	};
>>   };
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> index a1af4571a815..9b04fa6d2cba 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> @@ -119,6 +119,18 @@ vcc_1v8: regulator-3 {
>>   		regulator-always-on;
>>   		regulator-boot-on;
>>   	};
>> +
>> +	hdmi0: connector-hdmi {
>> +		compatible = "hdmi-connector";
>> +		label = "hdmi";
>> +		type = "a";
>> +
>> +		port {
>> +			hdmi_connector_in: endpoint {
>> +				remote-endpoint = <&sii9022_out>;
>> +			};
>> +		};
>> +	};
>>   };
>>   
>>   &gpio0 {
>> @@ -192,6 +204,38 @@ exp2: gpio@23 {
>>   		bootph-all;
>>   	};
>>   
>> +	sii9022: bridge-hdmi@3b {
>> +		compatible = "sil,sii9022";
>> +		reg = <0x3b>;
>> +		interrupt-parent = <&exp1>;
>> +		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
> 
> I see you addressed sashiko comments
> https://lore.kernel.org/all/20260514112012.0B0D0C2BCB3@smtp.kernel.org/
> 
> but i dont see evidence of HPD working. logs please for the next rev.
> 

Sure, will add logs in the next rev.

>> +		#sound-dai-cells = <0>;
>> +		sil,i2s-data-lanes = < 0 >;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&dpi_pins_default>;
>> +		bootph-all;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				sii9022_in: endpoint {
>> +					remote-endpoint = <&dpi_out>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				sii9022_out: endpoint {
>> +					remote-endpoint = <&hdmi_connector_in>;
>> +				};
>> +			};
>> +		};
>> +	};
>>   };
>>   
>>   &i2c2 {
>> @@ -221,6 +265,41 @@ usb_con_hs: endpoint {
>>   };
>>   
>>   &pmx0 {
>> +	dpi_pins_default: dpi-default-pins {
>> +		pinctrl-single,pins = <
>> +			AM62LX_IOPAD(0x00e4, PIN_OUTPUT, 1) /* (L20) GPMC0_CSn0.VOUT0_VSYNC */
>> +			AM62LX_IOPAD(0x00dc, PIN_OUTPUT, 1) /* (N21) GPMC0_WPn.VOUT0_HSYNC */
>> +			AM62LX_IOPAD(0x00e8, PIN_OUTPUT, 1) /* (L19) GPMC0_CSn1.VOUT0_PCLK */
>> +			AM62LX_IOPAD(0x00e0, PIN_OUTPUT, 1) /* (M21) GPMC0_DIR.VOUT0_DE */
>> +			AM62LX_IOPAD(0x0078, PIN_OUTPUT, 1) /* (L22) GPMC0_AD0.VOUT0_DATA0 */
>> +			AM62LX_IOPAD(0x007c, PIN_OUTPUT, 1) /* (L23) GPMC0_AD1.VOUT0_DATA1 */
>> +			AM62LX_IOPAD(0x0080, PIN_OUTPUT, 1) /* (K22) GPMC0_AD2.VOUT0_DATA2 */
>> +			AM62LX_IOPAD(0x0084, PIN_OUTPUT, 1) /* (J23) GPMC0_AD3.VOUT0_DATA3 */
>> +			AM62LX_IOPAD(0x0088, PIN_OUTPUT, 1) /* (K23) GPMC0_AD4.VOUT0_DATA4 */
>> +			AM62LX_IOPAD(0x008c, PIN_OUTPUT, 1) /* (H22) GPMC0_AD5.VOUT0_DATA5 */
>> +			AM62LX_IOPAD(0x0090, PIN_OUTPUT, 1) /* (H23) GPMC0_AD6.VOUT0_DATA6 */
>> +			AM62LX_IOPAD(0x0094, PIN_OUTPUT, 1) /* (J22) GPMC0_AD7.VOUT0_DATA7 */
>> +			AM62LX_IOPAD(0x0098, PIN_OUTPUT, 1) /* (H19) GPMC0_AD8.VOUT0_DATA8 */
>> +			AM62LX_IOPAD(0x009c, PIN_OUTPUT, 1) /* (H20) GPMC0_AD9.VOUT0_DATA9 */
>> +			AM62LX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (H21) GPMC0_AD10.VOUT0_DATA10 */
>> +			AM62LX_IOPAD(0x00a4, PIN_OUTPUT, 1) /* (H18) GPMC0_AD11.VOUT0_DATA11 */
>> +			AM62LX_IOPAD(0x00a8, PIN_OUTPUT, 1) /* (G23) GPMC0_AD12.VOUT0_DATA12 */
>> +			AM62LX_IOPAD(0x00ac, PIN_OUTPUT, 1) /* (G22) GPMC0_AD13.VOUT0_DATA13 */
>> +			AM62LX_IOPAD(0x00b0, PIN_OUTPUT, 1) /* (F22) GPMC0_AD14.VOUT0_DATA14 */
>> +			AM62LX_IOPAD(0x00b4, PIN_OUTPUT, 1) /* (F23) GPMC0_AD15.VOUT0_DATA15 */
>> +			AM62LX_IOPAD(0x00b8, PIN_OUTPUT, 1) /* (L21) GPMC0_CLK.VOUT0_DATA16 */
>> +			AM62LX_IOPAD(0x00c0, PIN_OUTPUT, 1) /* (N19) GPMC0_ADVn_ALE.VOUT0_DATA17 */
>> +			AM62LX_IOPAD(0x00c4, PIN_OUTPUT, 1) /* (N20) GPMC0_OEn_REn.VOUT0_DATA18 */
>> +			AM62LX_IOPAD(0x00c8, PIN_OUTPUT, 1) /* (M19) GPMC0_WEn.VOUT0_DATA19 */
>> +			AM62LX_IOPAD(0x00cc, PIN_OUTPUT, 1) /* (P23) GPMC0_BE0n_CLE.VOUT0_DATA20 */
>> +			AM62LX_IOPAD(0x00d0, PIN_OUTPUT, 1) /* (P22) GPMC0_BE1n.VOUT0_DATA21 */
>> +			AM62LX_IOPAD(0x00d4, PIN_OUTPUT, 1) /* (N23) GPMC0_WAIT0.VOUT0_DATA22 */
>> +			AM62LX_IOPAD(0x00d8, PIN_OUTPUT, 1) /* (N22) GPMC0_WAIT1.VOUT0_DATA23 */
>> +			AM62LX_IOPAD(0x00ec, PIN_OUTPUT, 5) /* (M23) GPMC0_CSn2.VOUT0_EXTPCLKIN */
>> +		>;
>> +		bootph-all;
>> +	};
>> +
>>   	gpio0_ioexp_intr_pins_default: gpio0-ioexp-intr-default-pins {
>>   		pinctrl-single,pins = <
>>   			AM62LX_IOPAD(0x01b0, PIN_INPUT, 7) /* (B12) SPI0_D1.GPIO0_91 */
>> @@ -375,6 +454,22 @@ &usb1 {
>>   	pinctrl-0 = <&usb1_default_pins>;
>>   };
>>   
>> +&dss {
>> +	status = "okay";
>> +	bootph-all;
>> +};
>> +
>> +&dss_ports {
>> +	/* VP1: DPI Output */
>> +	port@0 {
>> +		reg = <0>;
>> +
>> +		dpi_out: endpoint {
>> +			remote-endpoint = <&sii9022_in>;
>> +		};
>> +	};
>> +};
>> +
> 
> Did we miss routing audio? I think it has an option of going to M2.key

dss is related to pixel streaming, HDMI audio is taken care by the 
hdmi-bridge itself, I am not aware of M2.key audio routing.

Regards,
Swamil.

> 
>>   &wkup_uart0 {
>>   	pinctrl-0 = <&wkup_uart0_pins_default>;
>>   	pinctrl-names = "default";
>>
> 


