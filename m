Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548DBC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=; b=WIjxbTRe6JzrceTKljgVeYXYrl
	S7EOWdT6M08KbNQRYMadJDLh71NPfMcnRywwaPv+Hxd3pwib/3EXFq8FxEMtZsKbijNVP9ZSF5NuJ
	umwqywi13aOAgxLUflia6/Hl+RoJ6wtWbwYQ2m00iKV4/8/9/MO9DXAf4AaUi9Ao9PHmGFrW3YAW7
	MgpHEDqCKD0CeFfI69Ay6LV7QdJQpO0RMOCncAA2am8l8Wy2nnRrTZI00PwFLRuhW6u/XaMvCHZKj
	VXQpy8KSrssB9UntZRcwZvcboRmSbeevkMp37qXgH5PFCSG1KZIAoXKRpO+byHtH+WTT+qfLbgkj8
	BjqcPLNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50L9-00000009Gob-2mv2;
	Wed, 16 Apr 2025 10:49:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50By-00000009FAM-3O7m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 10:40:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43ede096d73so46114305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 03:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744800029; x=1745404829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
        b=SPMORt85bneAndUftB3DepwlfHN3wTB83HXMmpyE3JkoUmnBbIR3nNGMzU3M9+btHB
         wBlBVAfgCl/u3mnly5cpOjMqV9lXBer+m9Dh0KHk6tS7tdEmMg7VRhDbd3w2a0wSzR0J
         EJI9gvtX0bio4zIUdTjyq1ixt+wIRlhqezGvVGt1xXX+q6o+DgoznTCJCk5EtlRs8vlP
         q5iRL0Of4cjS7JF4B2roceNzNCg4qi7rlrefSkI/0rG3Bg3Lzz4Psmbba5FRcbCyccZj
         JyXLTCs+ZcuM9ciRqgbVlcTlhWDh08zDsmd4x4njh9OTikJ9qQVQC1/UFcKop3Wxo/Mz
         p+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800029; x=1745404829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
        b=GbJrR2EI4LH9Ni8YBbkQX3sH4T8ym7EhUzfyaJF6GmQlDzov6qorsr7TwHzAFWIy9W
         0AtTN2puQKHGzXOpzgMW4b0sW83eqUCASDlPz/wPzlmhTo470c2PZ7Pv/OIJ0Vd+WBZi
         mBybtSY7e0ahIlfv1h/3fuLRUUTudXCaRc3/9/1G6cSchlr39LIFjJc8TlXonmVmOvzq
         6Ih8O+Ko7MP8T2XWxzAQ2NaoGM6SzAhzB++HGA4/6QAJ8/QssBpbH+COCTtngctpVWqw
         UTtHsPPX5g+ZUOLnx8+SbVLxTJkS2SxijOMg+mljRfrCTIHuk7QtnH3NnOAG6BgRkw/+
         g8AQ==
X-Forwarded-Encrypted: i=1; AJvYcCW11eIbdVui5qcIrMhFsNcgJzxbo+o8b6nFpHnjzGgSLyRXshZsIqqLpU2AWpAkA8p4sznGoTjWRySa8woV6H3Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxBS+6W8ZSFfY38hygWT6+AZ/7dhE1M5f/uEok/+a7MHlTGDG+/
	gVzLoH+2G5nq3A8GdF+4pBI9+a7rZAysykxOJeFagDffF9H3Hmlz
X-Gm-Gg: ASbGncutT0YsfGAzkS72foyXwp9zcqfw4/VoB/XS87Jwx0n7uUk+F4GD2qMgk8pwfCJ
	BdEH1y7drB9SC1RmDV+2K5Rbp9AQZ1zVliTcCNeIu6aLTR0jQ4ZbRJb2jLqaVtGmPGVCyIZiGMN
	uH+ZqRwlYQ/jW6logy7D7kbX5siCJix99T+lmwZSkzshsQ61ENyGaqvEnud0yChn3wiLD9QU0tL
	7b7nh+n7KF+18QuVcFAvNoxf4IcTKt1ChKhpCfHvKWTXMbggmXhnlZld//cor93HmGLkTv80sDV
	xAsq5vbTFKDndpE72Nh0QZf8bJEeb97Oa1aa0eus+DFZjAiDy/4Twr+QE/3EbHCumA==
X-Google-Smtp-Source: AGHT+IFXW+hiPEBM9LjJCwMXPmS22EARA29oJ/ZIpi9JZFtxhf4t17LTXmG2ii+PAuY6ozJtD3xfEg==
X-Received: by 2002:a05:600c:1d2a:b0:43d:36c:f24 with SMTP id 5b1f17b1804b1-4405d61ca24mr13567445e9.13.1744800028716;
        Wed, 16 Apr 2025 03:40:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b4a2:e121:10d6:ac54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964089sm16824975f8f.15.2025.04.16.03.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:40:28 -0700 (PDT)
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
Subject: [PATCH net-next v7 4/4] MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH glue layer driver
Date: Wed, 16 Apr 2025 11:40:15 +0100
Message-ID: <20250416104015.47788-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_034030_846065_6620041D 
X-CRM114-Status: GOOD (  10.81  )
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


