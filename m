Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766C4D31A02
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 02:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhvt1NSFuihMsuCRuRb4tPBhdwlPPqehgTB7nK2I1/s=; b=B8RZ7s8hizdrJCIW0TBaajcvtR
	xfYfp4dSrk2Bdj65mG96cUq4WAdYeIOdAeTWE+CL2drERVcLzhKmgMx0+XUokRz4xMgUCy6YwIZmD
	x+eYMJd5uZh8NBAlMZ4woSWe7pwZ5tLhyBljMoqnjNfHUimptxcbN+ztTsMbW2V1QJNH+Zk7zVhZK
	pll4kfOtvnWzo636nJFwBS6/sA++gX29JrXOnSCtViEDSp9M7aMkCChuuzru42WKLw2Zb8gfLX+kO
	qf3Hsq2srXYE2SFPQ1eAXjaG9piigu7RgxjR4/LElo3MKLHaiSp3t4LqEcNEmWnDBKCRrDnujEAvA
	wqaORmsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfqwf-000000080CP-2qks;
	Wed, 14 Jan 2026 02:49:17 +0000
Received: from mail-koreacentralazon11023130.outbound.protection.outlook.com ([40.107.44.130] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfqwc-000000080Bv-13AP;
	Wed, 14 Jan 2026 02:49:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEXH3PgAW454rK6q/UfJFTpgvYLrMupXnirQG4rcZveXrIneIeFhG6eiS9DFoTgDXFjfAunKZsg6eECFqsJ4Osq3kuGKdSHsWkBi09MfIp1sfFUtBzkhQIuO34NU9sDWJQmUPxikfPbJPrIKjO/bjhYkveSI/9A1MUx47vKDx7DuyHKgGTO6QQr+mf/jj1187U0RcNeZYdquygaGZ7bSlVFzmQoHh+qmmBDObL6WidEsKZylBNY/00tE+l1HCkZ9Fsic1yG0LCIsN+ZnVgqZNKL8lFIUiwVqmPzky5bqMDwoqNQBIcRkVy8cA1uhWyVoB1Ga9P630w7sQICScFtzmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhvt1NSFuihMsuCRuRb4tPBhdwlPPqehgTB7nK2I1/s=;
 b=VZJgeRF2z6u423J7SGvhfz/j7g/Z0JEaOU1P6qNUobsqkNU+AZmwZC9CgBPekSYmpvu/Jo0Fz45zdp9Z3cpk4Z5Ra+MXhFjghqKnupILhA3KOZsEqZWOxABndf0iwvccsJxOCXlIAGjmA01d/cnbwBXs9huPD8hQINxi8CbxDyPE9YPF0hH91862Kla+0OyLKiYM4tJ0t/BipBmpsQtetNwLnJk0NL0uxSIq1XAJxrsJOgjbidasRGT5B2kiNwfw8jpwYTX2W/BrbCwp6WWFNJAPECi8BX4hajtZL/oJVnLqfzbpPdoMdtiRolqpo5ectNtp5Myvb/ony1w2gTDo0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhvt1NSFuihMsuCRuRb4tPBhdwlPPqehgTB7nK2I1/s=;
 b=JR1xieqJUagtk7d0PLppzUIiHfBxd5SkHzfvZs9kwIKEHXKzX/wuhwzffLIK52W5Fd2Of9zFlS+E9R/FbJeu1VrZs7QOBVYSOSkSeg7qEkyjENhJUGiSXn4Oj3YoIQ4HS0o/e7WfI/7Wd6qQ48Fisg/DCFgrawnimsjsxO3UBl5HuDGbzbPkMcMK6FxgLFI9JTwTVqoWvRdLXBdoV6L9cyEV1bYrqLupfYpUyKeiPK1vm2kJ+uAaFmJV2WFBCIJY8WVmQyIXqY4sxw7aEpofzqDz1sxmGhHyI1QHHdPBywZSFc1iR55RUfgz1q7cJSjbPgNDSObGoKsFjk+fVVAONQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB8778.apcprd03.prod.outlook.com (2603:1096:101:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 14 Jan
 2026 02:49:06 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 02:49:06 +0000
Message-ID: <2491170c-d055-4231-8fd1-164d89198ae3@amlogic.com>
Date: Wed, 14 Jan 2026 10:48:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com>
 <20260113-amlogic-s4-mmc-fixup-v1-2-1ab1fca0fb2f@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20260113-amlogic-s4-mmc-fixup-v1-2-1ab1fca0fb2f@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::17) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e766fa0-efc2-43db-f076-08de53177baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1hCRy9OL3RnRUowTlFpRDVSVEZ2YXhENU9qRmhuejZjVGJISUV1NnI0Z3N2?=
 =?utf-8?B?eEpNWGJUUzlPd0ordHlidFBJTTZPL1RBZTFzdzZxdGdMQ21VNUtlUHl4cVpM?=
 =?utf-8?B?TnpaZ3Zia1hvTVJFUWNMQUdvbk1paDVYTFZzOVNVRVZXL25MTW1GeGpwYlpS?=
 =?utf-8?B?em1LZk1la1ZyaVo0SE5TZzd0Mno1U05zWk5XUmJuMm1nUXJxMzh3OTAzYWNT?=
 =?utf-8?B?K0RobDQzUFkvb1RDMXJRN2UzL213MFJib25LK2dmWHIrMGVlMFQ2Zm5RdjdI?=
 =?utf-8?B?Ymd3ZU43NVhiZ2MxakkzaEthTGZlemNUTXZ6d3pxS0dNSHlsbHFDMS9qUmJM?=
 =?utf-8?B?OUZqRzk5aUJnQWI5Nkp3NjNqaWtyN05sL05qQUEvbm14T2xCNGllaHRmdnY5?=
 =?utf-8?B?Vk5Uck5wWnAyWUNrdWZnYUJMS3I2bml4RFkrekxBOW14TWI3OUk5VUdoSXRS?=
 =?utf-8?B?cHlYOG5MRFNLQmRSeWp5REFVK1UxVjFlYWhjQ1Bqa3BvK1M2ckZUa2hleVdD?=
 =?utf-8?B?aElxd0tJSm94UHBTWTNVeGM3NEt4Z3dBV3QreWtlbXYvMEkreExpWFB6cHpY?=
 =?utf-8?B?b21SeGNwQ1pRS0ZGVEZtVEYxUnFlWmNIdmJsd0dHTTlseU1pUW9YRmRzc2Vh?=
 =?utf-8?B?b2dmdjViK0ZwSnIzZ000eWpIb1gyNGkweDJLUzdMblB4VDhqV3EvbDNLM2sy?=
 =?utf-8?B?NHFGSUVOalJ0dlNFYUJPdzl3MzlsUGxXcEpONWxEQkhFY1ZveklldXNRVlYv?=
 =?utf-8?B?QnRLZEp3MnZDZmFXYU8zc0RXeEtFNGpJUU5Zc3B0aFBPZ29LY2dWSUM2dmVY?=
 =?utf-8?B?SlVQblFPQ3l6M01wYXFyNUI2cWV3ajdEZjJGVnRYUDBBUDI0V2xTS0NNWWdN?=
 =?utf-8?B?RVp6cXlQeFF5aGZiZ0l0MmpsTnF3cHRsNzY3Zk1xM1VpU2RGMmpLTlJTdU1Q?=
 =?utf-8?B?YUlXcUZnNjRYM3U5Q081MDlGNmdiMC9WTUZEanZxSFZSNHhDT1EvZ1lBUDJx?=
 =?utf-8?B?bEFGZVpkRVBDVjBNQ2pPR3liSlBKM2RlazRnblJOd3FkbU14aTI0U0lDbHkw?=
 =?utf-8?B?NlgxT3l1cldkUjBlbTEyNHNlTGNEVmVWaFJJWHJIaGJ5V0p1MHgxK3pjeXdj?=
 =?utf-8?B?bjBSRzYyQVBZU0hhUHA0dkVUSWZNL0pWOHg5cEF4d2t0Uy9tL1RTK3o0dGFa?=
 =?utf-8?B?aExTNlZpREpSQS9RR2llSGxXYWFUcEJwS1BNQkt4K2RaSnJHTXZGczQ3cGNI?=
 =?utf-8?B?TWFmL1RTMmJGdmVhTnhHQno1WFkwcXB0dlRVWFFoS2pMbmNQcStZcjZESU5P?=
 =?utf-8?B?eHg3YUViQVF5SnNZSGo2NmZBNzNSN2hpYkxScnd1QlF4b0EyU3pBblNndGlU?=
 =?utf-8?B?V1dPUXZFZ01vTVBodU9xYXo4QUU4eVhFaFVZK3lVS1NLclBiUURpQVBkajFx?=
 =?utf-8?B?dk5DNWIyNkJuOEZyZ0dwNlc3SjRZYjMvYjRKNXdlT1E1SzFLeXB0N3Byak95?=
 =?utf-8?B?YXhUNHRsQmd6Y1Nyc2Z4MUsvU2dac1pLbkx3bkwvZ0J4Rzg5aU10MW51TjZT?=
 =?utf-8?B?SjNWV3N1b21CMDhxT2M1K3c1UUpSSlppTVBYMWtLWE1lKzlDTnlsZk1keHRJ?=
 =?utf-8?B?RFRJZHJORHpvMmpoWm1kWE9zY2tZTnFCSzRSdGM4RTZYa0Fad1FHR2lKT1ND?=
 =?utf-8?B?UVRKbHM0SWxmSHBpUklqWWVlUzI2ei9TcFZXa0I4YmI1Tk5DR2FRVi9laGZh?=
 =?utf-8?B?VHAvMEhSVmFWSGl6a1JGUUM2LzI2Ym5CNVZpam9zYnUxVnF6S1dUSWtWVzJh?=
 =?utf-8?B?OVQydWdjQ3hPZGVEbjZRQStOUGFUSzY5RGdDN3NaRFpoZUtPT0E4eVdzS2JP?=
 =?utf-8?B?bjVxVDlWMWFyc0FKY3hOK2ZpaTc0RUVjakthZ0tNSUJiVUR1aytiRHFySmlE?=
 =?utf-8?B?Uit5SXIyZ2ZjdlJtbUF6Znh1Z2o2WEdUbW9iVXY4S1ZYaFl3RW5TcG5Hbnc5?=
 =?utf-8?B?Nm8vS1dlUFVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEpuSS9DREVWcGJHRC9WZmRJeUpaUFhpWllrU1pUbjJlcEN6Q0dFR0hzMzlB?=
 =?utf-8?B?b3o5NjBGZkVnWVZiQjMvRnFZRVpzTGtDTEpDN2R1bVNHZlZscXRKZkp6NXox?=
 =?utf-8?B?L00vZ3dKMDhJNkNsM2cvZnM5SWYvUWVrR2FXaVdUWGU0aVlmdlptN3BZL1R3?=
 =?utf-8?B?TEkzWTBIR2Raa25hVGV2a3B0QkFTNm10K1dOcFU5U3RSQ1I2ZkZuLzdjenlN?=
 =?utf-8?B?TXVGdkFFRWUvWHowN0NFOG5IUWFzZEdrQVpoNm1KbnhneGgrZE1rQlhtZGpP?=
 =?utf-8?B?bVdzY1RyamFKcWd6T081UlNkQVp6UUNKd2R5MkZWVk1iR2JtVnU1VGxPbnZv?=
 =?utf-8?B?ZGh0aEs4eHZFZHdZcFQ1em1rRXlxd0VwZnBxTHFRcS8zZ3ZvSytIMFZNeHBz?=
 =?utf-8?B?UzdqVlJidTNhSW9pNWxndy9FNDRIUngycUNHdmRRN0tJaEtzYWQzSzVrdzdr?=
 =?utf-8?B?T1BnVDNCb05GeFNNS2RFWXZmcnZhakV5KzVqOGFCaTVrc2g3dytNejZRbmRN?=
 =?utf-8?B?cVFjYkExZmtKTEE0azB2TVJsbjRLeG83OGJiNzZ4K1hPWlhJY01VOFJTU2Fw?=
 =?utf-8?B?anVneW15VkFwY1dlYWpRM0luMklCdUVEWm40VVhPcjh4dHJ4b2FGS2tORUU3?=
 =?utf-8?B?cHpaTE5ON2ZtTkxoR01NRFRoNmp5cDJnYVRBTW5MTStJU2kzNTlaTEdCRVox?=
 =?utf-8?B?RlJ6VXBTaThmNjcvcjB6N0lMYkVqRW1QeCtIOGQxVFNndEI3YjZmclZTdmJ6?=
 =?utf-8?B?YmYyU3QrZWpXRXpPZUNjTElzb1lRVWtOeHpDTXVxN1dDU0VTRldPNVQybU13?=
 =?utf-8?B?YU1mK1JvejMxS0pyNFF0Yi9EODR6RkVtRWJYbFlCbHkybGRxWTJOZmlWdmdI?=
 =?utf-8?B?NmNQQ3ZCb1U3ejkvcVJ5OUVhc3dsWXMrKzhuMUNvTzc2S1J0UTJydHhDVGlu?=
 =?utf-8?B?Q1I5TDVQUCtMNHBYaVFXbDhEN0tBYVY4M0JxL29oNElURk1jbVdzMnYwL1hn?=
 =?utf-8?B?bEp3VWY4c0dXTW43cGQ4TlpVQnpFQ1BoQk1WSXltNGlKVE9KenE2WGI0MU1L?=
 =?utf-8?B?YlZ0OWM5dGgzSUgrZFo5YW55dnRweU5BeFI4bnRDem9xdkxaT3ZxYmhzRENC?=
 =?utf-8?B?ak51czNrZ1ZwanpyWmFZRjV4ck45V3VORWw3REJzdWdRUWI3anB3VWJwdlNi?=
 =?utf-8?B?aEs1RFp4U0dFQ2ZDL2laTHFIMlZuUDZkZThNaFBjU3BwRnljOFVmYzJsSGFw?=
 =?utf-8?B?ZkZIM01pR1N3OHEyLy83RGlJMU8vVEVzejBkSlZlNmZPRjFtSnRodUlVTUZN?=
 =?utf-8?B?Z2RWVFc1bzBaTHl0cnEzcFNXazVYeEZ3dW50emxNZUJHTnQxVGYwcGZWZlBP?=
 =?utf-8?B?aWRRUE9vdXpTSmVOcFlDaUJSdUs3VGkrMXhBN010czMxcU5JUzZaNmEyT3hG?=
 =?utf-8?B?OFQyaFUxRlNvd3FBT0hxNk14REF2V1czTHpXaVJtZnNVWEwwc2dwakpBd0lC?=
 =?utf-8?B?Ym1tU1laR1g1UHFnd0UvVUwyMzk5TGpMSzJtVHJrZ2J1MmlXL2tUYUEweng3?=
 =?utf-8?B?aGpXaU5TaUNMbU1IQlMyc2ZrL2ZoNjZiUGlJK2VhY2o4ajJMNi9hTkJDdTVu?=
 =?utf-8?B?VkovOG13ejczQUxOaG9rQllBenZKeVIrRzRzNytIL2hNY3VxMlpWbjdLeSsz?=
 =?utf-8?B?MEZCTm9vdXg2cEc3dm9KQ3VubmRUK1QxVTNMNnpPSFZZZnRmdjZxdmUvd0JC?=
 =?utf-8?B?Y3dZYWJqRlRhMnZsVHpxZU5ZZmtneHBEUVAvWVpzWXNKQlh5dFB3bDFieER1?=
 =?utf-8?B?WkpaUWxMbFR2a1Z0WXdpSnlxVVJQTGlHL1RqNTZyLzBDWGRRUFJpNUpMdUkx?=
 =?utf-8?B?YTRmZlhUL1VOTll2RktiM0M1M1JTU0lxcFlNQ0VGUXlCYjVRYTU5cnZjY01D?=
 =?utf-8?B?K0RwVit1c0xkclE2U21ycDdoS3FmTXZsbHdrOFJaV080aE8yb2daajR5TTAv?=
 =?utf-8?B?N3RJU2tBY0tmNUF3MU9rcU5PTFh0VHN5anoyR2hJd0d2TkNYcWFKWjYwdThH?=
 =?utf-8?B?UnhBM1VpM0t0SkpCVEtVNC9MSGxraVl6UFVCUlNJN1BRS3MydFYwUW9CV3Vp?=
 =?utf-8?B?bDh6ZXpCWkVoTlRrSE15SWphTWRQZ2Erci83NzZFSUVVNlVoSGU1bU10RDhn?=
 =?utf-8?B?dlhPZURtWUtTRi9XakJpSWFCbm5sb1ZnWFU5MWNKeFVZRGtvRjlrSjlyc0x4?=
 =?utf-8?B?MzFUMkZGaDFacmR0MGJoK0Y4YXBjWmZrVUhBa0wybzVacmxoN2NTeEZFUTVw?=
 =?utf-8?B?WTJLVjZQWjJiWjV6ZG1iOEFrVHBYaXhlWXZlQnpJeDFTZFEzS3lIdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e766fa0-efc2-43db-f076-08de53177baa
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 02:49:05.9500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L9rDe6a7UUjOmVNvCle3J69lVrJ8t+lxTm6Nh5Ub8NZcGCMlzqfP5k9EQb/Mn77f4nZ2L7XYJLfbuMeUvlSTgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8778
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_184914_358875_C106F716 
X-CRM114-Status: GOOD (  17.18  )
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

hi Jerome,

On 1/13/2026 6:39 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> MMC A and C are mis-represented as having their "clkin0" input connected to
> xtal while it is actually connected to the MMC clock, mostly in an attempt
> to provide 24MHz to the device on this input.

Right.

> 
> Fix this and assign the clock to 24MHz to actually provide the required
> rate.
> 
> Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 62538fd9db6b1ffb33a88e12628aadefbaa453ec..6324d1eb5994009df5b09923cce373a87229f4b8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -819,13 +819,17 @@ sdio: mmc@fe088000 {
>                          reg = <0x0 0xfe088000 0x0 0x800>;
>                          interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
>                          clocks = <&clkc_periphs CLKID_SDEMMC_A>,
> -                                <&xtal>,
> +                                <&clkc_periphs CLKID_SD_EMMC_A>,
>                                   <&clkc_pll CLKID_FCLK_DIV2>;
>                          clock-names = "core", "clkin0", "clkin1";
>                          resets = <&reset RESET_SD_EMMC_A>;
>                          cap-sdio-irq;
>                          keep-power-in-suspend;
>                          status = "disabled";
> +
> +                       assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A>;
> +                       assigned-clock-parents = <0>;

Is it possible to remove assigned-clock-parent?

> +                       assigned-clock-rates = <24000000>;
>                  };
> 
>                  sd: mmc@fe08a000 {
> @@ -849,13 +853,17 @@ emmc: mmc@fe08c000 {
>                          reg = <0x0 0xfe08c000 0x0 0x800>;
>                          interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
>                          clocks = <&clkc_periphs CLKID_NAND>,
> -                                <&xtal>,
> +                                <&clkc_periphs CLKID_SD_EMMC_C>,
>                                   <&clkc_pll CLKID_FCLK_DIV2>;
>                          clock-names = "core", "clkin0", "clkin1";
>                          resets = <&reset RESET_NAND_EMMC>;
>                          no-sdio;
>                          no-sd;
>                          status = "disabled";
> +
> +                       assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
> +                       assigned-clock-parents = <0>;
> +                       assigned-clock-rates = <24000000>;
>                  };
>          };
>   };
> 
> --
> 2.47.3
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


