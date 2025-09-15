Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CFCCAC593
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JntDITgOThJNLP4MXQJ43VBflgagcrs9tOitGbwZPX8=; b=04hKI2TEzYvC/+0nlKgyswQ26j
	GJZUgWMXqTlRIdYsBAE5/7BI89bnEpw9R5L9qqC9kO2s5+YsOGK/jy4Yh0xaf6L9ni50ZWH1sEam3
	E9bcAh8xtrctbIMbc25kna84ABExEhxYezCegMIH5tsJRd6f3urlz0rFJ3qOFh3EkCfL6nmxo89+D
	ZTc8euj/FVEKabb0xeIkhcWlpKBH66yFb9QnfLQRXxiHPoXlhd15TpBSIN8sxzw32B9HAWOOs9YSI
	Kz+oKDE64bY0t88YD6uPJdKtZ5HHuFjjMakQ0y/yaFL96Dnl+DRka2oqFm8fDPJq2INk0BmTo+uhP
	bE0LvsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7N0-00000003td9-0i4D;
	Mon, 15 Sep 2025 11:27:42 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7Mx-00000003taO-2Uhw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:27:40 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 348A11F8B0;
	Mon, 15 Sep 2025 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757935656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JntDITgOThJNLP4MXQJ43VBflgagcrs9tOitGbwZPX8=;
	b=Rsb0V5T+AAgLb/QUPTZ/JYQZNEavTu8wHlENSEYwTlmHShN5RECnFYNLQPuXo1HLU7ZXzN
	qxo/8HlVKsXY+T2zeq7YJBo3GSPZRzyGbBC2ZfAU+W49ycEOzlIa+PGcP7XoHMl1EvxBnz
	H9mNLitqdRL3QHOT4TSBBDVdLiD/AME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757935656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JntDITgOThJNLP4MXQJ43VBflgagcrs9tOitGbwZPX8=;
	b=ly0jmR4lryxNId0U7Z6g6pGZdqf3d3Dk/dfFCIOKx/mNg8LaQy5oLJdFhRijLmmouqOEva
	ZGdv9tm2o4wKITCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Rsb0V5T+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ly0jmR4l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757935656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JntDITgOThJNLP4MXQJ43VBflgagcrs9tOitGbwZPX8=;
	b=Rsb0V5T+AAgLb/QUPTZ/JYQZNEavTu8wHlENSEYwTlmHShN5RECnFYNLQPuXo1HLU7ZXzN
	qxo/8HlVKsXY+T2zeq7YJBo3GSPZRzyGbBC2ZfAU+W49ycEOzlIa+PGcP7XoHMl1EvxBnz
	H9mNLitqdRL3QHOT4TSBBDVdLiD/AME=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757935656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JntDITgOThJNLP4MXQJ43VBflgagcrs9tOitGbwZPX8=;
	b=ly0jmR4lryxNId0U7Z6g6pGZdqf3d3Dk/dfFCIOKx/mNg8LaQy5oLJdFhRijLmmouqOEva
	ZGdv9tm2o4wKITCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 250271372E;
	Mon, 15 Sep 2025 11:27:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9GaQBif4x2hwJQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Mon, 15 Sep 2025 11:27:35 +0000
Message-ID: <8715a21b-83ac-4bc1-b856-fa90bb5b809f@suse.de>
Date: Mon, 15 Sep 2025 14:27:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] net: cadence: macb: Add support for Raspberry Pi
 RP1 ethernet controller
To: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Phil Elwell
 <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Andrew Lunn <andrew@lunn.ch>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20250822093440.53941-4-svarbanov@suse.de>
 <0142ac69-f0eb-4135-b0d2-50c9fec27d43@suse.de>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <0142ac69-f0eb-4135-b0d2-50c9fec27d43@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 348A11F8B0
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_042739_791762_FD3850A0 
X-CRM114-Status: GOOD (  13.63  )
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



On 9/10/25 2:32 PM, Stanimir Varbanov wrote:
> Hi Jakub,
> 
> On 8/22/25 12:34 PM, Stanimir Varbanov wrote:
>> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>>
>> The RP1 chip has the Cadence GEM block, but wants the tx_clock
>> to always run at 125MHz, in the same way as sama7g5.
>> Add the relevant configuration.
>>
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>> ---
>>  drivers/net/ethernet/cadence/macb_main.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
> 
> This patch is missing in net-next but ("dt-bindings: net: cdns,macb: Add
> compatible for Raspberry Pi RP1") from this series has been applied.
> 
> Could you take this patch as well, please.

Gentle ping.

~Stan

