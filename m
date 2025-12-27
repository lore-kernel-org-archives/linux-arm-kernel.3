Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEA6E92710
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jl/uMa7F0AxGo9UgKbw3ayYmv5/eAGkPJCpV4UBsG/A=; b=daeYIx2MpT7a2ZgL5Lg0WAG8ff
	8yqvWUyG7BdqyGEKfiXajveKE8R23Nq/PrfUf1MziU4qmRf3vfxZ2LBtQOfK/VPcbcY7FeBkCkCqT
	7zP9MaI4tBGM5aRNx71z6xSalPs+7Iv39oIQ1E3aLGpuQl2uh3/FW4C/Dkl6TXCMbVu8uQrWzEUQR
	1TIjZVPdOmK6DMExKVwrThkEOhlyQYGyUZseUtT5EE2gUVosB6jzXkMYOXT/Cs1nxkbKOzEMN+7Pp
	givqpV3OT/xadXYok9jE+cHo1uOJrQvI0AfZr9XTZrdGhN7KoBeUPtp/qlHmOAuAE7AfUUWgLgWSf
	VBUKGKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTG9-00000001wmx-3wO5;
	Sat, 27 Dec 2025 12:19:01 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTG6-00000001wjV-40DX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:19:00 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so9274775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837937; x=1767442737; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jl/uMa7F0AxGo9UgKbw3ayYmv5/eAGkPJCpV4UBsG/A=;
        b=aBbgGyDQ0AzlmHNuzWPqcDHRNvMRP0a8rYXU3gPOQa+kiC88faRolT+1pBOmq8nWUL
         P2vQfJsMdPuGAcuboeqLy4VF7TqvDiS+OxprkxyB4CKNkROS/mbwF3/l7JqHfRVRQE2W
         xQNksh2cdA0kIG632NM0KVywH+mcBdRvp2csJueITWvn52qL2m/Ti+df9wqMew2JnpXT
         nyEAtzAABSa/AbX8IkCzSdP+bXSnwW3QvoSRT3SkExAD8ukLpDVaqPy0/LS50CvK67EM
         Doxy2qP/FDi6sD8VOV5181UDzzI0gfHKSh+vbIf2ewSeDQAyP71yi0TxDdTGcG35fEbe
         mP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837937; x=1767442737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jl/uMa7F0AxGo9UgKbw3ayYmv5/eAGkPJCpV4UBsG/A=;
        b=qwicNYKEZS9h7dPIy3PeHw8GsOdk1QPet6xAwQ9GAlxDSxOVs2cmjMQ0YX092iuB2P
         SROmoV4pSi7Ah3c3nIYU3I3SP4U2M3mGZdpdaeMBmAb3PhIrI2qG3czMAeBUmEo5gSqI
         9BBq2SDKBSDUOqcYGelYDhDQJGUlTGKgBI+6+E1h9tiewLUi7eqfDJXsVSfcNlbafFWo
         IQ/fAyNkcxqsNmvBv+6LAYRaESJopGyiP9U0l/XHQoVNYmUlD6ipGicBKA/7obGpwQkt
         99rRj7VsV+mhZNg5uq3eN/+yH8wf3w2oMDhVow3fhjxgSslOCzpXne2b+jrqe7rTqK9W
         mRJw==
X-Forwarded-Encrypted: i=1; AJvYcCXx/anobmssFFwhZo34G4kalvCyuJ87NgmeARi3pg2UhjqDkP4dzhYjp8dqmhzxvmzDkLnbkPOyoaVQVBrWuCMe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+MIEIoQS831C2bbFJuy8rjSy0160s05xXf4lD2+/Vnlu5beuY
	5pf1tGXo02pZnj6waqPsKZd1PoEqLzdxnW6hpyRlAK7nYve1Qi/UDf4TvhXC7HG7N3Y=
X-Gm-Gg: AY/fxX6eIUle1ItLima7Wz1bSX9PtzVZWjEd3lZZRratLLGBSD1EH6bdKyYEE3Oeyg3
	q0cSKIzHbAmncmFUlgbKyKrD1z9i9qVqn+jCEuhks1G3EfX/Mib18/hmDNOLYY0D5FB4rtclRlF
	SNhAg+mj2X8BbSgJU3TLgfQOGAjuu+fRuCh/qGwkJxj9L3tHrS5MaNarskkcnj7DnMCaXjVFcKQ
	b69JMLmR2/gIcnk6e+vZk6Y5HeknR3MP7Q8OKS2gtzMpSCut5FkQD5pveyiF93mB+UO5zDg+HI9
	hB+Vm7wom3yya87QyF8zpG+rneGmYpV/wWEpk3IDzkeqxJy+m1AwB7rgsQrWS+msN5pnGeunKT9
	5juLkCtZVrk3/RnGl32ak4CEYAsFlP/pIz4sbVFHI5jdclSO6GhO8oJXUxLY42xzOIfUkA1ITTd
	IK352rFfmO
X-Google-Smtp-Source: AGHT+IEilNPw9ykBXsWasfDesGg5n0pMdngWI0y9wCDnaTUFF7DpZ4wL0dzMcGNMkGv8jBn79QEjlQ==
X-Received: by 2002:a05:600c:5249:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-47d1954a128mr290319795e9.13.1766837937081;
        Sat, 27 Dec 2025 04:18:57 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:56 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:21 -0300
Subject: [PATCH 14/19] drivers: hwtracing: stm: console.c: Migrate to
 register_console_force helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=940;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=go1Xoe57mzaY/mIQIq5f3pHcbzGWVFe1Pe8aCGM93yA=;
 b=2O7MS+wSbmBy5GHviNZc0eUrBGjBqbDvdZl/gWh/gmVWu32K1VqnWzIxEikovOvxtxQ1Ut5k4
 SCkXkL827NRAROp5vOzN3LiFx30TLjgXwQqt3ej5ptdr+YtakhrR7Rs
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041859_037690_B093A2CF 
X-CRM114-Status: GOOD (  11.39  )
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
 drivers/hwtracing/stm/console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/stm/console.c b/drivers/hwtracing/stm/console.c
index 097a00ac43a7..d3ae633e3bf1 100644
--- a/drivers/hwtracing/stm/console.c
+++ b/drivers/hwtracing/stm/console.c
@@ -42,8 +42,8 @@ static int stm_console_link(struct stm_source_data *data)
 
 	strcpy(sc->console.name, "stm_console");
 	sc->console.write = stm_console_write;
-	sc->console.flags = CON_ENABLED | CON_PRINTBUFFER;
-	register_console(&sc->console);
+	sc->console.flags = CON_PRINTBUFFER;
+	register_console_force(&sc->console);
 
 	return 0;
 }

-- 
2.52.0


