Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8140C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 10:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tnS1z33E1lmdARbRZJZY1baV7i5IrhBmmqgHqbmlVM=; b=3r0J7X9H3JHcRnNo9Trgtx3cMv
	Lj2CoQA0/bpwYlsGfpVaRuN68FlJqjJJ+KKV0lIdD9F2dj9jYPkskVVFsHk5+kfSaVkSc5wgtvush
	VAhudKITg7GOJcxywTB0ATQ9EH00mCkxAEuC/y2CEM9wzDVq4O/oOKKee1oFhV7l9ZTbjjLfROo6W
	oIDulYgqSXsXVo+xjO5ty3VXKBHG8CTw/8up+YUVM7tqm7dEkeiCxdrbb3TkSFZYo5lvr+k4CjKOp
	b7i6TJQNkdgohjcazQISoX5Vyt1RmDF8VWtxvmm53AOMMT1m5YTxXWffDALnGztkvDJltrUQQTTmT
	NfJlzFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td5ZA-00000006lW3-3lVe;
	Wed, 29 Jan 2025 10:45:04 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td5Xp-00000006lJ9-1wim;
	Wed, 29 Jan 2025 10:43:42 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EB6801F365;
	Wed, 29 Jan 2025 10:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738147416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2tnS1z33E1lmdARbRZJZY1baV7i5IrhBmmqgHqbmlVM=;
	b=U/lnCV4GBIZG9GbQ1SLwed6PEFOLa2KtiY6O7akzy8ThP6T1VqE5oYuGdqn4uKfnAqC/k1
	KCLe8/AKMCU6a4ptb2qA4+1jPr9Y2ovmlTZmOlIZgji2XQKurkAnusdTuaa0Bx6Zg062/S
	6nT6jznqT6s44t3SkfFVyXd3U1tdxxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738147416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2tnS1z33E1lmdARbRZJZY1baV7i5IrhBmmqgHqbmlVM=;
	b=VaZKT8hYvx0LvDaL9DncH7hgceQXTxV/NUnlHukMowsinbc2G6ukDey/6e71smi6XHiIWi
	I9IwBRm8e3VqvNAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wArQ3UD8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MUSweoG3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738147414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2tnS1z33E1lmdARbRZJZY1baV7i5IrhBmmqgHqbmlVM=;
	b=wArQ3UD8ofb8Duq+Uqy67bpUSGreo6Hiqr8UM04g7f2MxsC9UKifObCDP+OnI0zlBXChlu
	dYnzMI2mTY7jJMElIN4x44gRClFguzJgUeCXVK8+jHFM081mnCG0Sv4/PA39GANzMBwQ0y
	nTNXNR115MEBd2mbOvIjX3hlN9E33rU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738147414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2tnS1z33E1lmdARbRZJZY1baV7i5IrhBmmqgHqbmlVM=;
	b=MUSweoG3CdRus8S/4/g34ZtCsJ7NIYPezhBni7oNh8xix67Dfx0INn6LKOumml603x7ipq
	Simvrq8afwjaDBBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3CD6137D2;
	Wed, 29 Jan 2025 10:43:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KhYhOVUGmmfeWQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Wed, 29 Jan 2025 10:43:33 +0000
Message-ID: <320db9bc-3610-4336-a691-a8926cdb7e24@suse.de>
Date: Wed, 29 Jan 2025 12:43:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 03/11] irqchip: Add Broadcom bcm2712 MSI-X
 interrupt controller
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>, Stanimir Varbanov <svarbanov@suse.de>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Bjorn Helgaas
 <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-4-svarbanov@suse.de> <87bjvs86w8.ffs@tglx>
 <b1009877-6749-4bb1-95b9-ae976bef591c@broadcom.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <b1009877-6749-4bb1-95b9-ae976bef591c@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EB6801F365
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[22];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,pengutronix.de,suse.com,raspberrypi.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email,linutronix.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_024341_660089_57587D98 
X-CRM114-Status: GOOD (  13.53  )
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

On 1/28/25 7:55 PM, Florian Fainelli wrote:
> On 1/27/25 10:10, Thomas Gleixner wrote:
>> On Mon, Jan 20 2025 at 15:01, Stanimir Varbanov wrote:
>>
>>> Add an interrupt controller driver for MSI-X Interrupt Peripheral (MIP)
>>> hardware block found in bcm2712. The interrupt controller is used to
>>> handle MSI-X interrupts from peripherials behind PCIe endpoints like
>>> RP1 south bridge found in RPi5.
>>>
>>> There are two MIPs on bcm2712, the first has 64 consecutive SPIs
>>> assigned to 64 output vectors, and the second has 17 SPIs, but only
>>> 8 of them are consecutive starting at the 8th output vector.
>>>
>>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>>
>> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>>
>> As this is a new controller and required for the actual PCI muck, I
>> think the best way is to take it through the PCI tree, unless someone
>> wants me to pick the whole lot up.
> 
> Agreed, the PCI maintainers should take patches 1 through 9 inclusive,

Just small correction, patch 09/11 [1] has a new v2 at [2]. And I think
PCI maintainer have to take v2.

> and I will take patches 10-11 through the Broadcom ARM SoC tree, Bjorn,
> KW, does that work?

~Stan

[1] [PATCH v5 -next 09/11] PCI: brcmstb: Fix for missing of_node_put

[2]
https://lore.kernel.org/lkml/20250122222955.1752778-1-svarbanov@suse.de/T/



