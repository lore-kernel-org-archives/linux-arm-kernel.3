Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48C3D37E2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 13:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucpTGToIn8N6Wm60fm7MZ05SRRlKYptl+ek5X25PfwQ=; b=N0jR4jpJOSrYKG7O3gAtGG//zr
	TFR24cbkWQS1g4OnZJlROrGtnttP2ASkvR0J6kxo2Ckv1fuiuvwfJ2SwOASdWAn0CKA1A1ypwui1n
	0x0lT1casKkpSXIjFocLmtqITxI3IzbPvu3Nt+uPPw5WD2epU+824oqUhG5GGbrU/zy2mOM5HFpTN
	qK0prc6Y9EKfX/dwZvDrTY7cMNR5fZn9bd0c5Iaq9iuTLKdJE/ZlWBWlyHUiqCrZfE4eB1rRLpqtj
	VH4HlKiG4ARBQG8m/t/k6rvJb8UxF000syPFcx+oK7jl5QaWJAlE1uYkpdZA2lg4eHErMo1IxxODt
	ujLXEKHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0fk-00000009Hxt-0L0i;
	Wed, 14 Jan 2026 13:12:28 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg0fg-00000009HwT-2fhC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 13:12:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so39470635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 05:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768396343; x=1769001143; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ucpTGToIn8N6Wm60fm7MZ05SRRlKYptl+ek5X25PfwQ=;
        b=YGMlSKQgbnJyDG06D9b3Noa1IcejXdO1zusOy8eTfhSxslGHK+lToxk6/g+d6wK5Cq
         Ls4971XgzEDmhoWLrQhcxQOzVD2+wzgCwzeZCOhV/yRpWGIPM/CFoNr+R5eUvgt+5fYS
         8Kj8hD0352ZifkYAQAAbPAJkAtjhbIWmYMtXEHzDpp6dTB1lPr+R8iiJVenOugqq6Gq0
         ltUV+zV+Gddqta6dHHgbmFBizQq+twsQPFWZbfnRFwqA/VK4He+2u9rm6mbb6siiME7y
         nRTp5qaeWHkz5d7qtMUnc5z3MIax36zByh2RwZd6gJu70gt69C+4RuPXTxjRPHlPqAqe
         Ho2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396343; x=1769001143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucpTGToIn8N6Wm60fm7MZ05SRRlKYptl+ek5X25PfwQ=;
        b=EewVt4avzIGnIa2xN+apC+q00USg0h3IAuUSA7Xe4+584MhNUgvadhO/XF2y78NgFU
         D7l+vrbJFKh8Sejl6PBfVuYYl6iI+UgYdxA+3lafq9/8Lo2x/9gOEV/LEQ63/R4ex3DO
         s3+qXUzydwu6oMziZEv6MM592UVgJvoH5eXuuRJhLtDXmQ3ryfo8UL7j9x36RlZiPnHO
         DIStkv7mpaWgcGKjLVkbkfXR4J5KeGhoBWHijsAd0hxNtSAygEHPi2KbgjRzwcwuktaS
         GrtqYrr+sJ4rzUojJIjRXy8uD8Mi+LEbe+fkZ+T0a4ofrcDeskbRrAPL98vHOIGQ0R2d
         ZgXw==
X-Forwarded-Encrypted: i=1; AJvYcCWK4lBWI/LoP65ZTt71eRzEbhIp5wkSnLV9oO33u6EF+nFygAgdfjg1k/pUjKMp+s7vbabrmFn/Ab/dXAxR80Gf@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv4XtF1REMK2TNOv3Ywuxsmnx/x+EWmF3hn2b8vcQo2J0fu85Q
	Pxci5072P6dQnvj+n/Gi5bVpuSynAv+LSbjU7mIXFlMYbubvN0GVunwbZTf5bg6jHNQ=
