Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF226C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Doi5XPUCZ2nG9x2OZWRFRlVh/JHCmgk5nDDgwb+TmJ4=; b=lUeZawnBJKLJe/XEd9i1tgvGQ2
	7/d66DZ2FDOb5ydBZS+pz4J2TE5V8h5j3rWqBgfiZDrFKrU7EGtLqxRd0mjf0NYRhw+uzULUM0DuB
	/UeDemkjJ44vh+iXiu/tRNz2ZzZbuKg9/CKL7XKlkt4EDoO6PNU885dw9d5N+iOAUDMLipA2K8WlK
	Bz1+lVCkxL6EiMKj+MEupNJ/+2/ErjeuMF4yDivLzdiE3IImreDrkIS/z9LqqQ6oAvqs7D+VKs6k2
	3CkVnme/dR9rGiSoYU7JL0liwHT5vexGoXX805pTfSNjaoBLiIbaZTceG+rVhy8rfh71WIxzoCpfs
	MVD86azA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRcr-00000002iSU-45bY;
	Mon, 27 Jan 2025 16:06:13 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcRbV-00000002iF0-0dJm;
	Mon, 27 Jan 2025 16:04:50 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C7E151F383;
	Mon, 27 Jan 2025 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737993886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Doi5XPUCZ2nG9x2OZWRFRlVh/JHCmgk5nDDgwb+TmJ4=;
	b=ySTOmZoWjM9vn3Ai0JpWG/MEbXtGIx3QuCFgr84chqXUhAcq4KFxnUFae0Yjnl92eXBaos
	uLNNi0UM3iCtUzVQTcVFYkj8p1no/Fdg+1N+uScvB0z4IVHhcQRP//BJCz+aJUPTvJJl6P
	cXe9CrklU5oR/zJkSB1b+emHjQ7wCgI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737993886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Doi5XPUCZ2nG9x2OZWRFRlVh/JHCmgk5nDDgwb+TmJ4=;
	b=bK2PMFIki3eN7lB4Dr/NooL5SoFp6WG57uigv4ncJ4eo378O/zP1UDABJXv7pRouFCEC2+
	6iKXZ/akLAcoIfBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zawGZfuv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=r1CyFRsS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737993885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Doi5XPUCZ2nG9x2OZWRFRlVh/JHCmgk5nDDgwb+TmJ4=;
	b=zawGZfuv/UK6W2qQnAZ6mHhuWVeIfI02zDZPTgJhyo7iGRdoXE1YxoR7ydWwnFwR+n8uaX
	8EcqH94DkSCDR+KOYAqUxrTVlYOqHW9hmFjIEzXMHfuxop+1+vHXUpMhCEvUb0ck+d6IiY
	pej6CFJktO2jqBNk2wfQ65wevsQSSXc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737993885;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Doi5XPUCZ2nG9x2OZWRFRlVh/JHCmgk5nDDgwb+TmJ4=;
	b=r1CyFRsSi47QzxDz6FwCN6RR5cZLpphnfIDc7bLuWLwPyN3LmWrjVjt9ziO69eAFB6iqa4
	XOorc8/TjCZjv3Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8CA3137C0;
	Mon, 27 Jan 2025 16:04:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H3d+Lpuul2e6egAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Mon, 27 Jan 2025 16:04:43 +0000
Message-ID: <151116ad-b671-4f4d-a231-6b2288d08158@suse.de>
Date: Mon, 27 Jan 2025 18:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 -next 09/11] PCI: brcmstb: Fix for missing of_node_put
To: Stanimir Varbanov <svarbanov@suse.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 stable@vger.kernel.org
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-10-svarbanov@suse.de>
 <1abdd175-280a-442a-a27a-9bc01c0a04c0@broadcom.com>
 <d8c0f79f-1896-4afa-86e3-bd330218f362@suse.de>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <d8c0f79f-1896-4afa-86e3-bd330218f362@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C7E151F383
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,gmail.com,google.com,linux.com,pengutronix.de,suse.com,raspberrypi.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_080449_343709_78FD6785 
X-CRM114-Status: GOOD (  16.13  )
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

On 1/22/25 6:20 PM, Stanimir Varbanov wrote:
> Hi Florian,
> 
> On 1/21/25 8:32 PM, Florian Fainelli wrote:
>> On 1/20/25 05:01, Stanimir Varbanov wrote:
>>> A call to of_parse_phandle() increments refcount, of_node_put must be
>>> called when done the work on it. Fix missing of_node_put() on the
>>> msi_np device node by using scope based of_node_put() cleanups.
>>>
>>> Cc: stable@vger.kernel.org # v5.10+
>>> Fixes: 40ca1bf580ef ("PCI: brcmstb: Add MSI support")
>>> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
>>> ---
>>> v4 -> v5:
>>>   - New patch in the series.
>>>
>>>   drivers/pci/controller/pcie-brcmstb.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/
>>> controller/pcie-brcmstb.c
>>> index 744fe1a4cf9c..546056f7f0d3 100644
>>> --- a/drivers/pci/controller/pcie-brcmstb.c
>>> +++ b/drivers/pci/controller/pcie-brcmstb.c
>>> @@ -1844,7 +1844,8 @@ static struct pci_ops brcm7425_pcie_ops = {
>>>     static int brcm_pcie_probe(struct platform_device *pdev)
>>>   {
>>> -    struct device_node *np = pdev->dev.of_node, *msi_np;
>>> +    struct device_node *msi_np __free(device_node) = NULL;
>>
>> In the interest of making this a straight back port to 5.10 that does
>> not have all of the __free() goodies, I would just add the missing
>> of_node_put() where necessary.
> 
> Good point. Thank you.
> 
>>
>> Also, since this is a bug fix, you should probably make it appear
>> earlier in the patch series, or even sent it as a separate fix entirely.
> 
> OK, will send it as a standalone patch (as v2 with your comment addressed).

Sent here [1], now separate from this series.

~Stan

[1]
https://lore.kernel.org/lkml/20250122222955.1752778-1-svarbanov@suse.de/T/

