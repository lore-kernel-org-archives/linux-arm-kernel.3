Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734BCC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIKVu0G3IqL/5nXUeA5vN9eSOQZPoQd570/KkcbAJ4g=; b=iGZp7ttq8QrdzTu0O0hB0Kh2VQ
	DqspKAtoiv6tfu8C4QKWn/emckzgpwFP1m/kLw+RQwd7goa5IZtPuWxjZ9DUn1dF9wHGuLh3x80nG
	NRcb6ul0TOysotZkqn3pIp28QG3mk6AogZ4ZVbcQiMVrp7BQ6ayFAA2ItfclyQAyA9SLU4asSjEWr
	qc8OgS+t/dtiCChQx1yBkOMy/xYYvziZUDUFGZYdeyakoxYoGzioYEHwspBtMYXiszDplQe504EsZ
	RxMBF6ikS8DRESTZzow9QArL7thdguSVBc5qp35Eng2XzfrXQAXMIl3iAaqhUWYyGvg9C3E98lOwf
	1hKWhEJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiTT-0000000EqIc-0GM1;
	Fri, 04 Jul 2025 15:37:15 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiR6-0000000EpzW-1Mhk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 15:34:49 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9446C1F394;
	Fri,  4 Jul 2025 15:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751643286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIKVu0G3IqL/5nXUeA5vN9eSOQZPoQd570/KkcbAJ4g=;
	b=VDFc+xThyj/w9oOlp62W1Fc+/oYlUFtEEihGbjvqxX/ZRAZ92fccCVfOUCfd3MnQXoY9l9
	kDGoPS/Q/BLxy/sKYaswZbEUeK44CjQaAXajp/9He8MSgTDFpgbJZ1rIzHvCx11DreW21M
	CfTek6niAl4iv4hMUwa3utAQoFDkzV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751643286;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIKVu0G3IqL/5nXUeA5vN9eSOQZPoQd570/KkcbAJ4g=;
	b=QiQPeqkeovOdAE+fYvTOqNGMKtQ9gJSWR5KsMb8wbbYCohePkgZTBFDzHO7LvqfQpS3zQa
	JoGvMY1XtMWDRyDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751643286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIKVu0G3IqL/5nXUeA5vN9eSOQZPoQd570/KkcbAJ4g=;
	b=VDFc+xThyj/w9oOlp62W1Fc+/oYlUFtEEihGbjvqxX/ZRAZ92fccCVfOUCfd3MnQXoY9l9
	kDGoPS/Q/BLxy/sKYaswZbEUeK44CjQaAXajp/9He8MSgTDFpgbJZ1rIzHvCx11DreW21M
	CfTek6niAl4iv4hMUwa3utAQoFDkzV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751643286;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIKVu0G3IqL/5nXUeA5vN9eSOQZPoQd570/KkcbAJ4g=;
	b=QiQPeqkeovOdAE+fYvTOqNGMKtQ9gJSWR5KsMb8wbbYCohePkgZTBFDzHO7LvqfQpS3zQa
	JoGvMY1XtMWDRyDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1D56E13757;
	Fri,  4 Jul 2025 15:34:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SYKTBJb0Z2i6DAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 04 Jul 2025 15:34:46 +0000
Date: Fri, 4 Jul 2025 17:34:43 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Henry
 Martin <bsdhenrymartin@gmail.com>, Patrick Rudolph
 <patrick.rudolph@9elements.com>, Andrew Geissler <geissonator@yahoo.com>,
 Ninad Palsule <ninad@linux.ibm.com>, Patrick Venture <venture@google.com>,
 Robert Lippert <roblip@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/10] soc: aspeed: lpc-snoop: Rearrange channel
 paths
Message-ID: <20250704173443.3436f535@endymion>
In-Reply-To: <20250616-aspeed-lpc-snoop-fixes-v2-6-3cdd59c934d3@codeconstruct.com.au>
References: <20250616-aspeed-lpc-snoop-fixes-v2-0-3cdd59c934d3@codeconstruct.com.au>
	<20250616-aspeed-lpc-snoop-fixes-v2-6-3cdd59c934d3@codeconstruct.com.au>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,yahoo.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,jms.id.au,gmail.com,9elements.com,yahoo.com,linux.ibm.com,google.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:email,imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_083448_517511_DD356043 
X-CRM114-Status: GOOD (  14.03  )
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

On Mon, 16 Jun 2025 22:43:43 +0930, Andrew Jeffery wrote:
> Order assignments such that tests for conditions not involving resource
> acquisition are ordered before those testing acquired resources, and
> order managed resource acquisition before unmanaged where possible. This
> way we minimise the amount of manual cleanup required.
> 
> In the process, improve readability of the code by introducing a channel
> pointer that takes the place of the repeated object lookups.
> 
> Acked-by: Jean Delvare <jdelvare@suse.de>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 51 ++++++++++++++++++++---------------
>  1 file changed, 29 insertions(+), 22 deletions(-)
> (...)
> @@ -238,6 +240,7 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
>  		goto err_misc_deregister;
>  	}
>  
> +	/* Enable LPC snoop channel at requested port */
>  	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
>  	regmap_update_bits(lpc_snoop->regmap, SNPWADR, snpwadr_mask,
>  			   lpc_port << snpwadr_shift);

This duplicates a comment which is already present in the driver a few
lines before.

This duplicated comment gets cleaned up later in patch 10/10 (soc:
aspeed: lpc-snoop: Lift channel config to const structs).

-- 
Jean Delvare
SUSE L3 Support

