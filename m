Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AED8CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m83qzHresRiv9M3VTDdDHaSoog7A32xYa35LTpe2kiw=; b=H5o+fZbe6quPRZhrp6IQjYysX7
	r3MwYwuIREMkU+i6rSDfUkkEZoQ1j3t/3Dom/tWAEusZpqVchJT+4Gi7Yp1+eVRlJ2YNOKjLlnyFC
	BvdETUFgqH2fmM1o9pf+CZAjAV0zJltqOorOczldiIOzP2H3OSZ9DHszzrfTB+LIPCCVNOVz1K+8B
	2lZ9IdWidvl6xNNjXafEeQUVecmdPsw/nsuHWPHWAq7LE+CHbNk9tzJw7SyKJ6ooCVItiFmSuxoGy
	5dRUi8qP1VSuSTYeApd1V2IkiglFscxm0Ajs7J1acNGfA3vdKzJszkKeJjXF3cKZYOZKPgBVZDR2D
	t65Zgd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ1j-00000002M84-1RoV;
	Wed, 07 Oct 2026 11:41:39 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ1f-00000002M7K-3CZs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:41:38 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BXd78659757;
	Wed, 7 Oct 2026 06:41:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=m83qzHresRiv9M3VTDdDHaSoog7A32xYa35LTpe2k
	iw=; b=FpEbqRAjTXNdXXpzH+/jE8wNpQRxnYVJY94F9iY2NHgA5pmKDeFRBjETa
	15XO1s8ng0SB20C1+t20RNUyB0kmSHg5gkJEXijNwnEQYXhiQSNS+7HBukkzS51t
	uvCGxRWt4afz8SJDYMTvpyaM2U9dhz+efRk4bboDur+g1l9zGe3EkFdNpgVQOQyg
	jquKbT0u6mpoKP1703a2XwU6V30KCU8ZKQSWaE3lSOs6z2Ss+G9KfYIcbPANIZub
	TKHNunv9kquJ5MjcKrAgqnCPj2snEBAtP+S9ma+gdwuLND2CR2HLwFiJM9cg7tlq
	3xS7HeyyHzmqlmS54YGBpM0OjkHMw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5d5nabts-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 06:41:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvjTcQU3lNt4Fih1riLhozcb8FiLGrO04Xb8ZCE9Ju71pLPQxI/e6gq4W3bL1zAVmTj/uYyXcNYVByyWyhyWcidbSFya9Zbh3nNJCRTDjRrfa4vg0Ydgj+0IBOGNGIz4BzwbX4/jyhjnZgtIFa/isJV6GSW17fEOIWmGoLM19Joaz8+ytEMCN5/1i0mOBAj4lsqDxwJ2BdhL6sC9HOz4HcQ2NHeCrsnqCEQUuSe58dxI5JPWlfe0E7e5YuYkvYzFeu30m1MgNMs7rRFm+5gj+ssT1SyFNu+kVC0h4mewcvhhihqkt/z8iJH+HD6rSbLN3WYAZeMsDmGij1HsmoSwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m83qzHresRiv9M3VTDdDHaSoog7A32xYa35LTpe2kiw=;
 b=w+nuRwoV6PnsuOED3MsKMtP8Sr6qpOoaPpUouMt2+L8X1/8v4xxD/Np464MqEQ+rEBvzY2aeC0rJHFBiAiCqbsoIDsPEztUbJrvyBYXTEZ33iH5rrbdD6asefe2em7L3etGhfI/1lK/6zle5aHd0G1niQg9+wfOxePOqoo6b03UeVUo4sr42H10emFeczzDFVmDfmVvKdSX9vkNO15uyFcqoNGKLOszbw9XZky2Qtc+e/s/yQravqt6DbxSNq/HF8zGWndFcuF9hwD9uXcmBJp0VnmfbLr26C7nNaOu8KJXYtxaXiNHAQwO50fTbEZf2hMN7mmVA6B5jcjNYC7aW+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m83qzHresRiv9M3VTDdDHaSoog7A32xYa35LTpe2kiw=;
 b=eaxPz9hYCVR6E128y/oqXpEoBNizi72ae32HXJvcBURv8HVmpDaL0qPMr4lfLm8RI1mpCcOf9NurhzlHPjr8kS4ekB2xOuNOpXWTwIztLU3Cg7UtAAfkqJKY4P//ZFtqs5sg9gFyM78sRtx5NwCcxqi3DQVwbceKKfgY0eNWVIA=
