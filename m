Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F8CEA8550
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/1hgza32TVPz/sNytSXnLmuAOi+3mo+VSkd3StI6Aw=; b=RbhFpZeBBxo0s1HPH7HDW5C3mr
	FDOqbRCbdfNXJxFGfapoI34brVsEtEN3A4olzV26oF7Fw5d3KYMaSn8aZf28Nbt+NeF9/tMfaIUCT
	brQSpI3D5iyGFFL4Nabbo7T2dtAUbkE7JUHYKaeHldPe2qEiO2BRRDIgGRE26h4gZTEKeOWN3RSNq
	ZUWASmlio1Vhla1l8nf0ngJZnApgf7NNGvzhrcxF+hJ8TWNkabBIx9I+vKkIXEuK1pFxInDO3zB6I
	QmSmovJsfeyMRjlPGZL4gy8GtVbiLzdSvnXtP50deJwmBKMwP55I7a7vwuMv8iRc7P4Ps5lJ+ZU2e
	XRptxG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsyn-000000091CY-11eb;
	Tue, 10 Mar 2026 09:02:17 +0000
Received: from mail-swedencentralazon11013071.outbound.protection.outlook.com ([52.101.83.71] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsyh-000000091Bh-35qw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:02:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSnhB/8f8qnhR2nOKIYbR9stbU4Xr5AL+bKxD1Ce9M/WuBFQQVtOuy9kP1Z3Y+1Vi7QI+91eDGktoQeGwpOJexWRGxF/3W0hFa+u/nPZIVOX6ICi6cOFCobMV5dl6G3MnpgBhxpSqmtemgbPS8x4t/mOVYvDMk3TsTPt3ZDOLa1Q52XHctYlNaVyDgRHJ1TstRpBzIC0wZKTKbGK2TioGUwPwlfFDyOQg+SKQl1lHr2uH/kolLupHpe8iSlOZ7eOifMygIonF+j/1s0Uu1nhplK8pKiLfcqau9iappmKU2+zq2jMW03oHh9sq0XV1GjF/XKST2zCEFLow4ObzyFlCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/1hgza32TVPz/sNytSXnLmuAOi+3mo+VSkd3StI6Aw=;
 b=c3m5hd+SuNEX/vMzywgnQW3j/osTP3DHiKEbd1Tm87WnohmUMie2Wl7046Dek9IOti0T8XEtaUzUhpqyqI+SyoPAOGRUnkBZ9GEY3sVlpi2ggx6oMMr4dq+BQ9WO6fXp7512WwII9DeFkiW3FFqggVxlNczBnhLdltohs/8qa1SGg/4+9ji9/WH6tld4n8lEFT1vfFv6p2svG2HTc5UR870US7oeJqLB5ltRnqBNbru+4zPJ2CdT0L9SoueXU2YkDKT1xVjOibMx8yjedmkSYdIr8it6n5riJf7R/jgbcOaFxsNqC8VTF00vTOSDkis+fETev5qYHwClywxLauAUjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linux.dev smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/1hgza32TVPz/sNytSXnLmuAOi+3mo+VSkd3StI6Aw=;
 b=jJqpMIwtGCMhblP0EdSeBAo/cL0ukdvzVqAWzyKtYybwo2csXYZzxPrTVQY2XYWcqCT6aJo+wOyw0pOVnYI4iphZqairUcWyRxbUNYIm70iLWALVcph4Ooj8pbF0MMctT67qTIZ80gVeX84yIo/b9pFreXGrOQQDNx8BqSLSuKcoWXNmjgfR9BM5EpC1UdfH7AykrMzZfHvjDflWZIQhyXmZP5iBUHX5lprbkf0PnQbq2aYwaale4ro63ALvD6g2jjY0BeVMyehzf5kVgKBe8+G5+Qks2xKNtqaVyREjK6Ih7C3bmUf2XTCReLoIOAiWyB7y4Ygq/OLmD0NAGcs7Uw==
Received: from DUZPR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::9) by VI0PR10MB8355.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:218::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 09:02:04 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::a2) by DUZPR01CA0134.outlook.office365.com
 (2603:10a6:10:4bc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 09:01:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 10 Mar 2026 09:02:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:04:22 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Mar
 2026 10:01:44 +0100
Message-ID: <86e3d41b-79aa-477c-8cd3-93ce986922a7@foss.st.com>
Date: Tue, 10 Mar 2026 10:01:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] bus: rifsc: Replace snprintf("%s") with strscpy
To: Thorsten Blum <thorsten.blum@linux.dev>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260309223923.84283-3-thorsten.blum@linux.dev>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260309223923.84283-3-thorsten.blum@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|VI0PR10MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: bcabdf46-5281-43ac-1907-08de7e83b2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: HYoW2StWa25R9tBi65aM56R81EWDfg7uLEHmiGVzUrPXacyLg0NSBu0GfG4wFtZws95syHExgCZ0OQRWqP9mFxgHnC61h3aC2nbhbaEekfdepirONEt4JdgYf3GYbwlPW31nUVKWIOn0h+Ne6Cz3CP/EsXiQZ85AeN9Gx6DwvMQPC6yucOjcBPfOlmwBEBr+7OS0s35rtHEuq6g+E24t1Qi+Wcm9VnKppXfOWtjnHuDw9qy4OJfvhL0xQxOInffVJ9dFjXKzJi5cq5VZSYI6uEDD9+TP4/AxqOBvQEmYwpJwiqJwvGySkmd31OiJl6CbWAQegFGsJp+UIGhrRf6+PpV0G00oLKct+T5nOVhPImvNY3GMMMIZ7ENe1NFIdUIWfU3xNT6ha9Yk7CnUB28HkbWw++gYcZAF8/kcDQ0dka3RNX9roHmY0cpqyNiIbP0yAex1ZAOELNTJ3NyLpXxUKyujSomS88hljKdOdJP4XzJBWenwuJzZ8lyqYVz2uvnTgVdHnKcPadw7qBhZW2JOPygCrTjbZoPvqJKC3VjlqRmS2R/mO0VEFsA/AoWrqSvnQ5TB52ChwLKytuGP7beAndH7Uw672VFsQPqXJF6bM3tWyG/b1C/Jxgef73JjF4CAckhByjc6B0nwffh27TFbaiTLJJVIXYMKygba3dPOVYCdcqW5rZfz49KoQYgGEHPvCq/qUs5h0X6CMolEeg+XzEXlAZCyrH9TCjk2bwkUhETpZtpF0ZJd7LU+v2DShyRqxWdU2qZOnHH5Aqzpp3iV5g==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /Dk8NwWlZz2gvGccYsZTGFdmHkxjyrP7+FZiXZ6WQzvpXidhcL9cNevOPWbQMPHvLB6DQMC9j1NT1uQQfmHxjGctbqKXECRvXB0VwbNByOXMogoBz3oMJyP3dGa5bsvRMzfGoVx/l2m8FIp9QU8NNraT4j+lT8GZ2GJgkPxbRu7GwP73ReD88ozstXTMD+GnjD3X0Gi4WKXTQvMQW1s8ecgl8Il6tx2JA72iJsN8b8ES32zDXogb/l9E3LsfF+7VzFRldIa4gGwdfYP8o51XjPUi4GSD0vp8biwxczto1vToGnBqkmF1dXuwCven1Mabd35QMUW0dRlKHM4pxQJ1dW/8Va+6zNtfEck3s/dP8XgTzSSoSBqDTdAn7fokyBEnVAuz48e/8xQsrdiYIDy+InoFVn4KqK6/TgZtDN3lOhbECB03sSlhkG1gv1WzQ4Nv
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 09:02:03.8709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcabdf46-5281-43ac-1907-08de7e83b2dd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_020212_472289_1F42255A 
X-CRM114-Status: GOOD (  11.39  )
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

