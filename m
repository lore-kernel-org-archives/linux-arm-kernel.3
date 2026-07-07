Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2315C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dnXXTA5QHDGkY6+1EXQz/Z/TzRlKI5k35UU0v99L+Q=; b=RQaQQTTgOIWrnwR0RGlAie+X3E
	zylPlCfCG1qL5xvp4Cc1+7YVmMw+vh7giQ5nOpJAl24z5mtwTXAOmgrf279lT7S6CeaarkOsFYAeG
	x/iPy+aqHxkmX8xdCOMHGQ2FgJ56rMdaR8TM6BwRcqbBrgsUGENnIlwCwEfUIkLuFCEJ33PoqVhIX
	Mo7bgSLwB0sDRVP4CvZXSi1lrrd+OIVz36RvYqOrWbjysfUmD6upa0kN1xW58p1fj/d1iyw/BMM5K
	ZuuihbhhbUjti6F5SvyJunUvLQ+Wf0qCP/IbWUGbAGNUa7STunr0tEEm1QBwiseG0ljacD7J1acBn
	XX/pl5DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7nI-0000000FK7u-2XMD;
	Tue, 07 Jul 2026 15:33:08 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7lt-0000000FJCu-3lGf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:31:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-474560436c3so4126130f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 08:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783438300; x=1784043100; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3dnXXTA5QHDGkY6+1EXQz/Z/TzRlKI5k35UU0v99L+Q=;
        b=YJgmg/KXmdvB2xvWvzN6cUA2TgL8pIYYYJ9k5hV/k+HBCSmHnUZluzC2wDYSTD3xTB
         8TWka8mkGOGPv84eB7SeibyX9gHia/KfFSjmVtleSAqASqBVE/SASsEEnVo9qCvK4fWc
         JLoVECG7OwVA0ORAtaSbqE49vWPxnPHMANb6vDQOG1Gtfj4FveWsW1a3D+UqqjNHGi3m
         44b5s6bE+M0/DNghft2ZN1ktKeiKmkWFEwyVPH5j0hOkuANs6CGk01Ml7SlvFBU1973m
         ogRsdVLlZrEBv5LtZdlDZco87/Hs4rY4p6b+eLByUQrGeIM7DWELpQMZQWToTd2bBOir
         +pNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783438300; x=1784043100;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dnXXTA5QHDGkY6+1EXQz/Z/TzRlKI5k35UU0v99L+Q=;
        b=b/g9F67epk3JA5lEr4NYlCmY6sx0cB9frcupBs0jP6aWhRwYArzvTrvK9n/sTrsAV3
         pFFe2v+O4d1Tmyg1bm8bbmamWJVRloeCyJ0D+FMBK0dUd6mdhQqCt5hdrw379wgYAnvz
         Uzsb5L42OP7mLIU29kbZ4lbDAJVXzsBfwFb5fPQSdLGJg//0w7hIj6qeMLMgNnAAq4t8
         NGse3vAIfA5H71Fvs9/q7CNm58vFQh2pvWfkhaN72dKsAxQ2XZV4D+57lr/m57oaVZav
         PLZRcpxjpyithjHxQc4Z31Kg8lNl2jwJ6xNuUVFKWWBdsptdkRuqZ8qak0AjiGcxyogv
         LVeA==
X-Forwarded-Encrypted: i=1; AHgh+RqrdnKlQ+R6ih932Z7+B5C/lwBrIyARWpsEzDEi7d9Mpsxblg8MTMHdBfipAVeRUnWU3Fup4YrioYR77zi2pXWX@lists.infradead.org
X-Gm-Message-State: AOJu0YzONGOBI3uw+7jbQ7Ixs4CBotnrAcatWrAsbYF2T9bXHO6uO4As
	+X06WiYzrhJwCCuQpLNpJtvt1+j0S3QbuPSCXn8T5ppqqmGAS/8YGCuyOlVXV9QnMKQ=
