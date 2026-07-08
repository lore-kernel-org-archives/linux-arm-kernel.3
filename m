Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B85C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrRcme4Xu7HcdW1rgtXQTdpDClxqOklL7lNizxZWOD0=; b=B9JVrjBkYKQuRwEnNdIa9dB+qq
	8Hpv+5m4++nuSUxnc1IczHGH4nH+b7T8VsS7r4nKltKHq5QqBoaXNWwMZVEt1uAQhCmEChFC6FyVd
	n65BwR24zfKuG6rKtV2G+O9e2P5LJUAXV2B8kfkgqwdTmQxjazgZyoEuomCVawsofLtP9BJboWG7y
	ISp1WUcAZ+bnV8w/X9AIcNSrz3m1YwjHJ0aogT4dDWfjPA4baUIlM3r0mTxCeDHWBbkksObfPWXt7
	akL8BC2RoTgsI4Niw5Yi6mgu1LQ5pZrc/clUvGMirCVBmt15shvbc3IJ8sQPxXiyMg71SoQqWMSv7
	kyWPbHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVLT-00000000165-2Qem;
	Wed, 08 Jul 2026 16:41:59 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whVLQ-0000000015e-0pka
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 16:41:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iEfaPllRile8kwtY1FcJ2YnS0f6VpS4eSJhBU9Mm+eS3UsY1ahwGsMBlbHwPUHGuHZjEQ+VjOlRrW+U0I9UtX+kNuVor5vJ4usrwMK8YvUWPqgZyc2Z8pZyAXoiZz5c8V9n6zC5LcbqBZ9IqLfYBKeUjy7kf3lAtGHZ0xYIWVYO2627sCIe0z91zOcpCm2ekjtmpBYGh1fhAcgprLc1xiRI8DqIfFYptCdih+b9vpaEOLgLUHT9s1jF8ySrJTAVuYi2ALC594OM/5UIWUBkxqghFA57DPSmOw0p48BYPknrh7p0f3uBJYGXNigAuMNQK7/ATb3gIwOw6lOSna58MDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrRcme4Xu7HcdW1rgtXQTdpDClxqOklL7lNizxZWOD0=;
 b=ezf/Hzyc1UBm/6/cR0DDWYJNIywp+x4vERlcXWorfbOVtRdOIGMMldLDNdLYp8b8SAvAJOBR4X6T5+9XHWFOvEbaYGYgsnF2E/QC5FqsYf0ZBNdFxzZvl8MH8bNNbNAIe2GTnGl9XppK0JHJdvoVXiiCSQ6GqEEBXCR5npmA88Fh1L2pxiUA9y95CQ/+tajRqH5ELrvR7SayMpBf5BA/4Au47KWm96ayAE5xqdnyWHtNXytUsNrtmMMCdfMEg/krH0B9dMQdXXj1BKIu02lTFj/4r80V+sOK+5+ap1dFonKNixmfkJZEFWBgsCTy4j+K7YKXkgHjzZVdvUS+5Lt6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrRcme4Xu7HcdW1rgtXQTdpDClxqOklL7lNizxZWOD0=;
 b=MPj0BiyaLsjH8G5mW+FCVOFrNMScggl++BK2et68gP2NBTx8QaFUZnYnmNKCNt9gEe7U1/Pja005jCgazWcN8/j3qXfMiDmCmUZmO5suyuD9OHz1TWH+KszIXBv/BOeODFjWPUREo53Z4Z2Z9DH4FpVTBmGPu7a8f3SOT/uEHpU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by PH8PR12MB6868.namprd12.prod.outlook.com (2603:10b6:510:1cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 16:41:39 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 16:41:39 +0000
Message-ID: <9983ea6e-105b-4c3e-86f0-5667159d89dd@amd.com>
Date: Wed, 8 Jul 2026 22:11:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/4] net: xilinx: axienet: Derive RX frame length from
 DMA residue
