Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38455CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 10:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THuZBEwOiMJtTU+w/7+LqDOas+PoM5CQi/ijMRA93Jg=; b=0h9gmOktJYUOemqzK2r2JVtnAo
	5e7/Q+nQXZZqdNwV/5Emul8oYLG1iNoQ3eFW40uMUCkMUhdTKAZYs6H+eIkH5q5sTGTC7cXT+Hb+7
	kMMt+maV36LmUSpYXWb8IzPL4YXgsAiAfhU2ESdcmP87M2v4UZWw90X9UTO7VVw80qJ/UiVJRP//H
	BMh4DZlwMESWZzQPi3J3j29S5flEHN4lLBShKj8yueSzg5MbpnDTphLPTBXzpLcMeuGlCYmWiwd+J
	/vl+MLXnwIhBKGDCivK5lPs9IYILRlU7NVcqvBEPcLuENpG6Pad0ANoi9m+H3teRxqwLZ/Ote/Nu8
	i/1bcnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZZF-00000000V9u-421X;
	Wed, 06 May 2026 10:33:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZZE-00000000V8v-090A;
	Wed, 06 May 2026 10:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778063599;
	bh=M5o+/YaupNYZyxmeKf2QjXgCKV0qcMjr7DPzv7F8Sv0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dHhX2DDEb+wKn+xBlaCHlq6jRa1HZj+2R0vY7hAlUA+C+Zoap/YG7alIUX6QF2JuH
	 iGWo984ywb6LITJ7cafk4pbvn2DS/7wUBPMhH0nXlMzQqSjx/ELpj6PTtYAsCFnprr
	 gHgGF7r77Z50yxDgoF7V15ATETV17WYz10R+IypMMoEHxmYpyVhUW9244GtR4aZMrr
	 px8CHnxYwp40tbLvffOrKczuvdf6qie1oISR6ZEtvS5p0MbMQKQPIaTW3bZYPYkoSG
	 N1SjfcJWB9w5YQr31HrOSqFKu4oT6y4u7ppxfzDwvm3pdxYZGHcoyntDpuvIYjP6BP
	 Jn9toahZwrSNw==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64F3617E1227;
	Wed,  6 May 2026 12:33:18 +0200 (CEST)
Date: Wed, 6 May 2026 12:33:14 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Sumit
 Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Florent Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH 5/8] drm/panthor: Minor scheduler refactoring
Message-ID: <20260506123314.0f1c01cb@fedora>
In-Reply-To: <20260505140516.1372388-6-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
	<20260505140516.1372388-6-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_033324_233590_E494E055 
X-CRM114-Status: GOOD (  19.39  )
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

On Tue,  5 May 2026 16:05:11 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> From: Florent Tomasin <florent.tomasin@arm.com>
> 
> Refactor parts of the group scheduling logic into new helper functions.
> This will simplify addition of the protected mode feature.
> 
> Remove redundant assignments of csg_slot.
> 
> Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
> Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 135 +++++++++++++++---------
>  1 file changed, 86 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5ee386338005c..987072bd867c4 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1934,6 +1934,12 @@ static void csgs_upd_ctx_init(struct panthor_csg_slots_upd_ctx *ctx)
>  	memset(ctx, 0, sizeof(*ctx));
>  }
>  
> +static void csgs_upd_ctx_ring_doorbell(struct panthor_csg_slots_upd_ctx *ctx,
> +				       u32 csg_id)
> +{
> +	ctx->update_mask |= BIT(csg_id);
> +}
> +
>  static void csgs_upd_ctx_queue_reqs(struct panthor_device *ptdev,
>  				    struct panthor_csg_slots_upd_ctx *ctx,
>  				    u32 csg_id, u32 value, u32 mask)
> @@ -1944,7 +1950,8 @@ static void csgs_upd_ctx_queue_reqs(struct panthor_device *ptdev,
>  
>  	ctx->requests[csg_id].value = (ctx->requests[csg_id].value & ~mask) | (value & mask);
>  	ctx->requests[csg_id].mask |= mask;
> -	ctx->update_mask |= BIT(csg_id);
> +
> +	csgs_upd_ctx_ring_doorbell(ctx, csg_id);
>  }
>  
>  static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
> @@ -1961,8 +1968,12 @@ static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
>  	while (update_slots) {
>  		struct panthor_fw_csg_iface *csg_iface;
>  		u32 csg_id = ffs(update_slots) - 1;
> +		u32 req_mask = ctx->requests[csg_id].mask;
>  
>  		update_slots &= ~BIT(csg_id);
> +		if (!req_mask)
> +			continue;

Looks like something that should be in patch 7, where you update the
doorbell_req register, and then call csgs_upd_ctx_ring_doorbell(),
meaning req_mask can be zero. The other option would be to teach
panthor_csg_slots_upd_ctx about CS doorbells, and let
csgs_upd_ctx_apply_locked() toggle the doorbell_req.

> +
>  		csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
>  		panthor_fw_update_reqs(csg_iface, req,
>  				       ctx->requests[csg_id].value,
> @@ -1979,6 +1990,9 @@ static int csgs_upd_ctx_apply_locked(struct panthor_device *ptdev,
>  		int ret;
>  
>  		update_slots &= ~BIT(csg_id);
> +		if (!req_mask)
> +			continue;
> +
>  		csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
>  
>  		ret = panthor_fw_csg_wait_acks(ptdev, csg_id, req_mask, &acked, 100);

