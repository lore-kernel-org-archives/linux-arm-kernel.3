Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F9BC5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3TAYLcwrDJnMeBY3Y4lUUYmO5fDhCMRki3TfcqwLhw=; b=p1eEHiyQHAC4AG50S6CYRmrZdp
	5Dw0Kq14yxTKVEF490SkBbH6o62qkueVLL1KZZ6xEDQqKUDzGYiYDrDI6Ynvo391lAkdzdEXYeq73
	UJiKMMYDQohJKsONKaR4Cb21vTk9CLmZM/AK5l9A9aKC/qIn9IwnK5BvOOg2tNKHxPO85adcwBdUy
	oAoiqhKtRXd1ADL5GiqYal5ap1qYJzYwk5VshGcJdQrTQKh4DmecsLcYvT8PhAja26Dh4f+edfjtj
	XwOb/hHUiiNBfMRDxoNpOQyo0BdjmlK/ZsmFlrdEJSBkb+V6uFNmiEuCbeQTb5+lFFs06wnEMOPZJ
	ebwzGqIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLUf-0000000BJ0K-2tui;
	Mon, 10 Aug 2026 08:36:25 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLUd-0000000BIzn-0cjk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 08:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=m3TAYLcwrDJnMeBY3Y4lUUYmO5fDhCMRki3TfcqwLhw=; 
	b=HFwb3f0h+3AtoudeUJKtv+jjdYLSPxiv+jaEqab7x3GAbJthJFXS7tclcW+AvWfoBDclWTh5Pta
	ypcLrRo9STqmt1D7Qt/6Yr+nqgJu0evtU9GbzNz1Qoba/hpw31/afk9k/PAKwitGSmxsrHUR33YkU
	d+RvAVJVXEME+UpY59S9reu4kflQxj8c+hJksNeKdp5CWfpUN0nJhuLtqGtQNPAnTqCYrC+CZ7opb
	57KuiAc9pCLDP2OpFl9kHdZac8nAFtZwInJJhcYZATRQsBnXrlMCv8KejW5py8CCZ3je/JLdGthwh
	ggtVmf6zQALVmg21AOS4UF5yQvmrB/7jUBIA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1wtLUQ-00000003Wsh-18HJ;
	Mon, 10 Aug 2026 16:36:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 10 Aug 2026 18:36:10 +1000
Date: Mon, 10 Aug 2026 18:36:10 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: olivia@selenic.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-crypto@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dakr@kernel.org, o-takashi@sakamocchi.jp, bhelgaas@google.com
Subject: Re: [PATCH v1] hwrng: imx-rngc: Disable clock on registration failure
Message-ID: <anmNevLkVPRAHTjD@gondor.apana.org.au>
References: <20260802222259.577200-1-dbgh9129@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802222259.577200-1-dbgh9129@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_013623_211037_129869FA 
X-CRM114-Status: GOOD (  11.54  )
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

On Sun, Aug 02, 2026 at 06:22:59PM -0400, Yuho Choi wrote:
> The RNGC clock is enabled manually before runtime PM is configured. If
> devm_hwrng_register() fails, probe returns without disabling the clock.
> The devm_pm_runtime_enable() cleanup only disables runtime PM and does not
> call imx_rngc_suspend().
> 
> Disable the clock before returning from this failure path.
> 
> Fixes: 7a96a64e8689 ("hwrng: imx-rngc - add runtime pm")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>  drivers/char/hw_random/imx-rngc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

