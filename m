Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521FFC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otOkzlJsKO7j/ah8zQ5Pm/e4WJCfWL+ivuU6UE+K9H4=; b=OhhKWDX1PKjT1bLW+T4ZRcYmpQ
	sclu1O7s4NSJDYkOK00SxlpBLIDrVhqFyVY7HqjN2Hyf+2QZ7NapHk6a6zPHClLxiZxtO1vLoekFa
	zHclAVs39vJKM3gsHKifd4njJ5z94gcw3CaBz/vIsraijqnZziR1JO33eB7e4MyM6ImEy8QrhWiQ0
	HgXZg+LFz1I97XJRzfmI7mEjOYOpIar3LItmqTEVGGtK2Z2OeFZDWLnirmyOm45Xi1A4U8FLg68Y+
	r11ZZXhU/4PAvAN1LkgkF0JT7nO7t4MfZ0k4GYvZmWI0wSZQsWi1JLAhMFzJBNBvAHwQZwYNn4x3b
	sOv8bw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUsG-0000000AK6c-18s7;
	Thu, 13 Feb 2025 08:47:08 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUjt-0000000AIsL-07y4;
	Thu, 13 Feb 2025 08:38:30 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9CBD7220A7;
	Thu, 13 Feb 2025 08:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739435905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=otOkzlJsKO7j/ah8zQ5Pm/e4WJCfWL+ivuU6UE+K9H4=;
	b=MsTGk3DvD05bVUFG2ykkdN4zNunbEDORKol2WEknEyOpVttQqeQLHazm69GChvn4YAs+ph
	Rhv3hQFewhKiHj1SM9Z9RMIqg/PvwsFfPOwDmoav7gHqQ3AF4TzlAPAl0t06lffN3Egw2V
	jjC4cOeOEcWCc/mNEvjOfixBYYCfEFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739435905;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=otOkzlJsKO7j/ah8zQ5Pm/e4WJCfWL+ivuU6UE+K9H4=;
	b=brnM1jO4Ql8tmRw87+2n05FTeQU4ou6FHbMvtINPsyTN7mtOfCR0zvlhYCm3vrv2d646t9
	nS38fHLQOUjIWRDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739435905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=otOkzlJsKO7j/ah8zQ5Pm/e4WJCfWL+ivuU6UE+K9H4=;
	b=MsTGk3DvD05bVUFG2ykkdN4zNunbEDORKol2WEknEyOpVttQqeQLHazm69GChvn4YAs+ph
	Rhv3hQFewhKiHj1SM9Z9RMIqg/PvwsFfPOwDmoav7gHqQ3AF4TzlAPAl0t06lffN3Egw2V
	jjC4cOeOEcWCc/mNEvjOfixBYYCfEFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739435905;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=otOkzlJsKO7j/ah8zQ5Pm/e4WJCfWL+ivuU6UE+K9H4=;
	b=brnM1jO4Ql8tmRw87+2n05FTeQU4ou6FHbMvtINPsyTN7mtOfCR0zvlhYCm3vrv2d646t9
	nS38fHLQOUjIWRDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E7E9137DB;
	Thu, 13 Feb 2025 08:38:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1257EICvrWeybwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 13 Feb 2025 08:38:24 +0000
Message-ID: <1ff57101-9aa4-4508-b5e5-3f34a89888d8@suse.de>
Date: Thu, 13 Feb 2025 10:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 00/11] Add PCIe support for bcm2712
To: Bjorn Helgaas <helgaas@kernel.org>, Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250212180416.GA86064@bhelgaas>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20250212180416.GA86064@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,google.com,linutronix.de,kernel.org,gmail.com,linux.com,pengutronix.de,suse.com,raspberrypi.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_003829_223388_B059CDE6 
X-CRM114-Status: GOOD (  10.82  )
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

Hi Bjorn,

On 2/12/25 8:04 PM, Bjorn Helgaas wrote:
> On Tue, Feb 11, 2025 at 03:30:22PM +0200, Stanimir Varbanov wrote:
>> Hi Bjorn,
>>
>> Do I need to send a new version with the collected Acked/Reviewed tags?
> 
> No need to resend unless you change the code.

At this point I have no plans to change the code.

> 
> Bjorn

Thank you!

~Stan


