Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA987C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXFH5SvODk3cyu1YtEnV+U92tBI0dC0b7MaCasDnw3U=; b=3GkySNZoHnTf5VHZ/6xyF/nm5k
	xd1iXfaZuj2mmdm/nEiZXTlJlUVHybUYFA3fXtQFLdSqZ/Ac8hJc2o3pbb+DUKTs1YdE4wqWwEXWO
	UdZfV2ZJnCcQt9W//pIlrySgEkulcb4gYmy0OAHK4yaMKzzD2nJfQLUjlu1DkdICoSMbHDxrnwwrI
	R81HAuzlBE3a37CvHWe1t44hMp8BLkSu+SyEWHSh0Xk5NxifPHA6Dupkv1KVDDaqh/lm6u15E2Ca7
	PXkG88uGcxXjwVNJiCFfWiz8bXadI8AAYx998qJwuV3mTcgaL/3EYoNIQzZhsMx2+FLEA5DD/3tFG
	5kJw2PNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeQE-00000001lIi-2827;
	Fri, 17 Jul 2026 08:59:54 +0000
Received: from mail-westeuropeazon11010065.outbound.protection.outlook.com ([52.101.69.65] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkeQC-00000001lHg-1vzU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:59:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5iiOJflQUqMZWlbG5xW0cldwYlasZEbYRfVFy8zIksuz9mVGQzbYc9tF7mL2kUFt01JSSh1IM8ZGbD5NL3CWnkZhNWxegkkEDzsoSaU82xRWuh/rRie64+z5QBqQjgNau81S87igShxIQlsR0F/EJGwNcaE11Wsy6d21Xuas6+bjwyAndEfUwLC2S75xBYrSXAGLrP8DYlCVs9Qd7uPAK/VWEdHEOuvajzVpFc3PhMaDFFbVFk9NDpoUYXao93+hgZlXhDmTA8zJzFTzRils5ozZ5B3Qt4IQRZKQtLe1olYYHVIMwaPK+pdTBmBQpbvwiSChj5xyzv7JM8lU7IPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXFH5SvODk3cyu1YtEnV+U92tBI0dC0b7MaCasDnw3U=;
 b=b1AQA+Xm9G0qXU8P5q6dZm3UnhjpxNT78E9Wb4DRhyDxBzarXuGb6GC6DyE7W7jfCQc+JYeRp0TOuvZxNHPfcba6EKM9aj7HlsUszIv+95mJQBaBz3PTiLmwUPXVqFawETSc/Xz5k9BoUqdi2khNmj4wfFSf0YvTeQ6MOTA402ucqIryJ0PEh8XfvGNCR8xuELIPEHtmdZ7gC3QvVLbrx+qEV/aYBvWlMjdpms6/GnZykp1pvEh1cZH71AeQtrEaiSKibPzOm7C/4465mXhYHdNmfbyi0ozYa7/xK3Hbel5mHoTmjwyGH8vwsowc3gPFowjvQACzmXtPQwNI718ELg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vivo.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXFH5SvODk3cyu1YtEnV+U92tBI0dC0b7MaCasDnw3U=;
 b=Q2HhLny1rn0T8UH0URBHtHPXCTiwaaFyw641kLlU9x4bCMqC/Dga55mj3Jv1PZqvJTwcK+B1NL3CnPmB4cKZrRJIxl+S1o+EFcGUAjJTg+wMZgtNs5xLnGl5MgtivUOA94BGLrlDE4aujvN/4spC8opV+DtkqWcKasxceKiddWphUI1IFICRq/H3/NeVY7Txg7iOfoZ4zFTxT+hR6BkRWQ/PPoJwRFTR9+eUKiNUq4dkjijEFMHC40qB5TpVEZHyo5+NpP2DUk1OYFfHk4znRvyZt9Bo5e+Jm84wkCJcOf4t/RZkAd1IkIIV3X3s54KqOTnTzMis5WIhfyxLd6vYkg==
Received: from AM9P195CA0023.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::28)
 by AS4PR10MB6331.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:51f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 08:59:45 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::9) by AM9P195CA0023.outlook.office365.com
 (2603:10a6:20b:21f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Fri,
 17 Jul 2026 08:59:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 08:59:45 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 11:04:20 +0200
Received: from [10.48.86.103] (10.48.86.103) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 10:59:44 +0200
Message-ID: <d3e98c59-8aba-46c3-a835-5c46e12a6bbc@foss.st.com>
Date: Fri, 17 Jul 2026 10:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] crypto: stm32 - Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kees Cook <kees@kernel.org>, Thorsten Blum <thorsten.blum@linux.dev>, "Sakari
 Ailus" <sakari.ailus@linux.intel.com>, Colin Ian King
	<colin.i.king@gmail.com>, "open list:CRYPTO API"
	<linux-crypto@vger.kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
	<linux-stm32@st-md-mailman.stormreply.com>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>
References: <20260717080045.191538-1-panchuang@vivo.com>
 <20260717080045.191538-13-panchuang@vivo.com>
