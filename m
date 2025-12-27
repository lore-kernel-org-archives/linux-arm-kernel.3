Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD3CE8FDD8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WVQ5l6OvuwNcTcqNwKXFrwDkeL8FFp17NQ/ZoKZRdE=; b=cpUi31MbTzGv2zIsI4c7z1Hctr
	YaMS9IlJdFb1xUGRpnD7hB7kSnuwL+LFQhBHIE5iDC0Omz+16a5k98mdwQUghsfJV/gmlmxfNQGXq
	R823cB5z8Me81GKa4QSnrVifJ1s7wLmOXtvKqx5I5RZ6I5VkU+ClWsbQiBkVubGdv5wEpBpzQKyvb
	50jL+NL5XwDrDpqo84YZRLIz73RoLukhKT4peQIWMer+a5RGCWW7+4bXvgo5olBsZHLPSEZ4VY9r9
	eUQXfs1WNZ7eogHVf/nbbIe+DNeaL2Qj7u4pQ42o98OiFWO94/bclaA6uuRMjwFAJkZautkfJqb3D
	xJR3ubqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTFB-00000001w1D-4Bhe;
	Sat, 27 Dec 2025 12:18:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTF8-00000001vy1-3XjZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:18:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso70901245e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837877; x=1767442677; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WVQ5l6OvuwNcTcqNwKXFrwDkeL8FFp17NQ/ZoKZRdE=;
        b=EP+4R81SeeJCw8rUEEvI3DA08KsHl3jC43ArvtMal+N+Kg9FBTx+x0ylfzBucTSVP6
         HHyjm/LHV8hBwXf31Ae8mlfRq0F5UptCeWDsm7Nak9mnDOU70xsj4Lsl0zUwF7hbfipA
         eZCkkYM/C0/etPKzTW51/PNYHRjZUL2Xoya1QlPMkSgk4B094nmQk2e+bXJKJdp9XpfM
         7rrmWSc4rU+qI8MUqawn0ZQC9hNuggMWxfLKw3/X10SA4WeHEQvhep3yFKTTngDDikmn
         OmbGeNSAkx8aQvpBqZz9M3FL5+Wsjk5rKIskyh6FPt+1kfosh4IAi8Iu05FlRFfs3FJD
         uK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837877; x=1767442677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8WVQ5l6OvuwNcTcqNwKXFrwDkeL8FFp17NQ/ZoKZRdE=;
        b=eM2MU6NOHCvrvybQ0ZevBWUovntFo/DoYFLiRexXTqI5r5nZJWaHtLHBONpZ16qknj
         gHtYufYaxf7iJG2v0QBmg7cPRkTJGjSjU9UZpBuneWfideHW6UQWxpAxBDlM2I7Mge4d
         SmaAbH9rWsAnkHRCXrO4FMwKnkp74IPYkwOCv2yDys8q5+gzhNPNwJ9MxK9pEEriwcV1
         b5hy+CLmEVADHg40JUlB4Vwk5c22q2Bmoai1BUyP6K3PC7CHOsdy3ti+BFx1CoEgn/0/
         m1G+ctqCHMPHwJ12hMn9aiI29VQ5OzeKYN6tjptolmrpwRHFHaxHZq88rXJKRVhstPl5
         lWHA==
X-Forwarded-Encrypted: i=1; AJvYcCWq8h5xLoc4GYbs0NrFTSqL0ZwFXYvQwQHGXW6iWer0kaKsB/NPll1W4JsBBD9xjuEdQljtK2K9LGSwNlpVq0Gz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd/4B7PrIMS3V11uQ92W0DFg4bM5fMoLJLV245NQL0SzE7bmv9
	88Fl8yQ2M/8KO9IojscssBP9is156ToqjGj0d3+23Hb8MGCTd+9mbOHhvg1Cj/apKkU=
