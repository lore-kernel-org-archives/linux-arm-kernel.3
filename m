Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1522D2F34B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 17:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=; b=K0VnHvtNa4xi9UWLCgWju7vRX9
	ns4xTNPRBtM1PIDFi2UQudcgm9mZMYTskCSZY3F7+pXM0Ft9Kou8AiAtt+6D1HOfIQtzdFWC6acSI
	ubr0QRETHkeT1DfsbYWAiBkpldNuZ2xukSYMR0Vx+Ck2A6kpZ73YA0crY5Rz5pzJH38BPt+xkxdKL
	DeBgxxD35RudbhfpR3iMmAn3tZnoPyGqsH6TvnXKqCbzgHofRAFPs8bLuJbv7xQ+t5aFRVoNFtYnO
	u3IXj4guvIsExcYUShlus59t2YOwPwpBigAqrSil544u+4Vw8h9K9nwnbtxTkkKSvRXxI4Bx2YD/t
	h6sqS0Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiKa-00000007Xfb-1jeq;
	Tue, 13 Jan 2026 17:37:24 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiKY-00000007Xef-1W8E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 17:37:23 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-430f57cd471so3943958f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 09:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768325840; x=1768930640; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=;
        b=RI06ZjcUx2YgRorbLPOXIHkMJV7NvKIDeapH0PXsXWGP3eMuP7Y5jNic434/mVF9w/
         Uss3hnZZlE+8HCBjbHgyuvmnu7b9lgnvFTqlgQjs2aFVRjelsabhvX/+KRo7OrXU2tkv
         7i7/NKxX/CPUjIsAvUNoeOHQO5K1HLUd1xmWor9o93OMk9Wi1kS00vLq7f8meA0xMgwJ
         +4Jzw2w1W1O0OY2lTlbe7ByPIBTn540eQwOHGkMBm3WcVpZkAdWCE7ISNLPr0ljAfiSt
         l8DFLROXSZ9OGErfxpIb3trC+WGD/6dTel4eTzQTyBQ0m0kYm7GPHbpW1CH2AdWDVzXt
         blJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768325840; x=1768930640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CVOy4tPw1zWY0e6rYcKRwtfrfRvUlKFzd8YTNoGp5w=;
        b=T2TSAB+1UsWfC6KXgSAN4GT/liyVKboa0aNzIbM+sdhqcLFglI6yjykPMnBqUJ+5l7
         7aR48sZsy6l0GcEpJWrqa5Dh4sbaXUm4Xta+fBg//PWv6AO70bVwX+xxvZueMglwVOEX
         RcfL7IOJm3cdi3Xj1tS9VsyctLu6lEIA+dvG6Re0GNtuhwi0EHIu1pODFlN1pLl/jt5Z
         vVLbJSpAZkgtx0MvqTED/R6lRfP19TIsGEIxi5QghlLCm1czaEMN4lqDTEKliRsokraT
         flYDwUTn1EZO1R8IampQYSSo46rwbecf/Ycf2b5o8oM8LErEwJ274Sl76boUaomUTecm
         BOQg==
X-Forwarded-Encrypted: i=1; AJvYcCXTrM7DMEEsNC8I67VzrKVrnV1CTJ1WjX7lkELtqbBKZVnUyaCwBAjM+prFeNotHuqAhM8Bfu2I2oDN0oZAgQb2@lists.infradead.org
X-Gm-Message-State: AOJu0YxwgKt6oQ6sfKKW5eE9+J2S/GE7AjSKeXnc1zCgMTT4YWY3meuk
	kreIoD+OTLRWe9QljbdlBR1O7Bf1rwMkBtHTBMK0dTodIv4NSNaUjVXF0t+1CBBty4A=
