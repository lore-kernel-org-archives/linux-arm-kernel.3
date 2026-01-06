Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FE8C47BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZMd8pyi2Ng27hFZCjUicriYkoxmsVsQ2fdtQlOLHXZI=; b=JD584vUxGwG/lxAe9pSAP2j3Jf
	fCUG3PWTm0RVtmHTxTefr7SbkDo5xE4gEjZCE/EtSRhCimvj8NiAQR1v+TyK3Bsl21nNQLXejXqSH
	fWm9W9t+rQL6yM2uHkp3oEEvfWGU5j4lPx2pyxbFbwjx2FQy5Y+0//w1wzzWctI3GxQyR85jk1nJg
	dkOgR2Yp2OplC+IwVOuYaNFuMzjNq9PYliyXJEeoafeUktxAkNUYkVSmnLwDa+CHlbK/15u2A2zF+
	MM79ThzbKRKBzE1ODjXt2W9uebJoQxFJZQOt3Zj7n4AEKNUUZnCkmUaOi2S7cSy0eKV+9cDM4tx2d
	QtsPd7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2eL-0000000CdCv-1sE7;
	Tue, 06 Jan 2026 08:42:45 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd2eJ-0000000CdCZ-1aX6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 08:42:44 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6FB0F5BCC4;
	Tue,  6 Jan 2026 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767688961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZMd8pyi2Ng27hFZCjUicriYkoxmsVsQ2fdtQlOLHXZI=;
	b=UZ7SW50OnYmY5ndgtRWiuEMLlU18MpLMTyEQIF+bKJ+n/7u+lAFB76kYLAfrHvAG6FwL7Z
	+l2DH5B/k5UoyODKHcnbcx2LtOL9CD6AX323oNyskHNuq0pk3wmpYHaTMCR5vTU/pqLJDL
	DI3Y6SsvXKs8M7r3t389FIMCONTNS7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767688961;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZMd8pyi2Ng27hFZCjUicriYkoxmsVsQ2fdtQlOLHXZI=;
	b=3iK3ac6w8OgjVDXkXag/ztPyHhm22nOXsyuKEtpi3n/DTErY4VtVQuUHjDyJA3c6KBlZat
	5JYubuHs7fNdq8Bg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767688961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZMd8pyi2Ng27hFZCjUicriYkoxmsVsQ2fdtQlOLHXZI=;
	b=UZ7SW50OnYmY5ndgtRWiuEMLlU18MpLMTyEQIF+bKJ+n/7u+lAFB76kYLAfrHvAG6FwL7Z
	+l2DH5B/k5UoyODKHcnbcx2LtOL9CD6AX323oNyskHNuq0pk3wmpYHaTMCR5vTU/pqLJDL
	DI3Y6SsvXKs8M7r3t389FIMCONTNS7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767688961;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZMd8pyi2Ng27hFZCjUicriYkoxmsVsQ2fdtQlOLHXZI=;
	b=3iK3ac6w8OgjVDXkXag/ztPyHhm22nOXsyuKEtpi3n/DTErY4VtVQuUHjDyJA3c6KBlZat
	5JYubuHs7fNdq8Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1918A3EA63;
	Tue,  6 Jan 2026 08:42:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KhgEAwHLXGlZQQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 06 Jan 2026 08:42:41 +0000
Message-ID: <93d715b1-cee0-4067-a8ff-1dce562bd083@suse.de>
Date: Tue, 6 Jan 2026 09:42:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: xlnx: zynqmp_kms: 16 bpp fixes for Xorg startup
 on AMD KV260
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
 <533168f1-1655-4947-9032-b08463f502d7@ideasonboard.com>
 <aUVFUx55XTjb_2nO@nuoska> <aUkIQjKpd3MhNHjk@nuoska>
 <5f570a3b-7bee-43e0-9a36-3d106984fec6@suse.de>
 <3d214bf3-6b52-4942-95d9-0504fa6f5877@ideasonboard.com>
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
In-Reply-To: <3d214bf3-6b52-4942-95d9-0504fa6f5877@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.991];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.infradead.org,vger.kernel.org,ideasonboard.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,amd.com,linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_004243_716515_71AFFE0B 
X-CRM114-Status: GOOD (  26.93  )
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

Am 06.01.26 um 09:29 schrieb Tomi Valkeinen:
> Hi,
>
> On 06/01/2026 09:41, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 22.12.25 um 09:58 schrieb Mikko Rapeli:
>>> Hi,
>>>
>>> On Fri, Dec 19, 2025 at 02:30:11PM +0200, Mikko Rapeli wrote:
>>>> On Fri, Dec 19, 2025 at 01:59:14PM +0200, Tomi Valkeinen wrote:
>>>>> On 05/12/2025 14:37, Mikko Rapeli wrote:
>>>>>> Currently on default yocto images Xorg fails to start on AMD KV260
>>>>>> because 24/32 color depth gets detected but does not actually work.
>>>>>>
>>>>>> These two patches fix the issue and now 16 bpp gets detected
>>>>>> and Xorg starts and draws on external HDMI display using
>>>>>> kernel.org based linux-yocto kernel.
>>>>>>
>>>>>> Anatoliy Klymenko (1):
>>>>>>     drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
>>>>>>
>>>>>> Mikko Rapeli (1):
>>>>>>     drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
>>>>>>
>>>>>>    drivers/gpu/drm/xlnx/zynqmp_kms.c | 3 ++-
>>>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>> Did you notice the few already sent serieses on the list where the
>>>>> topic
>>>>> has been discussed?
>>>>> [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
>>>>> [PATCH 0/3] drm: zynqmp: Make the video plane primary
>>>> Oh I wasn't aware of these.
>>>>
>>>>> Or is there something else on KV260 that messes up the 24 bit color?
>>>> These look very similar and likely fix the X11 startup. I will give them
>>>> a try.
>>> Right, now I've tested:
>>>
>>>    * these patches from Anatoliy and me to help X11 use 16bpp mode by
>>> default
>>>      and removes the need to manually setup Xorg for 16bpp
>>>    * "drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888" which enables
>>> the X11 default
>>>      24bpp to work, no need to set Xorg config to 16bpp
>>>    * "drm: zynqmp: Make the video plane primary" which also fixes the
>>> X11 default
>>>      24bpp to work, no need to set Xorg config to 16bpp
>>>
>>> All of these fix HDMI graphics output on AMD KV260 board with yocto
>>> genericarm64 machine
>>> and core-image-sato image which includes Xorg. The graphics rendering
>>> is still
>>> very slow but I think that is a different problem.
>>>
>>> I guess the last series from Sean Anderson is moving forward so I'll
>>> reply to that thread separately.
>> Just want to say that the series here improves xlnx and makes it a
>> 'better' driver. IMHO the changes should be merged independently from
>> what happens with the other series.
> I might be missing something, but I don't think I fully agree. Yes, the
> userspace doesn't seem to be able to cope with the current upstream
> driver behavior (even if it's not wrong as such, afaics), so in that
> sense this series is better. But I don't think (almost) anyone really
> wants to use RGB565 if XRGB8888 is an option? And that's what the other
> series is trying to achieve, and that series conflicts with this one.
>
> So I'd rather try to get a conclusion on Sean's series (or the other one
> from Mike). If that effort fails, we could go with this series as a backup.

My point wasn't really about the color format. I meant that the 
preferred_depth field should always be set. If you see my comment on 
patch 1, passing NULL to drm_client_setup() and letting it auto-pick the 
format from preferred_depth would also make sense.

Best regards
Thomas

>
>   Tomi
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



