Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93980C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 22:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MegudreLF4P4UxiHFKInsgrL02fKI45n+JKQKOhiHg8=; b=VSdB5dFTY6tISxS0KUFo8SvFn0
	TbTjtlMGgVWPq0yTTj/7nI8r6HeD+mHxbfWcKCs1J8mk8+sizr0k+Vs/pRv00LGKWaf10P6hTHOqX
	90urSzIc7dEojmZBSMAT5FJrxHUmWZ7pTCcHK/KRAbHMNXB+4KNa875LOlHgvZrIQcNOVLywtDZGc
	EFRQ52qJbR4b4R7WusWmThE0DsQmzWqrTpqrZbNovT4+IBq76ihnK5ja/rE2DSrlhs657Gznx1mW5
	d94e5jXawXOAszTx4RjhViIGBpbv/avTyvRaslFhCGFA7zL69tMpfWTjVf4luty2Wu3YeOSMCA+E3
	tilZtSjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJjV-0000000CNOT-2AoG;
	Thu, 06 Mar 2025 22:30:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqJht-0000000CNEx-0Bbf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 22:28:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 71E5A5C5A92;
	Thu,  6 Mar 2025 22:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAC2C4CEE0;
	Thu,  6 Mar 2025 22:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741300123;
	bh=2ABLlxIoMSQNDKV1phjvCwSi0BkSICv6/GcMMhHQews=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HXrYt4Jr8Ujw+I6ULk6lGN2aJq67C6kOW7bkoi+HYdokVxAaUNiqBmlKFwKMIrUzV
	 /r+awFkHB42epS4kjHahTJMSz8SCh5iVUfVp7FUF05c4R3e9WFYlvMcQd6pvb/PIRG
	 RPh6M60eNx8EDbdYyajwTtECC9oIg1VLkSS2sAtzN1NhfrH6nFqXSNLOwz3GkCZA6+
	 KBsYqC6pbbEcQeaiauNhnDRWjLY/616Ldj2jYEknJuPovaqTvDRBAhnxlU1dt3Clii
	 EjJjm2Sm/NmPQXdT+3s2pzy3QpcISUN6EqKKfSGJqwg5Ac6K0ooKjpz/lAeLt3vPaX
	 XCTRScQhSUdUA==
Date: Thu, 6 Mar 2025 14:28:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 net-next 01/13] net: enetc: add initial netc-lib
 driver to support NTMP
Message-ID: <20250306142842.476db52c@kernel.org>
In-Reply-To: <20250304072201.1332603-2-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
	<20250304072201.1332603-2-wei.fang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_142845_129384_BDCDC2C7 
X-CRM114-Status: GOOD (  11.29  )
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

On Tue,  4 Mar 2025 15:21:49 +0800 Wei Fang wrote:
> +config NXP_NETC_LIB
> +	tristate "NETC Library"

Remove the string after "tristate", the user should not be prompted
to make a choice for this, since the consumers "select" this config
directly.

> +	help
> +	  This module provides common functionalities for both ENETC and NETC
> +	  Switch, such as NETC Table Management Protocol (NTMP) 2.0, common tc
> +	  flower and debugfs interfaces and so on.
> +
> +	  If compiled as module (M), the module name is nxp-netc-lib.

Not sure if the help makes sense for an invisible symbol either.

>  config FSL_ENETC
>  	tristate "ENETC PF driver"
>  	depends on PCI_MSI
> @@ -40,6 +50,7 @@ config NXP_ENETC4
>  	select FSL_ENETC_CORE
>  	select FSL_ENETC_MDIO
>  	select NXP_ENETC_PF_COMMON
> +	select NXP_NETC_LIB
>  	select PHYLINK
>  	select DIMLIB
>  	help

> +#pragma pack(1)

please don't blindly pack all structs, only if they are misaligned 
or will otherwise have holes.

> +#if IS_ENABLED(CONFIG_NXP_NETC_LIB)

why the ifdef, all callers select the config option