X-Gm-Gg: AY/fxX4t1iw03MzGr888KHEaIuZnSweav7jsc+ctGAX1ZAnXn3wWRDgO1THMR3SHi6t
	i4l+V2GL1ToGut7GyN+Ap6GfDnE94YFgSEb3LDkZXoYlcmj4bBIGOfuiFrsvafT2jpXfuWwfq3w
	rbDXgg8ycDz5JIXkn18zo7fkduZZXxei/o/GIvp/2lJbuDonojEWmI5twDwijuTdzyLtoYwe4QW
	D3iPNHjyxHDUekXijklLfT6Ht00nLGeijx4PXG26JUCaV13Yu2qxKvOAzgVlh8Xo4RUoKi5KYop
	bPFYIGx4ZFK6TahQ7PtZFLwB5l9C0PPdGAo4mjbRxvuJm7bsIywep//dCHT4LhaITrHYlSuaunJ
	r4/qydLcbdiJN/C15nnqXGwr9NwgHkhoT3Y9KFbv3M+CFRdWmgjLYwvEI94QbuVQjiOZ2adTTag
	c9jKlpuPJdlBVeLw==
X-Google-Smtp-Source: AGHT+IHUReQqvVgC0db5F0/UgqAPwHgCcpq2ZD0lhm0g7XnDeEa3Phlj1/GEitKl8zvqkUFbSZC6XA==
X-Received: by 2002:a05:6000:2dc9:b0:430:fced:902 with SMTP id ffacd0b85a97d-432c36436fbmr29258778f8f.26.1768325840268;
        Tue, 13 Jan 2026 09:37:20 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432d9610671sm28342147f8f.34.2026.01.13.09.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:37:19 -0800 (PST)
Date: Tue, 13 Jan 2026 18:37:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 02/19] printk: Introduce console_is_nbcon
Message-ID: <aWaCzZ8_UuyAa6xp@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-2-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_093722_428005_B05B2D0E 
X-CRM114-Status: GOOD (  31.88  )
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

On Sat 2025-12-27 09:16:09, Marcos Paulo de Souza wrote:
> Besides checking if the current console is NBCON or not, console->flags
> is also being read in order to serve as argument of the console_is_usable
> function.
> 
> But CON_NBCON flag is unique: it's set just once in the console
> registration and never cleared. In this case it can be possible to read
> the flag when console_srcu_lock is held (which is the case when using
> for_each_console).
> 
> This change makes possible to remove the flags argument from
> console_is_usable in the next patches.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  include/linux/console.h   | 27 +++++++++++++++++++++++++++
>  kernel/debug/kdb/kdb_io.c |  2 +-
>  kernel/printk/nbcon.c     |  2 +-
>  kernel/printk/printk.c    | 15 ++++++---------
>  4 files changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 35c03fc4ed51..dd4ec7a5bff9 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -561,6 +561,33 @@ static inline void console_srcu_write_flags(struct console *con, short flags)
>  	WRITE_ONCE(con->flags, flags);
>  }
>  
> +/**
> + * console_srcu_is_nbcon - Locklessly check whether the console is nbcon

There is _srcu in the function name, see below.

> + * @con:	struct console pointer of console to check
> + *
> + * Requires console_srcu_read_lock to be held, which implies that @con might
> + * be a registered console. The purpose of holding console_srcu_read_lock is
> + * to guarantee that no exit/cleanup routines will run if the console
> + * is currently undergoing unregistration.
> + *
> + * If the caller is holding the console_list_lock or it is _certain_ that
> + * @con is not and will not become registered, the caller may read
> + * @con->flags directly instead.
> + *
> + * Context: Any context.
> + * Return: True when CON_NBCON flag is set.
> + */
> +static inline bool console_is_nbcon(const struct console *con)

And here it is without _srcu.

I would prefer the variant with _srcu to make it clear that it
can be called only under _srcu. Similar to console_srcu_read_flags(con).

> +{
> +	WARN_ON_ONCE(!console_srcu_read_lock_is_held());
> +
> +	/*
> +	 * The CON_NBCON flag is statically initialized and is never
> +	 * set or cleared at runtime.
> +	 */
> +	return data_race(con->flags & CON_NBCON);
> +}
> +
>  /* Variant of console_is_registered() when the console_list_lock is held. */
>  static inline bool console_is_registered_locked(const struct console *con)
>  {

Otherwise, it looks good to me.

With a consistent name, feel free to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

