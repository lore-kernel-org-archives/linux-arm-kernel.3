Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE0FC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzdqlDYQ77LCqxiGlqbegRreQEygnYu3Zi8t9OoOSDk=; b=GeGNylSOW9IZaoICBzZjtZLnv6
	yd0m8mwUgnwXNQFKaXPh32aOy7F5KkcAchYCnwIRh280c3MmTuvPolPY9dSzuHvg50mBgTVgtymQJ
	+5p6FYGxhB3fFJDDXeEUXqB8qFF8a1ckRXb0IGTdbnoXTcIEVRpA2dfOPzjyGcpjPWPReMLjUwbJv
	nOBHbOiuXkW9yTOd2Hx8B34SeX4g/JMPrI1Qli7ETYenfZkwNbzMfE5vgfspGGtzR7GCjQMJYC8EK
	oFfy3f6VMVtsSS04AWg+D8IAG1qV9tYV1LigfpsGCvEyHqtrd4qQQJbsPjWCIjKVrY91QlqV1c7Lx
	t04UPZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQwK-0000000GJER-2Rwc;
	Mon, 24 Aug 2026 09:26:00 +0000
Received: from mail-eastusazon11012003.outbound.protection.outlook.com ([52.101.53.3] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQwC-0000000GJDI-3Z4w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 09:25:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LW7uxDweQ0gYiVPbVMfuZcmiHuiflv7nGJ0M9adOttc01lz3KwIiX7kLEgiuDg6vG7OVIVV3+9bhNMyDanqHPTEHVRH/MY6fsRaU0RYP8iKxT+GdkSj54lZhDPA3D1BZCLT8GA3jZc9OPK00TRgUYX1cKF+fk2DIGkd8CFEr0C3Pys8gGHzXigeSrusuiMeAu+JLQsV3pyLcYbnvSCFNwr+gudO1s3DfT/fIbkx3b0oSnji5gpxuWEvBQoFFuhEs2++KY0q79rEtcc3VAlzT3YIFDb9jHB8NQHR0WVi1XJUmdQ0YMB5wyafyRg0YrXBLpWwZULAM0ydc06PJaTHYYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzdqlDYQ77LCqxiGlqbegRreQEygnYu3Zi8t9OoOSDk=;
 b=QNPFxHpGi4rBhr1ksF+j58Isn8jKj8bHGDKNXMA+x2NzzhmnjwoODUd67ChyX8FWr3Ks7eem4DLQcjWlbt90bq6b2wEIm2o67riy9dyZb/+xlW1M0Xj1nWyxKkQYOMbeWJI4sjYQBkpiQQBfkfvfk5e9S06VVS/5QiuHva3mc+NR4zuP0eiFIII/tK4u34oQI4MLwmHp7S/jv0S2baQs9uvI3cNfeA+QIpz7s3Uv4gmTnvUgh1ubPezT4h3KplVlI/nl+xcZV+t75GlA5EyS6B5sblcvR2O3VPRu2cQ9yUG28RdPVfuoEgPe0gF++I9mDM7yqmb6ftoid45mtiOOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzdqlDYQ77LCqxiGlqbegRreQEygnYu3Zi8t9OoOSDk=;
 b=u7cbteXjqfokYYZOlAnCnAAm8Ut5xrOIp9aOkXy4MvXv0AhUdIKzOnxR/PmTRT0/edAUv0LSdXkCJ0GZ4HHgEmOd4YLHm3JhsIFn0vACXckwonQtqOBaKjn9SrJp+T+gLhv46AWBo7OyLFFBjsa9Os2iQfgtEMEDZvq4qQxvb+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB9475.namprd12.prod.outlook.com (2603:10b6:8:251::6) by
 PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.12; Mon, 24 Aug 2026 09:25:43 +0000
Received: from DS7PR12MB9475.namprd12.prod.outlook.com
 ([fe80::4371:c924:8800:2587]) by DS7PR12MB9475.namprd12.prod.outlook.com
 ([fe80::4371:c924:8800:2587%6]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 09:25:43 +0000
Message-ID: <41587817-c7dd-4fb2-aad7-772f85dedd6d@amd.com>
Date: Mon, 24 Aug 2026 14:55:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] irqchip: Add Xilinx Versal NET SMMU CSR interrupt
 controller driver
To: Thomas Gleixner <tglx@linutronix.de>,
 Tushar Nimkar <tushar.nimkar@amd.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Michal Simek <michal.simek@amd.com>,
 "Sarangi, Anirudha" <anirudha.sarangi@amd.com>, git@amd.com
References: <20260817105251.1557770-1-tushar.nimkar@amd.com>
 <87ik55kirt.ffs@fw13>
Content-Language: en-US
From: Tushar Nimkar <tunimkar@amd.com>
In-Reply-To: <87ik55kirt.ffs@fw13>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::13) To DS7PR12MB9475.namprd12.prod.outlook.com
 (2603:10b6:8:251::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9475:EE_|PH8PR12MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: facf452a-5fed-4c75-1c62-08df01c1aba9
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|11063799006|5023799004|10067099003|4143699003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sDhaWnb9YvkBe5+Hy1gawAzhy1Uvn7LINVx6eztNhmSKZjfUxGEa93W7IEyfVv3iCGAcKJKgS80Pp2E/vIIAA7/3Gv5hG4NF3c2RsUKpMiSOnFhF5q/tXJqksc47h6yOiy+g6VdN4aZCagixAOnpwqfHjFa71/bpLmAsdIySieq2BibNPSqtGUA/IoiW033E/BV0zpVzEqOB0pbssHf6FRDbchhdnFZTyQXiIiedhuEOuO5s4u2vb5Lj+N0K/8zA3wdWYBpzd6sKQC1byZukEiPIwZVvZgA3Lc/EHPyvSXSWTN3X63ElqjJ8Cgw8doTKng97Rd8mftbXuwgo+1h/TsgLePJeLakdd1j2jnhwSVsZ/AORR/HbfbLXuDqz+ccvkGXYwcBfVKcvl5nCEZ5MELL5BddT/gTYGeUZoi+dINMZKwTMCr/2sLijb381eDBGbemhqXPjcKjOSZSyPUcn57u45JhomZEM8EHhboH+LhJ0QDx5/Tr0b5vfsFLGU2QV9It0/BURjwc9CFKOIePPoYAG5SY/nlx6akGTH9gOJIy4pMucOPNMWuQO2FlEjE85lWzqCQ0NTR/R134eu9RnMg6KsTjZzRCYe9Ynm6cfAHTNLbkl499R+AcrwgGxrFiuLQgvwcB0dy9g2W0zE20/EQ1xjT9KAgtO9S97m0nnzLE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9475.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(5023799004)(10067099003)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlNCZWNtd1R4Wk1LRHlkeG0vZVZqTDFWbHhGeU1sL1Y4MDNPZW9MbVpmb2x0?=
 =?utf-8?B?dUpzZmxWSEI3Qy9nYVhwVEZvbHg3b20ydG5GTDFWaHF6QU5URmVQMnhWajZ4?=
 =?utf-8?B?dVdUcDlmSnRkdGEwS2lhT0ZpYmk5RTYrK3ppR01KRHJrN2VZVGkrRDJOZS9Z?=
 =?utf-8?B?ZUFBelRXYmExVU9VbDl3SkMvTmdPdEdaR0M3VmNXYW1SbUh0NjVudWpzWkJZ?=
 =?utf-8?B?a0JWclBXbUxEUUJEK2RITXdtVE1YdHNMS2xLS09laG9maTR2UjVHV29VTHVu?=
 =?utf-8?B?S3M1S0V4TnJXNSsvK0QydVlScHlHUWV5TmhnSXhiZllxMUt3dEFkd0RRK1A0?=
 =?utf-8?B?ZzdqZUExd0RvVGZYaFh2VEJUaFpaWWtuY0trREw2YlFWbVRPd3E4em00TDZD?=
 =?utf-8?B?blBoeHBpeHpTWFNxQUdwUXJYSyt4K1BSWUwreDhLaHkxN21Rb3doN1ZDdDF1?=
 =?utf-8?B?aDlWcCtpWnpWbnROcGJaYUorUTVGYmhUclQ0TkdncmxxSUc4bmpVaUpvU0Zh?=
 =?utf-8?B?U1ZVUHpuOU5sOElNakFMWWVCbUlrclIvYVVpZUxmMG10U1A0L2pkM2J6dDNu?=
 =?utf-8?B?UCtJbzl6VlhRamRrdW1EakZQeHVZT1F3aVN5TkRwdkhoUGU4VEhtc3F0eHNM?=
 =?utf-8?B?Uzh1YUhTTVhWamFhczhCZWRmaWQ5NWEwQ0V5dDQyaFlxRUQyOHJYSkFWaUhX?=
 =?utf-8?B?L3o3TWJHS2dQT29RdFNUckV6MUNBVDJpS0ZYVXV2Z0R2YU9Fak50WDArV2Mr?=
 =?utf-8?B?Vjc3VU5RcXgyTW1nZ3F2YnJOTXRmZnNKSzFXWHh0TWhMQk9OczdLaStNNXRh?=
 =?utf-8?B?d1RoTys3SU1XdHNxcDZPYzE2dGFGRXRuU2dQb0R6aFc5U1hpTjVvdGhnd0FE?=
 =?utf-8?B?WERqd1NvSnNFUncxUm1tYjlYeDRYOFFVL3ZuZlRVWmpSSDlKa0E0NzNlNlY5?=
 =?utf-8?B?eUN0Y2FQRXBOZVFIdXpQOFlMbFc2Q3Qzd01sYjJ6TkkvanRCYzhTN3NrUko2?=
 =?utf-8?B?dlZ1czBnOE80M2RxQ2NKbCtvN0ExSURuMVBCTzFwMFMwYVU3NDd3NUFLQnhS?=
 =?utf-8?B?OGZjRDZtY3pmMzlhd3cvdHEzR1NjTVhQeE9Pb0g3U0FwTW9KalFvbmlZL0hi?=
 =?utf-8?B?eDVNVEZ1T25CWklGWjVQTkEyNmxKWkw2SVJpMkNKa1Y4aENBakQ3dEVnZk9W?=
 =?utf-8?B?cWxvQVQrZVJQOThoRTIra0g4UTVlVnVwUlRVRFhJRDV2NElxNDN2dFhucVBq?=
 =?utf-8?B?bjFRcmZXczZoMXZ5MUZheEFGOUE3VlBWVzlENDZYdmlrWmsvTnBpS2dEVVFQ?=
 =?utf-8?B?SG9abk1xYllvd2poSndjQXE5ang2VGFrT3lvOXV6RE1hTWpHSXh5VFc2ZXY3?=
 =?utf-8?B?Q3YwSk9xZzB5QkxOR1ljM1YzYVZrb1Z4WHlyS0doblBKQTJidCtkM1IyUDVo?=
 =?utf-8?B?UWF5ckc2djA1ZkdpK2FnUVlSc3JHRnFpVVlyeSt4WXNScFBJK28wRGZ0NXFE?=
 =?utf-8?B?d3owWGRyYnRjM0dEbm0wTXVZVGNyaUs3SUxrcElhb1drUC9rTUNINmpYbis3?=
 =?utf-8?B?RW5vbDZHdVcxY1Iyb3ZjeXdOQ1lVcmRSdDUrV3lvWFFjREJCZ0swVnk0NW0w?=
 =?utf-8?B?cWhrdEJQQVlrUUwyMUZtKy8zUy9iYUxOcmJ0YUpxZG5ZOTNSVDZPdWRYQkxk?=
 =?utf-8?B?SHN5aG54djBsUU8zOWcrRWlpaTdUTzZhZjhxK0lSUzBuSFdKaTB0WCtYT3lC?=
 =?utf-8?B?dmRXeDAyUG01NUZmQmRiVVowbGYwamZ3bWNrNytaS3hEME1DRGZkYmVueGk4?=
 =?utf-8?B?N3Y1cXVXUGd4ZElncUhGc2luUWdzY1c0UGtHY0VGZWgvMGRuVXNIaldwYVV4?=
 =?utf-8?B?blNFeWZSZStvN3FVd0VzemJWc25JWm1GenhtOWN3YlFqMVBwY0lSYy8vak91?=
 =?utf-8?B?WFh6WUhkVXA3NlRhdm0yYmJCVTF4U2poUTZMbFhFdEVydzJQUS9KR3RET0ZE?=
 =?utf-8?B?WW4xYzV2THlBc1NxdGg4bkp5S29mUWtaZDN3S1orU08wSUI5SjNKVlpGVU1J?=
 =?utf-8?B?RytJSXVWVTJjTUNKMjJlbnN3T3dQNC8yRkpha2dIaDZ1NERXekJLZDdWTmNv?=
 =?utf-8?B?dHErbDArbkRQemVPZFZKaVh3MEkwZFVxYzllTUZwZy9kZ1BVSDhVbGs2UUhj?=
 =?utf-8?B?RUFvbGFsYVg1NmhJNDJPb1JNMnlnV1VucE9iVUNPSEk5cVRRbU1CbVVIOEN3?=
 =?utf-8?B?aWJ2WDV1MXpuRGg4WURraVF4S0g3cGgzRXVJUzZ6T1FtbTMyMlNYVko2RUEz?=
 =?utf-8?B?REczMXBOOHY2am1ld0dzRXl1OThDbm8wQzJneHdscXRBY2MwakpWdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: facf452a-5fed-4c75-1c62-08df01c1aba9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9475.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:25:43.1450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lzrgG+1/LiE5K30zxszsRnGjMRHzcTH7YHPGorELwuO+77daO2FGWjvq0dcuTRj/SAvmWgjqF35+RhF2heke4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_022552_970791_E99A27FE 
X-CRM114-Status: GOOD (  33.75  )
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

Hi Thomas,

thanks for reviewing.

On 8/20/2026 1:03 AM, Thomas Gleixner wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Mon, Aug 17 2026 at 16:22, Tushar Nimkar wrote:
>> +/**
>> + * struct xilinx_smmu_csr - SMMU CSR interrupt controller context
>> + * @base: MMIO base address of the CSR registers
>> + * @domain: IRQ domain for the child interrupts
>> + * @parent_irq: parent (GIC) IRQ this block is chained to
>> + * @lock: protects the SMMU_CSR_IER/IDR/ISR read and writes
> Please make the member descriptions tabular aligned
>
>      @base:      MMIO ...
>      @domain:    Interrupt domain
>
> And yes, use interrupt and not IRQ. This is not twitter.
sure.
>> +static void xilinx_smmu_csr_irq_mask(struct irq_data *d)
>> +{
>> +     struct xilinx_smmu_csr *csr = irq_data_get_irq_chip_data(d);
>> +     u32 mask = xilinx_smmu_csr_hwirq_mask(d->hwirq);
>> +
>> +     if (!mask)
>> +             return;
>> +
>> +     raw_spin_lock(&csr->lock);
>    guard(raw_spinlock)(&crs->lock);

okay

>
>> +     writel(mask, csr->base + SMMU_CSR_IDR);
>> +     raw_spin_unlock(&csr->lock);
>> +}
>> +
>> +static void xilinx_smmu_csr_irq_unmask(struct irq_data *d)
>> +{
>> +     struct xilinx_smmu_csr *csr = irq_data_get_irq_chip_data(d);
>> +     u32 mask = xilinx_smmu_csr_hwirq_mask(d->hwirq);
>> +
>> +     if (!mask)
>> +             return;
>> +
>> +     raw_spin_lock(&csr->lock);
> Ditto
okay
>> +     writel(mask, csr->base + SMMU_CSR_IER);
>> +     raw_spin_unlock(&csr->lock);
>> +}
>> +
>> +static void xilinx_smmu_csr_irq_ack(struct irq_data *d)
>> +{
>> +     struct xilinx_smmu_csr *csr = irq_data_get_irq_chip_data(d);
>> +     u32 mask = xilinx_smmu_csr_hwirq_mask(d->hwirq);
>> +
>> +     if (!mask)
>> +             return;
>> +
>> +     raw_spin_lock(&csr->lock);
> Ditto.
okay
>
>> +     writel(mask, csr->base + SMMU_CSR_ISR);
>> +     raw_spin_unlock(&csr->lock);
>> +}
>> +
>> +static struct irq_chip xilinx_smmu_csr_chip = {
>> +     .name           = "xlnx-smmu-csr",
>> +     .irq_mask       = xilinx_smmu_csr_irq_mask,
>> +     .irq_unmask     = xilinx_smmu_csr_irq_unmask,
>> +     .irq_ack        = xilinx_smmu_csr_irq_ack,
>> +};
>> +
>> +static void xilinx_smmu_csr_irq_handler(struct irq_desc *desc)
>> +{
>> +     struct xilinx_smmu_csr *csr = irq_desc_get_handler_data(desc);
>> +     struct irq_chip *chip = irq_desc_get_chip(desc);
>> +     u32 status, pending;
>> +
>> +     chained_irq_enter(chip, desc);
>> +     raw_spin_lock(&csr->lock);
> scoped_guard() if you can explain what the lock is actually protecting
> here ...
will remove seems not needed.
>> +     status = readl(csr->base + SMMU_CSR_ISR);
>> +     raw_spin_unlock(&csr->lock);
>> +
>> +     /* Only service sources we support; SMMU_CSR_ISR latches raw status */
>> +     pending = status & SMMU_INTR_ALL;
>> +
>> +     while (pending) {
>> +             irq_hw_number_t hwirq = __ffs(pending);
>> +             int ret;
>> +
>> +             ret = generic_handle_domain_irq(csr->domain, hwirq);
>> +             if (ret) {
>> +                     raw_spin_lock(&csr->lock);
>> +                     writel(BIT(hwirq), csr->base + SMMU_CSR_ISR);
>> +                     raw_spin_unlock(&csr->lock);
> ... and here. There is _ONE_ chained demultiplex handler per chip, so where
> is the concurrency vs. the read and write from/to SMMU_CSR_ISR?
>
> The irq_ack() callback of the demultiplexed interrupts cannot happen
> concurrently because that happens in the context of the demultiplexed
> handler invoked by generic_handle_domain_irq(). No?
I agree! Locking part will be removed.
>
> Not that I care about the performance of your code, but I care about
> code clarity. If there is a reason for this magic lock voodoo here, then
> please explain it in a comment.
>
> Also this write here wants a comment. Why is the pending bit written
> back in the failure case? I assume to acknowlegde the interrupt. How are
> the interrupts which are handled acknowledged?

The original intention was to handle cases where an interrupt source is 
asserted but the ARM SMMUv3 driver has not registered a corresponding 
handler yet. In that case generic_handle_domain_irq() returns an error 
and the interrupt remains pending, which can lead to an interrupt storm.
The write-back was added to clear the pending status in that failure path.
However, with the current implementation we only process interrupt 
sources covered by SMMU_INTR_ALL:
...

         /* Only service sources we support; SMMU_CSR_ISR latches raw 
status */
         pending = status & SMMU_INTR_ALL;
...

and those are expected to have registered handlers. Therefore the 
failure case should not be reachable today. Given that, I agree the 
extra locking/acknowledgement logic is not justified and can be removed 
for clarity.
We could always reintroduce it if support for additional interrupt 
sources is added in the future.

>
> Also if this happens, then this code should make sure to mask this
> interrupt line because if something left it unmasked it will come back
> forever.
Shall we mask still ?
>> +                     pr_err_ratelimited("xilinx-smmu-csr: Failed to handle domain IRQ %lu: %d\n",
>> +                                        hwirq, ret);
>> +             }
>> +
>> +             pending &= ~BIT(hwirq);
>> +     }
>> +static int __init xilinx_smmu_csr_init(struct device_node *node,
>> +                                    struct device_node *parent)
> No line break required. You have 100 characters. Please fix that up all over the place.
okay
>> +{
>> +     struct xilinx_smmu_csr *csr;
>> +     int ret;
>> +
>> +     if (WARN_ON_ONCE(!parent))
>> +             return -EINVAL;
>> +
>> +     if (irq_find_matching_fwnode(of_fwnode_handle(node),
>> +                                  DOMAIN_BUS_ANY))
>> +             return -ENODEV;
>> +
>> +     csr = kzalloc(sizeof(*csr), GFP_KERNEL);
> devm_kzalloc()
okay
>
>> +     if (!csr)
>> +             return -ENOMEM;
>> +
>> +     raw_spin_lock_init(&csr->lock);
>> +
>> +     csr->base = of_iomap(node, 0);
> devm_of_iomap()
okay
>
>> +     if (!csr->base) {
>> +             ret = -ENOMEM;
>> +             goto free;
>> +     }
>> +
>> +     /* Start from a known state: all sources disabled, latches cleared. */
>> +     writel(SMMU_INTR_ALL, csr->base + SMMU_CSR_IDR);
>> +     writel(SMMU_INTR_ALL, csr->base + SMMU_CSR_ISR);
>> +
>> +     csr->domain = irq_domain_create_linear(of_fwnode_handle(node), SMMU_CSR_IRQ_NR,
>> +                                            &xilinx_smmu_csr_domain_ops,
>> +                                            csr);
> devm_irq_domain_instantiate() or use this one:
>
>   https://lore.kernel.org/lkml/20260819090543.585131-2-Zhipeng.wang_1@oss.nxp.com/
>
> It's not merged into tip yet, but it will be.
okay sure,  let me re-base.
>
>> +     if (!csr->domain) {
>> +             pr_err("%pOF: failed to create irq domain\n", node);
>> +             ret = -ENOMEM;
>> +             goto unmap;
> with that all these 'ret = -ERROR; goto foo;' go away.
did not get you here,
>
> Thanks,
>
>          tglx

Thanks,
Tushar


