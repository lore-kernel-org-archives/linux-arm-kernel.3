Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611EFCFC294
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 16:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2EbQbMBVh+wtPe2xKxStWSFqDMGQxv4HinVXPej2xOg=; b=U2clCXcCa/gLvvKVT0tDXWg6Rm
	fwRGX2cKLfGaWa7f9llrdRxJpyuqtYjkNJYIbKEeC2rBck/ogLSVCjjaiFiNT68pw8GX0yAFI4EHn
	1VjEX65HNc9czgTye1L1VonlgMioSAPDUvR1wgCRpCw+vn2gpy3FSKuffdrJXy/h+Ber9nh9a08us
	/YF7nVCLH1eRbcbdNL/em0RpqL5SJad/oygEpxaIErF32WyAlbw1Pp9ZpJ8xs9LP1fKLLih5Ixa7q
	7zC5KN6cpQ8UeUr0ziZBwaEODmtuuUTvgCrk8+f76oqpWN+NZZ2zWw+kttNChAiPKJXcyD5FhUt3g
	/a6zzy0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTxx-00000008i8E-3W8F;
	Fri, 21 Nov 2025 16:26:33 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMTxY-00000008i54-0FVQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 16:26:33 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 787425BCC3;
	Fri, 21 Nov 2025 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763742366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2EbQbMBVh+wtPe2xKxStWSFqDMGQxv4HinVXPej2xOg=;
	b=e3xa/MVuw2mTa15pphIIiW3Fo7ayZEAeOTwDRCYR+LSYpJRosugF3q8BfYZsKiIeylcIKN
	YIYoyBuposxE+4Rr1Ce+L4ACEOKq+vf77cEx7yYM/ws7Z+bMZl0KxfmusjiCcEWmaVBZcz
	20pSRFRcmE31f9WhvQ7MpDYL7bY2Snw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763742366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2EbQbMBVh+wtPe2xKxStWSFqDMGQxv4HinVXPej2xOg=;
	b=6iaW69cVy6XAOoi/21AmFXwZp5jxrwUMBQUI59lgt1PS9XOI1mtWjrvhU9z5hhbcc+K3tV
	/iuFckSa5kxqfoDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763742365; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2EbQbMBVh+wtPe2xKxStWSFqDMGQxv4HinVXPej2xOg=;
	b=VV/AperTpowj2cQmB95YfLGIhbpQrsQdRUpH6FBgAa1qYMuAS6fMKFCPCqOaoIKYR5pSB4
	s6yuV4YEVNYreBx6rSo410SJITGRhO777f9G+Ep18SefHIXYGhrp2EVLCJPMUAQB58tYIt
	0Jx4ZrMAj5vAxEIoUWzrP4mvhqCnn1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763742365;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2EbQbMBVh+wtPe2xKxStWSFqDMGQxv4HinVXPej2xOg=;
	b=+DorV6SINtIaTNa/HgRma0Y9SsO2x1mw1lziFfqwcAn1sqMO59qo7Cirv+ZBnP7ohtLy2P
	CM9XZ8kP0TEKzvBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B7E63EA61;
	Fri, 21 Nov 2025 16:26:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0FlbBZ2SIGnICQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 21 Nov 2025 16:26:05 +0000
Message-ID: <8d0bc096-e346-462b-a274-f0cc1456eea3@suse.de>
Date: Fri, 21 Nov 2025 17:26:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arch, sysfb: Move screen and edid info into single
 place
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <20251121135624.494768-1-tzimmermann@suse.de>
 <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
 <CAMj1kXF1Dh0RbuqYc0fhAPf-CM0mdYh8BhenM8-ugKVHfwnhBg@mail.gmail.com>
 <199e7538-5b4a-483b-8976-84e4a8a0f2fd@suse.de>
 <CAMj1kXE+mS1Sm5GaROU0P97J2w1pew0P_To4sKiw8h1iOMuLcg@mail.gmail.com>
 <d080729c-6586-4b9c-b234-470977849d3d@suse.de>
 <6dff8e7e-c99b-443d-a1d8-22650ca0b595@suse.de>
 <CAMj1kXGpC_162bFL65kQw=7qVP7ezYw77Q76y217dDs8pqHogw@mail.gmail.com>
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
In-Reply-To: <CAMj1kXGpC_162bFL65kQw=7qVP7ezYw77Q76y217dDs8pqHogw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,arndb.de:email,suse.com:url,suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_082608_403469_9D3DCC4C 
X-CRM114-Status: GOOD (  16.18  )
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

