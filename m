Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC24C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 06:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZfHVtVmVM5oN6Gv97zhITZkPUF7tRn+9NDXWKgloNE=; b=hDKIJ1cjwJ3gRs1OgjYCjuc59K
	NVAMp4RiUmidO+SC14HEUwOhcBZ4SaZOcwA3HggZffXHSnJLIRGNbMos6gCByfUBA6THcqY3bSeEz
	I1cZhKU4sZVa2VutZE+sYxdfbUY0cRni2TnKftIPL/3kjhkA+MF0Qausnvq7ElUwUmNMTJG27jvgt
	0XYEqLrkw00VFRlhNvHDqYWiYmM1B5yD28tok9MNbvEjJ6qi5VYUSSRObtgILIFBGREikWGZPT96y
	2n1R6vRFXUiJ6MjRks6/VxKBBVQm2w/KIbGw+IBdMa/RSrR9Do39glCVo4rKYG+X8c10Is96Sx8vi
	EsS7NjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubw2l-00000006w3F-2aGM;
	Wed, 16 Jul 2025 06:55:07 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubvlW-00000006uFE-2ZTU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 06:37:19 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 161A61F38E;
	Wed, 16 Jul 2025 06:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752647837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xZfHVtVmVM5oN6Gv97zhITZkPUF7tRn+9NDXWKgloNE=;
	b=qnwIerMEigYjmRoH63MhQ2F8qHfn/qwWnukGCoxeULrFQdret3Nr878tpIIRt0f3WUw2jo
	yRq8D7hXwt25nBGJ9fgrXGvcnaSoN4SKBhyDA1PgTqK4mSR6UQ3/4LR4jJDI8O7K/kuEtY
	mOIico+j8cUNFa137AL+799vfEFOG/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752647837;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xZfHVtVmVM5oN6Gv97zhITZkPUF7tRn+9NDXWKgloNE=;
	b=D4NY2lZIynl/dOtjjKaUsvPj0Gdplol6G9o7xbWoKrOXCIW8KKC95Mu1LS3HH1kHRzI9r1
	B9GMU4DbsawkP+BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qnwIerME;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=D4NY2lZI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752647837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xZfHVtVmVM5oN6Gv97zhITZkPUF7tRn+9NDXWKgloNE=;
	b=qnwIerMEigYjmRoH63MhQ2F8qHfn/qwWnukGCoxeULrFQdret3Nr878tpIIRt0f3WUw2jo
	yRq8D7hXwt25nBGJ9fgrXGvcnaSoN4SKBhyDA1PgTqK4mSR6UQ3/4LR4jJDI8O7K/kuEtY
	mOIico+j8cUNFa137AL+799vfEFOG/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752647837;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xZfHVtVmVM5oN6Gv97zhITZkPUF7tRn+9NDXWKgloNE=;
	b=D4NY2lZIynl/dOtjjKaUsvPj0Gdplol6G9o7xbWoKrOXCIW8KKC95Mu1LS3HH1kHRzI9r1
	B9GMU4DbsawkP+BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C8DC13306;
	Wed, 16 Jul 2025 06:37:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QVcZGZxId2hobgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 16 Jul 2025 06:37:16 +0000
Message-ID: <a6c121b5-3afa-4561-b71a-d8feb1cc19f8@suse.de>
Date: Wed, 16 Jul 2025 08:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] drm/panel: panel-samsung-s6e63m0: Include
 <linux/of.h>
To: Sebastian Reichel <sre@kernel.org>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, deller@gmx.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io,
 neal@gompa.dev, support.opensource@diasemi.com, duje.mihanovic@skole.hr,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-3-tzimmermann@suse.de>
 <67hurwpxz4c2ropgbq3q6umybr2fgucgtbdu4qc6y3qk3uypc4@3xkijgin5ydl>
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
In-Reply-To: <67hurwpxz4c2ropgbq3q6umybr2fgucgtbdu4qc6y3qk3uypc4@3xkijgin5ydl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,gmx.de,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,diasemi.com,skole.hr,lists.freedesktop.org,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 161A61F38E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_233718_810508_1DF680A0 
X-CRM114-Status: GOOD (  12.42  )
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

Am 16.07.25 um 01:43 schrieb Sebastian Reichel:
> Hi,
>
> On Tue, Jul 15, 2025 at 02:24:39PM +0200, Thomas Zimmermann wrote:
>> Include <linux/of.h> to declare device_property_read_u32(). Avoids
>> dependency on backlight header to include it.
> device_property_*() is from <linux/property.h>, which is already
> included in the following line...

Oh, that has been fixed already by commit d1a1807bae39 ("drm/panel: 
panel-samsung-s6e63m0: Include <linux/property.h>") from last October. 
Some of the patches in this series have been written a while ago. The 
one here is from Feb 2024. I'll double check the others, there might be 
similar cases. Thanks for reviewing.

Best regards
Thomas

>
> Greetings,
>
> -- Sebastian
>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
>> index ea241c89593b..930948cb615f 100644
>> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
>> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/export.h>
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/module.h>
>> +#include <linux/of.h>
>>   #include <linux/property.h>
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/media-bus-format.h>
>> -- 
>> 2.50.0
>>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


