Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7BAC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0baSFwj+K7OSq/qaZoVbGxUiXj1OxVV7Zm9MD4cuTE=; b=13Z1qtE3Qn0Qff1QiPA35LaB/5
	BMJ7Rube0NnqxahCIAHW7ux3qbEUqdh0FDwftassU9ImaQ2qndxKKl2T5O6W20WEgj5QwcxFIVt6n
	7e5MzJ3QJ0wnmKAshZKqbcyEvwdY6/cVkbuoDouq2fSkhxndjb9PNfzltm/KodxqlX2Chz/wjTIJm
	S7Cdpb2RFCBAakNgt9bWI3Y/Mg7Lr8aeLH7wdWg4JclBIY0foXCGYWEYr9ykslujn9RLbt0MsWEFy
	q3UvhcsUw6i/YfqRPVhqEskkSr+CzBukAm06wvRZgzkngt3PeXD5c8AE09Bu1qZIm2V/peSBPfGgZ
	hwhXcmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzMN-0000000EtP3-4151;
	Wed, 15 Jul 2026 13:09:11 +0000
Received: from mail-eastus2azon11011023.outbound.protection.outlook.com ([52.101.57.23] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzMK-0000000EtOd-2bIP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:09:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1BLHKYC7N8uqTXctqRKNBhLWTr3kBkuxlzhJhvELMomJf1YeDKTsfrN+KEB1q03QfnlejJ6smxbrQMPCH3sSof0H0kCPNPhWWkXpn2JGpqKF7Nc4ULGrd7B4b5XR2xw3/VkBbi6pLnxEP+9FkE8pBtNySKP0QftcW8OFLCIJYTUB0nSIf41GQW3MNCNwxDsNCQpT9nIgPNfOvvXKBkc2dPbXDwsUdU5KVuhsmABemHXHECArGDPJMShkOP/LzgeFJ+bjCNgTvlMz/v8nfIHu4KXd1B3B5dy8BvSrStPCCgT8CbC8egi/+TFcho1xmEevyfEQvlz3ksf5OFjcr/MKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0baSFwj+K7OSq/qaZoVbGxUiXj1OxVV7Zm9MD4cuTE=;
 b=aXnRqzSnAV/l/pgCareEX+2hEFttLISsF9jhyCAJJ1v9PSmKiKSCY9jKPi31NSjNiqfya58+ZZZn9JUJJv2SrEJKRGxJsGOG8rI1TBCrLo7xzBoQzx3N31FiIf5xC2W0JxGMK7TI8RmPz7uPTxgNZIxC/MMfgon0XadF/DmZmz4kTNTnTf0AN+W9dgWWAYsZpuWnYvQJTKEwy7H8OGOSGqhbpMfA3d7I35kWsZxXJ50VpW80J4gnrCWbx8gCq2/fMVDlqpCnrC1aTDQZw35JSISnnKYjDld3sOKdG89ICZh1LgsnHaPnbp0tdcmgTDAnpypJ10loaHWxWtejCk/zag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0baSFwj+K7OSq/qaZoVbGxUiXj1OxVV7Zm9MD4cuTE=;
 b=a2GaB9fwnBgLFPtjmp/3FkJnDSrXJErE8PXbA/mn+iFK3yJ7ilTk1PmKs/9QMieMy8eWUO+Y8RSvfE9YFYf53nNztEszwhgJx9gtZVXEvSsSa8oi3qRSsU4CP6d8B+CqRlaNqIRC4OCrlUuOyoGUOf7RkRk0XtKB7AkO7/RIdLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9717.namprd12.prod.outlook.com (2603:10b6:610:2b2::8)
 by SA0PR12MB4464.namprd12.prod.outlook.com (2603:10b6:806:9f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 13:09:01 +0000
Received: from CH1PR12MB9717.namprd12.prod.outlook.com
 ([fe80::b26:bd7c:5076:9cd4]) by CH1PR12MB9717.namprd12.prod.outlook.com
 ([fe80::b26:bd7c:5076:9cd4%6]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 13:09:00 +0000
Message-ID: <2c6bba39-58b7-47ed-879d-235ab23ef6ae@amd.com>
Date: Wed, 15 Jul 2026 18:38:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: axienet: Clear stale AXI DMA TX/RX status before
 re-enabling interrupts
To: Kusuma Vasana <kusuma.vasana@amd.com>, radhey.shyam.pandey@amd.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, dumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
 Suraj.Gupta2@amd.com
Cc: git@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260715125028.2104305-1-kusuma.vasana@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260715125028.2104305-1-kusuma.vasana@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0085.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b6::10) To CH1PR12MB9717.namprd12.prod.outlook.com
 (2603:10b6:610:2b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9717:EE_|SA0PR12MB4464:EE_
X-MS-Office365-Filtering-Correlation-Id: f112755d-ea3d-4645-e495-08dee2723cbb
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: BmyXk24Swc2kNTFiYNjS4CcAe8BvjhutQWB0QiggHNEo2BtvArK5ijbESW8DX7TDUrGxpsGbRt7dbE/Qxb9RaHJTmOc9EO3q0v4661S4b1XcAFpwXVE+AUPrvO7hicRdd9rIwOtufSdYVAlEGeR88loSOOXShXvrLTJFFC6+/6+1twgApBrwvf752lUkyN8e7cBWlPfKKR9b+WAGlrDA1LCOMcHum+Te7BmCM+naKCARW3SEvDWtUo3Nu6NEPm6S0qOhlWjHMOsskpcFPHluFDa1izmX4L0WRNc3PPZm2bQGQ+kGI34t0S5pEYNZclR1YfIV0wFI/niUPt7l7nDBI9o0vy0dGdfUuTAWxeQIHS+04Fr5AebrfziGkpbuHngPnIW08b7x3v1Zc4vqwro8Y0DM1YGczlE6RZDl+v4ZcDa056sYnqtWdFBui9C1yjcmnQ3BsDDlh7QV/Qph62zXFKs+P+ArZxjhp/sRsyEHoA4WM1V4BVYCwWlzqHLsG8XKgJN6Km6oNK16gKQUyTwToCW0uCZjVERT0FhO4J/8coR+wVwIVPfLloG9Yzxd4VplmduWX1ZVuXixtt1iFLYD9qmBOMpsOPuHRIxDQLw68KxFEAIXreCS6is1UNM0ivyXMphat+S+9IFfBtsEqlLxx6bTgeRToqvNkKNXTknYMCY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH1PR12MB9717.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dktGNXgvYTJtR3RrZ0pGcG5QOW9DWFNvaVpRMmFUL2lwZDJPYXdsZUVEcDg0?=
 =?utf-8?B?WEh1QU5qR0R2aml4YUhMRTk5bUxqUkoyYVRKT2N0M3EwaHhMUHpmempIL0RU?=
 =?utf-8?B?WWgrSWR4S0VEVDRMT08zcG14YnRXdE1obXpNR1FSVGhCazFVbHRiYTEyNUJ5?=
 =?utf-8?B?eDJDTy9mR25YSUZpSzZweFVLajk0OExDKzVacm9jWXg1VmVVSllyMGwxTjVi?=
 =?utf-8?B?czJ1aXlhaXJSWlVQNHZFa3BKaThEdllLaWNYd1AzMURWakp6dzVFK00wRDdQ?=
 =?utf-8?B?U3lNeW1oMHZKM25vRmwzQ3JHbDdBbmYyS3psZGIyVE5HYWRFUHE2NHY0OVh4?=
 =?utf-8?B?VEY5ZmxGcE5zb1Vrd2hvVVp2ZDVjM3pyM2lQRWVOR0I0M2RLNTl2bWxxTWU3?=
 =?utf-8?B?OVJXZW1LNytlUVJOUlU2SGUwenQyeEhwa3kzU29LdG5xZDJLSEZURnFoMEVy?=
 =?utf-8?B?dXVXRktadlkyMVVraEw1NHVuK2tpR3FzOW5JSGhGT0gxaGIxaUxybjd4dndm?=
 =?utf-8?B?M09GajJza05CS2ppSjJzbHFoNEovbXdMcWRqc1hBSEIrZks1b1NjUkYwaFd4?=
 =?utf-8?B?aHRDSXhmaUN6UDRMOEtDTTlwcERvTFpJTFU4NWg4dmtyZGxwQklCaFRES1FB?=
 =?utf-8?B?c2I0NlYyYzEzL083QzFjWEZxVGJCVndZWHc4TE5sVkxKRUJnbXhvZkNiWEpo?=
 =?utf-8?B?OThIR2Q5azN3Z2FJaDNsY0JkN2RTSy9ESlI2ZGxFNGIrUUt6a09ydjdzWkR2?=
 =?utf-8?B?WHFhR2dyaFM0RjZPMFQvR09LK1FqclFsWWcxUUh0bDBaZExZVlkzd0xLck1q?=
 =?utf-8?B?eHlxZUJDWC83U2wySXRIUEZ2TmxWMWM1eVJzV29DakV5Tmx6bjJjZE1xTFRq?=
 =?utf-8?B?T1YxcEplWFNrUERXTnRPY09UZ0VzQTRlUzZLZ09Dd0VTYWxJWWp6bFNVVFBm?=
 =?utf-8?B?clUwQUFYcS81cmFPdFgxNW1QWjBBVkhiN2hWcGtPM2FJR1NHY1RVeXV3ZlRh?=
 =?utf-8?B?S2daVy9ReHZDZU9pNEFuMTc2a2N6R2tPZjV1WnprUkVHY0JkQ0lOcm1IYmp2?=
 =?utf-8?B?N1NPNVlLOVdrNjVJUTBBYnl6ZHVieTEyZXV5UGRlRzhyTytpNWxCemIyendY?=
 =?utf-8?B?VElOWFlmZzFoSE1kdzdjRlQxU2ZxaU1qMWtXb0VVWFhZYkRqeG9QWkVTQWFW?=
 =?utf-8?B?ZEJ1VUlUZHoyRVk3QzMwYkc1bmVCemJJWStGbnphN3hNL3h6WEF0TGxsMjhr?=
 =?utf-8?B?eFAwbE1XMy9IWmdjQW81a1RkZ2J1NWRkS00vNWFIbDJOVFdmZE9Pa0NaOEJI?=
 =?utf-8?B?VmVzdG1EL3kxckZVYkpTWERFQWsybmZ2THgvWlEzR2tzaDRMaEFKNUlOS2J0?=
 =?utf-8?B?dWcvS1BNVDBPT0hKMktBVFRGVXVOK2pzUXoza0lONTlWeDBoeDZiMnhsRGtI?=
 =?utf-8?B?bC9ZZTlEZVFraW5IV3RmZ3pJdXE1bGptZzZVR1hGUG5kd29rdzI3aFM3UmRt?=
 =?utf-8?B?clBMb0Fma2VzZzFpZWs5ZW56aXA3YTNVNk15R0dMUnRkTE15K2hRdXl4REZF?=
 =?utf-8?B?MHRQMUJ3ZkJNODVzM2thVitpckJ4SC9kZWNLb1YxbWNDM1lPRWMxT1dWT3J6?=
 =?utf-8?B?anhTZlNMYTBZZEVzUkVjKzBFTFJRSEZuNGwwemRUNkd4dnVVNFl0R2VhTGI0?=
 =?utf-8?B?MjVaRjEzbmdqZm85Q3g2UjI5SDZwQmVRemhxR0t2bzdlMXB2MGZPVkJhTnpH?=
 =?utf-8?B?Z3JhZnRSWkhhc29nKy94RWJsMkd6QitGb2NPazF2VTFnZlhPRGg1cjZjd3Y0?=
 =?utf-8?B?ZjRkaGF0ZWlYT3BXR1hWK0IxcVNoTXVTTUc0UW04enh0bEI0cWZ6K1E3N3pL?=
 =?utf-8?B?dEh2eFBxRGlMMFgzRTlCUTFWV29HWStSaFo4dUo1c2ozOVl5ckdVQ0xQMGQv?=
 =?utf-8?B?N0ZUQWV2dTJNTVFDR0kxZ0p3d0lwcmFJb3hmZnMwdjBOcjVTaE53S3lRUVk5?=
 =?utf-8?B?bi9JcUFyZlJ4ZFhxZys5SnZwc2xRM0dkYzBadHYwQi9ZKy9JN0hYV2FTM2gv?=
 =?utf-8?B?d2VReWtpbndNQURTRDlFVE03bC9MUjF1MkdaQ3RTSzZURG9nWjlhOVVvNUxF?=
 =?utf-8?B?T3R3VE15My91dUFsS0RtZWtYREV6bkdrZTRma3RxSE5NenUxUDNnL20ybEpy?=
 =?utf-8?B?Q2xLU2dmTzQwcS9NdjZnWVJ3dmJseHNqWHVYdDZHcjVFU21UTFVMUXJFeXVu?=
 =?utf-8?B?V3ZYRTZ3SHRsWkFMTnlVNElpSDVhMTg4ZjRTSE5OclF6bytuQXk4TjZiMlRC?=
 =?utf-8?B?VGowRGpCUWFhTjhTOVJSTHBlOVVsZ3ByUUtEWlZZOGNuT09MWHFkUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f112755d-ea3d-4645-e495-08dee2723cbb
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 13:09:00.7759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSiz9dSHhq9BZXzEXu9n6lJ2+oNdsKD3MUkVEXJSnvI6CYpz38A7FrOyim5glpDR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4464
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_060908_671373_058FFC4A 
X-CRM114-Status: GOOD (  23.51  )
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

On 7/15/2026 6:20 PM, Kusuma Vasana wrote:

designate your patch to a tree - [PATCH net] or [PATCH net-next]
https://docs.kernel.org/process/maintainer-netdev.html

also keep all list in cc from get_maintainer.pl.

> The AXI DMA interrupt line is level-sensitive: it asserts whenever
> the IOC (XAXIDMA_IRQ_IOC_MASK) or DELAY (XAXIDMA_IRQ_DELAY_MASK) bits
> in the status register (XAXIDMA_TX_SR_OFFSET / XAXIDMA_RX_SR_OFFSET)
> are set and their corresponding enable bits in the control register
> are active.
> 
> During TX/RX, interrupts are disabled in the control register while
> NAPI runs. Completions arriving in this window cause hardware to latch
> IOC/DELAY into the status register regardless of the control register
> mask state. After NAPI completion, re-enabling interrupts immediately
> re-asserts the IRQ line due to these stale status register bits, even
> when no new work is pending.
> 
> This results in a stale interrupt and redundant NAPI poll cycle with
> no new work pending, causing unnecessary CPU processing.
> 
> In the initial driver, the status register was cleared after polling
> all packets, which naturally consumed any status accumulated during
> processing. When the driver was converted to NAPI, status register
> clearing was moved to the ISR before polling begins, leaving no
> mechanism to clear status bits that arrive during the NAPI poll window.
> Fix the same.

rephrase - fix the same.

Once addressed- feel free to add:

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> 
> Signed-off-by: Kusuma Vasana <kusuma.vasana@amd.com>
> ---
>   drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> index fcf517069d16..29050c8d04e2 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1018,6 +1018,13 @@ static int axienet_tx_poll(struct napi_struct *napi, int budget)
>   			netif_wake_queue(ndev);
>   	}
>   
> +	/* Clear stale IOC/DELAY bits that may have latched during the
> +	 * poll window to prevent a stale interrupt when there is no
> +	 * work pending.
> +	 */
> +	axienet_dma_out32(lp, XAXIDMA_TX_SR_OFFSET,
> +			  XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
> +
>   	if (packets < budget && napi_complete_done(napi, packets)) {
>   		/* Re-enable TX completion interrupts. This should
>   		 * cause an immediate interrupt if any TX packets are
> @@ -1293,6 +1300,13 @@ static int axienet_rx_poll(struct napi_struct *napi, int budget)
>   		cur_p = &lp->rx_bd_v[lp->rx_bd_ci];
>   	}
>   
> +	/* Clear stale IOC/DELAY bits that may have latched during the
> +	 * poll window to prevent a stale interrupt when there is no
> +	 * work pending.
> +	 */
> +	axienet_dma_out32(lp, XAXIDMA_RX_SR_OFFSET,
> +			  XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
> +
>   	u64_stats_update_begin(&lp->rx_stat_sync);
>   	u64_stats_add(&lp->rx_packets, packets);
>   	u64_stats_add(&lp->rx_bytes, size);