Content-Language: en-US
From: Maxime MERE <maxime.mere@foss.st.com>
In-Reply-To: <20260717080045.191538-13-panchuang@vivo.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A792:EE_|AS4PR10MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 01b340e5-7b78-41ec-57c1-08dee3e1bfc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|1800799024|36860700016|18002099003|22082099003|4143699003|10067099003|11063799006|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info: y83VztCV8cREOYRFM8BWFA/GRI1niJ45pmRdIEnnmV8UetfceAhnhKt1lNJUMntrqtf2cCdPUZRvO+I8WEIovWEvoWeuaBVsPh1/MGnfrPHv24TRH8Ok5o6M9obHQZdbr9k0i3ZWQ6L84WGxIB9LCnJ/7ev+Hobsc4HoBZwRWv26dV6xS8QcCCu7hoZVTURA9JT/zh7aLErg/UIgx4PJ0gTMo8uLFcPeYsROBhqFhi6Y3dHeyeZD6pbO5+4PJiaTh6D3wBxmEprpsIdGgfQREnvTXJ6S6MGCG+8HBCVYQ3VH2Ax1h1rMqX34yDZAMMIWT2+YZ6tAqiJ3ANaF5ZmhwqmqaZ5UbgEtG6Y62vwK1rCOnGgynMOJhczadKSaOpiXqMF5jaxd5Fp47gdkBjjFYru6b2wnAbCDSkoCnjq9JYbjgMwE65N+JmMrm9nIxvQOX2bcpR4CsMTs9uJN7jSBeifAqk4H/b5B3ouJPamdPisRXzNgiqQ5beYo71aQZ/zmeuRu98714ZReLUjA7wCg8XeRq69h9s73H3BL41+tFLVjhADA2hr+yNsTY1nN+g3qBdui4tfBc1DsEMJ0IAJyPIY3k9dwCBJuAOVkYdIUbvbW/QCcITzZ5DMd2YuMTSO3pBFoFtzGzGtdTJu6WrXoOkI9z151T/NcuBGs/Ku1mt1/dohX/flG6Q9s9WkNIG7G5DszdfKfvfND9KIFaTEPhU/PcVXQKpWV+OSnbi0f3JzoffNSSGrpIH1RoN9c+VC3
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(1800799024)(36860700016)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rd1PbDwCLCkN7ao72wcMXueEbYi8ZEQ21qc2WSwhNjxIdABctUqSGFpCu2417TTw06SIkyKtFDCoXqYBcCanbdNcKOJwzyFBm5ddcjQcFMI/dFJMQYt26nY3x0dkKt+8aP6Xelk0YQDRjTUwTCaUA+ftHZQbvavv1XNwQ350XwTHX2u+bYyrQuJoqzAjyILzz9JjqUqr8vXTzSBAG8dwjTdHOb5MdjBq+Ex+blluiPOOcB84O3dlBteNuQzOaM8xBaHBNpMJRZ/Q/h2/XMDdp68fr4RcSij61AxS37R8con2VSNb+GoBPBJtncVHMwrqqBIgF+8NdmdzA7HnngORgeW5K1BFJQsBiraWUfZALe4EjCokGuM8nsx0W65lVjDF2Gr2hfhOiAIc9DBZ/zyA8JTtbZiXBUmC6JxWFney9v78Z/1lzJlQEl8fvaAPW5eE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 08:59:45.7186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b340e5-7b78-41ec-57c1-08dee3e1bfc9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_015952_722323_6A0EDA38 
X-CRM114-Status: GOOD (  12.08  )
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

Acked-by: Maxime Méré <maxime.mere@foss.st.com>

On 7/17/26 10:00, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>   drivers/crypto/stm32/stm32-cryp.c | 4 +---
>   drivers/crypto/stm32/stm32-hash.c | 4 +---
>   2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
> index b79877099942..3fc2db290b0f 100644
> --- a/drivers/crypto/stm32/stm32-cryp.c
> +++ b/drivers/crypto/stm32/stm32-cryp.c
> @@ -2590,10 +2590,8 @@ static int stm32_cryp_probe(struct platform_device *pdev)
>   	ret = devm_request_threaded_irq(dev, irq, stm32_cryp_irq,
>   					stm32_cryp_irq_thread, IRQF_ONESHOT,
>   					dev_name(dev), cryp);
> -	if (ret) {
> -		dev_err(dev, "Cannot grab IRQ\n");
> +	if (ret)
>   		return ret;
> -	}
>   
>   	cryp->clk = devm_clk_get(dev, NULL);
>   	if (IS_ERR(cryp->clk)) {
> diff --git a/drivers/crypto/stm32/stm32-hash.c b/drivers/crypto/stm32/stm32-hash.c
> index dada5951082c..e6a1e9b9f88d 100644
> --- a/drivers/crypto/stm32/stm32-hash.c
> +++ b/drivers/crypto/stm32/stm32-hash.c
> @@ -2356,10 +2356,8 @@ static int stm32_hash_probe(struct platform_device *pdev)
>   						stm32_hash_irq_thread,
>   						IRQF_ONESHOT,
>   						dev_name(dev), hdev);
> -		if (ret) {
> -			dev_err(dev, "Cannot grab IRQ\n");
> +		if (ret)
>   			return ret;
> -		}
>   	} else {
>   		dev_info(dev, "No IRQ, use polling mode\n");
>   		hdev->polled = true;


