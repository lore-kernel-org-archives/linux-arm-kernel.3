Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FE4C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSJJX56zDhVqdKCOO7Zb5p+mglB7JczLAGdABH1H3qk=; b=x1/And86cWImd00WyL6wOuCGQi
	AdIxKIpE24JXzbEaJVWma6qlPcbogsdMOh4DoLZ/PvJ3EIH65N1VZJ+WfByiz3b/OpKfB+4J1bgVp
	A3hVW/8mvnX1QmqkBoaaTX4QwSwY1R8a2J7CwAowtXdfgWda641WUkUUtDPMJ8K29Vz2XEXmTfLCe
	/NAvvaUzUnvPgw2099/gBRl37+cR6HtizTmG11nrWrZbPJJVbsLWWwxwSMGtCT8CDXFtT11jiIpz/
	41lKF4PgaNSg9vEWHZKnxOtmvQnshp6ZFYe0jOtXYGvjifUoHvB3Dbd15UOg8B0RBc0ETwtlcXL7Q
	QkY2iBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp59e-00000000n5e-0JTc;
	Mon, 03 Mar 2025 12:44:18 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp4wx-00000000kta-3f4e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 12:31:13 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so857307966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 04:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741005070; x=1741609870; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QSJJX56zDhVqdKCOO7Zb5p+mglB7JczLAGdABH1H3qk=;
        b=ul3aXxwRZ4UsnSPtQOwkkijsao9QpIYgdqiSol15kcoC2rPpSS0BUvLkQHshjecimG
         vbArkMjdk7Y7eYQuIn0hGHIcvvb1HtJZVN8bhfPo7QjxbyjYEhhl20nC1rRDoRFDZjCo
         t+wlEXuAnrpLMo+YkGIkrJu1M2vCJ2sknbD4I715glCdMCSEoXHrYNHInTfql8CSmENj
         rIqwX1bQC/37uRqlzga3sS3+kiuvd/zKf9p9W3ujvt2vSxSSLW+BiDfd/AbZBxJ4Mqpr
         08U4FWxISxUYIWXxa2++vfldIVnBQMhosIYsELqSEtl91bBhXkh0032ZO5V7BWQ0NFIv
         xoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741005070; x=1741609870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSJJX56zDhVqdKCOO7Zb5p+mglB7JczLAGdABH1H3qk=;
        b=ZJmvF7IH6PMaMkKPjx7+tT/fuy+iLGnhz9601TCSFLO7HzIC2Kv1DgInRQ4foL9r+E
         tBdbVcFrbOOeuynBUQu1AbTWjYelTnUdOdrgoiHF2ergsyC5F2QWK4kmsa12fp8SF3cO
         HrBOjSb22GNwDluXpkBQobkvvimoihlRU67peito5rhhCJKgjPcK7a+wia4Rb18fpIeS
         7W1+bK2ZKcJstjWGWQAKotV5TEgKoIoF5saK9G9dDxRlZqL8eeI33DH4mR/+byxrzWDr
         aeUsPA9P0fEjNgYpvJESyQxvpY/AXmDaJFt2wfld1w1qruozK+/izcZE2eWC0LWuDH4x
         KEKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmVnJ1kTxJHcMSaEVPeKiRGQyz24BoEDy4zXabCx0MSqaMLt/XXDd3cJIeIc7ERthiOgpEqpFQIA+h0GCv58z9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8eFUtzetFm2/eHCiud3t3Nr2LPq8rIwJfhQwbxYb0XBVnHXbi
	1Gzesk6NturTBIW5MHFq51VmgYk2voN139nfuT0qjWdrvcGP6MhFAyZGrqJGmzE=
X-Gm-Gg: ASbGncuDcepy7gQZmS6HJnL/FYcC/NWeWvIxJRrNUOotOYhqdcDl8jaKRmEUcU1YX7O
	Uo9iJSoXoVe3bEoKtGFiVgcaw9ORAb2VaKz/Z8/wc1iueytimMoMaCuxgJVIkVYfmuNgJFBa+cH
	tm3OoJA6yPOcbQzi94VuVRkuI6tjxrarxvmQOLYDgEN7yMZEJPlWaz4HCr8tX9GV7cKqH2DyHPu
	r4PPnjD8dQkbGREFcGxk0fUq7MKtOxbFUZWD58YGl6cYuHVzFZrx1sFo2kuCahkxzHSKVQAjuHr
	9gX7ASAKphcYG42Hc+VFYFwOMIR6vGPW3pLajEGalZ5EqmuSZA==
