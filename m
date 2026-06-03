Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCD9CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEOOWQCKoQTUHOgTwDfguTIq0f4e7+VzfnrSTgZ6iMk=; b=mlw51d/8vCD6VDnklyU+JfiziK
	Iu6ME3fUBS/xb3rSgkPBsoI9ROSMZZ8u4FDWZ1qKPMuWnYanJ4PZUWzDlvnFnVb6bZwu6VpRbAZf/
	oZsoLSXXKswrKYDs4x8b5PIGn2Hjsl4hwBD5uUCBpP6rOOvXrSpJOrIEI/ZX4P8WuZEwrw2yKVw4/
	OeFMHp9vNoz14+O/ETOMNOkbHpdSEhka0w9y0tAd51xBvRBQjR74L7OerMq8Ka76Qtj4TBudhqBRg
	4NAuP6RyIvi2wB1D1HiFeE/IY6xKJHUl8rRSXjqo3f0TGlI0AJh1edJE6uc3sFmptC1mfdQOpTLEM
	lrku5CNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNJ-0000000FN87-2nDU;
	Wed, 03 Jun 2026 15:19:21 +0000
Received: from mail-westcentralusazon11023125.outbound.protection.outlook.com ([40.93.201.125] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN2-0000000FMmi-3yGl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6Sb6iIY+rc33XWz6l3n//f3ocrEeyJEmlL5VYAWZyVZe54AZrV2xTIoUjpgvg+A71KC3eDy8Ru//rOPgXOE6qoTrxuxvDZaLLchYEhmPAfFHsFlBwleiX2PB6ARH3fKkuYG5fXbZFIf0iNYA3YR843keCVLGQZHxpVyuN4kGFKcrtuHgGUlTHFGECXOoLoPxodnW2gwdbZThuIk7TC3ZsdTuSMM4Eq6ZUnIoRvpsyTMPuCopxa0VhWhAJRsVQFoiLhZK6WWSwuNf8PP54mnMCmH+FF8S3t4saMXjlhn+eTRMG3TTjWVY/4RAcvJWLL2c2l41r8ZDQ7DQxrmw8fP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEOOWQCKoQTUHOgTwDfguTIq0f4e7+VzfnrSTgZ6iMk=;
 b=hm2rqNh/2YmpdoEh3NQvZxxk7XtgpvNCErOHc4GJhjts1qwMQpEHREYBdJ5eT8dzbEPxLNRDyrnq9op9AwA5aXrP1Yj4HXS/jYKvXMQqC80aBWP2geGsMuVlmVEvhMHyxKmWkQkl7udh6j8BPQjjEvaA1nucBrcjpfHR9b5dxcoP2e/REieHviuct8WeBPTE/lRDKi4UTYxQZB27/hG7IzJSxQiPrj/T2hLaaseeUXqBI/ZfnlmFeGUfpeQ+KRn2dwMT/1ns4dJ522/1g4q/ZK/QLbNZmKANxiw0m4XCbbgCQz/0SCC+0Yj5A0E9/4rFif98BUd732uxVtBSPHEbEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEOOWQCKoQTUHOgTwDfguTIq0f4e7+VzfnrSTgZ6iMk=;
 b=Lv0DGNvfCVIfIQti9WEy25a8q4bVM3bVkkr9gHtIbtZTYIJXmQX1wXoscollQayQb2lnBJqeH3YO5w17+qo2R6FNWfkrRuRjapvqMwRV0quw9ExwT1AgOYAVw2pxZHUMU3fBGZh7evYY9WMMJgwESX10a/JS/QrFRFEIHPG90Cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BN3PR01MB9212.prod.exchangelabs.com (2603:10b6:408:2cb::8) by
 BL1PR01MB9477.prod.exchangelabs.com (2603:10b6:208:5d8::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Wed, 3 Jun 2026 15:18:58 +0000
Received: from BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9]) by BN3PR01MB9212.prod.exchangelabs.com
 ([fe80::44f3:1050:dce8:1ea9%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 15:18:58 +0000
Message-ID: <e4c85028-2273-48fd-bfb9-40b3696475c7@amperemail.onmicrosoft.com>
Date: Wed, 3 Jun 2026 11:18:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v02] mailbox/pcc.c shmem map/unmap in callbacks
To: linux-arm-kernel@lists.infradead.org
References: <20260522205220.237355-1-admiyo@os.amperecomputing.com>
Content-Language: en-US
From: Adam Young <admiyo@amperemail.onmicrosoft.com>
In-Reply-To: <20260522205220.237355-1-admiyo@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0315.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::20) To BN3PR01MB9212.prod.exchangelabs.com
 (2603:10b6:408:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PR01MB9212:EE_|BL1PR01MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: fde62278-2cc9-4dfd-a91c-08dec1836f31
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|55112099003|6133799003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Eilasa587hw6qfSfOyLTiYV714uSolUZ+wxLjEfMEWqVcVNNiSpcJTl8cs0WbmYKmk2+5tkuvLVC6dylnAsUIQcxqeheoXjoza0LU/Lwavkhtb9shC9DHShQqNV4sWRvdmBrU0ICMwzbnoli+4L9+puEyVGqA4zUioWjvwkzvYUTO9AH+LYFbqY+TYC0mI3Se8Wa0YsteNwlguQGFoCdTO0LUOdzurH/rR5oErciL3MMHr+4ryNgrvqHOdFKyJ28qjjfVXTe3Y0PFUpfhQFmHGkS76oZM1hlKgODG5AAKoxyMEylVM2+OBbf++nLtM5gDXv+qfRtyI6sgdzXrj4fixr6k8GC2Me+EUotYBmy1WKZxCEyYQ3agk3xEIKX4i03BDfVTAgDpGMRqiHtl9RRJv81ULmdYrmKQbocWf0GDQd7a7N8SZaji/uU7QvIZD2x6X3E2eds12LNVCwDvM5zwegoknBUlCztWnIF0JHf7kAkdT2bm/tEJewyDL168KgvVQIezL9oiqrAevOuSCJ0eS4THRibkckJrUzRTIxDljoByNhSB4Z62QqKJ4YuKKIhbIxwyvcuJ4+WlpGMDRDVxn93PAlp7DuR8LtZoJdYegjr9VZ34VHjl/AVOZiZC/IGrsWlxRnfb2CynUAASWyR1vK8TNyKVil1lDqvmU7fgPOJBBMoFZkq9GnX/IfQzc7kv4WUYJ5IE0KAsNu6Cc9cgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR01MB9212.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(55112099003)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmRMdjNpUW83QWhKUWhzTWo1OW11QnNLSzh3WC82dEtpZ25SWmc3RUZtQ013?=
 =?utf-8?B?RFFkTlMxeEoza1duNXdKQUxDU1NUdE4xUXZnbmhDUjk2U0czTnlXeXZELzJp?=
 =?utf-8?B?LzJ3dWcyNVUwditVL0twSVhUeDlCc2k0ckp2eWRCWTh6Ry9ra3BJVVZiTUFs?=
 =?utf-8?B?YzNOUUpGNHlBdTRkeHQ1WnlhbUFXZXRROVlKOXIrT1NGV0k2OWlrL2t0U2p2?=
 =?utf-8?B?WVFkSFp0QkFaaE8xb3JBVGpPaEwrT1VtVWhHd21Kc1ViYWdGWHcyVkRGTXUx?=
 =?utf-8?B?aE9qVkRtVmVPT0pIN1VjNk9LMXlSNWE3TGNLQWMxSDhwdXAwTmNvR0laTHlG?=
 =?utf-8?B?SlF2RFU3NEZVMmVuVThlbXhaQ0FUR045YklvS0Q5NFEya1lZejBlNEs2TWdx?=
 =?utf-8?B?cVB5YWo2NWVZeG9Qbjk1SEtCb1VFOUlYYkRISm1qRXZuM3dBemdndXFNUGYy?=
 =?utf-8?B?WXN0OEJLZ0tVYXRzOStQcTN2SEhOYXRnZzBFN3Yzbk9IaVNFZkk2NDBIOUx6?=
 =?utf-8?B?aXB3NktPRFhLa3ZhQTlXL1NjVVh4SVVCbjAyck1YSUZHcjNuVGdUT3VTWUxK?=
 =?utf-8?B?d01oUGo4eC9iUTRzNTByMnNkbUxFMHJjeHhNQjd0Z2FFcTRDWE5BRVhsN09E?=
 =?utf-8?B?NHNEQ0V2dURCVG90N3JEVkVSQUt3M3VqYW9xcEx2VVBaY3JvWWd5WWRhWDl6?=
 =?utf-8?B?SkwrM016elhtcjRYNGphOExQdU9Ca2t2QnBNdFhQMmk3RjJCYWdqVGdWOXlD?=
 =?utf-8?B?WlgyY2xnemIxWHhzQndCbVlramFTdDJNYVF3MjNxV00xOFh4V0o3UjJJeVli?=
 =?utf-8?B?NHNoUXRJS08rcy94bUI3Y2I0YzlCKzVQeGhwNFVRTUtDdnZ3YlZZSW5pT1A2?=
 =?utf-8?B?YWFBZ3RDRXRQK2VyVW8wblFuN2JLYVMxTkxxbUozRHRTRzJaeXRXWldZRzZx?=
 =?utf-8?B?dHFQTEVWRHlHQUZjZEFkdWs1UDhsQms0bDdiUlJ5b1o5Q0Z6c1BITUUvWDRM?=
 =?utf-8?B?dVNtWXRXYllnWG96NzIwQXNVWXEvdVRCV2hSR0Zvcm5aSlNwOCs1d2NkMitG?=
 =?utf-8?B?ZTBCSTdOWTJHUHRXQ0MzRWVhT2JSMUFnWERyUGY5c1NYS2xmZ1cwVDVGRUFt?=
 =?utf-8?B?SSs0NzhEenBnKzFOTGpmd2EyZzBieFhZZ2t4L002bXM4T0hXRDQyc2dGdzdI?=
 =?utf-8?B?dllkazJMdFNCbWJWVWROZ3l3U0JpZ0pRSVg5blI2emVmWFhmdXViVTRZczNU?=
 =?utf-8?B?UlhOOXpwT3hRdUlSRWhIcUJOYWd3Q0tYYlNWeXBkU2M4aURBSHQ0QkcyVkZW?=
 =?utf-8?B?bk5wRDBTVkNhazRPSWZURFFlelJlS2E5a2gzVVFKYjc2cHNGQThRa3NOWnhL?=
 =?utf-8?B?Y3BkV3FiZWg3TFV4MDdoR1FseVJqbldSTFVqSURJMHYrOU9saWNhQkZTRURU?=
 =?utf-8?B?MFNsTWVPUGVtWWgyZ2k2NStJeS9xSVNxc3E0UndNZm5MSEJhQTVMa2huNno2?=
 =?utf-8?B?UzExVEY1V21RbXl1WEoxdmtUTGoyUFErbGZVTHpDdzkxd0xKek1Ndk9WZXRw?=
 =?utf-8?B?Ym1BWGltLy9NYk8yWUlCS1NkS1NQU2R4Wlh6cTkzd3NiUHlGOVVwa0JnRHgv?=
 =?utf-8?B?YjNOMWpTY2xJTDhmcXZ0cDVKaHkzYnQ3Yk9ZLzZtdlhVVHA5NjhMLzY4QXpB?=
 =?utf-8?B?cS9ZbFF0MUNzNEFra0c0dVd4Z1dGdTV1eW5lMlFpRW1IMERiNkhvWkdjb1NG?=
 =?utf-8?B?V1J5VHprN0IzT0s2bTVZdG5RRTBnZVg1UXNnNzBuUkpRUCt4SzQzSHZ4WlZt?=
 =?utf-8?B?cHdqTmZaZmNDZjVSd3RkYTlxOWR5OXpDa09WRVNleS96T2xaNmExVmJLMWF5?=
 =?utf-8?B?RkRpVHlaaDFyYkdEWThFallhUVN1S0JqTm5EM3doYlJKVUJpN1JkVTFGbnpI?=
 =?utf-8?B?ZERZcXB6ZDJ5Nzk3RUI0TFJGMGhXN2wxU1p6MUV6eFJ3eUQvWlB4OEZaR1NV?=
 =?utf-8?B?R21DZ3M4RU9iQVR1RUdCRkM0ZEJhNFJVS3hLQ0RqcXp1NHFGTzZYWDdlVEhQ?=
 =?utf-8?B?MVJVSWJTbUdsNDFabmI5RDJ5Wllqa2dnOFVKZHdEc3RkUHc3L0hrNkdrTjRz?=
 =?utf-8?B?bEUyOW8vZklqVmNXcGp5QkVZa3Y4RUQySmtEZ3hiVHpNc296SFptQmZiM3JZ?=
 =?utf-8?B?OXgyUWZXTUw4Yzl6bHJNVUNSeHlJTGZuVTk4YUJ4REQybUFvYXJ6TTRYVTQ1?=
 =?utf-8?B?M3EwN2tyNGdCMG96bEE0anlldjlsMmRwbUNwRW1VV0pkeWd1d2hrU1hOVWV4?=
 =?utf-8?B?Vng2RUtFV2pRaDEvOE5rN20yRU9UZXFjMWlQR2t0ckdDb1BONlI1elhpN1V0?=
 =?utf-8?Q?cSziUBkm9fCY/neCii4KpT5c53kFFwf64zmYnxWcZGVVj?=
X-MS-Exchange-AntiSpam-MessageData-1: gTPserbF07gadCLquYw0lrwfedqzBoLVHQdUWTJBRFkZKyOKUaBxAbrF
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde62278-2cc9-4dfd-a91c-08dec1836f31
X-MS-Exchange-CrossTenant-AuthSource: BN3PR01MB9212.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:18:58.5838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgOO93g1OA9AgakCYmr7O7k3Olqji9h+iOfQHS/jti67JVSGzzo7FoaxjuTn4YAKSW2CtkmF2FhH3CFVJCw9eFOdGFfRSV/gunvXerFnxxQUdGTik8L/W+AyKxMruRtA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR01MB9477
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_081905_011473_8764CE7F 
X-CRM114-Status: GOOD (  28.07  )
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

Note that this patch is now a pre-req for the MCTP over PCC driver 
getting accepted.  I was trying to keep the two patches separate, but 
this fixes a race condition in that, and any other Type4 based response 
mechanism.


On 5/22/26 16:52, Adam Young wrote:
> The mailbox IRQ and shmems are not cleaned up atomically, so there is a
> race condition. If the shmem is torn down while the IRQ is active, a late
> interrupt can trigger a write to un-mapped memory.
> If the shmem is torn down while the IRQ is active, and another thread
> requests the channel again, we can end up with a channel that has had
> its shmem unmapped.
>
> By moving the map to start up and the unmap to teardown, we can let
> the mailbox mechanism prevent re-entrance into the startup/teardown
> functions.
>
> Avoid doubly unmapping the region by removing the unmap in the
> direct error handler for the request.
>
> Assisted-by: Codex:gpt-5.4
> Fixes: fa362ffafa51 ("mailbox: pcc: Always map the shared memory communication address")
> Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>
>
> ---
> Previous Version:  https://lore.kernel.org/linux-hwmon/20260515161001.699470-1-admiyo@os.amperecomputing.com/
>
> Changes in this Version:
>
> - Move the initial mapping into the startup callback
> - No Double unmap on error during setup
> ---
>   drivers/mailbox/pcc.c | 42 ++++++++++++++++++------------------------
>   1 file changed, 18 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 636879ae1db7..c5873f9f2b91 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
> @@ -360,7 +360,6 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>   struct pcc_mbox_chan *
>   pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id)
>   {
> -	struct pcc_mbox_chan *pcc_mchan;
>   	struct pcc_chan_info *pchan;
>   	struct mbox_chan *chan;
>   	int rc;
> @@ -375,20 +374,10 @@ pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id)
>   		return ERR_PTR(-EBUSY);
>   	}
>   
> -	pcc_mchan = &pchan->chan;
> -	pcc_mchan->shmem = acpi_os_ioremap(pcc_mchan->shmem_base_addr,
> -					   pcc_mchan->shmem_size);
> -	if (!pcc_mchan->shmem)
> -		return ERR_PTR(-ENXIO);
> -
>   	rc = mbox_bind_client(chan, cl);
> -	if (rc) {
> -		iounmap(pcc_mchan->shmem);
> -		pcc_mchan->shmem = NULL;
> +	if (rc)
>   		return ERR_PTR(rc);
> -	}
> -
> -	return pcc_mchan;
> +	return  &pchan->chan;
>   }
>   EXPORT_SYMBOL_GPL(pcc_mbox_request_channel);
>   
> @@ -401,18 +390,8 @@ EXPORT_SYMBOL_GPL(pcc_mbox_request_channel);
>   void pcc_mbox_free_channel(struct pcc_mbox_chan *pchan)
>   {
>   	struct mbox_chan *chan = pchan->mchan;
> -	struct pcc_chan_info *pchan_info;
> -	struct pcc_mbox_chan *pcc_mbox_chan;
> -
>   	if (!chan || !chan->cl)
>   		return;
> -	pchan_info = chan->con_priv;
> -	pcc_mbox_chan = &pchan_info->chan;
> -	if (pcc_mbox_chan->shmem) {
> -		iounmap(pcc_mbox_chan->shmem);
> -		pcc_mbox_chan->shmem = NULL;
> -	}
> -
>   	mbox_free_channel(chan);
>   }
>   EXPORT_SYMBOL_GPL(pcc_mbox_free_channel);
> @@ -462,9 +441,15 @@ static bool pcc_last_tx_done(struct mbox_chan *chan)
>   static int pcc_startup(struct mbox_chan *chan)
>   {
>   	struct pcc_chan_info *pchan = chan->con_priv;
> +	struct pcc_mbox_chan *pcc_mchan;
>   	unsigned long irqflags;
>   	int rc;
>   
> +	pcc_mchan = &pchan->chan;
> +	pcc_mchan->shmem = acpi_os_ioremap(pcc_mchan->shmem_base_addr,
> +					   pcc_mchan->shmem_size);
> +	if (pcc_mchan->shmem  == NULL)
> +		return -ENOMEM;
>   	/*
>   	 * Clear and acknowledge any pending interrupts on responder channel
>   	 * before enabling the interrupt
> @@ -479,6 +464,8 @@ static int pcc_startup(struct mbox_chan *chan)
>   		if (unlikely(rc)) {
>   			dev_err(chan->mbox->dev, "failed to register PCC interrupt %d\n",
>   				pchan->plat_irq);
> +			iounmap(pcc_mchan->shmem);
> +			pcc_mchan->shmem = NULL;
>   			return rc;
>   		}
>   	}
> @@ -488,15 +475,22 @@ static int pcc_startup(struct mbox_chan *chan)
>   
>   /**
>    * pcc_shutdown - Called from Mailbox Controller code. Used here
> - *		to free the interrupt.
> + *		to free the interrupt and unmap the shared memory.
>    * @chan: Pointer to Mailbox channel to shutdown.
>    */
>   static void pcc_shutdown(struct mbox_chan *chan)
>   {
>   	struct pcc_chan_info *pchan = chan->con_priv;
> +	struct pcc_mbox_chan *pcc_mbox_chan;
>   
>   	if (pchan->plat_irq > 0)
>   		devm_free_irq(chan->mbox->dev, pchan->plat_irq, chan);
> +
> +	pcc_mbox_chan = &pchan->chan;
> +	if (pcc_mbox_chan->shmem) {
> +		iounmap(pcc_mbox_chan->shmem);
> +		pcc_mbox_chan->shmem = NULL;
> +	}
>   }
>   
>   static const struct mbox_chan_ops pcc_chan_ops = {

