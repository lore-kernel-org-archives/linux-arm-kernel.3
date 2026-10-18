Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC42CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 23:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3XzDoQLuFucjxlUXIHS2DUJnltl4cAMHYg/ui3GJGk=; b=BGP92idkJyqcuvWB/NvO1UaA0B
	XPsryMEp9PchNw84zO1mTc5x9+siccoV1nauAMaViQGGWjZJQuUm9bUmfBmXWAmxzwJXetaQiOP3W
	3c9BZ/B1XdCeGIZTdBYffQfXd4ajOjFdz4QAqK3aJ+d0KbbHZv5lpdruKYg/cVEw0tSvQGiCzNW0p
	R9oLg9ZgQKuNijiuebOnY3H6nV3yMiuqfsuNCzQgg+/bhyTb1U3mk+vG/39PhB+s4yHh94399IVND
	Ul5lrt4hbw0BdHRo2yOKfzs9rpOz/7SeedAQP0TwPowNweOL3z4mFhJixhkIcsDD6Zt7uGCS2WGvE
	Xsv35kCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIa59-00000006HzP-3oiy;
	Sun, 18 Oct 2026 23:14:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIa58-00000006HzJ-2Vkg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 23:14:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0682842DB7;
	Sun, 18 Oct 2026 23:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026081F000C4;
	Sun, 18 Oct 2026 23:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792365261;
	bh=T3XzDoQLuFucjxlUXIHS2DUJnltl4cAMHYg/ui3GJGk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Bwn489ZUMJf1IdZPPCKfJtGKAnd38mcCep7818ylYm7zZxwCeUKBuM8E0gU/ZxdZ9
	 VbEzUOiamWejRDLXog/1WGG6UP4jtxhmqumARlZaAw9ix4p9q/IHH0bLzvTHd3Hg5z
	 Ubd7XITWyRQG9CfzppT9qoKDyBRQO35K4D25tmWeursuXz6fqjiBSHaknJtEjPBPSA
	 CKL0uCVyMrODu9vV+zrBJhVwsXa+sdj3VCOWP/LWQlFQVF3OqBqvjuvt96UDZ2xz2U
	 PhI8K8DKt8bB9cX24EkMD4OLB363Rb7qqpHf9aUenNYzvdb0DYfEoUNt6MbBv1S+oU
	 V2lSQ0eHSPBsw==
Date: Mon, 19 Oct 2026 00:14:14 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dileep Kumar Nagavarapu <dileepkumar.nagavarapu@amd.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Conall O'Griofa <conall.ogriofa@amd.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <git@amd.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>
Subject: Re: [PATCH v4 07/15] iio: adc: xilinx-xadc: Simplify common coding
 patterns
Message-ID: <20261019001414.1e7d6544@jic23-hlaptop>
In-Reply-To: <20261005094205.1045874-8-dileepkumar.nagavarapu@amd.com>
References: <20261005094205.1045874-1-dileepkumar.nagavarapu@amd.com>
	<20261005094205.1045874-8-dileepkumar.nagavarapu@amd.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

> @@ -749,7 +746,7 @@ static int xadc_get_seq_mode(struct xadc *xadc, unsigned long scan_mode)
>  	if (xadc->external_mux_mode == XADC_EXTERNAL_MUX_DUAL)
>  		return XADC_CONF1_SEQ_SIMULTANEOUS;
>  
> -	if ((aux_scan_mode & 0xff00) == 0 || (aux_scan_mode & 0x00ff) == 0)
> +	if (!(aux_scan_mode & 0xff00) || !(aux_scan_mode & 0x00ff))

This looks like retrieving a pair of fields.  The values of those fields
being what matters rather than no bits set?
If so I'd keep them as == 0.

>  		return XADC_CONF1_SEQ_CONTINUOUS;
>  
>  	return XADC_CONF1_SEQ_SIMULTANEOUS;


