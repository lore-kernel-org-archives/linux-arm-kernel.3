Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85367CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 23:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=; b=iwhvjmW8/wAGGNyf2nMQgWoClG
	IccCYm879U1EMuCitcj7/gCDHz5wOXDeAL2oTqiBQshlQeMo/V9XgRvmHY9btOUeHXTP77cbG3YN/
	FM6tbCN97LTRhg9BlK6Al/RIH8oU3fbqcmqHmXFAZM3a0+uW98r5gYNkdDk7HzlsLZBTWei+DlsUa
	zg5muDFIx0n/lREY34uGBOfNWXftMxSkDNc/MY1TrN0xFNcbeDnuJRfYpwh/69kju9/sixDuHj47O
	gfMHZWO3aPk3l0sk6ECdYjpia1lDfcmdLlUwfAnX5Q6/el19pC56wRKxtAigRVfcmCZ+JJ+i6zNl9
	kFKB/qUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJB-0000000Bx0V-0hUQ;
	Fri, 22 May 2026 21:21:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXJ2-0000000Bwsa-2NKu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:21:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso68030575e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779484879; x=1780089679; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=;
        b=bTGTdWi0G0Q9RTdJHu2A0ydQybTrkmA7/GNS970r2huZqLbcSTTiAaCAR0eBv1f+Tk
         4aBMPfnxB3mzMjV2/qipMiIdqdyqdyk55dcjiQbCEVryAGe/O/m/gKNOWR/JJansuR5C
         JA6rneBYus6dYWAtFCiS1oh+jC0OeUqcGep1KWUpryrk4Ifx5QYvzLZvpMn3zkHtYhdG
         +Y5dvzqMSki3vVzVcen0JywMCAsDzyV4dF/qYk8+wzA8upJgb+SF01CnY81mGH2ncbk0
         zav8Gi5TKu1RBrfdu+ovuF37hTQVDpwclh5RazDDlUNYvV7fl6dcqiestMQdS0XMGe7N
         Qhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484879; x=1780089679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=glJxT588UgnMfOXSLSAgwe+j1CYbc1X+ny/bK5Tp2LU=;
        b=Z43DtWV4+T7lsSKf0B0hmOo6v8VdR+OviQAxf54621zNklbQVUP/ELpU57KqGrD2+W
         WWRlTuZR7HnMSsCWBATLjQ/9WB9+Whtr4mZiSmmUsRhElPDvyACPqpIZ5lEoFnXLvN1d
         qEU5YBlXz0sW2zDgcgNwOrKl9B9YGz3RkKgjCU/iNSUj8ccRUefhZgfXIfVMcZ2zSuNl
         DFSy5soYUBXUwF8SicEC2CfsaeM0YD+zc6Z0ezq/0eJbO749RpH4CDMCfhs9RG3VLoqx
         7qMUqmR6xkKlioywJoLRQrah1J8EiDju8/yLqTixP2tG/mucOiaHscuvaS+yXgaDrVQb
         FM7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ULII2R1kIy7L5wzJWx3mmid7anDHW4CCpIjyLMGT8dm8WV8/uSnWtNPkUUJbmADq4ZbzE7/IieghVGB9R2Imf@lists.infradead.org
X-Gm-Message-State: AOJu0YwxvM6sGGisnrPbU8gVXZbSFVOFFc2eEnmbmSxMiKcJbDiZwapl
	Nd+MYSG+CJwX++a83lLXdzQvmymdXbT7vHIM8Ctif9Rg0vxwKHqeYqUAeyqRvYofkno=
X-Gm-Gg: Acq92OEFS4WLmewyPPTS4MxF531wsvR9tA5f1i73rpHhVJjtr3B/r8JSBjV5IGtdxuD
	T6fhP1OWCONl55f7EZW4d9cHXye25t5WbruR/1GtM6JA+fgce/5s5+MYgKfYdvi73kwcqaJKMj0
	HYJ/lXdgYirTDJhe+MHEq5hK5J477RdQLigZRZBUueqGZi/9YZgU5RjqdNNniRmW5o9F9RbgEvy
	xEI3+6gAvobRnR0sGpzT1R6G4a72NdsHYNiqRVg3SAnZCGItsMvWJSyLA/mbCzrxSwatQhb1TCo
	HiNMTGnVwh0JC5GbUvBgHTOt5cr8JzOiGgstX3/WHyLehmILZtoi1hc+nZi64/eAslw8lmPJaVL
	ezqJhFPIK45KKEi8imb6B0Ial1rcGQeANfZkl4ipC+50nizKTlLFvngD0hFNV09hNYcqsgVUz1J
	i0IRNx/XhC8+7P2WXc4bpHGkRfrdSQtTc=
X-Received: by 2002:a05:600c:a106:b0:48e:635a:18d2 with SMTP id 5b1f17b1804b1-490424a0d41mr53927465e9.2.1779484878961;
        Fri, 22 May 2026 14:21:18 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm73312225e9.9.2026.05.22.14.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 14:21:18 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 22 May 2026 23:20:31 +0200
Subject: [PATCH v3 03/11] m68k: mcf5441x: initialize DAC clocks by iio DAC
 driver name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-wip-stmark2-dac-v3-3-16be0ad35a67@baylibre.com>
References: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
In-Reply-To: <20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com>
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
X-CRM114-CacheID: sfid-20260522_142120_627850_2055DE02 
X-CRM114-Status: GOOD (  12.49  )
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

Later in this patchset, the mcf54415 DAC driver is added.
Considering some other different ColdFire cpu DACs exists, the DAC driver
is named as "mcf54415_dac", related to the mcf5441x family SoCs with
DACs (mcf54415/6/7/8).

So updating DAC CLKDEDV_INIT with proper driver name.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v2:
- none
Changes in v3
- roll back clock names as they was originally
---
 arch/m68k/coldfire/m5441x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
index 5b5e09ecf487..b02ca2eb55a4 100644
--- a/arch/m68k/coldfire/m5441x.c
+++ b/arch/m68k/coldfire/m5441x.c
@@ -106,8 +106,8 @@ static struct clk_lookup m5411x_clk_lookup[] = {
 	CLKDEV_INIT("mcfpit.3", NULL, &__clk_0_35),
 	CLKDEV_INIT("mcfeport.0", NULL, &__clk_0_36),
 	CLKDEV_INIT("mcfadc.0", NULL, &__clk_0_37),
-	CLKDEV_INIT("mcfdac.0", NULL, &__clk_0_38),
-	CLKDEV_INIT("mcfdac.1", NULL, &__clk_0_39),
+	CLKDEV_INIT("mcf54415_dac.0", NULL, &__clk_0_38),
+	CLKDEV_INIT("mcf54415_dac.1", NULL, &__clk_0_39),
 	CLKDEV_INIT("mcfrtc.0", NULL, &__clk_0_42),
 	CLKDEV_INIT("mcfsim.0", NULL, &__clk_0_43),
 	CLKDEV_INIT("mcfusb-otg.0", NULL, &__clk_0_44),

-- 
2.54.0


