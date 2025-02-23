Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E0BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 10:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O07FM6hcpxOdydLw/5SoLU5xXndwpJbzAa2kj+R8kQY=; b=bS7WdSCtJAhZ+WT5cZ6rt5qx/j
	CuK+Xdq2kQZIuYcjHgLACXNYWilP7zCVF9Z9aDHSnTjvG3TEFiakwiwVsK4sq+wFrz0ozUSz2/kce
	Ivov+v2xc8g/NidYIzNzzJhD8iWq2CTUGOmmHUZ9Ntu8H+P51lmWBBBjNRP+YP41uW87yVt9IGZyS
	QkCaq4uaCCaNZ+EQHwwF2KPhVniHkyok/ESDgh52O/9cmfB0VtTYkC86+IEQBAZt2p4D4j3eeN3WT
	cRIldLBpV4jlsH2zdxqiF+Rg82HE7ho1UOHkl3brQObFUd1o5vWWnOUUx3P3HKGzJpuuR4dMM5cU7
	fTh4fCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm8n3-0000000ApIS-3ca9;
	Sun, 23 Feb 2025 10:00:49 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm8lK-0000000Ap3G-06h2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 09:59:03 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 02F722117A;
	Sun, 23 Feb 2025 09:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740304740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O07FM6hcpxOdydLw/5SoLU5xXndwpJbzAa2kj+R8kQY=;
	b=kSM0pZ344Cw9eVd+6G4n7Buoo5uufHhnOeY0eTfbZBjT90tZqHKkwVhLxXl/x0bcu2Ioao
	kUtmP8MXgSUHzn7TRCqzUpupKgtSidsiADPYAwHnUwk+s9hDe3puOHOTMFFLahM1Y4u8Cp
	Imx41wBiOGoEzUrAKgH9v/UfqIijJ78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740304740;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O07FM6hcpxOdydLw/5SoLU5xXndwpJbzAa2kj+R8kQY=;
	b=ghUcU/02amKuIXnLMYsiFOqjsIWhK96myETomxMpMAldpEpbhEbMM6txTDfRJRC2ce5Nik
	uw/fLhZmaKex4ZBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kSM0pZ34;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="ghUcU/02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740304740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O07FM6hcpxOdydLw/5SoLU5xXndwpJbzAa2kj+R8kQY=;
	b=kSM0pZ344Cw9eVd+6G4n7Buoo5uufHhnOeY0eTfbZBjT90tZqHKkwVhLxXl/x0bcu2Ioao
	kUtmP8MXgSUHzn7TRCqzUpupKgtSidsiADPYAwHnUwk+s9hDe3puOHOTMFFLahM1Y4u8Cp
	Imx41wBiOGoEzUrAKgH9v/UfqIijJ78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740304740;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O07FM6hcpxOdydLw/5SoLU5xXndwpJbzAa2kj+R8kQY=;
	b=ghUcU/02amKuIXnLMYsiFOqjsIWhK96myETomxMpMAldpEpbhEbMM6txTDfRJRC2ce5Nik
	uw/fLhZmaKex4ZBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB3EC13A42;
	Sun, 23 Feb 2025 09:58:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wTugMmLxumegDAAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Sun, 23 Feb 2025 09:58:58 +0000
Message-ID: <f224ec07-cdd9-4f07-a1c6-985202c57f82@suse.de>
Date: Sun, 23 Feb 2025 11:58:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 08/11] PCI: brcmstb: Adding a softdep to MIP
 MSI-X driver
To: Bjorn Helgaas <helgaas@kernel.org>, Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner
 <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250221214035.GA362971@bhelgaas>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20250221214035.GA362971@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 02F722117A
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,linutronix.de,kernel.org,gmail.com,google.com,linux.com,pengutronix.de,suse.com,raspberrypi.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_015902_235303_04E9DC7F 
X-CRM114-Status: GOOD (  11.66  )
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

On 2/21/25 11:40 PM, Bjorn Helgaas wrote:
> On Mon, Jan 20, 2025 at 03:01:16PM +0200, Stanimir Varbanov wrote:
>> In case brcmstb PCIe driver and MIP MSI-X interrupt controller
>> drivers are built as modules there could be a race in probing.
>> To avoid this add a softdep to MIP driver to guarantee that MIP
>> driver will be load first.
> 
> Maybe this one too?  Should this be moved to after the irq_bcm2712_mip
> driver is added, but before brcmstb will claim bcm2712?  I just want
> to avoid bisection problems when possible, and it sounds like if we
> lose the race, interrupts might not work as expected?

Makes sense, thank you.

~Stan

