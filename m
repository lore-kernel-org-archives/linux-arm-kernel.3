Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305A8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgVmW8xYosn9eiQExAeU/NJmJ4m2IB5bEc9w8himm7s=; b=hhPdzAs8pxNO+TxQDomV1vuota
	B9PaS4HF0IzQ36QofSlO+vXyNBjKp9dh5UBof7gulfzkGkLtCwCwQ23OSPzViwBpj8anaFAzYLbcF
	gFMRHP6d+u4OycRD62DJyKpnt1Gx4LsfNI9ZZztPZYx7P6nITYmiVvimKoFKlIzLJPugWhDBePAoc
	FRSPcyWTV0Ox1K1cuIG08gFy9LglhVIvsw4xS9Gd6rKlvmO5RTdcXMzyNfekk+lenmwKrCd6SikY9
	hK3FulWD4lUdQcV7wtgIuxNBWhOFoxcB8pneZRfYY0CYCi2E29thj4pFMwBTwHv0YKBFHFvqtbOsM
	mdllkRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYFB-0000000BGSw-3g8u;
	Tue, 14 Jul 2026 08:11:57 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYF1-0000000BGIf-2S5n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:11:51 +0000
Received: from localhost (unknown [95.24.34.24])
	by mail.ispras.ru (Postfix) with ESMTPSA id 5A8654077925;
	Tue, 14 Jul 2026 08:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 5A8654077925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1784016696;
	bh=VgVmW8xYosn9eiQExAeU/NJmJ4m2IB5bEc9w8himm7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4lfxtlvxBqvv4zXOJvCCqXRoI/MEwpNB1CjNePGU3E67/CoorkTnoxv1/H745dau
	 tC9O8dXloA/RvxHG+EZn8G8B26BNtcjdsrq/abqTTv3i1b6YAq3QAcW/tKUpGMGzJo
	 AkJi/MBCKrccOfzCB5pXZy8N0lIX2lC7Q0PCfqkQ=
Date: Tue, 14 Jul 2026 11:11:36 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Elizaveta Tereshkina <etereshkina@astralinux.ru>
Cc: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simona Vetter <simona@ffwll.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, lvc-project@linuxtesting.org, 
	Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Ethan Tidmore <ethantidmore06@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [lvc-project] [PATCH 5.10/5.15] drm/sun4i: backend: fix error
 pointer dereference
Message-ID: <20260714110040-3d9d1292810372916773a64a-pchelkin@ispras>
References: <20260713175238.715526-1-etereshkina@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713175238.715526-1-etereshkina@astralinux.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_011148_911945_9422C6FE 
X-CRM114-Status: GOOD (  18.40  )
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

On Mon, 13. Jul 20:52, Elizaveta Tereshkina wrote:
> From: Ethan Tidmore <ethantidmore06@gmail.com>
> 
> commit 06277983eca4a31d3c2114fa33d99a6e82484b11 upstream.
> 
> The function drm_atomic_get_plane_state() can return an error pointer
> and is not checked for it. Add error pointer check.
> 
> Detected by Smatch:
> drivers/gpu/drm/sun4i/sun4i_backend.c:496 sun4i_backend_atomic_check() error:
> 'plane_state' dereferencing possible ERR_PTR()
> 
> Fixes: 96180dde23b79 ("drm/sun4i: backend: Add a custom atomic_check for the frontend")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Link: https://patch.msgid.link/20260217014801.60760-1-ethantidmore06@gmail.com
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> Signed-off-by: Elizaveta Tereshkina <etereshkina@astralinux.ru>
> ---
> Backport fix for CVE-2026-53066
>  drivers/gpu/drm/sun4i/sun4i_backend.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
> index d935f36a24dd..b3741827c6c3 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -507,6 +507,9 @@ static int sun4i_backend_atomic_check(struct sunxi_engine *engine,
>  	drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
>  		struct drm_plane_state *plane_state =
>  			drm_atomic_get_plane_state(state, plane);
> +		if (IS_ERR(plane_state))
> +			return PTR_ERR(plane_state);
> +
>  		struct sun4i_layer_state *layer_state =
>  			state_to_sun4i_layer_state(plane_state);
>  		struct drm_framebuffer *fb = plane_state->fb;

This would trigger a really unnecessary build warning due to lack of
commit b5ec6fd286df ("kbuild: Drop -Wdeclaration-after-statement") in
5.10/5.15 kernels.

I wonder if that commit can just be ported to 5.10/5.15.  You may consider
it.

Otherwise the current backport should be adapted to avoid declarations
after statements.

