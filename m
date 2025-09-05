Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A607BCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 15:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqGmq+/tciN/X02OS0kFJpbQdadqAWQTqIRmXPCqGYs=; b=pxEcmQNXBerHXpAeooDqE+BHdo
	r7jmYpG1EjHdny7eO42G+TUlwnHWroQj/rB407RVdR7W43Q0mWAT+6gGEVOzDgdYUtgMQwsaGNBVb
	EXtnyhzbh/tvp5ofAbFF7XD8b7A+SKSi+TNYA5ebYyCsSG2AN3xxcb6AclqvzejP5gbsXp5F93uY9
	kC6407ZkhE8IjwyBvV8jDBrbGhqfZkcF5xEKAVBTTJRtqJ8Y6n94JvvbHCgP0dS9TYzTayfty2MbK
	jNQN+aGjNgc3ekL70XqafhTj8Yz3Of5N8mImiF3AlUmVQWdWzFK/ufICyz2jvNXn0CggWxDM5ygPo
	fu0YZ94A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYEr-00000002hNj-0ZE1;
	Fri, 05 Sep 2025 15:20:33 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUrO-00000001SUP-1XBU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 11:44:08 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C02154E440;
	Fri,  5 Sep 2025 11:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757072642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqGmq+/tciN/X02OS0kFJpbQdadqAWQTqIRmXPCqGYs=;
	b=JmF/Scg+6OLJ+HjL08exUUQWkL3dkcCmpCHobuPze67W32iNvfeayZgBBtXwoTMTXnUUMo
	vNUiih25jAU6ZH98n0cA/IOGTYXlr41QPRVNNZzMLv/u2tQXvuSduY+T1qRuA73udPwTSG
	4wpqz2qqF1/LnDgYtVoP2vkDYG8sKwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757072642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqGmq+/tciN/X02OS0kFJpbQdadqAWQTqIRmXPCqGYs=;
	b=0yH5OsCcQHpkeCegKTHMMsW+mYK9nyzTahKp7a72BZqvHrUFMStoTYENaVX32I4v5RtZma
	OtRxu4qlxiskNrBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1757072642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqGmq+/tciN/X02OS0kFJpbQdadqAWQTqIRmXPCqGYs=;
	b=JmF/Scg+6OLJ+HjL08exUUQWkL3dkcCmpCHobuPze67W32iNvfeayZgBBtXwoTMTXnUUMo
	vNUiih25jAU6ZH98n0cA/IOGTYXlr41QPRVNNZzMLv/u2tQXvuSduY+T1qRuA73udPwTSG
	4wpqz2qqF1/LnDgYtVoP2vkDYG8sKwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1757072642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqGmq+/tciN/X02OS0kFJpbQdadqAWQTqIRmXPCqGYs=;
	b=0yH5OsCcQHpkeCegKTHMMsW+mYK9nyzTahKp7a72BZqvHrUFMStoTYENaVX32I4v5RtZma
	OtRxu4qlxiskNrBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A665139B9;
	Fri,  5 Sep 2025 11:44:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1qPKIgHNumgiVQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 05 Sep 2025 11:44:01 +0000
Message-ID: <8574e531-fc4d-4f36-886b-6e7fc0656da3@suse.de>
Date: Fri, 5 Sep 2025 14:43:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] dd ethernet support for RPi5
To: Jakub Kicinski <kuba@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Phil Elwell
 <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <06017779-f03b-4006-8902-f0eb66a1b1a1@broadcom.com>
 <20250904184757.1f7fb839@kernel.org> <20250904184941.207518c8@kernel.org>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20250904184941.207518c8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_044406_552336_EB7456B0 
X-CRM114-Status: GOOD (  11.69  )
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

Hi Jacub,

On 9/5/25 4:49 AM, Jakub Kicinski wrote:
> On Thu, 4 Sep 2025 18:47:57 -0700 Jakub Kicinski wrote:
>>> netdev maintainers, I took patches 4 and 5 through the Broadcom ARM SoC 
>>> tree, please take patches 1 through 3 inclusive, or let me know if I 
>>> should take patch 2 as well.  
>>
>> Thanks for the heads up! Let me take patch 3 right now.
> 
> s/patch 3/patch 2/
> 
>> I'm a bit unclear on where we landed with the parallel efforts to add
>> the >32b address support :(
> 

If you talk about 1/5 from this series, you can ignore it for now. I'll
monitor the fixes series from Théo Lebrun and will resend it if needed.

regards,
~Stan

