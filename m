Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68486CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H10VUnmTOcSqsdtPCuQYnfKlpPMwS75wksj7BtxL1Y4=; b=lGGst2hM6N/AM3izuNIsKE6G3V
	A8nfawrDKbjYs4YvIUZhrG82GUvuyPXhZgo6ESnmNkYFYj6QMFNCRhRbEFJxuDptckaI+ZMvDgAWl
	9CSjh7MNN6b6SYwXk2EVYXC2FjoYwvZo6J+6dC3+3wK/wi2Ao976wYo9Fg1LEOKN+smT+z7zHhfl1
	Td792NxYVtGo6uRrXluRrVxPFniX3AqV5dKqRpK/lfO3fissI+VXvaE7M3RlFRDUYiJS/OYgjMjgW
	cfgYn08yuXuQOBDetQXk04qoMx3uulTetaQ0b5b+W2Z3zrQ4+R5BmfC6zXRCnBOCTg6CT4/q28HCz
	OSrw7ReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc287-00000006ROn-0noD;
	Tue, 23 Jun 2026 14:29:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc282-00000006ROO-1ecS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:29:33 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-490cdae130cso28635415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 07:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782224967; x=1782829767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H10VUnmTOcSqsdtPCuQYnfKlpPMwS75wksj7BtxL1Y4=;
        b=AG2Y1wwhuUT2sEccMEYPKaDOMZYx2lVW/0MATa4Vts/wjZZeQ5p4lI7k3f+fOIAJF3
         pmdo50uAYyCQ8NbmDLhU5bJ7c3oGgiZlL31qdesv9qE48GeqSDyLv/+liLN/xgWXug0d
         lKvbWXFYqvHYt94lrc4vl161AjaxECUBY3zZT9RwkoYb7Dx5Gpc4NtuunBHQfAvSP2Ba
         pDJskoR/sNz7V/QHH+r7nR5vEG+9jAg45AuwnjXyf6guYNuLzysPTMesQ9lPovvPfLiq
         iy8/D2yJRTz9p4kHubfoxXrZADzD8Ctnv6Q9UYea/Tg+/bVL4WxiV6fGK5e4I/TUDk1Z
         XZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224967; x=1782829767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H10VUnmTOcSqsdtPCuQYnfKlpPMwS75wksj7BtxL1Y4=;
        b=ReaIjoApv7BUR8OcyFQRYGS2aSGiq2x6NJIF+NDY4qRlwViLcxPGc72IEIw04+T98O
         7sEaVsVNsHoDVr+CmMYgJFvhYT9ouPg3WuO7OTK37dEArrEpViuCeOpNC+V5BhPt7ZUE
         AUR3S4fBJZmxN9Oy+oAG6Z+tqMCeSYAlXpiNIt8dZvyPtTo2MNc3zbwfajO8nssnIWgh
         eJnrBVLtP3VPHgF3qd6ImB7vGJR9FT/8lmiEsKem8wR5qodyNy3qWC47wJKmUgs5PeTt
         oiDP6tdHXgTlc8l9vDu/kyixy1CgDZwOg0FLT38/j8Ao9ysIaP41vF82219PmBZahKDQ
         Fa7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/f8eqo/iQjsUHBhu1PVjHPGPunxgGqqGcfey8PQIk7bMo7k86EyN2V4WYPbzyS/HS4F5qF8LplcDajwTp6WTo3@lists.infradead.org
X-Gm-Message-State: AOJu0YyulCimuVXDoD1s4b9652LU2JPm83yrAKGnPubBn7ukclDFr8U3
	nCDw1a5JJEhDcnz/Cs3/vxOIehJIfu3f32gxr80XQ1cEkB7nnYSQJcFnijsqgdWU5go=
X-Gm-Gg: AfdE7cnAi5U7OgHytcGaTq5aZCGnyjK/eq62evu1+RHKGaiTlY80s1yJzs6g7Sqp/cl
	rnufm/elzbDHjjr45vMo8nF2BLCgNMqEDd9CrlThHovgL+sfXikiSn8WyrwUTbWyujvTW5XXaPQ
	dZYcmvCSghFZBiP+/N0gldYPqgcQn9TyWS6y5v4NaBL1Quhmo8d1a202HfgbYnEqYCKYHntkdRV
	VKRb5t2R8fU74qfE8dy0Ev7djdf+m3wFLoXdNuA8giE9oTLAOcsoGZczzRZvKvXps1g9i9ieiHE
	CD8l8rNBTsCBnBmRbHUaQMHKvqC58glu2OmUzFO445IUCt3SAoC8umUUZFJn5IBwcVVd9ef69YC
	3MOHAibE3rLFyFq9s1m/J8GKvEmCUQxYSamc1U1Jnb8Ii8dQp8ke2PnLqXvkXQOpI5dnBcBqhKH
	OQkhe0QYXw+kdQx4ClEKdDZsVYutVQcneW4lVxTxD6KyWEUO0eW/HBJHIa8p5JQiXFUYn1M1549
	8JdPOtoziXeXgIgMWD8x2DlrcYJ
X-Received: by 2002:a05:600c:8b2c:b0:490:ba0a:1178 with SMTP id 5b1f17b1804b1-4925b3b1732mr44333735e9.28.1782224967252;
        Tue, 23 Jun 2026 07:29:27 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm362507805e9.2.2026.06.23.07.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:29:26 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 0/7] soc: aspeed: Add BMC and host driver for PCIe BMC device
