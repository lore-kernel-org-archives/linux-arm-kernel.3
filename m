Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91662CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 20:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s+dWXhRvFGeR6TIDCInTT91yDDHNH5ZIv/W2CkqAegk=; b=pdeKlNZXKO94dT
	oc+y/9UMVWVGD6vE7TZrMotAwHSvDCQWmmZunwXT2R9ekdDeacOfYL1F170CXOSyxCGymdoz+1yxc
	RnZZGjhTVMkOQPtizYD21hFhWC/xX9R6qa6voBWVGgz+cUYrwHgF2YRVJdYhDels2uzrwsxLMp4Vp
	QsgKRhFOqNde7yubgH4vpULShyDEll2CnIbz7v7ZADZ9cdgO1d9e/UWf6hnozSN95FDkT2JIhft0q
	rJ/Ubcq7HwvKv52ihA18y3vz/ePbyO654Z2lKVmgVnFBCPQn/XoPXUQ23WgHzwzBi2uI5tHBxyWCz
	hfm/3B/l0KAJflwU8veQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcUVI-00000008L0y-0MMt;
	Wed, 24 Jun 2026 20:47:24 +0000
Received: from mail-northcentralusazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c105::] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcUVE-00000008Kzo-3wCK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 20:47:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4g2rHUm/+N59ibsmsMOn4jd/ia7f2lN83YG7Y1OOvOPlkiygRXJYYwLJEnbmA+3DhwsXdwadPD/fUWJC7EGKFl9ogxEhE6enhGo41X09ba2jjWPoCWRuRJDxEyiRns1j/h7QJHtt4TW2iBxgcdwnSNYomu0i/ZkzcnDGz7YVdowgYlwlkupIkhlLMM76gIVRDot6NuP/SwwWO+ghj1KDLwxuWlLVOW+yGIHzpxnXcHdS2JuqTlBEQx7b50s/Sxy0wmqkPWUomlz02BmgWvHXFVFXW4wsf0plYUTDjhSkSMX2q4AT6le/DwFDPStPpwgeYYS2vH2FGo8YpZIxzw9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+dWXhRvFGeR6TIDCInTT91yDDHNH5ZIv/W2CkqAegk=;
 b=gbFBt6vMKiY0EvTt8PCGTCNfje55aNjoMPCN2RmxHGnM90uTlJdm4FX3/SefCCOPMzZYKK+ztiBOZGJaDyYdOlU1YcdfzFHfQmimJgH6Q8P24iFFm4LAJ3S5WFTni/Ncga9OdpCpMI9Dnf6qfOIhxSDGaUVBCeJqjfd6xubTn6apOb5q9FV+yax3IE6Bgkl8KiI2OC/pJyFXlV6pTQUFRgeM9yNjxVAU/OZ3aAcqLGHcpJDej1Mh0ASBwMez8HLXgxko5AlOs4CIhVg08oUpBKGQE9J0zY8/FMsXumo2khkz/Ed2vE+RXxlhJYhKsyeQNG06isZhq53tTAAmYGux0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+dWXhRvFGeR6TIDCInTT91yDDHNH5ZIv/W2CkqAegk=;
 b=if4aW3TkXQQTbsNLMB3oxhc+8CqWTOlweGrS90j7nJTE8S+HFyq6VooYJ32Evna0hUUc9NYBq1ffNmZ3lOirfq4T+RzrR3xhv66UNo3NLsKboAFWOLAFJB7kVh0Mhsf1HOOvfXtXrC6S5dY2kqin9mdu5NPIK5n9hMQLhiYBjAShU42VXXjZhKdBpCBhtMbx7R3Td63xRmCexTfmZK55Tl2Zi37JKhXVCF5ZFuo0LSKHk5cPR38AjE6MOPQZ83FzaE3YZUAKgJjixxHU3IuG8fKDG5AN8BV3g1jKx/H6BL6CNGhZpm3GAJpBIdnvsbAgzbED/UEOehP5r/EMnL1+5A==
Received: from SJ0PR03CA0179.namprd03.prod.outlook.com (2603:10b6:a03:338::34)
 by PH7PR12MB7186.namprd12.prod.outlook.com (2603:10b6:510:202::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 20:47:12 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::37) by SJ0PR03CA0179.outlook.office365.com
 (2603:10b6:a03:338::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 20:47:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 20:47:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 13:46:52 -0700
Received: from [10.221.135.3] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 13:46:49 -0700
Message-ID: <7c23a6e4-31bc-4803-8c67-63f5d4e94593@nvidia.com>
Date: Wed, 24 Jun 2026 22:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] firmware: smccc: lfa: Add timeout and trigger
 watchdog
