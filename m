Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B6DC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 07:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+FgQWijX6GXmt1ADbpawBdTXFoyaJA9oo+SzDuwWwE=; b=mcJ6Jsvuq8GpsaSERbkJa6P/uk
	tUoN/dch+fVRMDIyMHiH5R0cxMZ4O74s8z0SnE/NjprW9XSzTwP5c9vE1Qu/5Btjz1VVlRA5G0bQJ
	kbDz8pnQS5x8NQ8UeAbKA/K6VE+t30ARHTITM1XYLYtZit6hd/3Eg0eWFbqgiaplFHyrWLRnWgIYP
	pcjCspUzXizLHs/V0mO7cT8MXsH4fzlxYwWBnUcdu3R4jHCtGIg+qxAGfJYQBfchhHmEulUjBKo8s
	oBSb0kih3fdGsQAWGk/vP3fdJnlnyh6ac8qqzfmMEvLoxTDlvwgGvAgjuEKZYiYt7wGzYvx2LHQLm
	jyy7P85w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZm6T-0000000B4zz-3LJ6;
	Thu, 10 Jul 2025 07:54:01 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlFv-0000000Avve-0xiF;
	Thu, 10 Jul 2025 06:59:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JCa+xsRzqiax2lXqKPTVPLJsnGa+6SKR7HUF23DClOucIAX+amsPwvMCTmgpwyhjJQ4NZn2iTXeZc4qSu6exw48xJOS5Z0E75M/p+e1dBPorcut7+DZFHEh/LeIWQ/gOumK3S7PK0tm/fA/F6vCClxpOFhrKkO/aStM/chvLCZG0u27P22HYXXXOEvLzCYAbAuwsmjVV2BPMVNYYaazsSuL4xh1sHLVwXWfEH4L2fyDxhxZNXubxnqyIsZBH6VJ2g47rLbcm8wLWavyppsi925/Gj0zu5hekURp34+MnyTzIpVq8PhPCTwb64/WBhDc6JVRMoNlRqbjXywInYTOwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+FgQWijX6GXmt1ADbpawBdTXFoyaJA9oo+SzDuwWwE=;
 b=ANCZpdLJb1RBh8jF72b74sfOyxG8ccNvaG+AW+4mXCBU4b5VhIwraPXZbzvHiy5DpHw59stesmd58P+PBh5eDxUrvWdoWvDrLrd1yArf94yBZPTHhC6zDdbGD+FkBQPa3xTytKuv+/tih/QNQzsh6APFzb15L6m8hjAj0bWl1IefQo0Kx/6+l9fYYG6/jNEcKIm4z5WefuMr5voMdtsSIKH7fy/+nv3wKE2fJkgeEYR5roDZfoRy1DeE3qv+FaTkWPHcnjkv5WtWDsidWMms1kWHV+qbQ0hAECIE4dApS1zRR8ocaR+USGbBanzb8Hpx82z9VCRl1xww3Xjn/7Ly6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+FgQWijX6GXmt1ADbpawBdTXFoyaJA9oo+SzDuwWwE=;
 b=MCvQcrIPiNP++O7IGvGM8anIK0q/ie7m+Ef8iE8gzSBWYLIyXM7kst9+XUCooB+zLrY556FKQRnUn18UzBoJJdAOM9Lrq8Zuy8YDX/b45Dlk7fFWuvZfPk0aEzKoj0S3xUaCpL+STxLRG1+Jyb2/cbNUxZx7/2obJRNrZucTcaUDQGoj8wZm2Aun14OobtOoQraldpO9RNnrUqt58MJPrkJnTIeTK5AsFbWaopDiKVbOg4+Isj5q26JiNU/fCrEPM+VajOpTFigUWgP5g3Xx+O+A0t+FySA2/hz9BS2cx6oSZZ3S7qmQ5mpCCSUb0T2znDKfx2VLNERl9gBvNElklA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by SEZPR03MB6468.apcprd03.prod.outlook.com (2603:1096:101:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Thu, 10 Jul
 2025 06:59:17 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%7]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 06:59:17 +0000
