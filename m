Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78987F357DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fq8BSo4+PSgv+zWVX93APKDp9dAsZNK+TrxMdFY79xE=; b=3EZQuHYlIO4PGFFcj4X6nSINwA
	r4yXOH+o0twRrTW90JilBPkjJ/TvkH/KPHAgjzR0wGuW1KK8HOtKY/eH5PtkZ3cnVw6+U3PFM2Ngu
	F4/wM8ZetbsVAeMLxFxqekZkYoATAKsi30xqTpZylkz085b/BfUOZB1qRXQQFcyO1F05PwuC5qT4C
	u6S/ceMU15sBhzQ50WpB9+kRqUcSNkyxaoOc07+4pOQ68OhCc6RDwlZtbi75FVU6EMoCum5iLmWgq
	KtrEIDS/NyQV/AsnVHJwz+uwpDKiZJYiVQl/B+q7U9vTn3DDoybeLeNOeEcm+uBX+6ddNJmYtdG8e
	LkSN9kaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvC8N-00000003mZG-212T;
	Wed, 25 Feb 2026 10:28:47 +0000
Received: from mail-centralusazon11011011.outbound.protection.outlook.com ([52.101.62.11] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvC8L-00000003mYn-023J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:28:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujQNxEPy4IAGi85b5c8q/6zhUGqlM8+EqieZXQsayFeBbNPnKrTPPL6yT5qD7Zg3CaWrzAGUUbEUCUqjLA7IWRlwEELy/MjCuGMKuSPvgbNbR0Dn2wqeV1GI9wEc61gZ2Z0DjQuxYulDXZQH4WslH28yAaWrRO94GifFT9qdDmvTzKiiTrM8kNL8Gz77ziXYJkO0OYCz3q42bHRdm0IqpWkQuz8jQUEWrrCkE6hhUw++0kkHvDyPFonF8dJ0e+MxNcYgpg24gdqbdnb5+sY8SiSCQaQUtPAGXg5f3KXabzK8maByWM+FQUwb1oKGUGKfK3L0LVL58EWd3ru1kUPNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fq8BSo4+PSgv+zWVX93APKDp9dAsZNK+TrxMdFY79xE=;
 b=pArOX8+71HPvBIg23kFmc2EQ4xGIgDhLkwyEfqTwQs18tcR7j0+VAPsLqwLajP+Ob+u+iCOQUqZt+STV1OarTa2sfGnCJhsa9g3Tigu2Auda0ica3pu/ZqWbiWaFepeiJ+zSUYO4tasuBHUXRzJ2CiHl6fHYOGPOnj+CWGZb9kZHqQGficHRkHqz76f8Kr0CE0sRqg/iVk+/pQNgTt4PbWUqVTur6c5ffjcOFAL5xVmJdTRNkZU2CFQmrolccYZzc42Tmzw96WjQgU0bghMmeWwXQOWEcDDOsBWTWy1Fts1MPcc5QHkwuWVmtt+21SZ7+tlPEoztcqaACwz8nrG97Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fq8BSo4+PSgv+zWVX93APKDp9dAsZNK+TrxMdFY79xE=;
 b=TYt7RbCHV4pRyN9b3tTcn/ztzXIyGeKpBRbcKJTV19E3dPCAXSXpG8d8iuf8wsp2+o0SK5+MDiQWAvZxUDZ0GZ8HXHLFsrwVrsYmbD29QVCvjcvDovk9lXdi1buYVVTvMzvBXFWrpNFUgVl8ruBIklrT7mF7hw44t5z0Vq+R9Mk=
Received: from SN7PR04CA0095.namprd04.prod.outlook.com (2603:10b6:806:122::10)
 by CY5PR10MB5964.namprd10.prod.outlook.com (2603:10b6:930:2b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 10:28:40 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::cf) by SN7PR04CA0095.outlook.office365.com
 (2603:10b6:806:122::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 10:28:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 10:28:40 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 04:28:39 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 04:28:39 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 04:28:39 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PASdCH284676;
	Wed, 25 Feb 2026 04:28:39 -0600
Date: Wed, 25 Feb 2026 04:28:39 -0600
From: Nishanth Menon <nm@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Vinod Koul <vkoul@kernel.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>
Subject: Re: [PATCH v2] soc: ti: k3-ringacc: include platform_device header
Message-ID: <20260225102839.652wkz4o2fxe5eok@jimmy>
References: <20260220070242.470060-1-s-vadapalli@ti.com>
 <aZ6pQMGJn99ZLWyb@vaman>
 <6b1e747a-fa42-4f1f-8d57-41f9d7b574c7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6b1e747a-fa42-4f1f-8d57-41f9d7b574c7@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|CY5PR10MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: e80ad648-d226-4d00-e5e8-08de7458a4a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|34070700014|1800799024;
X-Microsoft-Antispam-Message-Info: 4Za/S20gl5/aidjzK8NMTHja/c15pTjGMj4AnGulwVx6MzW9d36oc1qwka0Lv6epIq9K0ujJQdsfXo3t/s+2JJPXpqITgU3iYa6DeKCXGWoq6j0/g9QEFlIaS0i539h6RE+yTt+n9ZC8R3SvElbNfm+dnx7i0RymObXVz3ud9QRIKZyUawWuSrWowfrASiDjEbajmkKpfBvZU0IWXhIuybZf2DgRtK22i+ERzB+HV+AS9uL6sSE6XlkV+1nHLnexsgWh4Ju0PcGIq+Br89oJLeRYGqCVoNhyTREMoBPX41k6y9W41qCuzozr0kFE+BBdjgvF/cbHC5gIMYvGYWwUqUTQ9C+xFYPZvPUxjiRpYuTNTxiefTLL3mcrh792b+kD6RKzzOGykhr7HDYhFTliIFgzpnKODp6CP2R4U+xBPsXUbYCi8fGpzAVbNMDR/GXAmG7LqpxFmKQai7p0ybGIwb0rjZN84zKYH5NIPDN5Gk6kBM/vpJHE90OH6JkbqeNm9CUuBCnnjRTNd/HjAUdn1tBl7zBnVc3JdB7jsDufyQtU9KF7sbckai+rgCXtnXfRzBpPI9Qg3zSjn4RCmwxIajxk9LQqZPT5YcsL560p1XLHgL0AZEnYc1DyoVFz9LMNTMNfbWFwLBdBoZqGUIyXq5FVNBfgfuFBHcOrrb87zEM0OKvxbrfIZwHe8F7bG68PCek/FrnbJGzpWlFURi7X5vz6GATgkDhBv+k7qklogvqaiiRup8ofpwgp2xVu4B4YBKlyvKiocDvK0McOjE5T0+FjImBVmvVarOa0UBsH6x1afD5RKTTJwVCwORa2sL+XFqRaRnACpLNSbkay7ocCPA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(34070700014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RUlDB56lvWFE6vm6NJPs19IZP9Tw9BRqa9/CzH51oeyEEBADDhROS4gVXBM9YO1CnT4LNRhvgESQqXsWk8w+V1RoheWDuyLmTHMn+L42PXPchn1zFgkuICg7Scy1+E4I0XXd3aLxWIeM6Svjwl1ZjnnobqXP5/r5hkwQUJh9MoamUvAc09Fh2XHRIUr4bldO3TsVu2hoy9Cg6I3i/X0XrVGoENSj/nkOImb8xfgE4F1AaC6LLshJJQc5QyfY9EOVl91/QePbpZ5vkIe9DVFK1gg0e0BsBpf2rN+975aIBtmYfNn2TFDJUlLcyX+pb4kdFYPHCfaV2+n2fU06bBJvHku6S6CTVerAphJJnDZn6CtSsTig7Xc3dXUbbs+X0MNvQOYrtSmpCTfny3BxSS4AAu6+oDJ8XaNqsNFF3OnQgdJgoUPY7bfmAt/trwb1puZ7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:28:40.0426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e80ad648-d226-4d00-e5e8-08de7458a4a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5964
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_022845_047047_4546351F 
X-CRM114-Status: GOOD (  13.81  )
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

On 15:33-20260225, Siddharth Vadapalli wrote:
> On 25/02/26 13:18, Vinod Koul wrote:
> > On 20-02-26, 12:32, Siddharth Vadapalli wrote:
> > > Users of "k3-ringacc" APIs may not necessarily be platform devices. Such
> > > users therefore will not include "platform_device.h", resulting in
> > > compilation warnings for the APIs declared in "k3-ringacc.h" which assume
> > > inclusion of "platform_device.h" by its users.
> > > 
> > > Fix the compilation warnings by including the "platform_device" header
> > > file, which should ideally have been included since commit under Fixes.
> > 
> > Which tree is this intended to get picked by?
> > 
> 
> I assume it is the SoC tree since 'get_maintainer.pl' doesn't output a
> mailing list apart from 'linux-kernel@vger.kernel.org'.
> 

drivers/soc/ti/k3-ringacc.c already includes the header.. so who needs
it?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

