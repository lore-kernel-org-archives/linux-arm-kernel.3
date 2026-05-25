Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB76FCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 14:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujjgQ0O40O4V6tn4hfnr42eoCiTCp9358a9HUKqkDxY=; b=wNC/RjVP9CUiDIk8+C3YX6HdK5
	kRJ0X4E7wU0BTWH1NjksuP5yHI6pF+lqelMSKM9j0PHPbPCCpNjBWA5gzp064aCSnZRIszC2ujJX7
	fMJOojJ+9jJWAZDb6duaSKVFTKnIw7MmKqWsgJ/KfsIKuqHsGM3FtboV2KYjMJzNC/QwxnpHRs8u6
	LegP2zj1RjJnrv3FYHYrracD2oZvSAZupp1SC7/Tkjm3lrjEJ8i1yZHmI3vwIZN+ctR5KcRb2Xtbi
	4SMSj6CSO580Le1JeZzDd8rn8jFurjT3ZQv6Y1N5oOGYGm0PdBhubHtx0o2Yh+zZDsjphTyA/X/p6
	IV9aQL+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW0B-0000000HO4f-42HB;
	Mon, 25 May 2026 14:09:55 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW08-0000000HO3z-48Hn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 14:09:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrFvNiZfGUpCDwPEzBTDvVLOL6+fK3AVC1+SQpGVWZQKSQ77NnR0JWgulbWhhRqI7YprYkfrrJvVpvCPVmhp0RHjcyuSkmbApHnEoBzofGfARcjFZMIuUmyk5M8GZdFY49L3Rbp9x4xPIXlCJz/Wh989dV8Sp2XWy/+iqFR++oTTG/wzaC0L+P0dkrZcUEQPWtnQMKtlRtIIle2PyLipIJhxQppAsKl9Bg++Tb21j9TA742ZS7ytITh6yQcfFxvXyGgKdBE4i2p77iQSFwamKtBmqJXD6orki70So1E1ewihZrgVLkMyVLMW1Kr/yqwOGNszeACFiq19S+gCUyq86Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujjgQ0O40O4V6tn4hfnr42eoCiTCp9358a9HUKqkDxY=;
 b=A7CZhs9cauAMtkspjUJT8G1PMMmGfurf9E1VvHBC+R/PsJQDk62tBiy1kb2mVhBXDGuUQ6UkXFnaTxVSuMC7MleGqeiFCcMyBQ9tne6puR1U/b9k5tlvFZnwA30oxyHsHidEqTi7hhpXKulZ3MrRA5/URUlBJVDj6sdNl03P3KitRZHQwzAd6vgNZXixd9kgoSUiZ/e4bEWW9Qb0lcE/Fb6u/SPhdbMbuVaD55wMcRzOBmK3cFJ8rKS1Jqlhhl5JRoQEFWeASVS/q9hMP6CNcAI5w+Ky6T/1GD2R1bSZP5GIDm0Qp1lMA1GTbJANzHZibGKeTR7MfD+AYym6d34HtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujjgQ0O40O4V6tn4hfnr42eoCiTCp9358a9HUKqkDxY=;
 b=SgRjqMqV3/QG/owDTUv40NfgyKvxjKMQiAIffVXL7g5DxE018NnpBF4LoAUdErW7fHXZnub8Sphw/4LC3tRqkTGl1Lsx4Pidi4OhQUVTWJ7GTeWDKdWngIfIgLsgv1O2liantbt7Xak9ZaQffH/zz2XEpuf1PBnRJXhUDuJzv1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA4PR12MB9788.namprd12.prod.outlook.com (2603:10b6:208:5d5::11)
 by CH8PR12MB9838.namprd12.prod.outlook.com (2603:10b6:610:270::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 14:09:45 +0000
Received: from IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db]) by IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 14:09:45 +0000
Message-ID: <13ee424b-60f2-4180-8964-b467794a4772@amd.com>
Date: Mon, 25 May 2026 16:09:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add dynamic CSU register sysfs interface
To: Ronak Jain <ronak.jain@amd.com>, senthilnathan.thangaraj@amd.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260520093654.3303917-1-ronak.jain@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260520093654.3303917-1-ronak.jain@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0045.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::20) To IA4PR12MB9788.namprd12.prod.outlook.com
 (2603:10b6:208:5d5::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR12MB9788:EE_|CH8PR12MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: c1be7c2c-d221-4765-72f0-08deba6745fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|22082099003|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: VQdR3SfolwBU8SCXcv2j7qbhguNaH5JH99xLMajW3BwQDGwIeMQCB9ThnvqFE8DX7RK8RMdBfkUvop7AQgFOXwaUvCVErC+pblTKySJhmzw58L/7Getu1i2geAo013uI2ibvPxW2y3EjKLAcg7EuSBEUpsEyiCB39VfNZaj1ghrifhZ9WmkGMf5LvCTYU6VjTw3mOdAmUjkgurB3wLPW69tp/4YjVmKr6FYJTpW1yKTCMVuulzzV7vtZEmTqH1kLrpSIMRZuf/B/XWASFyGRLNM8BFGcnvNJpOEMMwIEAHY6gkfavDd6WyJ5C5Af7f6GezyVyRRlm9BpD86hSxKVjZ8aERXX1+wlfoCPAP60yrQ+sJNrWfrqOFQZ2LCIKOTBWhhJowJHtWFRImRIDeYOiL0OPWm8n37On6s5Zlw4JnIuQrk5zLTMabnvtIrBJuo40AhYaJ2KruR5z9l8EJJns6rJG7RUhwnEVW7UkFJnUA3YQgmgOAaDHBaFQ3cHbgRI23ALKu4gSLwufKadY7Vq7FckrTgyIKkJptro0xiYoNLYBitDiYAImr0qbKwgO6Q5IHCPnwYz99pcYCRRuCxpI93cIXusqdqj4/QMtfAPEmqCbsZC+iMY1PGM7gmr+e3GP7rbG0tEbdHfhOdbASuv+3QVxSahF8nJ8hR4w/oBBxEdUrFfJsgFZl9q5pUNJtJC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR12MB9788.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TCtxQm9nSEdFeE1HdlpPaWt2cGNIc1lYdmt4cXdFc3pmbHFMcVQwaGVxcXdH?=
 =?utf-8?B?TFM3N3hhZ05FaUtjU256b0JHNlFFanFsL01sb3pOMTMrU0NscmVKUEV2dEww?=
 =?utf-8?B?eCswSXdEb041Mk1XVkJDeDFXZyt1VEFlVjI3MVh1Ym1kWU9sa0lsR3BhbGN3?=
 =?utf-8?B?MWl2K3VvS2lQZzJiTHdYdzZPTzVEdFUrcENrS09ObEZ0NUhmVFNidHJPRTFU?=
 =?utf-8?B?akJVUWpPVTNaR2d1NEorNWtGaGJ4K0MzTXdEbExJNkR6NmY2Ykx6c1FBK2lk?=
 =?utf-8?B?Qlp3bmxkVzZkcGRHL1VZM05CZWQwMlBOdkFLMXdWZjRoSTh0UWhPOXlDOW9W?=
 =?utf-8?B?b0lVQmN0Zk1oV0RIdDBBQ1dKczd6dCt5bFZBazR2TU12dlA0b0RhVXJSNVo0?=
 =?utf-8?B?angrV2FoVi9ZajI0bU5RcnZVQ2dmUGcxK25lR25yM3REQmk1UWdTd2lSUVRZ?=
 =?utf-8?B?VTlrZFVOZHNmaVZJOVcwMGNTWHhSUXVrM1hVZnQyR1dzSGV0R1ZTWFBScnZP?=
 =?utf-8?B?MVBDQ1NJSklaREhMR1hhbm9HanhEWXM2R0FDVTlIRDN6Vi9ZVEZUb2M0bjdm?=
 =?utf-8?B?T0NMekI4RlZMejFPY2pmQ1ZhNXpNUlp0cVFMeTFkT2RRdysrUWRiemhGV0sr?=
 =?utf-8?B?YkRXMFVJSVh4QjJmVVVPUzZKcy9OTWttcWg1VkFhSytyTEFhY2tVNXhhNE92?=
 =?utf-8?B?ZUVLR1pJR1FSNGIwOWhpRDBFb3ZSTEpKUzdPcHoxZTRhdnBLWnJzaThEcUcx?=
 =?utf-8?B?bjdRRG5ENXE5WTVlMUhBTTZsSEhOM0tIWFEraER2ZzNOelB6Nks0a3hRYzI1?=
 =?utf-8?B?UmpxQlZDakpLUURBZVVKTktGWHZ0QTNyVEh3bXBTVGJ2bEtKNzMyMDUvVzR6?=
 =?utf-8?B?Y0ZUeE8rRWpJVldxMTFBUVNobEwydFMvNEFTUEpnNkY2YlRlNXZpdElNODdD?=
 =?utf-8?B?RnVod2ZLaVpHTFZneUlNb2orMjVDMVFMVUd2MUxtK2N5L1JuZzZOTG9rSURL?=
 =?utf-8?B?M3BmV0dSRXA1c2xFRHpjKzBhQjJ6d3R5SmpvWjBYOTU1U1Ntc3drNDBTbWRJ?=
 =?utf-8?B?NGFCMll2WCtwbUwrY2c4Q2FUVW5rNVFCY1pmR3BoNTA2ZklEY2d3MTRHaFM5?=
 =?utf-8?B?ZGt6cVVtbWZqYzNMcVRUQ2ZjTEtMQ0FZUk5LL1QxenNuQjdpejAybUk1T3Ja?=
 =?utf-8?B?azg4OWRPTmJhZThkL2JPZmtEYVdCMFZwcEZ4UjkvQnJsR1hMTDE2TUpnWC9R?=
 =?utf-8?B?YTJrVm5ZVjl1cldOalVZcE5EcmpSMklVNiswOEdST2k0NkxEdGRqelp0N29F?=
 =?utf-8?B?WkJzUjQ5bG1MSWN5OHJ1UVVNR0p6NVlIYTVsbERPYkFRM3kxTSthbWF4QzlP?=
 =?utf-8?B?VmhoTTgwcWpja0lCVTd4d2NRY3dybDFzRkF3ZFcrUndrbzB0QnNHazFJUWtO?=
 =?utf-8?B?THBqUmJFaUVRdHp0ZEtCdU8rQzY2dWVmbHVrelhIemh1M21zc1RLN29HWnFu?=
 =?utf-8?B?L0xKdHRQYkNTb3ZRaXNCRDZ2c0x5UWxBcWRqL2p4cVIvNE5FVE1HUmEwODJT?=
 =?utf-8?B?TS9JN0EwWnF6Tjd2QjE3bjhJWVNrQkZHSG1DSDFrNUpIVysvSUNvUFl1dExI?=
 =?utf-8?B?YXpTajg1b0E0SXJ4eUJNR1BaenpVb1Iwa1RMblVqNlIrMnF1bEpHNmZweXRs?=
 =?utf-8?B?N0JQL0g3b2ZyRzB6ZWtFdEFGZmtGUitHTXNNbTczcFJFSjBGYklZNW1aT0dR?=
 =?utf-8?B?ZS9hRjI1em9XMHlwSHBaNVJkb2xuZlRiaC9sUldVRlJiQzc3REl0dUZRajlm?=
 =?utf-8?B?Qm1RTnIzOFh0WXp4UTZMUU9oRnlJUmxvZEU3SEg5ZlQ0N1hvNUdSZDFVWWNO?=
 =?utf-8?B?RlQzTFUxSE0rMkQ1SEwzMjk0RkF3ajhQL01RUFRCa0FHRHNVa055eG5aU1FU?=
 =?utf-8?B?YXI5cXV1eGI4SlZmYTZjM2I4bjdsLzhLL0FCSWR6UGIyd3NTMjE5b1VURUN6?=
 =?utf-8?B?ajFOcUNqRW5qSVkzR3Z0SFRpcFZwL3hiaVVtbXR1NDZaeitoVnp4V3dVZXgw?=
 =?utf-8?B?ek9NWU9kVkJQMjRBUVhheFNnc2w4a3hUWThlaEF2RUJXT1Jpc2xwMTNzSWJ6?=
 =?utf-8?B?eDhEZ0JTSDRmQ3BRVkVRNnBmbjhzQVMzamxINjBDbCt2UmY0c1E0ZEZ4WU8v?=
 =?utf-8?B?MzJuUEYwZlhQWkZLSmZMbWZrNGgzaVJURndQblYvVnY5WmplR3ZFOG5XaHht?=
 =?utf-8?B?T055cTdsM1R2WmpLZ0tla2xGSW5yajdTY05YK2dtd2ZQR0xBc0tGci9FaVVs?=
 =?utf-8?B?ZEdrU0NIYUNWWkhabURvVTVFbjhVK3hYNXBFVm9UeXJhTmZyck41QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1be7c2c-d221-4765-72f0-08deba6745fa
X-MS-Exchange-CrossTenant-AuthSource: IA4PR12MB9788.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 14:09:45.2440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNuIUnZ3lJuue5BzRMTIAkV1vLRb+hqN3Z6WHYXTivUC47U/e4JwMOtkk//fl8Kj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_070953_147667_16CD115C 
X-CRM114-Status: GOOD (  21.54  )
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



On 5/20/26 11:36, Ronak Jain wrote:
> This patch series adds support for exposing CSU registers through a
> sysfs interface. The implementation uses dynamic discovery via the
> PM_QUERY_DATA firmware API to determine available registers at
> runtime, making the interface flexible and maintainable without
> requiring kernel changes when firmware capabilities evolve.
> 
> Background:
> 
> The ZynqMP platform has several CSU registers that are useful for
> system configuration and debugging. Previously, accessing these
> registers required direct memory access or custom tools. This series
> provides a standardized sysfs interface that leverages existing
> firmware APIs for secure access.
> 
> Key Features:
> 
> - Dynamic register discovery using PM_QUERY_DATA API
>    * PM_QID_GET_NODE_COUNT: Query number of available registers
>    * PM_QID_GET_NODE_NAME: Query register names by index
> - Automatic sysfs attribute creation under csu_registers/ group
> - Read operations via existing IOCTL_READ_REG firmware API
> - Write operations via existing IOCTL_MASK_WRITE_REG firmware API
> - Firmware-enforced access control for read-only registers
> 
> Currently Supported Registers:
> 
> - multiboot (CSU_MULTI_BOOT): Boot mode configuration
> - idcode (CSU_IDCODE): Device identification (read-only)
> - pcap-status (CSU_PCAP_STATUS): PCAP status (read-only)
> 
> The sysfs interface is available at:
>    /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/
> 
> Usage Examples:
> 
> Reading a register:
>    # cat /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/idcode
> 
> Writing a register (mask and value in hex):
>    # echo "0xFFFFFFFF 0x0" > /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/multiboot
> 
> 
> Testing:
> 
> - Verified register read operations return correct values
> - Verified write operations update registers correctly
> - Verified read-only registers reject write attempts
> - Verified dynamic discovery works with different firmware versions
> 
> Changes in v2:
> Patch #1
> - Update date
> 
> Patch #2:
> - Removed unused csu_reg_count field from struct zynqmp_csu_data and
>    its kernel-doc entry.
> - Added explicit devm_kfree() on the csu_regs and attrs allocation
>    failure paths, plus on devm_device_add_group() failure — keeps the
>    footprint minimal when CSU is optional.
> - Expanded the 0644 sysfs-mode inline comment into a block comment
>    explaining the firmware-enforced access-control limitation.Also,
>    update the commit message accordingly.
> - Added zynqmp_pm_is_function_supported check for PM_QID_GET_NODE_NAME
>    ID to mirror the PM_QID_GET_NODE_COUNT verification.
> 
> Ronak Jain (2):
>    Documentation: ABI: add sysfs interface for ZynqMP CSU registers
>    firmware: zynqmp: Add dynamic CSU register discovery and sysfs
>      interface
> 
>   .../ABI/stable/sysfs-driver-firmware-zynqmp   |  33 +++
>   MAINTAINERS                                   |  10 +
>   drivers/firmware/xilinx/Makefile              |   2 +-
>   drivers/firmware/xilinx/zynqmp-csu-reg.c      | 258 ++++++++++++++++++
>   drivers/firmware/xilinx/zynqmp-csu-reg.h      |  18 ++
>   drivers/firmware/xilinx/zynqmp.c              |   6 +
>   include/linux/firmware/xlnx-zynqmp.h          |   4 +-
>   7 files changed, 329 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.c
>   create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.h
> 

Applied with kernel version changed to 7.2.

Thanks,
Michal

