Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344D7D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 21:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nRhxsDSnBcu0kxb3BQ79sAL2tYyaxkbiHw7liK1hHM4=; b=wPLvXZP+LvYx3gv4JD4aEhShiv
	xyYTIy7FgPCOWgYLnuUvge99V7cWF9hT29G1ae88cLP3tYwDk+9w0ZsnRkqn4eVHxfkk1UqeP3h2K
	P3p09n46RBEeX9gpK5Tfit7ITfY+nTuzXZwYTQlACCPjOV7+HSsdxi9cHdYaBJs8PCpjKlF6e8DZ9
	vBmjdOK781cO6WziPxFYONv07rWQ/NldIicLUXab5ME8LPDrJJ5NqTUgVYizGkxGRFNXWvA4wlVmt
	frHWsTkPX4+6Rh+nESI4/je6ssnFpn834gwTego10X0i7f1B+gE4+9Sw3R4UYnf30savppLo2DoNY
	nMDyJ5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUu1X-00000002kzX-06BW;
	Sun, 14 Dec 2025 21:53:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUu1V-00000002kyF-2iEf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 21:53:02 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso10536655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Dec 2025 13:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765749179; x=1766353979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nRhxsDSnBcu0kxb3BQ79sAL2tYyaxkbiHw7liK1hHM4=;
        b=mMdpO8n5o2MI4XrjGRYqROi1QdI3QfJjhKfDH7ec37VPoZncfyPm7Cjvpx2m72ASkf
         /sXQ+zyd/XjxjYJVi9CkCbhqYIRl1FSuhFQSG1cpMG/+M31d5PJm/nEH/+2wCeLesS3u
         m5+OK/XuiSVYr5jug5eoqW9Jm1fcTdRef1DdKhKSAOkConGavEdDiHUeDo733LWFKlew
         BHx+YpYKTc+3B7O8Dlp2Ij2aSClCelzRaYGOedhu0T3x/hvqjmJSsZdNp/S//U452mVU
         LWIKurLIHj3DPgZvEGUVjgHlvJAlLRHULAbqqVSKE1ys9Llf4cqPNgXWNrurNGuDfecO
         IZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765749179; x=1766353979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRhxsDSnBcu0kxb3BQ79sAL2tYyaxkbiHw7liK1hHM4=;
        b=T5RD6GoOZWIXXsshjaHfrfL01f1hMoZ0GhpS8nLAoqCqgsUPqIw4ZFhJbuC5CRDOCr
         Mo7JRQQMoXejtPZk024Z23SMNsEKE6QmUJDbnZAxP3mDTHO90sj0wCjKZiPIlKHLTiSP
         vynWO24jtNhdl4R+WGEXQunYLQAdu1DcqyznhopkOkoXtPjp1MD7sp/CDmwCVtYuphgv
         BolQ+AEjYcwzNk107i8XPSxVAASmcGrSf5Vz2sBkg4+pzd3Sm1wQYbLkmmJNte3oibil
         W/2pHDDYH3EAyX2xldvp3c/LB1Oi44lB1+yYDzu9sKGRrGF9BfcfpERfsoNsbx7ytqQy
         ubXw==
X-Forwarded-Encrypted: i=1; AJvYcCUKnulxikcU8irlVX+CRxhcG8v4FB5eqGuPqUhFva/cC6XUFVxRqXmTUoXG2yqvCdGcAWYHOJj2nWet8LFpuV48@lists.infradead.org
X-Gm-Message-State: AOJu0YyK8NAZKWC6RejnI9a1aG6IE2Cx/k9QbV8l1LyB9BtFcaJ2NEI4
	364UvQDaiBBAG4HN7CN0VdnYLaF4SSBKjHe+29vexGZfKuCZXYqf74be
X-Gm-Gg: AY/fxX7C9uPPraLzBH+nb5Q8pGPRlrPZ9UdtQ7nkdIIfiNraSY064YeCbrfQTgtQBO/
	2JNKBitOLuN7EtR4dCnrTDCPTbBPOg2AKRKkajheqPe9J0QV8YiWt0Cc59oaIrXk9q44TD0k7dR
	6HtVv6IxmjMMtAktiypwZbeoYFL3pYOc1EZHHD4LEBnqZJjFKQlaCq7XzBTLrLlBchgBN4cn2OO
	6GdQ3Fh9aQ2FQMzCNQiRUpfOfpRFbmRXIhyWQxbXYPwpnwb2bRV+qD3xnGHlOJFk/cjWZ0O3Iko
	qYf13u8DeHveTOHERJhEijbhxGbU/zc6ht/tBARvM+5MkOhllTs9YI/UW5pN9Egv24HfA2xtpTP
	MvCDx81iCScW7A2vVlS93q9lIIVgiUA8gyE02hEph31JPO+afjvWpOQrUVcIMlxfSTUWfQWfB1D
	pcCqN6izRR6FFsC4dFGYzb8RdnaQhArHUvaEjdNt280/4KJ5PKAcjCcO91hAlMUnbwEwqbFIYYZ
	/pokmaArrIA6wE=
X-Google-Smtp-Source: AGHT+IGVF+JuPVqrMiFOoXCrZyreYbmCiKRs6E7j6+fCdSvfmBW907Gqxw2wCR/3a2VIVjaT/n59HQ==
X-Received: by 2002:a05:600c:45c9:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-47a8f90c516mr92963995e9.27.1765749179466;
        Sun, 14 Dec 2025 13:52:59 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f6a42c8csm7625568f8f.16.2025.12.14.13.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:52:59 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/6] arm64: dts: imx8mp-var-som: align DTS with hardware revision
Date: Sun, 14 Dec 2025 22:52:47 +0100
Message-ID: <20251214215256.5812-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_135301_701130_E483AA87 
X-CRM114-Status: GOOD (  10.46  )
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

This patch series aligns the VAR-SOM-MX8MP device tree with the actual
hardware populated on the System-on-Module, and separates SOM-specific
descriptions from carrier-board-specific ones.

The first three patches move the USDHC2 interface, the PCA9534 GPIO
expander, and the UART2 debug console out of the SOM dtsi, as these
components are not present on the VAR-SOM-MX8MP module itself and are
instead routed on the Symphony carrier board. Their descriptions are
therefore provided in the carrier board DTS, keeping the SOM device
tree limited to on-module hardware.

The remaining patches add support for peripherals that are populated
on the SOM and commonly used across designs, including WiFi/Bluetooth
connectivity, the WM8904 audio codec, and the ADS7846 touchscreen
controller.

Overall, this series ensures a clear separation between SOM and carrier
board responsibilities in the device tree, avoids describing
non-existent hardware on the module, and enables key on-module
features.

v4:
 - Change touchscreen label and compatible string to "ti,tsc2046" to
   better match hardware revision
v3:
 - Remove unnecessary status property
v2:
 - Move deleted nodes from SOM dts to Symphony carrier board

Stefano Radaelli (6):
  arm64: dts: imx8mp-var-som: Move USDHC2 support to Symphony carrier
  arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony
    carrier
  arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
  arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
  arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
  arm64: dts: imx8mp-var-som: Add support for TSC2046 touchscreen

 .../dts/freescale/imx8mp-var-som-symphony.dts | 145 ++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 331 +++++++++++-------
 2 files changed, 355 insertions(+), 121 deletions(-)


base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
-- 
2.47.3


