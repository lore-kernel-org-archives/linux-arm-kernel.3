Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545D7F30956
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hSMkVlElClTBfYcUftvSmxqMPWogkjljPOeeXcMdXM=; b=Pirw/38vjVWZOcCYvRo8ssUER7
	GRws9FD06pp6gM0H7xHcMedOT51EPu+hOqJuEek/jaQsbkdj4oqK86bTBUka7BV3N0MtvVAVU4lbU
	SaCDCwRhpbycsgWnslfUzodQSLsRMTgCASGHLdaAVCDMLORnvwRWHJJBXFW0X1l8HXKhbfiN4aLae
	WfEBWM1e8cbYg4uRvexm3XD6vITNSBYbWaUekRKqkFjJCJU5uDhj6WbXflTWhcdTZ2pqxxfEppWYW
	MAJud/4o+ZNvZlJFMIUWTexegv8LCuND3Y2fT4UzOwNYGeIeJoVje5AOxGQDnJsI1mL7DpPxxEoez
	r/92ObZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Ug-00000001rSH-1quj;
	Thu, 05 Mar 2026 13:11:58 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8Ud-00000001rQv-1F0D;
	Thu, 05 Mar 2026 13:11:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmebUp+NSg43P6DrMnWPOtkJ+NVm4CE5rLlAyevCbsoF51fOGJpgvpMX+6hYdIXWHI56aUmgzdy9RTQADPgKjSnJnYebhV9mS+l0koNj1yybjPwkUp0pjFsF+ZsXunA51aUn8vhVp/RPEvad2bmS8XzVEiU5a7f1ARONaXKU1t5a5oOQ6mFqVBP2itJ9KY5Cxs4wyEH3d3CdQtyRgu/u3oRwSU3IodKsTu3N6DIBzuwyKbkXw85lwah0E1XUn6o6ac4aI3OhJDnFZccaScJTMn9f8nj5GRD/wuySh8mz3s9ZQHX7rV+zZPP4hJj53Zv3Qnwx3DTc+cPCMv812dHvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hSMkVlElClTBfYcUftvSmxqMPWogkjljPOeeXcMdXM=;
 b=Eb98H7+xicR0fPOEvFkwucV/95bKRVuV8xg6oBgREjRvSvjhRMg3p499vE8rlgTnyrruwvCbnbBjBwWlDCNCdtUq8zTncwlO7cXFH2rkS+BI7lbDth4ywPcmlP6zcZB8i9UBF/VLO5BPig5t98RNJQ16TvA1reQF+/79KJZzGN/MJmtGQ0P4SOLPYDJhrhKuiyaOEMOuKyv6TsKXW0myp9d7PlzAA7dJk/5j8Mwc1rUWl514PJVeG/WmgtEfyJexhU6ktoIeNWpxwitR7Zzo6ddfIbjMfnpNc/WUZcwKpaQ2JiFCDnMu7gZOaMVTE3nz0dL4if5+Di/IpuV+qr9mxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4hSMkVlElClTBfYcUftvSmxqMPWogkjljPOeeXcMdXM=;
 b=fkXeXFLYwibbaMffWdJVXYF0OpM67RbtwceJfGliKf0rGTeU5UEaQVfaHoGxl1bQ2PkIryyWYDt3iBXJS+tvu14P7W9YO35w98B39Y65loJpwQV2H7vRRYy+R9AZHL0InIFoSB3wOQtMr91aD1YC5p5doR+FmICR5jsuzqX96JQmbUGePk6l8xd+0/nHMdP9NgN1i5gnVunjfeuPStKJj5UJQNTNzOLCYcVbjlkRHEPalT0QxG2eI8YWtwNXBEto06SQRhE4ODNtK66OfDs9IUiNAO/ucSHuJThfhjsSs8FpghnttGKP7GsE+KVnDgQll0knSejdmstRq6vMl7n1pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by PAXPR04MB8079.eurprd04.prod.outlook.com (2603:10a6:102:1cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 13:11:49 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 13:11:49 +0000
Date: Thu, 5 Mar 2026 15:11:45 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305131145.zvi5eor5kj4n3fu3@skbuf>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305123843.i47asdrjychwlgdt@skbuf>
 <20260305130609.GB1659133@rocinante>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305130609.GB1659133@rocinante>
X-ClientProxiedBy: BE1P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::6) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|PAXPR04MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b571484-1da2-468e-505d-08de7ab8c2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|7416014|366016|1800799024|19092799006|376014;
X-Microsoft-Antispam-Message-Info: 2ljAm+k1rZ25I3N9CRhbmc7ttnAAErjLH/n/Ezqn/ICGIDT5mR229+H7KOi/Ch4IFO9csUA9KGhQoWdLrHOgEK2g+46wIUzR2r8ppFF+LUwyJpSYvOhdo55MTE3xNgDcOOPjhNKDKqgyyLaEZY94xyaTzloxmjPXfTimNa9gb3uGun+/R9gvpCrpeIExnDru5iAGeQRxK49a6ZPCi3FjP/iG7aLkRVPifB63M3m1P3vR6Mf0ohGa9lOntJRytJHE0qQSqEKLabnW1u4peybvoXkMd7VsbgZF2BEC5YpkkN9eubPzJJx2fUqhRuHsYjjJSXImCu5/uV3m7QaqnxxbKh/Q+vIfg/NVCI8me3Ehe7kYP7guYgaGs4iSOoZu2kfxwo2Fpwb+hn6xnppJ0nG/BGjuIYWXJN6C54PRne/EmsJYsycwzTonZXaj4Em/zGHEl4NleISmmmVO6N3VsWCb4EMJojnCQQopOeUPmudlKblmFbGWG/Txh+9p/IpMIycjQsJkfPWEBhpTMLajewl4ijspdte8zcUiDNuwAV/DNNCd45n8LGHnz6xlJ9rEPKud5E4ustL7tLedX5fwfoyUWJ8YTl3agyH+3fqR6OxAmQb0p4FlmkK43vL0ZskwOxGpYoZASK+9Db21u7sfkTBf3ehIJtZ2Yw49AUuyObrwYxPpkdyH+2vkanKjSNfkJSKu0TndKz3s+PpksKSVa5l5cfRnDEbWw/bBY8IbEza9Ke0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(366016)(1800799024)(19092799006)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDNCVVJ4bHdJeWRjR0hpa3c5WU5xU0ZxMmZpOWFFWm1mQkswNTdUU3lUM0hq?=
 =?utf-8?B?VitCZDlEMlYyazVJVzRWTEhjL08xeG10SlJ3aTlkMDhlVU52ckE3Z3grSkt0?=
 =?utf-8?B?UjRSbHlVK0w1azJaRUY0R0Fyb0hESnVYSU94RXRuejVESi9xZ1puUUhVc2Vp?=
 =?utf-8?B?REt2MW04Y0hSQ3BSZFdUSm1vYnZFTUgxQktqZUlvZ2hTS2cvcCtMTnVMd2ZN?=
 =?utf-8?B?M2xhNG1IU2oxallRaDBPcU9OZHY4eGNTVFhYTjVyNFNUU25yZWNZMDdQUGM4?=
 =?utf-8?B?UUdPTXZRSFJibG1pUVE1dVBwZ1JPZ09lM2hCblBCVXJQSGw2ODJKVU1NdTZz?=
 =?utf-8?B?R0MrWjM0ZXVNclJpdlU5bjhjNjkzVGNNa3E0aWoyakJzbS9QdEZlR3AzdWRk?=
 =?utf-8?B?MTdpL3U3M2s4bmN1Q2VvaVlCUDh5UHFQWDZqNDM5VVRJdHZMVVhrWjB2UGNm?=
 =?utf-8?B?WnlkTkxWM3piMTUxemlpczhpL2ZCeEZSRTlFb1RtNU9jU2pTa0dSNnk2dXlU?=
 =?utf-8?B?VkhkTXlSZ3BZS2Q1VldZM2wrb3BnUmpDd0syTjVycW54UDl4am5QSEdubWMz?=
 =?utf-8?B?Q0pOU2VUQTV1UjJmcFZLRllDTlJTcTExRnUzSnJTYVpLM2ZnVVI4VUZxUnFy?=
 =?utf-8?B?R3YyNVRWelNwSG9wU2lVbVdFQzNNTTVLMFBUMm5INDNxbFErT0lncWJvVW1U?=
 =?utf-8?B?VkJMOWIybkxNaGFtUFZoZ3hMYTk5RFJ1azN5Znp2d2tDNWU3bFBZTjZoNDhV?=
 =?utf-8?B?MWlDdnp0WUNocFdDckNiWTRLVFp3bWtwcXBreEI3VXZoTlFoekQ2aU5VQkJJ?=
 =?utf-8?B?SThkby9FNnZ3KzQwRmpZZW1nY3R6TGpMK296WWtRWFNhNmdaVjQydG5BdUJl?=
 =?utf-8?B?b0lVQ1hrc1hoTkNFZzYrMms5RjlrK3NzVktvd2ErYWZHU0FQUmFGczUwUHJn?=
 =?utf-8?B?R0pnVG1kK2duZndnTEVhRlIwUGViSkFaclRUSlJqNWpjeUVOTGxKb0pvbEtL?=
 =?utf-8?B?MjVuQ2pqT3NwR0xyTklGTy8vbnhyNVhJZmZnc2JNREhBaks4NFpVUmt3MlNN?=
 =?utf-8?B?T3dFMmZRRE5HcWZXTmx1em1vV2ZsTzNMQnRrMnk3SC9XRWZRbSsyRTRIYTk5?=
 =?utf-8?B?OVhTTTFsY0FEK0UzZm9TQnpTd09MdGoySEJaNzdFZFAySGVmazdYTFdhZUpk?=
 =?utf-8?B?RnlUcWFjbktVSzg5L0VrQ091a2FwU1d4S3pwRC92VjNZM0dkenR6MzF1N25h?=
 =?utf-8?B?bkE3bm9vcmZIMCt5ak5mUnNIR05pVXY4RlJDL3lZQWpNZTUreVpBYkFvSnFD?=
 =?utf-8?B?eXFSa3RLcmNvelNsRzVLaERPaEQ5c0c5c2JLWkI0dG5oL0FEbFlsVEtFY2Qy?=
 =?utf-8?B?cTFGb1B0Sjg0VG44cnNtcjU0V2xKUEVEbUtYOEpEcm40ZEc3KzArSlR6UExw?=
 =?utf-8?B?TlRlS2FkZ3dpZTJ4OG00VjAyK1hFS3dFcFhvbFZQVTJ2dXNUWUgwUUxtMXhT?=
 =?utf-8?B?MVlUS2xBRVhtamJoc2pPOGJSSHdDN040ZXpyNFdUOTU1L213ZmFpVmhUV1kw?=
 =?utf-8?B?UUt1NHlvbXpDQ01EM21icysxRFcvaG1xZEdacVVsaEt5V2k0NVpoYkpYK24z?=
 =?utf-8?B?Z1dxby9FbWNhMnVya0pUNlVadjZTbm9oRFA3Tlk2Yy9kbzFDYWxMY1FEZ3BI?=
 =?utf-8?B?cmJaVlBBbEIxenZHZDluOWxNS1lQVkkrdVppMXRHTmFGRU9Ua1ltZGxNTHM2?=
 =?utf-8?B?cDdTWld5NUM1OE9aR0xYU0pLUFlpQW94bjNSUS9TQXQzUG01b25Ma3NxcmJh?=
 =?utf-8?B?VXdiZWh2VnNQM1JxV1dWMnZFTjVuSCtGT3hvZEt0WDV6L3pYZ0ZxUk1SOXh5?=
 =?utf-8?B?OWREOFhEdjRVZTd1RVMwbUhKZEFlMU1MVjlNV2Z3azR6MzhJYmh2VkVwd1NO?=
 =?utf-8?B?ZGRKcFdiZFFhdERpZDhaSkFqbTYwOUd4eFc1cUpRdUcrK2t2MzFyRjZOYnU2?=
 =?utf-8?B?UlFDdjBldHlCQklOeGNra3FRQi9NTVJ2QmErenNFTW01dERkZzIvNmNnZ1FV?=
 =?utf-8?B?MzRUU1VPV0dJVEVxOGJsS2o1TjhIeUg2U212OUZGZC9sdktiUG9jRXlWbk01?=
 =?utf-8?B?SHRub3RNN0g1QVFHTjIzeW9UOE1OSEVjY2t4WmRScGlRU0p2aCtxbnZDNC92?=
 =?utf-8?B?TXY1L2FUN3kzUmxRV01wUHlsVUthS090SHA2K1RDa1FSckFoTU82L2Vndy9I?=
 =?utf-8?B?R2docFBrQ056ZThSWjl1dVJPN2xTVHlwcFdEODFyV29MZXJ1S3ArTTNNbk41?=
 =?utf-8?B?VjdZOE51ZGNsb3JlaDVKdHMwUDZyek5YV2UvZHNNcHh4Y1NvRmd3YXNDc1Fq?=
 =?utf-8?Q?vbS1ruZ+oVkRNBxyDydtWxDDelbsI6sN2iBS81ZOdRbgB?=
