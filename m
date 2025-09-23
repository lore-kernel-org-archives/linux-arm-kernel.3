Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46558CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AohOVDANkkO+DZbBDlkrxdpVcEgQ8UeG5wnK4hfEl+I=; b=IVxoTJh3ssrul5Vpq2ry8cgHqO
	A9odTOnlKHVkvIPHasD8DwhvTEch3nKiNBxL8+edQqxJoFxVVUvBc4T1tufMdFUwUseq+060LNl4g
	5MUs98Yerh061vjUaFx6w2g8VBgKYZHNogr9jozclkSVJTIfZDxwdTELaymAZ/5cSpHahEvgLtHQR
	km9P/NIWnWYUZq1nQaNYwLtaOgUKCVsMPRQ8V/aTKWXdWgbVD41PHsiJJPah+aW3/CSfdPr3gZpYM
	eCd5e/WvjzQY/tSH9d3vAfYvLEz4jvCMDYo8KG5H233ygczzloRQ5+tInf49wR1243ccpefWhmakc
	Lc9Wj4DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14KL-0000000DutN-3CHq;
	Tue, 23 Sep 2025 14:49:09 +0000
Received: from mail-germanywestcentralazlp170120004.outbound.protection.outlook.com ([2a01:111:f403:c20c::4] helo=FR4P281CU032.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14KJ-0000000Duql-28HJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:49:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaB6W1oqErsVetN9GY2lQJkg3K+mK1R8cgiCvgioZyohnxFpP4pGVPUseq6+MvyKL3NrOp8xLu0kiJCF0VnsGw+avQEFjwcga176dtFIvHiBFtW/HjCv9QZxGc+1hJOCUuVCkbRqsbnmatArFefvMYlkz++uxAJfOkWKk8r6AyfvNSoQTHmcgW+42rqRWN9UjFFPAT7rUjnNAGRHmsllMSWUi900KA8JFs/bgjOTgQT+9N3t+gFD1W4PXMxoRdmbMkbeRtjyocQcvaSnuoDSLx54wkkfN1rev+i8uOeKgssjlSgo6pVGj1k5t7+GFU2RoU+RUX2C+byoo/40CXwdYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AohOVDANkkO+DZbBDlkrxdpVcEgQ8UeG5wnK4hfEl+I=;
 b=mZz4RMVWYMuIUvjK1cy6smY5oiLEdyd1pAQLsdvKx/OW6O9CyR61TkhDEFjUs8eTf/KBZWrVKXk70cV+yJhB64wFQeEFKKZi3StLbMYiYF9oHFxmhxJSZt7mlSZYP2+VD7Q9IpvUSFxYXbsIjfDpKaeJWQ9uQQnU6quh/zVeN7Q/r1jueqLE0zXaM7aRrxIqqo6wXcB2VS5pcksym+Gw5gh+ajQSDpgLJhBkDYGz4joNdBBqi2tMFi3t/H4cAE840GPjONiQ1NzB7eHl6JEvtuzfNVrLfyd1l6uAD/vqcEu53subZ91CF0J/TT2X1EFUYQra0gIqJEDvQtfA3Fa7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siewert.io; dmarc=pass action=none header.from=siewert.io;
 dkim=pass header.d=siewert.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siewert.io;
Received: from FR2PPF7274BE471.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d18:2::4f)
 by FR6P281MB5324.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:197::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Tue, 23 Sep
 2025 14:49:00 +0000
Received: from FR2PPF7274BE471.DEUP281.PROD.OUTLOOK.COM
 ([fe80::fc7d:1a08:950f:3971]) by FR2PPF7274BE471.DEUP281.PROD.OUTLOOK.COM
 ([fe80::fc7d:1a08:950f:3971%7]) with mapi id 15.20.9137.012; Tue, 23 Sep 2025
 14:48:59 +0000
Message-ID: <0c7a28b7-8d6d-4f91-ac6c-8cf37e128139@siewert.io>
Date: Tue, 23 Sep 2025 16:48:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add asrock x470d4u bmc
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250919185621.6647-1-tan@siewert.io>
 <20250919185621.6647-3-tan@siewert.io>
 <20250922200738.GA1124791-robh@kernel.org>
