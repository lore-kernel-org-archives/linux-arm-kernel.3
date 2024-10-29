Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5CFD2AB0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0axVOqoMls//Wk+pvC5XHfu4g+8K4S/uESA90ZpiSro=; b=114GOvxxeD0yh4vj+OXF52a+Cd
	DnbY1tIyPG5y/0u84+7SI/XeVRpMjbL1qa8qH5inFmeGX6uCL6ehAf16MHN4Dsmwbw4Q1DCTBJe6k
	SQUOWxXWJSOtNPC2Ybk0MiHfcGnVcShOhfoABbD+kcaMs1+gDypxBNNjMQA/2yXBJj1WKvOY2YCr6
	JuIO/3UJRtHb4qKmF1zcMHKzb9EPQ7vsLhP5AvdPMEwnRQM8/+BgcrHnKLKwoERtEsdwpPDWJW6mS
	UfMLKS5puibRqt5jsfhGev8xLrgBvn5UgYBOOKxbrgmkVSryAo0dRXqxL5kyKifTbut0nTxQq/gcy
	JbDmHLbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ihF-0000000DtmT-0I6S;
	Tue, 29 Oct 2024 09:39:29 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ifb-0000000DteO-1GB3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 09:37:50 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 04DC821CB5;
	Tue, 29 Oct 2024 09:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730194664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0axVOqoMls//Wk+pvC5XHfu4g+8K4S/uESA90ZpiSro=;
	b=MFpph/jBB1J/ISr6NeT9WLZmTaOCpka/EFPFi79RpcQDXvUb6gXFq2uiaw9Znyk9eyFz3H
	ReVfuHyJDoUtN4FNxVwYSXTY9xburM0eD3Qxpfz59mKLKgamQMVHy7RqBu1hs5/SFFJPLw
	DRRSdlBNDz7zfFGhJ+J9+C59ZyUJtp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730194664;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0axVOqoMls//Wk+pvC5XHfu4g+8K4S/uESA90ZpiSro=;
	b=Aq9To5J4OyWv9MZ1wXaqA99S23W+n2hHs6LsWZOc48A04RFALqgDjs6OHKARjcxMxsOhZx
	5NEMh2sW95cAg9CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730194664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0axVOqoMls//Wk+pvC5XHfu4g+8K4S/uESA90ZpiSro=;
	b=MFpph/jBB1J/ISr6NeT9WLZmTaOCpka/EFPFi79RpcQDXvUb6gXFq2uiaw9Znyk9eyFz3H
	ReVfuHyJDoUtN4FNxVwYSXTY9xburM0eD3Qxpfz59mKLKgamQMVHy7RqBu1hs5/SFFJPLw
	DRRSdlBNDz7zfFGhJ+J9+C59ZyUJtp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730194664;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0axVOqoMls//Wk+pvC5XHfu4g+8K4S/uESA90ZpiSro=;
	b=Aq9To5J4OyWv9MZ1wXaqA99S23W+n2hHs6LsWZOc48A04RFALqgDjs6OHKARjcxMxsOhZx
	5NEMh2sW95cAg9CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D170C136A5;
	Tue, 29 Oct 2024 09:37:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JKDMMuesIGc+HwAAD6G6ig
	(envelope-from <iivanov@suse.de>); Tue, 29 Oct 2024 09:37:43 +0000
Date: Tue, 29 Oct 2024 11:44:45 +0200
From: "Ivan T . Ivanov" <iivanov@suse.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lukas Wunner <lukas@wunner.de>,
	Peter Robinson <pbrobinson@gmail.com>,
	linux-arm-kernel@lists.infradead.org, kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com, dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V5 1/9] Revert "usb: dwc2: Skip clock gating on Broadcom
 SoCs"
Message-ID: <20241029094445.hsporitxkv2q45c5@localhost.localdomain>
References: <20241025103621.4780-1-wahrenst@gmx.net>
 <20241025103621.4780-2-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025103621.4780-2-wahrenst@gmx.net>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmx.net];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[armlinux.org.uk,broadcom.com,kernel.org,linaro.org,synopsys.com,linuxfoundation.org,wunner.de,gmail.com,lists.infradead.org,raspberrypi.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_023747_512863_80906018 
X-CRM114-Status: GOOD (  16.27  )
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

Hi Stefan,

On 10-25 12:36, Stefan Wahren wrote:
> 
> The commit d483f034f032 ("usb: dwc2: Skip clock gating on Broadcom SoCs")
> introduced a regression on Raspberry Pi 3 B Plus, which prevents
> enumeration of the onboard Microchip LAN7800 in case no external USB device
> is connected during boot.
> 
> Fixes: d483f034f032 ("usb: dwc2: Skip clock gating on Broadcom SoCs")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  drivers/usb/dwc2/params.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 68226defdc60..4d73fae80b12 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -23,7 +23,6 @@ static void dwc2_set_bcm_params(struct dwc2_hsotg *hsotg)
>  	p->max_transfer_size = 65535;
>  	p->max_packet_count = 511;
>  	p->ahbcfg = 0x10;
> -	p->no_clock_gating = true;
>  }
> 

Thanks, this makes RPi3 Ethernet operational again.

Tested-by: Ivan T. Ivanov <iivanov@suse.de>

Regards.


