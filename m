Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A1BC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CrlZYOE4Tb+zUOHoD48b//tG3mcCRvsKdsWOXCdCJnk=; b=KgbVdx6fom4v+3Wo2f3Q56eygH
	XOiQHiyFpe4XjBIUvgvlEJ4ha8/aUE6V3yI0LNKmVzjz/4FThqI9OZWD+QOC9EndLlaVbq+nnYH6d
	pVLxS8vif9bA/TdRzS4ZQq42+ertd4l/FbOMc2BItKx41wOGMUlE4DRh7ro65Uov1hzt4SBkjsKE/
	eGRD8krJYz2Nqz9wNY2WafYhx9iUh9ckFzOzENTP4+fzUCRRot/iUt0iwO9fMPmMQjDKp19p0g1BU
	CxvEWu0QPY4xNR+T2lxsIXB+qu75GpslJ3U5Qq+7uD3+3VJJaMhjw7HwPWnoaBA17sDtP0JbuvCqk
	6xbBKMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KYN-0000000Ce1T-0Byl;
	Thu, 17 Sep 2026 22:26:03 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KYL-0000000Ce0t-0HaK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:26:02 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so1607365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683959; x=1790288759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrlZYOE4Tb+zUOHoD48b//tG3mcCRvsKdsWOXCdCJnk=;
        b=j/6GhCnvwru1QbXv+1opFASNPWeaXXOvx08MOHNTwthJ0A4WeoO/9/YQrq/OnO6hDW
         Ya/XP7A96Y1o4N1m8IK907VOkL4MHO6JQH2EgW2Zk/gOpaoR4guxozepxj0nTyYlMGPH
         A+o9PnOvdpz4Q6+/M4QE0iHytKys0u6wenGMHwKCoIAmxrzXNr7d3+zdUdAyxIHeY0su
         BXAfsHwdj8DWhdRb0nW0hp1n6Nf+siM3P/KomeHVKB2PT/RLnaCj0b8BCuu48hX2yuSX
         VXMc4JF5s1aNJaaOLblnqgOjdjdAeGptRvfoLdz0MkFdLO3slu63OKOn/lwHvnXqAFZx
         JjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683959; x=1790288759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrlZYOE4Tb+zUOHoD48b//tG3mcCRvsKdsWOXCdCJnk=;
        b=Oqe1VaudFQNXKNau/2njlmUDZLuyv9TZTUJAY3LQrlSN+28Xb/KBs+EGFDNPIB9+8q
         tVnBMDAhj70CS0ZOUibIurMI9bVaODIobtr7FvDCh8LdPz+Uio33omDg7ifhpb8KTpds
         0d6LTQlBreTo3TilrDzHTpRNm7stX7phnE16PSf81YOe6LfmvBAFMYe05U6QY7gVdSnR
         czVIkG/6nW+saqdNFzix2nW4e6shP3bTeN5v4ZtWRMkiFmkJxQppvzjeGv9GblVcF4tF
         kQ3bU05Jp2yg/+FRWMOh/vUdVOd16EX5Ny6Oe9+JIlLH6giAyTyADPcE7AI2vvfIn5U3
         92uQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoJ5sHAFp8jEslU5LtF0Dst+vm3fqFCIta6gvECZLz9ZUKGtktzQDuxs5iFxIcZ83W2u0x5CQO8o3iTOISzSkz@lists.infradead.org
X-Gm-Message-State: AFuF++kkxXnAEsFw/n7A3MpnNzVWr7/dfH2pZQHhoHjXIPV3/d70Lkak
	TR3cwfIzgayu7KPKntGuTlTD0LxAvC5vwfPa4n3N6Hn7pL7zfk9NijIr
X-Gm-Gg: AYBFou03YWGTGQ+x1rHds2+yInOMS8T1IJrY4cfqNF/kaN3PRPr96CIBC0hWMcL3lEo
	Ljpag4MVa2Xd5llC6IPylMMigznYVyofrVYFXPiSHSmmpyKKK3saDMg06k8UxfnRt0/nnAQpqIt
	GH9TcqSQAj9zverqfVSyrMZsXEHkcGCQcNQJ12LmStmeJ0O5VtBOWMEZR69vT1uW59HwV1IlFaB
	SjgT2EUzFfv2Sx5ufLchRdS8mR/7z5FThWTjfvCuF1QOxYJxdYmbuf4rfEJ0y5FFqlaWmaq8W2y
	4nmBc3tdIoXj/PohyrjLQmeM13X9lnVVyphuEsqYYghD68VRaLlREzNFn9bcgRkB+5l2Z2goXll
	vEMvrULXALgX6iq8YupTQLlMAIQyEcFk/UlcBrs5PymVwbAsuySu+QUHtnWefJLgIgcqy1+QRtU
	7Ec5dyO3R36Vp2IX9Y4u5QSTm6EyGq8NCmfo4YwavCbBvIEClsz1CdYD4eqysJyKzYujxy4970G
	bCloRDZINohpC55H81Q0wlIh5AKbWBOzn9qt8F8qBTVTE0ZsKOgtLdktPHQk6Y1skKDtC/0DUUP
	KWVkxWydMjNZoZpgLQQodQ==
X-Received: by 2002:a05:600c:3b17:b0:49c:fc6e:8cae with SMTP id 5b1f17b1804b1-49fc5737b80mr3154795e9.18.1789683958822;
        Thu, 17 Sep 2026 15:25:58 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:25:57 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: imx8mm-var-dart: update SoM support
Date: Fri, 18 Sep 2026 00:25:42 +0200
Message-ID: <cover.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_152601_108917_E97367B1 
X-CRM114-Status: UNSURE (   8.93  )
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

This series updates the Variscite DART-MX8M-MINI SoM device tree to
better reflect the currently supported hardware configuration.

The changes configure SAI3 in synchronous RX mode, add TPM support,
and increase the Ethernet PHY reset deassert delay to improve PHY
detection reliability.

v2->v3:
 - Fixed reset-gpio polarity

v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

Stefano Radaelli (3):
  arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
  arm64: dts: imx8mm-var-dart: add TPM support
  arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)


base-commit: 46d8fa682d263271f3ef7bf95166b124c19d6c62
-- 
2.47.3