To: Andre Przywara <andre.przywara@arm.com>, Mark Rutland
	<mark.rutland@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Sudeep
 Holla" <sudeep.holla@kernel.org>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
 <20260317103336.1273582-5-andre.przywara@arm.com>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <20260317103336.1273582-5-andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|PH7PR12MB7186:EE_
X-MS-Office365-Filtering-Correlation-Id: 3078e8b5-af4b-4a98-9fb9-08ded231c467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|23010399003|6133799003|56012099006|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: dZ0HX/GWWHRKimD9282REvvlQ/q8JlMm8GaySyuIjmjIT4NPu1KIALM1GqMk5w72H3ZQ97ySK5b2mtKzf4mXnFGBMBcJY0KOBRZIYttqGmVvBI/ojhfhtjFhJW9d0pkpCvO3dthTQkkDnMk3zasw1VWrFLCLmITkVf2VeBL89+LPlzYRd6AePKFROdVjlXDYw7nY7dvmPv7YOx949Yj5Z8zQu6b99r/QQNeYHE/QCvNotvgzQ7GJxIH9KZDbez6kkw0oF1/UFJ9/NH5vNu0DipnbuLb1c3l6ZEpJwCayYZK26V58BDEVEbCGG9YMK/zhGHMwz95L5sg6+Xo6maBv9t3y/zHC/r4GVlZImrCYjN40jjpWOIkhVOsXK0HCWcbFMcpbCXlFXdqRIGkM+E98QNpcKgXPJ70XWawyJvCuOQIpI2uJ4ZV6TheF1lZUFw+ayi5BMdc+jEgT4vkOzU1YyD7sGgdiNfpD1Jw92+ZC4Nrjy+r7mGOkBRXYWZDelqeajD6JO15Pe8o7Wrzwc1JkZbiD634UAxulIOshNV2AUyqNZ7V02Z7tW3HUVOOVe4bxTjpJPdBkxibw9J1HJhBHWtIxrWd+FBxIo2aGC+0WX1Wo0YvofpeLYNSFjNjfakBlPlHbPfsETvJ96p3gLJ+Jjw2PUjFYmEuSNuSXprmSuFN0Bg/diAoFZwcHUKazKSOrsYWiYinytzsTRVI7UW8AGA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(6133799003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: b+Plp1J7qtqmZQ42Cyj5EOn0QgWwLZgi/l5TPlBPMHzxtj0FE0IYh3dO3VzBAGGkt/2nmRAX6BkkZt6JN16kX0Z2dL9KCb6kjbeJx8f4eW0SxJMo90rStDUA181tof5gpYilXuLmPRGlhx52WB8tyoqi3oLhgUuy+qKEM9PAYnhso3ikLAKlnSlITr5PkXCJV63T7Gu1/BR6fgiTbIdm71fwUtzeb6Je4qGuT45tRxiWdkJj7YghzJsUuhv8NTuPiYDjA49XugHlITmc1zxUXS0FsmFf1tCk6hhmW01244OYsi5NePmt3CVD1hhD4Urupc/1NFxIs6ha9E6tQb3rir9m+HB+WmB1EfrVQnIRPR0eTfcHoDqZ6iLd4kYFjYjFthqqwsdHFO2un/SzcKa0xg4Pl7pErkBoJYMPxi1SlpgHCUAeF0Kh1bfTtcZFNiCE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:47:12.3140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3078e8b5-af4b-4a98-9fb9-08ded231c467
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_134720_987834_24C8F00A 
X-CRM114-Status: GOOD (  21.17  )
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
Cc: vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Andre, Veda,


On 17.03.26 12:33, Andre Przywara wrote:
> From: Vedashree Vidwans <vvidwans@nvidia.com>
>
> Enhance PRIME/ACTIVATION functions to touch watchdog and implement
> timeout mechanism. This update ensures that any potential hangs are
> detected promptly and that the LFA process is allocated sufficient
> execution time before the watchdog timer expires. These changes improve
> overall system reliability by reducing the risk of undetected process
> stalls and unexpected watchdog resets.
>
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>   drivers/firmware/smccc/lfa_fw.c | 43 ++++++++++++++++++++++++++++++---
>   1 file changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index 4831abf2b60e..d1b5cd29b8a0 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -5,11 +5,14 @@
>   
>   #include <linux/arm-smccc.h>
>   #include <linux/array_size.h>
> +#include <linux/delay.h>
>   #include <linux/fs.h>
>   #include <linux/init.h>
>   #include <linux/kobject.h>
> +#include <linux/ktime.h>
>   #include <linux/list.h>
>   #include <linux/module.h>
> +#include <linux/nmi.h>
>   #include <linux/psci.h>
>   #include <linux/stop_machine.h>
>   #include <linux/string.h>
> @@ -38,6 +41,11 @@
>   #define LFA_PRIME_CALL_AGAIN		BIT(0)
>   #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
>   
> +#define LFA_PRIME_BUDGET_MS		30000		/* 30s cap */
> +#define LFA_PRIME_DELAY_MS		10		/* 10ms between polls */
> +#define LFA_ACTIVATE_BUDGET_MS		10000		/* 10s cap */
> +#define LFA_ACTIVATE_DELAY_MS		10		/* 10ms between polls */
> +
>   /* LFA return values */
>   #define LFA_SUCCESS			0
>   #define LFA_NOT_SUPPORTED		1
> @@ -287,6 +295,7 @@ static int call_lfa_activate(void *data)
>   	struct fw_image *image = data;
>   	struct arm_smccc_1_2_regs reg = { 0 }, res;
>   
> +	touch_nmi_watchdog();
>   	reg.a0 = LFA_1_0_FN_ACTIVATE;
>   	reg.a1 = image->fw_seq_id;
>   	/*
> @@ -310,6 +319,7 @@ static int call_lfa_activate(void *data)
>   
>   static int activate_fw_image(struct fw_image *image)
>   {
> +	ktime_t end = ktime_add_ms(ktime_get(), LFA_ACTIVATE_BUDGET_MS);
>   	int ret;
>   
>   retry:
> @@ -324,8 +334,15 @@ static int activate_fw_image(struct fw_image *image)
>   		return 0;
>   	}
>   
> -	if (ret == -LFA_CALL_AGAIN)
> -		goto retry;
> +	if (ret == -LFA_CALL_AGAIN) {
> +		/* SMC returned with call_again flag set */
> +		if (ktime_before(ktime_get(), end)) {
> +			msleep_interruptible(LFA_ACTIVATE_DELAY_MS);
> +			goto retry;
> +		}
> +
> +		ret = -LFA_TIMED_OUT;
> +	}
>   
>   	lfa_cancel(image);
Correct me if I am wrong here

