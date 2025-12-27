Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032E1E8FDD8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ltdd8M4LmPmBXDEHAaMGtcqMVaDk3ISf2NYRX3F1G54=; b=tnsi1br3g4eieCht35tpsKlHN7
	2lkNLxzbHl9iQ7UwUPKBy4H7Vv1ATi+8lmSyMaDi4uoNCyn94jIfVpnqGQuakf8xQ8E4eTLANjW5r
	27BSZkYHhahW4ekW+RapU9/xDZMlLNhNJicrSp3jJ0HKSNKUpWS4oCBd4sYqcSKtDjrbQHF46Gdv0
	0e8sL4MJYMq1SmO7t4K72h2WQeYpZ086dKyypd99Ss2fMpQhwT/8MTQMzPvnx134WDAKj3NDdrUfY
	quKBSxjBXdvPmsAVP7ZZm1W690WHQadYM7obiXf+qOatyJwf08EdwG49KolpiQBBTXpsIqNg/fpUI
	3Nm2LNbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTGr-00000001xWH-0aKg;
	Sat, 27 Dec 2025 12:19:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTGh-00000001xN4-3uJ5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:19:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso49248685e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837974; x=1767442774; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ltdd8M4LmPmBXDEHAaMGtcqMVaDk3ISf2NYRX3F1G54=;
        b=HfvCOoUkw3NJD50N5SX40vxsWG1Z0Uu9YPcYVllQfcMC6ZVgMtY3586BHAxBCYLGNM
         j7zuVIG7yiW8+7JT+TmHhjk+tkrZvSzDBolln4/Lzzty9h2B6QtXfilQwHQd75TeI3ro
         UmAk+68AAGJ1R38mCu+TZlo6eh4qWj3H3qVcz7Ri2a91p7kp4jYiAQgdRggVCwPhfJhY
         xe3cb5+6Ju9ogR95B6WdlXI7/3PDrLtqRWG6TYaZ2Objv+G+Dd8mmCUjMKdoMbN/4WNX
         gaxTxPL89vJc3UaG92SXALwe2ufaV9ihO1x6UoWWQhpZhL6o1N1jsHxLEofrYcHYO0+h
         vygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837974; x=1767442774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ltdd8M4LmPmBXDEHAaMGtcqMVaDk3ISf2NYRX3F1G54=;
        b=YRBVfGziaEWcVsYbBjqVvZyzTEPoTov/rQsErbwoB86I/8om/SZ7vyIv0hrhUnhJuS
         JQQyrgNuQEUnZdgZgX8+BVY1v4RAFbB1lbHk4sjY7vuM9p07HTyw00xDC0J5Ug+KsuSO
         BPft8pfcZb0UgnokLPWfRJvFjvJiKWIlC8CwBXuqQluUvLW8L930UUL/lIwSlwF2jtow
         /O3r00TTBQ/AXCgGqsrLCELKUE6LB/KZUxZ/pIuap85dveIUl0sPTLS2N5CvuChOxwSL
         fzweuFUGThAM5y4GlE9RZn+IgU2pUfBblB8tmHYzecQVlnIDWef1HF//kyIVynDIDv/h
         pULA==
X-Forwarded-Encrypted: i=1; AJvYcCUtwgNDQCDl5LWHkUuNUkw/1i2j50j7F/uH4xJBt5TSASl3r9ZdwLT6rliKwqV/Yb2+AUNuSqrnFb1OJMAW9adm@lists.infradead.org
X-Gm-Message-State: AOJu0YyHklO2nR3tiFZk1x5S7E6IBLY9k1oYhb9HCGmIB5FUEAV5rLK9
	NQi6EdLJZzNpH499AwrdwLbfjlxUET1dmkL+4+LOLx6ikHCykdLt06m0dMr5eIq8IMA=
X-Gm-Gg: AY/fxX4l3oqRWy6WvXkyrl9UZZf+excU5tYmKK97SyyCyNz+q3ScK+lNzhFLvcp30rm
	G9DpOxsAKddimSX/7OyBMM6os7dyqxY9mWBU8vZUTfQWU8ECIW5lULY5GbmoO2AiQsRIj6/fcZy
	Q1a5OI4QqMxsXtGEAnuVraoZBlX+WV7neZ4GcQnPvfBWupeRC9D8O/eoNZUhhCZulZ+V0s5Dx2K
	KmrdNuGYHH94Pl6nRtiBLnKqoTs6hoR1YlS+l0hkmNW0OjqY127UYEBNpwQsOHxb5LAVpw5ZbLw
	5C9LMqtHHnblRg46eWxCwJvvrAm12vbySrtpl2j7AjPV+R3HfbdcmQZqlfaO0/y7y1sIZNYdMba
	sucGLb3bBFZ/Udj5RoaXzn9UZ5BCi4/X3MgpmsTBCwz68w9cS9py98l3+hLEioBwJ9RRasRoWoR
	8W+ifpgst5
X-Google-Smtp-Source: AGHT+IHMLS3VfYivW6iZyjAkGRbHMebp8EGQujmDyd6LpCoRzo/q2pR4OLsY4m1yHd+Dy1qj+iz1Lw==
X-Received: by 2002:a05:600c:5288:b0:47a:75b6:32c with SMTP id 5b1f17b1804b1-47d19532f91mr239061855e9.2.1766837974046;
        Sat, 27 Dec 2025 04:19:34 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:19:33 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:25 -0300
Subject: [PATCH 18/19] drivers: braille: console: Drop CON_ENABLED console
 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-18-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=917;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=M+RAaPiD4L8bkGcekgUNUpTeF+sJQV6vQniznC8VslM=;
 b=VNcSKbW4wn0ZJDPmlW3fCDrj2qqqMiKzMUpnoUVSmYqwNJRukKGa+p9lja5itToGTVwI9LN+2
 mQPFka3TIBIDqDnH2JmGqErVL6l4YMmEx/hbdpLg4Ll2XIa+vBtsfSS
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041936_089140_6537FD78 
X-CRM114-Status: GOOD (  10.10  )
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

The braille console doesn't take the same path on register_console
that other console drivers. At this point, it only registers the console
and do not receive any printk message, so we can drop the CON_ENABLED.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/accessibility/braille/braille_console.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/accessibility/braille/braille_console.c
index 06b43b678d6e..0b7ec68b305c 100644
--- a/drivers/accessibility/braille/braille_console.c
+++ b/drivers/accessibility/braille/braille_console.c
@@ -360,7 +360,6 @@ int braille_register_console(struct console *console, int index,
 		if (ret != 0)
 			return ret;
 	}
-	console->flags |= CON_ENABLED;
 	console->index = index;
 	braille_co = console;
 	register_keyboard_notifier(&keyboard_notifier_block);

-- 
2.52.0


