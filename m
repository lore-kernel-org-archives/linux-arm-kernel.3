Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7744FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 11:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dFHKsQ7kVh6jZILIwKtMbuxfiLrE+HKuO2Ky6dB4tU=; b=2ClsGJMsIaheiCx74F8hnqwol6
	WhqYjt+KZDec9mxjaQZ2XcLI3AX+APOZHBF+q0018Bsmi8Nt1PS2N5tiuwAahKacPkOoED9SR77f+
	2ZI+tVxKXUpV4hcySJfwuPuiBUdyoGTTO/Y1Vnca5cs/groOty9zd2mW24Xd2IcAbPf9i58ui4WyP
	f/W4Q33I1z/vfOE8Pttj8Vz4rbdJ9oqx3S3sLfgBM7x0bRMtHw82hNAliT/Wj3ghuuQqVMFBvrpMF
	tdpM2pf+YyAevB+5O4Z0PCRmVFWZY4VGZpROujqD8v0Ngj3QW33WLgUq1vT2K9xn134ifZ1Jk9BfJ
	R+SpNTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbKI-0000000BgJ3-2NhZ;
	Tue, 14 Jul 2026 11:29:26 +0000
Received: from mail.lysator.liu.se ([130.236.254.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbKD-0000000BgHT-1HFy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 11:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784028550;
	bh=KIbChOqpx58g6s8B0KHjVr0c4T00SmiBQI8b9zTDkp0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CbnG+nXot1KVhI9mG09KAxVeQj/w+BnwSmVpP0QYgKugaxSGX0tED1KyrZaboDSDQ
	 CqKYqbv1kR3onI8bzCy+qk0wlFUYUEqIjOrgdwxLu7qnelohiOkHjyXuowE+TwAyqb
	 uBmE5l+Q6LRtVuGUHo6NuCNSqs4o0U7LQ7/Nvd4xaTOI3zSMAFFTb4UKTOeaLVwgKW
	 /row9FhCU/6drRqGXKm6UWck6WfHk4uRkMHcDIr1mDjlYLIoMCwwqOYGqSHlA/l6GT
	 liAgWhVwTyFK+lXTy5W4OJfWemdl0/7eOh6gZtKhazJUzfkWTcWrllSrCOih6l+07b
	 tWW74dbLYn2cA==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 369CF8729
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 13:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784028550;
	bh=KIbChOqpx58g6s8B0KHjVr0c4T00SmiBQI8b9zTDkp0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CbnG+nXot1KVhI9mG09KAxVeQj/w+BnwSmVpP0QYgKugaxSGX0tED1KyrZaboDSDQ
	 CqKYqbv1kR3onI8bzCy+qk0wlFUYUEqIjOrgdwxLu7qnelohiOkHjyXuowE+TwAyqb
	 uBmE5l+Q6LRtVuGUHo6NuCNSqs4o0U7LQ7/Nvd4xaTOI3zSMAFFTb4UKTOeaLVwgKW
	 /row9FhCU/6drRqGXKm6UWck6WfHk4uRkMHcDIr1mDjlYLIoMCwwqOYGqSHlA/l6GT
	 liAgWhVwTyFK+lXTy5W4OJfWemdl0/7eOh6gZtKhazJUzfkWTcWrllSrCOih6l+07b
	 tWW74dbLYn2cA==
Received: by mail.lysator.liu.se (Postfix, from userid 1004)
	id 185F386C5; Tue, 14 Jul 2026 13:29:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1784028545;
	bh=KIbChOqpx58g6s8B0KHjVr0c4T00SmiBQI8b9zTDkp0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gnoUaLAdgBEvaDjfLSajvn/XVJzTNVE28DDBz1hWHX/aP9aAAlNC7EtIuT4lDDap5
	 p9NLpVe3YH/tACOkFNyl0ukcXjMPQ4qkV7kMdZKNfcITmiXQv3ppcQHAkQ7Pvcwf6e
	 2+2jTsNnbmS+kp0LAcjmREK+ZgksHO+CC0nCEevsK+AzPvU3tHsYb0gwz+qH4XaKPO
	 p1bMujtBwEm4Bwt+J9v6maO+y7/8zA/zIbeL3DaK2oiYHGjqEZ4X9EfSJzTUH8yUUG
	 Lo86ZuhYkkrS1Xqb80k+YQgDdk/UC5wdkUS/hRqWgzfIdd3x297MFfF7Ipg8cdWuNQ
	 Mfq3Ki57ZyVoA==
Received: from [192.168.2.172] (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id A475686BE;
	Tue, 14 Jul 2026 13:29:03 +0200 (CEST)
Message-ID: <e2d4fdf8-4dae-43dc-95ae-b9aa1884fdf5@lysator.liu.se>
Date: Tue, 14 Jul 2026 13:29:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/7] i2c: mux: add idle_state property to i2c_mux_core
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
 <20260713-i2c-mux-v11-2-72bb8af8ee8c@gmail.com>
Content-Language: en-US, sv-SE
From: Peter Rosin <peda@lysator.liu.se>
In-Reply-To: <20260713-i2c-mux-v11-2-72bb8af8ee8c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_042923_342498_165F51DB 
X-CRM114-Status: GOOD (  29.07  )
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

Hi Marcus,

Sorry for the very late feedback.

On 2026-07-13 09:19, Marcus Folkesson wrote:
> Muxes treat their channels differently when idle.
> Let the mux core have this information to make it available for
> internal use.
> Reuse the same state values used by CONFIG_MULTIPLEXER.
> 
> Possible idle states are:
> - MUX_IDLE_AS_IS: Leave channels as is when idle
> - MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
> - <n>: Enable channel n when idle
> 
> Default value is set to MUX_IDLE_AS_IS.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>   drivers/i2c/i2c-mux.c   |  1 +
>   include/linux/i2c-mux.h | 26 ++++++++++++++++++++++++++
>   2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> index 681a201c239b..edf16683dc83 100644
> --- a/drivers/i2c/i2c-mux.c
> +++ b/drivers/i2c/i2c-mux.c
> @@ -247,6 +247,7 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
>   	muxc->select = select;
>   	muxc->deselect = deselect;
>   	muxc->max_adapters = max_adapters;
> +	muxc->idle_state = MUX_IDLE_AS_IS;

This is insufficient. AS_IS is simply not an adequate default.

For i2c-mux-gpmux, there is currently no way to dig out what
the idle state is, as it is not exposed by the mux subsystem. For
i2c-mux-gpio, the idle state depends on both the idle-state /and/
the i2c-mux-idle-disconnect props. For i2c-mux-pca954x the idle
state can be adjusted at runtime. Etc.

In short, idle state handling is a bit diverse, and I think this
adds to that mess.

I think it will be a bit of work to come up with a scheme for the
I2C mux core to accurately keep track of what the idle state is.
One way to deal with that is to introduce a new "unknown" value
that can be the default for all drivers that has not yet figured
out how to feed the correct idle state to the core.

And that hints at why I think reusing the mux.h bindings #include
is bad. The mux subsystem simply has no need for an unknown state,
and adding that to mux.h is therefore out of place.

>   
>   	return muxc;
>   }
> diff --git a/include/linux/i2c-mux.h b/include/linux/i2c-mux.h
> index 1784ac7afb11..624fadbaa703 100644
> --- a/include/linux/i2c-mux.h
> +++ b/include/linux/i2c-mux.h
> @@ -13,6 +13,7 @@
>   
>   #ifdef __KERNEL__
>   
> +#include <dt-bindings/mux/mux.h>

I think it is bad to bring in this include here. That include
belongs to the mux subsystem. Yes, it is included by others as
well, but please don't expand on that.

>   #include <linux/bitops.h>
>   
>   struct i2c_mux_core {
> @@ -22,6 +23,17 @@ struct i2c_mux_core {
>   	unsigned int arbitrator:1;
>   	unsigned int gate:1;
>   
> +	/*
> +	 * The mux controller state to use when inactive.

A "mux controller" is a concept in the mux subsystem, and there
is no equivalent for I2C muxes.

Cheers,
Peter

> +	 * Possible idle states are:
> +	 *  - MUX_IDLE_AS_IS: Leave channels as is when idle
> +	 *  - MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
> +	 *  - <n>: Enable channel n when idle
> +	 *
> +	 * Default value is set to MUX_IDLE_AS_IS.
> +	 */
> +	int idle_state;
> +
>   	void *priv;
>   
>   	int (*select)(struct i2c_mux_core *, u32 chan_id);
> @@ -38,6 +50,20 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapter *parent,
>   				   int (*select)(struct i2c_mux_core *, u32),
>   				   int (*deselect)(struct i2c_mux_core *, u32));
>   
> +/*
> + * Mux drivers may only change idle_state, and may only do so
> + * between allocation and registration of the mux controller.
> + */
> +static inline void i2c_mux_set_idle_state(struct i2c_mux_core *muxc, int state)
> +{
> +	muxc->idle_state = state;
> +}
> +
> +static inline int i2c_mux_idle_state(struct i2c_mux_core *muxc)
> +{
> +	return muxc->idle_state;
> +}
> +
>   /* flags for i2c_mux_alloc */
>   #define I2C_MUX_LOCKED     BIT(0)
>   #define I2C_MUX_ARBITRATOR BIT(1)
> 


