Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDDCCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 20:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=; b=y8vMfkCHXtYU2rhrAMCxFB6fhu
	D4y6CXUDXZCa1UeA2McVf2ikrQepqgiDxtrMWme8uA3CSD72IRnT05jykdEDL59yZh6dgXcxvCWuZ
	Glur9ctEiakAQJE1b6DJMGuVgzwIhD7/3xEgLq6OkdZI5sEUfY0JdTnsS3q91aDVJaeuBRyYNNtIm
	PkGtbzdI3JBMlZalNUjfjXr3beNOs4hpuAXicMJPnyqT6yxgUxL3wmKvPBGWpXYdssgAumQ02Czwj
	ujzfEigl7Sg0osoeZ3vXy2bNTJa9SH75LvYrpS2zxZKwqpC430RNx0xZ4saDJPcuIu1MAbC9xKVns
	iYGqPODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdu-00000008KaJ-29sR;
	Wed, 10 Jun 2026 20:35:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXPdr-00000008KXv-0u9U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 20:35:16 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490b9318997so53278385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 13:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781123713; x=1781728513; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=Y1hf2t3+v+XhOel3JXZie/gvlwoKJ9wqJql6t78DeadfGgV8gVAfv4PsQTe2XSSevu
         MtgurLnxIg02FInBfcebnDiti37+WvyySQavj/zovprOrZvpN+BibqCJBE725FS1yOGE
         LfHDtSIBw73XtKpSX1oBYxI7cMFb4eL0LpyP1aRhWGNo7BzQgjTXLtJ4bb5eqD7JXLGc
         uSEi9aLy+pMOt4KMpsiCAWxt5JAZiMZZJVLNL39IuZNLDGuSSmF8bmafGcDBC8wACkMt
         e5v4v2QDXmGot3lKGmxD+pkcWbraZe2i2mOG1vDArNToNAY5VJuBgJN5otH5o2a1mxJe
         3XhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781123713; x=1781728513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=qaqCIFM33NbJ8mLuqhKpkkVRCJF2J88fUKL9ogs4UcHPtiONnpC3ZLberN9mTTHlIx
         R4sGjuiCXXy44/svGp19i3FB0uqtU26Bl9qH2JUeHIRTmnPHP+8EELZFy5AKn/SWzN/J
         QGxDiMxGinxu3e6k7CynjARCkggevTWWviiYsGMQ55XnOzuKAmG9R5RD5Y++UemvbUHk
         zYz98kzlrYcxQf0ZcLF+Hf0d4fwC3KDmcxPjRQHlOGHzY85IUcNiqkwHrbOBBmf5oJmw
         DARSH9h8FjR0K181vEXY/YErDSeaEs5RRZazHT00CElTXJL6zwnFykF0OgN8BIaX1+4s
         ovdg==
X-Forwarded-Encrypted: i=1; AFNElJ985axmjrMLYPqiogwbYEI82vmhzH7eKz5P+wfpt43+zPuO6DW9gA5v4kdbH9SPR9pf6fJpzgpx4i8jOo1f3qUl@lists.infradead.org
X-Gm-Message-State: AOJu0YyeNW4pwFjNjyQZo1w49NJXhwc4CjHSH4B6bcYo6dnyUWnJgQBE
	AhnxO9+lzYzxflfxM4hD0vObhasZxFYe26/TK52no4UcKoiG+4IApOpc5lMQFYSNiEM=
X-Gm-Gg: Acq92OHSTMrkAyxCqf4ESvHckIHyGyzVKaYXYqNV/JVgxQQd7LHPpqmCocMQjufcQzD
	E3U9Y2uVNzjAcaxGlm0JQaLLogjjz3KUN5535Qws9wMytsE3cBvrzBpNGkd1/AZ3dgWnU0xF0bn
	aLP3/X7xD14CxeEo06vXJ4Giaf+djkcolDaUNeV6/IDdpjVC0Vt1jdS2qacEd3GSlIS/dBCiQGD
	c7nX0vI9NxcrZjbxvMGQFKN+9IGnWIQTMxPI1wolTxrgcbkEC9pnKwbBlcbgWu+wwZV55V6LKA2
	y1DBrDHrBOUkUwpQCqYsdItWcRNzxv7opdBrRoMPsXtYw49MtrjG8PGgdVGs3fugZzO3IfMhSv6
	VbLlC9oL7ZYdJN1eY+PZUbZiKf8JR3lbpOo2RRXJlvjiv9wlkbmTugSgqPJLBGgd6sBcLA5Hasw
	vqk5LUqttcyPR0bhg0+uqIZ+rXfUYz08AW3Cnjz8WaBg==
X-Received: by 2002:a05:600c:529b:b0:48e:6db3:ff2e with SMTP id 5b1f17b1804b1-490c4e0219emr371553115e9.15.1781123713488;
        Wed, 10 Jun 2026 13:35:13 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dc4715e4sm62390975e9.0.2026.06.10.13.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:35:13 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 10 Jun 2026 22:35:08 +0200
Subject: [PATCH v5 03/10] m68k: add DAC modules base addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-wip-stmark2-dac-v5-3-b76b83366d5c@baylibre.com>
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
In-Reply-To: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_133515_275777_8CF079D8 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

From: Angelo Dureghello <adureghello@baylibre.com>

Add DAC controller 0 and 1 base addresses.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f48cf63bd782..f5acc962bb95 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -191,6 +191,11 @@
 #define MCFEPORT_EPPAR		0xfc090000
 #define MCFEPORT_EPIER		0xfc090003
 #define MCFEPORT_EPFR		0xfc090006
+/*
+ * DAC Modules.
+ */
+#define MCFDAC_BASE0		0xfc098000
+#define MCFDAC_BASE1		0xfc09c000
 /*
  *  RTC Module.
  */

-- 
2.54.0


