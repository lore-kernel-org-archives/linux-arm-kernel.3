Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0959FD43356
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVxag8U9jM75UljVybG40T486hx4iXnhCGVMNG4jU7M=; b=xY4jvWIMLb1Swciupn+JkPrBAN
	scQ6YBD4rpqd0cWTfRY1oP5XH3jygA+vnqT+M07fRCkCuFcZujeBTR7H6MJ+HyRE6T6YqlmbHQS6g
	ciMzdLQhPgxj7oORjb1JLKssEyx2z2zo5FmJ5k3LXSUX/O6GSh/AqBxi+h/4tC77Oy8LXLdFX8O5D
	QAVty5//tQPNyGxWPYpZ3ml9SdWUPYvis6tup3QxBvSpM7FtR/C61uJGwtnS6l73CYJEK9RkRXIp7
	ksX1HV2nIW3ChGAlH/K0EP8GfwpVT4lCyoQat9D2TFDEzfmr4Vm/q1FVymmN4VDlbQR7OHKF8yYaV
	Ujt9VWyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91Mu-00000006ssE-0qMv;
	Thu, 07 Nov 2024 12:12:08 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9139-00000006opi-2p6m;
	Thu, 07 Nov 2024 11:51:46 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 357D221E89;
	Thu,  7 Nov 2024 11:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730980300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVxag8U9jM75UljVybG40T486hx4iXnhCGVMNG4jU7M=;
	b=WKtYcyJuRmqBS3wgJmdiVAEnAF9xdtDvh65mXQjicVeYTeafMBIe0Hx7hZgKjsTezRkblW
	Wk0Ja3RTnsFBvX4jq/ez4kVZdf0a71Cm0+xEdcB7oZ11DJutMxZQX+bmzulAUQPEdaXMNx
	vaBWhG7miv+uB9cO2d2kbBKW2pbgtFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730980300;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVxag8U9jM75UljVybG40T486hx4iXnhCGVMNG4jU7M=;
	b=6y9VBDS0rtz+KzPrMSFQsof1tuHYCDd2aDlgjyBFIEcheGKdjWTJQlGjNIj0J3wqo2YB7B
	nuIuiUn2iT52tiDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WKtYcyJu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6y9VBDS0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730980300; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVxag8U9jM75UljVybG40T486hx4iXnhCGVMNG4jU7M=;
	b=WKtYcyJuRmqBS3wgJmdiVAEnAF9xdtDvh65mXQjicVeYTeafMBIe0Hx7hZgKjsTezRkblW
	Wk0Ja3RTnsFBvX4jq/ez4kVZdf0a71Cm0+xEdcB7oZ11DJutMxZQX+bmzulAUQPEdaXMNx
	vaBWhG7miv+uB9cO2d2kbBKW2pbgtFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730980300;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVxag8U9jM75UljVybG40T486hx4iXnhCGVMNG4jU7M=;
	b=6y9VBDS0rtz+KzPrMSFQsof1tuHYCDd2aDlgjyBFIEcheGKdjWTJQlGjNIj0J3wqo2YB7B
	nuIuiUn2iT52tiDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CAC3B139B3;
	Thu,  7 Nov 2024 11:51:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xRswL8qpLGeLJQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 07 Nov 2024 11:51:38 +0000
Message-ID: <49aeb2b6-3635-4094-97bd-cbff506f017c@suse.de>
Date: Thu, 7 Nov 2024 13:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] PCI: of_property: Assign PCI instead of CPU bus
 address to dynamic bridge nodes
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
References: <20241104150521.r4hbsurw4dbzlxpg@thinkpad>
 <20241104234937.GA1446920@bhelgaas>
 <20241106143511.2ao7nwjrxi3tiatt@thinkpad>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20241106143511.2ao7nwjrxi3tiatt@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 357D221E89
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
	RCPT_COUNT_TWELVE(0.00)[35];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmx.net];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,baylibre.com,kernel.org,broadcom.com,linux.com,google.com,linaro.org,arm.com,bgdev.pl,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,gmx.net,bootlin.com,lunn.ch];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TAGGED_RCPT(0.00)[dt];
	R_RATELIMIT(0.00)[to_ip_from(RLd4hfed5x1rwp7wawiizx89ec)];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_035143_904759_A3FA7E14 
X-CRM114-Status: GOOD (  15.82  )
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

Hi Mani,

On 11/6/24 16:35, Manivannan Sadhasivam wrote:
> On Mon, Nov 04, 2024 at 05:49:37PM -0600, Bjorn Helgaas wrote:
>> On Mon, Nov 04, 2024 at 08:35:21PM +0530, Manivannan Sadhasivam wrote:
>>> On Mon, Nov 04, 2024 at 09:54:57AM +0100, Andrea della Porta wrote:
>>>> On 22:39 Sat 02 Nov     , Manivannan Sadhasivam wrote:
>>>>> On Mon, Oct 28, 2024 at 03:07:22PM +0100, Andrea della Porta wrote:
>>>>>> When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
>>>>>> incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
>>>>>> bridge, the window should instead be in PCI address space. Call
>>>>>> pci_bus_address() on the resource in order to obtain the PCI bus
>>>>>> address.
>>>>>
>>>>> of_pci_prop_ranges() could be called for PCI devices also (not just PCI
>>>>> bridges), right?
>>>>
>>>> Correct. Please note however that while the PCI-PCI bridge has the parent
>>>> address in CPU space, an endpoint device has it in PCI space: here we're
>>>> focusing on the bridge part. It probably used to work before since in many
>>>> cases the CPU and PCI address are the same, but it breaks down when they
>>>> differ.
>>>
>>> When you say 'focusing', you are specifically referring to the
>>> bridge part of this API I believe. But I don't see a check for the
>>> bridge in your change, which is what concerning me. Am I missing
>>> something?
>>
>> I think we want this change for all devices in the PCI address
>> domain, including PCI-PCI bridges and endpoints, don't we?  All those
>> "ranges" addresses should be in the PCI domain.
>>
> 
> Yeah, right. I was slightly confused by the commit message. Maybe including a
> sentence about how the change will work fine for endpoint devices would help.
> Also, why it went unnoticed till now (ie., both CPU and PCI addresses are same
> in many SoCs).

Most probably it is unnoticed because until now nobody has enabled
/selected CONFIG_PCI_DYNAMIC_OF_NODES ?

~Stan

