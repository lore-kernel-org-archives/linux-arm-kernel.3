Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637D2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4I4PcVj/DQIkrqNW0Cr97xQ7MjUE7YplRKeumcNzPE=; b=jngbKUVSI/aiQBORfL+2SoEot4
	vA9i95FANCKzX595ZWUVzfk2Fs4Owo4RVWREowqtMH6c8xgWoCjcnehi/3w0HEzytw7qREEUa2CFS
	6GYKMHXwX+5XXdfxWQhY1+rxjePdgpmrlxQCW6FGPXxp1wsp3BKapnw1LmwQ5+8/6tWJtHQYABCTy
	Zoq8CsrN0Ok5RDrDHm8ULZ7xXCq7QBTW436RYL0dfzIGNCOm3hm7OWeGxzixLj5kpclB+sAyZO38l
	AvXBXY6oBWCOaOSOPDTCC1amNDwDO6/xNkONwlpg1axrrrHqXM9l3oQubuv2seU0eo42o0u6gpG1E
	bv63PV5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFJF-0000000FGla-3WBr;
	Mon, 29 Jun 2026 16:58:13 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weFJC-0000000FGkl-3FpZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:58:12 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGUZoV2586217;
	Mon, 29 Jun 2026 11:58:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=V4I4PcVj/DQIkrqNW0Cr97xQ7MjUE7YplRKeumcNz
	PE=; b=VcfoxsicevSN7XaVy6uImFuUCZ/Fp15WhBbzIbEkDJN9GfyKOjs4P9Tlq
	6ZiM+1qqfJGjPOmg4s47hNa1bHpWhF1RuKlzwNbxrgRN8WoAoiRipHxWsHphP5xH
	CSKWls1HDSbY1WnR2PFRhSTSeYkzs+BFbB197i4bZz/N67QnPp6rQKvKVb2dWI3H
	KP6zt1ioQLMUfFTqsdpGb4cefY7jrJcalW3jBFTDVzMDRPiBQcssHt0miWbmNIaL
	y0nr9WOIDSwhCX910YOY1qSIjDCQcyt2vSSfO/tNtjT07tjWkPgNbBbFYz6c5RTQ
	/CHKh6GLgIJKUpSaaGJ13SyqN3h4g==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012071.outbound.protection.outlook.com [52.101.48.71])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f3qngtppn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 11:58:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBQ+OApKZTRsgdsMKXm3nuzh8pvTZrLGSperFqmfl0iUWJfjh+fLinJUBxXPdtudCCHkJVuUmyKD08pAt2FZjtH4xL0SAtk+twJ3als0Xea2DPdSAP9vHbYfgyCQJM2O5H7OcOlZw2jFq2/9GW6QpAZABUJyiZ1T9YxNeRymnysFt7BiE61uHMxo+hZgPJ3LjskGiWfldX7FE5osDiBrFlsm4yhvKCo2ZBiDMBSMPsg69Oy9w9cngkRD+5HaXGQgbcaQxGrMO4NP2SBLu7bxLDyGaB+e8oV8gmQtFtEOwZKaLC1yAxkbg/shlUsZjiibh+KXy6k/tCnV8tj5fhzUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4I4PcVj/DQIkrqNW0Cr97xQ7MjUE7YplRKeumcNzPE=;
 b=eCi07B2NLlWSRZUcg9ZEfxDX9MktnL7kD1TzOUuUIilLzYP/BUaJhfMu+5UDN1DOD/18v3wMp0uicvfYU1bkHuHU4tU50Wp77Ezj9QdFt4rNwVYTx6MQWb67Gf0i30w4zm6h/JctpNyDvtwiXb09MDbqnB33hRcL+o+GjVJEVZX36Z8x2/8gP4pAIadpl8t2KCIh5LMkL2SCaeHntFxSzibkVQ8wMVqDz0kkjesl1QLmn2rdNaOH7yBrIpalY4PxG5tsD9nTR1E1X/BrHrpgs1E0rshyw8epvBvDz+nMsAtuz+c931slXwJJyIM0wB1C5220+eu2NHKm7YMRXeHMYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=iscas.ac.cn smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4I4PcVj/DQIkrqNW0Cr97xQ7MjUE7YplRKeumcNzPE=;
 b=iE3Veyd/x8/q7hPG6loaAYN5tnVE3SvifqVe67zT5nYYNxXIfToCOawBqSGcJT8+trdtuo36gpmOYy0jJweGLcCfyrve5W3HNCgyRyalapUM6cdAPIJHZnSyNWh2KGtrorcDNU+O95K6ONZ7+OTXDTEm692RxumF40bQkMdJDp8=
