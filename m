Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE2B108B8E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8GZbaPzqXlxKLuDM+TfBjyOaeC/Soh7/jpxS1F9Ls3o=; b=jHWnYgCSRQUYbHJNkYQm11540P
	y2748ylc1ZgiNYVi5omKaFTg90XQgOknOX5K93/mJXujt9yBZdLq1QOmPihxekOcxPQbaxaqEIghI
	XSXSLb18vqcZJhjAvKoX0wnTxmfpqR2KTCke2MFHXsU8RwbNA6rTd33xSEWuVhCb6TOt/0DGLgJZK
	cw+eK8tBPaZVNBWKSk3k16rU8gD24mFP/9fS7lgXFulMMjMPSDGnJU6W337bzUr1w6IHLXefREnK8
	E0ha5CHFrU4mjA96LQDUk+iGLXml6uUKE9U1XS3aMXsfMgJz99UL0R7f95vqU+YvIKqEM3bDXjmeH
	IhMR2Q1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WdO-0000000CXE7-43kP;
	Fri, 20 Mar 2026 09:59:14 +0000
Received: from mail-japaneastazon11023105.outbound.protection.outlook.com ([52.101.127.105] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WdM-0000000CXCm-37Oi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:59:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7lFuMFykPjRf5jUe1GvkDrpaDziCRDqfbs0ajm5pdvmxhdBq97rZupFe2/nrYwquuOfEpfTGCNPNbjv+/mZgwgK688ZYgXYY29CtZNZk2cXZhkJGHQVrar7xyGq4GoDPkXjBENL9CENNQ3a53ZQq0YIOxrgAYViCdGLz3vHvK/6iWtKsyGEE/jbHgJ7eWNIdpd/7gx9IC6b/EGq2qvH+UzFGyLZ//wzKUp2TWzHsOAtf3VgQTgw4Wp+Kc/EjoyKL6ne8/686ej3d4pc3BddFqyIKX4C+JeaMQvhFG4J7rG7GwpGWkA5YZ0O0810+Ig0HlQMLC5TVu8B8Oub6Jhrtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GZbaPzqXlxKLuDM+TfBjyOaeC/Soh7/jpxS1F9Ls3o=;
 b=kytiDITFhR1K6bxoz0Dfz3ZpbzUph4CzqF4h8ZElANNOvZ02IWb6lMInGQDMIU1AZ6xjfRLhMHYhYlfFeGqqHAQx5+8ogplY/A+1UNFRXfiBb1wGB1MtHzow7++yVY9bRFPsR5xJ0yNyHYNQ4zDRk+1FHHYYiOt/tmuL+dCaAH2O15/xvX4W8h+cROBCA7TqAPmhXsZxvKzrLEzuS9IX/2pBTlrS6X+iNMWUU+Uy7lklUJAi7fqKG786L8pnTKdOByM4kJC+uB7wPEFjvt2uBvKFOQAtHLihztZkNt5LIffSoHQMpPnMsnEz9u8Yk94AoO+FwKgez5XiN2BCLrvpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::17) by TY0PR06MB5609.apcprd06.prod.outlook.com
 (2603:1096:400:31e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 09:59:00 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:300:2d:cafe::53) by PS2PR01CA0005.outlook.office365.com
 (2603:1096:300:2d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 09:59:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 09:58:59 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id DC4FC4126F92;
	Fri, 20 Mar 2026 17:58:58 +0800 (CST)
Date: Fri, 20 Mar 2026 17:58:57 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jun Guo <jun.guo@cixtech.com>, fugang.duan@cixtech.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	ychuang3@nuvoton.com, schung@nuvoton.com, robin.murphy@arm.com,
	Frank.Li@kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: arm-dma350: document generic
 and combined IRQ topologies
Message-ID: <ab0aYUK1NlUV3riG@nchen-desktop>
References: <20260319101723.246539-1-jun.guo@cixtech.com>
 <20260319101723.246539-2-jun.guo@cixtech.com>
 <20260320-vengeful-violet-cockle-382580@quoll>
 <ab0VoTut0u4f7EVr@nchen-desktop>
 <41254f6c-3ce3-4566-acf4-f0bf764565f3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <41254f6c-3ce3-4566-acf4-f0bf764565f3@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|TY0PR06MB5609:EE_
X-MS-Office365-Filtering-Correlation-Id: 521018a9-86ed-4f16-35c3-08de86674f0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 0J2RDivcqm7xKMmYd3XScnLfMkAOs4emr3OoHAYHQ6Z+F8QMOX+PljmruP8okbqQWtfMXzLjEBzmYpVIlmnNOwAD4vcKWbjVsEW5ydVjLdJO4Qku/9RryCyYuBbDiLPl5kHADunmrAQ8/JjFcOSA88YbsJ1O9wqaLq8nWDJo2cshUVD8XfKymexh+10GrPXx5OndYbZ5vvKSxGoufITYy1XoxpWpOOj1eQbafZeMsHJuYTTJQZQaWgRiwjKN+jywIcuQTgMANZkmbVyxmoqFp3xCXqnxnElBTQnieV4pWtdwWTDZDRO9S1yJnsD5AbdoTdA8POC7UUf9Vb4239RZytUCQ/SzEOMGGSpjLush8N7+/7GBIlcSXE5weaebAS/gbnxxAJqaLz34ZQhVhowknI1HUnJbK30i0wJWYjMFP2JIKsEt0WJZRKGgTNHZWoNO3DQ4nIkwhyCXm9o+jJqZ9+d3MbgUQ59316UFlcu7qk5uA7VLOH2QAHJbwIrHEvUp0nST5xe/X3jb1GPT1LdkhIE+JA/PlprdZSxpIPJpFYQ3PT7nwojBSxtj9wMFXw2MiUFO9lEF46B8rxF3LU38YRBaIIbzQiGIoOEKteYqLQpkeg6GN2WfSiR6j19w1v4PsS+10RgDVFdSX23/ep923A29CqMeq1lZi093LTGpwwnBR1mDHU32uF8rNe7rqrPoNTS4+u79vDwTZK/JVG4/+GD7Nj4vBmXHDImLSRhR/I2Stx3yPEFTKM7uLFhSnGvU414oCyVi0nrQ01HFM0BqVg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: h8pPphuYHh5klIs0ADkMWTKFH9oKeC0+iHnTDeUux470SOmZul1RSAlisIlS1EKZKj6T/dJAF8Q3N0x2imtoPAg1KZfHBke3MWb3NO3R0QmJXg8ebPM59Xh3ZWdeRjHQrN2ZqGjYCZqOLlIGIkl7c5RLGl7Iw7UgNlzLwX5MEIeE+FAFCJC9nnFlLz+iAOQjMu62Tv0dRnEpiXRbOGVR9rM8pW3imCnqr9KrIGv4+KFThOo8avl0yUJ1IF6T5daNpyTCCSV1RLh7fQlm4XoAUzPex5WX8q+84F9aPyFrQkDkMbVWv0k2HZILnHJ3Rjuu8sXX3fm1iZZgUwVOm9tVmqM3BNqWEgKoBBMBQzak2ym21f/T3dObCepDrtYf+qaoEbcf0zjbejE1bWhhWgSZpL9XwGtLs5D8dOELZE4Fsk6UDY8IOVGZ2AYb1NUIbVf6
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:58:59.6943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 521018a9-86ed-4f16-35c3-08de86674f0a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_025912_783721_108CD53E 
X-CRM114-Status: GOOD (  18.62  )
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

On 26-03-20 10:43:10, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 20/03/2026 10:38, Peter Chen wrote:
> > On 26-03-20 10:12:53, Krzysztof Kozlowski wrote:
> >> EXTERNAL EMAIL
> >>
> >> On Thu, Mar 19, 2026 at 06:17:21PM +0800, Jun Guo wrote:
> >>> Update the DMA-350 DT binding to match the current driver behavior.
> >>>
> >>> Allow both:
> >>> - "arm,dma-350" as the generic compatible, and
> >>> - "cix,sky1-dma-350", "arm,dma-350" for SoC-specific fallback usage.
> >>>
> >>> Also document interrupt topology variants supported by hardware
> >>> integration:
> >>> - one combined interrupt for all channels, or
> >>> - one interrupt per channel (up to 8 channels).
> >>>
> >>> This patch is Assisted-by: Cursor: GPT-5.3 Codex.
> >>
> >> Wrong tag, please read carefully the guideline before using LLM tools.
> >>
> >
> > Hi Krzysztof,
> >
> > It is the trade off for coding-assistants.rst suggestion and
> > passing checkpatch.pl. Currently, checkpatch.pl reports the
> > error for tag without email address. So we choose to add tag
> > description at patch context.
> 
> You still have to use correct tag.

You mean even checkpatch.pl reports below error, we still add it
"Assisted-by: Cursor: GPT-5.3 Codex" as tag?

WARNING: Non-standard signature: Assisted-by:
#14:
Assisted-by: Cursor: GPT-5.3 Codex

ERROR: Unrecognized email address: 'Cursor: GPT-5.3 Codex'
#14:
Assisted-by: Cursor: GPT-5.3 Codex

> You ignored rest of the email
> message, so I assume you agree that you should not send LLM microslop?
> 

I am not the patch author, Jun will reply it.
I come in to discuss this patch duo to I suggested Jun adding LLM tag
at patch context.

-- 

Best regards,
Peter