From: Tan Siewert <tan@siewert.io>
Autocrypt: addr=tan@siewert.io; keydata=
 xjMEXY4MwBYJKwYBBAHaRw8BAQdAdDPxHO4UUyhKcZXkztTv4iVAbjk/+F8ayCYnegO4q4zN
 HFRhbiBTaWV3ZXJ0IDx0YW5Ac2lld2VydC5pbz7ClAQTFgoAPBYhBJ1bd8XzFb0F9Kx5LnjQ
 kBYSrhG1BQJnqiY3AhsDBQkSJuqzBAsJCAcEFQoJCAUWAgMBAAIeBQIXgAAKCRB40JAWEq4R
 tbtDAQDyPybWLk2EYMeY+vv/WID8hk18+jp3fZCNp9aJp9GkJwD9GeQNvCO1LPDUjkMQqf8d
 DgMM9pmsvbJUFfViYbflbQ7OOARdjgzAEgorBgEEAZdVAQUBAQdAjtzTYeMaO9yG3M1uBtQy
 JB57UJXf+m+mNDhWkOY69DADAQgHwn4EGBYKACYCGwwWIQSdW3fF8xW9BfSseS540JAWEq4R
 tQUCZk72AwUJEibqwwAKCRB40JAWEq4RtUkGAP0R8RmddZqdGdqdod1MkVXpw/z5OOptToXf
 za1W8nsGmgEA5gvQzkN1LJ8oP9LB8YGAmJt82tPvJCmi4WzesI53kQY=
