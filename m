Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D8D606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 20:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Weo6thGU;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=efVIRXvk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8cMCw3CAhEINOW92Wo9264P7jdinCb60stuyaNoH9a0=; b=Weo6thGUSIgn45
	c0/rrIAguKGPQQbVXm+DoR157szGdHWVAit68vl1Ok0lpuuB3dX5R10r5ZRbRnV/CDoBILNtzg46z
	XNvVMMvFv/cdxidQq0iS5EAlh8hQLXa1wzqbBDQpzfLl7kIg5Co32N1ojGTp2GY6zRg53ny+RCI6F
	dwlDnfgg9NwACLPcoxTUwZWEgGca3hzOCd1zf8lEI3nf4Cc8C3LXJcsajPim236FnMVDz0kgLzjk2
	YYf4swzkX5nuaXvsbR5xZoXA1aLT2zSakPNQ+byWT6azHSfXUKlqZObciNdu+840YsxJRUN9hRh2X
	FJ2L7caXNoi8Fk3VWilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAFF-00000007vWo-2m7T;
	Wed, 28 Oct 2026 20:27:37 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMAFD-00000007vVu-10KA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 20:27:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=8cMCw3CAhEINOW92Wo9264P7jdinCb60stuyaNoH9a0=; t=1793219255; x=1794428855; 
	b=efVIRXvkONLdNcgUXzaVHqL9NkjMr1rBhiSn0etpJtH0pMpSSWf6Wurru3W5PN2WbN+5X5gIt7w
	/2kw+nlyHEXkN+TQ655vRYUxbcp6/R7Ijrhost+ZHp9pdyPHWyjvz/JvP19yIPJ6udckT73XGA21R
	KeOcO0NtmSoM61lgJBTPbM5nfJE1/WFpDH3XEdNb6ewppzoW+BkFnlkRuWoZz65x3fVEFV2hrjHqp
	DyCkFm1v8exdoXxLgSesDA9T6Wyg8vGXs+rlvvhIjrM36oWsxq5MJEl0Nir0LuBsqVNsI94fhs9pz
	Ww/HeNUY4d8qWMGb3vzBJrZMKZv/m+eA/gTw==;
Date: Wed, 28 Oct 2026 21:27:18 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, absicsz@gmail.com
Subject: Re: [PATCH 1/2] ARM: omap: cpuidle34xx: balance cpu_pm_enter/exit()
Message-ID: <20261028212302.75ec622e@kemnade.info>
In-Reply-To: <20261028-susp2-v1-1-174b52857d89@kemnade.info>
References: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
	<20261028-susp2-v1-1-174b52857d89@kemnade.info>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_132735_286572_694DE0CF 
X-CRM114-Status: GOOD (  16.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 20:15:11 +0100
Andreas Kemnade <andreas@kemnade.info> wrote:

> These calls are usually done in a balanced way, so allow notifiers to
> assume that these calls are balanced under all circumstances.
> Seen some spurios vfp issues probably connected to this.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Looked again at some discussions with Sicelo testing such things:
He had observed a NEON off count 1 but MPU 0 in /sys/kernel/debug/pm_debug/count.
Probably more involved, but lets not freak out things here.
So that is definitively a real problem fixed by this. vfp_pm_resume()
would not be called to restore the state without a patch like this.

So this is

Fixes: 1cd96478cf150 ("ARM: OMAP3xxx: CPUIdle: optimize __omap3_enter_idle()")

> ---
>  arch/arm/mach-omap2/cpuidle34xx.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-omap2/cpuidle34xx.c b/arch/arm/mach-omap2/cpuidle34xx.c
> index 2ab5dcbfb7f6..e42dcf8c03a3 100644
> --- a/arch/arm/mach-omap2/cpuidle34xx.c
> +++ b/arch/arm/mach-omap2/cpuidle34xx.c
> @@ -139,8 +139,7 @@ static int omap3_enter_idle(struct cpuidle_device *dev,
>  	 * Call idle CPU PM enter notifier chain to restore
>  	 * VFP context.
>  	 */
> -	if (cx->mpu_state == PWRDM_POWER_OFF &&
> -	    pwrdm_read_prev_pwrst(mpu_pd) == PWRDM_POWER_OFF)
> +	if (cx->mpu_state == PWRDM_POWER_OFF)
>  		cpu_pm_exit();
>  
>  out_clkdm_set:
> 


