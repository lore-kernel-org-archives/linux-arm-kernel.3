Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558B1CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6g0TGqK3zXrmElNREGqlHFNu4fn6Fc1t3JEWZbNvpI=; b=J7uq2ci+XlbaDfVelfrVQISvC/
	KV1ueT+fctJvRqbyEtW9ZCi4d0zxmfsWpD5eqXX/8ObK7HXNKTyvdr+EczJ/gsx3rHREeNrZ4J4/d
	Qw3UZhlUftRulk0iRB+TQ1VIGFLwKeblXmBYTQnl9vZJZhS4Ca73pLvrV3f8AfXwUWDhZpFsd8Loi
	qbctjGIJQQ68vzzoa1vnhamyaP02ZdcTR2TBDvZEUpia7TyApuJkL+nPMR4W1gKEhQXGP9DnZ65mP
	jGfC4Ip1mUhwp99eb/nJ8LvqC1mgrqHZcnG5TKbp7qHVJw1GcibF6dRWaZe95uOU986w8LDDFeEEE
	GhRctd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhS1-0000000Eeye-0F1V;
	Wed, 03 Jun 2026 08:59:49 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUhRx-0000000Eexz-3hbm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 08:59:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzHwgK2soUPuZzedK2RORzIvizHVcPAhkXdINizB6DTqDXeOiP8mnR15ha+V47ZMtDzYB57nCByhenaSaDKHSJKJ2Es6UpWlHSIU5zw+86te2fqsCIHrCJzohaLQb6OZJ318uNMH4fSAjGplATvTr+74o4Wq/Nal6DKBUPuMkVNwK8J7KyjUbnKCifHCJ/4slE8l/11iNsXxMxK9XYojOQsRNCsR7UFnPW5qej6ev9em+79NEMqDXMpuwBBKarCX+e4uOHhluZJiXjpJub8do0uBgG/Udcjxb/LBRdlocKRmmgRtJUOdghFVYwQRIp5Sh0DCQi2NPKM++SnKOT/KNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6g0TGqK3zXrmElNREGqlHFNu4fn6Fc1t3JEWZbNvpI=;
 b=qSzFs5g68giqZSFxHJyl+VcP4VbrddDbWgDWiZX8KWQ6QX9+PV4IR7WeYFG+WT1cDraFpwUBB/TEuMuLE3z8H+hfczDpdFPQsSxHoLz0ZZbk2uRwTSuaKTZEwpgrhOPwELDk689tkpmmrhI8KwigOqs8GzcB7nrEgr5lHBPBgYKNROuwTyltSuTEeUXJIWjLQ0erj7WCaeN3qZbzXHyRD8Nw41w7liLDNI7uxE7gqaHj1+r+zfTOGRtkLeZyhHyJpLyGplhefBSfrItJK27pnHQQSUT+uZ4/NysmoeLEN+btq0SywMAt4PU4fS+rcv1nJkOSvGYSoRIXD6Od1MoYSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6g0TGqK3zXrmElNREGqlHFNu4fn6Fc1t3JEWZbNvpI=;
 b=Soc9CfFhlYF9zCPg7qtteoy4uxNfpu+Xhse430SjkC36HlYjJprsOwzQhiNsHclyC2K0P0stkwUSi+Rg3Ows3O9NWchWV41/z+Ec+8GD/gYnT2KFgRJsvyxmMxpRXlgtIP8yNSwHJIudP4BF62le2kjc8ZkgKvnod7R5An2zDpDYUFa5kKOy2UaWLRBoDY3IDwrYgAvDBr2XwoWnDmSh1nzkp8yqRF3ynsoxa9LaELgprnXD+S1p3U5Of3PoBRwheYNFrw9dH4k6bzeGzx5G2DfVG66rKGQ94vYRCTA11fUbk8kbl6msJvxLWF41astrjb3AnpDez9Kk+TeM8zsXzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2370.namprd12.prod.outlook.com (2603:10b6:207:47::27)
 by DS0PR12MB9040.namprd12.prod.outlook.com (2603:10b6:8:f5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Wed, 3 Jun 2026
 08:59:39 +0000
Received: from BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8]) by BL0PR12MB2370.namprd12.prod.outlook.com
 ([fe80::86cf:c3ec:2cf5:74c8%5]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 08:59:39 +0000
Date: Wed, 3 Jun 2026 16:59:30 +0800
From: Richard Cheng <icheng@nvidia.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev, 
	Russell King <linux@armlinux.org.uk>, Theodore Ts'o <tytso@mit.edu>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: configs: Drop duplicated CONFIG_EXT4_FS
Message-ID: <ah_sf1lIBD8UcOHs@MWDK4CY14F>
References: <20260603072726.19404-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603072726.19404-2-krzysztof.kozlowski@oss.qualcomm.com>
X-ClientProxiedBy: KU2P306CA0026.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::10) To BL0PR12MB2370.namprd12.prod.outlook.com
 (2603:10b6:207:47::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2370:EE_|DS0PR12MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: 37fc5dfe-9dbc-4eb1-afb0-08dec14e717f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 4DegxhabX6U8MOpACZZDEx+Dy6PIPzbFzIetK+QsLR82ac+tfQEAyJYHpl4wlEt/uYjHm+6fZ3DoHWwvhNWtw2aTeYnaIK9ueoM6APJDTKuV+8HL+mGcSqrBFuMl+RegKme1x0r6dfQrJLvAxdjkekb08AiqpndBZs4p66SHdsZoHq3ZiFsBzqQeb9hNE+JzNpuAQ6qJycaZWJpwriBmUEwIYeb2m5C8UEG6hF2n08fdhqo0N8x0D45MFw1B6tfTQphdscMh+Mgf0L4B2hmpZxlPDXb3e0vIEe24PPR/Vvs/s9kOgUVBZK5tWRUJKS+6jCNCQQSZIRNYO8V5n/bV+yI+ZsS9q7WsWH38Xb6XWCSceCUJjGId7hcIHdCZQi8ROCRmZHp2HdBtlmYUUaumKE2ETLP64ZHUewZ1gQGfjhyzuw5Gi+FMV9LRC67jC0v+4Rk6O5lrs+PYJ6ztyZLyYxlHU2ZC1tKWOrfCMDEY02RERyksSbL07QYpEkr13HkzcjpAHxpuA+qk1jv45MJtKHnyqNS5VPl8VFpT2aSAR6Qxw67YvH0F6ENmN8xGHtI8MHgeNNmkpGrfoPAzLbhuKzspYXwpj03SXD45a154qXGEgUC3ZHSiazZNN0NrNXkiVNDPbeHrKNvwlkUVW1tjuvOVb9W0uKni34YbicTSqxm+S41VZFmoHqNqDe2pAKD3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2370.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?26rTSOsBwcqdWiDwy4baIYAyRNsxLSNh4FooIIva1nB7yKH9mUhHUw+j6I+S?=
 =?us-ascii?Q?dJTQb2LYcGvNiwNUSRhtdm62pij8sgaTel280/XrxLVYw5f8/yvaYatDlY4X?=
 =?us-ascii?Q?Z5HiIiYKBkj+plMcQrfYt8cFH4+UdWpTF3nOU8cT73ev3A5XZ/2de7NG31Ps?=
 =?us-ascii?Q?+pVT6L7+Z+KswYOpXq+UANorCPt/Dm8YmjFQC6hRy6q9k7PRztuW6tia40Jw?=
 =?us-ascii?Q?3ThWsV1jdsGSjcQoB76GfxvzIueHKY6wCMEsHkWDRQ41imi5iGM/rqDg+LxE?=
 =?us-ascii?Q?Q28+7UMKeWOdnlXrg86k+IbF3s7Ap6eaBhlDZBwweFEZd+YHY4KMQQcATK0p?=
 =?us-ascii?Q?3fY8Wx6eQD33m035yEXW2+Ug7Mi7hJui/2sttWSEF+wFdGfBbc/tA8VQVJPa?=
 =?us-ascii?Q?I8IuMCadUfTHvz2dkMHenjfxDOnLAiodWfpuM4/fRHFJHb6b2NNSRg5vo3C6?=
 =?us-ascii?Q?4c1sJURwTywlUaxYvggyJ4qeQTou8R74Bw7YOe6VB3celVU5ynI3WR1dN/FV?=
 =?us-ascii?Q?nesCw2MoUdXM9IpyB0iFNpCf66jzFDllilD+L+pbYNaHqFW4V/txz70aRFWT?=
 =?us-ascii?Q?0MLSW3aDbkHdoxC+WdTqbn/GjtwhoTRaVehLluvo+EIJFnyj7vwAtWmESIXx?=
 =?us-ascii?Q?GRlmlAAiIkCW9UKo2SCtVKj8cxVIhIpOMjJrRkovqKIaJIYnlqXgf6Cv98Ow?=
 =?us-ascii?Q?pBlE1bydmR0wgpMth8mLbh67Ph/zz16EHbdEX1cEIxkwuFci06EAHCIFiTlm?=
 =?us-ascii?Q?TEs2/N3jKaQOuw4fxzNX26J0MokskgBnIKqNcrQhB5ib9NRJbfAEf7u8HnSQ?=
 =?us-ascii?Q?67q1yVaI4ySDud1DRTNQVjOCgHYDIHZE9CWwRFrrBA1PhhfzHADrqDED0lWX?=
 =?us-ascii?Q?av2Tsg3SinQsp0+vxeVmbHW3lr5xuMNEYir2dboTpYTlOjNRPdbuE2tb+QNW?=
 =?us-ascii?Q?DcF5E7RnCq/95Deuli/pV8DHNHyLOrbOJReWw/Ksx8t3w5aNfsXXu9w7/t7c?=
 =?us-ascii?Q?xX5GIujyPKWdEcJIxlvl7q0ccaaU0EPHLrMcQ13iAfoZjINIZyGCoZPAzoxZ?=
 =?us-ascii?Q?VSUKAaaqZ3obAaML3ot6/FckcxKizsLEMHZkfxKoyi4/sjxl+tqXN+DFULWO?=
 =?us-ascii?Q?bS3L3fO5r7cSHOrmiiyWFNcY6AFV/pbrTiAa6AI4AyeowtpXN2avQoR9Fa2C?=
 =?us-ascii?Q?CEuGUXDcfJ1hesI0zovUzQMCHTTZH0+lWRCEmDKHbhNLXvZMPMGWUdh4qQWp?=
 =?us-ascii?Q?IZg99Qx+PimorTRr9DORE/OFmrlbr/HULSm2lD4lQttCNkhGgnYTs5VtOpfi?=
 =?us-ascii?Q?wH5ZGXrXPrThQGnPBtXXeyspi6a/5NxUI3RdnrqVCmQknMqSvhxY0Myn1taU?=
 =?us-ascii?Q?sfElOrnoouuOTZx+N0st66V5eT332IkmFSE4GF+hiurZDZ0Td42KUZIWTs0+?=
 =?us-ascii?Q?kZ5c3OkWpABo/v0n169IZ7Knfsm+DKLt8ZscS4o/roR66CsXxi/veZbZWp4o?=
 =?us-ascii?Q?8QTj1TNoxlxCylyBtVFgEH4/w04cZNbCgB5rQg4z0xz3FHffY0NzXc4W+peZ?=
 =?us-ascii?Q?mabizKm/8d5ia0rJ68fxDFk0mistaLXtpLJLSMUCTCIxWPlFZ0kUBIqqiYC/?=
 =?us-ascii?Q?iltr5P04N85n+FJ4obVAXM45wRVyTNHzuGH4mA3fc92V/+NwosVQFMtOHeU1?=
 =?us-ascii?Q?KBQDjVMsE7a6+pb8QPbt/RNC39z/AnpIbgTZ9SIgVc/7yaR5tWIBr/yaBGXX?=
 =?us-ascii?Q?NAI75j7JeA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fc5dfe-9dbc-4eb1-afb0-08dec14e717f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 08:59:39.5375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EGgqkXh5Ai4EFZ49HCXFzizIpBDmJ9fgZ+k+KqVS+Re9xaO51QkevGUFNii/kJcQGqWXSljiOEwFkS4lQ6sPtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_015945_931940_83049308 
X-CRM114-Status: GOOD (  15.33  )
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

On Wed, Jun 03, 2026 at 09:27:27AM +0800, Krzysztof Kozlowski wrote:
> Remove redundant, duplicated CONFIG_EXT4_FS to fix warnings like:
> 
>   axm55xx_defconfig:198:warning: override: reassigning to symbol EXT4_FS
> 
> Fixes: c065b6046b34 ("Use CONFIG_EXT4_FS instead of CONFIG_EXT3_FS in all of the defconfigs")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm/configs/axm55xx_defconfig | 1 -
>  arch/arm/configs/dove_defconfig    | 1 -
>  arch/arm/configs/ep93xx_defconfig  | 1 -
>  arch/arm/configs/mmp2_defconfig    | 1 -
>  arch/arm/configs/mv78xx0_defconfig | 1 -
>  5 files changed, 5 deletions(-)
> 
> diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
> index 22b189090e15..0952e5e94c5e 100644
> --- a/arch/arm/configs/axm55xx_defconfig
> +++ b/arch/arm/configs/axm55xx_defconfig
> @@ -195,7 +195,6 @@ CONFIG_PL320_MBOX=y
>  # CONFIG_IOMMU_SUPPORT is not set
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT4_FS=y
> -CONFIG_EXT4_FS=y
>  CONFIG_AUTOFS_FS=y
>  CONFIG_FUSE_FS=y
>  CONFIG_CUSE=y
> diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
> index e98c35df675e..3d978ce34b54 100644
> --- a/arch/arm/configs/dove_defconfig
> +++ b/arch/arm/configs/dove_defconfig
> @@ -97,7 +97,6 @@ CONFIG_MV_XOR=y
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT4_FS=y
>  # CONFIG_EXT4_FS_XATTR is not set
> -CONFIG_EXT4_FS=y
>  CONFIG_ISO9660_FS=y
>  CONFIG_JOLIET=y
>  CONFIG_UDF_FS=m
> diff --git a/arch/arm/configs/ep93xx_defconfig b/arch/arm/configs/ep93xx_defconfig
> index 9f3c7324d1cf..ce41dc8c435c 100644
> --- a/arch/arm/configs/ep93xx_defconfig
> +++ b/arch/arm/configs/ep93xx_defconfig
> @@ -105,7 +105,6 @@ CONFIG_EP93XX_DMA=y
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT4_FS=y
>  # CONFIG_EXT4_FS_XATTR is not set
> -CONFIG_EXT4_FS=y
>  CONFIG_VFAT_FS=y
>  CONFIG_TMPFS=y
>  CONFIG_JFFS2_FS=y
> diff --git a/arch/arm/configs/mmp2_defconfig b/arch/arm/configs/mmp2_defconfig
> index a9a212abfd69..0ea608c75f22 100644
> --- a/arch/arm/configs/mmp2_defconfig
> +++ b/arch/arm/configs/mmp2_defconfig
> @@ -54,7 +54,6 @@ CONFIG_RTC_DRV_MAX8925=y
>  # CONFIG_RESET_CONTROLLER is not set
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT4_FS=y
> -CONFIG_EXT4_FS=y
>  # CONFIG_DNOTIFY is not set
>  CONFIG_MSDOS_FS=y
>  CONFIG_FAT_DEFAULT_CODEPAGE=437
> diff --git a/arch/arm/configs/mv78xx0_defconfig b/arch/arm/configs/mv78xx0_defconfig
> index d3a26efe766c..c6b46141cb69 100644
> --- a/arch/arm/configs/mv78xx0_defconfig
> +++ b/arch/arm/configs/mv78xx0_defconfig
> @@ -93,7 +93,6 @@ CONFIG_RTC_DRV_M41T80=y
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT4_FS=y
>  # CONFIG_EXT4_FS_XATTR is not set
> -CONFIG_EXT4_FS=m
>  CONFIG_ISO9660_FS=m
>  CONFIG_JOLIET=y
>  CONFIG_UDF_FS=m
> -- 
> 2.53.0
> 
>

Hi Krzysztof,

LGTM.
Though I wonder which compiler did you use and how did you encounter
the warning? on what system if you may share with us?

Reviewed-by: Richard Cheng <icheng@nvidia.com>

Best regards,
Richard Cheng. 

