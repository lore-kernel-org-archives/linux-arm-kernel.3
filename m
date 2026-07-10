Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ACBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q123QoOtuneX/oesgcyDM0A+KMYh7x9I9raMVWLdj5w=; b=C3/D3p+XFJxfA0GqbRze3isdxr
	vsSf9hwGjQSasbEPSUDBcOXHViL41Z9MeFpfCHpc763gwceN4l/Cw7C39atVnhvICLRNP5sTftHpG
	bx7UqtXTBn2Ddy2GVWSFZzH1Cel7KgEb7xjZ/ffB2UaoS6UtxtP74BhRicKAAGKiwM646Yza1Wx5y
	eGrjnyTQ05hBtz7JhuZbJ58zn+picT2Z6znkcimAErmf5WANIGeHTyTcXROzR352Ci19pkNj2pWSJ
	H9Zml1cqEAsE7dUxqCnwlAIev++L0D07fV8wVVmlTRwnC0MvHi5GfRNJo74BHip71BZprskkzKVsa
	46ZBdp5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Ad-00000004fMa-1Vad;
	Fri, 10 Jul 2026 10:09:23 +0000
Received: from mail-westcentralusazon11013033.outbound.protection.outlook.com ([40.93.201.33] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Aa-00000004fLB-2rC5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:09:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fotw69kCo85LLQHZnOv8Nu5LDK2SmWYTjhICQBDf/6U4uescrVkgO0/mDZmB+qkboUAxAmFXvpn//r6ENhKPkDEuVjBlmShs+qg6/RwDtlz4+TqtU8wbkhoq3un6pPnlJA2D7pagcqiQaf0VEe9ZqqeV+10Re4OkZn8PYMRr57KDh6uGR6C0zhyY0+/DM0/COkza/u/ZIYacJNWfucZFe1s/rMXHc90jp1UyoOPlVeIVpLWKG0E2MsD9w3it7pMugqfGKFGhLI1x0BQGtVChxo5jeXOzlFdAWfFUMd9kyHBss/CMqlGfEvGeUWwp7uwX/thhoT7RIQbe8N1YOZTRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q123QoOtuneX/oesgcyDM0A+KMYh7x9I9raMVWLdj5w=;
 b=EvC1IERqze+gIS/zWCqPzI23viGp2FMIT7OPMbeM6MwOH2tCDgWOM13NJZd5yRQp/911vOJgBX66+mFrvqCELwXOW5F49Na4RUndDmpbAVCAFN710KhdxiFXq4CIxwx0DPvWBNunfSDmSe1vwJIDvx2GsYSsLR0H+FzSTfzy8bSdh/zterQLltBS+njCY+aPyqfVuO0rFjmmVh/IBKWNYJeJmfrEyxSXWeX0aIuuxc4CgIznUdbv4ztPjql1X0m3dqF34PzVm9mmUicLlLjdyp2SzrJswpeswzccj3rX5tTfQP+zj17zJRlAXBH5qNvwYJuIgQSs8lbjeXNnBbTdEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q123QoOtuneX/oesgcyDM0A+KMYh7x9I9raMVWLdj5w=;
 b=NLS5VsZlqjBM6DfUcthwjruNcgzlWKtslIX8xA6SPebZO+cp8oH9SqzF87GV91xp3pAkIW8+Z9cIr0/XTigPEh2DC51Eb2vTcPb9zDyzZZ/eP2QzrgEprK5TzJbQ2rsEnZalmPQTvRI/sHDwt2vGdRoCx/aEn8wFJnsA2ZBnZLAs4EgQ4Rt8nU4KyVakj9F4gC2e9vKCVj5bTk6z3jglHNQQNWqA3Nro5oT7A7NIfnCD/nlWQAWxE53SNB8PsfcZVaJgbm4VI4JVeKkB5ASj0/WtaHyqWHQRultcz2cp9usW805Z1qFpRhUNw14mhWONgH9x/xm1a8s4AETy9lpeLA==
Received: from MN2PR01CA0041.prod.exchangelabs.com (2603:10b6:208:23f::10) by
 MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 10:09:11 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:23f:cafe::6f) by MN2PR01CA0041.outlook.office365.com
 (2603:10b6:208:23f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Fri,
 10 Jul 2026 10:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 10:09:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 03:08:57 -0700
Received: from 82875d6-lcedt.nvidia.com (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 10 Jul 2026 03:08:56 -0700
From: Nirmoy Das <nirmoyd@nvidia.com>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 3/8] firmware: smccc: lfa: Add timeout and trigger watchdog
Date: Fri, 10 Jul 2026 03:08:07 -0700
Message-ID: <20260710100830.65336-1-nirmoyd@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706134455.132091-4-andre.przywara@arm.com>
References: <20260706134455.132091-1-andre.przywara@arm.com> <20260706134455.132091-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5b74f0-527e-4d7c-0b75-08dede6b49b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|22082099003|18002099003|11063799006|6133799003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: yInrbOfY0X+pP657bnPR2Oe3IuWPVyLUiCsbZxWxXKPKwfk+up1RtUMgDsuJt853cteXV/9AIol8DoXkD636s/MzOl9voscTFIrJPyJszdrWB3m9eKS/yhK+2q9+9+XhUFDVF2IKe339VhP1wu93G69gcbyYO5XPAzBMed2vB+dJLvyy7XDPGIQStGpDwXwbjJP8zIEdXiBCB8kBNY4dLjWycc+oWpJJOKhlvhAnK2hY+WKRubI+4BNG91+gD20h6oVVluW9w7sBgw5a1inZg1lLI3mtOApsO5SXox84FF2f1uGfjPjkwkEPsrMRg7bbDxaecSMQTu8b7ZyS/xJaWQG+x4v9RKI2p5jyyS7hKrKcQZAPhllbIMNe6XW+HaKj+r6pajJwaGrNuCzj/QsnQ6vIpqSbXUPh9qgiqONEWOSGOdmdHNQic7jgcBwhxJLgs3d0/6zZcL0W4GiMbabXZv4exLhfQNhD/qBaYSQVfswjcwzzUHGPHaaW/f2tcTvF2nUkbsrCIAy/D6PyIuow9fQB+NTHoiONiQ2HO2vNNAmIGcnEI6GI+PycbO5rlMqhwifkOsUVJ0EXNrAEjKpAK2rd858mjoQwldxi7wAuMoLL7koRvXJK/o6ZuitzNNO4bchYY55VjIUwIJmET/hOlm/zfKK5n44FXmQR64oxAsKwiDYhKaBUmaI8bx2S3k8cATDDZYU/59+6Q399CN9r/Q==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(11063799006)(6133799003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AEQonKOYZ8pDIGz+uam3FeoBoFnXlGNZ80VSr7JjiGGfxVMfg3AMCAQeyAp6YVmbR1JIvRHZT0f56JSIEISL/d8VZyLOejWXCY1eKl6yYO+TB3LDjtiIGdFwJ6xLOqK1wsz+clxgakUTtO8aKNLePouLrebdhHS4Zkwr1lzuR+eNOzkbHjvvQRfJO9vVjWSuadND6YbmOQF0vKM0lJdHUHjhvq39bAibCVlwnlcGpRTOOegZTf0AbV1Y06Hi45WIYBIVLbBfD6uy6HVRknw8pIDkxJ0/IokhHe+vp8yqmrHo+KoOv8OM90RTlOonTanXOP6rU5hR7iXm74tDe4fAO+RL7+bgsuJAXQXtw5w/QpkXTwKvGr8fzOMVG2ztauzdgrXqAhkkCR031F2KR2I/sBUXE61VKZIA9aA6PhyOKtSGEtByE1375IB8fNKbWCRF
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 10:09:11.0443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5b74f0-527e-4d7c-0b75-08dede6b49b1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_030921_141184_2B74D7C4 
X-CRM114-Status: GOOD (  23.72  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Sudeep Holla <sudeep.holla@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 6 Jul 2026 15:44:43 +0200, Andre Przywara wrote:

Hi Andre,

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
>  drivers/firmware/smccc/lfa_fw.c | 43 ++++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index b333b1e28c0d..357e41f95206 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -6,11 +6,14 @@
>  #include <linux/arm-smccc.h>
>  #include <linux/arm-smccc-bus.h>
>  #include <linux/array_size.h>
> +#include <linux/delay.h>
>  #include <linux/fs.h>
>  #include <linux/init.h>
>  #include <linux/kobject.h>
> +#include <linux/ktime.h>
>  #include <linux/list.h>
>  #include <linux/module.h>
> +#include <linux/nmi.h>
>  #include <linux/psci.h>
>  #include <linux/stop_machine.h>
>  #include <linux/string.h>
> @@ -27,6 +30,11 @@
>  #define LFA_PRIME_CALL_AGAIN		BIT(0)
>  #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
>  
> +#define LFA_PRIME_BUDGET_MS		30000		/* 30s cap */
> +#define LFA_PRIME_DELAY_MS		10		/* 10ms between polls */
> +#define LFA_ACTIVATE_BUDGET_MS		10000		/* 10s cap */
> +#define LFA_ACTIVATE_DELAY_MS		10		/* 10ms between polls */
> +
>  /* LFA return values */
>  #define LFA_SUCCESS			0
>  #define LFA_NOT_SUPPORTED		1
> @@ -276,6 +284,7 @@ static int call_lfa_activate(void *data)
>  	struct fw_image *image = data;
>  	struct arm_smccc_1_2_regs reg = { 0 }, res;
>  
> +	touch_nmi_watchdog();
>  	reg.a0 = ARM_SMCCC_LFA_ACTIVATE;
>  	reg.a1 = image->fw_seq_id;
>  	/*
> @@ -299,6 +308,7 @@ static int call_lfa_activate(void *data)
>  
>  static int activate_fw_image(struct fw_image *image)
>  {
> +	ktime_t end = ktime_add_ms(ktime_get(), LFA_ACTIVATE_BUDGET_MS);
>  	int ret;
>  
>  retry:
> @@ -314,8 +324,14 @@ static int activate_fw_image(struct fw_image *image)
>  	}
>  
>  	/* SMC returned with call_again flag set, or with LFA_BUSY */
> -	if (ret == -LFA_CALL_AGAIN || ret == -LFA_BUSY)
> -		goto retry;
> +	if (ret == -LFA_CALL_AGAIN || ret == -LFA_BUSY) {
> +		if (ktime_before(ktime_get(), end)) {
> +			msleep_interruptible(LFA_ACTIVATE_DELAY_MS);
> +			goto retry;
> +		}
> +
> +		ret = -LFA_TIMED_OUT;
> +	}

msleep_interruptible()'s return is ignored (here and in the PRIME
loop), so a pending signal can turn this into premature retries.

>  
>  	lfa_cancel(image);
>  
> @@ -328,6 +344,7 @@ static int activate_fw_image(struct fw_image *image)
>  static int prime_fw_image(struct fw_image *image)
>  {
>  	struct arm_smccc_1_2_regs reg = { 0 }, res;
> +	ktime_t end = ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
>  
>  	if (image->may_reset_cpu) {
>  		pr_err("CPU reset not supported by kernel driver\n");
> @@ -335,6 +352,8 @@ static int prime_fw_image(struct fw_image *image)
>  		return -EINVAL;
>  	}
>  
> +	touch_nmi_watchdog();
> +
>  	reg.a0 = ARM_SMCCC_LFA_PRIME;
>  retry:
>  	/*
> @@ -353,8 +372,24 @@ static int prime_fw_image(struct fw_image *image)
>  		return res.a0;
>  	}
>  
> -	if (res.a1 & LFA_PRIME_CALL_AGAIN)
> -		goto retry;
> +	if (res.a1 & LFA_PRIME_CALL_AGAIN) {
> +		int ret;
> +
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
>  	return 0;
>  }
> -- 
> 2.43.0

Regards,
Nirmoy

