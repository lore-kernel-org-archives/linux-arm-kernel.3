Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0231C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 17:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qJKEGc46A6MaBdapnr1AnlxGbrLJznLMC+lsm+gAYE=; b=kwcgN6KFrgIhCkZDhjhMgwkbXd
	FAZ0HixmM2WgvO+ldVhG6oLYyGYoWvDCBQF6SeoF+besGmhLQKXr7NyEn28GqjdLNxupFmZhByEWZ
	m9GDiC6dvwhF8QKjPPV2see3nUmCGi/1khh1k64VHDVZbAHZpo2Ez187lpGX8eD8we5ojgqTg8Vl7
	+P8KFhaQ3VBngAiSzyZ24pyWAUHF2vVTcz2BjHcJ5yDtpC7+CpKU/m7poP8vKKSaeUchPMhACgzVs
	eaAHAOka1GGVwYGryoM/ZOaRowZH9YhcSok611PoGqTj+R14QTa0IHuF5x8Otp9h73GS+MFEBvFtg
	Otz0zSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLJW-000000059BW-0taD;
	Thu, 02 Jul 2026 17:35:02 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLJU-000000059AK-0HMh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 17:35:01 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-92e855da580so56131985a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013699; x=1783618499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qJKEGc46A6MaBdapnr1AnlxGbrLJznLMC+lsm+gAYE=;
        b=s9IkIJFteQ4XXOC83RzT3yoHK0AE/Mvq9NFEIXUgwi+lQyMdIrJ1fXDgS8FU/FN4j5
         ujgSxdZS/dcJtBNpbLwKIEAgDMrsbGcoD9p6iJc4Nd1dIMqzBO0GwJLZlrkdZUp+7r9G
         5fu3xZLXEbg7mHELZ6qpnjOU2OZjY8JTl9lMFptV8rr6S5hf8K0/4w8bAwRfYl/U6hAc
         4iC4hvbXG0vv7JzyJWmmJN1sGrLUjOL9bL1mNaBk6plUSyItsrrLFM4br2XLN0Hvv8iM
         oM/IAmPPz9dJVLR4CtLdniE3eNsmVqqmURA4Xo3JuoE3kBoWbDK+DW1zsNXflgXwGX21
         Iu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013699; x=1783618499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7qJKEGc46A6MaBdapnr1AnlxGbrLJznLMC+lsm+gAYE=;
        b=bBufxh7yxb753fKPoDuYBS2VGItTXpAkUHAMmEQin/gkaRSFkEqdZyAzipQU+QMzjj
         20AV+tygeqbG33T7lYdyV8Ls3yYDbR0TLUkXRjIeBsWnv/A0imCVJhr0w9Zk9SPdMd7O
         QIem8YKSH01u7PrMIzIJi96qGufufkBnHb5Li3kYpkFQSANIY8aHch5Op2uxWn/v4U1t
         LvScvYoHMiw3nEeyLIRPQsxbgMHYkrdrnQQ39HIbF+MINYSqQtPYDqWHF6Q39JsmGspd
         gtJYGy10HkgxbkYvtkHbg2ZmgQ7HpDJD5cni56RBdlP3HGUP64h5gduOowWtxmTS5zl+
         3K8g==
X-Forwarded-Encrypted: i=1; AFNElJ8/jjpYCg0Ncv441NI9kSNN30Ja39uWop6XikVdMc7qS0K3Lpa4HgohY/BExDaIWhThaHQ+d8/JFAMyEGM2HYcQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxGpjZBtKCFDJ3Cr3KnqwpWUGe4xDluYCeY8Nj1pmCSB+DdgOSQ
	cgyTpqfevPYnKtV2L90Jz+wBXAyVRGzFvFUOSaqQUrRz5cc4MgVNvSAI
