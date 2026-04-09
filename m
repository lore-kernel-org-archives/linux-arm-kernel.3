Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685EAE9DE65
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGLkdH85nOLSV7HJSmrpANyS7pnDairVJMkZyQCk2bU=; b=ZcLfSjal0t6BJCflEjURoK2ReE
	2n29cprm0QKtHoZ1LOPnJCvXSrXpJE4dSOBVn6DjaQr3i9n4W1OOQOLsLmVipC3TjpA3s6KDw72sY
	EhylYwXFTsoBBmNJWzgQKjajzkXiSpb2/2TPkYTzAbxOtnwlpH6i3n4Yy2M0gs3CYOpo7A4xR3u3V
	VnyrzYgA5V0gNCYTMPMuC/1Shl8pK7ZhhziK1r+HnTY7ll5kL6/5PsdZMT9qPK3g5pkFzT6bLpVJt
	X9svlZ6zPgqIDHNWk0pMzt3KqtEJF3X0tbcHU6WbOAk4kvz+AzxUVRSut1zdZSwPv6NbZZGe3vQaT
	f949wXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkYd-00000009vem-2yK7;
	Thu, 09 Apr 2026 08:16:11 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkYb-00000009vdn-2qeN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 08:16:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgepfkg1lvZ1Cvrfc1FSc67rZKJ8iH2qRpSFv1M+DXz37zYH8QfuSgwG09aBqVGToBvj82FQktBji18gnc2gYPY+4+d6Cv53K+LyOeyHFFU+p2hmPCQByqb0NJk4clBTQOwfxOcZnobpxUSXDxugxL2BcQ2JxvQwx2JhxMqMLvRgcqUmd741PleTKN45Iz+nnYMdERjikf3kMwZlmRcXYNaPsRB3IaiAEQLbLKMkT+Q8AG5zps2j7CzzCilkK1YV4TLCBdW/EQhJNRYPBc60gN22Al5d5/ag6DsGUoIRXQoqzKbUMtB6XG6B0FsP7WfwFwToUo24AldPlf7XUAc+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGLkdH85nOLSV7HJSmrpANyS7pnDairVJMkZyQCk2bU=;
 b=uXy76mMqcJ5SEI5yRaUzO/UF78TKs1XHIMoNF8OlElWKFCApphWn7GcV6wWXGUdBMmbprrhYSaispz5nN4j1kQta+7PcpJVUEtBo8PfhF3Uf2kWf9hzfml+RGcTtlj9hPYH5PbBygtOuIysqPf6F54hZR/pPuCeiEjmZCaZPFgVxpJvcPINka0K4SVW4FL3t/Wo+bnHlRZb3+eCjpZNy1QdRNeE1lExapLDDaUCayqNtdyJP+zrb/AR0dKl+fJ4ELHUk3iSJie4H2qB5G9saJNZZP7SjwbnH6HF2hIF5z8UBnJT0iTgCERf7E+iKH4uEwfMKOPXBkObdfpKryY5+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGLkdH85nOLSV7HJSmrpANyS7pnDairVJMkZyQCk2bU=;
 b=Kzl/F+Rk8OyuyT5t9Gt7pxhwv3QHT3J00JmDUmUHxv98iqhv0EPm+qMD8RPpsGIUd4QEe/KEdS/uWnMNMSHnbPjqzwLh3PDYaZAcXTLobw45lg1U3xuinw0rfvS/aL2pV8kB4QELjH+iH1xYEDdE+v+j3PzjmbzZO8jMeS+L6Dg=
