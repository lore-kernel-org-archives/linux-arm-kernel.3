Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDE3D68BEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6K3Eg8AvuIeUoMVrDm6wtS2dCgEpyH5xlzLJ3E1OhC0=; b=nxgPcdL4CvGvijsqL5d7leVR3R
	LRGztOeIOT1ngvr3HrphaHYgMB5M44Cds4lv7P+qeOgcuwrEgoZhi+hR1Of4r2TUdBo1M763YGbe2
	XAEmY8UjTCkpFNkHMtPySxLpg+raTL9r8wCZdHAXzgVrh2vB2hXT7PFWPnTrTPXvjbamDQH8J2LF7
	yJQOGVv9XTuovt2SbYc0yZeepHMdxaDRA+cCEWaXt20VVcU0V1cKV1TrKUTO/DKTFHVHYhJF381Wb
	emnZF1YPugOButAZ5uyurDRNTcqa9XuPA4wXSc7Z8OE1dgA/ACl8/Py0FGTV3EJYJu3fLDr4bvYUt
	OghbqWPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9XU-000000084TM-0KHR;
	Thu, 18 Dec 2025 08:39:12 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9XQ-000000084SG-20dc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:39:10 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8T7lL1865169;
	Thu, 18 Dec 2025 09:38:53 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b3xb73c42-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 09:38:53 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xANgAke8qvAuV/WVbSaS3nEveYdy9pIZeRwBWqRn1VdAEcT8h/z6yWco0F3FFCE/EwdwbGLqYmEXKE1bPaT3Ag/ql48LO6+PL3zERerGijo0KQ5nfAjkB+IKdrIbWZKvHGui68MsESUNucsEKRQPmsNFKeMz5O6Jvpf/Fq9+ohtb/KNY9GeMb2HyOTjEmq8Jz/z51uIYHpLyg87fCpMa7xJvkynMfuStynsidDa4My+4CO4WLwaGAoviJNZiptee5gxe9ifkAJswgAg3RhAJKLMKC50SOFKYO4wi1BTgZRaeu3ldLSNVNTuAnz1NnPHWnJDELOp93lIIuCkuIQLsLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6K3Eg8AvuIeUoMVrDm6wtS2dCgEpyH5xlzLJ3E1OhC0=;
 b=Ps1oVy+hr1RNV4Q7IGJJFCU+TrJL6i3wbcY0wy9LwiW1p2JXNLA0ecu5EYHWh2Te+OZ0vmCTDOvpc04vCGiklOjwK1hNkso7HEBLvwZPTsPU+olpifz3Tb2npJb2ZrTwNTZvZAY43sRwu1770wPCuC3hxuPPCTnAkGVU+XIr3Skx8O7WJ0HRP8j/ThRRUFoHduRxfWdz0P1+kFipXuhWvn8mpULKhMYgde4kiwaMk75hArMmKxcA+vamBZe3txX96Z0DjJm2L7+aJZ+muu6nQIc/SA2ZEh/0FBR3jzGvU9fyHS6SHZwhQn7hZvWjLL0Kit45BsRAkM5zZwvP97kMGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6K3Eg8AvuIeUoMVrDm6wtS2dCgEpyH5xlzLJ3E1OhC0=;
 b=b53je7P8/8iyRT3dODKgEAE6JBHOsolXtqg3hW6CicOG+sUT9qZxKAlc0M2ZDgFuwiqosi7rsaZToTD2gw/ZHYW4dCby5U6P3lLCapXASrm0cHGpQpoFUoqyVfL/tUpFXL1iIMMoOz2OBENihhyPCDTvfg2Mll+75/8Xo0RSmeB3uD5/Khh1S4qGBcL+GsAb3kuztCc2SS/vgxNrhb8oaRUDzbZrHzc2wtoGuLizENHG42qvwzqwAWZzL7YgJ50dVl15gH1W+x5XE68YHdmwy68zVduYH67NhgAwTn+QFadv3yAZrgbyI/SCjSFYRqXWTiXw2OzgNDdeYdDadl7zXg==
Received: from DUZP191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::25)
 by PAWPR10MB8090.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:391::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 08:38:50 +0000