Am 21.11.25 um 17:19 schrieb Ard Biesheuvel:
> On Fri, 21 Nov 2025 at 17:09, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>
>>
>> Am 21.11.25 um 17:08 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 21.11.25 um 16:56 schrieb Ard Biesheuvel:
>>>> On Fri, 21 Nov 2025 at 16:53, Thomas Zimmermann <tzimmermann@suse.de>
>>>> wrote:
>>>>> Hi
>>>>>
>>>>> Am 21.11.25 um 16:16 schrieb Ard Biesheuvel:
>>>>>> On Fri, 21 Nov 2025 at 16:10, Arnd Bergmann <arnd@arndb.de> wrote:
>>>>>>> On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
>>>>>>>> Replace screen_info and edid_info with sysfb_primary_device of type
>>>>>>>> struct sysfb_display_info. Update all users.
>>>>>>>>
>>>>>>>> Sysfb DRM drivers currently fetch the global edid_info directly,
>>>>>>>> when
>>>>>>>> they should get that information together with the screen_info
>>>>>>>> from their
>>>>>>>> device. Wrapping screen_info and edid_info in
>>>>>>>> sysfb_primary_display and
>>>>>>>> passing this to drivers enables this.
>>>>>>>>
>>>>>>>> Replacing both with sysfb_primary_display has been motivate by
>>>>>>>> the EFI
>>>>>>>> stub. EFI wants to transfer EDID via config table in a single entry.
>>>>>>>> Using struct sysfb_display_info this will become easily possible.
>>>>>>>> Hence
>>>>>>>> accept some churn in architecture code for the long-term
>>>>>>>> improvements.
>>>>>>> This all looks good to me,
>>>>>>>
>>>>>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>>>> Thanks
>>>>>
>>>>>>> It should also bring us one step closer to eventually
>>>>>>> disconnecting the x86 boot ABI from the kernel-internal
>>>>>>> sysfb_primary_display.
>>>>>>>
>>>>>> Agreed
>>>>>>
>>>>>> Acked-by: Ard Biesheuvel <ardb@kernel.org>
>>>>> Thanks
>>>>>
>>>>>> I can take patches 1-2 right away, if that helps during the next
>>>>>> cycle.
>>>>>    From my sysfb-focused POV, these patches would ideally all go through
>>>>> the same tree, say efi or generic arch, or whatever fits best. Most of
>>>>> the other code is only renames anyway.
>>>>>
>>>> I don't mind queueing all of it, but I did get a conflict on
>>>> drivers/pci/vgaarb.c
>>> Probably from a78835b86a44 ("PCI/VGA: Select SCREEN_INFO on X86")
>> https://lore.kernel.org/all/20251013220829.1536292-1-superm1@kernel.org/
>>
> Yes, if I merge back -rc2 first, I can apply patches 1-5 onto my
> efi/next tree. But then I hit
>
> Applying: sysfb: Move edid_info into sysfb_primary_display
> error: sha1 information is lacking or useless (drivers/gpu/drm/sysfb/efidrm.c).
> error: could not build fake ancestor
> Patch failed at 0006 sysfb: Move edid_info into sysfb_primary_display
>
> If you prefer, you can take the whole lot via the sysfb tree instead,
> assuming it does not depend on the EDID changes I already queued up?

Sure, I can also add it to the drm-misc tree. ETA in upstream would be 
v6.20-rc1.

Best regards
Thomas


-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)