Received: from DUZPR01CA0034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::10) by GV1PR02MB10963.eurprd02.prod.outlook.com
 (2603:10a6:150:207::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 08:15:59 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::84) by DUZPR01CA0034.outlook.office365.com
 (2603:10a6:10:468::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 08:15:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 9 Apr 2026 08:15:59 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Thu, 9 Apr
 2026 10:15:58 +0200
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Thu, 9 Apr
 2026 10:15:58 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 9 Apr 2026 10:15:58 +0200
Received: from pc36611-1939.se.axis.com (pc36611-1939.se.axis.com [10.88.125.175])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 7F7871B52;
	Thu,  9 Apr 2026 10:15:58 +0200 (CEST)
Received: by pc36611-1939.se.axis.com (Postfix, from userid 363)
	id 7A89E60DFE; Thu,  9 Apr 2026 10:15:58 +0200 (CEST)
Date: Thu, 9 Apr 2026 10:15:58 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
CC: <jesper.nilsson@axis.com>, <lars.persson@axis.com>,
	<linux-arm-kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm: artpec: Remove unnecessary semicolons in
 artpec6_init_machine()
Message-ID: <addgPiI8wdtYldmH@axis.com>
References: <1775710886-13833-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1775710886-13833-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61F:EE_|GV1PR02MB10963:EE_
X-MS-Office365-Filtering-Correlation-Id: d5646465-721e-41d8-6487-08de96103b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: cHNbfkFD7CHOAiXhyYA3kJBYbNVhLWSd5k2WLwE9+iIeICmz4sfLQyJhd7yBP/qZyHO1I+0UrKxaVRUTKUPcf74D/Wvpoe0HBuqrWWWjY6tbLipZ4fonwgrXJY9mahwTw9SsgIXQfhPePc+HyuWGVX3HJBmIBJblr/wVg3IFfsyvLGDGKnlSxluSOnpUY8DLLEc37/EaWq7cp6UkFimtkKp2Zl/PSlIkjjyHCt3OVINBBcVYrnpUIw+C6w/gulssfJmiSy0EuD1tKgugMz//ZltNs3qsTPpMYLuOAFlY3Au6KRtg7NJqF1+Xh7KPcqJhLtSaBt1Gqyt184KACRDTgoSSUZitvwS4NDyXZ55na1Ir9AuJ5sYOQeTCNaHyHCBP+iC0OS1kz/Plt0QCvbgfOp5YlpzydRNoM24aMjeZNN3aZpkwMNejeuJ4QDh6cmMsCQB8oLpAfkG/wicRl40O0uZqQ6o35wzA6uG9Ax7937Gz/YmBSz2uG1jNNTjQ7zcHNk1qatFzZ1su+EBhSX63ZFUUp32T0GO9d2VxfP8u++OonT3Z+rCmwdKj7rpJPu7sN/wzngdKJlUAILUrZU6AvFSI4KyJGf0Qm+LTdZ/4C9qOSK76RDNqj/a/Kv+qUGY2ESaf/RLG4Q5094N+eCRfNHE/KIFtYPN+CeT6edHkJHqJCruji+QyGorr2m4tQOPJg6iWURJ3F2B4cZSEbQ+jdyjMbU5PMqtc73iKcSPCoEk9ixMMN5L7zXJ2PktvK8Ktn+8BIBvdQNCfwa9+Y2HwxA==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E25NViEN0kzWwwsBRchGt+MgAY8qb6489jE7zJ4ybX3q+VmqfS0LANNetmpACnI3i7FY2d1ae90OvGoZ6SFxoacz5CF244kBTAx4D7PeNn/eC+uLXgGsPBBLZs6dlPRtH/IiTtfTAOOLLInCCC8xhbKsLPmgFTPspevCObTYSHacIONBfIqICIMwJs79zsGZB0EL4Kfq1Es836GPxkdPW4gHF6+d69wdUbAQzYISYrif7NvbtdqD0NAARh9bnzzi57NsWztBFumDytkSdd7bncPhKY9VhoRDEgrwwhgrd8BDdjDtVPGkvyxPX9ohQjed0447K7eBBOKvb84DW6Yye7KT1vKCNVqmj/lmuaSqY1Wfydz+d/2zsQzSXo+jY0H6k80H8rnLBCr8PsxHejtIxkpLhLNbNSBS9CFMocvy1dn+G2/WZtl+Ds5FRlceVSjG
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 08:15:59.5118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5646465-721e-41d8-6487-08de96103b88
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_011609_730689_3A381FF5 
X-CRM114-Status: UNSURE (   7.22  )
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

On Thu, Apr 09, 2026 at 02:01:26PM +0900, Nobuhiro Iwamatsu wrote
> Remove unnecessary semicolons in artpec6_init_machine().
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

