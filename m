Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4D0CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=; b=MUK5nTfFs1uG0/oyfgXu+Zf029
	y0RIUn58J6F2i5A2ixnPIbVuWgHx2jzDz1F6zC31T5q0RJk51QLDnJJdKZqFUYBcO6zhUUV4BwcV8
	1pP2US25oqgAkRjZRILT3/dMdZBriTbDcq9wLS+kknPc6dlhKO/2FXlx3608fljdRpQRBi53oUbGr
	0ZsVM1H7zlhM1ladZXynCUT25R2IOJndOh0FmoTH9gVsyO4StfUPRGVjreVhAcfajUBE7wcUt4WKf
	+WZ4TJ3VLOSl+vGjXgyDujtAVlU5ljwoTJPQHFZdR8eT1Ll6Y8X/8YAD0LNZoJG763gbvRSJ4eI5g
	Ekj9qG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3F-00000009ges-1dIR;
	Sun, 31 May 2026 15:26:09 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTi3B-00000009gbT-1e9x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:26:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4904fd4f6aeso77385225e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 08:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780241163; x=1780845963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=CPv4cpUn9cV78U+w/dLBn8JbAggBwwZG99jWZFtI4XWRQDk6aF9+Ky0trYmpm8ZPrS
         RSeeQuk/7mahESBULo6y0Twh+VEgkCiPM7Ka862BVMe6Fz9hDOXjyaNSpmNEL4HEhxFS
         tshtQQMK5LZ3jXN2TjaGLA1OhJgvTR+fx38dMtCpWRsHef495McNVRNC24+Bo0XWFaRJ
         TIRgiTjv6raEE0FGWFQ6m+hQxexbmxRWkLItBjzv9Nq6mq7ziwJGdvSnmPwMtTqnoCmL
         oVcyjGE2XX+3NsnFQC1g6Fus2qt7noyoPHPHlCUa83kyUa2BFKTa3812IRp4huomsox0
         sYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780241163; x=1780845963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=M9m0h0oaU6cHhOXSHVO0yRwXGE8XXqZ/Jdr+BRfJYHBCQUwMdUIRg46iMtgE+g//0q
         qpX2FTxaL6mtntyoeb23Fkc0lL4rsJZ/ayh/VLXFjuOWiZD1scCenNN5vugcfEy1h7fo
         DI3jrub4SiQ0wnVah0zCW+pnqRxQnYy335mBMTFKCnDpCjmC9mkYTR2G9HmiZ5sUUn7i
         ZY1UZToHf5/PVHBfOA4lt0xiknga5b1NCfXJGMx13pOan5TEZJL37TysPgwDR4Congot
         9r22h8y4PkLRJRsGXqjCnYsmQKtS3dXXM3J4W2yoeFQwCPCecn4pa5WbNbOAXDSCAgZV
         SABQ==
X-Forwarded-Encrypted: i=1; AFNElJ8gz/SzVYZ4T5kxt6AiHiGS4JxYKvM5uUq5BomqutdLrJwUw+QrPNqPnR2muNKG2TZBjo62nybUnR3nNWumWEC/@lists.infradead.org
X-Gm-Message-State: AOJu0YyZV2tSj2lPyVxH0Qmf1BBu6za5LOSvTyvGNsghr6LS4Jk419zi
	ZeAPO10VFe/UfYtxxVOPerrVja2majKmXWxrWOr39jca0IL5wNfEXISZnNVi8BtEc6U=
X-Gm-Gg: Acq92OGxZSoLQx4hhmPidL09sa3ClCa6QciZi0RgLvDvhu/88h59G0rdTb2mcVxzHc1
	jerwTG1h28MBKDnY3jPPPMHhNZeXnkzz5k9IYg5ngw0vAhjwaJe9X4SE3yerAWqzRQ8+g3Tkdek
	Yv91uLIeNNsHXZinWRtbEyHlBEXTGEj/QK2L1iNl1i6CJjk+GI1WELVzAFlRg/e9QphOiveS8c8
	KNF9xFAIVNhNsDjDx3WH3Y634K9o9iupVetkHhvbN+AnPixORqh+GVnKcVoXEv4lMCgn+GQtj6F
	anyknSKzv0wQkSFsZtkqmVIEG5K68E3lWqV+KZEnXFUHEjJ4deP2DF6HwnDXzs4UPtp7kRslrTs
	HxA+NBmrS/CMqhX//eBMdVMnNM7L29eCyI0yKnanyszWrlN1Irv4ZyhpcIg3UXQNL9jp65yhbN/
	fY+slgRTwNo3CIzC9/3CvosBP9V/yvjYZwg7H4NxyzPA==
X-Received: by 2002:a05:600c:8b77:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-490a293a0b1mr146990245e9.16.1780241163614;
        Sun, 31 May 2026 08:26:03 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cf0dsm18526622f8f.17.2026.05.31.08.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 08:26:03 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Sun, 31 May 2026 17:25:58 +0200
Subject: [PATCH v4 05/11] m68k: add DAC modules base addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260531-wip-stmark2-dac-v4-5-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
In-Reply-To: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
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
X-CRM114-CacheID: sfid-20260531_082605_449930_40243F58 
X-CRM114-Status: UNSURE (   9.84  )
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


