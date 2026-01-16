Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85120D4A619
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ik7nBSUvqjiZji8p0UMpcxyJ9CmKYvj/STnQwZRmw6o=; b=t+oYUgNUEaKKVsl05i9725GFfs
	VwrunqX1KOkzM8g5fCIJ6KCEq394W1R3A+0KZeTudjgveYFhxEoBRiN5LScbiqEZSc2+jHg20sXgL
	yBASQzY7Ie+eMu3jmFehvN9Ev4/rIErmMK2H1VzxSwEbamkeZStnNfqrhE6NMpleHO44AThKrqOU9
	tuIgzHBUsP7caBMadYCr7Xvm0QDqTEDGOaXks0NvcOIkzGngakbYA2oQBJVHKoG5qXs+/x3thSEl1
	DPc/fQPCOLo59tO7uhvUMGUINv/HgdoGxeDOY5P9+hGK9Z0bntM8rswLMTMPUeuTxWG25hgE7Ohe+
	aVNTs9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggcf-0000000Dtb3-3ppc;
	Fri, 16 Jan 2026 10:00:05 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggcd-0000000DtaI-0egR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:00:04 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-432d2c7dd52so1639861f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 02:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768557601; x=1769162401; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ik7nBSUvqjiZji8p0UMpcxyJ9CmKYvj/STnQwZRmw6o=;
        b=JoBu5zCR6FdA5kbNQ3kSepmkEdiS1UPyNuh9LVnIdNdBp8dZZ90qiPbCf6VJLjp6CG
         Wqf4i+Ehw20RnzsrUXGxQgu1NFw5sXXx0NQBMokxK9hfXH6hcX/XNlu+tkYghpQUpByS
         hgox4/peyljp+Om8t3QZvci7RqwjK6P+NCBs02vXAxiUw9CfqoG3nHoi6VeXblzeMEhb
         957YSGx4Hol5uJDhmC3EmgNkxLjy1KUtCJf9Af4t5yZr9mB2udLXVQDO1invdSPCbpOV
         rvKGKrs3IwTEu9q1H8wZ2161hkY91/73YO5d11hPAJqtqkNoCApBkSfokNDN20lFa2ax
         Gumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768557601; x=1769162401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ik7nBSUvqjiZji8p0UMpcxyJ9CmKYvj/STnQwZRmw6o=;
        b=eXntwK0imIC8q/dKP3GJR+7lh93k9/4WFqx0M1BoDC85UZjKgpRj6ySjMqR7Y96OS2
         rDx8qELta82r8XmIbyAP5D73XXQ87ESF0B5iw4R1co7JdOQCHadVz78/TjB9BL7QoP1V
         HHXhKgiQDuVx1gUrK3UYqO6X2NaZSZwyqvFswIx730y9jv6OCSW1kJiHwcM49woJfeF8
         AqY9nt82EOL7ZM9N2psBtm9zuMgM7q0UIeph+G1DwoV7RSln0LSd5+rWWW9Oq+WLLx/N
         FyHJIEjcnoRpIl7chc0Gk/rYyGn0M1wzhODtTn2YdJ5L4PWViXiX1FHfHKCM4Md/rHK0
         IIVg==
X-Forwarded-Encrypted: i=1; AJvYcCU+cR6K6T0aDGt2h/ndsD1VL2A5zE/UZvTgz9m4Fpxm0fbYoEi4PQpLuhmmtf52VwFkJWzqRKJ3AHzPT4Z7QiQK@lists.infradead.org
X-Gm-Message-State: AOJu0YwfWKEsQSbmsFHQ0o7EuwY9tmqeH2HG3RdL28jR5ONtVGRthn3c
	ZrF1AbcX70zz8SBQtJfNPGSY3pjJ3hQTxXAMsoKDEWEfJT5yZZQuPyDn/szYTJS6QdE=
X-Gm-Gg: AY/fxX6tF1vowdZO7QH3p+3UWQuC85dO219uK51HQmtgIIKdXmY+7V+pmkhZJ4z4IR6
	pwLHoVDqCeVGdDh9u0YvOKDFsJOE0rMCrud8j5RKbacBw7ogJ2yfaKlP+KsJEAIhJQ7wGqZojT4
	/cq1hxiMM80QM5Is4lvGKfwRz0R32dBBQ9Q+qoNJkNDGp6F3+MrPI9tA3wDWDxFcE0cto9fxIcy
	5m+M1WaGSijbi4NGkNQaLR6nzojeIlhkQUBnuMk0n2tLw4MawCxeBR/DShjbd4QUx+imZsQCn3f
	EvJ4T60F/sh1jujBUqnLP8hV2acmouvL9kzqV2VDteiWXTDWXEmRwnRXjfa0iDp4Fkhrc+ZUZqW
	h6sJAo8zK2oEu6AsE6NfFxt2et+hzLhpG4bY2Qy1K5bZskQiQ0M5Rj/flCPJeiHE7bmav8Qf7ML
	oJbu7wrRlOnAwvOw==
X-Received: by 2002:a05:6000:26ce:b0:432:dfea:1fa8 with SMTP id ffacd0b85a97d-43569bc5767mr3019291f8f.45.1768557601174;
        Fri, 16 Jan 2026 02:00:01 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921f6esm4337797f8f.4.2026.01.16.01.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:00:00 -0800 (PST)
Date: Fri, 16 Jan 2026 10:59:57 +0100
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
Subject: Re: [PATCH 15/19] drivers: tty: serial: mux.c: Migrate to
 register_console_force helper
Message-ID: <aWoMHbbn-BmmbZMg@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-15-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-15-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_020003_231272_7B7B8081 
X-CRM114-Status: GOOD (  14.50  )
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

On Sat 2025-12-27 09:16:22, Marcos Paulo de Souza wrote:
> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
> 
> --- a/drivers/tty/serial/mux.c
> +++ b/drivers/tty/serial/mux.c
> @@ -390,7 +390,7 @@ static struct console mux_console = {
>  	.write =	mux_console_write,
>  	.device =	uart_console_device,
>  	.setup =	mux_console_setup,
> -	.flags =	CON_ENABLED | CON_PRINTBUFFER,
> +	.flags =	CON_PRINTBUFFER,
>  	.index =	0,
>  	.data =		&mux_driver,
>  };
> @@ -547,7 +547,7 @@ static int __init mux_init(void)
>  		mod_timer(&mux_timer, jiffies + MUX_POLL_DELAY);
>  
>  #ifdef CONFIG_SERIAL_MUX_CONSOLE
> -	        register_console(&mux_console);
> +		register_console_force(&mux_console);

The situation here is the same as in 16th patch for
ma35d1serial_console().

Also "mux_console" is assigned to

static int __init mux_probe(struct parisc_device *dev)
{
[...]
		mux_driver.cons = MUX_CONSOLE;

		status = uart_register_driver(&mux_driver);
[...]
		status = uart_add_one_port(&mux_driver, port);
[...]
}

So, that it can get registered also by:

  + mux_probe()
    + uart_add_one_port()
      + serial_ctrl_register_port()
	+ serial_core_register_port()
	  + serial_core_add_one_port()
	    + uart_configure_port()
	      + register_console()

And we would need to pass the "force" information via CON_FORCE flag.

Best Regards,
Petr