Received: from DB1PEPF000509F8.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::ad) by DUZP191CA0021.outlook.office365.com
 (2603:10a6:10:4f9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 08:38:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F8.mail.protection.outlook.com (10.167.242.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 08:38:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 09:39:36 +0100
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 09:38:47 +0100
Date: Thu, 18 Dec 2025 09:38:40 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Mark Brown <broonie@kernel.org>
CC: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/4] spi: stm32: properly fail on dma_request_chan error
Message-ID: <20251218083840.GA1530150@gnbcxd0016.gnb.st.com>
References: <20251217-stm32-spi-enhancements-v1-0-943348b8ff66@foss.st.com>
 <20251217-stm32-spi-enhancements-v1-3-943348b8ff66@foss.st.com>
 <129a4deb-ec9c-41f0-910c-57cd43d17fcd@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <129a4deb-ec9c-41f0-910c-57cd43d17fcd@sirena.org.uk>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F8:EE_|PAWPR10MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c2c1ce-3793-4b9a-5a90-08de3e10de2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X1rXs8vguxoCw5MUiGW4oYZ80G5XQTBIGjOlY1fhgTpvuMCd6XSdDxlJ6tw5?=
 =?us-ascii?Q?EMAFcQ0vj5GLQpgLsF4Fjqt52dClVunnRgApuvsgUSuU3kD0JXUKBS3vaHOu?=
 =?us-ascii?Q?njwlWNhtYqcJ8WJsjNosgIwHIaI4tlY+ty9XXi+sxYgsLMOX2/Ahjo433dgK?=
 =?us-ascii?Q?7++JE6/gj22QTPrjmkapa6cE5XtzSSSTKzceXyLbKiaP+1lxlruMycs3AH4t?=
 =?us-ascii?Q?+Y+wOs0eOW44XJQFAKEOMGCjpZcWfNKqDUZn2X8s7z/hZ6rvZNQgIIuYoCwz?=
 =?us-ascii?Q?xRbvk74sMOMIqZutoAXLkVxiYIka5SPHEMVeYBFkA1prsVZlpDUQblWmgTBK?=
 =?us-ascii?Q?k9PrFm8x6DbD+83WntHL0qchS78YLxHTyye2tGhVvCBkVT1fWLO3rG2QLocA?=
 =?us-ascii?Q?WsNaigPDhX1BcnploypbNDIyGPdQQbECDb9f4k6lchgecR9bnrQLPk8TauRx?=
 =?us-ascii?Q?CaSsiey8+9iKhtnl/mWu26IhNeN2FptmDZudfx463h0D6n2B+sHeYwFp6bBz?=
 =?us-ascii?Q?UAwMGuo8qB3mu6vrA8gP0QD5fCIef1KrYpMEl60Rcq0dAGWjr6nlbEnxL68A?=
 =?us-ascii?Q?Ychxs9rDun/XwKfbxi0UNvSXhmU1Lzgo9EgPiPY+RPiVH9nBuVKQNwCfC2WO?=
 =?us-ascii?Q?pwIlyF/e8RSXD722uBz8jd+9bE44gbIMmtpyPUO7cyVE9mUi223Dasw+1McO?=
 =?us-ascii?Q?98yVc5nPuhCpGDT1qqXWgciE8Qpg0sdF2cvxvOwzXlrm4/Zm8tqENuHL2tuH?=
 =?us-ascii?Q?Y4U1U3eXlpGhi9XwtOmU3aHs6Wrjon9mL4J8b25KQYl2Hr8+GGF8v4Na/vzb?=
 =?us-ascii?Q?0jNZ+EFVieHfsKwW4MvHSmBZI2nYpuQ1ow83VzmfFLvB7PB/uZTgvh8cvWq4?=
 =?us-ascii?Q?a+edNUz5II9V2gS1LRMvEbXmxD5dr1zFH6UGEEqWpvAPrpKsw0yiGMyBHIlT?=
 =?us-ascii?Q?sp0P6gFcWe2szJn0RkvrWasZ0ikCpwrqUZVRtV+GX7NhQG7vg77UiQuGsJje?=
 =?us-ascii?Q?hlmpBvZT7S3pFgMWtqGkCDJK1pvBgkdpInZtTNcSDpwnAK1K8E9DbA3A5z1H?=
 =?us-ascii?Q?kArGcYbgsQDgcBffDprk6X81+2UvG5AnahwoT0mbB4arzkxvktn4HQ3aMvMz?=
 =?us-ascii?Q?0VQW/Yxbieq7XuZAMVC5JLbZfPS7RF1jv292g+EsjTsgggM8vsjl9eaUasTv?=
 =?us-ascii?Q?UkRLJpUTQVFK34/F8fi4i+n7Y104R6MP4furpWXtpJuwmBcsqMJQiOkeulJo?=
 =?us-ascii?Q?Jxmb2GS/fCItuKLcJFa2T+X/J43nCD6LdfStBiPTWrcMQRbDGgaPUX9LOsbt?=
 =?us-ascii?Q?yDMmWmISQok2X6+Q4H1JwX73A9d/mUoeoPohPnvtZ/+MfxB4ZcxY3Wt7wBwX?=
 =?us-ascii?Q?rbjUTdA7WzUQ+oX9eDk2ZnLWtDyDLIV344yAQb8hpkIA8+70Dew96YAppPyA?=
 =?us-ascii?Q?S4v5K4iJ94mZ1Mi//OLMI+MlrI9LDqx3gVY6eHNhviXgdWDnkj0pZjvN/uNV?=
 =?us-ascii?Q?NDVAUO/G7fWAt8kU1gCr1ybWfGbAZoe6Fkttya00T8szuL1ktA6EumyhCFQm?=
 =?us-ascii?Q?A+CeasCYiNvmBRszp24=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 08:38:50.0047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c2c1ce-3793-4b9a-5a90-08de3e10de2d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F8.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8090
X-Proofpoint-GUID: 5EvYtxyEQ_urIhPFOwGyZqJhDepluN27
X-Proofpoint-ORIG-GUID: 5EvYtxyEQ_urIhPFOwGyZqJhDepluN27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2OSBTYWx0ZWRfX147SD2xo3LX7
 cI270uXKN4DzJAhXD/ejyecO3RNmlHXwponi/9I/xX6O1MzLO1zjWY0aPWktT2zARxau08uZrwP
 zzD6H1sbwBiD77hjgfHB6n4myqKf7fsvPDWzS8de/PjwwulCkdQX9hPgvH2Czdzup84nSSsR0aZ
 +CRBe7MF0l9qP5n2dqwZ/WZuHaddWHfQvad4iqeTAiaNUWbcUK8iE3CzQ4SuFimQTNmy2+MYz04
 BTJOd9dGL4i8ddXqwgFJ3KXw3xwANogTx14cspqAIJD33IyWR5WNl5C+Y1w+cgg4S48cTNm2kCt
 vI3rMNIYdmm1zkabl2gRF6zoaeXVPpbF1sBKiksW4DxuwoSIgdlLJt4KsJPV1O0HEvsjocfUVhl
 TCgqdrC173BRlOkxWUL3i+XSY1IBtw==
X-Authority-Analysis: v=2.4 cv=NZfrFmD4 c=1 sm=1 tr=0 ts=6943bd9d cx=c_pps
 a=p/fnoOkEHhSpgVuCFbvG3Q==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=n5dE7JB0mAkA:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qSryCWycJXiTd1dYWqQA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_003909_138995_9B9EB9AB 
X-CRM114-Status: GOOD (  13.83  )
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

Hi Mark,

On Thu, Dec 18, 2025 at 08:00:57AM +0000, Mark Brown wrote:
> On Wed, Dec 17, 2025 at 10:51:33PM +0100, Alain Volmat wrote:
> > Correct handling of the dma_request_chan call in order to avoid
> > misleading warn message if no DMA is provided within the device-tree
> > and moreover fail if dma_request_chan has returned a valid error.
> 
> Bug fixes should go at the start of serieses to avoid spurious
> dependencies on new or cleanup changes.

Actually I wasn't thinking about requiring this commit to go into
stable branches. Without commit, the driver will still work even if
there is an issue to request a dma channel since it will fallback to
interrupt based transfers.
This commit makes the error visible now, ensuring that if the
device-tree indicates that a DMA should be used, it will either be used
or probe will fail.

Alain