X-MS-Exchange-AntiSpam-MessageData-1: aX3NTqYZlXUn3bTkuzVnmLUBxD0md3Dkmvs=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b571484-1da2-468e-505d-08de7ab8c2a8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:11:49.3216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HrDkPt3rE/6HF4ol/kT/cCP8SJf++cKC9ty6FSnzt32w8+isdUX6uZ8cGubVG6CLj25Tso/9WkTlBciN7mL9Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_051155_338366_870F27E3 
X-CRM114-Status: GOOD (  16.08  )
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

On Thu, Mar 05, 2026 at 10:06:09PM +0900, Krzysztof Wilczyński wrote:
> > > What about
> > > 
> > >   F:    drivers/*/*phy*
> > > 
> > > or something along these lines.
> > > 
> > >         Krzysztof
> > 
> > I don't understand your suggestion. Is it meant as a replacement for the
> > keyword regexes? Your file pattern matches on:
> 
> I was thinking more along the lines of using wildcards, the F: was just an
> example.
> 
> [...]
> 
> > There are a lot of false positives, and a lot of false negatives.
> 
> Yeah, the "catch-all", for lack of better word, will not work here.

But assume it did, for a second. The intention of the patch, stated in
the commit message, is to match on PHY consumers, to review their API
use.

$ grep -l -r '\bphy_power_on\b' drivers/ | sort | uniq
drivers/ata/ahci_ceva.c
drivers/ata/ahci_imx.c
drivers/ata/libahci_platform.c
drivers/ata/sata_dwc_460ex.c
drivers/ata/sata_mv.c
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
drivers/gpu/drm/bridge/nwl-dsi.c
drivers/gpu/drm/bridge/samsung-dsim.c
drivers/gpu/drm/bridge/synopsys/dw-dp.c
drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
drivers/gpu/drm/mediatek/mtk_dsi.c
drivers/gpu/drm/mediatek/mtk_hdmi.c
drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
drivers/gpu/drm/msm/dp/dp_ctrl.c
drivers/gpu/drm/rockchip/cdn-dp-core.c
drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
drivers/gpu/drm/rockchip/dw-mipi-dsi2-rockchip.c
drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
drivers/gpu/drm/rockchip/rockchip_lvds.c
drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
drivers/gpu/drm/xlnx/zynqmp_dp.c
drivers/media/platform/cadence/cdns-csi2rx.c
drivers/media/platform/rockchip/rkisp1/rkisp1-csi.c
drivers/media/platform/samsung/exynos4-is/mipi-csis.c
drivers/media/platform/sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c
drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_mipi_csi2.c
drivers/media/platform/synopsys/dw-mipi-csi2rx.c
drivers/mmc/host/sdhci-of-arasan.c
drivers/net/can/at91_can.c
drivers/net/can/flexcan/flexcan-core.c
drivers/net/can/m_can/m_can.c
drivers/net/can/rcar/rcar_canfd.c
drivers/net/can/xilinx_can.c
drivers/net/ethernet/cadence/macb_main.c
drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
...

How can it find the above? I think you've severely oversimplified what I
am trying to do.