To: Srinivas Neeli <srinivas.neeli@amd.com>, Vinod Koul <vkoul@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Suraj Gupta <suraj.gupta2@amd.com>, Marek Vasut <marex@nabladev.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alex Bereza <alex@bereza.email>,
 Folker Schwesinger <dev@folker-schwesinger.de>, dmaengine@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20260708100652.603074-1-srinivas.neeli@amd.com>
 <20260708100652.603074-4-srinivas.neeli@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260708100652.603074-4-srinivas.neeli@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|PH8PR12MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 05806e3e-fc93-4ac9-6fe0-08dedd0fc88c
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|18002099003|22082099003|4143699003|56012099006|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: lTxLks72hIfw7rFteYUxHGRj1Wow+qkWnJeMyClqUuOw63DpivYUEfRM1bCmN2oPNf7u6fVWCs6EYFakGsCS0hhGQyhfhwQBIww2ud886iNmkmWxQhh74VFXd3XmEhi8jN9ygivbTw7/lhUqb4wC7yShkMVIX1njxb9ao5AsFeAEpL5s9Ic3nkoXERWv11KMpsi4LvLtkwf1VL5aqOiyKP92utrneh0AS0bvYlN35X8JZyLAdxvAIYqy7ZStOgZFo2VzHt2TXAWiTEUuAwotchti5QCTDrGXuSqfTvwyKEE4Iri7NvdFZYw4yLuBcToArG6Srj41ZOokG5Mkn7Xu+rIavGUW5dm3KGAOtpijFoBrk/6VxV+/PIIQQgYVX5eYRS65Cd4dpQfL05E5E4kOyRWwcSx9gRglXl8+QV5IYRn24LMn9/9LPRjmJkOwP5WY/rmwg5AhdpqMRXEv7nZL8OkKRE/pmBZdOSWDJazprgxer++Urw7uRDErfpUZACwm0wvFSCMaJ6Apb8CH545vDPWy9TiSseDlHQfKWLwxpcYonxD2aEuZKkj6SaQb9VKSBFtr3Y9ffwMABLXuDBiWgsccA2nyqZ1gvuCpV2PXXTEaEZ+/Rjmil9IFBBb1K+kKP2fj63++8rVHnqc70FNznk14XM4D7fARlBp4njlQYkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elpxNDRaWWZYQ0pYcGZRNVA2aDFNSWlNbE04TFRDZFpob3duRmtpcVhid2E0?=
 =?utf-8?B?dUF1Vnl4MUxOeHQ2ckM0UFFab2pnTVhndVkySnBUOXl5ZDZ3eC9HZHBmMGFa?=
 =?utf-8?B?eHJTbS9pVDFrTG00a2ZaUXVnUTZjbDQvanhBMW5RUHFCeTBycGZtdTRYSHVn?=
 =?utf-8?B?Q1hVZ3BhdkM1Yzl2NGpWNVV4d3BVS2JzNmQyVG11Z0kvaEhNbys4OG9nWUNQ?=
 =?utf-8?B?VUlYSDAvbmUzVGp0UUxETnpmeW5LMzJmckpMN0FnaDJwTVVmTE5XNnBZZ1JT?=
 =?utf-8?B?dm1ZNFZ2WEZKeVJKeDRWcjhIKytVODQ5V0gvajJVM2JhWFp0MWxaa0NaU0cw?=
 =?utf-8?B?Y2RzU1lna2hnejJRVGpGUTlpbWdoVDRDWEV4ZytEdmdaU3Q0ZlQ1UTRoQlcw?=
 =?utf-8?B?MlVwdjdERzYxdWZKSTFVM2U1dXRVOEExcEMyeHNpblRrNUZDaTFzemRHKzVY?=
 =?utf-8?B?ZHZsY0IwdE9HS1VQYlBpWGdwUXdtL0NTOGlTWDJ0MG9hUzNOR2RzUzZoMk5m?=
 =?utf-8?B?cFVoek5INmpRUjdwWXNDNVZVVFdpNTExODdxNjBYZWFlUDhsdVcySGVLS1pR?=
 =?utf-8?B?bHpaajYyUVNmMmM2clBMdW83UWJDZmh4REUxR3oyZUJOU0M5UUdLV0FPeVJk?=
 =?utf-8?B?VDdva2dQeHJXSDFkVG5qcFRjSFdjN1V2M29SUmRLOXVMNTZjRVRMcEYxaHl5?=
 =?utf-8?B?YjdOSDJ1QzZHVVdUcytDNnVMdWFOM05yTTNFVjFkZUpSKzh1UGxuZ2dzMXhr?=
 =?utf-8?B?Nk40dmpPb3FZY09ZMXZwTUY0NnVkZnVYSTlnWDRxV3lIQlRsWnFseFgyWmov?=
 =?utf-8?B?MXJDS3dXSml3Q3MwNUVJQ3gwVEkwTndiUTErdDc5dlQvSDNsejlSWFQ4QVhV?=
 =?utf-8?B?cUFjZGpEQ0hyenVXVlMzZERXbGhlS1V5TDJvWTFON3UzSW5IS20zRUI2S1pL?=
 =?utf-8?B?TFo4M0dqK3FKL1ZRZkZQekQ0L2dQeEVXM1M2anorSUJmRzB3WDN0NTlWaHJm?=
 =?utf-8?B?Z3RzV0crM3RWQU0zSkJIQ2cwelpxcGYvSjlhTDl5Wlhkcm1rbnYxb1Z3ZnlZ?=
 =?utf-8?B?MkplczJ0d29HcmNZOFpGN2J1QkR0ek5QYTRyQ1grejZFNUVFUXI4SVNzV21J?=
 =?utf-8?B?RGZuWkJnZnZoQktSck84OXhTLzExR1Q3VWFOaXpyL1N5elAzcDdjVHQ1ZkUr?=
 =?utf-8?B?eCtjTW5VUFVMSDFQNXBDZ05PNE9WOCtDZFl5RTU5dVVoK1FIdWVmSEh6Undv?=
 =?utf-8?B?Y3BzWWt4RTVpeUIwaXE4VFpQUGpLRW4rZ0grQ0R3RkpqNUNxbFJocDlmQm9I?=
 =?utf-8?B?a2N1ZFhCam5YbzZFRjRPY3NyZnFubCtXZllybE4zMHNTOSsxUmZEMUQ0YWxJ?=
 =?utf-8?B?eE1KRnB0S1ZKelJkMFplVXpISEJJMVNOZFl1SElpYVhPVXhDc3I0Qm9GeXA5?=
 =?utf-8?B?Ym1rbHVvVlJLRy93RkZBV01DQUUxZkduVU8welIyWlFPVmp0TFR5NnRzTDAy?=
 =?utf-8?B?aVQySk4vWnA1MmR5Vk5udEFtTzBROWE3LzdlZ3dHM1JzcGp4aStwa21IcVIx?=
 =?utf-8?B?YW5XdkZXK3JwOTA1QUp3bFB0d0czSHN1akl3SjNsRTFLRWVPVkRCVWJPdndF?=
 =?utf-8?B?ejlVMnh6ZUhScUQzOW5jUVVPNmNTamJod0lpc01TRlJBbDhEUW1EdlhoblJR?=
 =?utf-8?B?RS9WdDdTTklVSzJYRUpPMng0UHFlU3NvY2tVaEdvYitHK3Q2UXJuKzRudGJr?=
 =?utf-8?B?T1g0YitXK2lWc0lBK0lqR0RqZWpFMndBRHZyQUtkVWpESXI2VTlQeHBJdEtr?=
 =?utf-8?B?OTROTTVZei96QnExTlFrUkhyRzhYVTV3bDJmamZRQ0ZmWGwyTTBGTlVuSm9L?=
 =?utf-8?B?V1NOT3pPUFI5K2oxYXJsY2g2cTNlWThuUjFFaDljM1Z5ODFJZjBJdWJxY2Fi?=
 =?utf-8?B?eGtLY09lL29QK1JMZ05JOSs5Y21jcnFyUXRMRTYraldFN1ovOUVscE54azlk?=
 =?utf-8?B?ZHptYjU4VnAxb2d0bkxqV0tBUVUraGE3dnBvMGxIdlRrMkpXYXRUTTNFeE1U?=
 =?utf-8?B?ZFZsL2laLzhGdUFDbWpwZy9vTXQ0YmNXWUk4ZFBjWlZVd2g4ZkdKVXZkQTZE?=
 =?utf-8?B?Z2QwVC8zY28zVTB0Z1BsQndhU0dVcXQ5cGpUMEhHUmxoU1h6clVncHVQNndh?=
 =?utf-8?B?N3k4Yld2dSs2Q292YWZ6Z1FDSytLK3BtQUE4bkk1VWZhdmZ5RUZIcVhFelJI?=
 =?utf-8?B?dTZVN2U1V3dkWHg5bkNtckN4ZUhDdytvWXlVTnVuUk03Szk0emtoOE5wWnlR?=
 =?utf-8?B?dUE2M3B0TUl3d09KMXJoR01NaGhJbWZ6eTdlWEZrTkJuS1I5ZWdRUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05806e3e-fc93-4ac9-6fe0-08dedd0fc88c
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:41:39.3515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dw2U0ya9ySfisbJ/UtE/fSBliYUuvOD2EjlucOUyiRhrnAMoVRZHdvWaHAxlawLr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6868
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_094156_249222_87E4E1C1 
X-CRM114-Status: GOOD (  28.40  )
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

