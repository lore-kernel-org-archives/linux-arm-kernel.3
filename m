Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD69CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1K0zYdHPGQUZZsiUZVo0z58uPHv9FJmkPfbhVyEk8o=; b=u4zeZ2gL+8LN71/eHgw6AXXjqG
	sD+O3mmWW7ymioCeZpYsLgJk9FL1a0f7aaxhNIC93vm5tJOKnxrMYR+9t6UIRwmF5O1B7FHKdcPo0
	WrDzHZO5nqBsV1o/kF/xz6dyqaosX1t9peNz+OSoSCQXe5XzwcdcXeA6tDPPPDc4LYUzvZzs5614S
	s6WBIlCI+7rmIFgKNuFXBg7DyvEkR3zR01MjyguIldDshbzmDm2h92QItakgXX8cEgQHKWi30fz5J
	f5RMqnlYAizzRpkQTD8391adzrwsulWkjAr+xwsi9klP/b5Vow2yzVUAOltoC0sNiko+Kg90RSo9+
	ef9FML0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHYt-0000000G9vw-1mpV;
	Fri, 10 Jan 2025 16:08:39 +0000
Received: from mail-db8eur05on20703.outbound.protection.outlook.com ([2a01:111:f403:2614::703] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHAG-0000000G2rD-0zXD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 15:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYTXt9fU7cuitySgXp9UkeeM8asfgEk/jkPUL3spPtJC4p7zEEjK69S7kT1s2sZ99HKIX5WHgqUmFcEBXLcrn+IObVsGQlNFtTt86bf1OqrP2PfP0E/aFdpDihgbnop0F3D/XHRSPJnWTTmkIypVi2V8AvfAaF5LO5kxgbDVf5xh1ayR4SET0p9ifCVRrd4nyMZdA0ecXVwI0GU3kq22vXPNMHsyY9cJS3osAvivbYykhXsiMFDpaHichbrBc/CmBsJYtdW4Eu1i69u7g/1QFbkKGyMWCYBaFHLP81AcNaw6qaE9rJrVi/YH1Sg6aTb0RjB8dRzNdSjE2n5LVXvgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1K0zYdHPGQUZZsiUZVo0z58uPHv9FJmkPfbhVyEk8o=;
 b=VV55bQ61EY0GbOlx/EKOjsDnTRgjAdKftGdCQjAT301UkhpUhsEcqfMnWmirqL9pjb7lwv/i3kv8Ap7VLAgOaQBA6/CNYhRxavzdvYcO0hD3WMZ8YDwSdrafftKiz51tll/pOsHk/bKO/MFmkxPgEvc5X/BbwBKTYsfMCNfP0UevspbyRfV4zYINvsXCBUy3rbpLSjI7ILOyJ4nAUeGr9LFJXJUlTorcHvPROlFrdHqrdWsdM3Oyyl/1bY82brrTOKjVzIj0eX6ItlAUh77pkSxxBDVXya5JFB8ahFVKe6rI+fXAKFzmkMKPbpv24j7RlaPkuJ6I3+bkK0mMPTwgtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=uclouvain.be; dmarc=pass action=none header.from=uclouvain.be;
 dkim=pass header.d=uclouvain.be; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uclouvain.be;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1K0zYdHPGQUZZsiUZVo0z58uPHv9FJmkPfbhVyEk8o=;
 b=Gj/PDm3eJXw0pey6lYcUzBAhOH8Lw8nabiEAfqa+fNSi4XoXiI8UuWUwPZojT5Dgx8LAX8VqGWzGjZiYAbn5wyZnWAps4ObNtdWjkxl/MX+jfSeTmStUwqdIVrGPpEOzSuMpnNQSItxbf7PUGGC/woAzK4Y3HpjDjsOqepzVDoWOqqrKgtfzg1zVSLkIJekq4zW7cbklfYThDFGz6ZWJYj8NZGJs6KZXiCsXuvGf7SIpqvAR52/gkMtsVebCNsKqDEmDATCn/0Sxz6TRDCWV5wPDxdxMcjqy9WGLUKeWIq1mrALOr3Ofv9wzgcdpXYN98CIsZh3VrZnb3FucFXxpjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=uclouvain.be;
Received: from AS8PR03MB9047.eurprd03.prod.outlook.com (2603:10a6:20b:5b6::13)
 by AM9PR03MB7073.eurprd03.prod.outlook.com (2603:10a6:20b:280::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 15:43:06 +0000
Received: from AS8PR03MB9047.eurprd03.prod.outlook.com
 ([fe80::c90e:deef:6dcf:538c]) by AS8PR03MB9047.eurprd03.prod.outlook.com
 ([fe80::c90e:deef:6dcf:538c%6]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 15:43:06 +0000
Message-ID: <5e10998e-92cb-4073-9c2a-3b816bbd52bf@uclouvain.be>
Date: Fri, 10 Jan 2025 16:42:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 fuel gauge
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
 <20250102-b4-gs101_max77759_fg-v2-4-87959abeb7ff@uclouvain.be>
 <74430be84cb49dc0a7413656a2923facc021cd15.camel@linaro.org>
Content-Language: en-US
From: Thomas Antoine <t.antoine@uclouvain.be>
In-Reply-To: <74430be84cb49dc0a7413656a2923facc021cd15.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI0P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::17) To AS8PR03MB9047.eurprd03.prod.outlook.com
 (2603:10a6:20b:5b6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9047:EE_|AM9PR03MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b644705-a128-47d1-91df-08dd318d79f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGt0WG5Gd0Q0N3psZnNFYTBDcUR5VmZjOERzWlQxSXFHMHlySnlxT0hhc3BF?=
 =?utf-8?B?NUN3MXVhdDZ5MTFiRVNrUE05aWVoSVJHQzRqR0N5aTI0YzBwYnR6b0owbVBV?=
 =?utf-8?B?OXROTlVnREQrWmxzN3RYdWVEKzZMRjIvNE4zZWI2Tnd0dHVJQzVUQzBkMjZx?=
 =?utf-8?B?blg4K0NKV2J4RTY4c1pTTU4wTGZNblNxREpGK0lUUkg1S0hLTTI2TGFPZkll?=
 =?utf-8?B?NmF1dzV0UFFHcVlJN3Q1aGlXSko5aWxQemZkQnBLZlFTR3FTZTA3NmpIaG5D?=
 =?utf-8?B?bzl0UWMrdjNvbUYvdHdCZE5NOHNNSDFKMnRKU04vbThLaDNEQ1pUNTh2ajNr?=
 =?utf-8?B?ZW1DTVZ2OENFRlZSbnZjOXBndTF0RS96RWRkVGhuT3R6eXc0SUpGRkpFeXVI?=
 =?utf-8?B?Wk5iTHVNc2cyc1NER1dxckJyZ0FEU0NxZTNZa1VPMlEvem5qQldJeVFDVS9I?=
 =?utf-8?B?bHA4ejYzekZCOEx0SkZENENCQlBaRXY0aDYySmk4YVVYMkpVQzFPdE1jQWZV?=
 =?utf-8?B?SldMNSswL2p5OGkwaE1FQ0dySlRXQ3lFdEl3TytCTVRFRks4bTFZWVJ2Q2NI?=
 =?utf-8?B?WlRLcG9UUnB5UHpTY3dqekJPaksyd2ZPNGo2QzRuY1JMNnNkQjhVRjlXSkow?=
 =?utf-8?B?SFNFNjJqRnR2dG8xU0N3VUt4OGUwUU9rZ1BJS2NXUkMveC9mRHpuWGJZemww?=
 =?utf-8?B?K3YyL0owOXRJRmJzTzhOcXJjd2xDR3M4UzBseWpLM3ZlTGFJT0gwSmpUYXZ3?=
 =?utf-8?B?bXlvQ0FLY2V3WnRUTlUwaTE2U29xalJ6bDRSOVR5Nzg5NzhOMkh5Z2RFcXBS?=
 =?utf-8?B?YUlFUXVYcllUaXI0aEFTUWxsT1EvVy9sZXo5ZU40cjIzVGJSWmpnR1BBbGpL?=
 =?utf-8?B?U2IzQXlteTZVT3dlbld1a2hKeXplQ3ZKNXNNTFNva0FIcEIrS244SzlZYTEy?=
 =?utf-8?B?RUprTFlWbGk4a0ZPTjBhTmZERFNCbFdFd3dnbXRRRHF5UE1zODZhRitMcURW?=
 =?utf-8?B?L0VLMzZibkNvYUo1NzZjaE1ZQ3ZJNzFTVVFzUEdHaG94WTVBZDBzUzZMUlV6?=
 =?utf-8?B?ajhIZW1ER00vTlB3RkhGQ2pwemJaYmllTnlvV3FwUStWamlmTTRXdGhwalcr?=
 =?utf-8?B?ajgrU0pKK09CYWtEVTZDOGx3Wi9rb2YrbkpJSnh5dys3dnJjWnkrQUVtc3Jk?=
 =?utf-8?B?bm91MkJOam1CRjhZN1I2dXMzSEFjSTdtNldWM3FvTE5nQkM2Z3JBVGp1RExa?=
 =?utf-8?B?RWN5TXFvZDJac01Id1BuZlJTV2plbTU4SUV3QTFZSk93eTFVK3NtRzMyRmFI?=
 =?utf-8?B?ZW5mMXNBU1BMQmhPSFNxM3AzYTNUTlh5M1FTK0NiYlV5end6WnhGN3FDTEtF?=
 =?utf-8?B?RU5GK1FMMmxMRTljSkVMVy96MW1JNmNDUThaSWlNV2dhN2tnK1lWdElld3gw?=
 =?utf-8?B?K3Z1a1c4QXljWnFrWmF4L0xheTFuWmxubzZUeWVjY1htbVorcTZhMEZ2cmFo?=
 =?utf-8?B?V0lsU2hQTGFObisyL3kzNGhEK28zY1BjK1ppVERPV3o3RVNneC9acFZyNWNP?=
 =?utf-8?B?dktXV1VFbXB2c3Y5R3FTYm0vZ3Y0OE5SOEJzeTVlU0s0NURFNnBYbm03VEV2?=
 =?utf-8?B?ZnJxK0cwZVlTc3J3aERvWmd1amRYR0JZTDN3WVNxYUcrZnhlUU5SRmF4WXQ4?=
 =?utf-8?B?T1gzUEJlMGhOUU5uYWdxbW1wSjZuTjg4djBwa1NXeFlQNEZYUjJpdTNPdmx6?=
 =?utf-8?B?R2MyaGdkOUdleUd6QUVuWWRMZmJrQSs0RXBxWmlwRExFTjl3ZFVJN1U3am85?=
 =?utf-8?B?M3Nwc1NkcWtOYkRaQ1dDSURiRUtxYUVJcWJFbHJiSUNDV1VDZStQUStKV0xp?=
 =?utf-8?B?am1zM3hWN2NJUUE5b3ZRRVM0WklYSGNnNGkvVDdIQ2RJZ3ArTnJnbFdtTFZ4?=
 =?utf-8?Q?A39X++4uy9c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9047.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEV4MHdXUTBuSmZscFlXMHlnWGFCTXU5UE1DSm9xMDNROUxMRVI3YjJ4bitx?=
 =?utf-8?B?UVphRjBGdWx6ZFFqSi9ob3VNZnMxbGl0Nnhqd1RGdDlscG1MT2pXU1BiT0ln?=
 =?utf-8?B?OHlQMjhmanF5bjNQMysvT1hhWmtmSm9JSjZhMzU3MmJzNDVsT1JRa2tDOGxI?=
 =?utf-8?B?MWhWNExpZUdyNXFtL3dnUDF4SlpFZFBMT01tY0ZUb204WDFUOVpGU3lyOFlp?=
 =?utf-8?B?MVR6Uk93Rk8wOEkxTEZGeTlveUEyZkdMbG53WnhsTUpyTGV2ZE5MaTNFVnk4?=
 =?utf-8?B?UEw4clQyTlZPYXUvaHVuejBJWnVIUlpUV2s4alFiUnZNeldYL3VER1FJc2Jj?=
 =?utf-8?B?TWNuczh1Q1pzTjl0MFFPd3NYWkM5bTZxTS9RUEJxVEM4Wmg3RU9ZcWJ0U0cy?=
 =?utf-8?B?MWdEVlBlbGZMd2xLWkdPcDFQUGYxcWFrRDVua1J5ZGhTUFBORVByc2hKSDZC?=
 =?utf-8?B?M3lPVGtuN2VhcUhBcHgvQXo4a1R1Ujl6YWxBTU5sMzJ1L2Jqc2YyTUV2cGxl?=
 =?utf-8?B?SkZSU0FlUUNhaHFaellMaEplY2lNQUY5c3VQdFM3QnBnWTZ3L2ExK3BsL2xN?=
 =?utf-8?B?RTVqRDJzZzBVNWZvaG5tQ2JKZWEzSGZ5MzVIVkl2c1M1eFpFb1BFOWVVM01x?=
 =?utf-8?B?L0Z1dVhPd0U1RGZOZE0xS0RCRFhHeGhZUUhWclplbDk4WEJObDJhMTl2T0xQ?=
 =?utf-8?B?WWdhc3ZvR0x3eXhCeHdEeGU0WDVhWVRDWENCYlNwbGFyc2lYTmR1NkdyNG1Q?=
 =?utf-8?B?YzdlT1JKdWJRRURQa2NRZUFzUTlJN3BITUY5MXBBZ0x4VDRpaHowdFV3OFhQ?=
 =?utf-8?B?SHNoVU5YMnFCZHBPVFMwSHo5bEQzYXJVZDYzNWswNmgyU1ZndnQ5NkNkdEZo?=
 =?utf-8?B?Q2t1dkdsWFNQK05XQSthQlp6SDc3UE4vRE1VZjVsUWVBN0RuUmkyWmE2ME43?=
 =?utf-8?B?MWU4NTlWR2NESjYxWDdiNWdLWEkvNk5iZXNoMUN6OEFYbUdqc0h5N0NXdkNU?=
 =?utf-8?B?dEd3ZDhpSUJPUWV0SHg0RGFoU0Fwa294TFZ4V1pETUxsdVhPMVNxTllRc0RX?=
 =?utf-8?B?VTBKMUtsREhQVG52dnhDRUdxSXNVcHlKQ2w3NTFXTUxMMWdIRVBRbjNYN3pJ?=
 =?utf-8?B?ZjFUL3ZKZWQ0Mm1kdlFrL05VajlicFBwS21ZaC9tWEI0TzlSbU5KbU55RXFq?=
 =?utf-8?B?ajk4OE11NFdDZDBpOHl3V0M0Q2V5VzR5UmRPQnhDWmdUcG5sRG5iQ3VES2or?=
 =?utf-8?B?ZnVLcHpxTTJKdW9Hb0NESkxLZDlGRW9VemtTbnJFcDB3TkFTbUZOb045eVJ5?=
 =?utf-8?B?b1k2cHArQ0FXSWNFUjhseGVWeHk2TjVDWXh5K2czSTJUUmpxTU8yOHdCSmMr?=
 =?utf-8?B?bXpxcDRtVVI0dTV2bjBMY2F0ZDNuWk9VdGFybmZ6aFNoV1d0SzJsdktLZ1FJ?=
 =?utf-8?B?SXc1NURFc2orOUQreWZCcS9hNVVvSldEdmRRNW1RQ1Q0V09nQ3hrUjVRMkRk?=
 =?utf-8?B?NlFmM2w3S2JJQnJWL3lOT2ppamF2MlpZOXNKRXBFY1AvVHh4amw2eVBHYm5u?=
 =?utf-8?B?Vm1mb1JRRndiL2Jtc1hvVkJwRmF6NEMwL0VBWVJMa1VaRVB3eHhLazdzKzhO?=
 =?utf-8?B?ejd4SVhBSHpLZ2tlMlQvS0htVGdUandvUzhpbWJERVRpYVRiNFkzU0ErcWVj?=
 =?utf-8?B?amJkUU0vTGZlaVVoVGpJWEhjQzdidWxMSzUvVG9reEVOb2xETG1odWFEeG4y?=
 =?utf-8?B?ckFRN3Zzd2U3ZDRGQUNGQXNleGZncmwzWkczZkFacFJTNnFsR1FFRHlXUk9u?=
 =?utf-8?B?RW9VUVUzS0F2TGQ5Z1hjcWd5U2lEYmJjTWNoNlk2OHBhZE8rT0w1WHpJaDhI?=
 =?utf-8?B?WDlDaHliWjJ2RGJFb1UyWEhkZHpDTDJhVzVWU2RNeE9xN3lvWksyVWJ3VlZC?=
 =?utf-8?B?QTVXQmloZXF5czkwMDIrMlh1d2RndWI4RzUvWVExOFdRT2pSS2ErVjhvY3A2?=
 =?utf-8?B?UnNRRGdXRGNTczJJL2pQTVBlemhLMFREZ3RHblVBazdlVzlWNDk2QUJYUysy?=
 =?utf-8?B?a0V2MW11V0tOdTZPc2FxU0taZ1BRcnBmWFZaQUpMakZ3K09JVUIwRlFjNUNt?=
 =?utf-8?B?SzhqamNtNlA3TnA5cE5GTkE3SHoybzhvRExEcUp6bERIL0dkc0kzUm5XREtQ?=
 =?utf-8?Q?hiJuI86wKLEBb9YpftzMnVHFJct5mm21CfY8l7t/9AKc?=
X-OriginatorOrg: uclouvain.be
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b644705-a128-47d1-91df-08dd318d79f9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9047.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 15:43:06.5795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ab090d4-fa2e-4ecf-bc7c-4127b4d582ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6L7Gct8l/yhSduzsD4Opd/GHkCvbFT2Z0p+ileocqS68DnADrPPhEMR65QHup2Xp4fOrAdgfgcuRbrtABNvUcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_074312_569986_69FF572C 
X-CRM114-Status: UNSURE (   9.93  )
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

[...]  

>> @@ -90,6 +91,15 @@ eeprom: eeprom@50 {
>>  &hsi2c_12 {
>>  	status = "okay";
>>  	/* TODO: add th
>> +	fuel-gauge@36 {
>> +		compatible = "maxim,max77759-fg";
>> +		reg = <0x36>;
>> +		reg-names = "m5";
>> +		shunt-resistor-micro-ohms = <5000>;
>> +		interrupt-parent = <&gpa9>;
>> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
>> +	};
> 
> The order of properties within a node should follow
> Documentation/devicetree/bindings/dts-coding-style.rst
> 
> In particular shunt-resistor-micro-ohms should come last in
> this case.
> 
> Cheers,
> Andre'
> 

Hi,

Thank you, I will fix this.

Best regards,
Thomas

