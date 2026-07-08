Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09716C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 14:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyOhrDiD3HZi1C97C5b5wI4tA2tqQIhwOgRgckqnDRQ=; b=cHUzoJVFtVuHFOyzp9LfcEQSNO
	rJI01Cn7IavWFr3ZlG4iNyqLmvnelSadaGGWQ5IM21wssUZHxfFCryVtv+73SLMi9EhGnKm9wNklz
	BBoADDd7P21Mqgq7ogT9u6u0U09nfolMaq3UCZydiT3ZQJKKWcfJy5vwS8as0yTGUWsdRfeFHlPv2
	Gimy3twqavUUaaW91Az3faIqgPQ1iyYuwqu6UsiqinP1p0+H0CP+ZCBgVoM7XLGJ1oDoET+3LCg8O
	xIWIKY3IC9AcQA4fzTYEZbMHu4nydgDBqQvXqy9f91azqWogW3mAyrNHaOxhL6JGLQOhJCgDSsiLV
	0e8CdEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSp5-0000000HEJz-15nV;
	Wed, 08 Jul 2026 14:00:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whSp2-0000000HEIj-1MUM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 14:00:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493b77b150aso5615705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 07:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783519218; x=1784124018; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gyOhrDiD3HZi1C97C5b5wI4tA2tqQIhwOgRgckqnDRQ=;
        b=LH+r2gjMlptiFUvQ/3YLUyDHfLrV19ntrPNXRkZH8RWzcCH/keeQdH+QnH/2vwwe30
         MHsMHE48cJrQHPaiRckrfBROjw/8z9QiIDGcGEJBAPK9coUxfdlmcHMmRSYiHpusvgsB
         YttSkqV2vz9JzUecslV45Uq8JEPgXX9eMOcZBMVqiSA9CIv6z5gf6x+Zav34/A7Oqo9a
         cUZxpx/Q9sv0IXEhMBv+s+1ThT+rUUFc16xvBKRIwyvHRzl6csiOZCNUgzmDVW4djCm7
         8c8EWDADA5T1gzkE+rPC+Ba5q0FTjopHTwHiECbJpH7e8nkj/F9Llho/hXvIzmDr42ck
         3DxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519218; x=1784124018;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyOhrDiD3HZi1C97C5b5wI4tA2tqQIhwOgRgckqnDRQ=;
        b=TRkvx57JoFuT5qYQdbQpYxp+NBUtRbUDBsdp9ww6+gHOc963ChE7+jOZX6jVAZx2nf
         Q29XlLhqS6iGyDa7fgRHIAXgWcoZDzZf5pfFPWtwF7pVo+sPmAI3dSWSmWtbcQFwXLim
         m2sVWdwtqqFHrrZNFdwsMYHNmZvoY0Lgv6+MAqUnsqpFmm+ycAy3K+U0Z1AcrlU3++CO
         muO+eWBME2zLZscWaENFtoJjws3EBS0Xh1+1ADwiugWQnMfoXYmoc9ins8OKFiqhz8PY
         U7SGncLFXcYSG2PBSm5q2WpAXNYDZ5duF8xzOLyuWzVqjtx7joGJnRugjW4f75hd8MJp
         nklA==
X-Forwarded-Encrypted: i=1; AHgh+Rrf9spXkjqWDbejKWvDvc1PUxJM76yw61n/TRBHZHPrgb5y0dkXntdh7LP6axvfQHQg0MHUm9onoINmDZJjxR2Y@lists.infradead.org
X-Gm-Message-State: AOJu0YzQrvnnpSrDXBojpDw7mejnvIjD8IHNvEm3ZoiPosKd3N5iHTpQ
	OUv/FJbnuUJXTGBjQwgiNusLRmBqoZR2CLF7pgYfLg2/XCrc2hx/k6pv502/x6bTMUA=
X-Gm-Gg: AfdE7cltjlaGSRrwKDzBr5k012yS36Hyf9yO1FPURgH1mK4OxUCRTs7JGSUbmiwfzJx
	Jb5BbdWPv3XK81uKvLg/wxMwUInnEqScNLEZ3fcVy0BRMTCfBOCvwYI9J2hZaQxi2/QX1uglvSM
	rnJ+MW/st921Pqr4Km/x3dYQac2jb2na4Q89Xd61vNP3RclilU7Lrl4ztCdqwAoNfp7rqtV9nIy
	41Kwffi/dUnYQPdwmSeCdUDFt5d+FVDSRjRU0AiSwUwRKZb/wgkkcryQUp9I39/icNrFzVE2j3v
	bUjNsO6RP9yo+3dkrMFZHKwx/PgF23IN6EQE47E5t7jX3SoAW1KwMQEjSGkc+FXQdE/zPcySHZZ
	tFcB09fSb+xtkHM9ixxj+DZkw+mGd3l7kbLpht2lxL3wmv5kmVSk/TwyJTx/9QpXWKNcPYEkqja
	J5YHk580tNj9lrt8s=
X-Received: by 2002:a05:600c:3acf:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-493e7a2b209mr20847575e9.32.1783519218219;
        Wed, 08 Jul 2026 07:00:18 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faee30sm120828745e9.10.2026.07.08.07.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:00:17 -0700 (PDT)
Date: Wed, 8 Jul 2026 16:00:15 +0200
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
Message-ID: <ak5X718OcOi8OeT4@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <87zf08w7qo.fsf@jogness.linutronix.de>
 <ak0b2S9jjYy49a8V@pathway.suse.cz>
 <87echdvkd5.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87echdvkd5.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_070020_391338_0309942E 
X-CRM114-Status: GOOD (  25.95  )
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

On Wed 2026-07-08 12:42:22, John Ogness wrote:
> On 2026-07-07, Petr Mladek <pmladek@suse.com> wrote:
> >> This is too deep (also pointed out by Sashiko) because it multiplies the
> >> delay times the number of consoles. For the legacy printing, it would be
> >> more appropriate to put the delay inside console_flush_all() and
> >> legacy_kthread_func().
> >
> > True. The question is if the proper solution is worth the complexity.
> > We would need to pass the information down two level of the API.
> > It would require adding a new (output) parameter to console_flush_one_record(),
> > nbcon_legacy_emit_next_record(), and console_emit_next_record().
> >
> > It is not that complicated but these functions are already hairy
> > enough so we should be careful.
> 
> Fair enough. But then it should be consistent and
> console_emit_next_record() should perform the delay before allowing the
> handover. Something like this:

Great catch!

> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 2fe9a963c823a..62fd6a5ebef66 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3161,6 +3161,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
>  		 */
>  
>  		con->write(con, outbuf, pmsg.outbuf_len);
> +		printk_delay(false);
> +
>  		con->seq = pmsg.seq + 1;
>  	} else {
>  		/*
> @@ -3182,6 +3184,7 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
>  		printk_legacy_allow_spinlock_enter();
>  		con->write(con, outbuf, pmsg.outbuf_len);
>  		printk_legacy_allow_spinlock_exit();
> +		printk_delay(true);

It is pity that this is inside printk_safe context with IRQs
disabled. A solution might be to call it before the write.

But maybe, this is good enough. This code path is called from
vprintk_emit() and it might be in an atomic context anyway.
Also it increases the chance of successful handover which
might help as well.

Anyway, it would be nice to mention these pitfalls into commit message.

>  
>  		start_critical_timings();
>  
> 
> John

