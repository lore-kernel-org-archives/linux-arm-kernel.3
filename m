Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75A9C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 13:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QuSzMUX3wHghxJbKlKNyZysFBPZJv5OM61rjXeShdRQ=; b=2LPKeWNf5i1pLCN0etqwU0Ga3m
	wa/wv4ioFBJXeKDMj+TxaXCM2+ChCN82aOAjdNEhMVn1QI3e6cb4Vhpl+ob7C01Ht/qPwnGk+eujO
	GHQmVHI+gDgM7uSffHnMVCFYeUT+8hbMKZX2c8oLM1ml8TBC1bHfXDGpzUCNbhruq+Oa6erbxed7G
	tH8SzzaD8XyNqP+bqkSfi6yl7KuVpRil8MEXz7CoPYqO+sPdjvWL0rmQw+NZxBClN6DvUkJzM9SUf
	ohfJcrl/ydLzQltjfcKJvgbp7O2yUIE7kpVIKdvi9g+FQDbO9NX4JhTZpORWf9ia8JLQmyOPK6UqG
	SyvmsCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8qg-00000005W5Y-2Ye6;
	Tue, 08 Jul 2025 13:59:06 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ8mP-00000005VO7-418e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 13:54:43 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ae3a604b43bso680926366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 06:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751982880; x=1752587680; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QuSzMUX3wHghxJbKlKNyZysFBPZJv5OM61rjXeShdRQ=;
        b=QrXQH2vE+J3hOTZ8GJlJsqqYAgRn8HCLIYgmP3O1kxY6kxUIr+MtzpsXPZaVI9c/j9
         MqfS3K+mynjRCcinsANM0cs2nchpoJ2GKgU0Api3t9tqSY+kQj5FiIHt0oxlhEW/lY7A
         3G9vZIHPYpMsIDpngIcDYYXHdhvJgQ3k8wJpTSuJgWG4jQ7VfHCsgOClLMj8EMndO+M6
         91rh/BW+fTSLwpXw8bDMHfZJmwSVDTbm5XyU0LhTQlZ84libC15hJUCXnxAYXJwrjWVA
         Z7CrTTNA4mjcoK0v6acSmr1dDXVvqLRCTNdMVH+lh5ml12Rw7U1G04a0NZxBgwNGI1FA
         3Q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751982880; x=1752587680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuSzMUX3wHghxJbKlKNyZysFBPZJv5OM61rjXeShdRQ=;
        b=hmWPz+YkvvCCnXDm8+AXdrlsw2f+6peE7KOivWU2UtWEWxY63ffIZzAXIk8w0oM57I
         OOkYvjm3HGvJug6e2Bw+PoDrC1WPA90IR82+OcrQ+jIBm+jVL1NhZR20Rn08w3ApD1WX
         pG6N41MOqfSJl11HfiDVbVWIhoY+5iY3+cr2wLYUY/6cj/Ot4AEWCTVFqCXFg9RRdmtz
         hrfvx/NaMkDIrKDa+BPJIgH2HUhQy9l0Sqp7e73GmAkqgXklID64HMgg6CQBLlX65QIE
         oZNtAL1h3MOZ4WiUmENS1TubmOPzy+dZjOfhpGkO8xWMUNgO+r8r0uUCzJ+Fr0smFVLZ
         88zg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1W5drCX4GeSm0eKkoF4qyl/j0SvVomekyrjKyljzZYW11jQTaKd8EsriejSRfI6DBlk5ZPMC1eqDo44Su+TF@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxr3Xl1FYzqP1tYipZ2Aa8MDAdsaJU7M6/ctM96kQwN1nxfEUd
	3ndOO8F0luOeo/5EOzoWuot0uZI3a6W9hZaflp+ZJH5YRHsdFS/roXxN
X-Gm-Gg: ASbGncvFAUY/2ZJJvMYIRFNs6sVicpiSRO63sJrVr6lP5Vbf4FBOQzOHronZ0OaHjK0
	Ylr/DXJMvbXI3ycuGM9f4OATgyT8dLtL6PNsTyCGwOMr4NZOqZ5w1UXl8IRCWXTN8u5xuPlc2C+
	613R7mOY7B8EcLhZA1Pk2vIe6nXMsv9Au4iLbr0P3YyROgFwbNbodAU5nf/lKvE2mKeEj0v/oaN
	WFXKZkiyrT0vu6oThpcjHeRRJCo25WUDQYpqz4AGwkqR3ivZAkBQYbPOItuEqVy9EiZKZWYARjG
	Dn2Vnj5RL+94e2XyliamzAX6OMd2Bs0o9okT5SbqSP3n2SxuFjQqLWQVG4XS1fNrF0LP7HyJDf0
	oGSIN4N2ig3vbOK9KwGvMGfoBQ1ToLh2GuHxONnvRbygLd36Qs2wPFngT40uVf+Tp
X-Google-Smtp-Source: AGHT+IEg8FYXr6keG6fLz0S3lPAROXenPPWH4ugJsZlSnOifah2zO//skjGha+hpIpCH4Ky47GCywA==
X-Received: by 2002:a17:907:2dab:b0:ae3:62cb:7654 with SMTP id a640c23a62f3a-ae3fbc54c72mr2019958866b.17.1751982879591;
        Tue, 08 Jul 2025 06:54:39 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac6641sm910431066b.99.2025.07.08.06.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 06:54:39 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx8mp-toradex-smarc: remove gpio-hog on lvds_dsi_sel
Date: Tue,  8 Jul 2025 15:51:40 +0200
Message-ID: <20250708135300.2855155-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_065441_992971_F7E29749 
X-CRM114-Status: GOOD (  12.32  )
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

From: Max Krummenacher <max.krummenacher@toradex.com>

The LVDS_DSI_SEL does not leave the SoM, so do its pinmuxing on the SoM dtsi and don't
leave that to a carrier board dts file.

Using a pull down on the LVDS_DSI_SEL signal is enough to have the signal not floating
and have the SoM in a defined state.
Thus remove the gpio-hog used on the line and leave this to carrier board dts files or
overlays to use the signal as needed.


Max Krummenacher (2):
  arm64: dts: freescale: imx8mp-toradex-smarc: fix lvds dsi mux gpio
  arm64: dts: freescale: imx8mp-toradex-smarc: remove gpio hog

 .../boot/dts/freescale/imx8mp-toradex-smarc-dev.dts    |  5 -----
 .../arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 10 ++--------
 2 files changed, 2 insertions(+), 13 deletions(-)

-- 
2.42.0