Date: Tue, 23 Jun 2026 14:25:38 +0000
Message-ID: <cover.1782224059.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780929570.git.gregoire.layet@9elements.com>
References: <cover.1780929570.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_072931_133022_70705151 
X-CRM114-Status: GOOD (  29.40  )
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

This is a v3 for upstreaming the VUART over PCIe BMC device driver.
The initial driver is from the ASPEED kernel SDK (master-v6.18) [1].

There are two drivers: a BMC-side driver and a host-side driver.
Together they enable host<->BMC VUART communication via PCIe.

The host cannot access the BMC's memory. Only the enabled features are
accessible. These are the KCS4 channel and 2 VUARTs. There is also some
mailbox register functionality also exist for a communication between
the host and the BMC. More information can be found here [2].

This v3 mainly modifies the BMC driver and focuses on VUART.
The BMC driver is now incorporated into the '8250_aspeed_vuart' driver.
A specific flag can be set to indicate that the VUART should be used
over PCI. Several changes have been made to the 8250 device tree binding
and the 'aspeed-g6.dtsi'.

Changes since v2 [3]:
- Add the aspeed,ast2600-vuart compatible entry to the '8250' DT binding
- Add the aspeed,ast2600-vuart compatible property in 'aspeed-g6.dtsi'
- Add the aspeed,vuart-over-pci boolean property to the '8250' DT binding,
  only for the aspeed,ast2600-vuart
- Add the aspeed,vuart-over-pci flag to the vuart3 and vuart4 
- Add the aspeed,ast2600-vuart compatible property to the 
  '8250_aspeed_vuart' driver
- Add the VUART over PCI code to the '8250_aspeed_vuart' driver
- The v2 review of the host-side BMC driver has been applied.

The host-side driver is still in /soc/aspeed/, as it is very specific to
this SoC for me. I didn't receive any feedback on where to put this
driver. I can, of course, change this to the relevant location.

It's important to consider that the host driver will do multiple
functions. The AST2600 also supports LPC over PCI, with a specific KCS
channel (KCS4). This driver should also be used to enable the IPMI
automatically via this KCS channel. The UART and the IPMI will depend on
the same PCI resource (BAR1), so this must be configured in one driver.

As with v2, VUART data flow and MSI interrupts have been verified 
working on the test hardware.

Tested on:
BMC:
- Asus IPMI Kommando Card R1.01, AST2600 A3.
- OpenBMC
Host:
- Linux kernel v7.0.0

This v3 only supports AST2600; the AST2700 is not supported by this series.

I would like to know whether I should add the 'lpc-io-reg' and
'lpc-interrupt' values to the vuart3 and vuart4 nodes directly in the
'aspeed-g6.dtsi'. The host driver is not capable of finding the vuart
address on his own, so they are hardcoded to 0x3f8 and 0x2f8. It will
not work with other adresses, so perhaps they should be in the .dtsi to
ensure the correct configuration for the 2 vuart over PCI.

For the interrupt number, my test is working with interrupt = 0
for vuart3 and interrupt = 1 for vuart4. I don't fully understand how
the silicon routes MSI numbers to the VUART but the following
combination is working :
       | host MSI idx | BMC lpc-interrupts |
VUART3 |      16      |       0            |
VUART4 |      17      |       1            |

The original ASPEED driver used MSI index 15 for the VUART4.
I tested every lpc-interrupts on the BMC from 0 to 15, but none of them
worked with the host MSI index set to 15.

For me, the silicon only routes the MSI index 16 to VUART3 and 17 to 
VUART4, and the lpc-interrupt needs to match the 4 least significant bits.
I might be wrong on this explanation but the data path is working with 
those numbers. There is no explanation for any of this in the datasheet.

[1]: https://github.com/AspeedTech-BMC/linux/tree/aspeed-master-v6.18/drivers/soc/aspeed
[2]: https://lore.kernel.org/linux-aspeed/CAFi2wKYOAotiezepDqaR5PZDqDaPKKDfAEnpx5EHC0mL39hy6w@mail.gmail.com/
[3]: https://lore.kernel.org/linux-aspeed/cover.1780929570.git.gregoire.layet@9elements.com/

Grégoire Layet (7):
  dt-bindings: serial: 8250: aspeed: add compatible string for ast2600
  dt-bindings: serial: 8250: aspeed: add aspeed,vuart-over-pci bool prop
  serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart compatible string
  serial: 8250_aspeed_vuart: add VUART over PCI
  soc: aspeed: add host-side PCIe BMC device driver
  ARM: dts: aspeed: g6: Change vuart compatible string for ast2600
  ARM: dts: aspeed: g6: add aspeed,vuart-over-pci prop to vuart3 and 4

 .../devicetree/bindings/serial/8250.yaml      |  35 +++-
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |  10 +-
 drivers/soc/aspeed/Kconfig                    |   8 +
 drivers/soc/aspeed/Makefile                   |   1 +
 drivers/soc/aspeed/aspeed-host-bmc-dev.c      | 183 ++++++++++++++++++
 drivers/tty/serial/8250/8250_aspeed_vuart.c   |  87 +++++++++
 6 files changed, 312 insertions(+), 12 deletions(-)
 create mode 100644 drivers/soc/aspeed/aspeed-host-bmc-dev.c

-- 
2.54.0


