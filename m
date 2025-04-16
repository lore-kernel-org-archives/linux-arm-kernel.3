Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAF7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0Xisywrxi493e4looxVWRV4NV8yOgQRE0t8nAqGR74=; b=t7RPsmBEp2+0wf9t99VXAt8xHM
	2Qs3txX1Or6awR1yRO8uv2/3tjGhRz2anuN6/DEfhPJWAHAPC3Oob0gxZDXiOqFt6mxcjql7O4cWl
	OJf9IIZDhkir/BECJvCmEgW+w+dJhOBUVt8nNA7q03nBPK83D9rMcgcC9I6XMOdlhvDm0DThsnQvl
	BEXk8+HfoufCE8oUkIOYIJySR+hMRnWQflBo4TiCY/CJCP5pAwVTOyqLpVfIeXk6QmO5jlIqEQEH2
	GOgTmDcTB+5g4ZfwqXsoPvVuth1WsazuZybTWWRuHaYB8Ku3+zy4xedqta3tYBjnaZd5i8TkYbzWk
	6lshstiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rXh-00000007o0G-0xDU;
	Wed, 16 Apr 2025 01:26:21 +0000
Received: from mail-tyzapc01on2097.outbound.protection.outlook.com ([40.107.117.97] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rDG-00000007kfX-3VV9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:05:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZfXwvDr0oQiTQ9BqbPET3ETPOMYad6D0FFyt9MLug6LOzIDvlQxD9QjPkBWHs5Ou8hIho1hX4ntezwOjtzwQK0188qPS/qMjsuFUi3OGAw7nrHuDeD2oYxBK/VmX2sgxAUUs4X1QT4kRzqut5Z2JG9qirjgqzZH6ylXfsbVxBWI+rQUcMV2EXOHtOKR5NdibvbeKfY2Dru7eFAS9isv0trVgdYEWbPyYa9Za+y2VXr+O4Jk2VsdeaUwVqx4kcOUpRnspvDgJM8y8F2ifTZquhaQBDEFL6Obq57PMyOOUIXpXW7Uk40AWIde/N8VakzkIpQsCY3ltduT9zKBdeRWv5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0Xisywrxi493e4looxVWRV4NV8yOgQRE0t8nAqGR74=;
 b=VnUvxoC02Upv5YzMoYIbYIVrnnpBshnMaeGCl6J6gwfgr+I3Y1a0CDoJslF0YU3R4dJ9eTlaUY7TirPt8nd2BNd/in7rMfL216urvUbEpOYZick7ln8Jlq3DSNJoTBO6mKi21s0oL1fflo7un4dAFsWyhgvAMeCQYUi98bCgJJMAdMirXpKdISTZUaV5bBYUo0qiX/UVp9+7DGeRwxZhC+AXl3W0cmaT8YxakH2jBUTiYP/ysFzubRddiMOmjARpH5SIBHSAsixX3XISYaARIGfyEvXRxv/L13/FzR+hcfvdTtUD9evNsNtXuGShHPZA/+n/laJCSTYuNcq/ZKRj8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR03CA0117.apcprd03.prod.outlook.com (2603:1096:4:91::21) by
 TYZPR06MB7063.apcprd06.prod.outlook.com (2603:1096:405:40::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.32; Wed, 16 Apr 2025 01:04:48 +0000
Received: from HK3PEPF0000021D.apcprd03.prod.outlook.com
 (2603:1096:4:91:cafe::ae) by SG2PR03CA0117.outlook.office365.com
 (2603:1096:4:91::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Wed,
 16 Apr 2025 01:04:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF0000021D.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 01:04:47 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2754D40A5BFB;
	Wed, 16 Apr 2025 09:04:46 +0800 (CST)
Date: Wed, 16 Apr 2025 09:04:41 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: <soc@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<arnd@arndb.de>, <jassisinghbrar@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<cix-kernel-upstream@cixtech.com>, <maz@kernel.org>,
	<kajetan.puchalski@arm.com>, Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>
Subject: Re: [PATCH v6 06/10] mailbox: add CIX mailbox driver
Message-ID: <Z_8CKa0SwPI8-MEY@nchen-desktop>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-7-peter.chen@cixtech.com>
 <20250415-beryl-malamute-of-kindness-7fba06@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-beryl-malamute-of-kindness-7fba06@sudeepholla>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021D:EE_|TYZPR06MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: a1fc3cc4-4c8a-4e5e-aa76-08dd7c82aea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vfGa5E5bLORTiYnHysBPkPUDrJeHjtIHlf1UDpsuva0JVYB25xLAPTY3Lsqr?=
 =?us-ascii?Q?l1TFI9XpsiDuUzt9BR8wicSAvM83QW/PXt9pCD1A7GcyQLJdy5yWAgoA5XQW?=
 =?us-ascii?Q?b0Csfniz/I2/V//YXgjkZtAkQD+hr+gm/lH73bYTTzUgahFwTlVIux8F5O1r?=
 =?us-ascii?Q?i6Yg5U1zfo+aPLvmq0d3XhsjW3gbY/gXBd5aDeVa4AXY2UZ/CeXK/fwgWq4f?=
 =?us-ascii?Q?4rQXL8t8eYM77GUxfw3AK+BSndhAjfUE6EIeXRAigCxgQLnR+9OVDqSUlGL+?=
 =?us-ascii?Q?5aOyUm37cFX5OzhVrz2TOJYZxq+mEC6fcS8eqlWEKKnBWJsHWQl5nkuS/6nL?=
 =?us-ascii?Q?4eGA34YeHorLxuZ7HfxS5qczkQx/5ZglXQtIyHz9FKyXm90mi6o9jY3ZaJ48?=
 =?us-ascii?Q?zcmhmNQpI0ZyeuKaDXToTLiobahkGS7WwPD8jEggU3+ed1hzFNDffDoq8sj7?=
 =?us-ascii?Q?NtMzzqWuQ8bxbC4D+kHSEYKn9rWT6mSCX7RVghaLbyAXsno7OuJTRXEAlUMT?=
 =?us-ascii?Q?imSh/Eix65q85mYAC9H4BymCisDal+fS2NofFkfZGzJVjjWKyVxvkS4ojjAp?=
 =?us-ascii?Q?MIgZJj4IkH/pzdQ7ybf6gbEnIEBod0WYoSl9K4FXQ+ZoCc2LZEE2AzMUXeNl?=
 =?us-ascii?Q?FCgYsOrRM7q4y/hqjO8tsfYX3MeJ5Iq/ehNLUVx0em+wuHe2UGq2/h0KPMxJ?=
 =?us-ascii?Q?YRmM7FB8b82PREJ9H9iUGbJpfn7dP2ZJ+oicmRcv633VSbQr0hzjTb+kQZKo?=
 =?us-ascii?Q?wwVXDmGDFZ9/z2SrXKpu2yVt9eHCopqOos9NUu60l9tgZO27Lfm0WEG8RxC8?=
 =?us-ascii?Q?l6U+Pk/77cry52UK8ipL4YxS7d9jrOt7XfaCBLlSV0rjrK868q5lTefRuk5w?=
 =?us-ascii?Q?z5BKUuWlmj6hGQYTOy60/SMH0h9fG7RwibplXVAWksHZQfaqATZKsf6x7l3e?=
 =?us-ascii?Q?37ECP0TVFLBzCJ9Fs5UvopiuUFYi4MR09WIUYmwXT1YVLu/gxOEjmmAs60ef?=
 =?us-ascii?Q?sjiDtDbznIFmWnKb3ba1FC0YIqoYw3SiCSZvAqpiSWII3GdPHxWvS/9DnmIZ?=
 =?us-ascii?Q?3pXk1+EDe+48sIcLdJlY36etPuIxFtPeqp91dc6RamjYh9pJAqIIdC4R8MJa?=
 =?us-ascii?Q?VBpIox+Yf6bd4tRFd6H/hXPnnYYKpxedNrem33i6nIO+pXhOHj6bsfCGK4ua?=
 =?us-ascii?Q?QQ5RLqgLGL27I3C9DT+B55rDl8bFv+kKnRBRRESdwMspbaphKWrfMPuDxNav?=
 =?us-ascii?Q?bvNnjcskRkjcPMmxnS13lRN1L8rb0c4hLP/E3Xy0KmNVepeNuWR2cZG15sNO?=
 =?us-ascii?Q?pKTOHFRfnbZvEOY1lsq+OGFwBvXv2J3Cw6S3MkuiYFf7EDOmsi4mmFTybopW?=
 =?us-ascii?Q?PMFF/beXfIfdrqIq9ID2RVXrHe97Xn+ncm7JOtX9QksVo00qTZZRsL9DOXAj?=
 =?us-ascii?Q?4Juzkj/T0Y/p5bLYebM4wpf5pTtyx+tL04ZOL8b3TdEZ34OQXdsFO3JFspid?=
 =?us-ascii?Q?E3hr1ehrR8ufYppgp/3roau+9a2smsziqH7D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 01:04:47.2016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fc3cc4-4c8a-4e5e-aa76-08dd7c82aea8
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_180514_879878_98B145D0 
X-CRM114-Status: GOOD (  13.67  )
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

On 25-04-15 19:39:21, Sudeep Holla wrote:
> EXTERNAL EMAIL
> 
> On Tue, Apr 15, 2025 at 03:27:20PM +0800, Peter Chen wrote:
> > From: Guomin Chen <Guomin.Chen@cixtech.com>
> >
> > The CIX mailbox controller, used in the Cix SoCs, like sky1.
> > facilitates message transmission between multiple processors
> > within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
> > and others.
> >
> 
> Do you have a specification for this mailbox ?

Our TRM is on the road.

> I see lot of resemblance with Arm MHUv3. Is this a variant of it ?
> I just don't want to see a separate driver for a small tweak of MHU v3 IP
> itself.

Not from the Arm, it is our self-design.

-- 

Best regards,
Peter