Message-ID: <ea44eae1-a22d-45fa-8e3b-54ae7698524c@amlogic.com>
Date: Thu, 10 Jul 2025 14:59:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: uapi: Convert Amlogic C3 to V4L2 extensible
 params
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
 <20250708-extensible-parameters-validation-v1-3-9fc27c9c728c@ideasonboard.com>
 <968ffcce-9fef-4336-b83d-f9cd7ade6ea0@amlogic.com>
 <y6d6slegpjoduxnvmed3xurjwt7t6me2jiy65u743lk4wc6zny@zhed5vdusmen>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <y6d6slegpjoduxnvmed3xurjwt7t6me2jiy65u743lk4wc6zny@zhed5vdusmen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0216.apcprd04.prod.outlook.com
 (2603:1096:4:187::18) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|SEZPR03MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: a6d96616-1faf-4c3c-9eb2-08ddbf7f4988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUdVaW11NW1mSDUzT0xybW5uVk93bHQ4YnJwTzBDa0hkcHc0OU9Malpwcnhv?=
 =?utf-8?B?bVJoRzRhTGtwUElmcGRCdndaNDlIdnJnY2NJcVlLTUIraENqZllKSzVyeldW?=
 =?utf-8?B?VXRXQi96ejVuYzFhVUU1b1ZPVk5nR3ozdHhJMlJWK0pQUE1hdEJweEQrUDJH?=
 =?utf-8?B?Nm9SYTJwTUtWQk5WeUl1ZTgvbTNGTFZ2NkRHbjZsQWJ0MlgzRDRvN2xGQ3hO?=
 =?utf-8?B?ZjQ3VWJTY2wxM2hYY0ptUDhLTkI3elNSMTg3V0VwWmtISDIzcFo0TnhrMnE3?=
 =?utf-8?B?QjM4MGdJNU4vTGtsSmd6d3hBelRuR2Yxc09rUDc5dEYrNVNRNTR1RFljVC8x?=
 =?utf-8?B?K3o5TWlQdjF6dU9HNXMwaXRJRENITXNoOStveXV2NHV0dW54bUcveHMrL244?=
 =?utf-8?B?RXZEVURJTHZEeTdJUEM1WGtWcXBXSUxUb3dwbGRQWGFNUU5WeVkyNllhR1Bk?=
 =?utf-8?B?SURjdGdkaGFDMjhEUDQ2cENUK0o0bDlaMGVBa0R4bGR4dTZOVzFDWFNvWGVJ?=
 =?utf-8?B?eTJxcTVPVTlOR0JCUXhmZFVqQXovRi90aFBYVUFzR2NtZzlXbHlCNDE1T2RK?=
 =?utf-8?B?bWN6MTYrek0vcmZkWTRTYjh5RkgzWUpTRUUrWUZLUlZjQ0h0aWxwbUF3TGNm?=
 =?utf-8?B?Z2IvSGI2b09mRHZ3eGlONDFhQ2t4bGFEQTV3MlNzZ0ZMTDhUTzNnTFlLN3ds?=
 =?utf-8?B?b2FmNUVjQnR0dURDbG1pTjJseDRMcDNuSzJDRUhCUWprNTM1LzlUdTNBeXZy?=
 =?utf-8?B?c25OZVU2enR3dWVIY2dBUFBQWTRqcmtsVHRlYVdiZytHTzg4dmVWRkNRZXhS?=
 =?utf-8?B?L0dhNXJIczQwNnpzL3NDOXJ6UjlMYk1XV3QxTElUMlhOdmY0cW5CZEZoRHlK?=
 =?utf-8?B?ZFVDci9seVljTVFWdzg5QXlRelhaZ1YvR3YyQkJNTW9pMWpjSklXaVovSmlz?=
 =?utf-8?B?S1IzVDFES29TQUZJcm8rTlpucExudjgrT2VJSlRaRm1Gd1dEeHNRREp2K3Rh?=
 =?utf-8?B?NnBxVkJHK1VyQjN6Y0Nqc1RvL0VQM2hLL25EQzU0dFROWldBMFpxaThIS0lu?=
 =?utf-8?B?a0QzOFY2dWd1WjFnVHQ4NDREODkxbmJFQzM2UEVGRmhyamliS2Yvb3JlZHdQ?=
 =?utf-8?B?cmVIVlQrQ1RkejI0SUtSZkZ6TC9DZmVzNGZGK2UyblNFcTN3VFNKd0pmVysz?=
 =?utf-8?B?aEtGTjVnZ1d2RXRHVnVxQjA4YmtJV3lDUXhuSGR5eVB5dzlEUnhyUFZTaFlS?=
 =?utf-8?B?aFlRNkQzelRCQ1haTittdnp3VWZqaS9QOEhlbHRFUks4S2R0bFAzYkhIQXBw?=
 =?utf-8?B?bjcvNmNHWlRNVFZ4b2hxV0Vzd3lOcDNyM0IwL1drRGZmZ2RqYlRlMGdpQ09S?=
 =?utf-8?B?ckcrYWZGbU9VM1JGUXF6Mm9RSFFucHMwL1NFT2tBdWNDZ0VxS0VUeHpjK010?=
 =?utf-8?B?UVJ1S3lIdks0aDBKbjA3aHJrZEFlakl4MUhDZy9maG1NSU1kcS9QZjFHV2pT?=
 =?utf-8?B?aEFPQkp6RHV6WE5zbUNmVk1ZVkI1M0RzRVdCelh6ckRFV1RlTVNkSXFVUk9S?=
 =?utf-8?B?NU91c2VvTVRlenZOVFFCNFRhcUJJVDRMdXFiZnlqQ1RBWm1Oa0gyUm9OaGpt?=
 =?utf-8?B?S2ViTVYrWFZlMHpHME9PY1JGK3FYZmN5K0VDb0Rmeit2ejc0YTU5WFZrR2dY?=
 =?utf-8?B?aS9ZM0M3UWFtQVRVdmY1Y2VRUVZLc2RJcmh5RHBzNDdwaU5OZUVIak9DcHQv?=
 =?utf-8?B?OWdvRmRKRTBPcE5hTkp2YjhUSXVEUjNETmFwWHN0NTRzNlc5VGpuRkh5cUtZ?=
 =?utf-8?B?OE56RThPRy94MC9lT21MdUZrU2R1OTBEeGl0MkNhMFR0N1BXZW5xUmM0ZkVF?=
 =?utf-8?B?dlgrZW8rMWprVDFVd204VGVzSFhHRHU5SDh3Zmtvcm1NRVdBV3BhWXZCTTZO?=
 =?utf-8?Q?Gt3l29AqURg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzY2TGxLekl2UlM4NUVrdlY2Wm9vZmJjSkpmMllHZ24rb0hCeEU4dno3TFBh?=
 =?utf-8?B?ekV3Qnk5V0Z1ZkFOVG4zWjdYSmJQRzl3dTg1Rk1IYlN6Tk1mTFRpL0ZxUFVa?=
 =?utf-8?B?eWJHUXp3Y1VpSTd4UjFNa0d3eVppZ0hmalRTUFFBN2RCazl1WGJGMWprYWZJ?=
 =?utf-8?B?V3JiNktMSHNUaGNyLyt1RjFhWFdSRkZGd0lnL2FIVVpKak9rRXdZUjV6eC9N?=
 =?utf-8?B?MEJWMVVHelc5UjgxeUc2cnR0aUxYSHh4Wm95Qjh3Skw5ejBuOUJNcWh4QVgx?=
 =?utf-8?B?Z3Exd0V3WG44aDV3NUh2SGVybFlSZHB0YmtRalNsZTh3RXRpWkZvY2R2SjRR?=
 =?utf-8?B?QjJ0RGxTR2xsQzlWL2pmRzc3Z1ZvZmVLQmRYUFg0TmE5RG43ZjFsR0lBcFNp?=
 =?utf-8?B?Qyt2ZlFLMUNIN2E5MWU2cXM4cWMrcjluajN0dzJGR0Zvc1FObVpmUU9MRUhk?=
 =?utf-8?B?aHJUc0xBUkhPT1RuT0RDcG5MNzNqN21zVHZHMVdBN05KWHNVTjV4WThUM1Rm?=
 =?utf-8?B?NG52QzZMUUhSMWUvcVR4cWxQK3IrWWVxbnRsYlZTNnRRbmNNVzFIbkJWWDhG?=
 =?utf-8?B?V2R4WDJrV1diQzh3azh4Tm9XSTRyWXltQ0ZuTGRuc0ZzVTRmQkttVXdLcGhh?=
 =?utf-8?B?UURmMVBVVjRreklvb1ZTYUx0clBXaDJxb3o2bzZHYm01MU9nQUM2VlZ4VlQ5?=
 =?utf-8?B?SzdHVU45ZkRoN2dZcFpRWWR6b1E3V0Y0YVB2ejd0OWFqTFhiZnluUzltdERS?=
 =?utf-8?B?aXFiYnUySlRlMnpRaUlMK3l1MGVxZXoyT2hGRitmYTdUM25oU1ZSTU90NmFp?=
 =?utf-8?B?UkFvR1JFZUZJUG1mRUhkUHdwaXpMVEFlMlJzdmxNOCtEc3hjN3c5UHUxQXlv?=
 =?utf-8?B?NUxVajN0LzI5VXdPUVVJUUF2bjIwNmRPaXJJOG9xUzNzaWgvVG1SVlJNd0VP?=
 =?utf-8?B?SGVlZW5TTVNTTGdNRU1WNC9WL2xXVU92VWdySERXVVRpUVVPdUQ0ZHJ4N3ZU?=
 =?utf-8?B?TXJxUEFBOWI2K01lQ2prUFU2NVhhZWVtS2F3dlI5YStJeEdxTjNCRTVhbndz?=
 =?utf-8?B?ZFY3NTZ6QzZwaGhld1Y0VmdvUUJnWHhiTGV4Uk9obXp6REJvZGdsdXdIcTYv?=
 =?utf-8?B?MkZNYUkzRDJwVlJZbkZ4bXZFKytoSXZQaVNxSXBFR2Y1cmxQL3NtN0xTR1Ri?=
 =?utf-8?B?dGJMYXlYQ2xJbnFiRnppaFZKMGZRQ1dUVTljN0NmZWVtNzhua2tBeUNrK1ZI?=
 =?utf-8?B?S3o4eWN3VnJVMUJwcVQwcjlRQ3BmbUFWcDhCbTFNOEdpYkZhaFk0dzRBc2tC?=
 =?utf-8?B?Yjd6emlveSs0c3U1ZnJZdmF1TkQzVWR5WGgyV1RDdER4UisyUldaNG4xU3R0?=
 =?utf-8?B?ZXhsUVladWdXRUd4aVFVTDRBaHoyWk1VL3RReVd2YTBpd0FBdHR1R0tSVFRQ?=
 =?utf-8?B?V0wxUEFYMnZwMTFycFV2WG1tZEs1ZWZyaE4wVC83OVNuYURIMXNPWENPNk8y?=
 =?utf-8?B?aXdWYjBRMFhHTnY3ajdPQTdabUxnUWkrU1RRUWhaSHNlUENDeSszWXZqa3l5?=
 =?utf-8?B?cHA1czQyd1dCT3RDd2ZWNEtWWXdvQzIrcmpwSkFFWS9jdXNKNFVFZGxCL3ly?=
 =?utf-8?B?cnBQemV1aTRCYzNUbXZnclY1RDlYNnQ0SVd6R2M3S1RVYjd6SWdIOXF5a3hx?=
 =?utf-8?B?aEdCWEVDbzVUWEg5U1cxWk5Tc3czUTlZSVFlcGVLUW42dXA2N05CR0JzNEQ4?=
 =?utf-8?B?OHovR2lpeFUrd2JmZ1N4c005RUZtNzdldVJIZzRwWWxyaFBFcndKQ3Ivd0p0?=
 =?utf-8?B?clpCeHhuZFRvOTBCRGl2MU1rZkx5U253VlRKSXgyU01UNjZ5SkxFNWRNVEJU?=
 =?utf-8?B?S0Iydjc4MGYxdDdRbnB3anRlTlpWTnBuVklTSmNSaDc5WW1yWnFHTFp1Y0dQ?=
 =?utf-8?B?UDFSc1hGdzZRK0t0VW03MmFoTjlHZGFkT1ZIOExPSmE4eHF4ZzdoLzI2cWor?=
 =?utf-8?B?Z2hSQU1FeTVCM1ltYjNqa1Bza2NmQnhzZWxvYjd3M3I1U2FFMTV0QVpITDN4?=
 =?utf-8?B?dEUyNjUrYktyK2luN3ljVHYyLzBiM0JqSS9kTCt1eVZuMlFUUDZBc3phamtX?=
 =?utf-8?Q?pW66S2BDIvrWi83taWoBAdBlB?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6d96616-1faf-4c3c-9eb2-08ddbf7f4988
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 06:59:17.4032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ertemHah+R3VzYXlP6EA8Ia0SANEY6p7Aydj6Q8NNgO+MH1X4CXrRYly65lnG2hlFv2ttqTge0yUhrGGWd75gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_235943_370356_BE1DEBA2 
X-CRM114-Status: GOOD (  28.43  )
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

