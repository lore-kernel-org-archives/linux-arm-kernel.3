Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3A4C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stXh1fM412cY+REiPldeY0+VqNMJB4qWsSnKs2KUzWY=; b=3wPDW2vAP+x8EeY6Ej8ZRR0UrI
	ixD9nvBm6rGhXEnMEsgL6w1G992kkc/tPeUedUEXG3/OFsRxqyKpl7L9kEESnn30lrTWorKzo7vT4
	rKt+PQ/tWjvbV/A3pm16yT2fO/2BKJegXPFDGcGJz2J3A7xi4Pt4AtzaH34gf0F/FBMVHXtmUF1Gb
	soXDr0PhKaNiwo+we75A3dg/7oMZQoaCVtwHh9fcngL7FM1PV37VNhBKmieT7+XfSxlZcUtCKJVku
	2bGg6lZXlthDk45kDxqgyoW98rX7XrLENljbGfNIbW3Jre3VLESm3EMfFeFffgTO+zT+8CBSAJ/BO
	cxvxjNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxEq-0000000654r-2vXe;
	Wed, 02 Apr 2025 12:30:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxD4-000000064ns-3lTj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33649A4466C;
	Wed,  2 Apr 2025 12:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D84C4CEEA;
	Wed,  2 Apr 2025 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743596925;
	bh=onuIhjTXJJlHvvsqV+euGzwFz3yBubvRTM3rD33wVhs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X+jQJxeHNYK2sE30eKgGhKnxxnXIgISmGZZWJnbO5E0Op+wIXxk9g0SXQDOKxYqnj
	 4wdPQq0h18/PDzj1mTEGOYE9/hoT8kiSz/Od0yakv20gz8RA0QslR9YGIKZyUaBemp
	 C83G78lnzM2GRIqvVuRwJx6BK4RdRKBxWY/E+oMzumfgYGvKz2ZQK5dj7LrT5faWOi
	 mE1djQ0v8i7Rnlvu2BBVCrZFIOiRMgOaEnEmI68GLCpcDzGUAkiFdZ3DdUsgO4AAAo
	 rB49S1p8dCnibfF0yKNiFx47YyiRHSH/nwbbZN+OaXnuB6TRidOueCGTM0EliiT8DA
	 DGIXcuj3YXoxg==
Message-ID: <0fb67fc2-4915-49af-aa20-8bdc9bed4226@kernel.org>
Date: Wed, 2 Apr 2025 15:28:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 3/3] net: ti: icss-iep: Fix possible NULL pointer
 dereference for perout request
To: Meghana Malladi <m-malladi@ti.com>, dan.carpenter@linaro.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 namcao@linutronix.de, javier.carrasco.cruz@gmail.com, diogo.ivo@siemens.com,
 horms@kernel.org, jacob.e.keller@intel.com, john.fastabend@gmail.com,
 hawk@kernel.org, daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
References: <20250328102403.2626974-1-m-malladi@ti.com>
 <20250328102403.2626974-4-m-malladi@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250328102403.2626974-4-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_052847_065355_96D9A133 
X-CRM114-Status: GOOD (  19.72  )
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

Meghana,

On 28/03/2025 12:24, Meghana Malladi wrote:
> ICSS IEP driver has flags to check if perout or pps has been enabled
> at any given point of time. Whenever there is request to enable or
> disable the signal, the driver first checks its enabled or disabled
> and acts accordingly.
> 
> After bringing the interface down and up, calling PPS/perout enable
> doesn't work as the driver believes PPS is already enabled,

How? aren't we calling icss_iep_pps_enable(iep, false)?
wouldn't this disable the IEP and clear the iep->pps_enabled flag?

And, what if you brought 2 interfaces of the same ICSS instances up
but put only 1 interface down and up?

> (iep->pps_enabled is not cleared during interface bring down)
> and driver will just return true even though there is no signal.
> Fix this by setting pps and perout flags to false instead of
> disabling perout to avoid possible null pointer dereference.
> 
> Fixes: 9b115361248d ("net: ti: icssg-prueth: Fix clearing of IEP_CMP_CFG registers during iep_init")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/7b1c7c36-363a-4085-b26c-4f210bee1df6@stanley.mountain/
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
> 
> Changes from v2(v3-v2):
> - Add Reported-by tag and link to the bug reported by Dan Carpenter <dan.carpenter@linaro.org>
> - drop calling icss_iep_perout_enable() for disabling perout and set perout to false instead
> 
>  drivers/net/ethernet/ti/icssg/icss_iep.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ethernet/ti/icssg/icss_iep.c
> index b4a34c57b7b4..b70e4c482d74 100644
> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
> @@ -820,9 +820,9 @@ int icss_iep_exit(struct icss_iep *iep)
>  	icss_iep_disable(iep);
>  
>  	if (iep->pps_enabled)
> -		icss_iep_pps_enable(iep, false);
> +		iep->pps_enabled = false;
>  	else if (iep->perout_enabled)
> -		icss_iep_perout_enable(iep, NULL, false);
> +		iep->perout_enabled = false;
>  
>  	return 0;
>  }

-- 
cheers,
-roger


