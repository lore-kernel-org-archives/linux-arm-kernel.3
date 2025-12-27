Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810E1E9270E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUj1yTYG2OsJA5NR0t10qcegAjlFezEaj2Q6zpglNnU=; b=EV/gO9zTTC0jCGKLMq9Eoa77n0
	/PcnaF3R4xqMWCiArVSftVq0n6F1qLX52rBpeX38W7Df5sFMz+onj75Eu2ZNKOFYgB64nHC4AXLwR
	I8WuGAcdeabwSfkOKlkP0epDo2sIKAMC9bRu2EWntSylx7lYVJsX68LA26xsy2reIJ8xDe4a27ITZ
	ovr0PWVKhRCW0zdPyyI1R8HTj+KUgQeP2aoGulAlN8APZAWE17qEahhpeXEqcxrGtWA6ne/zeqz58
	7wZ5BhAVhOwKMj6xstIsnuJ62puRMlv0wES+le98m59nynkCzKRCKNAQo65KkRK0iP2MJy4q8fY9g
	RhBUt3vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTFY-00000001wIq-3Zvb;
	Sat, 27 Dec 2025 12:18:24 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTFW-00000001wFa-09ln
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:18:24 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-477563e28a3so48214285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837900; x=1767442700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUj1yTYG2OsJA5NR0t10qcegAjlFezEaj2Q6zpglNnU=;
        b=HhydajcNOQ0pLUGIwIk40N0nQjI7dIxRUpI+z5P1JunZRlDUPi7URA0lqyI5hkeI0f
         FuolxDWIT7DH/mJ58gXDYxJw9Ve0smsHt5qMnA4/vhKYUnWSO3Zk6GHHT6WX2ebPxCUh
         SMla85ImZyyFNXnVzWrCC5wyySXkzySvcKC2XJCZscMdlVr1OByT8PxA6WI+Ftd5b52u
         WLDArRQLT40fX+uu2SriNkKGKlo6YWYsvoJkdtJi36W7GRiUj9Y2Wo3PRffloMKL0ORS
         fx4GliKVOm5k1B/04WBn/B2dpP0HkTCRwYCPcFc2V19qiTrM+V7LNOc78g7Lk0aCbUAE
         Ytyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837900; x=1767442700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oUj1yTYG2OsJA5NR0t10qcegAjlFezEaj2Q6zpglNnU=;
        b=TMA5mvadGKGaRoXByaIxA44TF9J2Fcuu22Kch27HXk3MyHzafwVe08niA0rjAMSx3e
         TPShPlSWcQ1sUma5XpPBsM4qBxMergaJSVGny6I3eN4C5JlPidghENGZX4uDhzjytBxg
         QSmVS1ftlelKOfH+kQIaBbImh+0PrkbHoQV8wXVPqlAFWcbF6OXYFfNEVNHGk/ySjgrT
         RYoLbaiJXeeu2/Z1RMzu5FUgbMRqRhFhGQz6cweRN/8Mhq4aHYe26FY/A9OuEMmkk8wR
         gCOeNCC+F4IWHCbx1e2MZ3QVjI2oM3XOEDj58+q3vQaD+m9ueodH+J9PEab2D/ctA7QO
         tuhw==
X-Forwarded-Encrypted: i=1; AJvYcCUXHhGf8kQ1dLfP/hChmfXHCcO4e46y3rc1Ugdhe0TU61OXab/Po1mbWNtgVoU54eUbgRAK53CU388XM08N29uq@lists.infradead.org
X-Gm-Message-State: AOJu0YyeGVgNPmZD3pJomX/JXDbKeU0OZ9N2hzhhHq106HfwkPvrzrRU
	CdLTO8lHGHA4tCc2zEB/ccWSXjUZcbbgFTiw9DuD4byTPVhEke+V6dnBnLEDp3xg41c=
X-Gm-Gg: AY/fxX5l1pX7yMpnT4De37LHlONo6JP7pNgIobQWu2S4d0yJ7ZJ8zzZKY1lYSm6HF+j
	3c15h7Rn1dkyJFZ/5ApfoeowYZUVJ5yx7xZT1B5F7y2NNmcbRQ8Q8hZrYKlflUkywu3QqfnyvV2
	FvnowHFxH4BFnNFSwEvQ/9UD+yAKrg3K1c+NojCIVQTOoLV5UZFwK8IgaKRR8k+aXBCGpZWwimv
	AZvMedtnKykO5S+dsCUBM8aKem/OH5f5NZCqcblUwnyOfkk0oxy+A78HL6CUZCR/ULj4a+kWX/T
	lclsZtZpwTTVCpkTLV9EEbra9faykn/iy0QkHiADRzloeYW7cgNijktLoONq4iWvmVVAPMiOmPt
	mzkN7PJ/8qo1n2mN3XuuCVlFgQCEiGEXUeenEFnaQZZReXStxvHGQ91MpPmWdOrSDCrOz4ZD5Kx
	pbMX9Wkszq
X-Google-Smtp-Source: AGHT+IFXI+q7UVcETj2xrgWEDOplaD2DQfL+z5FfnKK5mI2lAjBc9EF1caRTkYKVAlNOUIoqedA3Qg==
X-Received: by 2002:a05:600c:4d98:b0:475:d7fd:5c59 with SMTP id 5b1f17b1804b1-47be29f362amr221645875e9.16.1766837900191;
        Sat, 27 Dec 2025 04:18:20 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:19 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:17 -0300
Subject: [PATCH 10/19] fs: pstore: platform: Migrate to
 register_console_force helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-10-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=1079;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=3dvgtN1V/Te+qiB9DfrS6Ouyxfyny3L7qK8ewpooDVE=;
 b=vEVEr1V/PLyTXU5DKxPct4kmpsEX80YaTpb8m+k5Ll/RykRPcPf3SC/5piYXBTRWgZnh2jkWP
 FQP0jQiJpLBB9Qo/wJGJV1aoieFgYcnUso9xzkOCnscVwaYm3IY9A0b
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041822_145649_BEB32BEC 
X-CRM114-Status: GOOD (  11.33  )
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
 fs/pstore/platform.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index f8b9c9c73997..9d42c0f2de9e 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -418,10 +418,10 @@ static void pstore_register_console(void)
 		sizeof(pstore_console.name));
 	/*
 	 * Always initialize flags here since prior unregister_console()
-	 * calls may have changed settings (specifically CON_ENABLED).
+	 * calls may have changed settings.
 	 */
-	pstore_console.flags = CON_PRINTBUFFER | CON_ENABLED | CON_ANYTIME;
-	register_console(&pstore_console);
+	pstore_console.flags = CON_PRINTBUFFER | CON_ANYTIME;
+	register_console_force(&pstore_console);
 }
 
 static void pstore_unregister_console(void)

-- 
2.52.0