X-Gm-Gg: AY/fxX6MGBT2EpDf3jTZ7nO2bOQrfNTm2l1xywq83FQaccrxL18LhJFuQm7ruDyzX/6
	kBvfW/Qlh+JwmoNmYoPT3L18fjVlnsKP85669ImD/A1GlbT8rre9u1xbPor6HeufPjrm+s7AiEv
	v9YAy/FYl1/lnWxZ50t1TBFAO38eus2ZqAP6yt0IcOqSbtNkW/IFcGw4fRPfEicnDA30N6uH9OR
	N4X5H55hwgob/0Jxtx1SMLsJmtEgs2Eph9adgegwYWzVloialp06DzYbJPlhWEkaAWasDmv7IC5
	J9xSIvG85pejxOoh/020T594zx1OrATu3SXMZC9RJLncvz/Df9iLtGcwHY0MLBbYjhhvdIjUVKd
	RgvFRA2exLqage4QQqoHcCDgY0urnjj/2kcy2is3fJA4n39t3sZ4rzA1aVS/U8axY4+wqG5n0wd
	UJQmhU0P3E
X-Google-Smtp-Source: AGHT+IF/XDCpzgWo6CWLRHeKJmnECzN+dRl41jhTKGOm6P2nA90X9/hReUsAzbYAQmyiLuP2DWyXTg==
X-Received: by 2002:a05:600c:3111:b0:477:b642:9dc6 with SMTP id 5b1f17b1804b1-47d195aa79cmr275082695e9.34.1766837872067;
        Sat, 27 Dec 2025 04:17:52 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:17:51 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:14 -0300
Subject: [PATCH 07/19] drivers: netconsole: Migrate to
 register_console_force helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-7-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
In-Reply-To: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
To: Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <danielt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Andreas Larsson <andreas@gaisler.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org, 
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1917;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=oiRJqd24xNJBRHp4bn2koH7CqQq/f2UmEpMOGnQzYhI=;
 b=PNCcHQvlH3xv93I4pBS5nug5ofRvIPVdGmJf0P9wllAmoEtQiq8Up0JT6yGQIvoJ3BjyCDLfA
 69PIUeecq2AAR6MO/z2xt/dsbeEPhnFU/DPDF0NwOHQtgJdH0eloVGe
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041758_925114_77AC02FF 
X-CRM114-Status: GOOD (  13.69  )
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

The register_console_force function was introduced to register consoles
even on the presence of default consoles, replacing the CON_ENABLE flag
that was forcing the same behavior.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/net/netconsole.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index bb6e03a92956..509ab629d95f 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -583,16 +583,14 @@ static ssize_t enabled_store(struct config_item *item,
 		}
 
 		if (nt->extended && !console_is_registered(&netconsole_ext)) {
-			netconsole_ext.flags |= CON_ENABLED;
-			register_console(&netconsole_ext);
+			register_console_force(&netconsole_ext);
 		}
 
 		/* User might be enabling the basic format target for the very
 		 * first time, make sure the console is registered.
 		 */
 		if (!nt->extended && !console_is_registered(&netconsole)) {
-			netconsole.flags |= CON_ENABLED;
-			register_console(&netconsole);
+			register_console_force(&netconsole);
 		}
 
 		/*
@@ -1917,13 +1915,12 @@ static void free_param_target(struct netconsole_target *nt)
 
 static struct console netconsole_ext = {
 	.name	= "netcon_ext",
-	.flags	= CON_ENABLED | CON_EXTENDED,
+	.flags	= CON_EXTENDED,
 	.write	= write_ext_msg,
 };
 
 static struct console netconsole = {
 	.name	= "netcon",
-	.flags	= CON_ENABLED,
 	.write	= write_msg,
 };
 
@@ -1971,9 +1968,9 @@ static int __init init_netconsole(void)
 		goto undonotifier;
 
 	if (console_type_needed & CONS_EXTENDED)
-		register_console(&netconsole_ext);
+		register_console_force(&netconsole_ext);
 	if (console_type_needed & CONS_BASIC)
-		register_console(&netconsole);
+		register_console_force(&netconsole);
 	pr_info("network logging started\n");
 
 	return err;

-- 
2.52.0


