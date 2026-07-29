Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BB6C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 07:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+MFMBHe9pqr23bsgrNpHn5jti8OoeGqbUd0ny+Bo9w=; b=Xxl44cd6PQalrt7OOLtanWQQry
	OMBrZFkAjnaObim4fucIMqnG2uxRA7OXH0gsAfovwnVOozEKKkKKxEJupeqo/CjAEBC7QeaQYK7Pk
	pzyWZRsD9nBK3BRykBpz33A7/2h6OAVi2zcBFhwvEZl6S+WLiThD78hxKohRCr1EdVUmKf5s9zRZr
	orQsQUhy86JgtIWN0OK8xIXUgPYwvkLG/nAbfVSPy4JRUFGB9JOfW42lyelgRcdZMYuvaI9ru5QRx
	GskDNVR4bSQAsiZ9UF2tFDlGzM8Yoqusj3Nm/xLi2FLtGZnqnwS1PFi9qZ+vzIjRE4wpkRXoLw0ND
	fVjU7xMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyMB-000000074v1-1rCR;
	Wed, 29 Jul 2026 07:05:35 +0000
Received: from mail-westus3azon11012061.outbound.protection.outlook.com ([40.107.209.61] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woyM8-000000074uV-2FeE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 07:05:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tb4ten0W66VPpZyLbtbstPviSGsgRBhfi1OPm1WowB2h40RILUlrKoFvd/8c9C6r8ZiFKE7LJ9GogmAzeaSp3jhVP3LIqB4i/TFijjXoS87rFKLYvBeGFizx+oDcB5CPr3XEXJrvWKn8hH+IyFsnwjK2WGeK0GH9nj/Tt+9maG4mxbqC+yfecWTZyFepWZfaE7dIXRWNslmOU/rx8taUFVJm5DzfYYP27sMyodVUmqbflLNPhsAHKzX6ZHWl9RvOsbyZbk17iyyTwmxnjMub9kCTybSdojhxL3/FCBkiS4Fbi2YFGD2WQKmLBuV84D9NIDFygVI2i+oZBmO2eWKruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+MFMBHe9pqr23bsgrNpHn5jti8OoeGqbUd0ny+Bo9w=;
 b=v6Z1PLhVmhD0fKzZa9Bg9lU9wKx7OzLMj7RimkJZRjBDxzKs8x03kvNjRO/o+7NXPIGNLYscD3P0rrBCnCBJz9lzNe5v0aea3L8O06yv/zFsT4xvvZwhx5MbsF666av2emzyGt6i+XRdESzYkhCAJ/YkRpPZsTpjn/DWASh7jnCmb5ypEl6+Uhz4Qc3zpK8rkcJWeBFSJwUS6b7j4uggN4oraZ3JvjveWyt+2w1qabBQFYOdYEgsjWCrhpz3kb14/NaGkgWTD4DUV83TgU6yz4CK/gvr+RZPkQlNj9X2Az/DfM68OAQYVoAXD5Wuo8D9749P4bzRb2f6IQyID4Shpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+MFMBHe9pqr23bsgrNpHn5jti8OoeGqbUd0ny+Bo9w=;
 b=2W3kFliyhlhgf1LxRK9DyrcP8J+m42bNTocomPN82DtZEJLEq1wKsfs+tGv8zSmPH9HXUUZxqEhrdpXk7Z6TsOXSyZADUQX27Gi61Xp3M38dD5NxsWQxYnjpVroaoxcfv2V5WozIVIbrxa06S7wqz1FWsFLAESQJBqRmoO/wMxQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8)
 by CY8PR12MB7514.namprd12.prod.outlook.com (2603:10b6:930:92::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 07:05:25 +0000
Received: from SA1PR12MB7366.namprd12.prod.outlook.com
 ([fe80::ec75:5e87:d973:77e6]) by SA1PR12MB7366.namprd12.prod.outlook.com
 ([fe80::ec75:5e87:d973:77e6%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 07:05:24 +0000
Message-ID: <9c6b14ca-a9e3-45ae-961e-46c20b0eb446@amd.com>
Date: Wed, 29 Jul 2026 12:35:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] firmware: xilinx: Add support to clear TF-A PM
 state
To: Sudeep Holla <sudeep.holla@kernel.org>,
 Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Cc: michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ptsm@linux.microsoft.com,
 radhey.shyam.pandey@amd.com
References: <20260724095301.2890001-1-jay.buddhabhatti@amd.com>
 <20260724101948.2895263-1-jay.buddhabhatti@amd.com>
 <20260724101948.2895263-2-jay.buddhabhatti@amd.com>
 <20260724-stirring-bloodhound-of-sufficiency-5bedff@sudeepholla>
Content-Language: en-US
From: Jay Buddhabhatti <jbuddhab@amd.com>
In-Reply-To: <20260724-stirring-bloodhound-of-sufficiency-5bedff@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0119.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b3::17) To SA1PR12MB7366.namprd12.prod.outlook.com
 (2603:10b6:806:2b3::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7366:EE_|CY8PR12MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: 45be5730-e713-44a8-17ae-08deed3fc309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|4143699003|6133799003|56012099006|11063799006|10067099003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: REUEiciSvvrYnISNH7FxqSflqA4NJJl2jfzdr4ODx3s3nOD0KC+OK8TWVZ58NDKDKRgacDIhkIt8knTu/CLIXY59wv2epObTFr7dktFi2uFmhEjVOPM+UkcXhH/88z7d/GnSMy4TkhQYjevfJuKVKl+YMhMglOdqMEL6+oVOO+0OCM4hxsS9aBL6jb/5wmZB8Sob/gWswF0akMXeVlqL5Awvr3sd0wliaKEpR/cI+by+JKP9IM2R/iQGu9TYujU2eIkGlbL2yumH57ly4k1EWyEiHTxTnDQMIN9Ss5Ck4t8j7ZKuyKIj9YEEn//WnvM1jznGbM0qP0vZ1a7xdZPKHZXaQLWxg6miO6qCt6knCQh/h56N5y51eRLmjIw1kbY2f4xkwDouT1IbQmLx/1h5NN/gWouGKqiDbEm92zna7VwFX99EYX6neolS01VD67wwQ6SsFZz/TiWlITM0lpXX1Ds99wl9M9WW35EmbW47JizVht37QZPGwsGbbbR/TAD7MMpqyQa/dEIP2r7wXs7uNYsRvQtQfObNWkHKjxu+dLfTlj5jiMyQ0ShneahEb8fgwKeMQR5MXMEijyvUNXULj/Mi8x77CzE+ULbHASh/QMVkp+8XvjkhectQmw59lEJKJE+9eWZrr05eN0Z0WPdDlvdvQdMhatBzq/M5I5NN/Sw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7366.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(6133799003)(56012099006)(11063799006)(10067099003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTdrejlYeVZvWWFDSjU5T1gyWjRENnV3c1dwTmdPOS9Va1Y5aDdtb1ZGenYv?=
 =?utf-8?B?T25EeGJkdmRZcWFXUkV0UEdGSGxpT2ZKZzFYblRtU1JWVm94NGl5SzJYeVRN?=
 =?utf-8?B?bEljT3dQRHphQXlFZ3d6QkFIWHE3QnU2a3NCbUpYK0JhTlowQ0dTVkcrS2p2?=
 =?utf-8?B?d2pMZXA5Yy9PNEtabWxJa0tKcHEvWUNwZHpNVjlCZVR2QUhmVnd3bWtUNTkw?=
 =?utf-8?B?dWROZFVrZkJyWFRZSmx1ME1SUDVQMTdYTHFPN0N6TUFwZlhmMkFvYWs5ZDhP?=
 =?utf-8?B?bWJIbmhhdHUxYUlGV2d1cnN5TUtZRGsxblM0OFdMZkxEVmw3c0l6cEJMOVpV?=
 =?utf-8?B?VDlna0RyZzFpQ05TVmVzN2REYWtLUHpuZmJWUTVWNmNQR25uVVlmcERZMmRJ?=
 =?utf-8?B?bDNwY0tYQmhMWk5XYjNiTGhnQ2FCRTJ6N2tZbjhGVnRRYWpZTWFkcUtVTSts?=
 =?utf-8?B?T3BtTmRRUVBJYzdaOUtiK1BPUHRTdktWdjVvTTUvWDRZSHZGVUNqMEsyc1po?=
 =?utf-8?B?TnhMN09MaEVPZWtMOUVCSzF5ZDBrazdHdzdoc3I4MFQxVmtxZTJCTnZvRWNG?=
 =?utf-8?B?SENBQmQxNkpjWkN3dWRvSEVFWDdGSDRhVVVaMCtXeENxTHFBM3oyN0o0TkpL?=
 =?utf-8?B?SHRLbTl3c0h5eElwRXM3ZmVnTDhRVFZOakFTSkFpVklTOW4waklZMjFOTHNs?=
 =?utf-8?B?aTFwS2R3ZGpjWkFhWjlmem5EVkhDcWlncDhsb0YzYmdUelJFNjh4SXA0NlZL?=
 =?utf-8?B?QmFLZjk5bmJ5b011VWVUYm1aRFNjL2E4ditnRE1jK2F4ZFVCWHpqTjQ2bDVs?=
 =?utf-8?B?T2t3WitieHFPZHFvN0ljUHBpY2RPVGtjcS9LY09JT1MwUXg2cCtLQnlxL3pF?=
 =?utf-8?B?WFFaMWd6TXd3YmxQOXRWWGoxVXQwYzNsbjBMbzdkWkkvaXBuUllwY1NsRkpF?=
 =?utf-8?B?NEpOcXB0bkZrVTBiWC9zOERFMDV6T1ZnQXJYckpIZVlsN1hsR0MwTFdWRWlB?=
 =?utf-8?B?SlhaZW9ZRHVQWWl5dDc2UzZoYnNDaVg3MVF0SmdBYnpnWktWQ3owRDBsVW1u?=
 =?utf-8?B?YnBSdm9xVUliNXVZS1g4U1FzdndQNzhvN0lEeHZ6V2ZrWjhwNnJxRDRNNEVD?=
 =?utf-8?B?MGZqZitzQ0dGVUpOMXlRdGMyNUc2T2pTOTlvVzg5YllSN2Z1N3g2WFliYlpq?=
 =?utf-8?B?SGF4S1NuKzF0SnlDNldrWnI2WnJXNkdrMm5TV2tnVzU5aWQvVldVVjQrZHBH?=
 =?utf-8?B?OFFjSVFDWXJMbE9ZU2pTZzdCdVFDYXZtNENIZElNL0lQWElibEFTejVnWXAx?=
 =?utf-8?B?R0NiQmNWeGljbWtFWU5PSGwxOFVHc2hwOEt5UFc1NTBpMDdjSC9DVEFYTWdV?=
 =?utf-8?B?WHgrd2s5UDFWVzFZNXVzd1ZnMkYyemZOM20yY3pid3BhMTNzaGNBQ2RrQXJM?=
 =?utf-8?B?UzVLUC9hSVN3TGZnNzNFa3dYa2c3TW5EZm83Ynp4NFRZY0pGNTVDVUNYVnpy?=
 =?utf-8?B?NUd0VTBjdEkrYm0rak1qWDJKazdNc04xem5idHU5bTFwMzM4TWM5NlFQSWpi?=
 =?utf-8?B?VTBGc0lLOGxlTEdnMFlFQ292V2lHdy9uV0pjNVc2ZFVObHBLMHVBMWhHTTFm?=
 =?utf-8?B?UEQ4bFhseWc1d0gwcDAvUi9GcTJCZFpnNHEwWmFXMUd6RENVOVR6bVNLSVZ5?=
 =?utf-8?B?aUVIamtRWVdtUllGQXQ1NEE5YnI0NThPdFgyV0krc1RON202K3pjOCt3S3M1?=
 =?utf-8?B?SmRTVnZmUDRsa3JydDRSQVEvc3BnZzlvMG1hc21FTmZBSVdIQWo5TzNJUVdB?=
 =?utf-8?B?RWkrMWZHVXU3TDMrUEFuOTBta0hyajlFcjVWYXZqQzlFcEkzNVlsS2NkUzEy?=
 =?utf-8?B?ODVyMlg2R1RUOURkc3l0clRXbGJBVUM4ZFlDVjZzdlZURTRYRUd3OFZ6Qlh1?=
 =?utf-8?B?T3dYb0lUcmtTenNnOE03RHM1a1ViYm1qa0tsVExxdjJ6c2FqMWQxSFQ5ZUlp?=
 =?utf-8?B?RzI3RCs1Q0dSbjREZnUyc1BOQXdkUk1FbXhlYTR1WTU4S3p1R2M5WkFDb0xK?=
 =?utf-8?B?UlJlZk9BOU5ZV2gwbWcxd1ZubGVFSzg4UERucFZEeWxicFhsN0M5c3F0cklH?=
 =?utf-8?B?M1FqUDc1M2doVnI5WDJyL01wWDJ4WjhoeU11cXA2MStvTnFoM2FzUDI4Skli?=
 =?utf-8?B?WEFpcHVYQ3pNRFJKY0crK3ZTbmU4Yk5WVDZreElGYTVvQmsramtLRmNteHhK?=
 =?utf-8?B?R2FwbFNmUFJQSFpBQ2s3UndEcjdVS0w1RHdGc1JTNXVld3hoWWxvY1NoelRW?=
 =?utf-8?B?TVlGb0twOVRRUWRvQ05sY2tYRTVFa3hxRnZ1S1dNdkpRajZCamxPdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45be5730-e713-44a8-17ae-08deed3fc309
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7366.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 07:05:24.5737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYduPZuF6U0Y4ERNBX21TkEZ6OMhrDoI2NtYCB2zyXrr95F6jdDQmsLxHXUBd/Csl8kLmaeQWR/Vmfnkh3yI+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_000532_635235_9DB7A9BF 
X-CRM114-Status: GOOD (  25.18  )
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

Hi Sudeep,

Thanks for the review. Replies inline.

On 7/24/2026 4:43 PM, Sudeep Holla wrote:
> On Fri, Jul 24, 2026 at 03:19:46AM -0700, Jay Buddhabhatti wrote:
>> Currently, during a kexec restart, only the kernel is reloaded, while the
>> TF-A specific data remain unchanged. This leads to a mismatch between the
>> kernel state and the TF-A firmware state like SGI number and shutdown
>> scope variable.
>>
> 
> Avoid using TF-A in general as it can be any other firmware as well.
> You can always generalise as PSCI or EL3 firmware.

Agreed. Updated the commit message and in-patch comments to refer to
"EL3 firmware" / "secure firmware" rather than TF-A.

> 
>> For example, the kernel registers an SGI number with TF-A so that TF-A can
>> notify the kernel of events via that SGI. TF-A stores this SGI number in
>> its internal state. After a kexec, the newly loaded kernel re-registers
>> and may request a different SGI number, but the stale value programmed in
>> TF-A remains, so event notifications are delivered on the old SGI and are
>> missed by the new kernel. The shutdown scope variable has a similar stale
>> state problem.
>>
> 
> Doesn't it reset it every time CPU_OFF or CPU_ON is called ?

No. The SGI registration is done once via zynqmp_pm_register_sgi() when
the event manager driver probes; it programs the SGI number into EL3 PM
state. On CPU hotplug, the kernel only enables/disables the per-CPU IRQ
(enable_percpu_irq() / disable_percpu_irq() in xlnx_event_manager.c);
it does not re-register the SGI with EL3 on CPU_ON or clear that
registration on CPU_OFF.

So while SGI delivery is per-CPU from the GIC side, the SGI number EL3
uses to raise the interrupt is subsystem-global state held in EL3, not
per-CPU state that is reset by CPU hotplug.

> 
>> To resolve this, the TF_A_CLEAR_PM_STATE PM API is introduced to clear
>> TF-A-specific state during kexec. On a graceful reboot, this API is
>> triggered by zynqmp_firmware_shutdown(), while in a crash kernel scenario,
>> it is invoked by zynqmp_firmware_probe() in the reloaded kernel.
>>
> 
> I don't see the need for such an API just for kexec needs. You must deal
> with it as part of CPU_ON as it should start with clean slate as SGIs are
> per CPU, no ?

Handling this purely in the CPU_ON path would require either EL3 to
clear/re-init this PM state on every CPU bring-up, or the kernel to
re-register the SGI on every CPU_ON. Neither happens today. CPU_ON is
not the point at which this state is established or torn down; driver
probe/shutdown is. That is why the platform firmware exposes
TF_A_CLEAR_PM_STATE - to reset EL3 PM subsystem state when the OS is
replaced without a full firmware reload.

The kexec cleanup is therefore a targeted reset at the OS transition
boundary (zynqmp_firmware_shutdown() on graceful kexec, 
zynqmp_firmware_probe() on kdump), not a general CPU hotplug hook. 
Given the above, I believe adding a dedicated API and invoking it at the 
kexec boundary is the correct approach.

Thanks,
Jay

> 