rephrase to - derive RX frame length from residue in dmaengine path

> The dmaengine RX path determined the received frame length by reading APP
> word 4 of the DMA descriptor metadata, masking the lower 16 bits of
> app_metadata[LEN_APP].

Avoid above explanation and make commit description concise.>
> This relies on the optional AXI4-Stream status/control interface being
> present in the design. The descriptor APP fields are only populated by the
> hardware when that interface is enabled. On designs without it the APP
> fields are not updated, so the length read back is invalid.
> 
> The AXI DMA engine already reports how many bytes it wrote into the buffer
> through the standard dmaengine residue mechanism
> (dmaengine_result.residue). The received frame length is therefore the
> posted buffer length minus the residue, which is independent of the
> status/control interface and correct across all designs, including
> multi-descriptor frames where the residue is summed over the chain.
> 
> Use result->residue to compute the RX frame length and drop the descriptor
> metadata lookup, which was only used for this purpose. The error path now
> uses the standard dmaengine_result.result status instead of the metadata
> pointer return value, and the now-unused LEN_APP macro is removed.

now unused>
> The transmit path is unaffected. It still passes APP metadata for checksum
> offload and derives its length from the skb.
> 

Switching to dmaengine residue is better alternative but consider it as 
an enhancement. Drop the fixes tag. The non-dmaengine axienet RX path 
still derives frame length from APP field and it's a design assumption.

> Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
> ---
> Changes in V3:
>   - New patch in this series.
>   - This patch enables axienet to work on designs where the AXI4-Stream
>     status/control interface is not present. By using the standard
>     dmaengine residue mechanism, the driver no longer depends on APP
>     fields being populated by hardware.
>   - This approach replaces the V2 xferred_bytes mechanism (V2 patch 5/5),
>     making the dt-bindings patch (V2 patch 4/5) for xlnx,include-stscntrl-strm
>     also unnecessary. Both V2 patches are dropped in this series.
> ---
>   drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index fcf517069d16..67d1b8e91d68 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -53,7 +53,6 @@
>   #define TX_BD_NUM_MAX			4096
>   #define RX_BD_NUM_MAX			4096
>   #define DMA_NUM_APP_WORDS		5
> -#define LEN_APP				4
>   #define RX_BUF_NUM_DEFAULT		128
>   
>   /* Must be shorter than length of ethtool_drvinfo.driver field to fit */
> @@ -1159,29 +1158,26 @@ axienet_start_xmit(struct sk_buff *skb, struct net_device *ndev)
>   static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
>   {
>   	struct skbuf_dma_descriptor *skbuf_dma;
> -	size_t meta_len, meta_max_len, rx_len;
>   	struct axienet_local *lp = data;
>   	struct sk_buff *skb;
> -	u32 *app_metadata;
> +	size_t rx_len;
>   	int i;
>   
>   	skbuf_dma = axienet_get_rx_desc(lp, lp->rx_ring_tail++);
>   	skb = skbuf_dma->skb;
> -	app_metadata = dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_len,
> -						       &meta_max_len);
>   	dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size,
>   			 DMA_FROM_DEVICE);
>   
> -	if (IS_ERR(app_metadata)) {
> +	if (result->result != DMA_TRANS_NOERROR) {
>   		if (net_ratelimit())
> -			netdev_err(lp->ndev, "Failed to get RX metadata pointer\n");
> +			netdev_err(lp->ndev, "RX DMA transfer failed\n");
>   		dev_kfree_skb_any(skb);
>   		lp->ndev->stats.rx_dropped++;
>   		goto rx_submit;
>   	}
>   
> -	/* TODO: Derive app word index programmatically */
> -	rx_len = (app_metadata[LEN_APP] & 0xFFFF);
> +	/* Actual length = posted buffer length - residue. */
> +	rx_len = lp->max_frm_size - result->residue;
>   	skb_put(skb, rx_len);
>   	skb->protocol = eth_type_trans(skb, lp->ndev);
>   	skb->ip_summed = CHECKSUM_NONE;


