Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC16C5AE49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xOWdWttJ5lEYJAi21opwk9aDpKJg8EeQXY1WVzHESc=; b=RGlBObyZhwoANysmx8TAhXX4rE
	ZzNtp4QNYwc7TI0Esj0tR4SOFHWfKT6bUMerDadtnkxFXq5vgLGA8wsOmX1niQApuojh5MrlZDij7
	/FcRbOZcDo4nknw2GfVZUR4pK30UTY4AiOy5Z2XSaq1d/xpVQDtXT5Zhj/BEGi4gnmZcDVYuzWsSx
	SNPCmf2ctyqi4+ML/el751WVenC9WkESxTxzZDrAhYFK+U8vBBAze9Y2qkp2nZGgtSyVd5hc6aRlG
	RCYnxbG78ZuLpMJ2BrW7CTLqx56uo0T2Vima9UsHhXGf5WqkddMMMAnfCrkFYY9Ww36FdiFeQhO3j
	QKHXmBxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRMD-0000000C6OR-3m78;
	Mon, 10 Aug 2026 14:52:05 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRM9-0000000C6Hn-15nr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:52:03 +0000
Received: from francesco-nb (93-35-5-212.ip52.fastwebnet.it [93.35.5.212])
	by mail11.truemail.it (Postfix) with ESMTPA id 75AAD1F83F;
	Mon, 10 Aug 2026 16:51:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786373515;
	bh=8xOWdWttJ5lEYJAi21opwk9aDpKJg8EeQXY1WVzHESc=; h=From:To:Subject;
	b=RANKzl0rwIbXN++I6LA8Rlhna7AgTZYi8AbfcmaILTUXvORdWCRcBx64ECxagA2MJ
	 BspMT1vAvOBmCSw9kdnSnrJaEueE+vt1by7Gf1gGafC4T1t6wa25e/eoHBZzLynsDJ
	 yxBALaK8zAkLmDzyi47NQZ3/I7RSGTz9FH1ILF+uxfsaR39QgUp4Ia9XEYi+RGPtA1
	 a7B+okTo48bYkaP4jR4Y8etBFO4y3M2uAWqcoY5uTTiUwGclz34pcaj496Uy04uXMq
	 IRZu4UHuTQOkdRZ4MNVsjBefRn9kVgLio9jjwQ5q/Q6ZlIA3d0KqpZBSwKxBUobFUB
	 LUDheqXSoUyvg==
Date: Mon, 10 Aug 2026 16:51:49 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Francesco Dolcini <francesco@dolcini.it>,
	Frank Li <frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>, Steffen Eiden <seiden@linux.ibm.com>
Subject: Re: [PATCH v3] arm64: errata: Add NXP iMX8QM workaround for A53
 cache coherency issue
Message-ID: <20260810145149.GA81453@francesco-nb>
References: <20260803-imx8qm-cache-coherency-v3-1-c518d0da3d3b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-imx8qm-cache-coherency-v3-1-c518d0da3d3b@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_075202_355359_E7F7348F 
X-CRM114-Status: GOOD (  12.38  )
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

Hello Peng,
thanks for the patch, very much appreciated.

On Mon, Aug 03, 2026 at 04:54:44PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> According to NXP errata document IMX8_1N94W[1], the i.MX8QuadMax SoC
> suffers from a cache coherency issue (ERR050104). The upper bits, above
> bit 35, of the ARADDR and ACADDR buses within the Arm A53 subsystem
> have been incorrectly connected. This causes some TLBI and IC
> maintenance operations exchanged between the A53 and A72 core clusters
> to be corrupted.

...

> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 5db8f0619e4b..4ba68c1f29b2 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -200,6 +202,28 @@ cpu_enable_cache_maint_trap(const struct arm64_cpu_capabilities *__unused)
>  	sysreg_clear_set(sctlr_el1, SCTLR_EL1_UCI, 0);
>  }
>  
> +#ifdef CONFIG_NXP_IMX8QM_ERRATUM_ERR050104
> +static bool
> +is_imx8qm_soc(const struct arm64_cpu_capabilities *entry, int scope)
> +{
> +	WARN_ON(preemptible());
> +
> +	return of_machine_is_compatible("fsl,imx8qm");

fsl,imx8qp is also affected, please adjust


Francesco


