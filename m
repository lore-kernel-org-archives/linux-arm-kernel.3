Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EAECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 21:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNeQuTjYwgA+JwDmrzwog4+pMu474TNFlZeZbMax3kI=; b=E1HfgYeXBs6ywjj43WjlxVALXG
	UUqom4AjI5/uhHACMl42WWeN436D2g2KqkdY5Mv3xxSoNslLlA6w5iVITdQ0GrizmMCiqBOgPsjO8
	lsvEE6imtQ12VrsAFgzPQdy3zWQozVG+h4Im7q2BEvPbd92sLQELLT+PXeJkXwXCDFTUd/aSXkg2X
	eVEL+8p2fbkSDQ6hhimJM2rrVF4NJ3gGtdWsEM2CPNNlMbWlcGMSGdMUNZgoIiijNT12J/MXfcqEB
	CvfMrN7hLNWLGO7gOBOmw06fX5Dt+TGn3riinq/PanbeBgOVUP6zhEyxlxgdqaso7ZD9wrznARq2/
	MSCPF7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Llj-00000003WRx-1X80;
	Mon, 29 Sep 2025 21:50:51 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Llg-00000003WRD-0vpC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 21:50:49 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 545B01F7A5;
	Mon, 29 Sep 2025 21:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759182643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNeQuTjYwgA+JwDmrzwog4+pMu474TNFlZeZbMax3kI=;
	b=W5aopZ31Vxl06oaVewEIZMeTcwaVGF2PxTgTtrVqIOwsmyvJ/jpmWnin69/dUIMDZOvz8l
	jnEvulkZyZKhqmvOzKeOaBjSAZbYoQeEr96Mqke6P+zFWAZn9thJ2JOHA5eHWsdw+1Ofr0
	et0TetZYxtOD1P6Msx0XT+pLJysLWBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759182643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNeQuTjYwgA+JwDmrzwog4+pMu474TNFlZeZbMax3kI=;
	b=9gMD49ud+rRYM2mHiw7Ty6pJRMEDrNyIdhwyjCTMxHRbaolVB/SW5tiWWCePxPY5MeUK5U
	Y6yAfAcQYhVuMfCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W5aopZ31;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9gMD49ud
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759182643; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNeQuTjYwgA+JwDmrzwog4+pMu474TNFlZeZbMax3kI=;
	b=W5aopZ31Vxl06oaVewEIZMeTcwaVGF2PxTgTtrVqIOwsmyvJ/jpmWnin69/dUIMDZOvz8l
	jnEvulkZyZKhqmvOzKeOaBjSAZbYoQeEr96Mqke6P+zFWAZn9thJ2JOHA5eHWsdw+1Ofr0
	et0TetZYxtOD1P6Msx0XT+pLJysLWBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759182643;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aNeQuTjYwgA+JwDmrzwog4+pMu474TNFlZeZbMax3kI=;
	b=9gMD49ud+rRYM2mHiw7Ty6pJRMEDrNyIdhwyjCTMxHRbaolVB/SW5tiWWCePxPY5MeUK5U
	Y6yAfAcQYhVuMfCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EF3813A21;
	Mon, 29 Sep 2025 21:50:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GUGQFDL/2miRMQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Mon, 29 Sep 2025 21:50:42 +0000
Message-ID: <a5bc2227-5d25-41da-9b5b-ebc2d5fc85c8@suse.de>
Date: Tue, 30 Sep 2025 00:50:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: adc: rp1: Add Raspberry Pi's RP1 ADC driver
To: Guenter Roeck <linux@roeck-us.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Saenz Julienne <nsaenz@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250925000416.2408457-1-svarbanov@suse.de>
 <20250925000416.2408457-3-svarbanov@suse.de>
 <d07158fc-678e-4ae4-8943-168146a58fe0@roeck-us.net>
 <e53865df-7566-4790-9214-0af875950742@gmx.net>
 <3f1295b0-b637-4fe0-b141-67f086960072@roeck-us.net>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <3f1295b0-b637-4fe0-b141-67f086960072@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 545B01F7A5
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	FREEMAIL_TO(0.00)[roeck-us.net,gmx.net];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmx.net];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_145048_398801_D6EEC004 
X-CRM114-Status: GOOD (  14.51  )
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

Hi,

On 9/25/25 5:34 PM, Guenter Roeck wrote:
> On Thu, Sep 25, 2025 at 07:26:10AM +0200, Stefan Wahren wrote:
>> Hi Guenter,
>>
>> Am 25.09.25 um 04:42 schrieb Guenter Roeck:
>>> On Thu, Sep 25, 2025 at 03:04:14AM +0300, Stanimir Varbanov wrote:
>>>> A five-input successive-approximation analogue-to-digital converter
>>>> with 12-bit (effective number of 9.5 bits) resolution at 500kSPS.
>>>> The ADC has four external inputs and one internal temperature sensor.
>>>>
>>>> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
>>>> Signed-off-by: Jonathan Bell <jonathan@raspberrypi.com>
>>>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>>> I just realized that there is already a hwmon driver for
>>> Rasperri Pi - drivers/hwmon/raspberrypi-hwmon.c.
>>>
>>> Please add this code to that driver.
>> could you please explain the reason for this?
>>
>> Yes, both drivers are for Raspberry Pi boards, but they don't share any code
>> base. The raspberrypi-hwmon uses a mailbox interfaces to get the sensor data
>> and works for the board generation 1 - 4. This driver works completely
>> differently ( MMIO ), doesn't depend on the mailbox interface and applies
>> only for board generation 5. Actually I don't see a benefit of merging them.

Thank you Stefan for the explanation.

>>
> Ok. Please make sure to add this explanation to the patch description.

Sure, I will extend the description in next version.

~Stan

