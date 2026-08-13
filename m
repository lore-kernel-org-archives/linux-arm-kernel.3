Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B84C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WxECHrk5N+6VKRjb6JwANtWNbMJTOEoyGwahKsJUuKg=; b=xDgWWixFwdWjQG8/vyHNIksJPl
	om/dlACHyGtt9y+2WzzB9+fy6U8rJhH9P3XwcBl53mQjVDbWhYkY97iYKU/7HCwkOonI81PxOUpAt
	eBdKpUsk/90UhAnI9Ij9xEoYUrmPZP2SxPj2xuL1emBGqNc/utt4OuZwkzAEo5b6/FGx+wYE+H/Ae
	bIS9fO15A6P0rmPGRCDrXgMUqoKRJbpbwriaFlletoKIHmy2LccSpZmZeNuYLfYFuLM6VAAc40T/Q
	zDGuh8vJ2nQzohuLC+KWylK/05eeIDocMknDJDjQX6NNQkqtpmhU10QdesnCAMWe5NZvW3DlYeNtU
	GWYwAiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPMl-0000000HY2i-1jcp;
	Thu, 13 Aug 2026 06:56:39 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPMh-0000000HY21-1beF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:56:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmfTbRucYs5udGbdHs9T9Itx439gwzvNqQ9NsJA5M1Bv0ZPwTKRol3E3EiW/CZ8ApyQSOaCcfaQ55iVHglmnu3C1GqBmP5bIEinokS5GATfeijDakiLNyulp6DdT8LbwvztpJ9rNQ4wYbOyyuscI+lu+N60xMVE/f98v7Zkmz407NFJJpQ2jBR42TzmZxkXEEAr7RMubq1cXv1oTqxrwGGHbb2U4uRU5XreHWJPZRwfrL89UgPUSRC4jly5JKtGgUf/Dn97Mni9jX+Ing+M/X+4c3s6M2/PdUmWpnU3svIQHgUcqf3ZsDln2jCh+zY5iirdYZVJ3yG/d5wfPFPl+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxECHrk5N+6VKRjb6JwANtWNbMJTOEoyGwahKsJUuKg=;
 b=pC9xsajfC8On4C4IEVFyppqnnReKtWfyEuttpACAkUd9ytdi5G+uXfCGat0yRgmApZPRhL/Loc3PTsgmrVuHsE8ySF1J8vXvI8mv9cRy1xV+W+aJvjJVhK2mYxuy6pgKqgc9k1KCwTh734fv/MBCJnrg+0jd1q9NcBDCp6pLp33/8umesQM+CB62P5nvz4R04v8sdz5mTXZPq5PS1eYPbuuNRKvLS2/DnzJ3dQgUTpQG/6pa2O7AnM92PC+9cDRg1p+8SWr5HnnavZ562dAn0ScosQ7fyiSYszpwLHzX1LYJTtMJufEVaZhazmI9TajWiLPxmmu4LL+mtLxV9qoTOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0131.apcprd02.prod.outlook.com (2603:1096:4:188::6) by
 KL1PR06MB6988.apcprd06.prod.outlook.com (2603:1096:820:11b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 06:56:00 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:4:188:cafe::84) by SG2PR02CA0131.outlook.office365.com
 (2603:1096:4:188::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 06:55:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 06:55:58 +0000
Received: from gchen (unknown [172.20.64.84])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 868CE427CEEC;
	Thu, 13 Aug 2026 14:55:57 +0800 (CST)
Date: Thu, 13 Aug 2026 06:55:56 +0000
From: Guomin chen <guomin.chen@cixtech.com>
To: kr494167@gmail.com
Cc: jassisinghbrar@gmail.com, gary.yang@cixtech.com,
	fugang.duan@cixtech.com, cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: Re: [PATCH v2 2/2] mailbox: cix: fix DT property name string typo
 and use dev_err_probe()
Message-ID: <an1qfDuK4J1MAOXE@gchen>
References: <20260812084742.22081-1-kr494167@gmail.com>
 <20260812100623.36939-1-kr494167@gmail.com>
 <20260812100623.36939-2-kr494167@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812100623.36939-2-kr494167@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|KL1PR06MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 2162a8ea-c579-4ee0-8705-08def907ee43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|22082099003|18002099003|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: E+n9jGpOW7hthR8fEO1NPH3FvhR/c2l6pC2dm3NThF+ladB0cRrRnvMWdnpYuDNCqkSNSRqga66FqVakAXdCQGCcfDibrVj8uLgIfiWC0NHT6JMRjwHgzGWulZs/Mk4j/rnqlQBcRU9RhQCxQecFO2n2YMk4aZQgf7DaAZFaPeoVyWpgAzlvDTBsY3Nj7QtBFtU2dMMmaDbWYsQT4bmiN2DxLOkkD8z7sokPPA1RKtQQR+7JV8IeHtQ7dkaI2ZHWXcRZW/fGDloYX/R2UZtkAnwO+GpdQLoV1GWUaOVx2ZffBpDq3CuKBGKzUtQOVvbZi4b4eqkcfX8L9G9+Q1RA/5d/YQ9oCVsPBJ0BxAGfIa/JXp61ZybSODmUnjSuXIGrMqrmaO8Eun76IQwUbVD8HJuU2i9WDd8mcFZaqPNkddgq0BtNk0YyU0n80ICdeAnH7kBgQqlDuCkJAL7Ps6jSxPW72od82lqh5F1nUMkfXXN/gpENTMJnEyXOcjJmrklfAQPu5pN568rl0kjhaoyPybjWDADekjVf+bhzKsyy0ZuQADi8/H0HKYxAWCD8wcqIviCB0mpxzw44SZymHGoHCfwW1milJ3VbBJ1H0RrTJHMc5Rab6UnzaB8/4HQ82k1cyOUMiW1sKV9HK/B7xsM0J8/n2//BeTO/OGejT5deWnbolQiIXoug2FRZ9ylqiVwC
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Jbd2an9U8rwbZyJEOqlxeNqUTxk1O8kI6Y4ZGKxh52wPfXLHcvHAG6GHLEvO1/m7nYZavX4J5i918PnUNyrjpQQ4zVg066YZOLgqW6oZ0OMK4ddPRNU3X9yozPoAsEraTQKI4NbbtXuUFqu0i66/SyfHbrF63BJ559KzkRO4lTxpXaikV+8Xn7Y/yHko64Ruu8OcJJ9NpIeVsvuS6T/tBOxXrj0dJNh6KoqF/8i1t6rKY9+BSGzWuEqZ/f5RnN4fPbdzTkE7u/4arRynOp7ag1yOZ2hG6Df4FxhA9RtbMuG64GmeWM3YffUSVuyU/7rJWzhE2Ly52IfQUpj02KR0yqie6rvbUGbUQ5iurXXQLFMHQb+4PLPVdjsxfiCZ7TQmxJ7kSmIE7S9nt1scwpKcGNfpH0euD+cKHBEHG6TPpMpN8e3eYJXU4ubVr4dB+z31
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 06:55:58.8430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2162a8ea-c579-4ee0-8705-08def907ee43
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6988
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_235635_428501_72688752 
X-CRM114-Status: GOOD (  19.14  )
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

On Wed, Aug 12, 2026 at 03:36:23PM +0530, kr494167@gmail.com wrote:
> [Some people who received this message don't often get email from kr494167@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL
> 
> From: Surendra Singh Chouhan <kr494167@gmail.com>
> 
> cix_mbox_probe() logged property error messages referencing
> "cix,mbox_dir" (with an underscore) instead of the actual DT property
> string "cix,mbox-dir".
> 
> Fix the DT property string in error log messages and convert probe error
> paths to dev_err_probe().
> 
> Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
> ---
>  drivers/mailbox/cix-mailbox.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
> index 615218c69eeb..fb5d7641ba90 100644
> --- a/drivers/mailbox/cix-mailbox.c
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -585,19 +585,15 @@ static int cix_mbox_probe(struct platform_device *pdev)
>         if (priv->irq < 0)
>                 return priv->irq;
> 
> -       if (device_property_read_string(dev, "cix,mbox-dir", &dir_str)) {
> -               dev_err(priv->dev, "cix,mbox_dir property not found\n");
> -               return -EINVAL;
> -       }
> +       if (device_property_read_string(dev, "cix,mbox-dir", &dir_str))
> +               return dev_err_probe(dev, -EINVAL, "cix,mbox-dir property not found\n");
> 
>         if (!strcmp(dir_str, "tx"))
>                 priv->dir = 0;
>         else if (!strcmp(dir_str, "rx"))
>                 priv->dir = 1;
> -       else {
> -               dev_err(priv->dev, "cix,mbox_dir=%s is not expected\n", dir_str);
> -               return -EINVAL;
> -       }
> +       else
> +               return dev_err_probe(dev, -EINVAL, "cix,mbox-dir=%s is not expected\n", dir_str);
> 
>         cix_mbox_init(priv);
> 
> @@ -611,9 +607,9 @@ static int cix_mbox_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, priv);
>         ret = devm_mbox_controller_register(dev, &priv->mbox);
>         if (ret)
> -               dev_err(dev, "Failed to register mailbox %d\n", ret);
> +               return dev_err_probe(dev, ret, "Failed to register mailbox\n");
> 
> -       return ret;
> +       return 0;
>  }
>
Reviewed-by: Guomin Chen <Guomin.Chen@cixtech.com>

Best regards,
Guomin Chen

