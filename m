Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02A5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q0PNak+1;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=iYuvg2Ti
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rdeTErVTM9HWGGHuc0i3Cwp7+siwoWcWh/HAVgH8k84=; b=Q0PNak+17iWS+X468cR9Zk8Nfu
	ygZPG1baKkKlhzR7VZ9mD5kruOkEuX+b5Petjd0qaniiqR08VKxu3RSEGOrXtlL52ttfOmEFgkR1Z
	y68IeL2eOmlmeejG7MxwlX8cTRjF0AL8Mis0UIh9FGcLP3xt2AnVETgt0ibhFa1rSRZMdTyMx/mof
	MJQ5kzn1CECz+OW+2I2p4a601bKsgeEF64zihSca1YunTuDmS7AaOb+A1OHigqNaXaXdWOPavO3bb
	PN1v5fzBUmScZs4Psdz3zfoNhTYAdnUFUwzl7VlVLND/SfnexQMTxXWfx2FgyUualSqiymdODoKUR
	LCgXMMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLckb-0000000440K-0naJ;
	Tue, 27 Oct 2026 08:41:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLckX-000000043zq-42Mj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:41:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8FE41476;
	Tue, 27 Oct 2026 01:41:32 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97D063F673;
	Tue, 27 Oct 2026 01:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793090495; bh=2/EEt+dUxW2pl325C7VxxAEesb251yEwGDap3wOiNT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYuvg2Til6S2cdQu1EiTKoBzSvxSze9zZHUf92FJ9N+EFV0j6tg7y1X3p0eokkZjk
	 Iy5yUEh6hD7BwvCgB47zb0Hs1L/kRz7rhlcK5oS1/F2L19TZT23rnyOVY6dTkMouGo
	 9brJbfv41G9RuVI5LartaEpZUfWobdBSWtvvAQj0=
Date: Tue, 27 Oct 2026 08:41:33 +0000
From: Leo Yan <leo.yan@arm.com>
To: Chao Xu <xuchao066@163.com>
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v1] coresight: funnel: inport schedule by priority can
 not take work
Message-ID: <20261027084133.GA766279@e132581.arm.com>
References: <20261025131308.7158-1-xuchao066@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261025131308.7158-1-xuchao066@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_014142_246210_08B5AE59 
X-CRM114-Status: GOOD (  18.74  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sun, Oct 25, 2026 at 09:13:07PM +0800, Chao Xu wrote:
> Before enable funnel, priority must be set. Changing the port
> priorities in real time is not supported.

> If the priority control register is written when one or more of ports
> are enable, then the write is silently rejected.

Could you cite the relevant documentation in commit log?

  The CoreSight SoC-600 TRM, section 9.11.2, PRIORITYCONTROL, a funnel
  rejects priority register writes whenever any port is enabled. The
  current sequence therefore prevent the configured priorities from
  taking effect.

  Write the priority register before enabling the first port.

> Signed-off-by: Chao Xu <xuchao066@163.com>
> ---
>  drivers/hwtracing/coresight/coresight-funnel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
> index af40814ce560..17f985798d7f 100644
> --- a/drivers/hwtracing/coresight/coresight-funnel.c
> +++ b/drivers/hwtracing/coresight/coresight-funnel.c
> @@ -66,8 +66,8 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
>  	functl &= ~FUNNEL_HOLDTIME_MASK;
>  	functl |= FUNNEL_HOLDTIME;
>  	functl |= (1 << port);
> -	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
>  	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
> +	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);

Please move the priority write into the first port branch:

  /* Claim the device only when we enable the first slave */
  if (!(functl & FUNNEL_ENSx_MASK)) {
          rc = coresight_claim_device_unlocked(csdev);
          if (rc)
                  goto done;

          /* Update priorities while all ports are disabled */
          writel_relaxed(drvdata->priority,
                         drvdata->base + FUNNEL_PRICTL);
  }

Thanks,
Leo

