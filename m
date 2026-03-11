Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFDEFD064D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 07:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTzctBCMZD3Bk1sOepQrQejw/EPb46U3djACzU87gK4=; b=lZ+OmkK2eu8x80CTOKF6EJmJ8k
	PkU+H/Nho67+pG5znClVQszCxZnjfHzWNxyIwQwBI1GD6ghZxL/aH8DIecHiuHd4V0enWpjBp4L9e
	HSdmTQ4Hj+EhJCkE4hhXIspGGQpJZxCMYfvuGA9NeY01inBn+gAMIGs5M6AsnxP4eOxjeh5ZjN0VI
	RgV6dh+v5R63iIVrJDXB0+xNYF3LVFE9iPjpCgka/JlHPEi7OzvGzANUI+hL3a5/SqtNSxgHRvDW8
	I7PR13oDpq7eQ7c9G1bOYAyyrLsPai/q45tlWHztNr9v5Pak1osv/30cVvUwy6d7sgFfrdh49u36z
	VvpNebFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EC2-0000000B4bR-0UlJ;
	Wed, 11 Mar 2026 07:41:22 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EBz-0000000B4ak-2Kkq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 07:41:20 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A4A2B4D20D;
	Wed, 11 Mar 2026 07:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773214877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pTzctBCMZD3Bk1sOepQrQejw/EPb46U3djACzU87gK4=;
	b=yQR9YVmQ/fD5SFLxECOR3pVfbEfYo9GD4SobepXD7gVB+xApeqHSjoJ8kOkpx4sEU5Q6cZ
	peB+jOHr1p/B0H6VvVLw0MIB99BmESI3iO6Rskv9L6qy/6XLeXkB9je7T8DpWPBkHpheRN
	73+D2Gr1cKZfnpfEhd/2fbVbeWTldFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773214877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pTzctBCMZD3Bk1sOepQrQejw/EPb46U3djACzU87gK4=;
	b=wT1+L4hddG0Y6LNap88NDaY3MISqTslaCe0IIjfzAgiA/XZuDiWbUt5kigjD2hVwG6ATVd
	wUnr94eXOGgRijAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yQR9YVmQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wT1+L4hd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773214877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pTzctBCMZD3Bk1sOepQrQejw/EPb46U3djACzU87gK4=;
	b=yQR9YVmQ/fD5SFLxECOR3pVfbEfYo9GD4SobepXD7gVB+xApeqHSjoJ8kOkpx4sEU5Q6cZ
	peB+jOHr1p/B0H6VvVLw0MIB99BmESI3iO6Rskv9L6qy/6XLeXkB9je7T8DpWPBkHpheRN
	73+D2Gr1cKZfnpfEhd/2fbVbeWTldFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773214877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pTzctBCMZD3Bk1sOepQrQejw/EPb46U3djACzU87gK4=;
	b=wT1+L4hddG0Y6LNap88NDaY3MISqTslaCe0IIjfzAgiA/XZuDiWbUt5kigjD2hVwG6ATVd
	wUnr94eXOGgRijAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 347D43F8DE;
	Wed, 11 Mar 2026 07:41:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Mk12C50csWmuYgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 11 Mar 2026 07:41:17 +0000
Message-ID: <b10efa5c-8b4c-48a4-a379-0cd90c7dc22d@suse.de>
Date: Wed, 11 Mar 2026 08:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 3/4] drm/mediatek: Set dedicated DMA device and
 drop custom GEM callbacks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260310032511.2545500-1-wenst@chromium.org>
 <20260310032511.2545500-4-wenst@chromium.org>
 <b2acf78f-4ff9-4e3f-802d-5318e6f25c20@suse.de>
 <CAGXv+5HJKjM77PdZjwUossTzrPx+LvgVaS=-sGcGNec77TJLzw@mail.gmail.com>
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
In-Reply-To: <CAGXv+5HJKjM77PdZjwUossTzrPx+LvgVaS=-sGcGNec77TJLzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,kernel.org,pengutronix.de,linux.intel.com,sholland.org,ffwll.ch,lists.linux.dev,sys-base.io,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:url,bootlin.com:url]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A4A2B4D20D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_004119_764083_4521CB4D 
X-CRM114-Status: GOOD (  32.75  )
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

Am 11.03.26 um 05:55 schrieb Chen-Yu Tsai:
> On Tue, Mar 10, 2026 at 4:21 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 10.03.26 um 04:25 schrieb Chen-Yu Tsai:
>>> In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
>>> use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
>>> drm_gem_dma_object, but custom callbacks were still needed to deal with
>>> using the first device of the pipeline as the DMA device, instead of
>>> the MMSYS device that the DRM driver binds to.
>>>
>>> Turns out there is already partial support for dedicated DMA devices in
>>> the DRM subsystem for PRIME imports. The preceding patches add support
>>> for dedicated DMA devices to the GEM DMA helpers.
>>>
>>> This allows us to just set the dedicated DMA device for the DRM device,
>>> and drop all the custom GEM callbacks. Also drop the .dma_dev field
>>> from the driver private data as it is no longer needed.
>> My impression is that this patch should be split up: first replace
>> dma_dev with the dma device; then replace the now-duplicate code with
>> shared helpers.
> I'm not sure which of the following you are thinking about:
>
> a) one patch with just the drm_dev_set_dma_dev() call,
>     one patch dropping the custom GEM callbacks
>
> In this case the first patch has no actual effect, since nothing is using
> drm_dev->dma_dev. I think this is not a good split.
>
> b) one patch adding drm_dev_set_dma_dev() and replacing priv->dma_dev
>     with drm_dev_dma_dev(),
>     one patch dropping the custom GEM callbacks
>
> In this case the first patch would modify a bunch of places that then
> get dropped in the second. The churn maybe isn't worth it.
>
> c) one patch adding drm_dev_set_dma_dev() and replacing
>     drm_gem_prime_import_dev() with drm_gem_prime_import(),
>     one patch dropping the custom GEM callbacks
>
> Functionally the second patch would depend on the first.

Not my call to make, but the driver maintainers.

What I meant was option b). Switching dma_dev for drm_dev_dma_dev() and 
replacing the mediatek code with common helpers can both introduce 
regressions.  Having two patches might make later bisecting easier.

>
>
> I still think having one single patch is better.
>
>>> There are slight differences in the mmap helper: the VM_DONTDUMP and
>>> VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj().
>>> VM_IO probably doesn't make sense since the buffer is allocated using
>>> dma_alloc_attrs().
>> We can add VM_DONTDUMP to gem-dma's mmap helper. [1] It's most likely
>> the right thing to not dump graphics buffers and standard practice in
>> most other GEM memory managers.
> Makes sense. I can add a patch to the series to do this.

Rather send it out separately. This affects many drivers and we 
shouldn't hide such a change somewhere in an unrelated series.

Best regards
Thomas

>
>> [1]
>> https://elixir.bootlin.com/linux/v6.19.6/source/drivers/gpu/drm/drm_gem_dma_helper.c#L537
>>
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>> The changes look correct, so I'm here's the
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> But this patch requires a review from the driver maintainer as well.
> Sure, and I need to respin the series because I forgot to remove the
> deleted file from the Makefile.
>
>
> Thanks
> ChenYu

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



