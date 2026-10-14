Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0232CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHjm9SAitOsN54DuSr+rty4UIW0s07msMR7i0uLAqz4=; b=r9XbC5D0JqsHQykvNzo7O5cwO8
	nn/eTr3hIW+INT+byM/JPnncMNresOCz2ZJaFtA1aC5X7u2hlSQ2BcO16KaOoNMed2C8Rg+8Zsda7
	Gm2RqSH24dbFzPoNUJyigIDJ52OZOg8q4qNBChgxtYrKGa1gcnM8+OdFvDfk+uNd3hBNbAVFCOjPu
	5EtOfxsQ5byw1PP+HT/ut0OD888+zWpsdejyIBAqSgLXu+tTByTO2E1w58A4wudzbRsm9m8nHTMVF
	H9MR5H26mMclZl2I9A70EcHEc0e0iFpouSjWaVFvniCjy8EMkvEzsyi0JXkMOiOdwP9vZzXQdloxc
	0pu3eqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtHT-0000000Eivo-2an3;
	Wed, 14 Oct 2026 07:20:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtHQ-0000000Eiv0-0IgQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:20:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so33810775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962402; x=1792567202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kHjm9SAitOsN54DuSr+rty4UIW0s07msMR7i0uLAqz4=;
        b=T0JuXYVGnFf7s7VWXzEQu9JBiAXJqFXY7herS88v+ImcpZZdBrWLVfTK1Hlg9lhoXB
         EGvxXDRPPEJVtyb6dC0/SdI1R+lMcFJjIIprygpu3jgOFREw027biTYZQqPyyYJP5gHu
         MInpvxfUVDgvdFYvr8I7cAR3sduPNkFxFZrhXDtJY2YcPETYww1bg4lNYs8rfRcwIIgV
         rIEubvlTeBAEcAq2+WdKlRDBG7zN5b49XzP/PN1I353M9VzBcxFolA5TEJipy/LlS4dk
         fRHdB/EYE4TAakC9AuNJdHTa6r4/hK0MAfwq9dJ0/A1mm1taMo3bNC+DAd/gmZgKMV4P
         BgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962402; x=1792567202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kHjm9SAitOsN54DuSr+rty4UIW0s07msMR7i0uLAqz4=;
        b=1HCk6f/3Mu59yULUKlHhndJSDYBEC6nwUt0Qe3vsnAKZJMuSDg8G+Hoh5AOnNph/Kr
         QoAxH824T7p86vdrsuGsTR5ux5o1sc7pic2qyLj7jIwGsGlsittOvqnfKZHDDZDLHRoW
         dpXBuMUaFB0QG6/v7BjUWCc8xMg1TM+PEh1b22k24yTVvs5fvwNfvynvFNgUT1OVJpvD
         DuqmkARffIGqw7r/e5EZZqZo/4/2GnRl1ON2kCPv8AAhbDSlZUlpQnCS7jNc75kpY9Ko
         Sid+yjJSgHJu/SKfOS8HasDmS4MErCNoMyI1j9THogKPtkqmvKFGfH+exyDuz12Ej928
         uzAg==
X-Forwarded-Encrypted: i=1; AKwUvBxqRkqwtLXao5yR5StKBLvtY96H0lpZ36OPvwhhf5rAeD6hJG4rI9G+YRFn0xTVpgs8pripWXS/24Op6CoV33o5@lists.infradead.org
X-Gm-Message-State: AFq9FYJlXAFqPLQJJdyDTqo7Fxv1OhrMPSKF1S7O2JZECs4+cno782bD
	I5BEKKXwvkf7iodmTs43yy2cjvTe+GcegK3VRJuC/9O3cD3or5DPNruE