In-Reply-To: <20250922200738.GA1124791-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0284.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::8) To FR2PPF7274BE471.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d18:2::4f)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FR2PPF7274BE471:EE_|FR6P281MB5324:EE_
X-MS-Office365-Filtering-Correlation-Id: 332eec65-bed5-4af7-6b64-08ddfab05478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVlabVlvcWtzQjRjbHQySksxYkpGSVZlWTJXSFMwUXJQZ28yeDk2QVQzMTQx?=
 =?utf-8?B?MjJMR1YzVThZaEROTDB4dmJLYXlMS2JDZGR2SmJZUVdpdVIvUitrUXJTeGI4?=
 =?utf-8?B?SG9oSU1OQXNLeFlQeXdDY0ZoR2hPR3lFVktMSjFSZE1RQnh5dFAyZStSbzdI?=
 =?utf-8?B?Y2dLM2RidjlnclNDZnhaaVlSUnhyYkh2ZjdIU280SVh4cG5sbDBFVERnY3d4?=
 =?utf-8?B?SUF3TXowMWxpY3lleEdTS2RJMC96NDg2d3lYSEdOendMMjBQdXpmMUZWWXpR?=
 =?utf-8?B?cnk4NGlpc2ZIWC9FdkxrK05hS1dWTmNhZEhXKzdMOENxYXV1aHB0eTg3QzZR?=
 =?utf-8?B?TGMxVlBRS0k5YkRTTHdSNTFYN3VGSnI0bGpDVzk2KytsV2NGTUh3cGw2NjNk?=
 =?utf-8?B?ZGF2S1dXL1BRWDByRGMzOVFLazlnVmhMUTdSSmZRTVdMRVZRYjJuQnN6TjNj?=
 =?utf-8?B?Rm1BY1dPNkJrU3dFcGJRNkpZeGdqOVd3VTRSNW1ub0RieEwvRUc4RFBsVzhi?=
 =?utf-8?B?c1hHSkZrNVg2Nml3OHFaY3o2OGV2c29qYThhMitqMXNXZUJQendDOUUyZU9B?=
 =?utf-8?B?N2lzKzVrUmUzSTBqb2U3V2JwdGZpbjl1SFRqQWxqTHkxK3RMM3Z3SktRSDNy?=
 =?utf-8?B?UnhPVFNqd2E5THV2UEFxVWhnNnV3TE9jZEVBYTFXUmdvYXpEUjZOaWI1Uzlp?=
 =?utf-8?B?UnFUYkRvN05tWkFjemVkaFNPM3NwM2R1OXhaVllZRWlhL081SXpQRkdFeVU5?=
 =?utf-8?B?WXArUktIdHFFRjNWdW55T215N2o0NzQzRlFIUVA4SXFsaXp3K3pGTjM1N2JI?=
 =?utf-8?B?NDFpdkpkcHE5enV0U2pFempjcFQ4b2h4TnNJM3lpT21iM3l0VFhoRjNuVHBN?=
 =?utf-8?B?VThFQkU4dFV2K2YrbS9tUWJGMDFaRThjTFFPaExUNEo0VTRyQzBDMlllRDVz?=
 =?utf-8?B?ZkJOSVJzVEhad2NlVTBlaUpxUVRmY2dHRURnSi9aejFHeFhpWldMSnFmZVlI?=
 =?utf-8?B?TUNmdGFnZlZHUXRKeVZDWnF5RHZ1QlY3MndUaW9JODF2Ykh6WUN4dVVUOVVi?=
 =?utf-8?B?WnJ1ZTdPYTZzQStjSVFJNXZEMC90cGpPazNXMjdsRG52UWJWNFJIdWtaVVAy?=
 =?utf-8?B?SlgzdW9CazBBd0RrNHQzNEZGZzc1TEZjQ3lBdDZ0ZzdPa20vR2RNU2wyZmZT?=
 =?utf-8?B?MEl0dG11YzlMc3hucGc1alp2dTFmK1pxcnh1T3p2cUhERzdyWWhnZlFNWUpE?=
 =?utf-8?B?NjRhSXFFMTN1RjFwRnRZamxhWCs2OWZmdTRkT1hBODNhaHNGeVlHT1p2Y21U?=
 =?utf-8?B?dlJ6Zm1KNE8vT2kreWRENkd1MHMyUnlWVFZmbzZqdWRVZXZEeUJZU1FSaDZD?=
 =?utf-8?B?clJYZHYzSU1yZEI5RVVDM3NDWnpxbmMxOXUyUnBVWjZST0xOeE9GMnZHUlhw?=
 =?utf-8?B?RHNjYWR5dFp2NkVOZ2RYdnBsTEpidEtRTzMvSlU5TTJGenlQMWhMR3pXTFZT?=
 =?utf-8?B?OWJCbURaUGxTR2FPTjlLWkVzSCtIM1ZuZi84NlI2bDVHbzVnd1YybFVMV2k3?=
 =?utf-8?B?c2Y0TDNPMkc0SlRpSkpYbUo4UWpkWFYwbUZNWFZKeWV4Zm5RK0RuWG55amZ1?=
 =?utf-8?B?QlNpMFBTSXdCTENQbnhBUFVjTFZxN1J5L0E3dFg1UXNGTnhETUpSUktzaUVY?=
 =?utf-8?B?aVZYc3JWY2JNZzdUeUFFb2l3eUEzdGF4UUltWlpSb0NobzRxQyttVElYS3Jh?=
 =?utf-8?B?VkswZUtSazFTWHZvMlJjMTZST0lvRkNTNTBEcFp6eGNqc1RXeWtveGlWZjRF?=
 =?utf-8?B?cElLbVNaOW5ncEFsdE1Dc3NDS3FsNml4RDVCLzJpRlFsVU1ZaE1CRjkrZU5j?=
 =?utf-8?B?OXU5QzdZN0dJOEMvZTlzWndaUzRjM2NlSTNSNndmSVNuYkVEVW1jT2IyNnZQ?=
 =?utf-8?Q?cEjtOg6solQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2PPF7274BE471.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjJiaXlJQ2Rha2tDMy9OYkFzL3BmL1h0NUNMSmdWV2J3SmlBTnJFL2NRdE5P?=
 =?utf-8?B?dmFVWm9OUkhzSXJvV1hnUlIwS25nTU4vTWgyK25NRHFVaW9uNzFNVTYwaUhX?=
 =?utf-8?B?WGNKdzRDNnJ2WHN3Q1NnSzlOUDR3NFNOMW03dGRJSlh1ZE5tempIQnRBSDZK?=
 =?utf-8?B?azNxUm82SEVoZHVTSWtWaTNJOWtwSHRQb3o1MFF2S0xvOUtwOXpwa2Nkdkc2?=
 =?utf-8?B?MnZFeEhkMkxOQkJMckpzYkRBa05iZkcxRjNiTjJGVjFxNWwyb3dJbVlMN3Uw?=
 =?utf-8?B?Ung4WjVETnI0K3BWeENSSGYwRDNsUlVBOWFyZjRyM041VWZyNGp1d0M4TVl6?=
 =?utf-8?B?YU02Tk1lT0tkUzlma1huaEMvRXVYNE5qMGpjODJNYlZYUFpqdzdMaWpKb0dh?=
 =?utf-8?B?a0IrTG9mNnJDeG42dVc3dlRHT2ZXdHMzMGw3c1MwSDhGOFpTMUNqRmk5Y3lZ?=
 =?utf-8?B?N1NjSnJ2TmlSNlNyVDU3dlQ1NmwvWFB5RjRvaWE2Qk1Ia3lyaDByTi9yNGZC?=
 =?utf-8?B?S0VwQmFJbExhajNyYWFzN0cyZkR1eFp3KzBPWHlSQ2o1UUl2RS9OeXlYbU5M?=
 =?utf-8?B?dmk2QlNTdFBrK2RxTXgxSnFqQnluWDFhMVhRQ1Fkdk9pdHRlV2pwV1kzVElN?=
 =?utf-8?B?S2tyYXF0L2JXUjNGeWlOVFh5a3RTN1ZicjVKcGJRRWx6NTJWcTlqUXJIUjhM?=
 =?utf-8?B?VEtDNFRKV1hRS0EwL1lrYjNIWFhMT3JJR3NRVktRTkZNdnlPazJwYm44bE02?=
 =?utf-8?B?aHMrYTlSaDlSQ0FzS05PMHlqNDVkZnA5dUJLNzNRRWIrYXE2T215cFM0dDdJ?=
 =?utf-8?B?Qm9ZVW4zdmxrV3phZTJPSW1teDVuejh5ZElUSUZ6UkxjTlV1aUtoclFoZ1ZH?=
 =?utf-8?B?NGlva1dMczhGeGY2M29uSGdKZGRxK09UcWd2Y2dZUDlDcGpaeHBBZTdHVWdX?=
 =?utf-8?B?YmI1RE1hN0dLN2xNc1RuUDFCQ3B4UWZUZksveUFXQlhxaDZ6VklpRlU0cFV2?=
 =?utf-8?B?NWVsMllXR3pXR2wyZkVZWVpYOURUNTRmOUUvWnJoV2RQdFpQSDRMUnpxNzBP?=
 =?utf-8?B?SW82RGpEV1crZTd6emxtL0kxYVNUZ3dscDRXNURuMEVHeGRxNDgrelRXMUVt?=
 =?utf-8?B?bnJQSGNyQlBiOWV1NXRmWnBvZ0pNMWd5anJrME90YVBGSWhXYkt6Ry9SenRk?=
 =?utf-8?B?SWdEajc2Skc3YndFYjhBVGxBeDJic1JCL1UxMVFiK1kyMWtVSUVIWG1mbXI2?=
 =?utf-8?B?WWVpdFdEc0l6elVXOTZtdmZ5WUxhRmxZbUdkNTRKRmJXeXRURlNJQ2x3cUUz?=
 =?utf-8?B?MWQrVzV4TnJ2dzEvSG52Q1E1ZzdjeU1NaWpjeENwdXR3TVZTUEQxWHdqQ0Zx?=
 =?utf-8?B?WEhmVFUxcjZySVZMcEZGTW5xTFpNc08xTm1OU3BvSUsxeit0bkw0d1N6RkdH?=
 =?utf-8?B?ZFd0b2QrTmxIRHVPK2pzOGpCbitvellHaUhCd3dwMjEzRmMzRVFvUGVXeWtx?=
 =?utf-8?B?ekdGaVVDc3R0YUl6SU5GcGxyU1VPdlZ4UVZWZ3dmSmhHRVpaTGpWWFBtYWNR?=
 =?utf-8?B?d2hWeW9VZHlwVXdmZm4yNnhxZzArQjdDSmlMUXJwdlRjMTFzYllZSXZoTS9u?=
 =?utf-8?B?ZldzMVlXbTd2aFVHNnlGNU5EbkR6V29RMWdCYVRrRy9pdVBpWTQrbEdTTVlJ?=
 =?utf-8?B?QUpSZDNjdDMrRmU2TUZjbW5tM0FQSU1yU091YVNwZVJnTGJNMHkwSVk2SDBE?=
 =?utf-8?B?T2dFRzdxNnJKUzlIOFMxa1FWRkJ2WlpaN2tZSTFCSlVJUHFNVHdJbWVoUmdW?=
 =?utf-8?B?c0FuU2NkOXlrMGpjQTV6bUdtdlc4U3dBOVQvZ0hTVXdYQ1dMMmFlSzF3QkhI?=
 =?utf-8?B?alBSRGFKQTJaRDllaXlKRGY1SGlOcUs3Yy9JL01xWnVuaTZ6anpjZHBTVmk1?=
 =?utf-8?B?NXdCSUNobFBkbjFLQ1NXSVZRNmpaTFBqTHMxNG55ZVc2aFF3c1VURXh4b0xH?=
 =?utf-8?B?UllFc1FCaHpBZnhLbHFwSHJzWXM4cWpPRldVc0RSckk0Yk9vUVNLZmFGSEF5?=
 =?utf-8?B?RUpMQ25aU1lMdFNiR1NCT3FmdjZqR3VGM29xMXU4RDZCZGJsL0xBVG9lRitW?=
 =?utf-8?Q?TBOo=3D?=
