Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017C2C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oGAjaTYW9+9pgn++AOoLz4Ni470k5ZTJydWoPlVjGtw=; b=2KY/1oQzV5CHiaiIQQL64S6Ei7
	kW2fJxC/TInF2JAc/uba3gxycM1oLsAaG8MP9AXktBdr04CiKur2X2dLxMpoQnV3MeOmpk0BZ9CSv
	KXinefZKaX54HpE637nzgGHvgqP6zuINlpLDYu9DUKUE2LzVY/fXVhU6ZHzJ3zS3d2WJnd65YO05B
	IAhbfuDBx1jTaJ2HRKZZVc+1XV8HTJ1Le9SFlwUz2rIcyo2wBS0eN9G2mE5Y9V79lMhgd3sBVBUHu
	Pk/n/Ss58oiNJ8ygWs/lL6e5xcMMkw2qZJ6c4PLyevkKjY675v9Yod6LYpvoQ/qol/EOLLqSOUyJr
	VwALXAGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65QM-00000003TBl-3Jh5;
	Mon, 14 Sep 2026 12:04:38 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Q1-00000003Sxk-40sq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:04:19 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C998C21CB3;
	Mon, 14 Sep 2026 12:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789387451; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oGAjaTYW9+9pgn++AOoLz4Ni470k5ZTJydWoPlVjGtw=;
	b=s/8xx6Phz3C7iM/cwG9s8JXgPeKzTtz4W6E9+Uhp6s9Gs/q4fMObgrEZD/4NxhHiFsdcf2
	ZM6Qh/tVSkNxYVtWGvCqBcxrhMdAFYPiSEMCYMZJMlDj0tz/5VUQ+bZH8pksfb2JVTG+5w
	FfgjqwkQnXAe+9Pxe4TxSaAh9X5JSww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789387451;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oGAjaTYW9+9pgn++AOoLz4Ni470k5ZTJydWoPlVjGtw=;
	b=2aIGkYQw+Hgr38Ip6uo267G6WZ91VP7Dxuxusffo6tKuVt3zNSusGXVLwZxJU/AZQyjlmC
	6f5pD3OuLxnFrEAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Skls9UdH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VcjQ+Hdk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789387447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oGAjaTYW9+9pgn++AOoLz4Ni470k5ZTJydWoPlVjGtw=;
	b=Skls9UdHYfdXyf1+XvkwS6SIvprCy3p2rJCF1FKee5E3K2ZBAldyVbo19v4UyM2suOo0hX
	K1Un2SuqyTqASEvDn26RzJnN3TfWDLVGzrBodBbs+iYxanHJ5/zGZ4PWWdHYpkFSSMovwZ
	Rfv6uXQrwIIC4TLWe35YbO0yxYhEw08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789387447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=oGAjaTYW9+9pgn++AOoLz4Ni470k5ZTJydWoPlVjGtw=;
	b=VcjQ+HdkXxscPpMhk3xwqyl+LRC6Nrunw9/MnWxAoModxunwDKnTQyOJaYV9MteRSadyKe
	8Hi/lZQaLkSsc5Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 220F513693;
	Mon, 14 Sep 2026 12:04:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7pSXO7bip2ooAgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 14 Sep 2026 12:04:06 +0000
Message-ID: <b422004f-870c-4622-95c3-536798bb14ab@suse.de>
Date: Mon, 14 Sep 2026 14:04:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm: replace simple display pipe users with atomic
 helpers