Hi Thorsten

On 3/9/26 23:39, Thorsten Blum wrote:
> Replace snprintf("%s", ...) with the faster and more direct strscpy().
> 
> Acked-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   drivers/bus/stm32_rifsc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
> index debeaf8ea1bd..ba65ad21434b 100644
> --- a/drivers/bus/stm32_rifsc.c
> +++ b/drivers/bus/stm32_rifsc.c
> @@ -15,6 +15,7 @@
>   #include <linux/of.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> +#include <linux/string.h>
>   #include <linux/types.h>
>   
>   #include "stm32_firewall.h"
> @@ -450,7 +451,7 @@ static void stm32_rifsc_fill_rimu_dbg_entry(struct rifsc_dbg_private *rifsc,
>   	const struct stm32_rifsc_resources_names *dbg_names = rifsc->res_names;
>   	u32 rimc_attr = readl_relaxed(rifsc->mmio + RIFSC_RIMC_ATTR0 + 0x4 * i);
>   
> -	snprintf(dbg_entry->m_name, sizeof(dbg_entry->m_name), "%s", dbg_names->initiator_names[i]);
> +	strscpy(dbg_entry->m_name, dbg_names->initiator_names[i]);
>   	dbg_entry->m_cid = FIELD_GET(RIFSC_RIMC_MCID_MASK, rimc_attr);
>   	dbg_entry->cidsel = rimc_attr & RIFSC_RIMC_CIDSEL;
>   	dbg_entry->m_sec = rimc_attr & RIFSC_RIMC_MSEC;
> @@ -469,8 +470,7 @@ static void stm32_rifsc_fill_dev_dbg_entry(struct rifsc_dbg_private *rifsc,
>   	sec_cfgr = readl_relaxed(rifsc->mmio + RIFSC_RISC_SECCFGR0 + 0x4 * reg_id);
>   	priv_cfgr = readl_relaxed(rifsc->mmio + RIFSC_RISC_PRIVCFGR0 + 0x4 * reg_id);
>   
> -	snprintf(dbg_entry->dev_name, sizeof(dbg_entry->dev_name), "%s",
> -		 dbg_names->device_names[i]);
> +	strscpy(dbg_entry->dev_name, dbg_names->device_names[i]);
>   	dbg_entry->dev_id = i;
>   	dbg_entry->dev_cid_filt_en = cid_cfgr & CIDCFGR_CFEN;
>   	dbg_entry->dev_sem_en = cid_cfgr & CIDCFGR_SEMEN;


Applied on stm32-next.

Thanks.
Alex

