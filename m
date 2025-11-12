Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CFECCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWtOzO4TJX0uTNe9MuvcTLV/aHSmL/v0DaZqTvOvdXE=; b=jR4lvxpUFimobLxYxOx8KQ1Tl1
	gFmpWaw3NsAX1AONxnbmfgfbhqn8JzL1ceZSp1ybdfGgvgal1lFZSNme5g8w+l5D+cAZtdVg7FLn2
	/0ynHcw3a0MvtI7eSy7N+n1m2ygMIWt2jqs40G9ybLdFmnMLuMrz5ipB/lkTkF0eHDBvYtmx7LMR0
	UeTx1ZFQxBAxoGzeGXr7xQhJF2CGnkNqVJL7lPGVcS31LWvwb0lAi66aicN744qQCWHxPFPbmNF2g
	0wlCvjMJaDMZhVHXGgkLKFfI0qdy+mf4V0oar60aT59IvQupXP0zFou66i0IFgYwnaCKHM1SLIyhV
	in9g9IiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAfN-00000008pGW-3XHM;
	Wed, 12 Nov 2025 13:13:41 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJAfK-00000008pF9-1QNF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:13:40 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6DABA21241;
	Wed, 12 Nov 2025 13:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762953214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zWtOzO4TJX0uTNe9MuvcTLV/aHSmL/v0DaZqTvOvdXE=;
	b=k4XWVtcpwkIqO/gQbs0wAthaYioPR+APtI0onfVf1j4PKeewSeAGbiWMYM6ytIU+/7sQC9
	/cAL5Vg1kfh1ts5pZ79CtEhr2XhUxdSczAZaVJBgw/X3dlOjdyp2pvcJlhxduVXMgxcVYV
	vjU5ilYFWVCLzE+tdqA0nXKU3NAgCTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762953214;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zWtOzO4TJX0uTNe9MuvcTLV/aHSmL/v0DaZqTvOvdXE=;
	b=Uym1b+Xn4lC7WBw6oV4NZgmO4ipL4sqdo7fnbzsoqgWy3u/IOQykV3/oxdekcZdfxozsM4
	cptEkT7Pv+CZ2OCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1762953213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zWtOzO4TJX0uTNe9MuvcTLV/aHSmL/v0DaZqTvOvdXE=;
	b=fB9vl8BMjGwluycP6e9jKL6hNb3B+DQvfcqRQPKod5tVyewR+kCtuQHMKk+/qTdnRlkCwV
	n+7we4HoxEX/8nCYq1lTrUFsxLo+h+ES3xz/Rm3Egs3dV10bidv+cS5YscYnie9pVZHeld
	DMAcl9Aowjnw7FUIBNElyogCAhoj3h0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1762953213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zWtOzO4TJX0uTNe9MuvcTLV/aHSmL/v0DaZqTvOvdXE=;
	b=hYHNjOxfjqU6a6ka6A+wIQOHbQjbqCRsh4x1eJeiaNpQNTQSqst35zxpC30I2ANW0OP7eq
	CvibwzBgrJ96mbDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 191AC3EA61;
	Wed, 12 Nov 2025 13:13:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3zSOBP2HFGkLYwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 12 Nov 2025 13:13:33 +0000
Message-ID: <47c066fd-fbaa-4f63-a7e5-2da06eb72532@suse.de>
Date: Wed, 12 Nov 2025 14:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/imx/ipuv3: Fix dumb-buffer allocation for non-RGB
 formats
To: Philipp Zabel <p.zabel@pengutronix.de>, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251104153832.189666-1-tzimmermann@suse.de>
 <782dd8af786ff402fa8b334264f189be2919d7a7.camel@pengutronix.de>
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
In-Reply-To: <782dd8af786ff402fa8b334264f189be2919d7a7.camel@pengutronix.de>
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com,oss.qualcomm.com,linux.intel.com,ffwll.ch];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:url,infradead.org:email,suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_051338_715621_71132996 
X-CRM114-Status: GOOD (  18.29  )
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

Am 12.11.25 um 13:53 schrieb Philipp Zabel:
> On Di, 2025-11-04 at 16:38 +0100, Thomas Zimmermann wrote:
>> Align pitch to multiples of 8 pixels for bpp values that do not map
>> to RGB formats. The call to drm_driver_color_mode_format() fails with
>> DRM_INVALID_FORMAT in these cases. Fall back to manually computing
>> the pitch alignment from which drm_mode_size_dumb() can compute the
>> correct pitch.
>>
>> Fixes userspace that allocates dumb buffers for YUV formats, where
>> bpp equals 12. A common example is the IGT kms_getfb test.
>>
>> v2:
>> - ignore width in calculation
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: b1d0e470f881 ("drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()")
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: imx@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>> This patch is based on Dmitry's fix for msm. [1] Please test.
> Thank you,
>
> [IGT] kms_getfb: finished subtest getfb2-accept-nv12, CRASH -> SUCCESS
>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
>
>> There could later be a helper to contain these aligmentment calculations
>> in a single place.
>>
>> [1] https://lore.kernel.org/dri-devel/20251103-drm-msm-fix-nv12-v2-1-75103b64576e@oss.qualcomm.com/
>> ---
>>   drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
>> index 465b5a6ad5bb..eddb471119c6 100644
>> --- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
>> +++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
>> @@ -144,7 +144,6 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
>>   			       struct drm_mode_create_dumb *args)
>>   {
>>   	u32 fourcc;
>> -	const struct drm_format_info *info;
>>   	u64 pitch_align;
>>   	int ret;
>>   
>> @@ -156,12 +155,15 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
>>   	 * the allocated buffer.
>>   	 */
>>   	fourcc = drm_driver_color_mode_format(drm, args->bpp);
>> -	if (fourcc == DRM_FORMAT_INVALID)
>> -		return -EINVAL;
>> -	info = drm_format_info(fourcc);
>> -	if (!info)
>> -		return -EINVAL;
>> -	pitch_align = drm_format_info_min_pitch(info, 0, SZ_8);
>> +	if (fourcc != DRM_FORMAT_INVALID) {
>> +		const struct drm_format_info *info = drm_format_info(fourcc);
>> +
>> +		if (!info)
>> +			return -EINVAL;
>> +		pitch_align = drm_format_info_min_pitch(info, 0, 8);
>> +	} else {
>> +		pitch_align = DIV_ROUND_UP(args->bpp, SZ_8) * 8;
>> +	}
>>   	if (!pitch_align || pitch_align > U32_MAX)
>>   		return -EINVAL;
>>   	ret = drm_mode_size_dumb(drm, args, pitch_align, 0);
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thanks a lot. I'll land this fix ASAP.

Best regards
Thomas

>
> regards
> Philipp

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



