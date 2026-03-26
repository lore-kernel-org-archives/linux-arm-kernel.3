Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C2310A62F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JSjYFvKsYHn3zLdzTw91PXDsC0yngduluZBblgzdeJE=; b=x+TMxg0HoT68IFnaiZvM6zwVFd
	CxsZaVsW5PaelyI14mNkhRdUu4WNQUF7LGHKPLAriqKZeMSE7SMEIEyFMr2BQuVGGMCOYoUjhZKf/
	WjLzVii+v9Ra+84z3gDVaOBgbOKkWUCttjnxqw5mPvb9fjBnQdMrMRM7DYJLEObBc13y8W7dGQK6D
	82UopPcgtOOK2kcDV4Riv06WYJ/WhQvt8S1ln7Ly2Z0uM43xC4jIDb9HQui4Avf5RsbqpgfU6QtTH
	uExpgWgxo0McJEvqdjH2kp++bXz7by2jS3HKc01+3DEHS3GF2te+MwFwNoNHQHGRmtVlXBOooAVhL
	Un5GdbYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lq4-00000005fOT-2pjN;
	Thu, 26 Mar 2026 14:37:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lq3-00000005fNh-0Dog
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:37:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso9541485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535853; x=1775140653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSjYFvKsYHn3zLdzTw91PXDsC0yngduluZBblgzdeJE=;
        b=r4n7z4CxbgIRsFG5yJhD3wvFdUKiVvmm/XP7Dn9oVYrjpCjNZ9MCW2vg6eCi8OOZzl
         zukcFcZQNP2ADooGmO2JewNiE93qbvHA1g1hoz2O/dFsRMavbBD+bRey3tB/Qt4le1wi
         9mQ3xmn1Vk8DM9U8uGoGLUUDvF0s141tt1+M6CqyCxE7FbpeKJGsLzRIZfPMZb9ORFOP
         K8WkfxhvwBtK5xzMc9CpOD2yZhuAFqglVBI+W6L3H9mexw9QksM1rFr32vijJ2/zKC8Z
         njSBeVZw52P5/t/dy7IEf7bjs8X5th7gXO0RlTk1FIr7ydfOP5eJcMvS8LnpFxOpkt2D
         CRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535853; x=1775140653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSjYFvKsYHn3zLdzTw91PXDsC0yngduluZBblgzdeJE=;
        b=flNZOkO8g9gyGdj6X/e6WtepScur7w53upcsbujAK+saj+ZMdG4feAKvwvEi7W3wOX
         kRZiCWwLmLpo0gNBaYWXr7bSbfEuVve5+aKwPbC8Jmh97aNO2UQqs5ZN3qdKuNXZiHnn
         PP32nyWrniTOjpIE0M4d45A6PgB4l6GtRxBPTmw/85vXcVjw7ImqpQZ12ufhEGY1jf1r
         6nK0t7UwmxxtFrdwC+jfv+mQTNKWavNFNVwJy6BekXHxYwJI27FIKjj6jWOPFyAFrDCD
         GN2JMCZCVcQVgxYiWsAc904EXCbxFI91ONf7/HgoHL7Ki1CKJjkEqdygdO51HBZA0gTB
         YEwg==
X-Forwarded-Encrypted: i=1; AJvYcCXFLdtYTVR1Kr7sdZMp0Nf8tGljuoQyn8VJWbxXupmfu6/6I3x9lg/Hw6PTyOv9zBTTmqlw2iYR3r/n0cWJMM2n@lists.infradead.org
X-Gm-Message-State: AOJu0YxU0ULN6G0xKEzP01P28TXqy2u8+CJLrUPTsZWByawGlZEi/y3q
	+3WjUq4LmVuxPH4oMdaXIuWXAMnDyqBtI6UqH8aejDIHh7bo1GQdDn0E
X-Gm-Gg: ATEYQzwJteG14zZ/UIuuUaYMXCYs4AHz2GUdC4Kigr9TqRetHRpNO/AvSaqxft2i6Th
	5pNGsLGRGtA3VHB0alYYZtNzZT0j9RHdxcQ4tQAuLmpbr2HScNbVkTEUSV/K9FfUflvNQYnky5m
	rE/iL7aeGhtCKp+YwFT4cQZsXmOwX/G0FzHtdhWWbPZZ/mAw7QwLZuVSrmHxiOtjCrayuSC8nrr
	+lFcfKbta/aztR4vzLoC+h72trqUsWubNzNxldEBTA3S2xnaiUtWvBKWS13lz0kB7NDny34Jq0N
	2tF8sD52gmb5r81NqjkOWFNcADJT61iExqAM1fyyXXVT8V/LhP1XqO75luCu5HjlgS+K+gHdsMx
	02xWVLqaRfpGrnFu6teKjt4Pn0w0M+qZIVjKbqj1LGKaHi++EF+0LIAK+wNhVWnsSUAO6XP97ve
	DdwUihN0JMJU6hLseZx6nyIKU4R0yfbma8MFYXEixpA3RhQ4BEjuIUEKFcRj1MgV6vOLkox2sX8
	8eBDCk75ThtFxA6oSDux6c2/5owzqWI7QY2AnqhJNBTnZeuigrCY3mpEflSlBY71hij4BO8OaJY
	p42riateb9MF73P1I42U
X-Received: by 2002:a05:600c:c177:b0:487:2e8:69c5 with SMTP id 5b1f17b1804b1-48715fe2aa7mr115405295e9.15.1774535852495;
        Thu, 26 Mar 2026 07:37:32 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb5845sm34024185e9.15.2026.03.26.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:37:31 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v2 0/3] arm64: dts: freescale: imx95-toradex-smarc: Add Bluetooth and SER2
Date: Thu, 26 Mar 2026 15:37:03 +0100
Message-ID: <20260326143711.143462-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_073735_095832_190B6029 
X-CRM114-Status: GOOD (  10.63  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

This patch series adds support for missing interfaces on the Toradex 
SMARC i.MX95 SoM.

It adds:
- SER2 interface
- UART interface for Bluetooth
- WIFI_UART_EN as a gpio-hog to select the UART function by default,  
  as the MAYA-W260 UART signals are shared with the JTAG.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: Remove unused label for wifi-uart-en-hog node
    Add explanation to clarify the safe usage of the GPIO hog
---

Franz Schnyder (3):
  arm64: dts: freescale: imx95-toradex-smarc: Add SER2 interface
  arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on
    lpuart5
  arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for
    WIFI_UART_EN

 .../dts/freescale/imx95-toradex-smarc-dev.dts |  5 +++
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 44 +++++++++++++++++++
 2 files changed, 49 insertions(+)

-- 
2.43.0


