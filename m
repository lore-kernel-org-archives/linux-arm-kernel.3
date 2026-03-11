Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08213104C00D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7LBMlarO20SL0CPvMPbtTv+sV8mzdvYBl/HxReP5eI=; b=C6nREtl7h5JAYNkrxdOCbcNEYj
	VMw6743DHD2rL3QO5w7rNoFnez+QAg/HEUWS7FL6o2Q7G8HBtcGBYtjJnOr5A39IkRuOHxKyXrB+W
	3AzUvOU7eziatdwGdncSG1GEZXzJNEJEs+R6bvE4tdj7HQUqiWg6Jfn6/FPIWVE9bRkPXoqNWfoEv
	/HUzf7p0IqUc/nFZ95W0VFleyHCeGD9ELSaN0XWk+s+en3sGWdKInEL+9ItYMQbuIETFWIkRay/Ve
	Kr/aLGyLo3QjI8Nb6/0PYNNjeM9WGFKF+UD8cTyz99IdHll/Noa6bNezHRAH6p2aq3fjIa21l6iGO
	kbXgsSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IPW-0000000BXeO-2LIm;
	Wed, 11 Mar 2026 12:11:34 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0IPV-0000000BXe2-0kDg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:11:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hcLvzIcfMMWVlQR57Mw8QVAssRuHPHvXuU2EkSfWm0lyq4w2SwrnxAVoZ9dLP6NqTvLjRsb8wM88HbGvjJC/X5+oSIJNU7tuHjNw4V1pSf8cqzfe2ypD15ywN8UkhZ0NELUlih8w+EoTf2gOYit/mcMKazXTwwwDCHIic3fIeyyezs+KfSf8mH9kwshAsXNS+PXmRu4eNp2DKaxYPnA2QELiEEj7aIGZMe+v5g+bO2OPlXBGhdn8ErTF8m/eyk7HKSNgTg4QxiTpFywf5nPPLaaPHG32qbFUZBwBYBi0mZy7VfCihPvF4B6/2oUdam4AG5r4nWXxxb5/23E2b6n0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7LBMlarO20SL0CPvMPbtTv+sV8mzdvYBl/HxReP5eI=;
 b=CKUU8UMgIPPCTvxTqvcYn6wTZ1SE6b3XnnSkQBjIIu75V3EaFCsSpJZOwFpdaV+SlgWk9lTIyC/OVECNndQARkgZzWHyQHAjeKDVUvDscPyyZiu5TQI5epoJ7pQpoyxpd+A/Y55anuYdbw7Ql4EqH1KGHfG+2GO3tEjmHK7KGSxdFZrjD3hkzvINoOEtqUPx46MEqc/w5lYJJHMW9OYWtg8YkEag1mPrmYF5YXlq9W0xmQWIOMOtPZR5osEOL9w8X4cJ/JpX0YdDB2xq1VJCmA+t51O1MC3yU3UFp0TMU+26nDc2B4UK3a+Qb9ThIC+xkp1rg9c/NhK6hYlNQOxdeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0018.apcprd06.prod.outlook.com (2603:1096:4:186::8) by
 SEZPR06MB6973.apcprd06.prod.outlook.com (2603:1096:101:1f4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.12; Wed, 11 Mar 2026 12:11:18 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:186:cafe::5d) by SI2PR06CA0018.outlook.office365.com
 (2603:1096:4:186::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 12:11:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 12:11:16 +0000
Received: from ZicharPC (unknown [172.16.64.205])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C0BE14350717;
	Wed, 11 Mar 2026 20:11:15 +0800 (CST)
Date: Wed, 11 Mar 2026 20:11:14 +0800
From: Zichar Zhang <zichar.zhang@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.chen@cixtech.com,
	fugang.duan@cixtech.com, jank@cadence.com,
	cix-kernel-upstream@cixtech.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
Message-ID: <abFb4vkslyyWqpCS@ZicharPC>
References: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
 <20260307-foamy-happy-bumblebee-cddd75@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-foamy-happy-bumblebee-cddd75@quoll>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|SEZPR06MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee3e7ae-0910-46ed-dd34-08de7f674bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: wPARhD73VzyB7c3Zh1egrZNBiRmx1w3QIL5bWa1eWPca+euyguc9ABFfuaLTduw8cl44PcXy4Z76fT4KJMUQXn48yez2OUInAKmCOgPwIlwz+UsADheUvT48qzvtGsAxrgSn6ndlFLzDTEVmK0k1Cvj7eAU+VgUBzKi+ZPdwYaNn5lf20vSMIHG/2JqDGmv6leIS3Z/DG81HX3AqANwtjFaI41DF2NOliu53mGFsX94pNiY9+FjjHBJBmCY0s+GSdpH/jgC8Kry6fo0MGK1Fl4c8ZSdQdS9Rv4sNx4yFrp5eKQKoLYAFLG2kZXqs+M3QcMLwaJKImwU8v1gKGlmg7fASOenMBmCUX8ex4XyofnjzV6rLxCo9RUbCPoNxTq4FQl2NMcV/n4NDDaW7w0OgAKiNDgSLKj5o5+aUszV43nN535eOuqUWrCso7f+GwM3s9+cmVqYEIfeY0w/uloNXdclYHy4l9Dh/L2be0lmPRq0hR6u1OML13K7ITTJXolNl/dTkyHDWmkVkco8E03PHgX2CTBw+2l2dDpfMfyUsxVTcpOl8wuiwJ4A9qmV10dQd0FnmXpeY/iLe/eiwkQl0s+ZUSCo6ygkaWqIv9dh4vpTbmzVkv6Hwhoz61IeWoyVky9J16304L6A/r84VzemW6fv1tDLMTgTXIzVNnBbaErUg7vsNTl/CIHyRFQhfI4ptP3pxqHicLOJqtm/IL0TsJMIhmN0uq1pSPJRfIS43Sqfm4bWlLs0gNxgeJBvI6FYD3W80gxSUHJWFIlMZSffPZw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mtgaMhsASjD2XZg/NBj2nvNwAVcIAGGSpGzSN0DJ0hY+xJyWplxc7iU4Ok8zWlby0qot0W/rNZhj6owkjvc0I3zx7cHEBBk0FeQCf7tBARq23SmQkckGPZNDOKRhVWiaR9jcafTUlinqRHyQpkoNtruJ5jDCEJy+N94g++xtBFVAWOfJbV42aE3qz77ee0hRk2v35gdWDjLkUGJRkcWgAltxtOoObfx1CDbuGv7Sduyqus1fdONQs/bcuQasEW22DpLjee2Czerjd7HaHH0seJyzWTHc7/VQWI6xFPf3K6Z7H3IpUXe6idVwFEv59z9QkT12jUdv/NANEL9k1s90+0m9ab9LiBjpHNlj0hbgHsNhAGa2keeZmh0uYfwP6jm5wClDsKyIWkwLnXDvZ7QORoHmmMpsxllYzcikqiAn5I6Oi4lsdLl84RBGLg5SLub+
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 12:11:16.4418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee3e7ae-0910-46ed-dd34-08de7f674bf9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6973
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_051133_218891_342FA9E3 
X-CRM114-Status: GOOD (  23.63  )
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

On Sat, Mar 07, 2026 at 04:19:50PM +0100, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On Fri, Mar 06, 2026 at 05:32:37PM +0800, Zichar Zhang wrote:
> > From: "Zichar.Zhang" <zichar.zhang@cixtech.com>
> >
> > Add the optional 'clock-names' property to specify the name of the GPIO
> > controller's input clock, aligning with standard clock binding conventions.
> 
> No, there are no such standard clock binding conventions. DT maintainer
> tells you that.
> 
> Otherwise explain me where did we document such convention?
> 
> > This complements the existing 'clocks' property and ensures proper clock
> > handling in device tree descriptions.
> >
> > Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>
> 
> Messed From/DCO.
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

Thanks, Done

> 
> > ---
> >  Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> > index a84d60b39459..c242b31edcbf 100644
> > --- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
> > @@ -24,6 +24,12 @@ properties:
> >    clocks:
> >      maxItems: 1
> >
> > +  clock-names:
> > +    description:
> > +      Optional name for the GPIO controller input clock.
> > +    minItems: 1
> 
> Nope. From where did you take such syntax? Missing proper constraints
> for names.
> 
> I don't see reason for this in the first place and your commit msg is
> really poor in explaining WHY you are doing this.

Thanks, I will remove this patch

