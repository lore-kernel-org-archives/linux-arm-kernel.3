Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDE0C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0byVvo++YtkFDQYObcsaLWp1UF3HNGpLniy8FFAvXks=; b=ExR/SKVOutgan6y3OJ0i8Vx1oF
	3NlhBjnNp+jxeanUusRrxerduWsxrSRhRjvrgKGh+/MOy45Pss1XW2NzPBiE3XwiUNlta+TxYRTzl
	XY3DxoaQPCxiGAe42mpTYdSQKcZUvhi5b/QDSCGBLkIVugbaOqYmg3yoPRXfvRAQF20+Lh6Bcyau/
	nX82oAmQsxs2okjI5dX/B/CwEDzb2+Q4eGKvSOxGnLmzakWl2KZ3XBMKI817hGjMRmylvzePpwpZp
	9IfUIRSb4bK/XJ6zQOo8kYO1y55R/qO7Tpp49vVLPLt7RRU5kAccShpSRUvmXX3TbEAJ26XajmoLJ
	Vo6/+mog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taFma-000000089YU-2WsJ;
	Tue, 21 Jan 2025 15:03:12 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFlI-000000089RA-3st9;
	Tue, 21 Jan 2025 15:01:54 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D64002110A;
	Tue, 21 Jan 2025 15:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737471709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0byVvo++YtkFDQYObcsaLWp1UF3HNGpLniy8FFAvXks=;
	b=WGbFTEh7HiKf291KkdD89RuKF0YIN5rR0lsu8iBRJ272ACcwcJXcWtQsP7nD8wEIMSB35w
	YuwOIzCZlrTojfsRNp0dVML/F2pjiqgkUKFoAnrBU0vUtFYOXeR/BgTiwTzYhPH1jx+Acn
	tRyKGqWOl5exorxVQjLGUTAJVBkpelA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737471709;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0byVvo++YtkFDQYObcsaLWp1UF3HNGpLniy8FFAvXks=;
	b=yALy81RYjlqCrOcNWfGjt0ZQvzyNo/rYxTCZOu34eHMI8hg1FSwqtgL/D09kki2ngz0qo9
	1Spxqe1KDSsKPZBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737471708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0byVvo++YtkFDQYObcsaLWp1UF3HNGpLniy8FFAvXks=;
	b=rKpy+5Q1igPIgUJsVtTmoqe1O8W6ZCZJUrUxxZ1QXZQSziaGC+9zh1PgWu8YgE7vV2S8+u
	2FEhQN0UA6jxOhmJEPszPYWcnbFkFMcHeRSRP6XZLqlk0ehvSpd4mZZqTyn4GkLsZPpy01
	k38EpYKpDvqF8m907F+DtwmbPP3DTVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737471708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0byVvo++YtkFDQYObcsaLWp1UF3HNGpLniy8FFAvXks=;
	b=l+FnA78Z09ynyPgCTsdHqj6HXy0cy4f93jF4vdegExSALru3ba+GvkWuXYmgxyL4UpKfez
	gZ5kF8jK1Umzo8CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA3441387C;
	Tue, 21 Jan 2025 15:01:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iIHNMtu2j2cYKQAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Tue, 21 Jan 2025 15:01:47 +0000
Message-ID: <f3f15261-9246-4822-b504-61ffa768b7a9@suse.de>
Date: Tue, 21 Jan 2025 17:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/10] Add PCIe support for bcm2712
To: Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, kw@linux.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>
References: <20241025124515.14066-1-svarbanov@suse.de>
 <9b7161a7-2682-4824-8af0-39477b0938d8@bootlin.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <9b7161a7-2682-4824-8af0-39477b0938d8@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	FREEMAIL_CC(0.00)[linutronix.de,kernel.org,broadcom.com,gmail.com,google.com,linux.com,pengutronix.de,suse.com,raspberrypi.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_070153_116030_4CD8B248 
X-CRM114-Status: GOOD (  23.77  )
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

Hi Olivier,

On 12/23/24 6:35 PM, Olivier Benjamin wrote:
> On 10/25/24 14:45, Stanimir Varbanov wrote:
>> Here is v4 of the series which aims to add support for PCIe on bcm2712
>> SoC
>> used by RPi5. Previous v3 can be found at [1].
>>
> Hello Stanimir,
> 
> Thank you for you work on this!
> 
>> v3 -> v4 changes include:
>>   - Addressed comments on the interrupt-controller driver (Thomas)
>>   - Moved "Reuse config structure" patch earlier in the series (Bjorn)
>>   - Merged "Avoid turn off of bridge reset" into "Add bcm2712
>> support" (Bjorn)
>>   - Fixed DTB warnings on broadcom/bcm2712-rpi-5-b.dtb
>>
>> For more detailed info check patches.
>>
> I would simply like to report that I have (rather succintly) tested this
> series.
> I have built a 6.13.0-rc4-v8 vanilla kernel and deployed it to a
> Raspberry Pi 5 equipped with a "Raspberry Pi SSD" NVMe Drive on an M.2
> Hat+ connected to the main board using PCIe.
> This of course did not work, and I could not see my drive.
> I then applied this series on top, rebuilt and deployed the kernel, and
> I could see the /dev/nvme0 device and mount the ext4 fs on the 1st
> partition.
> 
>> Comments are welcome!
>> ~Stan
>     
> If you find it helpful, feel free to collect my Tested-By tag.
> 
> I'll be happy to do the same for future versions of the series and can
> do some additional testing if you want an extra pair of eyes.
> 

Thanks for the help! I definitely will need Tested-by for the recently
posted v5 :)

~Stan