Hi Jacopo

On 2025/7/10 14:44, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>
>     thanks for the comment and for testing
>
> On Thu, Jul 10, 2025 at 10:32:01AM +0800, Keke Li wrote:
>> Hi Jacopo
>>
>> On 2025/7/8 18:40, Jacopo Mondi wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> With the introduction of common types for extensible parameters
>>> format, convert the c3-isp-config.h header to use the new types.
>>>
>>> Factor-out the documentation that is now part of the common header
>>> and only keep the driver-specific on in place.
>>>
>>> The conversion to use common types doesn't impact userspace as the
>>> new types are either identical to the ones already existing in the
>>> C3 ISP uAPI or are 1-to-1 type convertible.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


Reviewed-by: Keke Li <keke.li@amlogic.com>

>>> ---
>>>    include/uapi/linux/media/amlogic/c3-isp-config.h | 45 +++++++-----------------
>>>    1 file changed, 12 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
>>> index ed085ea62a574932c7ad8d59d34b2c5c74a597d8..203116cdfb89356301c16c98cb40e5b83efe71d6 100644
>>> --- a/include/uapi/linux/media/amlogic/c3-isp-config.h
>>> +++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
>>> @@ -6,8 +6,12 @@
>>>    #ifndef _UAPI_C3_ISP_CONFIG_H_
>>>    #define _UAPI_C3_ISP_CONFIG_H_
>>>
>>> +#include <linux/build_bug.h>
>>>    #include <linux/types.h>
>>>
>>> +#define _UAPI_V4L2_EXTENSIBLE_PARAMS_GUARD_
>>> +#include <linux/media/v4l2-extensible-params.h>
>>> +
>>>    /*
>>>     * Frames are split into zones of almost equal width and height - a zone is a
>>>     * rectangular tile of a frame. The metering blocks within the ISP collect
>>> @@ -183,11 +187,6 @@ enum c3_isp_params_block_type {
>>>     * struct c3_isp_params_block_header - C3 ISP parameter block header
>>>     *
>>>     * This structure represents the common part of all the ISP configuration
>>> - * blocks. Each parameters block shall embed an instance of this structure type
>>> - * as its first member, followed by the block-specific configuration data. The
>>> - * driver inspects this common header to discern the block type and its size and
>>> - * properly handle the block content by casting it to the correct block-specific
>>> - * type.
>>>     *
>>>     * The @type field is one of the values enumerated by
>>>     * :c:type:`c3_isp_params_block_type` and specifies how the data should be
>>> @@ -223,15 +222,8 @@ enum c3_isp_params_block_type {
>>>     *                     gamma->pst_gamma_lut[i] = i;
>>>     *     }
>>>     *
>>> - * @type: The parameters block type from :c:type:`c3_isp_params_block_type`
>>> - * @flags: A bitmask of block flags
>>> - * @size: Size (in bytes) of the parameters block, including this header
>>>     */
>>> -struct c3_isp_params_block_header {
>>> -       __u16 type;
>>> -       __u16 flags;
>>> -       __u32 size;
>>> -};
>>> +#define c3_isp_params_block_header v4l2_params_block
>> Why not use v4l2_params_block directly?
> The types of the Amlogic C3 and RkISP1 headers are already part of the
> kernel userspace API and we can't change them without breaking
> existing users I'm afraid. In the C3 case the kernel support has been
> collected in the v6.16 merge window, and v6.16 has not been released yet,
> so one could argue there are no "existing users" yet.
>
> It's however too late in my opinion to make modifications that depend
> on this patch series which will, be collected for v6.18 at the
> earliest.