X-Gm-Gg: AY/fxX5sNsZ97NZL53pOoQb3woEigh18Sg9cNOlE3OR/ZofeiEq7bMhGL46PBo2V1qR
	V+oyI0HwjTiPy4qfQs4HNPtJ+v82z/WZYC38d5atmDYGCuTRqNlIb95PxXPiEh4UA1a9P5x+FUb
	V1w+VYTUd7yyJ8T+Vv2ForrjfbtPO63FGEgR2RkOB+Am2/d1w5E2AB2it5HfINbPW7Z4Uk4GScu
	ex8qfUPZEb6pGYYcvIJwBOeQd/CNy/7+xFMpphWLYwEuMJVTdyCyZEWfeOWyF9qioCL6Pc/ai5A
	ComAeDhjYIbhMBGNkQzzezaZd1PDWXo3d16BIwXbehJGFrDMl1ua+xKc+xUQchp7X5XvLGGYWal
	V6HjCxSSMN1aUF+TkeLJo5YoDF+ll/fSambVUpoE0gCJSOR6QkWYg8pb9uiNWqnfIVn/UEkhtwY
	8s8sLtvKwztwUpLrZNhMmSa/HU
X-Received: by 2002:a05:600c:5490:b0:479:3876:22a8 with SMTP id 5b1f17b1804b1-47ee3356d5dmr36820375e9.16.1768396341643;
        Wed, 14 Jan 2026 05:12:21 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee54b8c9bsm27274065e9.3.2026.01.14.05.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:12:21 -0800 (PST)
Date: Wed, 14 Jan 2026 14:12:18 +0100
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
Subject: Re: [PATCH 04/19] printk: Reintroduce consoles_suspended global state
Message-ID: <aWeWMga1VaT0sYwj@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-4-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-4-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_051225_276409_6A310E42 
X-CRM114-Status: GOOD (  24.79  )
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

On Sat 2025-12-27 09:16:11, Marcos Paulo de Souza wrote:
> This change partially reverts commit 9e70a5e109a4
> ("printk: Add per-console suspended state"). The intent of the original
> commit was to move the management of the console suspended state to the
> consoles themselves to be able to use SRCU instead of console lock.
> 
> But having a global state is still useful when checking if the global
> suspend was triggered by power management. This way, instead of setting
> the state of each individual console, the code would only set/read from the
> global state.
> 
> Along with this change, two more fixes are necessary: change
> console_{suspend,resume} to set/clear CON_SUSPEND instead of setting
> CON_ENABLED and change show_cons_active to call __console_is_usable to
> check console usefulness.

I would invert the logic a bit. I think that the main motivation
is to replace CON_ENABLE -> CON_SUSPEND.

<proposal>
The flag CON_ENABLE is cleared when serial drivers get suspended. This
"hack" has been added by the commit 33c0d1b0c3ebb6 ("[PATCH] Serial
driver stuff") back in v2.5.28.

Stop hijacking CON_ENABLE flag and use the CON_SUSPEND flag instead.

Still allow to distinguish when:

  - the backing device is being suspended, see console_suspend().

  - the power management wants to calm down all consoles using
    a big-hammer, see console_suspend_all().

And restore the global "consoles_suspended" flag which was removed
by the commit 9e70a5e109a4 ("printk: Add per-console suspended state").

The difference is that accesses to the new global flag are
synchronized the same way as to the CON_SUSPEND flag. It allows
to read it under console_srcu_read_lock().

Finally, use __console_is_usable() in show_cons_active(). It is the
last location where the CON_ENABLED flag was checked directly.

The patch should not change the existing behavior because all users check
the state of the console using console_is_usable().
</proposal>

> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> index e2d92cf70eb7..7d2bded75b75 100644
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -3552,9 +3552,9 @@ static ssize_t show_cons_active(struct device *dev,
>  	for_each_console(c) {
>  		if (!c->device)
>  			continue;
> -		if (!(c->flags & CON_NBCON) && !c->write)
> -			continue;
> -		if ((c->flags & CON_ENABLED) == 0)
> +		if (!__console_is_usable(c, c->flags,
> +					 consoles_suspended,
> +					 NBCON_USE_ANY))

It would be better to move this into a separate patch.

>  			continue;
>  		cs[i++] = c;
>  		if (i >= ARRAY_SIZE(cs))

Otherwise, it looks good.

Best Regards,
Petr

