Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAB7E9270E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NC/xlTHSkC5720zy/KPT378kGxggptiwCzT1YNGAqrI=; b=sx3qHmn4vhDkXdbK2El4/pMEm5
	qPqsscmqkcZhL7xhRNrEiOmMvWP7xhWvKKCo2AUprGCGRlFeqkDMFf8kqyIEZegy625t+E7elU+rV
	UYYBuz+G3XYgki210Jmk8E1bzpWGZQGb6i31YPcS3khLkmxk7FQUjMOtILNBhfDPo6atJ4aFXI/HX
	DPO3x33UqIm6aYA6P+aFMXeqglsSCsM6e0aRYlZOf/X4KHtpa8KtCIKfsOmkYWPhi4ys0zGDUhaIB
	EGYar54X8EViqx9cO/MT9hWu9hTgkiIMrLgo6Y5LERd2mzfrz88VYWyDwyd2AvZjOroZcWYnALNzm
	7OwnycMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTG1-00000001wez-0ZZz;
	Sat, 27 Dec 2025 12:18:53 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTFy-00000001wbv-0CVJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:18:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so13339965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766837928; x=1767442728; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NC/xlTHSkC5720zy/KPT378kGxggptiwCzT1YNGAqrI=;
        b=Y1jxErn8TBO31ogXkHQQp/6Lu5eALAh4fdIhBAOvgLcJKpcvG1gm3MclKY3tMcbubL
         d35iXgvnR644Yi8imFNag6tnj7rX7p3hgZnQKbpZGxWRwAc5I03hOjH/VXNOZT5Ls/WD
         7pKJTpCHPVlM52J9C3vDU6g2azG7tjMUEWAeVbt9rXKF3TRHQ2/qzGYkk7Ae6XJF6xcq
         MYVzTXfHkoEl3SdGxJ3oHpKniVDjJwAXgZCvj1Osmd47tv7n3b9c43m+YBH2EYa8cVZ0
         GRXNV9HbzeJmxK99KtrMA0M/FicKX73vcOuQaY61xGtJhtMojNGtePkxuJmBTdy3jiWB
         wUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837928; x=1767442728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NC/xlTHSkC5720zy/KPT378kGxggptiwCzT1YNGAqrI=;
        b=jg56CSuk5yxcMgLZpNCpGGgLPE234XPAJFphQI6nXsU626OoRvM8Ykwmai+FRyxAUy
         36jKGNlhTK8FkLTZrcc4Jq6Uj+1mQ6yEmwrBNONF/OLh4oPx2MDe3Pfu0wi6U8hr1YNn
         ThmZZ23CRMplap3fcFbwA4qBfnRctPnlWcKIDddPdPcthjc+i20kfP1iEFELLrzW4b6+
         Jz6UoET9nZQ/wBZDMOHw+nnS7mw29N9iqvhY+3y6MVRXak/IBvFjy8g+HmuCEitL8S4A
         GEJwWiQdwPB5ku3l6qWVIud0lhJTkic1IppVrYumVEKAN/YWl7A1O0L1FmoSlF6AzoQ3
         osiA==
X-Forwarded-Encrypted: i=1; AJvYcCXEsH5+WzB8o4evqWPly/OYuUYOiIzDykXe0GIcVHL14ljEWYGL9FWggzZ6IudaWmU0QIlZUkg4Gt2QpBBeLCVk@lists.infradead.org
X-Gm-Message-State: AOJu0YxbAqewg3dFfOAYKU/Dgsfbolx1d83OLyz1BleWf8u6/eIrjQZt
	SoeLfCRBJx2TTK5EnadJvJBl0AEj/f3efDg1MoSGRz72q1D/fDSHpaLmptBH7SMkDCM=
X-Gm-Gg: AY/fxX7jMdfAH2gJRbXWkWvDAcieLigBxZEBMYLwLBoWXBzQ5RI2lhh2qsTL4LmyLA6
	uNxshBAdIY6O1fyreXD2ISM8Q6bUzYxsgX5z/4sQWrT9lFaMrcE2k59nQlKcCNHCPIIZFBjrcpM
	cbOk17ROX+09B5GJ+DBqIiG5QFIzvYFVC/7xetJFF6w5QievoVeLcokxsQhik/uW1onI7U4Gw16
	VEeUR+drqAqIQe/fJIbDG2Xm/j5GxaQjxTe7kHAWVzsvCAx0TozFdkhAw6oaK8jemI6kAnm77Lo
	5TgKK0SnWnHpU082gocOeffJZuUp8ajFFDGWrObpGlXO9N0gY2s4pI7Liaegr6Vva1rI6pxoFXx
	WZfjOvU3SoTsnXMnqiToGPnzwp0FWH4uCKyj5s9FhPw4ZqacbJ5GiAP5YiRVa4cpcRLjFI54R0f
	rvXfpy+eyO
X-Google-Smtp-Source: AGHT+IFbCGvkCxGExFQLBl5yaU008gmiVvRdmeb7k0sjyaCh7Z1nYJocCXv7ZLYKC/Juko66305eyA==
X-Received: by 2002:a05:600c:8183:b0:477:fad:acd9 with SMTP id 5b1f17b1804b1-47d195a9834mr270395745e9.34.1766837927833;
        Sat, 27 Dec 2025 04:18:47 -0800 (PST)
Received: from [127.0.0.1] ([2804:5078:811:d400:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm97940127c88.4.2025.12.27.04.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 04:18:47 -0800 (PST)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Sat, 27 Dec 2025 09:16:20 -0300
Subject: [PATCH 13/19] um: drivers: mconsole_kern.c: Migrate to
 register_console_force helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-printk-cleanup-part3-v1-13-21a291bcf197@suse.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766837798; l=961;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=9A3Brx5a3gQ0NUhTGZ1ViMT9HfTuP00Tgzee1GwnjVM=;
 b=gNLF1CEZIFvupLFUy4kgNSgx2QLue8Fjf3sjVi+zSBhpSIWUfb0laNahgF6qahlq6x3pophwD
 dRykPPu3R/nALZM8P2pCpkq//4oDFgsmNLGc4Tixc+Z0JIXH+9rAGGe
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041850_113870_58DC50B4 
X-CRM114-Status: GOOD (  11.84  )
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
 arch/um/drivers/mconsole_kern.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/um/drivers/mconsole_kern.c b/arch/um/drivers/mconsole_kern.c
index ff4bda95b9c7..ce4f4ceb7f27 100644
--- a/arch/um/drivers/mconsole_kern.c
+++ b/arch/um/drivers/mconsole_kern.c
@@ -582,12 +582,11 @@ static void console_write(struct console *console, const char *string,
 
 static struct console mc_console = { .name	= "mc",
 				     .write	= console_write,
-				     .flags	= CON_ENABLED,
 				     .index	= -1 };
 
 static int mc_add_console(void)
 {
-	register_console(&mc_console);
+	register_console_force(&mc_console);
 	return 0;
 }
 

-- 
2.52.0


