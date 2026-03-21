Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B181094462
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 08:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVPHZ0qhk2hvSe4RCcrdoleb98jg/DeDk3TAOOniT7o=; b=EUnOKgjzeAmbmLfXeilo8dd2ND
	U1TwPkYEIq/fP4THOTv8907qwC4Pq1LYoW2eNfAxRbKiASi5mYIg1J439j2rEbC+SYgaTgpRqbh4T
	B/vJakKXF1xVdxEqbsUFXocma/vR5Dr/x+Tdx1T2QE+GB1CFMDYf9Bt5usDilE+AST+CuSU/9VBIN
	HmGyy4+cfNcWfQCDHRlZoIYk2wJ/Ee5uorJWow2IWCOUnHyvNyp0RaNRCN+22DrM2CrEI0hTdUMfo
	/ouRsz+QmcqyN0D7zdU7dtTKReHltplRjvB5pc95Pbjpw3dBP85UfVpb2Zb+h2cRyrWueyuqYn+tO
	BCCmiC7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ra2-0000000EG4Z-2knX;
	Sat, 21 Mar 2026 08:21:10 +0000
Received: from mail-japaneastazon11023091.outbound.protection.outlook.com ([52.101.127.91] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3rZq-0000000EG2X-1wvN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 08:20:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+ME1Li0KoAFTdzDjg9EDhDKRrLNoubh8FBRgL4Rs3X42T/u/xod3nXgYDGpcA+dekWLG66OtkiEXAZShdTtvDg9AxcONBwXtWYYGBqSy13GjmOc5Pui4aFbOzMPFA+ekp8h+qvx2fMYh44AEX8jtQ4429c20qR6dRePs7aHedGygIwxJhqx1Cqj/aqOSWOmmazJ5y/HsDaJvVv8HZoRFzTyXaY9P/QgR/9WlDsIIlYgIkIEDIaqE8nZft8rIQy7DyVqTrhAuGuBGg35mnxddsR+NSCEIZsZiYiW+o8tzxIWCi9/uCbn4ZcYTOsUYa9AEwg3fUlxOxwyy/i8qeprZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVPHZ0qhk2hvSe4RCcrdoleb98jg/DeDk3TAOOniT7o=;
 b=BES5qeIvIYe1lnYV4T1Tn/6QHxhIcPDowkkpNxDEZxb5CC/SJNu8rVi8D77xFh3S5EPDe4mMeZGzowvCTrMI3TTCQtxiGRgA97VCJaTDuglPGyQRY+8NimfemrrE/TE7NHEFY3EwV7t3ei5yvpkN8gnJdTm2IeLJUEIzIixAS1DSeZC6QxSSD0FhsKh7Ddnxk8UGsMthrKLUK9sTMh7VMCCJlQNyiCggOyngDfH3Tq2iZVSTQ1m15M+Xk8ok/1jjg/f8pLjNVtTyHoz9MyxgSpdlQU1pt4e/si8s0vdbq+jnN/+3tdnJ77eqnlCYGXp5EuSTCFft6qAl9VBnrwoxTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0079.apcprd02.prod.outlook.com (2603:1096:300:5c::19)
 by KUYPR06MB8748.apcprd06.prod.outlook.com (2603:1096:d10:91::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sat, 21 Mar
 2026 08:20:52 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:300:5c:cafe::e3) by PS2PR02CA0079.outlook.office365.com
 (2603:1096:300:5c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Sat,
 21 Mar 2026 08:20:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Sat, 21 Mar 2026 08:20:50 +0000
Received: from [192.168.129.151] (unknown [192.168.129.151])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 07CFC40A5A01;
	Sat, 21 Mar 2026 16:20:49 +0800 (CST)
Message-ID: <1ecfa7f7-63ad-48a7-b033-b51ecee61e0b@cixtech.com>
Date: Sat, 21 Mar 2026 16:20:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: arm-dma350: document generic and
 combined IRQ topologies
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
 ychuang3@nuvoton.com, schung@nuvoton.com, robin.murphy@arm.com,
 Frank.Li@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org
References: <20260319101723.246539-1-jun.guo@cixtech.com>
 <20260319101723.246539-2-jun.guo@cixtech.com>
 <20260320-vengeful-violet-cockle-382580@quoll>
 <40fc5cb7-a5f2-4b86-8dba-1b39e1ea0da4@cixtech.com>
 <21ef18ef-a6e8-41a1-8280-73ee058fdc74@kernel.org>
Content-Language: en-US
From: Jun Guo <jun.guo@cixtech.com>
In-Reply-To: <21ef18ef-a6e8-41a1-8280-73ee058fdc74@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|KUYPR06MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: 3828906d-c524-47b5-1167-08de8722c373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: e/l9aLjihfCIqFIoh+chNazOB9bVvwg6fpi8lRLqxKJs6IuPkVDhR5Mi1/oSs8mxYzwl/TFm1D7E4TyoSMhJbHEP8feO/8Fe6W6jwfyT3CrsNQNc6sFrLLK+jqYipNlshx54fA3hC+KCw1kKlaK+G1DV4mk6FnJgDm8EZ9rwMhti4daKaRD1RdAOLn2s2YvIWHEtF2P1QYExdM60HU3LZBuJFNTHYVGY2tJy3vQ3Z/Ql8/a3S3OSWmMOneCapYN3sDqHBaagnrspnB7nW+xyoxl7P+WkAltXkFjLhO3RJPMKQ4WF+rvFX+j80BESBuWLGlcOgsD4AYZpwE4duTN0R0gAci4MK7700sRXrPX2d3K5B3D+HhoyalxgSJejDywDYcaHDMWarA+90SAdwFM6trNd16wv3U1dKKY4cNapnpOc34b6uKWeGDwVq6K9cxBQpeI2I0kpj7ITz6PqNgwmUmRgWYDYkonF8AsmV8JoXpoqJOWvJ8pxJRU9uurevWEfOKIrOb50Q+vrvAd6MOQq5n0MVtGhCjfdvAFyamLsEVq5BUAt2tApIgTRuQ8VIOtX58pDQ6aIMlGMeiyMTNbHczQzcpsbilZDBHW7jhIx8e737TbiWOuv6SV/v2mF0XXi0uT2yFWNhr0QJ/vtQa2wcSvkxXazgJ2uVrTCsrAn+uEd2Ls6XPnwnzHLdW9TMRaCMJ/60dj5o6Kx2/W4l4cHnLvfspW5m2zA/z0yBO6DtDhdYnweNOUQlSettoQkiZ6ytDQvgZbmEKzY4TI72LJNeQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: T04CD9DVNhSBpBPyaO4QliqJWm6oITxL1f5AEuHybqO7o06qlrPnlueZVqmZoALlga28Jh7GTGxBbv0IPi5BgNOwEurQXHrjBcA5HtcyspogeUyistdOsFov0e1rYSvw+OgweNmI6OvnyveagG2ju0iBUKlvIzWmEl95kqhhjSKl8Wf/gsrNUiULHdWdtXOqYQYUE205DHwVVCyyh68wOWfvOox7QTX0oTXdcM5C+OoHLUV/PBuCf+BNDzWDsJqxYtecsfkul1oGHPgSGDfYPXpenTvWtpYRj39vQltycZiFI/cT4SgZxwOUwdGzL+XtEFPH9vwuZXUsPOnlRNtoQvOjB5/LlTEs9PA+kA/vwxUHKYDVX54nvo6M2iJ8BIFoJqX7F0MuFl/DWXFI8wO4WQDMC0bKds5j2Ox9X+OOMAVxrYvgr2P//P7K/jYW7uEv
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 08:20:50.8792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3828906d-c524-47b5-1167-08de8722c373
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8748
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_012058_558621_22BF49F0 
X-CRM114-Status: GOOD (  14.03  )
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



On 3/20/2026 9:12 PM, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 20/03/2026 11:28, Jun Guo wrote:
>>>> +    description: |
>>>> +      The DMA controller may be configured with separate interrupts for each channel,
>>>> +      or with a single combined interrupt for all channels, depending on the SoC integration.
>>>
>>> And more important - you must review the LLM microslop output before
>>> posting and adjust it to Linux kernel coding style. Don't send
>>> unredacted tool output.
>>>
>> Actually, this part of the description was not AI-generated. However,
>> I’d like to confirm the issue you mentioned: are you saying that this
>> description is written too verbosely?
>> Then, do you think there are still issues with the revised version?
>>     interrupts:
>>       minItems: 1
>>       maxItems: 8
>>       description:
>>         Either one interrupt per channel (8 interrupts), or one
>>         combined interrupt for all channels.
> 
> No, it is not wrapped according to Linux coding style.
> 
> Please wrap code according to the preferred limit expressed in Kernel
> coding style (checkpatch is not a coding style description, but only a
> tool).  However don't wrap blindly (see Kernel coding style).
> 
Thank you for your patience. I have clearly understood your points and 
will incorporate all of your feedback when revising the V3 version of 
the patch.

Best regards,
Jun


