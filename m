Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F9E7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=; b=VsWOvpnCX2sVbyMBbQNex6DMPg
	+qKQvqOHQctA4yJ3gkcMmuYJMExaZZlPV6L4FgUioqWx9xO4qBHpduzZcy7jz+JOJ+W8JABJWZG4n
	yQZYZ6XWJO1fks5fsuw8sQTKjJyr0yYjnfEWIF0N8v37IoQ9EshUfFdlDcsWqYsWOf1u3BoGXDlRI
	O+LJ0SrW/wj1f8kQfqh2h5erP/1EA85C7eqkFPWnMnq5IK5cKX8wUaRwaDiOgV4ebcUgl2zJpQEI9
	BMRfIZAjJPTma6Zo5jj8GO+DqIez1y7XmrleNbcB5fOg4CN1RYBzJFUqsbLiFf1r06vX1pWhQe+sj
	yGn9IvOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4g17-00000005rBm-2Aux;
	Tue, 15 Apr 2025 13:07:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fqQ-00000005par-3jMJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:56:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so26428605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 05:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744721813; x=1745326613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
        b=JPkwnPGvGyIrPVL19dDciujSwDctcQz3vfkWxjNqsLaba/EomTmvrwhMn7cNFJ44dn
         6ypOibdnI00TkUniturdEElOZNfusK6jNWiHJYdIpxPEGYc3ZYc7NK/N+2DYWE9Yf2+I
         W/np9kvAg6j5LU/Sld8vi4yy93Ce+OReUVaClXN2Ki1SS+8krdJBHUOg9ZmVp38g7vON
         NQmihIFfVU0ajBzBNFxXnPBWRPTaqQaKmGjZxnBenU/rGEFpqrBAni/AbjQe+irjw9IW
         z7xv1ssgwkQ27tYkV6KoaFgvf85dQj+7WItjgbMYhhorDMzzPdDWdcQYR7dFHbrFVqb6
         0rdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721813; x=1745326613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
        b=sTlIarcEZMPnJGFpY6xrtPWKqIB2THKkrxkWR0vQR5wHK/6d9Nx47kV/QrT3ohoBwZ
         dwE9YfopYpv53cJ96UW4Hxwjqz9/BtDqEbljzlkAZJLKwWS+ExCcG8f4iksXbh+1teeF
         zPzTphLC+giaGz0P502pe7/+vWX8S1VCNK8WRiYDl+L1GY1exg9r6aNBr6/6pQ7kzH8u
         vGeXUNPLMXHc1IIGSlIGAyTsZ4j5wtiz7HlRxvoO2nwtsrQMx8ZiIHogXXQun2OVEwcZ
         6OWtOCTbXIStjMHG3RSFBUqaBh4+hJHWD8xRJdtgAoszWOICEA3XyHMOuax8JIFOqIOe
         r52w==
X-Forwarded-Encrypted: i=1; AJvYcCXy6E4pJqkOAc7SnjPVDAXKqDU95jy+Zt7B0BrmAtk08jFZiwt6hz3sN4zwU5hzBKmIHsxYfk9Mbcbi462nbHrP@lists.infradead.org
X-Gm-Message-State: AOJu0YwFbdVwRvF/OP63VjhLsbFvw/icnaky+gajhlQRNbJG+imXkGF9
	4C53FLiO961eQ1bRPr4BXVrd6G5F+44r+Mll+1+Gbwts+la1Weuf
X-Gm-Gg: ASbGncugGCPdXn1dcfRKdCQ2yynU9JogQv4Td2cxsuvBDJMzEMS6OjOYPVMSQv2XvQn
	2DqBO5h1/42877rG4g6xgBwtDGIKuDlF85K+ubNjBAl1w90Rdj1V1rxKj2ZI2FEQksvhsbCy1vI
	eIaBjXeFPqv2eSKixbg+iGWGurRtrplKgZDibIAP9Fp2nwyIMoA7r7MeoEpm0SIsK2ygO5bz466
	DbuIl9TXj1fT5mr02yiZ8qVjdNUI4dUK688hILEcazmxbGk3p7W23phJtQZ2hpWEpWFprSfXB5I
	BUQfv3P3yeR/XE5ValBYw/1l8pu2XqcuW62MfJuWgCJKGqh78RqRYKlKCU13EcYU
X-Google-Smtp-Source: AGHT+IE0KqK5XyLGhc+pfdESGQ0FrYBws4qU9UQxP3mB+l7Lk+YFfa+Xsv3uUzwSyeT2UvIbstj7vg==
X-Received: by 2002:a05:600c:4704:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-43f3a9af837mr171329065e9.30.1744721813467;
        Tue, 15 Apr 2025 05:56:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:56:52 -0700 (PDT)
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
Subject: [PATCH net-next v6 4/4] MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH glue layer driver
Date: Tue, 15 Apr 2025 13:56:42 +0100
Message-ID: <20250415125642.241427-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_055654_925085_2742756E 
X-CRM114-Status: GOOD (  11.55  )
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


