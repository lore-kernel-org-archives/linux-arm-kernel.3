Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14855E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 23:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3FjoyRz3SjkhMK8MORPoSjLFnPjDhKj+yUIz4mwf6s=; b=2xhP0+qxJC7mMmG7dnt/RpcmVt
	YPAT/evUqWotGbHxU4Tb1pMYrVadqaDm4WTpyCHYpeyysVDHp5NhBvpm0KYzI6WXSPgIkwpuM7Dv5
	LZR42B+VQXLMwPq1l2AWpz96IWQ3aaHYirjuLFNC8Q7Az0HBV1xMiVdBquihBieoeHIPybXM6Wuf5
	JItPfmzm1apMSbWSq+zT4g7z70aCObbZO25B/238EUTTk0Bgi8nPvoJhrVRV+5Kd0E+qpOYTiviDj
	xvpvCjQgpECIIY6+2Q+bZqNkc3iuJnNkT3J2E/rXPvuWBShLij9UyoFf30ye90Bmt5BteDZxTftYZ
	x6+byMDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO3FZ-00000000Isy-0jyT;
	Wed, 18 Dec 2024 23:14:41 +0000
Received: from mail-vi1eur05on20612.outbound.protection.outlook.com ([2a01:111:f403:2613::612] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO3AT-00000000HvD-0NMq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 23:09:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcewkx4zqwRui28rgSoFK2Tnm3svSa+UJhTIVx7mlMFs/ppY+TpwIFrhMrAlyGJZIKMq6TFH0IeGDNPZAr3+1LmCPT/Y+pEbwk4gDP/d+ye3Azkc85qUIdLnX5NyDWkX1ISF3qVuU4z27ZU/aa4YaF4hu5UZpP5Qfw/mxwurVZOIwPevC8rdFGJW3Ne60PNwXrV9Q9x8+3ahlPAT1JgAvjncSHAeFauQ8vqY6eYfj0Ngm6MKIx4G3EhlF8GFU85mUY73AikWdZ1ty4gg6eBxPhp9M3mfqHn/AybQoFcCOJS073E98u9rzcpAULZmdmiRBGZoUM2aqfDNmLPD8/R2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3FjoyRz3SjkhMK8MORPoSjLFnPjDhKj+yUIz4mwf6s=;
 b=M7i1zrpCtAVtXOLWlotReZGc773qtNZxBS3UYR81BwhtlgKGE9j+lKDpCE04+pyokJoZiwaTKGpxWqPAjRnnWPMg3JnIkKZ5JuC7kENjOrvRvkpXS8O7JmzpFdoO8kOX3WRmh+eOQZ9r/a1xb8+SNbX0Mlghw+gbE8+W7sszVWlNWWxupNb6tWpkr6XAJf8kEymzSsLAHv0Au10VnaOSUXMkXvaztLA0ABLxqR95QYlrSXnJveVxqwQeBoIP4NKPEzrbRE4SbLCLYXd8Q3TTjdvwaJ9cQhAT7cu3c/cHxB97SYVyjC3qcBjBfT2wPXg9IChV1j3VwrOaxOuFLKUzmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3FjoyRz3SjkhMK8MORPoSjLFnPjDhKj+yUIz4mwf6s=;
 b=hVJnwl2zwYvih5KGR6HoF5kNITia0jIAB0unx6f/ndM8pOplQURwF2nOc7DwwlrMbe5tusYNhZSAhag+ZXYQHuom1kDVuJ3/mgNEpJu9Vcys/uVDrU3EMA/IKslJiJq9eo8JPhslE90l0Us9FpU4RUnCjC9SJxpp2iMlrgHS0c66J/SvH9d0XFvxRBZshUsz4dElB/rZRizcHrodGXd5rB5+trK7zMu+79ySpUcEYZm9IcsFVNMztNOWK6nd/uxZ/8Nr9sKWeevjOYDf9shuo6v+f/1uTUsHYGSuIMml4up8KA+NwMHWganOP13BOsz+8lR/lcwZ1xB0BjcMFzA7kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB9939.eurprd04.prod.outlook.com (2603:10a6:10:4c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 23:09:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 23:09:21 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 18 Dec 2024 18:08:39 -0500
Subject: [PATCH v13 4/9] irqchip/gic-v3-its: Add
 DOMAIN_BUS_DEVICE_PCI_EP_MSI support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241218-ep-msi-v13-4-646e2192dc24@nxp.com>
References: <20241218-ep-msi-v13-0-646e2192dc24@nxp.com>
In-Reply-To: <20241218-ep-msi-v13-0-646e2192dc24@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, 
 jdmason@kudzu.us, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734563338; l=3555;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=4WwkstL35KhL3qhGUlXubFCz9/fgciZTvqmYrG8rlZw=;
 b=nzwsc8/qZUuzDYm+GQxGjDUKpheDTKeoYWbKwVPnApomjR+n6TZNUIS6Bqo+80gxDr8rTYBSu
 Sp1XHabTldFC+iFxgIO+gpSeHK93A5PiIrfk6hIghkofGzJE2nwCFyT
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB9939:EE_
X-MS-Office365-Filtering-Correlation-Id: 97b9c9e9-75ac-4805-c8ed-08dd1fb90174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjF5LzJObEVsTDhYZ3YwRjBrZjFyOFJpSFNaTTNqWHJCZ1UwZVF4ZG44TUpE?=
 =?utf-8?B?d0FWc3o5dnhMb1NNMVJVb3pLQ1pic1FmcUlNd0oxMjc0YTRuQ1FFbHI0aEpv?=
 =?utf-8?B?aXZRQyswZWpiRE5lYkRmZFNHblJabnJMUXlzdkE4cFFsSUdJc1YyeFRWMUV6?=
 =?utf-8?B?SzJQai9oeUFNQy9MaElSY1JWdFpIZktHVHk2emdrWmpiZkF1aGg3a1lpNldu?=
 =?utf-8?B?Z0xNOWMyVHBmTmZ2dXhISDNUS3NVejFPUDZrbCtBL3lvczNXZGtpd1IyL2w2?=
 =?utf-8?B?bTg2M2k3K0h6VlpFLzVBeHlXOGZHSWpzYWNaN0NTSGpybUwrc2pWYmxpRk5p?=
 =?utf-8?B?amJRWnhRWUJ2eEsvcGQxaEp2YnFVZEVhK3Y4TTgyaWllSmErK1lGczF4UzhX?=
 =?utf-8?B?cDNuTE1idjBVcVZPQlhHbmRYT2hJWThqVjNTb3M1bVJjY3YvOHJEbWRsRUtu?=
 =?utf-8?B?WVNnT0V1RXFRL0NySXlSTFlnMkt0QnR1ZHlTaGExWlVva2xTVng4dzJlNmZT?=
 =?utf-8?B?ZGxpWjc3NHRUWHM2VDY4eEptTVFtdzlXTnh2WkdHeEhBbzhSTW9na0pucTky?=
 =?utf-8?B?dFlBSWZzWHRtTUpnN041ejlpcnpGcXh4VzVFcmlLYlNVS2VGQmhTVExsaElC?=
 =?utf-8?B?Q3dMcEdDWEE5MVdmaURUZlkxaHZKMFdNWWlIWWp6aVNtc2RHTy9UYXA4QlVn?=
 =?utf-8?B?T0pnNm12SHg2SFZSaVpMNHZ0dFM5R3JZdVpSNDVLTlFhQjh0dnBrQ3lzUklq?=
 =?utf-8?B?ZWwxQTlKYzZlVDY3bmQ4eEdnM0dHWVVwNWk4OGV1MktNN1piclBZQmNZVkk4?=
 =?utf-8?B?TzhOdkx6NWdPc2ZYVjdwalJCUHkrVFNUL3drbms3UTcxazdnWEF1SHhNUmpI?=
 =?utf-8?B?UWN4ckMvN01NVUpjeEZHRU9ITVNBb2ZWWm9JNHdXN2l3NlV0akJqMnRJc1Er?=
 =?utf-8?B?UzJvdm5jRnlySW9heTcySTBMeHRYVVd0TEZTMnoyZGtzT0ZCcG1mbm1pbWtL?=
 =?utf-8?B?eWVPUkVPTEcwYzhFWWE0dE5HZXhKbWplSDRNZDhXd1AxUUxoQ3RuUkZNejRK?=
 =?utf-8?B?TXdyZTdFc0hDWUhXc3JJOHFzaFNhb3RCU0RuNHFIa0hSVTRvSWJJdnV5Q2VQ?=
 =?utf-8?B?cmVEL1Y5UkFtNldTZ3JPK3VOSk45NGtTSUdnemd3VXpTVnJYbFNrUXlPMzlQ?=
 =?utf-8?B?MWdUUjRjQ3NYRS96RnQyajg0M1habW81YThpaW9aUlA1M3VwY3M0SWMybFhy?=
 =?utf-8?B?SVR4SU1oMnJsNktURXBvTlVqNDEyMUJvaTlEYlBOcjJ2bVR1bnoxMkRpeEg0?=
 =?utf-8?B?eFVjSU03L01pY2F2czA3QmsrUXZFMzVkSDBQUDNBd3RnVitOYm1NNWZYS2Fn?=
 =?utf-8?B?dDV4aEpDZmlReTVYU0pRNDh1QkhtMzF4dmpManozdWY3RlBRTTRZOE9oRTV6?=
 =?utf-8?B?d3drQldKTXdGcC91TU5BUnFCZ0dISFllMjlma3drSE9mVHdKeXVZMm5pSmps?=
 =?utf-8?B?YVpiVS9tc20rWTFJTTNrV1A1R21VaCsrNE1DMEtYVVpIb2xkTmQweFdiQTdH?=
 =?utf-8?B?NE8zNHhqOXV2ajI5OTNOVW96c0Fqd05zakdHUXA1NGYwTmVNd3JlRjZKWkR1?=
 =?utf-8?B?QURRbkpSc3c3TmN4dHBZb3ZGNmlhUm9KN2M0TEpoM3BUcEkyNGFTMFVqcEIw?=
 =?utf-8?B?QjRLdEYrSXhnWjlDOUhyRHRsWjlYYkxmMGRCb1NBVjBxTHM4YnlJUzZHMEx0?=
 =?utf-8?B?MURLNm00NEFNd0NsT0N2NFg2a1hLWHRkU1ZXVVhRNmxvYXdmYUxsK1oxUFpR?=
 =?utf-8?B?ZzRJQitlb1lLOWJGSVlMR1FPeVJKbVZpMk1PSzVZOUZ0NHF4STdwT1o2Yjcy?=
 =?utf-8?B?dFUwZzhYY00xNzlYVTlwZ2N2QVpwRU5QczBMYm9LSC91eCtGQkNoNjhGYTFP?=
 =?utf-8?B?K2gvZ3FQTVdQbXFaWngyMGtCODdSZXg4YmVYYVBVK3IzKzI3L2hUOVd2VGE3?=
 =?utf-8?B?MkNKOUNmbVBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE16VnRLcjJnZk11L0lHTnFMdWdnNENlSUppODg2V1gxakk5cmo2aTIzMzZw?=
 =?utf-8?B?eWFVM2NwS1VrbEhpQnBkY1pYOW82Q01FTHM3dENXN25xM0ZQZXBsQy9uK29m?=
 =?utf-8?B?cEVZOWdaWVpjbEo4Tm9OTXkvRjFQY2xHT1RLcVd4UjRmTzdkckZhMCtNbHVr?=
 =?utf-8?B?dTZkOFlQZkdSRlpjTGtLeVM5anAycldTbDNuSTRjUmZFWUpHRUFkVHBQeXF3?=
 =?utf-8?B?WWh1MmxMQk9UNnl4YURZQUpPV3IyL3Z6cmVXaFhrd0hYZktQTForcmtnZVJv?=
 =?utf-8?B?bVhNS2hzRVg1aXRxRWlhdHdqcXQxa0o2Tll2Q21qNDZFcURtcU1MSFIzWjNh?=
 =?utf-8?B?N2R1Z3hwbktDanljcmNKSFB6R0QxRWdlcEZncXNmVTlZdGVQaW9kdHZqVkgz?=
 =?utf-8?B?RzhucHFiMkt3b0NKWCtwZW0xQVdHeVJNVEc0Zk9paVBkNjRiSUFlU3Z3T1Rs?=
 =?utf-8?B?UGRTdHVLK0FiclVwLzlvU3gxOVdEN2pQOVlJaUJZckVjc3ZOZUNqc0lGSk9I?=
 =?utf-8?B?d01rMDRZV3AzekhTeHU0QVI5NE9zK3UwSHM5WDBQaHZTc3hGWWQxeCtFSGpq?=
 =?utf-8?B?bkxsaWFLUmNXNVdpZUxLdVZ3a2NoaFVsOHRvSzNuNVNTaUJHS3crdGY5c3Jq?=
 =?utf-8?B?NEMvN1B6YXg1RjhYaXFjd3dtaVJvZ2E0dHZZSTRBcnhOSDJWUlBWbVNXYlZ5?=
 =?utf-8?B?SzNheHFsMnIwRTRDbWgxdTVaVUFteU9aZnVXRzVRY1VINFVQNmVZRUd2Rlpq?=
 =?utf-8?B?VEd5UHFxWjNWTHhHcmRjWDZJL0pjNGpzTnV2TzFCTGE2M1lVOW9oMXh0K2dt?=
 =?utf-8?B?dk4xcmR1bDE2WGw2UUhKY2tKMDJUMEl4dHVEZ042ZE8zNWx2MXowenBoQi9m?=
 =?utf-8?B?WHlGUkd5UnlnUms4NU9WMHI5S2x3eVVjT1NoV0Q2VS9GcDU5aFE3T2JhY2RH?=
 =?utf-8?B?VC9OVmxsaXdzeUdudUtLRUFPZzZHbFhodlJUZUF4VVhWR3YzYU1uZzRBdUFD?=
 =?utf-8?B?N2tsWmtkNFhhTTU2MThFcXRZK21tUG1wRTFKb3VMeExBWFBsOE1LemFvb2Fo?=
 =?utf-8?B?OWRyQlRGNDJ1MUVKSU1XZkoxNDVGMjZ1cTNqTktXTXhpWjJjNC9rYndrYzJ2?=
 =?utf-8?B?bGdxR2V5WmdzOHlnV0FzOXBpOTVmTko0RWRsVy8vWWhYcFUyNWhER0FhNkt6?=
 =?utf-8?B?WmE2dnlQdjd5U1dNL3NneXBOT1ppTGJzaWlZVHBQL0pUdy9mT2tsWlVXZHVL?=
 =?utf-8?B?NU5QaG1XeTlDMEpUQis5YkpuSy83L0Vnc2FXRXFSdllxYmF4WGd0Smt6dVhV?=
 =?utf-8?B?akRJNFA4VmtrVGZWTWsvMm9USHBkSDlPbUhNL1pvT09VNm1jSlV5RXFXbFdQ?=
 =?utf-8?B?SVZySGJSSzVWQ0FEUXhXaS9ZY01LVGdrU0sxZXdSMmYxN0xZampnODJ5a25r?=
 =?utf-8?B?SmZsNGNPWWVtcnczM3g3aFV3TjViVFBjbTd5Zi82YmRHaXFwVXlvaElSVllQ?=
 =?utf-8?B?Rk9sME53RHBFMUY1cis0YVpMN3ZNNGN1TmJObFJMUUJueXUyRzBtZHB3cEZR?=
 =?utf-8?B?Y3VJbHpZbnRMMU53ZlR0QnB5em9mcWg0ajhhclpoSmNsQ25WVVovRHJJeU9m?=
 =?utf-8?B?bEZnQkJFcDZSb1daQ0lGTEdCZk1tanhqaEc4V0Q4eVRVeVhZNCtnTjNjWUNR?=
 =?utf-8?B?djh0VDA1WjRiUFBKY2c0YlNkT0xldFhjdUpZMm1XcGk1Z2gwM1l5ZFNmYVFr?=
 =?utf-8?B?dkhiZmJaZEhCSks5d0E2ME8xWFhKaXBFVndzM0hkVXhLWEFCYVZ2a2ZBTlhS?=
 =?utf-8?B?TjNSTERaZWJrZ3JYTWRzVXRwSmdLMDRQUkJHY0pWWDBvOEZJc1FDOE1pSHB3?=
 =?utf-8?B?cUpGSXphSmRxVDZDdUxhYkZiQWtkeFQ3bnROaXJjK0dzcSt0ODhOZGNjMHpl?=
 =?utf-8?B?VldTeGp2Z09aeUtjNDZneFNmYkpucUJRS0JuQzRhMWhhQ2htdWlQNTNtcTNk?=
 =?utf-8?B?UE1NeGZEd2sxMkdNeWRNQVNBVzQwMXJkNFFxL3F1SDlUdXp5WnVaN09LVjhB?=
 =?utf-8?B?eFVmbG9UcHFMNUE5VWtDQTBZcTVKaDZiVG0yblh0QlVvengvQ3NHaHhhKzFU?=
 =?utf-8?Q?HSWYaB4yLc61jPpZnYF6Cw63S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b9c9e9-75ac-4805-c8ed-08dd1fb90174
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 23:09:21.1077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfHcn2FxTiEQy7lOhYBCIoXzBgoSHTLPajp9kPs+EjJ5IspD++cNw50rQ9hRdWyL03b6f8l/wlM0146tqUSgUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9939
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_150925_128969_5CCFB42D 
X-CRM114-Status: GOOD (  14.73  )
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

           ┌────────────────────────────────┐
           │                                │
           │     PCI Endpoint Controller    │
           │                                │
           │   ┌─────┐  ┌─────┐     ┌─────┐ │
PCI Bus    │   │     │  │     │     │     │ │
─────────► │   │Func1│  │Func2│ ... │Func │ │
Doorbell   │   │     │  │     │     │<n>  │ │
           │   │     │  │     │     │     │ │
           │   └──┬──┘  └──┬──┘     └──┬──┘ │
           │      │        │           │    │
           └──────┼────────┼───────────┼────┘
                  │        │           │
                  ▼        ▼           ▼
               ┌────────────────────────┐
               │    MSI Controller      │
               └────────────────────────┘

Add domain DOMAIN_BUS_DEVICE_PCI_EP_MSI to allocate MSI domain for Endpoint
function in PCI Endpoint (EP) controller, So PCI Root Complex (RC) can
write MSI message to MSI controller to trigger doorbell IRQ for difference
EP functions.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v12 to v13
- new patch
---
 drivers/irqchip/irq-gic-v3-its-msi-parent.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its-msi-parent.c b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
index b2a4b67545b82..16e7d53f0b133 100644
--- a/drivers/irqchip/irq-gic-v3-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
@@ -5,6 +5,7 @@
 // Copyright (C) 2022 Intel
 
 #include <linux/acpi_iort.h>
+#include <linux/pci-ep-msi.h>
 #include <linux/pci.h>
 
 #include "irq-gic-common.h"
@@ -173,6 +174,19 @@ static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
 	return its_pmsi_prepare_devid(domain, dev, nvec, info, dev_id);
 }
 
+static int its_pci_ep_msi_prepare(struct irq_domain *domain, struct device *dev,
+				  int nvec, msi_alloc_info_t *info)
+{
+	u32 dev_id;
+	int ret;
+
+	ret = pci_epf_msi_domain_get_msi_rid(dev, &dev_id);
+	if (ret)
+		return ret;
+
+	return its_pmsi_prepare_devid(domain, dev, nvec, info, dev_id);
+}
+
 static bool its_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 				  struct irq_domain *real_parent, struct msi_domain_info *info)
 {
@@ -205,6 +219,9 @@ static bool its_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 		 */
 		info->ops->msi_prepare = its_pmsi_prepare;
 		break;
+	case DOMAIN_BUS_DEVICE_PCI_EP_MSI:
+		info->ops->msi_prepare = its_pci_ep_msi_prepare;
+		break;
 	default:
 		/* Confused. How did the lib return true? */
 		WARN_ON_ONCE(1);
@@ -218,7 +235,7 @@ const struct msi_parent_ops gic_v3_its_msi_parent_ops = {
 	.supported_flags	= ITS_MSI_FLAGS_SUPPORTED,
 	.required_flags		= ITS_MSI_FLAGS_REQUIRED,
 	.bus_select_token	= DOMAIN_BUS_NEXUS,
-	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI,
+	.bus_select_mask	= MATCH_PCI_MSI | MATCH_PLATFORM_MSI | MATCH_PLATFORM_PCI_EP_MSI,
 	.prefix			= "ITS-",
 	.init_dev_msi_info	= its_init_dev_msi_info,
 };

-- 
2.34.1


