Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6F1D2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CyUWdZjlGf+eiDMxcSrzxFgST9U7F5Qpd+1GXGl9B4=; b=ictCj2LFIVtkrM8Sgo2ocitsOf
	BqiKhlGuyCX+f4M1jQ5880z45A0kcrtzFGrq8pYXyY0UK7+d6B7g7AF9IDlk0JpTbU4pN0bW/t9NN
	g2ZaeOD6oJmr6y1kRL7kc4V1zQtK228HaGYaf1W8l2h3rIzx6utf+/aIZW5KebLJ4IWhUzWQXy1HA
	fuQNW8ZGvHAlqZmvalyAwLWP0J1zxTkZB7xPIPOO9/V53M37/bNrzq3jkYw1Tf+6r6WsETgWMuI1j
	NrP3rGc/c7Mhxp32xP0wmYsJTviP3mi3gGnX1fVfuR2mPRj7avk3qNFJzmv3K9knoQYcbq8+wB1Yq
	wVZSjB8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBDp-00000003ryE-1WXb;
	Tue, 20 Jan 2026 12:52:37 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBDm-00000003rxF-0kHG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:52:35 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5E6FC5BCC3;
	Tue, 20 Jan 2026 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768913552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+CyUWdZjlGf+eiDMxcSrzxFgST9U7F5Qpd+1GXGl9B4=;
	b=P5yMkq8K3xAVbBVI4bWeEHk+nF7HFwHCIHdoBHL5OCZtM4zLmsitrPcoMCNhL06AoLyZn6
	OxJF0TNWLzjvBtfptB/oYpDInMn0mNFlhaK3PNawxmECboS0R0oJ2aE0ZcGOpxnfBJd7r0
	hSgRi2Pg/VKSUcSOcZVh/OL0fHUYIzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768913552;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+CyUWdZjlGf+eiDMxcSrzxFgST9U7F5Qpd+1GXGl9B4=;
	b=Bpi4Eyq2eHGByTg1r9V8H0GbIRWGjNpvsNO8bu6yOq3u0b0xJ3qFr4X/9OEda7ZHEydq8e
	QcShn3sp7lWenQDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768913551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+CyUWdZjlGf+eiDMxcSrzxFgST9U7F5Qpd+1GXGl9B4=;
	b=SlwMQumc/WUECMGZTW8FgUO4fbUBxO0UTTHQFH6oQTM1Gm12JdgLd3E4RM3Lnq9I0x9E1p
	J1pHw+YBzt5h/blo3YocWn7+oj0hL5fN7r57zPZ3SCHyQSVwQTfOqgPIITFa6250Ntk9e0
	WFLHkopyW8U4oSUPzmxSVwBgdKbOcqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768913551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+CyUWdZjlGf+eiDMxcSrzxFgST9U7F5Qpd+1GXGl9B4=;
	b=CQyBSX4m+bg0expyQM1xEj2Mbft+3Vby7tOWmLQYEuRgOEEfioX0aY9jKWr+UECFvN/FN8
	sUUpREyE2U7+wqBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 02D113EA63;
	Tue, 20 Jan 2026 12:52:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id alxvOY56b2kGfgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 20 Jan 2026 12:52:30 +0000
Message-ID: <956a5ead-cc3b-41de-8431-2f03aaee3c71@suse.de>
Date: Tue, 20 Jan 2026 13:52:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] drm/rockchip: vop2: Switch impossible pos
 conditional to WARN_ON
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
 <20251206-vop2-atomic-fixups-v2-2-7fb45bbfbebd@collabora.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20251206-vop2-atomic-fixups-v2-2-7fb45bbfbebd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[collabora.com,rock-chips.com,sntech.de,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:helo,collabora.com:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_045234_510210_37645FA0 
X-CRM114-Status: GOOD (  19.69  )
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

Hi

Am 06.12.25 um 21:45 schrieb Nicolas Frattaroli:
> From: Daniel Stone <daniels@collabora.com>
>
> We already clip the plane to the display bounds in atomic_check, and
> ensure that it is sufficiently sized. Instead of trying to catch this
> and adjust for it in atomic_update, just assert that atomic_check has
> done its job.
>
> Signed-off-by: Daniel Stone <daniels@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 29 +++++++++-------------------
>   1 file changed, 9 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 20b49209ddcd..81b3eba07095 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1214,28 +1214,17 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
>   	src_w = drm_rect_width(src) >> 16;
>   	src_h = drm_rect_height(src) >> 16;
>   	dsp_w = drm_rect_width(dest);
> -
> -	if (dest->x1 + dsp_w > adjusted_mode->hdisplay) {
> -		drm_dbg_kms(vop2->drm,
> -			    "vp%d %s dest->x1[%d] + dsp_w[%d] exceed mode hdisplay[%d]\n",
> -			    vp->id, win->data->name, dest->x1, dsp_w, adjusted_mode->hdisplay);
> -		dsp_w = adjusted_mode->hdisplay - dest->x1;
> -		if (dsp_w < 4)
> -			dsp_w = 4;
> -		src_w = dsp_w * src_w / drm_rect_width(dest);
> -	}
> -
>   	dsp_h = drm_rect_height(dest);
>   
> -	if (dest->y1 + dsp_h > adjusted_mode->vdisplay) {
> -		drm_dbg_kms(vop2->drm,
> -			    "vp%d %s dest->y1[%d] + dsp_h[%d] exceed mode vdisplay[%d]\n",
> -			    vp->id, win->data->name, dest->y1, dsp_h, adjusted_mode->vdisplay);
> -		dsp_h = adjusted_mode->vdisplay - dest->y1;
> -		if (dsp_h < 4)
> -			dsp_h = 4;
> -		src_h = dsp_h * src_h / drm_rect_height(dest);
> -	}
> +	/* drm_atomic_helper_check_plane_state calls drm_rect_clip_scaled for
> +	 * us, which keeps our planes bounded within the CRTC active area
> +	 */
> +	WARN_ON(dest->x1 + dsp_w > adjusted_mode->hdisplay);
> +	WARN_ON(dest->y1 + dsp_h > adjusted_mode->vdisplay);
> +	WARN_ON(dsp_w < 4);
> +	WARN_ON(dsp_h < 4);
> +	WARN_ON(src_w < 4);
> +	WARN_ON(src_h < 4);

This should also use drm_WARN_ON().  But maybe rather leave it out 
entirely? I don't remember having seen other drivers to re-test in 
atomic_update.

Best regards
Thomas


>   
>   	/*
>   	 * This is workaround solution for IC design:
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



