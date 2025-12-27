Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3C3E9270E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OB3+8VIsiv4yLcVB9h3kEd58M2RQJv95rPNYEtVMoiQ=; b=SV8Dnq2f3mTiWpYOR56SRDaxbc
	akT3vJP6SrbjwAWY+mUveOqx0vroa/BkEeHHT4B1DHyBN5XZS3OoTXdNuhzBkfsabevTMHBINLGjL
	S8fp8SfhVWTD/XH1tAZgShE3xngcHoU2jQ728j//zDzN1QV8+eFwzGyjbLvGBTDasbz3vwxLHjFjI
	0GIi+wamdflwvqojptcNOfvir4ds6mzCTDQPZXgASmrXS1+buua1JwD2jf3qeROL8p7Ms56bcmEmg
	A3E6RVZcV1qdzso8uJZFKbyxY8zXt3bFLMBOjsv9AkDpo5Z5uuai8lGZFkQWIcQYXXjp7bKo0bByW
	w8P8MayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTFP-00000001wBR-0xfD;
	Sat, 27 Dec 2025 12:18:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTFM-00000001w8R-34GR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:18:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47774d3536dso61935735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837891; x=1767442691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OB3+8VIsiv4yLcVB9h3kEd58M2RQJv95rPNYEtVMoiQ=;
        b=JYUIaHeN3+2enAoVIrPzMIDUI2EHShJqex4nD1ETsa/FUhiSPSc5hviSTy+S4KofLZ
         9BSQTaHYr0UnxQMralZA8bbimmn24bs15i86S3ddN0Hqs/rHkidQ/h5Mr3Tilhhw/CRi
         CDnj7QzJ71IDhwwQ/hvFyJC6KJG9LijuMxJk1wEE/KSJAYKK4RxBlExjKqD8GFIg5zik
         3NlK5aGltk2Sr2VGl+rGF5XwhBHOYFne5V+jy6f5eJbOAyFZCMSGhy4djgSj7bUInehO
         fWrQrmDKTf1MMBThRgYWUI7v93ql/wWLZVsDCe3WVIMxER1g5/UdQx+e9SE+5fkwcqDG
         gUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837891; x=1767442691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OB3+8VIsiv4yLcVB9h3kEd58M2RQJv95rPNYEtVMoiQ=;
        b=IUAns5wyvJghakTDZAtLETakhc9XAEuHNz2WZBeLGwUW372vUBPrJdj3p2HjmlX9vZ
         W49eJ9ltQpkxTLHkPf9dnytwRPZr2+u3p8Yp51VZk5M0Da69h/PtyWLPHn+LLf9DmtEE
         XRDEZf5+1PYvWKgq9Tl6GU1qIUomoGGdROId4mapRHJV0TnNvLEb0I0x0j1jIx4orone
         W46Vq2y3uGhwxvsp9XwS+P9yz4zRsN8ekdGZpmdWJn70cdVHys2XYmFfJ1bmXPe00vt0
         IL0zXh1h9ohjEcc2LMpZjbAmTdgxXbd7PPYQepfF5pYBPSFdV0dW09eWeWGX6sK4FhkR
         njXA==
X-Forwarded-Encrypted: i=1; AJvYcCUELunN120w1AxusiZo1jxXUvpJhCaEqAISbimAoMfzOmeZPfEeg4AR+FgUYdaQ3eJV+soh/1PZIT+iR56QUhKZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwNU05tgNPtgYPyc2YIYP3u2MdimzsfMCQV1dUPPsdp3znylzTP
	aAfe4ULGoI6EolL6rlfatMJIGRpAbWWSSPgpBVWlZ/SQh7PwOEjxMx00/yPqwslwU1s=
X-Gm-Gg: AY/fxX5Xo0nBrLyMIKuOOIOt8fjAiD2qIIPBwqUlwLrHLzTyyV5nYbidrgIbc4aLpck
	PPk0dAP+XnsJacQ6G9HkAPtk1jzRnckqKLW+9Fn2fX153iqm+qCVxsoQEMeG+h6j9qyfgZ4d/wD
	yGzuFIUwq8Vwq2iTmsZu0ws5Ep2Kjlax3fgpS/rRGuVKTTw1FWzfJlDj0Vl13Ku1SfO9JoxCOvo
	lqmtJk3JLgj+2E7Wrk91IprqymZ0Euz5ZIxGXi2BIPSwOHNFy37JIKr208lcCv6p6SRfv0DHg/X
	MA2TN3TeORhbAoccPPwzHPlMIlaV/Oe1MshOszADn+8h9VFUbWDsoSiV42Oo5SOUaIKotXaWZf+
	UmtQu5Wz/ENCokwQu/ELIGuoePShxRKg1ZIIcA5JwJtpFnM96mJJy18PFpDCHWn+jGA9Z6tCqQ0
	rxdGNPCmFA
X-Google-Smtp-Source: AGHT+IFJeR5Bq3e314KIMXwkrZhqd3SM0Gtgef2ZKhyuTvMEsyAQgTg0idlkENoTE/A1RwLAaI6A4g==
X-Received: by 2002:a05:600c:a30f:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-47d52efc7bdmr6320155e9.1.1766837890917;
        Sat, 27 Dec 2025 04:18:10 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:10 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:16 -0300
Subject: [PATCH 09/19] m68k: emu: nfcon.c: Migrate to
 register_console_force helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-9-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=997;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=aTPPRUdelJJPNRSRbq/P3Dh/ezSRl1NcFqsysqipRcI=;
 b=bFiYD37gtcultSa+DtuWsZDZsqldtTEWNQGlnO3f8qpUTnHo9LyYg6/jnVTrFnBYz5Wno6rCP
 MIg9mT6KNXdApenqW2Pg83sbMRC0cE454dAXf3m0peqNYruoithEiNk
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041812_810769_F6A128E4 
X-CRM114-Status: GOOD (  12.50  )
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
 arch/m68k/emu/nfcon.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/emu/nfcon.c b/arch/m68k/emu/nfcon.c
index d41260672e24..3504bbb4aedc 100644
--- a/arch/m68k/emu/nfcon.c
+++ b/arch/m68k/emu/nfcon.c
@@ -110,10 +110,9 @@ static int __init nf_debug_setup(char *arg)
 		/*
 		 * The console will be enabled when debug=nfcon is specified
 		 * as a kernel parameter. Since this is a non-standard way
-		 * of enabling consoles, it must be explicitly enabled.
+		 * of enabling consoles, it must be explicitly forced.
 		 */
-		nf_console.flags |= CON_ENABLED;
-		register_console(&nf_console);
+		register_console_force(&nf_console);
 	}
 
 	return 0;

-- 
2.52.0


