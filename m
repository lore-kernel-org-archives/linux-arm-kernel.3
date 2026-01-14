Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEFAD37E3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjJ0doliNf6plVmMYQkV7IlLiBwqr6x+viyB7m/anSs=; b=KHJZeTIRADRvLNIZPtslo+Xq9G
	r4yjMJg/z/mhH27pNdqcCwqxgs8cdRUXZt/pt2SjhGSuXFiVnvFq9AulNWrbmsXn3Ndcqtl6jKj7h
	hV7dfIYV9y5Dr7ARk1mz0UjvoWP1dDkJdOohV7WWYXDufzZF3kkSVR2CCpQ8ij6hOdbUQBX0s6oM1
	EMrqlaZLOYGAKGWqJc+IvpJAI4jx3gzIJh3O35KRkM2SQx7zQIy1vYQ+3a0nkuhT8WLWH1XEr1I3N
	ZPT/fnzlMupCD34mmKA24kf+QNftrQDx/IFP/6kGV/55/TRg7mUFfQQZgNPyNOAareeRfSG2q4Gr+
	OKuvOEbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1m8-00000009W9X-224M;
	Wed, 14 Jan 2026 14:23:08 +0000
Received: from mail-wr1-f67.google.com ([209.85.221.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1m6-00000009W7z-0aod
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:23:07 +0000
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so6529848f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768400583; x=1769005383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rjJ0doliNf6plVmMYQkV7IlLiBwqr6x+viyB7m/anSs=;
        b=H1Kvte0j9gTLVCN4JyvXqA+w+HMg9muhphV6Iz+RFCptSYq2dwU/4pZxVVksPoJ3Aj
         S6AKHOGtxLEnkNYQd6vDd9gNQLWA6trS0N4IsPsmoPQSqpNvrsJuPWQ6H4GoP1DBbHm/
         N0CRsgVnyPJrw+5VQ4yxGqTu8Ec0goBUzW2AFPGqKG2l2+5PAtzPqSSj9ic5zdIcAU2a
         LQqlVnYQftwytZ5eUKficI2A5HQsJpmH0bscez0n/cC85j5vx1lAkQdz+mUF6y1UZUzw
         byCE/XbdL7nWhbGl/44OF4aS1fZs6QESTLxhqm9aSlP9DoodKveRbhwe+8ewBiQlFKVu
         Klmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400583; x=1769005383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjJ0doliNf6plVmMYQkV7IlLiBwqr6x+viyB7m/anSs=;
        b=qyhSySzBLs4Lbk8yH+vPIOUPN3HA+rNOr934WPc9aHdlnO03QHh0sb+Xx0jDzH05Vk
         bm4Ceqk60tgWE+qczQ6ozKvtZXae1PlCm+6v0B93AnHYNNHGgH0ceLjYPgXuxG9mm7It
         RSiAB1kU7Qzh3Y9ti6+GwaajQKqBAFjtRZv7uzqgKHZ1qIevv6MQu473YEVF8NYdQcW1
         +fNbXgIO0GFdS3NFAMy/d4WQTy83nsdxF+JMJAhozfViHmuE0Ksk1Tf8G2+eTslALnbw
         zjV09qlZmAfVrSueGtU8RU0Ce2oWVBovhcs9Ry9Ef1/gxul1T/H1rS8cq50OAYVszGj2
         BFrA==
X-Forwarded-Encrypted: i=1; AJvYcCVsgbQaDybEx8mvDY+FGKqLM+g//s4cZ2dHJKQDgf7wdRiLNNylBclAR4yoleGIGdmSWVBIrv32sxehw+8s69ps@lists.infradead.org
X-Gm-Message-State: AOJu0Yz62oqXIGsUFoJB4taXIOvi4Tj8oGOOoVxLMbBe1eDBZxJ7jwov
	w9Goafedu7ZyYs5nwl3DqNrCFFqgjJsFP+TC62oRSYhIOzSEqJke+z6UYHbmBxMHBMc=
X-Gm-Gg: AY/fxX7LqsvkNJhCxJhfgBLRPDDW54fPbRwOv19xqIXUxIJXpvYKVUoZh1ExffqFFT1
	eoipA98Le7/y7+oXSvpDjggoq/Qy2Nrg8H1Og+qetKpAKuwRy1XHlUiUTFcmUt1/oeX6LgKOq4/
	2x4ytMwoLEPL5bAkg7IzakwehFlkzvaNukVo5NWEcjbr4AgwM4nZfOCHSxX1BBuXiVJ5wVmZzqk
	krbaXyn80w7B/A524xfLk6ajkdN+3WL/7tboiFeI/G3qsEizi+HbDOZ2dh+ssimPSCpjnFVso8B
	5NYOYSGCtFnH3ehG/Hgm8DLwFjHLCMOaF7D3ZspMEc2dKcjGmr145PdGvBMGFx/VWanov8PldIZ
	nD1ya/PB2ug0kxA5GW4X218QGKPXaRQ9jYCXf7+EntMbi0RulOisWXnmpMZX/QxGkMmzsCE2VfR
	piH/vXO5MDVYRBlg==
X-Received: by 2002:a05:6000:3105:b0:431:104:6dd5 with SMTP id ffacd0b85a97d-4342c5728e2mr3256518f8f.58.1768400582935;
        Wed, 14 Jan 2026 06:23:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm49446446f8f.4.2026.01.14.06.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:23:02 -0800 (PST)
Date: Wed, 14 Jan 2026 15:22:59 +0100
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
Subject: Re: [PATCH 06/19] printk: Introduce register_console_force
Message-ID: <aWemw2ZCwtAd17I1@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-6-21a291bcf197@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-6-21a291bcf197@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_062306_199151_40AD0838 
X-CRM114-Status: GOOD (  39.42  )
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

On Sat 2025-12-27 09:16:13, Marcos Paulo de Souza wrote:
> The register_console_force function will register a console even if it
> wasn't specified on boot. The new function will act like all consoles
> being registered were using the CON_ENABLED flag.

I am a bit confused by the last sentence. It might be bacause I am not
a native speaker. I wonder if the following is more clear:

<proposal>
The register_console_force() function will register a console even if it
wasn't preferred via the command line, SPCR, or device tree. Currently,
certain drivers pre-set the CON_ENABLE flag to achieve this.
</proposal>

> The CON_ENABLED flag will be removed in the following patches and the
> drivers that use it will migrate to register_console_force instead.
> 
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3858,7 +3858,7 @@ static int console_call_setup(struct console *newcon, char *options)
>   * enabled such as netconsole
>   */
>  static int try_enable_preferred_console(struct console *newcon,
> -					bool user_specified)
> +					bool user_specified, bool force)
>  {
>  	struct console_cmdline *c;
>  	int i, err;
> @@ -3896,12 +3896,15 @@ static int try_enable_preferred_console(struct console *newcon,
>  		return 0;
>  	}
>  
> +	if (force)
> +		newcon->flags |= CON_ENABLED;
> +

This makes sense because the pre-enabled CON_ENABLED flag is handled
right below.

>  	/*
>  	 * Some consoles, such as pstore and netconsole, can be enabled even
>  	 * without matching. Accept the pre-enabled consoles only when match()
>  	 * and setup() had a chance to be called.
>  	 */
> -	if (newcon->flags & CON_ENABLED && c->user_specified ==	user_specified)
> +	if (newcon->flags & CON_ENABLED && c->user_specified == user_specified)
>  		return 0;

But this location was not a good idea in the first place. It hides an unexpected
side-effect into this function. It is easy to miss. A good example is
the regression caused by the last patch in this patch set, see
https://lore.kernel.org/all/89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com/

I actually have a patch removing this side-effect:

From d24cd6b812967669900f9866f6202e8b0b65325a Mon Sep 17 00:00:00 2001
From: Petr Mladek <pmladek@suse.com>
Date: Mon, 24 Nov 2025 17:34:25 +0100
Subject: [PATCH] printk/console: Do not rely on
 try_enable_preferred_console() for pre-enabled consoles

try_enable_preferred_console() has non-obvious side effects. It returns
success for pre-enabled consoles.

Move the check for pre-enabled consoles to register_console(). It makes
the handling of pre-enabled consoles more obvious.

Also it will allow call try_enable_preferred_console() only when there
is an entry in preferred_consoles[] array. But it would need some more
changes.

It is part of the code clean up. It should not change the existing
behavior.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index abf1b93de056..d6b1d0a26217 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3826,14 +3826,6 @@ static int try_enable_preferred_console(struct console *newcon,
 		return 0;
 	}
 
-	/*
-	 * Some consoles, such as pstore and netconsole, can be enabled even
-	 * without matching. Accept the pre-enabled consoles only when match()
-	 * and setup() had a chance to be called.
-	 */
-	if (newcon->flags & CON_ENABLED && pc->user_specified == user_specified)
-		return 0;
-
 	return -ENOENT;
 }
 
@@ -4022,6 +4014,14 @@ void register_console(struct console *newcon)
 	if (err == -ENOENT)
 		err = try_enable_preferred_console(newcon, false);
 
+	/*
+	 * Some consoles, such as pstore and netconsole, can be enabled even
+	 * without matching. Accept them at this stage when they had a chance
+	 * to match() and call setup().
+	 */
+	if (err == -ENOENT && (newcon->flags & CON_ENABLED))
+		err = 0;
+
 	/* printk() messages are not printed to the Braille console. */
 	if (err || newcon->flags & CON_BRL) {
 		if (newcon->flags & CON_NBCON)
-- 
2.52.0


It would be better to do the above change 1st. Then the @force
parameter might be checked in __register_console() directly, like:

	/*
	 * Some consoles, such as pstore and netconsole, can be enabled even
	 * without matching. Accept them at this stage when they had a chance
	 * to match() and call setup().
	 */
	if (err == -ENOENT && (force || newcon->flags & CON_ENABLED))
		err = 0;

You might just remove the check of CON_ENABLED in the last patch.
I think that this should actually fix the regression. It will
handle also the case when the console was enabled by
try_enable_default_console() and try_enable_preferred_console()
returned -ENOENT.

Note: I have some more patches which clean up this mess. But they are
      more complicated because of how the Braille console support
      is wired. They still need some love. Anyway, the above patch should
      be good enough for removing CON_ENABLED flag.

Best Regards,
Petr