DEN0147 2.6.6: LFA_ACTIVATE can return LFA_BUSY ("activation postponed 
... prime status not changed"), i.e. retriable like CALL_AGAIN. So we need:
       if (ret == -LFA_BUSY) {
           if (ktime_before(ktime_get(), end)) {
               msleep_interruptible(LFA_ACTIVATE_DELAY_MS);
               goto retry;
           }
           ret = -LFA_TIMED_OUT;

       }

Regards,

Nirmoy


>   
> @@ -338,6 +355,8 @@ static int activate_fw_image(struct fw_image *image)
>   static int prime_fw_image(struct fw_image *image)
>   {
>   	struct arm_smccc_1_2_regs reg = { 0 }, res;
> +	ktime_t end = ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
> +	int ret;
>   
>   	if (image->may_reset_cpu) {
>   		pr_err("CPU reset not supported by kernel driver\n");
> @@ -345,6 +364,8 @@ static int prime_fw_image(struct fw_image *image)
>   		return -EINVAL;
>   	}
>   
> +	touch_nmi_watchdog();
> +
>   	reg.a0 = LFA_1_0_FN_PRIME;
>   retry:
>   	/*
> @@ -363,8 +384,22 @@ static int prime_fw_image(struct fw_image *image)
>   		return res.a0;
>   	}
>   
> -	if (res.a1 & LFA_PRIME_CALL_AGAIN)
> -		goto retry;
> +	if (res.a1 & LFA_PRIME_CALL_AGAIN) {
> +		/* SMC returned with call_again flag set */
> +		if (ktime_before(ktime_get(), end)) {
> +			msleep_interruptible(LFA_PRIME_DELAY_MS);
> +			goto retry;
> +		}
> +
> +		pr_err("LFA_PRIME for image %s timed out",
> +		       get_image_name(image));
> +
> +		ret = lfa_cancel(image);
> +		if (ret != 0)
> +			return ret;
> +
> +		return -ETIMEDOUT;
> +	}
>   
>   	return 0;
>   }

