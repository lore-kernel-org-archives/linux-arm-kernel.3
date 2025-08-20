Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7FACA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 01:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WN1kfzyIpAVe/FMizjJXIkfzku5t5FVJkvYnzFGm/c0=; b=eLTSm7THaLU7NUuOHxZ2Mienw4
	61+lc9dR1xAcs+/LWX1NkMEtSrK0uQE+xn1uOkqrg750ZfTqYfenJDcLQ8D7KogUcHlOuSoPWLIiW
	2nR2c36kAIgRwzPyGVm43RVxftMqklhrwZaf4ZvCr3nTe+9Msdo6hgUAMwzPuxi0fgEQeOYED4fzi
	OF8Jz8loZMju9bx0pe8/hMNzoy9Cn1ezIt9lVQmT0SOYu8kIMrWoNSVvtt17ytL1wWsisaNAjYu3y
	SaoF3XM4WE7BNpvDZpT1wkT6oB8EA2r4+AL0aiBI58PmWaSMLz6GL6x60XisyKZvRt6KPQGqKltvF
	DkpO38MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXgF-0000000C5pe-0lF0;
	Wed, 20 Aug 2025 01:31:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXU1-0000000C4SN-3Gay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 01:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D1894584F;
	Wed, 20 Aug 2025 01:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D35C4CEF1;
	Wed, 20 Aug 2025 01:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755652761;
	bh=cjJRLW2sV4cFnb5HNArK4xCSZg33FLuESJ6vc/T4y5k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cyTHEKlRrdRQ1N62AOX3gs/46KVqddCnuOs/wFLM1W2Ng02c/2X0CX1eEbIgERXSQ
	 /E53XK7ba39bRFUSW00l6LIpj/mlbgGXq5Aw7hRGZQVP7w0cY5tvTMQGCr3eTgHNNI
	 yrrd7/Sux6QF8j8Me2YfV8qIwzgN+5Apuj93J2ym6b3FHC4wlPvvK3Hj/VN6DQ3fWQ
	 p4RO7C/6MVu0GvXEeXRlbxaT3yLah8MOg1wpI0vOEnd6ZljHocO1a2qKQKLI7G1NRR
	 I0jzZeE6ATgraaBHKp4jvExUeEd7bWGBub4U01XW+4q+xQ3ucUtjnm3MT8KH3uFPoi
	 acdnyFpkpu0Qw==
Date: Tue, 19 Aug 2025 18:19:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Rohan G Thomas via B4 Relay
 <devnull+rohan.g.thomas.altera.com@kernel.org>
Cc: rohan.g.thomas@altera.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin
 <fancer.lancer@gmail.com>, Romain Gantois <romain.gantois@bootlin.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Matthew
 Gerlach <matthew.gerlach@altera.com>
Subject: Re: [PATCH net-next v2 2/3] net: stmmac: xgmac: Correct supported
 speed modes
Message-ID: <20250819181920.275f2827@kernel.org>
In-Reply-To: <20250816-xgmac-minor-fixes-v2-2-699552cf8a7f@altera.com>
References: <20250816-xgmac-minor-fixes-v2-0-699552cf8a7f@altera.com>
	<20250816-xgmac-minor-fixes-v2-2-699552cf8a7f@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_181921_844286_91374C33 
X-CRM114-Status: UNSURE (   7.17  )
X-CRM114-Notice: Please train this message.
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

On Sat, 16 Aug 2025 00:55:24 +0800 Rohan G Thomas via B4 Relay wrote:
>  {
>  	u32 hw_cap;
>  
> +	struct stmmac_priv *priv = container_of(dma_cap, struct stmmac_priv,
> +						dma_cap);
> +
>  	/* MAC HW feature 0 */

nit: no empty lines between variable declarations and longest to
shortest, so:

 {
+	struct stmmac_priv *priv = container_of(dma_cap, struct stmmac_priv,
+						dma_cap);
 	u32 hw_cap;

