Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE074CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysr80nku/yfby49ZyHpMXbea27vDPm38hsSIWs09kzs=; b=HarlbOh2IIVijDImHdhMeBENjq
	0tHeMyCueG7JWIQ4goI1P3pgqTyRWtC5yF3k2l3AvT5KZ/QzooM1MZ2cJseKMj742yEJNH61ZfFdB
	Y/zB4CAd2yaO0hPa2IeIjgfTbZG+A2BRQifsFSCn0MfQgEuPZxQ3MVyHL9rO2NG3MD8BHtCa/j4SV
	XuNycngTaQU5HcU/F2DBVDH4jix7Nz7V0K290gzPzPP+izLdv8qXM6agVSlhH/hlRrpRy30ApJPo4
	wpLnrS0cfFrbjIro9sTilBNOtBsK6icC6dnDrdmefTSBojWwgg1k3yD91Rg+f+DlxjL6ClytAiIx8
	gxSajJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVt9-0000000DlJ9-1uCQ;
	Tue, 02 Jun 2026 20:39:03 +0000
Received: from mail-westusazon11022090.outbound.protection.outlook.com ([52.101.43.90] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVt6-0000000DlIH-1cBl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 20:39:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZR+Gmrm777i4tjQZVyvLrDgg8m3bVrRV2250tTqvlH4f8N6Yoj+T9veIvY4ibltKPfibQM9N35nnrRheU2XCUmEJBI22sWl+rbvfDcH9my+CPee4hwhfIJ8NpgYx+WpBh6Nnnf4xL4xhe8r+Hekk35DDLS5KYud9sSit7OA0F7MeimNnTEOpk3b9tujWNzh5jzMpAA8cPyYNpLlM+2b19gjpYvn9TDKueiAyl3RrLniOBY8L/8WNGdNppVHtSoLNvWNvSmbo5OiNV3FmPkl4GdfXEGTnZMaCIL/StB64JfgIlMlT8qr+d1d+SMgbL3bcftSmTK8QF3MHLYeQNbE1rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysr80nku/yfby49ZyHpMXbea27vDPm38hsSIWs09kzs=;
 b=AH+Aw9m4y/Cms/l37SRctGfTwWHZwUNJ8pdBhnXi9DGGcwIh0EjsYLiijkWcea5grWaEAVF//W7UkJSOSNulIUOESqCiUU0MDMs0LgK+unnebWw8+WSS33qm/qZf5qqPf1hWsCQ13P3Tx20FOPPZ/Tl86Zfwwz3XiA55dWqevduVQezdDs9yGHZOxmFhe0SeMuTUAA9iWyMRWMcmFwWioM4sF0AjxmwkoNpSmpXiuYhjIxRvmEjURBVLhJtVMGUAqEtFsDk/jazLCwsa7UCNBovWhVvCmQ087kWstDBbO/7hrz41uOVibNDlMrL+LAFsQVZ7xc8grEuiKWkSxZhlWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysr80nku/yfby49ZyHpMXbea27vDPm38hsSIWs09kzs=;
 b=dXkL6wFwWt4hUzakG4bDiyRVZt6xjU5QDw6iPcCziaYCj9DM//qudelnfN/3txh0zTU1FCOE9toDgstMzRdGaEKx0PBEogXcoAJzlHRg8MZogxxn/3ffKgIHjagszTxefTTUP87PGpkSsmyjNTY+8QuyxhFd58YiZuQa13HCJG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BN3PR01MB9233.prod.exchangelabs.com (2603:10b6:408:2ca::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Tue, 2 Jun 2026 20:38:51 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0071.011; Tue, 2 Jun 2026
 20:38:51 +0000
Message-ID: <1252b93e-0c6b-4e33-9bf9-e42cde5ba0d2@os.amperecomputing.com>
Date: Tue, 2 Jun 2026 13:38:48 -0700
User-Agent: Mozilla Thunderbird
From: Yang Shi <yang@os.amperecomputing.com>
Subject: Re: [v7 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260519163657.1259416-1-yang@os.amperecomputing.com>
 <ah7uCj2V11MnAlaR@willie-the-truck>
Content-Language: en-US
In-Reply-To: <ah7uCj2V11MnAlaR@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:a03:331::30) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BN3PR01MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: eee6069c-b5a1-4942-0420-08dec0e6f4ad
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099006|5023799004|4143699003|11063799006|18002099003|22082099003|6133799003|55112099003;
X-Microsoft-Antispam-Message-Info: Yhl5gVIQt9cD6aMMOekigusGIX1xcGIfarWKrryYENxkJQ0iJe6W/gPpD/bhKGaYsdKBySCyjpdZFsFYQMYPViKgmTk7z1sF9V9euO86RQMBatU3Z3ruhX5z7knVVlJN4TApa3540b0+EUgayW9S1s8eizEbirw02+A4MoYn338dRdLvqHNFdhAAP3BSc44YHe8ZCbeWOzBCXrgKz6Qap2rlYhV7mEI3WpamhriyXi1ogker+1AQoV0O73KGGqzY2/kwWlQyGZeUWk3qE/xDs39pAhQ/mnB/oyf+Who5lHNQ8lmN7yAP0KI8hGrW7U5w7q7YDnVdjZOjOS/7Mf+LXlQ7ViBbj7xgmBdSjbIARWNLLmMx/ddLfzR1qkJzsTe05rBvJbn+NNyO+8YV3IW0ZOtdwgNjuB+Azpjou+l2fogFQxRFSPnTNt8zTm9atsFhmLDaVy0EBhLmEC9O0kNX6wBe9LY9bRJw3tE9ClbJl/HreXofF7eYo1Dx9kcZ70+WkLrZStjChYTl6T7jF8hmay9Va9Mz3pfyvFRJKJ2g9nEWIEwvodzLqpGTLyVA+DjkogvuyXOwtLJK4SpmyXBxX2jk32+9HCqNgOgy+u5bqX14PoxaVlYtj13+9B4nYSut1WCvn+PdOGJ7rHA4Tb7WcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(5023799004)(4143699003)(11063799006)(18002099003)(22082099003)(6133799003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ni8rdDRMcHdWVE0wVzVBNmVISjJRSTlSY2lEN3dJT0l5OEcyeDRHbUhWQ2g3?=
 =?utf-8?B?RnNmZjBjS2VMSkVNZ2FwWmZvcW93dTdnL2kxYmlmK0psRC94MDBoUk5hczE4?=
 =?utf-8?B?ODlOUlZ1L1AwamFvYXc0K0lpOHhvT1I3L0pTR2pobW04ZWN5Y3lDaWxsSEk3?=
 =?utf-8?B?Rnc1ZGUrSlcreEllY1JtQzY0SDYxaGozZkN2MGtTUW53Q3lDSXR1WFQvcFdC?=
 =?utf-8?B?LzFTOEJieHFtWW1xU0pIMHpmRTJnWlN0SmpSbVR2UXp3R0o1SFQ3S0cxRWNV?=
 =?utf-8?B?Wko4ckVpZG9uQnR0RGtVZm82UllRRmgzQmZjUTB2c2JuME1ub2dHclRVMlNO?=
 =?utf-8?B?cnJ5RFQyYVFoRU1QYkVCMG9BOCtETS9LNkx6L2V2TlIramo2UXFCWjNLbTRv?=
 =?utf-8?B?ZWJ3REtXKzQ4S3MreG9YeXJTTTNMb0JBTlg4WE9MR3ZSbFlpa1FrZi96WEFP?=
 =?utf-8?B?WTRPZlZBRDQvamJMUWYraVFyb1BzTU1HZzM5ek9SUmovWE1leXRPVmt2Y2pG?=
 =?utf-8?B?REI5MGVQODI2b0FlVUJuSUFMTDZQU3hISXp2VHJUNk9FT3Q2TUhTSW9JVHlN?=
 =?utf-8?B?L1dBaldRcDI0ZEh6Rk91QUVYWmY2S0swUC9BbGFraTc1VndubEtyZWc5S1Fp?=
 =?utf-8?B?VXNOOVBVd1ppQ2Q5aExHbHNBT2pDT2RSTXRwZTh4ejJoYWFCT1IveUdZMHgw?=
 =?utf-8?B?RE94d3JzM1NyZjMvUDNLV1lzRkdlTllqcGlMeWRSK0kwYWRBRkdXbnZ5NmNw?=
 =?utf-8?B?YXowakVoQktPcXoxMjZkaVBXb3ZUT1RDQ1I5QkNHWXdSSSsxSTFZYkwxMElK?=
 =?utf-8?B?bXZXS0s0WjFXZUdub2RldXBPQ2s5TTA5WWxaVm1oSHlOM0F3aEdQTlorclFH?=
 =?utf-8?B?clJ4dVBjZVBZT0RQeHlPandYS2JGUGJXZTVEMGs3RmNBU2hvUFRxL3ZJcG9L?=
 =?utf-8?B?bzY2cXFUWE1lOWxIQTNPRWJCQmZkWC9uTnpMQWk4dGxMUTZsQWlSMjBESHMz?=
 =?utf-8?B?ZXZRU3Fjd0VkaDIwY3lwdW1laXdkRWpSQmNxMzQyKzRiRmQrbGk5VDdMZGFU?=
 =?utf-8?B?NitCVkdJMkJCbk9mL3F6eUgvNnpkYWJqZW5IbGZnM3NTV0RWZDR4Tk9LREM4?=
 =?utf-8?B?cC9yRHgxd0dGekZLZEY0dE95ZmQwRE9qblFlam92MHhPQVhFZllpeStqazYr?=
 =?utf-8?B?dUVsd3J2dUwvUXBZcFpyN0xOMVQzaWlheDIvQ0RWWHNrUGZUVEtUQVkra3Fv?=
 =?utf-8?B?SCsyUHcvQ1VuekRoUkJTVGpQMUowNHFjZkNyeEYrb1dqL3JMWEd5OXVWSjhu?=
 =?utf-8?B?UkJZMlFpaTNsV3FjckNmdTJjdXhrSHhhRGovRzNBMmNzMitsMjVJYXVsQ2pW?=
 =?utf-8?B?ZmFCVDhYblpWc1JxRDM1a01DeU5kVThja0M5dXRma0psMnFVOEZhZHVXUWlv?=
 =?utf-8?B?R013bzZYL1JUY3lWbUUwWnh1R2JOc1pGelJNNzZEL2lYSGlnMUV5Yk8yejBU?=
 =?utf-8?B?VWhHOThrVGNvYm5lUGtKYXlIY0cxcWhURkhSZ3NzSkZKMUtseFlMUHd4anFU?=
 =?utf-8?B?anRJdDF5VjAvZ013SG5QYmZmUDM2SnROMVhwSS9WbHlvczVHVUtEdVNwQ2lO?=
 =?utf-8?B?S2F6aXlLQStmRklveWtNNXY0dGVvRG9na3BrNU1EaUxkQ1F1dUxCdzdqczYz?=
 =?utf-8?B?VzQySEVzV0dNcldZU1IvT0hhUkpYYXlOMmx0bzNZN1N6L0tOck51a0F4QTR5?=
 =?utf-8?B?TG9aSkU2K1lOdUhoWTY1TEVNWEJQWk0xbFNYUUMzTGQrZitpd0ZGTDFVMFRt?=
 =?utf-8?B?SDhoVUtWVWgzc1pDeWVQNlNCYmd0MmhSbk1HblRXWDhwNDJaUHhwdGhaaUR6?=
 =?utf-8?B?S0J5Zy9QM3prNWliRFBPemlWSUVMVnFBd1dEYlEvcmdNS0JxZmFUd0UvN2w3?=
 =?utf-8?B?TXBhWHU0Rm1PM25rOW93K3hwT1JhS3VFdFAyM1dteWZvU2tSMHE3dGJCRG5M?=
 =?utf-8?B?UmxrWGlRbHgreGdqT2xtdlNJN3FsOXJZL3B5cmJBdWkrZU1icitIV1doUUVr?=
 =?utf-8?B?U1RBdGNIT0N0SUkrbENuM3RYYTRNZTZUdUpyajlGOUZCbko5TTI0K3pVN04y?=
 =?utf-8?B?V0UxNGkvdWQwNi9IcTBWb3VnbUx1OFEwNitOUXJUbXhrc3FaMU5YNUVtUDdQ?=
 =?utf-8?B?eXdLamRybEFQK3FWMHF1anY0V2dWK2ZyS1g3ZlUxQkVMNVppN09yeGdoN3Vi?=
 =?utf-8?B?cmpjOUx1cFkyeDZMWFNnVlcyQk9BRXhOMWdSWHVTODBBTWloRlpPbnR5Zmdx?=
 =?utf-8?B?OFJ6bGxoQXFlRWducVFCeWpsOGxYa2tEZlhHbTdjQVQ3VTdhQ2Y1a0t6QWxp?=
 =?utf-8?Q?x1SsLT2TugrYUfDg=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee6069c-b5a1-4942-0420-08dec0e6f4ad
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 20:38:51.4321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ofkb+CDiW21gfOHMR24P82vTgtQCvms9C0CIMXpjKuwXpf/kjZsRePbBxZZgMP03D67BJVkSRQi91AB/VP2qJvpFc4vxF1JnZxpfXsY+bQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR01MB9233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_133900_445688_4955BAAE 
X-CRM114-Status: GOOD (  36.87  )
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



On 6/2/26 7:51 AM, Will Deacon wrote:
> On Tue, May 19, 2026 at 09:36:57AM -0700, Yang Shi wrote:
>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>> rodata=full"), the direct mapping may be split on some machines instead
>> keeping static since boot. It makes more sense to show the direct mapping
>> use in /proc/meminfo than before.
>> This patch will make /proc/meminfo show the direct mapping use like the
>> below (4K base page size):
>> DirectMap4K:       94792 kB
>> DirectMap64K:     134208 kB
>> DirectMap2M:     1173504 kB
>> DirectMap32M:    5636096 kB
>> DirectMap1G:    529530880 kB
>>
>> Although just the machines which support BBML2_NOABORT can split the
>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>> that the users have consistent view in order to avoid confusion.
>>
>> Although ptdump also can tell the direct map use, but it needs to dump
>> the whole kernel page table. It is costly and overkilling. It is also
>> in debugfs which may not be enabled by all distros. So showing direct
>> map use in /proc/meminfo seems more convenient and has less overhead.
>>
>> Signed-off-by: Yang Shi<yang@os.amperecomputing.com>
>> ---
>>   arch/arm64/mm/mmu.c | 192 +++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 171 insertions(+), 21 deletions(-)
>>
>> v7: * Rebased to v7.1-rc4
>>      * Changed "dm" to "lm" to follow ARM convention per Will
>>      * Used __is_lm_alias() instead of reinventing a new helper per Will
> Thanks, but Sashiko has pointed out a few nasty issues:
>
> https://sashiko.dev/#/patchset/20260519163657.1259416-1-yang@os.amperecomputing.com
>
> In particular, the potential for races updating the shared counters and
> double-accounting of entries due to permission changes look like
> interesting things to check.

Hi Will,

Thanks for reminding for Sashiko review. Please see the below response.

#1
> When features like memfd_secret remove pages from the direct map by 
> calling
> set_direct_map_invalid_noflush(), it clears the PTE_VALID bit via the 
> pageattr
> infrastructure.
> Since this patch doesn't hook into those callbacks or set_pte() to invoke
> lm_meminfo_sub(), could the unmapped memory continue to be accounted for,
> leading to a persistent mismatch between the actual direct map size 
> and the
> reported statistics?

The direct mapping counters in /proc/meminfo don't treat invalid direct 
mapping differently if I read the x86 code correctly, as long as the 
range is still mapped by page table regardless whether it is valid or 
not. The counters are just updated when the mapping is created, removed 
(for example, boot stage or hot plug/unplug), split and collapsed. It 
seems like transient invalid direct mapping is not considered as 
"removed". And it seems not bother anyone.

I think we should follow the semantics and keep the consistency. We can 
definitely make changes in the future if it turns out to be a real problem.


#2
> Could concurrent calls to functions like split_pmd() (e.g., via
> set_memory_ro() or set_memory_rw() during BPF JIT allocations or module
> loading) cause data races and lost updates here?
> These updates use non-atomic read-modify-write operations, and
> apply_to_page_range() only locks individual page tables rather than 
> using a
> global lock.

Sounds like a false positive. The direct mapping page table split is 
serialized by pgtable_split_lock.


#3
> Does this code, as well as similar sections in init_pmd() and
> alloc_init_pud(), double-count memory regions when updating permissions
> of existing direct mappings?
> When functions like update_mapping_prot() change the permissions of 
> existing
> valid direct map entries, this will unconditionally add the size again 
> without
> checking if the entry was already present (e.g., checking pte_none() 
> first)
> or subtracting the old size.

Yes, it may double count when updating permission because updating 
permission reuses the same functions. It sounds not hard to address. We 
can check whether PUD/PMD/PTE is none. If it is none it means kernel is 
creating new page table, then we count it. If it not none, we skip 
accounting.


#4
> If a portion of a contiguous block is hot-removed, could this multiple
> subtraction underflow the counter?
> On ARM64, the memory hotplug block size can be smaller than a 
> contiguous block
> size (e.g., CONT_PMD_SIZE is 16GB with 64K base pages). If a partial 
> chunk is
> removed, this subtracts the full CONT_PMD_SIZE. However, it leaves the
> PTE_CONT bit intact on the remaining valid PMDs.
> A subsequent removal in the same contiguous block would see the PTE_CONT
> bit again and subtract the full CONT_PMD_SIZE a second time, 
> underflowing the
> counter.

It sounds like a false positive to me. This case should not happen at 
all. We just can't unplug a portion of DIMM, right?

For example, we plug a 16G dimm to the machine. We can offline a portion 
of it (at section granularity), but we can't unplug a portion of it, we 
just can unplug the whole dimm. The counters update happens when unplug.

Thanks,
Yang

> Will