X-Gm-Gg: AYBFou2/vR/xlBZcnJ//GQsi4W9NLLo5dy6GZbnwR+TFTPmi7Id+Wdtw5noeP8YzFNe
	k8rLnlrdNoasuYNJRyGoNNMfEz5OUppeiewloLEKUGbtMqCN7vt4c1mmv4jV/i3Mw17GiucFJA1
	nOZRDgvGNOVGXXrOIkrQoOs4u2ZyOmmynvOYHauhGHLYGsDIg2RPLjV1MuLLrrG20E0ZSO9CA8C
	KnnqYoHh5qqMXsnCA1MeEgjV3JMWzBYJbP7/VTmVMZXYyMyQDjZdcslv42kHsSRsJjs4MrHRMbx
	clpq5zpy8z0LhJZ74ILc92eXYs3i0rHr4g9hJH0mA+VtIucsjbXdybdvB8zep8xnhOZxxM7o2TJ
	BvHI0RP2KUha8G8k8vwkkDt6ksiVIuldwOHWQfqMxy4h62MMNySzAeiSYE3A9GusJ5boKHDIFuw
	QMI3fMMpAzmo36lIOAB2AC1pAdQxMKG1MwinINEgEDkZqnZCz5OwFKe/Tek9HV5BiF1wWUyPWlr
	JGwX1hhhom6TErmAefqFBpTzzEYZxUpU2NGT5C4nGWM/js2aqdTbqgPy586V5TmtEjeBL6HwnPm
	pTWW4XxyZHJshi1Q7i0YbMfz/tZq3HZ10V53QGhjVWfE4EAt1EOCjwoWA4m5Tw==
X-Received: by 2002:a05:600c:674a:b0:4a1:7cf8:5433 with SMTP id 5b1f17b1804b1-4a18e443ee9mr278080075e9.3.1791962402100;
        Wed, 14 Oct 2026 00:20:02 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac3ac5sm9979474f8f.38.2026.10.14.00.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:20:01 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RFC 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Wed, 14 Oct 2026 08:19:55 +0100
Message-ID: <20261014071955.1755637-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <Lurh_NpYS2qId-6ONmcWzg@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com> <Lurh_NpYS2qId-6ONmcWzg@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002004_130226_EA0A8FF0 
X-CRM114-Status: GOOD (  12.10  )
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

Hi Stefan,

Thank you for the candid feedback, and I completely understand your
concern.

To be completely honest, I am returning to low-level C and kernel systems
work after being on the software/application side for quite a few years.
This router bring-up is a personal hobby project that I work on in my
spare time rather than my daily job, so I am a bit slow right now and
still catching up to speed with modern kernel architecture conventions.

All my work is done directly on physical ZTE ZXHN H3600 hardware on my
desk with serial UART, netbooting over TFTP, and live devmem probing.
While I initially relied on ZTE's vendor BSP to identify register bases
and magic bit offsets, I agree that several parts had a vendor code smell
that needed to be dismantled.

In v2, I took your feedback to heart to clean this up:
1. I eliminated the raw syscon poking in the PCIe controller entirely,
   isolating the SerDes and PLL into a proper Generic PHY driver
   (#phy-cells = <0>) under drivers/phy/zte/ and routing clocks via CCF.
2. I adopted your unified spi-zx.c driver with dynamic CCF clock rate
   scaling (clk_get_rate) and verified it on physical silicon with
   128 MiB SPI-NAND and UBIFS.
3. I split the CRM bindings into dedicated topcrm and lspcrpm schemas,
   moved the reboot node under topcrm with simple-mfd, and replaced raw
   register offsets in the reset bindings with sequential logical enum
   IDs (0, 1, 2...) in include/dt-bindings/reset/zte,zx279128s-reset.h.
4. I consolidated MAINTAINERS under ARM/ZTE ZX SOC SUPPORT with both of
   us as co-maintainers.

Regarding your observations on patch 07 (PLL reuse with pll-zx.c, the
32 kHz clock origin, and a dedicated pinmux driver): you are spot on.
For this v2 baseline, I kept the clock driver scoped to the working
peripherals needed for solid platform boot and retained pinctrl-single
for the initial muxing. As I get more time on weekends, I would be very
glad to work with you on unifying the PLL code with pll-zx.c and
expanding pinmux coverage once this clean foundation is in place.

Thank you again for the patience, guidance, and collaboration!

Best regards,
Navid

