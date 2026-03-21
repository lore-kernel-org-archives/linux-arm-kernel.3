Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FD21094462
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 09:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMe5RCjjMGqOJUPF+lkMyEjZGgM4DLVRiFp4XoWGDyA=; b=0i76e5ot5c+ePVU7c3tyxcxL9U
	dd3m7qhfcbTmMzaJGOG72V/ka/6G36tprPpel/bilm6lTZ3zXF7f+0UiH/nMvRxvmZ2YqGXGRFYtD
	3h1FpJ1G4jGBX5JIW/0m69Eq5UAeYRddMvdwqJyhZYXfSMCvB10EqcbxTtpiv1w1BwYa4cdn2exp/
	GtPmjgalsOJWM01ekjPC/T0Y2C3QZQvGmQ+Je638FgXbYbez7PANnWqFJtkuxpcWzsPEx/yK5Nu1D
	qpJCbnHiUuw8GMIDog9ziY/u2SouIM6/qikx8Zk1QZjyPS/86squ5lsoyp8xvs0u4ud9kOY7Z+ZiN
	Bc5aPGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ssn-0000000EJlk-48zf;
	Sat, 21 Mar 2026 09:44:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ssl-0000000EJlM-2edT;
	Sat, 21 Mar 2026 09:44:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49712432B1;
	Sat, 21 Mar 2026 09:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7FBC19421;
	Sat, 21 Mar 2026 09:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774086274;
	bh=+FyqSc/pT33KY//yXjdAJJt7KUdidRtWT5vfO6X7t40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C7MPmnONJGYhKLNLCg2y3r/vaAIZxMwCKMd6yxn0EDfWwdr+uWJtaJocW38EfJAOH
	 qhNTELdffSsnTIgargdhVflFxFw04UupLpGb2xdtkax5SPmj19CQHFoZoUfXE+ZY3k
	 LpzisNLS8QtRbkv8YJfFo01y/iwpv7fDmtfHLUY05x6j/kHRMOpZeFvvgcGF9UJou+
	 W+tFhsZsjPrDCEgTeKcnaEw+PRG9WgdOO4hFZK7U/bQljZLoScC2Eo7NdY6PtU781E
	 +cZMIR4bnOnOfvmo0KwJ9lcnDaxN4SUOVCKrHRvGzfPSnQtwPgKfuwoG/ihBH36iV+
	 zaF5UMf0A1hMw==
Date: Sat, 21 Mar 2026 09:44:29 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Rework the code flow in
 airoha_remove() and in airoha_probe() error path
Message-ID: <20260321094429.GW74886@horms.kernel.org>
References: <20260320-airoha-remove-rework-v1-1-adeef7e3c01f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-airoha-remove-rework-v1-1-adeef7e3c01f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_024435_695268_0D5FE571 
X-CRM114-Status: GOOD (  16.21  )
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

On Fri, Mar 20, 2026 at 09:42:28AM +0100, Lorenzo Bianconi wrote:
> As suggested by Simon in [0], rework the code flow in airoha_remove()
> and in the airoha_probe() error path in order to rely on a more common
> approach un-registering configured net-devices first and destroying the
> hw resources at the end of the code.
> Introduce airoha_qdma_cleanup routine to release QDMA resources.
> 
> [0] https://lore.kernel.org/netdev/20251214-airoha-fix-dev-registration-v1-1-860e027ad4c6@kernel.org/
> 
> Suggested-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 82 ++++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c

...

> @@ -3028,7 +3044,7 @@ static int airoha_probe(struct platform_device *pdev)
>  
>  	err = airoha_hw_init(pdev, eth);
>  	if (err)
> -		goto error_hw_cleanup;
> +		return err;

Hi Lorenzo,

AI generated review warns that eth->napi_dev is leaked here.
And that does seem to be the case.

>  
>  	for (i = 0; i < ARRAY_SIZE(eth->qdma); i++)
>  		airoha_qdma_start_napi(&eth->qdma[i]);

...

