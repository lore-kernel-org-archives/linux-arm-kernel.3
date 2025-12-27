Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9972CE9270E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejU77izjbpiitWXY1CFRfcJAx1qt+ylV9tDV0w1mOdk=; b=fWTDrCaIs7UPIKbVCkieAzvKID
	BrBlrHji3CiXOzB7Lws2pBKIeiW/pPd4yA2pqJyboPsnsQTM9FktO+Mo46Jp1My2sSAnmDF8RJzrI
	UHuDPmQBM0WgA/HqYz2otQmN7olTwumZm6BVBfmryfv9sLOdC2zPDhdg4b4RIKuAjbhGR4HR6+f97
	6wBUZsYEg/ZhMV/a5b2R6pmLXS5CElwdse7QTBvPUtX47q1ISz/HnBzP4qlrXihPWXpjW/ntP2trW
	dh2K9hoeaZXHZFBWgX3xEzaFlWQjTpFxWAsQ7HVazNvGWtkEyjRM0M+dXSnujtYq4+4NlEYWq6b+v
	cKeLha6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTGU-00000001xAb-401L;
	Sat, 27 Dec 2025 12:19:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTGP-00000001x4z-1nJm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:19:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso49503115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837956; x=1767442756; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejU77izjbpiitWXY1CFRfcJAx1qt+ylV9tDV0w1mOdk=;
        b=dpwnyajkaw6l9D/oXfSIPA3A6vGba7kPkQBao307cPC0JBGDzKe4q2SE7bvela1Yl2
         4FuRoXMIeYZZPv4d87ds594AmH7se1LC7Y+Lb5FkVFFLT50p96q3cpyrNQOU0UCMEE1W
         ah7inerA/2zWnM7P7y8SRXzi9fwBYHH9Gn731nSp6vzXCYjskkdyCF/Q0nW+aNR6Xu4c
         azNaWp26qFYDw8TH8ytx2NFz+MPx3Y46KzTHlNcto57x7zRoM6EqHyDFcevfk/lAwhCJ
         HlfdCVIcnzzR787mrSUXC+kk3cxoz5nMDa3x526a71NSGMpgMDbAJnwlIu6gWbqGl0cs
         Y87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837956; x=1767442756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ejU77izjbpiitWXY1CFRfcJAx1qt+ylV9tDV0w1mOdk=;
        b=RDFknUL7XoL+0lI1SU+TVGQ7AoofLrnrNibQBRe98kc27Z+OCeGSt/W1IZYMKxcOMb
         cBSUE8udsbxLpr1ftAAmXCUTlW/ogZyndld9JBQCP8MaW7iFndPgeKCTxMQ+y5ODWaZM
         PsfoQ5+SC0tOcjYEOQnEaZdYolXz5AB3MNqMEvL+z4Fyof9u1LkJe+bvUpmaoNqs7KCY
         oH1qdKB6YJs+nUNvH+xCDwaSSYySFB9cIzwMvM/Sxnllm9Y7XHuCz/dNXGSSDsn+V5Ar
         e3YgBT5s5ChFyie9EHTN0BTbBybh7duEicPgTd6tI1VZXEhqLoW6g1tCmY1U4VS25Md9
         plqw==
X-Forwarded-Encrypted: i=1; AJvYcCVKuSz4g7zAxrW1jg6BVoX0N4IuPqezt9d1kT4ey07caRIxmq5rVGZURzVU73RTt1hJwwrxgsUZjU27Aw3C8N8I@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn3bdaVdI4QXT8pYZqwEib4WgcZeDHVuSmkVdWpOf9lNAddiEe
	q2rR7FW6YALdYjpTevmNv7HVbuPpFBoL8K211aXWA72HG9vCn3GqtoWf8PBUrezWfo8=
X-Gm-Gg: AY/fxX7X3adshNgoRLmkTAeG6/RiAJjye1g8kjOr4YqwsK0g+EGbuzrdYBX5sILlSr+
	LvgtDR75ARJdF//pr0f9mqqOaiwM/Se0dL9fEg7vqxNiQ3l5QSU2e9x9O3cf1iZmDcO/FhPam+J
	wmXF9Ak2rTczQeDV2qglPRPXkk7ChH36pEOURPGjxEs2x3ztuQIllATnhcJtl8AWLQXIyJlq+4J
	ouaHVMZ8GOnNdhfACNfeGo4TMvLpxvjuA0YhTNl33E8q+jtYsPCC9FPuYoSwlclwUZOjBeorsZs
	vVLwj9he4fFc6TCaBGFHg159jm6SgGdE61KahKuobBvITGqLsUqtUgrxV16eMYYSZPGJ7oBMJW7
	EJMeecIiVv2p6WavgtohymjIsbpvRb/C5JRmFKxrQpta/SgSWGKelifYBXnaPR37PMkWqUlQ03O
	HVAe9o3ctu
X-Google-Smtp-Source: AGHT+IGcVRETU5SGb8qIhgBdGnot/sm969/AEg3tWF/SLDrOBPXwM9NZtaV8oGtTOpkC0w9sxSvHbQ==
X-Received: by 2002:a05:600c:3148:b0:479:3a86:dc1e with SMTP id 5b1f17b1804b1-47d1958e459mr275597435e9.36.1766837955551;
        Sat, 27 Dec 2025 04:19:15 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:19:15 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:23 -0300
Subject: [PATCH 16/19] drivers: tty: serial: ma35d1_serial: Migrate to
 register_console_force helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-16-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1239;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=jiVyzdGaYwwOjViBefbG/4tnbA+IZ6VTt4S6NyPkSWY=;
 b=Y3ytKQigesyzk6xu3oPXbBS5mHTUJ1mX1rT6WRhai16pDTDKrILE6MzhKcIyuYvYQYYU9QQLY
 +jUI84bHhmDDBPQbqZ6BL7ROSTnYW/5U7XoL9eZmy1wASQ14fgiWD4j
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041917_515494_2370B67E 
X-CRM114-Status: GOOD (  12.54  )
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

No functional changes.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 drivers/tty/serial/ma35d1_serial.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 285b0fe41a86..d1e03dee5579 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -633,7 +633,7 @@ static struct console ma35d1serial_console = {
 	.write   = ma35d1serial_console_write,
 	.device  = uart_console_device,
 	.setup   = ma35d1serial_console_setup,
-	.flags   = CON_PRINTBUFFER | CON_ENABLED,
+	.flags   = CON_PRINTBUFFER,
 	.index   = -1,
 	.data    = &ma35d1serial_reg,
 };
@@ -657,7 +657,7 @@ static void ma35d1serial_console_init_port(void)
 static int __init ma35d1serial_console_init(void)
 {
 	ma35d1serial_console_init_port();
-	register_console(&ma35d1serial_console);
+	register_console_force(&ma35d1serial_console);
 	return 0;
 }
 console_initcall(ma35d1serial_console_init);

-- 
2.52.0