X-OriginatorOrg: siewert.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 332eec65-bed5-4af7-6b64-08ddfab05478
X-MS-Exchange-CrossTenant-AuthSource: FR2PPF7274BE471.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 14:48:59.7289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e8b4abbe-444b-4835-b8fd-87ac97451a7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfklPEcjSd6h1+tPfqKvqtAQQ1XPovVDFTabPAvQK4vqz9MUtRX+nNP/LcC0cjFS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR6P281MB5324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_074907_556780_127120F6 
X-CRM114-Status: GOOD (  20.15  )
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

On 22.09.25 22:07, Rob Herring wrote:
> On Fri, Sep 19, 2025 at 08:56:18PM +0200, Tan Siewert wrote:
>> The ASRock Rack X470D4U X470D4U is a single-socket X470-based microATX
>> motherboard for Ryzen processors with an AST2500 BMC and either 32MB or
>> 64MB SPI flash.
>>
>> This mainboard exists in three known "flavors" which only differ in the
>> used host NIC, the BMC SPI size and some parts that may be un-populated.
>>
>> To keep the complexity low with the BMC SPI, use the 32MB layout
>> regardless of the used SPI or mainboard flavor.
>>
>> Signed-off-by: Tan Siewert <tan@siewert.io>
>> ---
>>   arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>   .../dts/aspeed/aspeed-bmc-asrock-x470d4u.dts  | 345 ++++++++++++++++++
>>   2 files changed, 346 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
>>
>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
>> index aba7451ab749..fae97b5183e5 100644
>> --- a/arch/arm/boot/dts/aspeed/Makefile
>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>   	aspeed-bmc-asrock-e3c256d4i.dtb \
>>   	aspeed-bmc-asrock-romed8hm3.dtb \
>>   	aspeed-bmc-asrock-spc621d8hm3.dtb \
>> +	aspeed-bmc-asrock-x470d4u.dtb \
>>   	aspeed-bmc-asrock-x570d4u.dtb \
>>   	aspeed-bmc-asus-x4tf.dtb \
>>   	aspeed-bmc-bytedance-g220a.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
>> new file mode 100644
>> index 000000000000..bae2b521f708
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-x470d4u.dts
>> @@ -0,0 +1,345 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/dts-v1/;
>> +
>> +#include "aspeed-g5.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +/ {
>> +	model = "Asrock Rack X470D4U-series BMC";
>> +	compatible = "asrock,x470d4u-bmc", "aspeed,ast2500";
>> +
>> +	aliases {
>> +		serial4 = &uart5;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = &uart5;
>> +	};
>> +
>> +	iio-hwmon {
>> +		compatible = "iio-hwmon";
>> +		io-channels = <&adc 0>, <&adc 1>, <&adc 2>, <&adc 3>, <&adc 4>,
>> +			<&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>,
>> +			<&adc 10>, <&adc 11>, <&adc 12>;
>> +	};
>> +
>> +	leds {
>> +		compatible = "gpio-leds";
>> +
>> +		heartbeat {
> 
> led-0

I guess `led-heartbeat` would be fine too, right?

> 
> This should have given you a warning. You did run "make dtbs_check"
> check the warnings, right?

I did and there were no warnings, even after a full clean. The full 
command I ran before submitting was `make dtbs_check W=1 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml`

Maybe I am missing something here?

The dt-schema version I am using is `2025.9.dev1+g4b28bc79f`.

> 
> Use "function" to define the function.

Thanks for your review, Rob! I will fix the led naming in the next version.

-- Tan

> 
>> +			/* led-heartbeat-n */
>> +			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_LOW>;
>> +			linux,default-trigger = "timer";
>> +		};
>> +
>> +		systemfault {
> 
> led-1
> 
>> +			/* led-fault-n */
>> +			gpios = <&gpio ASPEED_GPIO(Z, 2) GPIO_ACTIVE_LOW>;
>> +			panic-indicator;
>> +		};
>> +
>> +		identify {
> 
> led-2
> 
>> +			/* led-identify-n */
>> +			gpios = <&gpio ASPEED_GPIO(D, 6) GPIO_ACTIVE_LOW>;
>> +		};
>> +	};
>> +