Received: from PH7P221CA0046.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::33)
 by SN4PR10MB998063.namprd10.prod.outlook.com (2603:10b6:806:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 11:41:03 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:510:33c:cafe::3b) by PH7P221CA0046.outlook.office365.com
 (2603:10b6:510:33c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 11:41:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 11:41:01 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 06:40:37 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 06:40:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 06:40:37 -0500
Received: from [10.24.52.205] (a0512632.dhcp.ti.com [10.24.52.205])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697BeW8T125624;
	Wed, 7 Oct 2026 06:40:33 -0500
Message-ID: <3bad0f50-b2ae-4fc4-8b9d-99601470343a@ti.com>
Date: Wed, 7 Oct 2026 17:10:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: ti: k3-am62l3-evm: Add HDMI support
To: Nishanth Menon <nm@ti.com>, "Kumar, Udit" <u-kumar1@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>, <devarsht@ti.com>,
        <sebin.francis@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260923192643.1362891-1-s-jain1@ti.com>
 <20260923192643.1362891-3-s-jain1@ti.com>
 <d50d1f8f-29a0-4bd2-8c56-d111eed46c91@ti.com>
 <20260929153842.cypdrm6re7zmcgtj@pectin>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20260929153842.cypdrm6re7zmcgtj@pectin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|SN4PR10MB998063:EE_
X-MS-Office365-Filtering-Correlation-Id: 9daae230-0554-4131-9f34-08df2467dce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|13003099007|4143699003|6133799003|10067099003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: j01IXcsS9Ebm+4/6+Nh+SESwJjdkEf6bL3mdZotxkVSrudinJfjnavu5hJ4Hh9eAMrTElbQYdM//+L0tE0NPPli9kPPPJE9COHxDRqVyPnGiTLzOvoHMJczDp/1Gn2JW1vzZo4iao75AM2bjXw94X5Wx9XDyvLGct8kyYCeYWtbuX4ZR938fErhGbtDLZJtnL5NJIlRoE3/qWcbABZbtQ/PsxfDARG5DpOGRQx03TcgH3MGhrOPA3136dt2tPpw7QRw15954hxS8PYEOQThQXV2TocCGh7WhlIXfR3+t1wy48yiVrnKtv7XS+0YAm1Y4HUYlnbhN/AYIxijL7pjHVWMjSYaljm6GhjL70fxES+StFFPOEAR5/DWopCjKP20FKjPTB6FP0PLcBmNhlf6gx07GK8kyw+1LXevVoOvV099KwGmmyH/ElAihLS2aY2WWCTumnWKRacEy0wMqgEb+etCW0PgTNpn/1+DYsFTd+RSgsVJNmyTxeSWIKfwozvt47+UqEzqlTmmH03x2QoGXCvxx8vxNLYKZHJhGhnjrV6TZXKCpXaxgne0B07LIlpofg40rIf/K6LXxc1Lh7WdTgsGKhtFAwbVqMnzUC7mfkAtuhoafk61ruTwaxUeT5YK3IMZtGb8zKTrgNj9DiRUarRC1EGmgRD8gWy9vtxF+jHvjTVie5XPub6UclJKtFsxVV+FnXuavid5eCqAER8W1pw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(13003099007)(4143699003)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VsJUWNC1mXVqp1iGHYxggygMrNCK+6GTEAJWI+6TvpVNOhMgHG8GjWxBVHS9u8n8wW6RW7OinFo+Op75B8GnIvJLJ1qq+jFxK9dYuz1j1M9OcrE1uNARgvgPacQJ6qWdrdasKaKsfe/wmXJ3NRDbRIywuWUlqFROr4TlA0wT0N4EWhZLQqm43+mB5Xx6Q4bDE/tvzr3h79YTpccFMdtVkvYc56l+ZvmkA4zPD0UdoTKhhBV7vlcXVFsuXBJ6O+4aYEpAr+Wyb/sRiD4w/twjteBuJoQoXJeShsFQ0dd8DGlV/x23473MQe9rubTepE6lr4zuSqF3GR4MzvFHvY+4Wo6rG/uiBfCah1uhwJ0K7iY69iy+Njv8GIObSxi6zLEyIHPApcRrFwUXTyGBP1BfJ2XgwXy5B2GsH1xVRGT5G1QMR9/T1GJMg3PLkxOzLhGH
X-Exchange-RoutingPolicyChecked: BX/ulDXT7xK7WNrIMNejhimO1YvrWfyWpeZ9q9e7wAUsH0RZ9BmyD8CqEDlBss5lGBejea6Pfs47ssCRKFv5v/NAMGqgMzIb3Yvs1w6l80SSqs1TjLJUnUemGfKgDSOuTyruna8SZBYir7UISo4Qrl8q2dnJq00aS27fkqf6Zd/DogzTTRI3Jxi0pnfKRn+HM7VwreC/yZ86ebSTS7X8IN60hXVNkemCVo53nyirEImQS61HeZaGsXUv9U3PvyPT2I8Jmx1JIFhPjxprwuUUWOlijhS6K4vWMrKlLGhPDLxNYxNPpQVTdoiNlG5uRlfZpgdeXo90r2fDhDGoPDmtNQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 11:41:01.5742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9daae230-0554-4131-9f34-08df2467dce3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB998063
X-Proofpoint-ORIG-GUID: 4SyOmJczqNpoLLibLvXYCy3tCp30gpen
X-Proofpoint-GUID: 4SyOmJczqNpoLLibLvXYCy3tCp30gpen
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX4cBAlgd5y6Ge
 38f2hF5isfSj1w0As1hMkf2u6wSGxfK+UtFHtxblX3MGLE49SsS/31XwbXBNI2hnh+vbOwJLVrf
 cX6ZfX11jgMMozrmgeeGz3Z9lBCrw4/FYpHiG1TfMFCNgxb+pu1UMYzNLVwcsOrqYX2hKnV16XX
 6cfF+RgtYg3OUAps/jI6hdIeb2g7GXRRMElnE9GE52QD/vMC5eWO6EGWeplcjRZPSyFsB0Mxvqc
 wHj0dJ0+hIARgynA0p++C/z2JGkXTOAlrfZ/UDUOTcHU+/u07Kd8k56qknCTErKzKl/f+ciPHxt
 BmJYrgIlas6imw5ysNKlSVgYx3xp6abXo7bqp7ViWKSU3vtGDTRPqts5Wyg4cKwYVxe4VJbVXgm
 W1h7xykZd1fVpOzAvY3VlYR/Yx1QMkuxPJj4CZQVKr1yAJQg5Km+FDQW9ks8Id9xwhJyTjOr6qx
 oE0EdCQ262q3ac6Wmnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NSBTYWx0ZWRfX2txPAtPs1i5x
 kU6O2eih8SZQsRq7IuFRwL0perjKZeRxn8A/4b3ZHaUa4Wdm2kyRiOKgAzEgJFVYEp0YsP1UzIC
 4zJ3zMAhJRsHAJQEdZkGTgAmiv0Ta1E=
X-Authority-Analysis: v=2.4 cv=S81MU4sP c=1 sm=1 tr=0 ts=6ac62fea cx=c_pps
 a=KjzTqp3n3Gc09/MFY+gPWg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=P1BnusSwAAAA:8
 a=pL4xNDC7_CKcptHHgWkA:9 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_044135_923370_680AAC96 
X-CRM114-Status: UNSURE (   9.77  )
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



On 9/29/26 21:08, Nishanth Menon wrote:
> On 15:13-20260924, Kumar, Udit wrote:
>>
>>
>> On 9/24/2026 12:56 AM, Swamil Jain wrote:
>>> From: Devarsh Thakkar <devarsht@ti.com>
>>>
>>> Add the SII9022 HDMI bridge and HDMI connector nodes, along with the
>>> DPI pinmux configuration connecting VOUT0 to the bridge. Enable the DSS
>>> and hook up its DPI output port to the SII9022 bridge input, and the
>>> bridge output to the HDMI connector.
>>>
>>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>> Signed-off-by: Swamil Jain <s-jain1@ti.com>
>>> ---
>>>   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 106 +++++++++++++++++++++++
>>>   1 file changed, 106 insertions(+)
>>>
>>> [..]>
>>> +&dss {
>>> +	status = "okay";
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&dpi_pins_default>;
>>> +	bootph-all;
>>
>> nit pick : child node's bootph property is carried forward to parent.
> 
> drop the property please.
> 

Sent v6[1], avoiding redundant use of "bootph-all".
[1]: https://lore.kernel.org/all/20261007100707.1065564-1-s-jain1@ti.com/


Regards,
Swamil.

