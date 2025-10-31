Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AAFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 15:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTrayXkWBQ243Fr06I9R6N8F/Dz2fVCExTzhLcSW7QA=; b=iWHu7nklZWBTUd9D1MtBd8FCLr
	c4OBhCb+aJYxG5tgRZteUKTHXXntRaK4V1uAYfDRVm46WNJbs+9Yv+veId4XJMrDslnobKqg9o3eU
	CxjvBmstp9ki9Braoq0H53rgDdzQNlZv5LHpNs5f+7Qhwjq6CA+Cv4yuYnEP++rjn98yplyTaxaPE
	dW/au/XkUy1JY9KegmGaJaoT5NOU7xzWkb4Y4zLJxfkWA4/0xOD/MN7WLOwhY+dgx+/6ZSwr3VUWw
	bay8Y1ocd/yYZb1CmDUNURK8/YlmEoOV78oW8zrWLz3aL4VWK6DY0NXYZzReNHnRcQZWtOr5rVwMA
	5qcAAgrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErAF-00000006K5w-2qnW;
	Fri, 31 Oct 2025 15:35:43 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErAC-00000006K5B-2PCk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 15:35:42 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EAFFD22060;
	Fri, 31 Oct 2025 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761924938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cTrayXkWBQ243Fr06I9R6N8F/Dz2fVCExTzhLcSW7QA=;
	b=jvvuLBX6eRZdWnDxZUWCLDdwDqCQxJPndp0Js5OViRrYAsZXgJYFQgSYsvXUFmNuj+0n0x
	Q+sIPjS8dN4Sid6iNm3HqhQNVsI5EB5MFdMvQqOhYCtKb5u0clrJj6TLT9CluOghoKHJGt
	iVQRwIG8q5wdeYfSSN177UKJEP5a88g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761924938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cTrayXkWBQ243Fr06I9R6N8F/Dz2fVCExTzhLcSW7QA=;
	b=CSaLgj5uB8ub8e3FaH0J8twmCDxYJoejo1OmiZBQDlZhn567tL9cApOsAODybbc30je3Ld
	Dv02ulfmJqe4WzCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1761924937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cTrayXkWBQ243Fr06I9R6N8F/Dz2fVCExTzhLcSW7QA=;
	b=N1VBlHlWxGpseLfy8E7f7YYKtHURzfK4Be2EB539ih///9PoZp+V/WvmdhebUx8r746z2h
	NavdJ/iMupKJcxLHVs90DW1lvqlQzT4R5DDV3avDnDG4a++7Y5gWNMo/VfY4t4TAyQCKvG
	PwIJunSb5PP5KyrTDkUcgoYeTg//6y4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1761924937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cTrayXkWBQ243Fr06I9R6N8F/Dz2fVCExTzhLcSW7QA=;
	b=C3ibAOSuwE0e3RVd590Zly7JfAteqpmrYBGX/qBahRWUX+DcZQvqN2ttiM/l3iF4t7zhyf
	kYh2gK8WTJUUkjAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5946413393;
	Fri, 31 Oct 2025 15:35:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Oiw2DknXBGn+SwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Fri, 31 Oct 2025 15:35:37 +0000
Message-ID: <eef9a83f-6103-4ab2-927c-921dd9a6a5b3@suse.de>
Date: Fri, 31 Oct 2025 17:35:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] dd ethernet support for RPi5
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stanimir Varbanov <svarbanov@suse.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Phil Elwell
 <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250822093440.53941-1-svarbanov@suse.de>
 <20251031114518.GA17287@pendragon.ideasonboard.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20251031114518.GA17287@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt,netdev];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_083540_970504_6E840906 
X-CRM114-Status: GOOD (  23.10  )
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

Hi Laurent,

On 10/31/25 1:45 PM, Laurent Pinchart wrote:
> Hi Stan,
> 
> On Fri, Aug 22, 2025 at 12:34:35PM +0300, Stanimir Varbanov wrote:
>> Hello,
>>
>> Changes in v2:
>>  - In 1/5 updates according to review comments (Nicolas)
>>  - In 1/5 added Fixes tag (Nicolas)
>>  - Added Reviewed-by and Acked-by tags.
>>
>> v1 can found at [1].
>>
>> Comments are welcome!
> 
> I'm very happy to see support for Raspberry Pi 5 progressing fast
> upstream.
> 
> I've tested the latest mainline kernel (v6.18-rc3) that includes this
> series (except for 1/5 that is replaced by
> https://lore.kernel.org/all/20250820-macb-fixes-v4-0-23c399429164@bootlin.com/
> as far as I understand). The ethernet controller is successfully
> detected, and so is the PHY. Link status seems to work fine too, but
> data doesn't seem to go through when the kernel tries to get a DHCP
> address (for NFS root). Here's the end of the kernel log (with the
> messages related to the USB controller stripped out):
> 
> [    0.896779] rp1_pci 0002:01:00.0: assign IRQ: got 27
> [    0.896809] rp1_pci 0002:01:00.0: enabling device (0000 -> 0002)
> [    0.896840] rp1_pci 0002:01:00.0: enabling bus mastering
> [    0.931874] macb 1f00100000.ethernet: invalid hw address, using random
> [    0.944448] macb 1f00100000.ethernet eth0: Cadence GEM rev 0x00070109 at 0x1f00100000 irq 95 (da:2e:6d:9d:52:a4)
> [    0.989067] macb 1f00100000.ethernet eth0: PHY [1f00100000.ethernet-ffffffff:01] driver [Broadcom BCM54210E] (irq=POLL)
> [    0.989272] macb 1f00100000.ethernet eth0: configuring for phy/rgmii-id link mode
> [    0.991271] macb 1f00100000.ethernet: gem-ptp-timer ptp clock registered.
> [    4.039490] macb 1f00100000.ethernet eth0: Link is Up - 1Gbps/Full - flow control tx
> [    4.062589] Sending DHCP requests .....
> [   40.902771] macb 1f00100000.ethernet eth0: Link is Down
> [   43.975334] macb 1f00100000.ethernet eth0: Link is Up - 1Gbps/Full - flow control tx
> 
> I've tried porting patches to drivers/net/phy/broadcom.c from the
> Raspberry Pi kernel to specifically support the BCM54213PE PHY (which is
> otherwise identified as a BCM54210E), but they didn't seem to help.
> 
> What's the status of ethernet support on the Pi 5, is it supposed to
> work upstream, or are there pieces still missing ?
> 

We have this [1] patch queued up, could you give it a try please.

[1] https://www.spinics.net/lists/kernel/msg5889475.html