X-Google-Smtp-Source: AGHT+IHKV3lYMhfvx47Xr6aO9kD/bZ1DuA4juAnVEFf9awkbWhcDx/dzkyGXXFqyty1Heield7dhvg==
X-Received: by 2002:a17:907:3e21:b0:abf:5e61:cde with SMTP id a640c23a62f3a-abf5e610f47mr976414466b.46.1741005070029;
        Mon, 03 Mar 2025 04:31:10 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abf17fa4a4asm762647466b.92.2025.03.03.04.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 04:31:09 -0800 (PST)
Date: Mon, 3 Mar 2025 15:31:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Malladi, Meghana" <m-malladi@ti.com>
Cc: rogerq@kernel.org, danishanwar@ti.com, pabeni@redhat.com,
	kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
	andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, u.kleine-koenig@baylibre.com,
	matthias.schiffer@ew.tq-group.com, schnelle@linux.ibm.com,
	diogo.ivo@siemens.com, glaroque@baylibre.com, macro@orcam.me.uk,
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
	ast@kernel.org, srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH net-next v3 3/3] net: ti: icssg-prueth:
 Add XDP support
Message-ID: <2c0c1a4f-95d4-40c9-9ede-6f92b173f05d@stanley.mountain>
References: <20250224110102.1528552-1-m-malladi@ti.com>
 <20250224110102.1528552-4-m-malladi@ti.com>
 <d362a527-88cf-4cd5-a22f-7eeb938d4469@stanley.mountain>
 <21f21dfb-264b-4e01-9cb3-8d0133b5b31b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21f21dfb-264b-4e01-9cb3-8d0133b5b31b@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_043111_915720_4FAB494F 
X-CRM114-Status: GOOD (  23.20  )
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

On Mon, Mar 03, 2025 at 05:36:41PM +0530, Malladi, Meghana wrote:
> > > +static int emac_run_xdp(struct prueth_emac *emac, struct xdp_buff *xdp,
> > > +			struct page *page)
> > > +{
> > > +	struct net_device *ndev = emac->ndev;
> > > +	int err, result = ICSSG_XDP_PASS;
> > > +	struct bpf_prog *xdp_prog;
> > > +	struct xdp_frame *xdpf;
> > > +	int q_idx;
> > > +	u32 act;
> > > +
> > > +	xdp_prog = READ_ONCE(emac->xdp_prog);
> > > +	act = bpf_prog_run_xdp(xdp_prog, xdp);
> > > +	switch (act) {
> > > +	case XDP_PASS:
> > > +		break;
> > > +	case XDP_TX:
> > > +		/* Send packet to TX ring for immediate transmission */
> > > +		xdpf = xdp_convert_buff_to_frame(xdp);
> > > +		if (unlikely(!xdpf))
> > 
> > This is the second unlikely() macro which is added in this patchset.
> > The rule with likely/unlikely() is that it should only be added if it
> > likely makes a difference in benchmarking.  Quite often the compiler
> > is able to predict that valid pointers are more likely than NULL
> > pointers so often these types of annotations don't make any difference
> > at all to the compiled code.  But it depends on the compiler and the -O2
> > options.
> > 
> 
> Do correct me if I am wrong, but from my understanding, XDP feature depends
> alot of performance and benchmarking and having unlikely does make a
> difference. Atleast in all the other drivers I see this being used for XDP.
> 

Which compiler are you on when you say that "having unlikely does make a
difference"?

I'm on gcc version 14.2.0 (Debian 14.2.0-16) and it doesn't make a
difference to the compiled code.  This matches what one would expect from
a compiler.  Valid pointers are fast path and NULL pointers are slow path.

Adding an unlikely() is a micro optimization.  There are so many other
things you can do to speed up the code.  I wouldn't start with that.

regards,
dan


