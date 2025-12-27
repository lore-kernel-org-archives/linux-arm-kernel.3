Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D6CE9270E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9kNg59vMLuZUSj8msr6djkrRczOEtEux+Dq5BMshWM=; b=TUeMPKDlYhnmWjFS+gIL342SAd
	6h8QFJQ4xxwYgeed3rp1Q4lWzeyny7HvdrpjzXsDYCeXeSg8FN/R9izlau7fIK6iU5eyBgN/GbO+Y
	5kX2sSDHjv98bHjGQWcPOV83+zmNu2SJ9Exb9RBgVED3BH0t8ZmgUJyyhg10A10/TuCyQ+M0WTfek
	Nv5vC/FbwymEZ1aC4qsQQCETsZ75D/2vvtRjjBSIpzzoiK4G0SmHa4XTRNv7Jxz6Ko7a38Buc1ran
	jkSkTQHMT8hzM5eYIylqT3T6yk5Uy6sC+NjatZqxMpOvoWxaqSrtB3AWZ7sDSWSBojHg7N8ShMjzA
	JgTws7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTFi-00000001wQK-1wO3;
	Sat, 27 Dec 2025 12:18:34 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTFf-00000001wNY-17U8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:18:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47d493a9b96so5712075e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837909; x=1767442709; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9kNg59vMLuZUSj8msr6djkrRczOEtEux+Dq5BMshWM=;
        b=gVLRTswJSEQ0AZZqkazOY96t+0A2Sw9X9z/f9VCkhucHcaSORgDAnzMxMqg6ubHYOW
         p3RfmLhpdirEj1FIoRroyug52wGArhgPqxae7pKjnvKN1dKXqMHjQU1QAXU83KyZhuaM
         GhNlb15aaIDbzv8gzUCmWyiWPRBlGtytdK1LE2cGAAWsVrQmK5A7PqsdiF9Pj5fkG4dp
         Sqw0pl6RyzoB8gTKwMSVhCdOxI5TrCa9odTVeIFhJegbKGpGz1nCSJLCMfXXEYuKgxnZ
         0NKxtDaM9Bj8SD5OnS1tf/yH+71HlN/O1kv7Ar37OLlshBs99UZdezGPCHNv+o7KFPp/
         KoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837909; x=1767442709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z9kNg59vMLuZUSj8msr6djkrRczOEtEux+Dq5BMshWM=;
        b=a+W9f5wDp0blM1eLZ0seTaYyfdS6ag77k4ekjwNS+AIyTIP7M5tpAivA5sZym0Gq3A
         bbXL7FKEUCbDnx0BK9u/MxGPlzutYuiJHJs/YUSomJqebrp+c8eRSiDj4sPb9iH01Ouf
         Jc5CAwH5+M9QlwuS0ZOd46IE5fW2pLZO01NZgPPE+Y3cq/7DfwytKtUwx3gq8Td0u7DA
         tpSHTComneHH9NlIq+KvGj8BKBFuzjw7MDMuWj/YN9Xoo5FDYbW+S2yEn1bbdUUf2M5z
         qbyO5w4IbDyHSRC6RxoPkfomWMhoExOODgkx5RC/dmOIOt6Z4kv/G7HZNxAWDjM/D+SM
         gybA==
X-Forwarded-Encrypted: i=1; AJvYcCVcKfLAXVC9O7FXlPFDdiegvLLfZVVRIeQ1m2BdUnrHRHy6IqKkqZjT+PA1qkoOhCyPpS8DlbUMK5K+hTWPkxYr@lists.infradead.org
X-Gm-Message-State: AOJu0YzhmfWGPjdSU6/hZ8+YhaOpeULEiIMxPCZp8LSXOkc5ZvKh6MQ/
	KxW2YjmythBpl1VYzBaVDjVp61xcVMKmx7xsNft3ZiGZ2LYl7LB0nrvg1IDXIspGrcg=
X-Gm-Gg: AY/fxX4lggm2BSeYdZKozAb9swN9mbzt2V4ZCr+6NlsT262Q8UPEItEO2mmmmMoior2
	Ogif+H4JyB4gLPl/INPfE+cCkLvkvuwR4DrmADLhEEJGTYgvmmGhJ1ix1DccVA+t0YgJeB8dPFN
	+wOgNSeXrL6stnTz5jMFtw6/AYJDu4wxV4Ly/WsUlD5x6LfQsW7yPXUTx0Wz8hmcQhYx9ea81vX
	j2cyFtxyO8gh7kXN7uCHYKC1/mGmwE1aHavsJHm7jPgtaS3pOVxnRiyYbXq54YpdJTq7okqRMDv
	FgI/r7gHbOog7RvB5aitwAsMPfNoKSJdEgJmzaEB9glW/gPqxVj1KlyE/DvzafNNBw2B3qPMrBf
	sBtjOxGqSXvougftpqsrOBoVujxj36psnPDi/LRo7kD8IZr3XeWiLl9DxzCrT2J6Tp3MlkVOx7y
	wK9aiyrEyH/fhX91uscwY=
X-Google-Smtp-Source: AGHT+IHrtEPOGW5HpG0S0h+CrpgwJd8+zbJNmNN/crxl7Vk2Gjo34WfIR0WT0TkmrlMgn1CALEr/CA==
X-Received: by 2002:a05:600c:4f4c:b0:47a:7aa0:175a with SMTP id 5b1f17b1804b1-47d1958591bmr299387905e9.26.1766837909421;
        Sat, 27 Dec 2025 04:18:29 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:28 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:18 -0300
Subject: [PATCH 11/19] powerpc: kernel: udbg: Migrate to
 register_console_force helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-11-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1180;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=EzMaKsRNP/XrImaDzG6owj2ch5Rre3nG7qKvJVZXc3k=;
 b=4hRgVgEFeE8Kfjdb4F4yho+pOLOr4/h5Rv8YKsyU7Hs44mjvTHW9sE+Wu4jBIqif6kS1nJWUa
 QXrCwGXn4DFCsUQcLd3WwFDkthhp5OOtTZ3i5F2rVUBtIHQVlS2lOkg
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041831_373350_8B80B5C0 
X-CRM114-Status: GOOD (  13.37  )
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
 arch/powerpc/kernel/udbg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
index 862b22b2b616..0f88b7697755 100644
--- a/arch/powerpc/kernel/udbg.c
+++ b/arch/powerpc/kernel/udbg.c
@@ -142,7 +142,7 @@ static void udbg_console_write(struct console *con, const char *s,
 static struct console udbg_console = {
 	.name	= "udbg",
 	.write	= udbg_console_write,
-	.flags	= CON_PRINTBUFFER | CON_ENABLED | CON_BOOT | CON_ANYTIME,
+	.flags	= CON_PRINTBUFFER | CON_BOOT | CON_ANYTIME,
 	.index	= 0,
 };
 
@@ -163,7 +163,7 @@ void __init register_early_udbg_console(void)
 		udbg_console.flags &= ~CON_BOOT;
 	}
 	early_console = &udbg_console;
-	register_console(&udbg_console);
+	register_console_force(&udbg_console);
 }
 
 #if 0   /* if you want to use this as a regular output console */

-- 
2.52.0