X-Gm-Gg: AfdE7cmudcGMtb16O2trhxVL5bjB7/nfItlUE0Klz0mN4FRdpyd2v9qV2mLtvo5Tu+C
	S60t952Qo4viWeKxrH+gHFPYFlhvnks4ulEL+25aERlsmek36o3kcLOc9+/jT89t4VK5AJc65Av
	IFRorY+U0+QvSkjG6f8rXOwucj3iOS2agOvo1ucOOz4/CKE7P5uLh4rInehoB/X8iIzoTdIzUzZ
	JTgGrpxQDBjJxLGi372ZWlymQd95J7S5E0YKoV4aNFlcwrzUvrEKJnfodIiEuToqNTYYUaPePBr
	HU6Ach5NNwnvFMRx3WuFURkT/GD6gDgQ4uqRdGcjhwf0Y1s3BLGUKDe5GB7Z6z3BsjGmndg8Ray
	YGW7qfQMoJCiOkbR4Kqc6qeHfZQz0lVmlqqKEtyRiIczWtHkixtUVFolhKB5P/yoCj3v96RQFBO
	cixpFdPoNGFECHR86DsCwuQIzIOpe57gcLHR0mmNsoHswmweLCkcqWE1BxNCXZ
X-Received: by 2002:a05:620a:468e:b0:923:8612:f15 with SMTP id af79cd13be357-92e7823fc78mr907524385a.18.1783013698575;
        Thu, 02 Jul 2026 10:34:58 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80162220sm268889985a.25.2026.07.02.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:34:58 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Thu,  2 Jul 2026 13:34:54 -0400
Message-ID: <20260702173454.855897-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-7-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-7-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_103500_107642_4D708CBE 
X-CRM114-Status: GOOD (  11.87  )
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

Hi Junhui,

Following Andre's suggestion I went through the bus gates in this patch
and compared every register offset and bit position against the public
A733 User Manual V0.92. Findings below; everything not listed matched
the manual (122 of the 135 gate entries verified clean).

1) UART1-UART6 gate bits look wrong:

> +static SUNXI_CCU_GATE_HWS(bus_uart1_clk, "bus-uart1", apb_uart_hws, 0xe04, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart2_clk, "bus-uart2", apb_uart_hws, 0xe08, BIT(2), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart3_clk, "bus-uart3", apb_uart_hws, 0xe0c, BIT(3), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart4_clk, "bus-uart4", apb_uart_hws, 0xe10, BIT(4), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart5_clk, "bus-uart5", apb_uart_hws, 0xe14, BIT(5), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart6_clk, "bus-uart6", apb_uart_hws, 0xe18, BIT(6), 0);

Each UART has its own BGR register, and in every one of them the
gating bit is bit 0. Manual section 4.1.6.141 (0x0E04 UART1 Bus Gating
Reset Register): bit 16 "UART1_RST", bits 15:1 reserved ("/"), bit 0
"UART1_GATING - Gating Clock for UART1, 0: Mask, 1: Pass". Sections
4.1.6.142-4.1.6.146 have the same layout for UART2-UART6. So these six
entries should all use BIT(0); as written, enabling any of bus-uart1..6
sets a reserved bit and the UART clock stays gated. (bus-uart0 at 0xe00
BIT(0) and the uartN resets at bit 16 all match the manual.)

2) SYSDAP gate offset looks wrong:

> +static SUNXI_CCU_GATE_HWS(bus_sysdap_clk, "bus-sysdap", apb1_hws,
> +			  0x88c, BIT(0), 0);

Manual section 4.1.6.92 puts SYSDAP_BGR_REG at 0x07AC (bit 16
"SYSDAP_RST", bit 0 "SYSDAP_GATING"), and patch 8/8's reset map already
uses { 0x7ac, BIT(16) } for RST_BUS_SYSDAP, so the gate here presumably
wants 0x7ac as well. There is no CCU register at 0x88C in the manual.

3) Gates without a register in the public manual (V0.92) - these could
use a short provenance note near the entry, as discussed for other IDs:

  - bus-spi4   (0x0F2C)
  - bus-sgpio  (0x1064)
  - bus-lpc    (0x1084)
  - bus-gmac1  (0x142C)  [same question as the GMAC1 clock IDs]
  - bus-tcon-lcd2 (0x1514, and the tcon-lcd2 mod clock at 0x1510) - the
    manual documents only VO0_TCONLCD0 (0x1500/0x1504) and VO0_TCONLCD1
    (0x1508/0x150C)
  - mbus-gmac1 (0x05E4 bit 12) - bit 12 is not described in the MBUS
    Gate Enable Register section

The remaining bus/mbus gate entries in this patch all match the manual's
offsets and bit positions.

Thanks,
Enzo