Received: from PH8P221CA0064.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::16)
 by BN0PR10MB5093.namprd10.prod.outlook.com (2603:10b6:408:12d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 16:58:00 +0000
Received: from MW1PEPF0001615E.namprd21.prod.outlook.com
 (2603:10b6:510:349:cafe::5b) by PH8P221CA0064.outlook.office365.com
 (2603:10b6:510:349::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 16:58:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW1PEPF0001615E.mail.protection.outlook.com (10.167.249.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Mon, 29 Jun 2026 16:57:58 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 11:57:58 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 11:57:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 11:57:58 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TGvwse455535;
	Mon, 29 Jun 2026 11:57:58 -0500
From: Nishanth Menon <nm@ti.com>
To: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>
CC: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH] firmware: ti_sci: undo list publication on populate failure
Date: Mon, 29 Jun 2026 11:57:56 -0500
Message-ID: <178275225857.2162329.7767084803947925989.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260616004741.1726-1-pengpeng@iscas.ac.cn>
References: <20260616004741.1726-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615E:EE_|BN0PR10MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df0aa1c-4cde-4031-3c59-08ded5ff92d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|18002099003|13003099007|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: IRexpSTGEcAARK8jCNBQ+A3WFtfDoo3uk9v3DIIBkWj4Cszq5zhzzWwCHejjo5TVUTzjVg3BCTvwJdOwb6HKHBM6uGCVUpV2BBLQ8gE+i6wftz9nMKLlyKDs1KsQ1zaaZD2zQWda/xmNuOSs1rIadJpraniYXvGdU09DwihZGaH4SxyV6bVvr8Kkg8FpdbhLcStf7tRSg8L3EBB/QJSjboM0laq8l0AvK/SKrfX2MxRYrsE1VoFsZBK8HAt1lY7Qm85WjtRnQUOiXVxbH793fHhllTzWsOCkKBsI6VWe2sv3RXvmXiTAQaKLJlemKEbic+kaiMB5yf0Mq5yiA6E/ARGBHNrXF0poERoWdKTw+woPj3PkoWrLoBbPablBTxYXZd2dGleJJaR2g2zgjN9xoK5c7f+j0g/L3tRzO88prGVkg/9qlQyhdVt0Z16p88JsfgtVPWbBGkiAZqBup9nSV2KR5fTQNt7/kRJWQqgK0h6iobgKoxtuS7bcftmOQ21QRhHRJSheWiHMg2LM5E2EmkXGJcsrC9dWOG0hm+2gLuowJnyGfLPZn6AXHbEGWToflctAx3xXCcaW3JRHVfZIuLzzDRZkmpaWwwyoPuWdFbXvy9/lHW45bgmfUo2RU9Q0h4zQ+VQWcd9qcw8qu00SQGGlBDKoT58AOmgtM3zDQfkw84LvSClTHddXfbZZMGN6HDwU/qwEChoaSXE7a1oD/g==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(18002099003)(13003099007)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EMRieNNm/lZfvf29ZSSDv+LvJeEqzVrjILrH5TW6nImxGalMuhXdN/1FvAYULI480Oxsw7PXwuJupT2N2WaqS12QRc8THNzrRmTPvANk+ncQPWP/ssBIiF58Qr2lJt/5gOyT2AFYZ8MLUjSO4qQh0Jz6HhtMR/Ivq/MpC0HuXYe5YLF24PVanxm9tkxaRWeYHNQKBHACBLs/1nBlNh3XN74keKCkkgnFLyik/dEsvGXkLImegSfzdf6/NCo1CvGU6ofwAujsk8k+0lvpuXLRSVi0hH/8BnqGDvBo9i2TlnaDXDLkX+F5wI38wgmzGw4z/JnIZJwB8JVjdQv9+y4UkVWxeTwVQDmDgRg2UICOAlUq7UVeOtTeBZOTEuSN8zZk6qCyW0nErjyB+5q2PzC44cvl3pwFNDVlTniBgSjqKlpbo7jWJxm88u8QqtRTcOy/
X-Exchange-RoutingPolicyChecked: USZ1DXTI4OFXVePZybrUCNsZFaeDY9yuNn8yw/mLcrs232yFubFh8MfWDuu5dCllGS4bkTCNznKNCeDk0nfA3E8FI6BX+QxqqCzQmG7ygT97iboOu6YqXPQth8+GqZc+TPV68Vh3lP73NldKWs2eJ9hOV/fNXkef/1eAZbPwk04l86mBMVThOpP5jMJJDq8H7AJu+8eWd2l3BQMyZ1AnQN34MRgzDLTUY/PkfCE01dJ0vH2+5rOcR+4LDaDE1eMxcCY/mQGDB4m/1lISB/Rz5/1yH8U9iUPaBiZeisXv2qD5TKAr3ZTfAJKR6HeZL/prmpfJBaqQeGNq2fEAN0xX4Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 16:57:58.8916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df0aa1c-4cde-4031-3c59-08ded5ff92d8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5093
X-Authority-Analysis: v=2.4 cv=Yow/gYYX c=1 sm=1 tr=0 ts=6a42a41d cx=c_pps
 a=3vo4EN8bzuoLd/SmvO3peg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: _U0AsWp0itb3ev-kD2JMtzbnH8Ylc7kb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE0MSBTYWx0ZWRfXxNsqdJZc+FW4
 QuEIa/6Cd1dCTwo03tNheRiJhAlHC4e8K8FSM+gy97vATiExLzcGQcC3DAQ7L3WsOtKWJvHln1L
 +ZdlDeJMJESCK29lCgP1hAJKNhHQcXFNwj1C9MM+KiiIkpwJFWSZu2wmCdZ7DobzxQa+x12E1HG
 p4OyFfc3cUVqOsntJ/NVBCI375U+Dmd7++rtG6C40v+kzm83FaW2A8Co9nv7XPyYY2yc4/PtrnP
 jY+oZsE91AjnAP6ICXR31Pu8i7rAIlBVKXZUoTqKe4zVr6VXAL6SW3Z9rwTuH5Sb8pmRiKqghu4
 QOKIPeLOHrzJd2/FWSm46bpaExDQiVHt/v8A7FX+STyT/yk8x6kzMM9hrrFz1bFHwH9ORVEI3pG
 LDkAsN0LNSSOjtHLAQX5d11Ono2f1jM8+oXuaXbrBrbq+wpGJoCtE3yzvpxfV1riPmWwTM4KIM0
 RBbksCNO79mLVKgeVnQ==
X-Proofpoint-GUID: _U0AsWp0itb3ev-kD2JMtzbnH8Ylc7kb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE0MSBTYWx0ZWRfX9AiP6pIuriZt
 sPMxeCLa81g3azLkuHYsOMgGNfxe5UEw4DEu9X65pd/wuEygFUJ+bnZaGUZx4+XJ3u1+NnZ4ljl
 AV+C1KupU1srUluBr5utf0WqGUsMcCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_095810_933864_6B7B8EBB 
X-CRM114-Status: GOOD (  13.50  )
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

Hi Pengpeng Hou,

On Tue, 16 Jun 2026 08:47:41 +0800, Pengpeng Hou wrote:
> ti_sci_probe() publishes the controller on the global ti_sci_list before
> creating child devices.  If of_platform_populate() fails after creating
> some children, the probe error path leaves the children around and leaves
> the failed controller visible through ti_sci_get_handle().
> 
> Depopulate any children created by the failed populate call and remove
> the controller from the global list before returning the probe error.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] firmware: ti_sci: undo list publication on populate failure
      commit: f52ddaf5e771c753663a719834848fde92b219f8

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


