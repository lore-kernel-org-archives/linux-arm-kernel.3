Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DDDCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NKKJA6fRomltCp481BiLWPXK7LT4XBfRN+VIaJM7fMU=; b=XkR3i5V3jzS8vX9qZODLYK2dOO
	Xz5g+7UsONltsNzm8Hwkh95GxF3js9VPNEY6Uh12qTHOSMlrT7qqDeo1+ZTN/s/+AydLkIe569945
	f58zkzV9zvMo+r+7e8g2QytirV9d5QI5I6QP0iLbJm0q/CDgj8fB3kkIXRUU+IZDZu+35tcfMzpkx
	y73yDBW6KEpFJwr9YVqu9neH6EsDcztk9/mxPM3VrLb2S/Y3TdyXSOlwSfKPlvTYlQu99Zvguet+6
	yXlpmCSxs9mtT94mJ6T9EUE12SiepxBRvgJMIZep8bEOQ7btmqkuQW56fcIpVT782FN48+3Kxy5Rg
	mrSQkfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBr7-00000002bRA-0ryK;
	Wed, 29 Oct 2025 19:29:13 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBr4-00000002bOo-2Php
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:29:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b6d402422c2so49206166b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 12:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761766148; x=1762370948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NKKJA6fRomltCp481BiLWPXK7LT4XBfRN+VIaJM7fMU=;
        b=l8thWVW9B7XDqXnt7zqp64xldRDuMee/+M5F/DusgMI/veveLl9Tag54L1S9xoZ5y2
         MQuwo7IEIBKh1ydXTFfguBIg2jZFxV7fRYZjYkK5RUNFCugQZzxRx5v78StYwa4WLO6R
         cVf/KgOYc9B8n+1NKh9AanYw6GUiPCMwSymHf9RA4YL4sVA3dZvXPxrMEeijaV9QANhf
         sktKuc6jOGR7wzFf1lOmmClZ3HvUAZaOq2LL46b/dIaVtoxAd5+gwBE1/6XmNytmcpr6
         OSCss7uHO8janYWxe6Gqy3sm0SSQNlBbEQjFTxwaB4/mc3O24M0bWCfxhhgaBgWiy3g5
         cPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761766148; x=1762370948;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKKJA6fRomltCp481BiLWPXK7LT4XBfRN+VIaJM7fMU=;
        b=SHjkZS0ESWsRYfp0Dio4dp0+S35ekMjLEvv+LSQgXcdyG6xxXic/6ZVceiU5MEqluk
         H6uYMLkWrBD0SclBceaoR/yt8fjI//8w0ZOMlyDd8KWw9wn8ifFVvCYO4tWI1bN4081R
         8F7w7jc+5aCivXI7Elxj6bR1V+pWFicQDdQG01ZcLT+Ij+gcDHMstCNdRo0rgV0vTJ9F
         PYuzMtQ7JqiQOPhiyrp4QWWZupzW4aC05is0x7kU/Lj5frK6bzn4BsEmMlvUMPeJjoOg
         jLGlyDHZUtloQkimaJ7jCnsB3hf2rLl7sq/G9114v0qw6gJ9bHoIuWtc8+3kS0TWvGC0
         Ztuw==
X-Forwarded-Encrypted: i=1; AJvYcCUVnntszxF6dLz2+SvYL6yVXTQdcuM/mBcwtR3atlazXyAeZFEGOLiACQi3YhW3RA8QNtQpc9rw3y3pkTcuKUv1@lists.infradead.org
X-Gm-Message-State: AOJu0YzEXH6uohqfT6WwKIYXtl0llGminJ2L4OtFqq/pmny2vdvUbNp3
	j5Nk5y1Jk/bu8jjdCyBfI5NUFjjua7Q66DpDcx3hG4z7OxPkzvkmtFeG
X-Gm-Gg: ASbGncsS4+S9GozDvu/iv/7tZEbOyCcoE8yl8VskiRJKYVP9zk++ywmXGoMs1BD2Kq6
	oaujvWtwIqojpsfZrnEBwxtNUTR1NRf1Gv5CbFyohcq9Qnk0sFLbNPYK2yH33yZAqAsZj12KfQh
	LxCaIWcMd3r2VTHBsSZ77rMGmjn3bPqaBzDT+8Eim++Z9gCLn0TlJab4UK5IZNPt/LCaiXFpXkN
	BzfPJg3GvsVmVpXZsV1AzmIQxBMNCeHp4hLZCgy7c8dq+s3kci1yO8cLlsVJo0oOqBwrckmYA6f
	0jXxH/LOgroF+sDAUsdaEvqsmJEZQk5FFvpu368OgesnKpZE+8MZUIG0v8KXGJ5L4tE4jo4WLyJ
	3h31rZzQ2osPKN6Qi/4ySGpfy1YYcDfa48ogEPC8feaT0tFnj3zd+M9uWkULfd027LFLqGJGdRG
	lLK8UXXKut6DKmHpjzKZpSrcHDlNVXjlof3CsRS+CznzcJaCIJfR9BSja57JB7fQ==
X-Google-Smtp-Source: AGHT+IEDxtG1HkFG0ON1dBWQF24t0hiWuuyPwYA2hBUikGtOaNbTeVCqCxQo2KWiYZfh50Es8IqNeQ==
X-Received: by 2002:a17:907:9721:b0:b3f:f207:b755 with SMTP id a640c23a62f3a-b7053b2a721mr28389066b.6.1761766148261;
        Wed, 29 Oct 2025 12:29:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548eda6sm1496673266b.75.2025.10.29.12.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:29:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/4] arm64: dts: freescale: imx93-var-som: Align DTS with hardware revision
Date: Wed, 29 Oct 2025 20:28:45 +0100
Message-ID: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_122910_620462_35037FC8 
X-CRM114-Status: UNSURE (   9.55  )
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

This patch series updates the device tree for the VAR-SOM-MX93 to align it
with the latest hardware revision of the module.

The updates include the addition of missing peripherals and devices present
on the current SOM version, namely:
 - WiFi and Bluetooth module (NXP IW611/IW612)
 - PMIC (Dual NXP PCA9541)
 - Audio codec (NXP WM8904)
 - Resistive touch controller (TI ADS7846)

These changes ensure the DTS reflects the real hardware configuration and
enable full support for the mentioned peripherals.

Stefano Radaelli (4):
  arm64: dts: freescale: imx93-var-som: Add WiFi and Bluetooth support
  arm64: dts: freescale: imx93-var-som: Add PMIC support
  arm64: dts: freescale: imx93-var-som: Add support for WM8904 audio
    codec
  arm64: dts: freescale: imx93-var-som: Add support for ADS7846
    touchscreen

 .../boot/dts/freescale/imx93-var-som.dtsi     | 332 +++++++++++++++++-
 1 file changed, 331 insertions(+), 1 deletion(-)


base-commit: e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
prerequisite-patch-id: bfa4df6e3787b415218cd441317fb838824e06c3
-- 
2.43.0


