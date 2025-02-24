Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21525C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 21:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qvgm+D28JDvejs53Z18fdULzcHEuXR6KF6+ladTokSM=; b=NdNpIFPxm7P2CCB7QOV6YRxLg2
	smhnGMalz4XA9NHoo1IT6GFMFKU4zSydf+Hq+qtMh3oO58IjJkkMAgc2B+ux3EcMhPnlubiylPydx
	E9NJWUVSG6jWl28xq2e4TF9gxDR7BOFKuYDnpmYlRitrQnuAI+6QT0tzhXEGBnmmrknpb/+1/C8MX
	6J2rKGywFJLjI1gz683p23HYBWhh+G3CW1gv4Ai/BNlK6TOCrXjCH8DNaHrc7A9S5qrahOgxgAN+5
	M6D8wAPuBbeKmBlSXdJdVy/i8FhVkfh5ApXdg/j/ZiD2tKmvBlhAWUReTVoogLG0YAuEUYw2rBQVi
	Sx3T67pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmg1S-0000000FEWZ-3HfD;
	Mon, 24 Feb 2025 21:29:54 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmfzy-0000000FEKt-0L13
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 21:28:23 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C92E21F44E;
	Mon, 24 Feb 2025 21:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740432498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qvgm+D28JDvejs53Z18fdULzcHEuXR6KF6+ladTokSM=;
	b=GV0bpMsq5UQbZviMXq9ntFQ+U1cxHTSutltlQ+ufcM8iRz+33IGwOHXO0h8IZJEDtJKYyC
	ceP1NQKsiWMyktJ1NPhtPBWrSAqtyCJlyevg6zQ2vdyF7WIIdQi/MZr0iqhztTKjVPUGv+
	WcmD6dpRkOPS0CE5GS+gM1EQxFSUAFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740432498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qvgm+D28JDvejs53Z18fdULzcHEuXR6KF6+ladTokSM=;
	b=6KZfci/Hi52jZd1i5JMzlEubUQzzNg/QE1zE6kvBvkUu+8JBPN43jH7/WGhFWL8tsSYY8G
	NYdC6I2iKFomd9CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740432497; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qvgm+D28JDvejs53Z18fdULzcHEuXR6KF6+ladTokSM=;
	b=eDL/v6Wx+hy0B2WiyaN66MzTiRU0RC4aeVtES+O0PMrzRO2Eu6UcFf+U1STZGxmFCYZkjm
	HjDgR+xZ1VAgix1LHTjXURDdjovyY0U6KxtcdezQMAGaIecnfO1pruZfgXpTXJ7sF/iOIa
	Rw8yyeUVKaFUu1LoK/vyVCURcbMfDSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740432497;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qvgm+D28JDvejs53Z18fdULzcHEuXR6KF6+ladTokSM=;
	b=rRv9u7fEBGAkK0D81JkV2U5IBsqrmDp5Zbtb3+mwxC5jQov2DAstrgDmR7RGavmTEOglfI
	HwIgqZvOHsxwYYBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B426013332;
	Mon, 24 Feb 2025 21:28:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0uQmKXDkvGeoSQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Mon, 24 Feb 2025 21:28:16 +0000
Message-ID: <7219082a-6a84-4681-ad9e-6f76aba08966@suse.de>
Date: Mon, 24 Feb 2025 23:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] Add PCIe support for bcm2712
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Stanimir Varbanov <svarbanov@suse.de>
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
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250224083559.47645-1-svarbanov@suse.de>
 <20250224192215.GC2064156@rocinante>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20250224192215.GC2064156@rocinante>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.992];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,linutronix.de,kernel.org,gmail.com,google.com,pengutronix.de,suse.com,raspberrypi.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_132822_277350_869073E7 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
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



On 2/24/25 9:22 PM, Krzysztof Wilczyński wrote:
> Hello,
> 
>> Hello, v6 is re-based version of controller/brcmstb branch of pci tree.
> 
> Applied to controller/brcmstb, thank you!

Thank you, Krzysztof!

~Stan