To: Ze Huang <ze.huang@oss.qualcomm.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Hans de Goede <hansg@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, xen-devel@lists.xenproject.org
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
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
In-Reply-To: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C998C21CB3
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
	FREEMAIL_TO(0.00)[oss.qualcomm.com,synopsys.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,nxp.com,pengutronix.de,epam.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,suse.de:dkim,suse.de:email,suse.de:mid,suse.com:url,msgid.link:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_050418_315659_71A7BC90 
X-CRM114-Status: GOOD (  25.01  )
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

Am 26.07.26 um 21:45 schrieb Ze Huang:
> struct drm_simple_display_pipe was meant to simplify simple DRM
> drivers, but instead adds an extra wrapper around normal DRM atomic
> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
> should be converted to regular atomic helpers and stop depending on the
> simple-KMS interfaces.
>
> This series converts the following drivers:
>
>    - arcpgu
>    - aspeed
>    - mcde
>    - repaper
>    - tve200
>    - xen frontend

For these drivers:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

I've taken the rest of the series into drm-misc-next. We had 2 drivers 
tested and the others are variants of the same.

Best regards
Thomas


>
> Each patch replaces drm_simple_display_pipe_init() with explicit
> primary plane, CRTC and encoder setup, and moves the old simple-pipe
> callbacks into regular plane and CRTC helper callbacks named according
> to local driver conventions.
>
> The conversions preserve helper behavior that used to be implicit in
> drm_simple_kms_helper.c, including plane-state validation, CRTC
> primary-plane checks, affected-plane propagation, framebuffer prepare
> handling, and existing event/vblank flow where applicable.
>
> Result is less helper indirection and more explicit driver-side atomic
> wiring, with no remaining simple-KMS dependency in these drivers.
>
> Except for gm12u320, no hardware testing was performed.
>
> This series is based on drm-next-2026-06-27.
>
> AI usage disclosure:
> - I wrote the first two commits myself. The remaining patches were completed
>    with assistance from AI tools.
> - AI tools were also used to review the code and suggest code changes for
>    the DRM atomic conversion.
>
> Thanks,
> Ze Huang
>
> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
> ---
> Changes in v3:
> - Use atomic state from the commit path consistently in converted helpers:
>    fetch new CRTC/plane state from the commit in enable/update/flush paths, and
>    use drm_atomic_get_crtc_state() with PTR_ERR() handling in plane atomic_check
>    hooks before drm_atomic_helper_check_plane_state().
> - Move MCDE one-shot flow start from plane atomic_update() to CRTC
>    atomic_flush(), after pending vblank event handling.
> - Fix repaper damage update path to skip updates unless CRTC is active.
> - Fix arcpgu missing remote encoder node handling and lock CRTC state access in
>    debugfs.
> - Make container helpers static inline.
> - Link to v2: https://lore.kernel.org/r/20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com
>
> Changes in v2:
> - common changes:
> - create upcast helpers
> - use 'commit' as name of struct drm_atomic_commit in atomic helpers
> - improve control flow in *_crtc_helper_atomic_check() and
>    *_plane_helper_atomic_check()
> - Moved page-flip/vblank event handling out of plane update paths and into
>    CRTC atomic_flush(), using atomic_flush and disable paths for mcde,
>    pl111 and tve200
> - arcpgu:
>      - remove reduntant mod_supported helper
>      - change obsolete mode field to crtc->state->mode
> - mcde:
>      - drop attach of unused encoder
> - tve200:
>      - reorder connector/bridge attach
> - xen:
>      - change possible_crtcs mask to 0
> - Link to v1: https://patch.msgid.link/20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com
>
> ---
> Ze Huang (8):
>        drm/arcpgu: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/aspeed: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/pl111: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/repaper: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/tve200: replace struct drm_simple_display_pipe with regular atomic helpers
>        drm/xen: replace struct drm_simple_display_pipe with regular atomic helpers
>
>   drivers/gpu/drm/aspeed/aspeed_gfx.h      |  11 +-
>   drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 203 ++++++++++++++++++-------
>   drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
>   drivers/gpu/drm/mcde/mcde_display.c      | 248 ++++++++++++++++++++-----------
>   drivers/gpu/drm/mcde/mcde_drm.h          |  12 +-
>   drivers/gpu/drm/mcde/mcde_drv.c          |   3 +-
>   drivers/gpu/drm/pl111/pl111_display.c    | 199 ++++++++++++++++++-------
>   drivers/gpu/drm/pl111/pl111_drm.h        |   5 +-
>   drivers/gpu/drm/pl111/pl111_drv.c        |   3 +-
>   drivers/gpu/drm/tiny/arcpgu.c            | 201 +++++++++++++++++++------
>   drivers/gpu/drm/tiny/gm12u320.c          | 138 +++++++++++++----
>   drivers/gpu/drm/tiny/repaper.c           | 138 +++++++++++++----
>   drivers/gpu/drm/tve200/tve200_display.c  | 219 ++++++++++++++++++---------
>   drivers/gpu/drm/tve200/tve200_drm.h      |   6 +-
>   drivers/gpu/drm/tve200/tve200_drv.c      |  12 +-
>   drivers/gpu/drm/xen/xen_drm_front.h      |   6 +-
>   drivers/gpu/drm/xen/xen_drm_front_kms.c  | 188 ++++++++++++++++-------
>   17 files changed, 1155 insertions(+), 440 deletions(-)
> ---
> base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
> change-id: 20260704-drm-simple-kms-removal-01a031c6a129
>
> Best regards,

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, (HRB 36809, AG Nürnberg)



