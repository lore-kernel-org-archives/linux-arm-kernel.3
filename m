Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A31EBFD3A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 10:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rtvTOG4vHz5JW+ejkz14WCIcFGn00NUmXjad2BxqBC4=; b=CntLMd0Z2np7AIxW87t/qpwX2s
	5bO+RMzytjMcpme2wdwlocGzem7AIl5q4GVZdYVZL0mNObznd8+ZlR7SR/DHeN8luaKScSq4hKOjV
	YXgD+3D5i9meXcJ9Kf18OQTnSzN4A1Y5I9yoY5jLa9dsHV6FeBGoXDkJtOUNc3lnMtncIL27IpTao
	sUZBUtkNJ+kEOJz9SXqYVpFW1gb/naMcU18PZ0xw8TUZIZixbkmIgbZx4crvNs2keRZD07rrq0QuM
	8dx333I7540TeehaZa4gfowUwPh1MjgJzJ5Pf3ONqSaV04+uqibpVszMDGdJYd0ONsARX7++pj+j1
	JlguUVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEz9-0000000FXIG-3Okl;
	Mon, 13 Apr 2026 10:57:43 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCEz0-0000000FXBc-32rL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 10:57:42 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8F89C6A8A2;
	Mon, 13 Apr 2026 10:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776077853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rtvTOG4vHz5JW+ejkz14WCIcFGn00NUmXjad2BxqBC4=;
	b=dxIsGqEpsHoQixcNWqW5OrvhcmE8kyu39UNykMC8Z3LU+QxfNnxKTuhcimr7JMabJDE7Bz
	NouIBdH59eV1DblqB5c2jQZu31dACtpPAI1pEz+PrI6/NmG/1KtALKc8VzBMXMCgzD4zuN
	9emJ6YsHK4jRQFsiEqCjzArVkPMBvmQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776077853;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rtvTOG4vHz5JW+ejkz14WCIcFGn00NUmXjad2BxqBC4=;
	b=9qR+vPCxG8UaeGPn7ugUVf9AGewqR39N+H2v//03Moo5yX/5jk9/EtpDlv9sj5Sb3yrIkm
	GK+M8tYpftjmAADA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SfiFwSz0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1F57HNJj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776077852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rtvTOG4vHz5JW+ejkz14WCIcFGn00NUmXjad2BxqBC4=;
	b=SfiFwSz0mbuIS38T/CoBuK8/YkfkF5wrDvLm3V58cHHN3aegKyFseHmEqduKRoFGei3y/f
	DDPL19CTIssAhm48uZ/yNBfl2WTR3hTr7QikyJizAK6QmW87Pkt3YF06ImYs8DAe3U3NSm
	6c9Hin/+BHJjxfKrc2Vj9L296b8cxfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776077852;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rtvTOG4vHz5JW+ejkz14WCIcFGn00NUmXjad2BxqBC4=;
	b=1F57HNJjd67TJYMZGyVaqlkks2HUMF0n0gRKF/brGVbfP9n9Is8k52AfbiVeI7y/sinXWw
	o28a1fJ7hhqDT0AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32A814AE4E;
	Mon, 13 Apr 2026 10:57:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N+nWChzM3GnUKQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 13 Apr 2026 10:57:32 +0000
Message-ID: <545d02d2-e66e-4c33-b0b3-3b3482949fbb@suse.de>
Date: Mon, 13 Apr 2026 12:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Open-code
 drm_simple_encoder_init()
To: shivamkalra98@zohomail.in, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260403-drm-mediatek-opencode-encoder-init-v1-1-7be86241b876@zohomail.in>
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
In-Reply-To: <20260403-drm-mediatek-opencode-encoder-init-v1-1-7be86241b876@zohomail.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[zohomail.in,kernel.org,pengutronix.de,gmail.com,ffwll.ch,collabora.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zohomail.in:email,suse.de:dkim,suse.de:mid,suse.de:email,suse.com:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 8F89C6A8A2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_035735_083453_42DE0BE3 
X-CRM114-Status: GOOD (  18.92  )
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



Am 03.04.26 um 14:00 schrieb Shivam Kalra via B4 Relay:
> From: Shivam Kalra <shivamkalra98@zohomail.in>
>
> The helper drm_simple_encoder_init() is a trivial wrapper around
> drm_encoder_init() that only provides a static drm_encoder_funcs with
> .destroy set to drm_encoder_cleanup(). Open-code the initialization
> with a driver-specific instance of drm_encoder_funcs and remove the
> dependency on drm_simple_kms_helper.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>

Looks good.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
> Addresses the "Open-code drm_simple_encoder_init()" task from
> Documentation/gpu/todo.rst.
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 53360b5d12ba..5b83ca6aecb2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -25,8 +25,8 @@
>   #include <drm/drm_bridge_connector.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_encoder.h>
>   #include <drm/drm_of.h>
> -#include <drm/drm_simple_kms_helper.h>
>   
>   #include "mtk_ddp_comp.h"
>   #include "mtk_disp_drv.h"
> @@ -993,6 +993,10 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
>   	.debugfs_init = mtk_dpi_debugfs_init,
>   };
>   
> +static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
>   void mtk_dpi_start(struct device *dev)
>   {
>   	struct mtk_dpi *dpi = dev_get_drvdata(dev);
> @@ -1026,8 +1030,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>   	int ret;
>   
>   	dpi->mmsys_dev = priv->mmsys_dev;
> -	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
> -				      DRM_MODE_ENCODER_TMDS);
> +	ret = drm_encoder_init(drm_dev, &dpi->encoder, &mtk_dpi_encoder_funcs,
> +			       DRM_MODE_ENCODER_TMDS, NULL);
>   	if (ret) {
>   		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
>   		return ret;
>
> ---
> base-commit: 4b9c36c83b34f710da9573291404f6a2246251c1
> change-id: 20260403-drm-mediatek-opencode-encoder-init-36336e4c4ff3
>
> Best regards,
> --
> Shivam Kalra <shivamkalra98@zohomail.in>
>
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