X-Gm-Gg: AfdE7cl8HSZyH2wt/36UA+zWWcAD0buVDRkz4YP22wChmRx2NF4EdZ+iczo2P/xODUU
	DBYqjzs5BDHW+3c3fWSrZolF3isQywZKbxiGt4YlteSjrvtZ66XK8zH/gXEgSPNhKPr5YYSvTzu
	6pRY09lmG0V3J2VBouXzrloINGSJsZ6e0pzE3cQf7c8hwFs433vtjnHWqUgFhcBLEPwS5PS2LIl
	FeJG3xlXFHdy208pBHfjbe1z5ps1asS0KfBANYPnF6EahLCwOHAsSzgLX3ntmTboTGoe12lSUnY
	AgbEliknkCDAylEbVBIT+xhffdw8u1Gc63Z85inAE6jaXSO0UqcCaz3VT6V4NzEgrTJ1WL4XaHi
	2NwR4XdwRsMJCccda3Ueji0uyinAQb+oiDakq217Hn2/STw/6m9zzmkupt1aOEUZZtVwVAZ7jjL
	6BAte9uq0P3m0uSxs=
X-Received: by 2002:a05:6000:bc7:b0:47d:dfc6:b27e with SMTP id ffacd0b85a97d-47de66bf187mr4980390f8f.31.1783438299879;
        Tue, 07 Jul 2026 08:31:39 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm33961270f8f.28.2026.07.07.08.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:31:39 -0700 (PDT)
Date: Tue, 7 Jul 2026 17:31:37 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
Message-ID: <ak0b2S9jjYy49a8V@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <87zf08w7qo.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zf08w7qo.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_083141_977244_E50ED28D 
X-CRM114-Status: GOOD (  26.66  )
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

On Fri 2026-07-03 15:03:51, John Ogness wrote:
> Hi,
> 
> Sorry I am so late to this party.
> 
> On 2026-06-30, Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
> > diff --git a/include/linux/console.h b/include/linux/console.h
> > index d624200cfc1708bf73925892a466efe0c95c5586..3478b556c0eb9579530409dc6fbb9b5a8bff581c 100644
> > --- a/include/linux/console.h
> > +++ b/include/linux/console.h
> > @@ -290,6 +290,8 @@ struct nbcon_context {
> >   * @outbuf:		Pointer to the text buffer for output
> >   * @len:		Length to write
> >   * @unsafe_takeover:	If a hostile takeover in an unsafe state has occurred
> > + * @emitted:		The write context attempted to emit the message. Might
> > + *			be incomplete.
> >   * @cpu:		CPU on which the message was generated
> >   * @pid:		PID of the task that generated the message
> >   * @comm:		Name of the task that generated the message
> > @@ -298,7 +300,8 @@ struct nbcon_write_context {
> >  	struct nbcon_context	__private ctxt;
> >  	char			*outbuf;
> >  	unsigned int		len;
> > -	bool			unsafe_takeover;
> > +	unsigned char		unsafe_takeover : 1;
> > +	unsigned char		emitted		: 1;
> 
> This is the wrong structure to add this flag. This structure is for
> the nbcon drivers.

Good point. I see:

  + "struct nbcon_write_context" is intended for passing
     information down to the console drivers via
     .write_thread() and .write_atomic() callbacks.

  + "struct nbcon_contex" aleady contains section
    "members set by emit".

> struct nbcon_context would be the correct structure.
> 
> > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> > index 4b03b019cd5ee25d68e9ace84392045e91241a7f..ae45cb0589c0effafc66f1756bdaecd1c1e53ab9 100644
> > --- a/kernel/printk/nbcon.c
> > +++ b/kernel/printk/nbcon.c
> > @@ -1525,6 +1532,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
> >  	}
> >  
> >  	progress = nbcon_emit_one(&wctxt, use_atomic);
> > +	if (progress && wctxt.emitted)
> > +		printk_delay(use_atomic);
> >  
> >  	if (use_atomic) {
> >  		start_critical_timings();
> 
> This is too deep (also pointed out by Sashiko) because it multiplies the
> delay times the number of consoles. For the legacy printing, it would be
> more appropriate to put the delay inside console_flush_all() and
> legacy_kthread_func().

True. The question is if the proper solution is worth the complexity.
We would need to pass the information down two level of the API.
It would require adding a new (output) parameter to console_flush_one_record(),
nbcon_legacy_emit_next_record(), and console_emit_next_record().

It is not that complicated but these functions are already hairy
enough so we should be careful.

Best Regards,
Petr