OK

> Thanks
>    j
>
>> Thanks
>>
>> Keke
>>
>>>    /**
>>>     * struct c3_isp_params_awb_gains - Gains for auto-white balance
>>> @@ -498,26 +490,9 @@ struct c3_isp_params_blc {
>>>    /**
>>>     * struct c3_isp_params_cfg - C3 ISP configuration parameters
>>>     *
>>> - * This struct contains the configuration parameters of the C3 ISP
>>> - * algorithms, serialized by userspace into an opaque data buffer. Each
>>> - * configuration parameter block is represented by a block-specific structure
>>> - * which contains a :c:type:`c3_isp_param_block_header` entry as first
>>> - * member. Userspace populates the @data buffer with configuration parameters
>>> - * for the blocks that it intends to configure. As a consequence, the data
>>> - * buffer effective size changes according to the number of ISP blocks that
>>> - * userspace intends to configure.
>>> - *
>>> - * The parameters buffer is versioned by the @version field to allow modifying
>>> - * and extending its definition. Userspace should populate the @version field to
>>> - * inform the driver about the version it intends to use. The driver will parse
>>> - * and handle the @data buffer according to the data layout specific to the
>>> - * indicated revision and return an error if the desired revision is not
>>> - * supported.
>>> - *
>>> - * For each ISP block that userspace wants to configure, a block-specific
>>> - * structure is appended to the @data buffer, one after the other without gaps
>>> - * in between nor overlaps. Userspace shall populate the @total_size field with
>>> - * the effective size, in bytes, of the @data buffer.
>>> + * This is the driver-specific implementation of :c:type:`v4l2_params_buffer`.
>>> + *
>>> + * Currently only C3_ISP_PARAM_BUFFER_V0 is supported.
>>>     *
>>>     * The expected memory layout of the parameters buffer is::
>>>     *
>>> @@ -561,4 +536,8 @@ struct c3_isp_params_cfg {
>>>           __u8 data[C3_ISP_PARAMS_MAX_SIZE];
>>>    };
>>>
>>> +/* Make sure the header is type-convertible to the generic v4l2 params one */
>>> +static_assert((sizeof(struct c3_isp_params_cfg) - C3_ISP_PARAMS_MAX_SIZE) ==
>>> +             sizeof(struct v4l2_params_buffer));
>>> +
>>>    #endif
>>>
>>> --
>>> 2.49.0
>>>

