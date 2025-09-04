Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D256ECA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEVraAjNEmkpQ0hwFRRJQp/Tozqzizc3A3hrqwQZqdk=; b=14kZcNI6y6voASPEvlINBJtEAB
	5lbG1gpU9oV5SJ1joC/DG8Dlyu2NvpJN/GYxWZblY9ULulZS6EPDIL7Q3hewF9ibOmxnP4csumUqD
	QgDAq1hnreAJWR1NE8jLMR+K7Y4V1akvah8wsFRekENfrQT0Ju3/0RSMsQzfnQ4g+SatHHNjd+Zg1
	yqBS/9SE1D0q2iwCO7DszmujAuRUWQtl/5KLL8T2F9QxvJIqz4MDSWCvwBoXlyDy1DwR/t0M6r+Sr
	clOrNiIv0ptQY1+QOs6vvHiXRTNle7VLLVD1QgRr0XCvr4yTIjnPCxDFaxC0Fx1d31HHiNDxVF8MW
	35hNQc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bq-00000008fUA-1Hg5;
	Thu, 04 Sep 2025 03:26:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uty9j-0000000810n-3olX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:48:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AA3944A9D;
	Thu,  4 Sep 2025 00:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F46C4CEE7;
	Thu,  4 Sep 2025 00:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756946929;
	bh=/eZokcjTYsgn7x3TN1nV0vQhMpWaAhi7YQj4lS/oW5w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f4a+Hk3XTjiN/mfxv9pyjGmIzHB8EyWE1g9mMRhBYpyErEFM2eLS2RLCNLZ9m+flb
	 usBL3tioZb1jmbnGl2cnprJzZgY+7pXdM1pTdJM/l7LSADXMr8lVMlXEjMiGbORW+l
	 ylL1uOUITFWfR5Vf2cQlWFj287PPpY3SnuOoIUMARaFXEEbDEiJfG2mlCm55uL15H7
	 EeIpGd0/dS2PeLYfhNQl8FVow1ttEyNVHftFywOVWIkdDwukIuF755hy2naOdqX4iN
	 mT+GB2IWk5KvmNBlsutFJjAZgnVXN8wIkBAU7y8uonErOB31WtsIKKO8H9zXSHUUsF
	 U/aLizS4FgT5Q==
Date: Wed, 3 Sep 2025 17:48:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <namcao@linutronix.de>, <jacob.e.keller@intel.com>,
 <christian.koenig@amd.com>, <sumit.semwal@linaro.org>, <sdf@fomichev.me>,
 <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
 <ast@kernel.org>, <pabeni@redhat.com>, <edumazet@google.com>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net-next v2 1/6] net: ti: icssg-prueth: Add functions to
 create and destroy Rx/Tx queues
Message-ID: <20250903174847.5d8d1c9f@kernel.org>
In-Reply-To: <20250901100227.1150567-2-m-malladi@ti.com>
References: <20250901100227.1150567-1-m-malladi@ti.com>
	<20250901100227.1150567-2-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_174851_973169_03E19611 
X-CRM114-Status: GOOD (  12.09  )
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

On Mon, 1 Sep 2025 15:32:22 +0530 Meghana Malladi wrote:
>  	if (!emac->xdpi.prog && !prog)
>  		return 0;
>  
> -	WRITE_ONCE(emac->xdp_prog, prog);
> +	if (netif_running(emac->ndev)) {
> +		prueth_destroy_txq(emac);
> +		prueth_destroy_rxq(emac);
> +	}
> +
> +	old_prog = xchg(&emac->xdp_prog, prog);
> +	if (old_prog)
> +		bpf_prog_put(old_prog);
> +
> +	if (netif_running(emac->ndev)) {
> +		ret = prueth_create_rxq(emac);

shutting the device down and freeing all rx memory for reconfig is not
okay. If the system is low on memory the Rx buffer allocations may fail
and system may drop off the network. You must either pre-allocate or
avoid freeing the memory, and just restart the queues.

> +		if (ret) {
> +			netdev_err(emac->ndev, "Failed to create RX queue: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = prueth_create_txq(emac);
> +		if (ret) {
> +			netdev_err(emac->ndev, "Failed to create TX queue: %d\n", ret);
> +			prueth_destroy_rxq(emac);
> +			emac->xdp_prog = NULL;
> +			return ret;
> +		}
> +	}
>  
>  	xdp_attachment_setup(&emac->xdpi, bpf);

