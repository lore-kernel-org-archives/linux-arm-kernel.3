Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE61108B8E1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+tMuQ6+ijkmWkAGrmAOavH6O40L35Xsog9Lz1Jw6Bk=; b=jiBJOFdTtn3CknkyE85K7gF0es
	+0Vr91gFULP9Igb7jh43Y1N1UtmEo+GCvPQtoi851I8TVgyZrXNFDbBPJaklEJ588CzcfuKqLauGY
	npDRzq2eNL/a0Q5zkfdWtmz6u6WnDxnOuEJwcbgfsUaRtRlb1Ko3w66gf5/a4ao+QdxfFlclL1h0r
	Ge/MbwV3nuFVWT2NqwwtQAvm/vjfVpGv94qR7PTF209pFbLND89PLf6gIAzQR68MS9WmaFNcKtAI4
	zdQrJXkUyqEbMkbFMvF9OGZ2iOoYybSU//G8AU1N/LtH7voFxF1GfxigGqgo5A+Ism3U5insbonQh
	l9TB3Bew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WJk-0000000CUfK-05AP;
	Fri, 20 Mar 2026 09:38:56 +0000
Received: from mail-japanwestazon11022135.outbound.protection.outlook.com ([40.107.75.135] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WJh-0000000CUeT-2Sib
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:38:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZL2a9/Z8uZyLXfzADx7aoqIkP6uBI3nV5weg4RjXaT0CARaPvjsQ6kyatjfScylsObmqsa0pWER/cEAWTa9Hxay9ygpa/gT4eVW4J4cdKEUMbcSZDoYtSutnlo8D3suerhcnEBnCD0ZEGU1bWjXMdP2hM6y4x+h8nXHNVwEH5rUvqFpW1rf9sWXyE1sKfX1x2WrP9cQ6/CzGnnyg1mQIwtEc9pTt+rY/oxG9PUEtXTowC0UAdvVGAUlpwy+hmGDhQHTbNX7LS0I2gJxYjhZ4QXskXqlaqeXiFRoGYHqLt/Cqb+/ErepwCGg4AANnHn28F3iuWjfYluzMuQ8BIZJVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+tMuQ6+ijkmWkAGrmAOavH6O40L35Xsog9Lz1Jw6Bk=;
 b=r6zmc9R4vA2DQSVklY75z+gsSwEv08gnlC5QtdRatamff/0u+3DgexDi/b6acSRJpUgEJEsk+2kr3QFJ61RDm+XPsCUDVSuDiBT/zB4fhk7RVcUAj+6cMQgqZzoZDI5qc7UTvdTBpIOwuXX2KTCv6v+vfmHAihozzUrmVns75m5nm0v1c8d7eVl52oxm4bAfLVaVkfbNVnyJL1N4rBHrbW05Iaj8llEb6FPn3p5uyEVr/3ovLgFEJCBU1wPmTK71vbAqJjY850RZPzaDEKkspT3aJNldPe0OfxkVsO/qbhf3FidiQTuUDv2iJM1m4Oef7jWbS0l5c/QR3Cj3hv/UDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12) by
 PUZPR06MB5556.apcprd06.prod.outlook.com (2603:1096:301:e9::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.22; Fri, 20 Mar 2026 09:38:44 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:c7:cafe::22) by SG2P153CA0025.outlook.office365.com
 (2603:1096:4:c7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.13 via Frontend Transport; Fri,
 20 Mar 2026 09:38:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 09:38:42 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5B5814126F83;
	Fri, 20 Mar 2026 17:38:42 +0800 (CST)
Date: Fri, 20 Mar 2026 17:38:41 +0800
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
Message-ID: <ab0VoTut0u4f7EVr@nchen-desktop>
References: <20260319101723.246539-1-jun.guo@cixtech.com>
 <20260319101723.246539-2-jun.guo@cixtech.com>
 <20260320-vengeful-violet-cockle-382580@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320-vengeful-violet-cockle-382580@quoll>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|PUZPR06MB5556:EE_
X-MS-Office365-Filtering-Correlation-Id: dc518283-91c1-4f85-5a2f-08de866479eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: OgHYZwojVLXi5GrMG5iwRvMU31kbnXqjNv14ij9OxMCjg+Tg2TV/PTEOav9Sxt0fU1Y6xSHXN28uwtRTxi7THGeDlk3DKNvVXPsuI2dk05YUo4dSfhQTI47LGwsNjbnfTdVqO4iSXz30oIfSgK1V5zy57gCiApdWqQ81DsxXMGf0M4A2t1Qdw8LL3rkN4aR4rpSkonQI9Y3lSXrVvBUy+oKT+KbULQ7Yb3JIvVmMb2qchWhBg9sZ7J/6Yv2pT8s6jc1Tt2JkGMKy69Sk89aF0c0OKguoFJswoYk1yYeWBN5EWSlc+WZIYyUO8CxNJ6hteP7CLTaHvxxL3tlMggcod7aWH0BYWR40tuJILjPT40m/1FJrW9CEj5gxZjX4bl8Ao993hL1ExR3z316XHJQTD6h8prDCs5KchqYfJAEP9k/eZATh10SuTo2X7Mz/DPR2uHSOgQoezs79OI2DabPMnoxEq1NyH6WCXhXSsHQfOn/ha7uha2jT+Hm0mgw1oMfeO7VGCNXqpe2IIGZ0q7WUsOBKS1w6k0BpQXIEy5IB70o9q33QLN3mEW4gGTliieXgMX4+ZBFOpm1JENOkHzLuYKM4u40eNWrnnX5SMDGAPqRjgDL/Mp78cKAgez1ygeFGNJ3LBxlCZ3RYbyQfcJ6SPwo3AA5aq1gdtYbVy7upm+b89BLaM6Wsr1fkEQ+YNycB5E5sgtfkIDjuMvnh2XJtF02PCP0GBsKUx8DZzuLdZg68djPbX/t8Gf8F//mfQTF83UWbPkcBZk2XaxDvMzULPg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uTudb2ZJsafzrlw6fFZ5JtRo/biQTGgJCqsOKo8HcWR6eoULSaW17TgLG6zBYedSfhkaK/lMrHYpWkwcY2Qf7Jd8xs3M/10Egpx3Z9ycQ25kt7ESY5O7MkVt7IzfmYg8TzGOkALM7LZG7dXInSog9ZHnCy+Prx/4AnoYPZhquu2JVyndxbWordGjZ/aWCrSNveR7EVv+YhzBHDmm1aor27GgaviJf3tXMuFsb/k3YmMN1qKxpd9vhCwF3i1LCnVnw60p7DUjtr1PppED8jZ5+Os/xWrWcPTQulAHPQ7685CSLVMe5zoUXZ7uQIrGxz+QtS5sxnkUte25lXE/DKCiR1CGmnNdH1C3Ee7PzhuNbj45tGwpU/42NTRMAZkcGeytfuUh/Ock6ufZ3SQAZe2Z7aEks+kp+vK6x6q3jwKbg3dPSwcZu33sJuXttCqrdtGT
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:38:42.9806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc518283-91c1-4f85-5a2f-08de866479eb
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5556
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_023853_634280_933867F6 
X-CRM114-Status: GOOD (  25.44  )
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

On 26-03-20 10:12:53, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On Thu, Mar 19, 2026 at 06:17:21PM +0800, Jun Guo wrote:
> > Update the DMA-350 DT binding to match the current driver behavior.
> >
> > Allow both:
> > - "arm,dma-350" as the generic compatible, and
> > - "cix,sky1-dma-350", "arm,dma-350" for SoC-specific fallback usage.
> >
> > Also document interrupt topology variants supported by hardware
> > integration:
> > - one combined interrupt for all channels, or
> > - one interrupt per channel (up to 8 channels).
> >
> > This patch is Assisted-by: Cursor: GPT-5.3 Codex.
> 
> Wrong tag, please read carefully the guideline before using LLM tools.
> 

Hi Krzysztof,

It is the trade off for coding-assistants.rst suggestion and
passing checkpatch.pl. Currently, checkpatch.pl reports the
error for tag without email address. So we choose to add tag
description at patch context.

Peter

> >
> > Signed-off-by: Jun Guo <jun.guo@cixtech.com>
> > Link: https://lore.kernel.org/r/20251216123026.3519923-2-jun.guo@cixtech.com
> 
> What does this express? Changelog link? Then keep it in the changelog
> --- part.
> 
> 
> > ---
> >  .../devicetree/bindings/dma/arm,dma-350.yaml  | 31 +++++++++++++------
> >  1 file changed, 21 insertions(+), 10 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> > index 429f682f15d8..3639ce0d5054 100644
> > --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> > +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> > @@ -14,7 +14,11 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    const: arm,dma-350
> > +    oneOf:
> > +      - const: arm,dma-350
> > +      - items:
> > +          - const: cix,sky1-dma-350
> > +          - const: arm,dma-350
> >
> >    reg:
> >      items:
> > @@ -22,15 +26,22 @@ properties:
> >
> >    interrupts:
> >      minItems: 1
> > -    items:
> > -      - description: Channel 0 interrupt
> > -      - description: Channel 1 interrupt
> > -      - description: Channel 2 interrupt
> > -      - description: Channel 3 interrupt
> > -      - description: Channel 4 interrupt
> > -      - description: Channel 5 interrupt
> > -      - description: Channel 6 interrupt
> > -      - description: Channel 7 interrupt
> > +    maxItems: 8
> > +    description: |
> > +      The DMA controller may be configured with separate interrupts for each channel,
> > +      or with a single combined interrupt for all channels, depending on the SoC integration.
> 
> And more important - you must review the LLM microslop output before
> posting and adjust it to Linux kernel coding style. Don't send
> unredacted tool output.
> 
> Best regards,
> Krzysztof
> 

-- 

Best regards,
Peter

