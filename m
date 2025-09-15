Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4716ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mNaU9AhJn4Xq2FHC7G2kb7GgzktfPd9RfttKwzj4HA=; b=PwC8MqsSUF+vsneB5aHM64XGEk
	WxCkV/uQWZ74mx+RGgSAxczWkNGSx4SnxC0hG0hPaW3zwxsNI3M5O1Imm5Q71JAeHPp6vdfyXr1q0
	/AEdL615rcNG7c/y7U0oYWwDGbAmDPCuAflwjCxZF/vappO+7hc4tNLx8PWvhqm4Z7bwiM+P3uQVd
	9i9/qI0n2rcpMYSePsw4gefKAW8wlFYpet2m4CBKfwinpymxdDUgfW+vzGuaeiOIxE6ugSqDMlMLW
	tka5nzaqAiZKMqJ5UjaisWXrnIujFawLIhM8Rb+PWIs3Wspc0UlKTUepgmwHaJJHFs7aYwawiOIAV
	rG2VZBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAEp-00000004i4S-42vD;
	Mon, 15 Sep 2025 14:31:27 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyAEn-00000004i2o-0iuw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:31:26 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2B87F336BF;
	Mon, 15 Sep 2025 14:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757946683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7mNaU9AhJn4Xq2FHC7G2kb7GgzktfPd9RfttKwzj4HA=;
	b=N6wMOPavB1lqRwyCxggSCOXxUC4RE9D4hvNEiH8DopNz2Io85LyNsX2urRGQ8lyuu3HHhP
	t1aNNFc4E4LTYGrHNwjksYnWUEGYPVh/1ikzA/gf63Mq4WQHIM520X/ukYi0HxRkuOBUfI
	tBp1trRLeaOXzToXGcVolwq6M3k04/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757946683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7mNaU9AhJn4Xq2FHC7G2kb7GgzktfPd9RfttKwzj4HA=;
	b=RVHJWlNBbcWbFWhbZWerd4SLJEEPIkqECj7HlekZWRPZXKYUavodpaTZAERdl+WcMFVU58
	QXfo9dkBx6dnJZAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757946683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7mNaU9AhJn4Xq2FHC7G2kb7GgzktfPd9RfttKwzj4HA=;
	b=N6wMOPavB1lqRwyCxggSCOXxUC4RE9D4hvNEiH8DopNz2Io85LyNsX2urRGQ8lyuu3HHhP
	t1aNNFc4E4LTYGrHNwjksYnWUEGYPVh/1ikzA/gf63Mq4WQHIM520X/ukYi0HxRkuOBUfI
	tBp1trRLeaOXzToXGcVolwq6M3k04/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757946683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7mNaU9AhJn4Xq2FHC7G2kb7GgzktfPd9RfttKwzj4HA=;
	b=RVHJWlNBbcWbFWhbZWerd4SLJEEPIkqECj7HlekZWRPZXKYUavodpaTZAERdl+WcMFVU58
	QXfo9dkBx6dnJZAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2EED21368D;
	Mon, 15 Sep 2025 14:31:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mooGCTojyGiRYgAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Mon, 15 Sep 2025 14:31:22 +0000
Message-ID: <c2448974-7a66-4fa8-87ee-3c4a824ea1cc@suse.de>
Date: Mon, 15 Sep 2025 17:31:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] net: cadence: macb: Add support for Raspberry Pi
 RP1 ethernet controller
To: Andrew Lunn <andrew@lunn.ch>, Stanimir Varbanov <svarbanov@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Phil Elwell
 <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-4-svarbanov@suse.de>
 <0142ac69-f0eb-4135-b0d2-50c9fec27d43@suse.de>
 <8715a21b-83ac-4bc1-b856-fa90bb5b809f@suse.de>
 <d2afd474-1514-4663-9e96-7efea30a5eaa@lunn.ch>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <d2afd474-1514-4663-9e96-7efea30a5eaa@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_RCPT(0.00)[dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_073125_361631_1FCE56C5 
X-CRM114-Status: GOOD (  14.26  )
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

Hi Andrew,

Thank you the answer!

On 9/15/25 4:34 PM, Andrew Lunn wrote:
> On Mon, Sep 15, 2025 at 02:27:34PM +0300, Stanimir Varbanov wrote:
>>
>>
>> On 9/10/25 2:32 PM, Stanimir Varbanov wrote:
>>> Hi Jakub,
>>>
>>> On 8/22/25 12:34 PM, Stanimir Varbanov wrote:
>>>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>>
>>>> The RP1 chip has the Cadence GEM block, but wants the tx_clock
>>>> to always run at 125MHz, in the same way as sama7g5.
>>>> Add the relevant configuration.
>>>>
>>>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>>> ---
>>>>  drivers/net/ethernet/cadence/macb_main.c | 12 ++++++++++++
>>>>  1 file changed, 12 insertions(+)
>>>>
>>>
>>> This patch is missing in net-next but ("dt-bindings: net: cdns,macb: Add
>>> compatible for Raspberry Pi RP1") from this series has been applied.
>>>
>>> Could you take this patch as well, please.
>>
>> Gentle ping.
> 
> Such pings are ignored. Please rebase the patch to net-next and submit
> it again.

Sorry about that.

I did not realized that if it applies cleanly on net-next I need to
re-send it.

I will send it as a separate one with version v3.

~Stan



