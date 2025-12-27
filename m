Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C93E9270E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBuTaAePekdaKhl7Nr4xkMCH+YbgmQZc5bDJsdsSluc=; b=kRthmvTxJCMp5b4WiDhOdOvNap
	ZpRjrjOxkhCLcLMwY2PvyiVrUTM2cKTZd+apgUhaTnW+/O/rMmdmuGGW6+dIitXCN1kaCuf/l8lXP
	67yPxG9z4x8BtzCFB1MRmKX25qu5hsFLbtIRFAe9CMrODnnbpc6XgbJXzvDwxXbttmBD7SONVPdr0
	Yyf0U8smtsUi9BR80ANtmkMCVN6zs6m1K0yvr2n/sa0mfBP1aV9IgpJy8A09h41BArGiyQn1Ifkd5
	dEFgKJX9X+8XCTsTr8S4ZGPDXsfgnxLvp6uqnH3c5yLHGA7NipOlvhXlnJELoaRGozBgdxQDmrD1q
	U1BKz+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTFs-00000001wYu-38cb;
	Sat, 27 Dec 2025 12:18:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTFo-00000001wUw-2aZR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:18:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47774d3536dso61937365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837919; x=1767442719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBuTaAePekdaKhl7Nr4xkMCH+YbgmQZc5bDJsdsSluc=;
        b=IJ1Tlrh5AJdr6dkcc4kcuYbxn5yVBWQWUrTMTk+RvEoHyeZtX3j1a46LdxF22nI79Q
         QJntt27q7NIwsSbr12aGIzZ4XC/u01lDviemkDUvLfzlrxy9SugbqfvNXRMRBdDHino1
         lWbRQwBtxDtxxdCBfqZJemBxhKxjGmbs7ImvHipGRiXnPCXu1DsIIlCGKui1mHvUmQF+
         boRMqjxFyjjmBEmKs/DUD/CCyQG7A2Q38XYMkyRLiZk0Ik0CQZM4WZfbj9mtqUyrmyrG
         UhRT+Svj/Bc95NQUV9NsvHUNKoV/cpCrXNzwH/yY5mi4od1fVazFNBNAJv0cO2Ss7pIy
         oM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837919; x=1767442719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zBuTaAePekdaKhl7Nr4xkMCH+YbgmQZc5bDJsdsSluc=;
        b=tkV4ocz5vHAtY30lQhOvf8JxilGuu4Hjil+kLFC3Q839o8oY9TAADq+967CdFkFMqW
         AloAOG1niB0+QWr2JhJbv7wirwBB/Xsqm8mt7iuJQ8HXLVMf4+AOIAlU9cRJFzvYleEb
         pJ52+CyALupY9Iwbzwtj1p14ca5nCHQsjlzOCTUkjcmw15Ia6ncw7It+J6byNCit4Fm5
         9lzGT1ZoRKaYxNazFvvU0cCURC8sxT2TD9DnuLsSI98/+JXh+eLnrSpPRyBUqKlHKRrX
         F2874xry9ZX7pNuE1kkZ3z2Ex8NApw4YF0RL+g4iT1foAw3ZT7TMaQPuDFS2ahaZsRP3
         mgOA==
X-Forwarded-Encrypted: i=1; AJvYcCVJfSmD9KxMtUOE4b67bR2hX/gWxOWeTjy7FESPgrdeOjB5TcewbjiJQqm+ODS+FAIu3aB7W2rRKJHFzUHN6VQQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyKhYWCKSaCd1GCnXeYTMdhZPcCzfRxvTjNvOV1HkL1lMY9tn5M
	mafkbogF8+v1qQevet+IA29Pa1K4VPfMOGWLMoAGqVA+Ah7NNVNiipeUckg2iR5FAWY=
X-Gm-Gg: AY/fxX4AnyiAbH5w6e0+7NzsN4atEJgXtDnrPoNY89IgkIzKPV55zN9gXNaN3AoMdsK
	8S1/x7aVFYdu3DBiNTLSGx5JtWCtWeg/RHkF61kV8ivf7dTPkANcWFuDxiEebOndPKGs0wOjBCQ
	a9Kd29SJi02uIhi1AMjcq3e6hU4Mt3fFrMGrSB6+mIWxD7jO1kA5t6TWl2O/20Mjv+QNX/E4XS9
	qO38lj+6JEaaHh5dHu/AP8zP2lqamZfhW6PhiEAQoRX9yGfo1ezjiiQfSk+c44C4X3T5p5FEBp5
	/eb1XBtsKk+huruB/fufd56RnA5NF2p12KOieNsUCaPgZDgBBaat1xmA2CkYAWPupsV5vdOIFR/
	hITlkPMUxuFFZk2zn+myrendQvb0Pk+hVbHAuPX2bR7/CSXLPUlC9TTCIgjLxUfGnreE3uEGgtW
	AiQM1Pr5EU
X-Google-Smtp-Source: AGHT+IEaiNWrbXUQR9Xr4SWeWCswjY7G2xsTNDPKS34qx+Z9cd/RVKqDItuoVsaN7WK8NMfB3mQH/w==
X-Received: by 2002:a05:600c:3799:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-47be29e87c1mr231953365e9.11.1766837918587;
        Sat, 27 Dec 2025 04:18:38 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:38 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:19 -0300
Subject: [PATCH 12/19] sparc: kernel: btext: Migrate to
 register_console_force helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-12-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1119;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=rI7fN9M4UYBhm41SNkDmrXmROIuX+aCv9rIYYOtlo+M=;
 b=bcNrmzf90N/BodrKZ64tr7qsRPh416urxDwc2BxCBqWgNmTslPpP/9rT1ZURe+mv3PmWaFnbq
 xnM5PWTrVU8APb7FwkkZf2fGZ3Hw2PsJVWl1KwMiIyJjzl33goH6hX9
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041840_665878_0583DDBE 
X-CRM114-Status: GOOD (  12.73  )
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
 arch/sparc/kernel/btext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/kernel/btext.c b/arch/sparc/kernel/btext.c
index 2bf558a0c568..951de7733632 100644
--- a/arch/sparc/kernel/btext.c
+++ b/arch/sparc/kernel/btext.c
@@ -301,7 +301,7 @@ static void btext_console_write(struct console *con, const char *s,
 static struct console btext_console = {
 	.name	= "btext",
 	.write	= btext_console_write,
-	.flags	= CON_PRINTBUFFER | CON_ENABLED | CON_BOOT | CON_ANYTIME,
+	.flags	= CON_PRINTBUFFER | CON_BOOT | CON_ANYTIME,
 	.index	= 0,
 };
 
@@ -320,7 +320,7 @@ int __init btext_find_display(void)
 	ret = btext_initialize(node);
 	if (!ret) {
 		btext_clearscreen();
-		register_console(&btext_console);
+		register_console_force(&btext_console);
 	}
 	return ret;
 }

-- 
2.52.0


