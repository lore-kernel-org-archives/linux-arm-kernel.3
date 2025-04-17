Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00C5C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=; b=1zYmxUvJEFTHw2wEWR/vSopxV8
	fqqN/oRl+jcIl2WTVz3Ly5pqyQ3rXUkdI7nDQ4t6Dc6evMcBpTPk81x0h1VvmZcxliqPcOVTYo3gQ
	3Lb2j3IwDXnWs4JyVC5z0R2zADLG1TrG99DWORq6r+EfW8sZ6tzuT22BsB4OOaBJ7/T1w88GLlvS+
	gJqUYCex7X3xrB98WCSpjl5kvALorQ/D3FtWAcghwDoK7MWWHeap/r6wJyO02CtH3ba/bkQEWIZw7
	CiOpSXRp/f4FV8LSoQW/ZZh9V0u2n+AcSNZi8nZWvw2usxGQJYT7Y6fyQVDWKQSmz/p6j8Hc3u884
	TZiQ24Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Kxy-0000000CKxP-082y;
	Thu, 17 Apr 2025 08:51:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Kou-0000000CIum-460G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:42:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso3398195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 01:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744879323; x=1745484123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
        b=nnmlTYo+jI1yVN7M0zzbq6xle3/2zk4WYiUVghgRvalEwbsoyseZrloAQv2xtVyWAZ
         gnnKerIt8laXyCJTwwoiB2ow+WiUgdrp5mkCDjQBYlTE+vzkL4TmxEOBYHUhWZ6Sn9gY
         VWIoDWt/yvKjBuqelfSEriRfGG0v7Zm3h9qCIOFmcvrHx9vODESd9RmVJAVMCbAHFSZU
         y8C5bmrXJTzlReX8kK30JdA3GEn+can/Er0tOwAuMfvh5Z33aBkpSief1kczdwUiwxT9
         GUIUC47HRwGVxMIYPj6V/Em56j3gM+/GLayEH+T7rvTC7BPpmZf12OAcFJHgcX35Dl7H
         MVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879323; x=1745484123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
        b=E4Z6pmuRgZHhfExh0lLeFhSrhJ7MCH5Oq7sHzM/cNp0XyWn/FfiMu5jM+kpS/99mN5
         /TUaOAXPkU1MO3Nv7DLgW5CketDLMNZkR25iNfX9qrbVDF+23L/Y1D1x83n+moUaNkyl
         o9zNwL+ad82o9js9sEQIcwdaKjnh1csk9wqKCF76/5fZskY6881hCxcRHBeLM8LZ4go+
         3QTfYOHe/OCK58PiVQXFUVYaVK6CgcXnUqB2P3xqSzpEjAd1FZ4ohXyMNl59S0jt/RNn
         lO4pI/LsfT9NVrJBN5LOcDt7OnXGdyxYFq5AAM8OsGyYPjKe4uXWwI5pgNxE7LpPFxO1
         yUbw==
X-Forwarded-Encrypted: i=1; AJvYcCXWzHQQNV9IEbdWj0TrclZokQQEKcRXgo1AhJYHta8HsPw6ZPx3g24RTU8Yn3MYP2SpZtqrUbyf/NO4JFcJhTcr@lists.infradead.org
X-Gm-Message-State: AOJu0YxqsffF3tcZEWJLhwTBZ6mXLEEWOa2CGPaljeW6uYzH05ssxXfx
	goNVRKV6PcADXfJikJdGKt7SExj2pZTfJSLQhohYO/5aigLjv6nv
X-Gm-Gg: ASbGncvCEEbYY/tabwTG09G/a4BSiEohSFaqA3rf6254uE0YEJ84r/sLivaftUKPDm4
	/BaY5y8t+4OndUxpfh/vns1IL1q2ZScK2ClIt7F9kZ06KxAcRAUCHqjEWFhl4rkHD3NsrTpxsgA
	d2Viv/7vyAegl77l0nCTM4aZFcLMGHp+ixPUJqqaelCl2AUIPVGx9TAgmCtnaJ4S4XIvkN6Ozy/
	yW6iAcbN3iB50P3Qksy+70mD4ehECIM9Ri69ZkJUMOZc8O2jsYjj8ryoQBtJ1jm+Be0fE2N9ixF
	U3o6CIzN4kL8r3dmsK0Q/BgaSI9KHEhnosr8Kbm1X2oI/J0Upev3WIoxWDXCbOae
X-Google-Smtp-Source: AGHT+IFhbogSv22y1O3lHsGjfla1/G8RQGwFtOudU0ddZpLH9ImE2NvEPhJVSxI+e+uL8StCh9oEEA==
X-Received: by 2002:a05:600c:8711:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-440634ad300mr16770745e9.4.1744879323027;
        Thu, 17 Apr 2025 01:42:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f0f:d684:f4a:34e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96cf1asm19657712f8f.39.2025.04.17.01.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:42:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v8 4/4] MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH glue layer driver
Date: Thu, 17 Apr 2025 09:40:15 +0100
Message-ID: <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_014205_007110_DCC1FC0F 
X-CRM114-Status: GOOD (  10.35  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new MAINTAINERS entry for the Renesas RZ/V2H(P) DWMAC GBETH
glue layer driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1248443035f4..f5141da4d509 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20606,6 +20606,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
 F:	drivers/usb/gadget/udc/renesas_usbf.c
 
+RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER DRIVER
+M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+L:	netdev@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+
 RENESAS RZ/V2M I2C DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.49.0


