Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C207C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bmv09nVrxkTx/RCEk8yEB9FeokGQe6GnMpeREDR5iZc=; b=qZFJNujlvEYVoF
	s7xBjK8Rwh0whgghtWBzpifF1/iqbQGSvDpf2YYbpYD2ySo6sEd9QhZPl9/jstsgoUZB6LsFGGbEc
	Iuc9UV6OC2SSWMWCzx1Um8/XbjDXhJlhsKYJFkyr5ppmQP2/183u2KqWOxVhhd4vIp4crcfczFl49
	CRd8/8ObgJdAdZyNqZ5GBdOjFrugHcpUpjXTwom6kUvdfasp9OUfQXrF7hU43+7eS+aRAQXLkbOw3
	fndEg9qg5rMBlwNTNaHsREZaC4aJ5+WmxKxhBv9yF9wFkTcTk9KZE9h7pz5qVW2VzP3ECom9ZQeFK
	sQS3+1WcatFvZ9nyItpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQiN-0000000DbyD-0i3P;
	Fri, 21 Aug 2026 14:59:27 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQiK-0000000Dbx6-3MhF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:59:26 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6a17211b9ecso3142203a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 07:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787324362; x=1787929162; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bmv09nVrxkTx/RCEk8yEB9FeokGQe6GnMpeREDR5iZc=;
        b=dZ1Eo34yKNbXjx6M1mnVGaRQ9JIQWwtPLOBLROlELXwM4AWLU+AO7vfOE4GvHK0rLw
         VFQGxRpmuXj+t9+OzoH2ZhALw8PrKrBvmlpr9a3/uQViL6oc/XQaszHTohdcsoixOTqx
         6+gC2PGgZUx6OX32/syxLQiCUSYQ+OQxIj18mtuJOZmKXCbAP51Zh8ICbRdEOLZDRbvM
         qxKtzAJssYGiEb8pASpBwNzjl25BB9buPKr+lv+VlWrfsahLb4uPAsg0Qma8TdiSEcny
         F5FmvvRfcBpGrPYWm31Vn3HY/n6TM6TrdigE54PfrGuqJujseFWp9mOYkTIioewiH/vC
         0NUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787324362; x=1787929162;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bmv09nVrxkTx/RCEk8yEB9FeokGQe6GnMpeREDR5iZc=;
        b=hX5A6N7ZQF1CThtqTfGZrGj4IwHS+Pbw1YqWJkZuR2BTz/R2cDqgAY0IREveC5p14h
         n4G49hiHD2s4LgJrHsSQCdI1+4YLv6TiYUpi7eBTJxsN00gmKY/FjLINkKV05nG1mmR1
         /zJ+ePxJyPSmwL/KBt0Ov5gMkMvDYLGUe1j2YzUhHt+RNIuL2xelShsDu0gWWyIqKxmJ
         z00yOG4voZq4XjvK6KBneWUgchL0IWLVGS1OeUwmKvRGlT/TLYy0fKVSNdrlYKsbPQZe
         HQ64ivV+WbO2bL4wOM+hbe8FbhVgm1L9tBveMIAgaerbeNXvBQiQqHdINorQZ0uD+DFN
         jB4g==
X-Forwarded-Encrypted: i=1; AHgh+RoP5gVAdlGpZb14I3z60wwx1bqBlCRc75mNSj/GWLz7001eFnMzSygeQ4doSVYgXLRjJtvcjQkYbk6inQ8Nlue1@lists.infradead.org
X-Gm-Message-State: AFuF++kUZ9S/EPywQNTHI1USbkKLrNHzqiKpZFHSLGiJ5XTnStO2T2Sn
	cMdHkXVjAy2Uv1vBE3PvBUMQ3A5AMxrZdX1iyThwndSi0MWbNTnoRLBz
X-Gm-Gg: AR+sD11DbH0rc/xlmAQkE9ejV+64M0ytqDbwS/6+FlHbO65ugLo1R0TqqMEItUR1Fqa
	AaeVuSKNaas/w6tu8C/Jb0GrsyKj02iwiEGRuCHXohodNfjT6/leT935Cf5b/bXg5JeMKu7MNFr
	CRgnWvq+8wU30mlnkHxQgS0HTnUVI6sE8PwjuiumwrIX9+2Id3tZHAxKO+aGgiKSKV2dMy3lVsM
	75QQzHrnHonf+Sa2QKWuHp9Eb1RZbU+L+J74qzH9NKeDGQmnF20nc1ptTYz+iEIp5RssNWQKeRw
	GQv87jD+Nnfg+44kFM2/rOh4ejlLGD4YuRLohOB92G+aBFSxxy2EFK93BgwdirCZa3tpcKY2SFt
	FFfTUWPcRJ011Vwl6pa8BP+PmQKS0v192VEBM4hC/5SHwsBBuuecZRuFXoZVI6Lt6MtTEq4BW4I
	NVYIDs6cuCUc9DPTebMYoaBSUoaXDenRBerwfzGBuFdDYZp7okSTPz8UBHWv+eufhV2+0w9Gd0y
	+7AfEZn0epxTfbeoFIlOt/eVIaqdR10CTWKrfdNcfmHJqqjQtk8BZKHm1D1GqcI1d3O5hR44/8G
	HY4iR0eDuSW0hTQ9XgG+GGxt9KMnOJgJA0a+27jzhUr+Jg22
X-Received: by 2002:a05:6402:321a:b0:69a:a4cb:2882 with SMTP id 4fb4d7f45d1cf-6a42f216beamr8673257a12.9.1787324362464;
        Fri, 21 Aug 2026 07:59:22 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a411971b19sm6577066a12.11.2026.08.21.07.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:59:21 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Subject: [PATCH 0/2] arm64: dts: imx8qm: Add USB HSIC support for Apalis
 iMX8
Date: Fri, 21 Aug 2026 16:58:56 +0200
Message-Id: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALBniGoC/yXMwQrCMAyA4VcZORtYypDqq4iHLs3WiM7ROBmMv
 vuqO36H/9/AJKsYXJsNsnzV9D1V0KkBTmEaBTVWg2vdufWOMMSIYQ5PNdTX6nGxPpky+o4vzI4
 o0gC1nrMMuv7Pt/thW/qH8Oe3g1J2/bdeCHsAAAA=
X-Change-ID: 20260821-add-apalis-imx8-usbhsic-84c9cc211d1f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_075924_880505_333C7E9E 
X-CRM114-Status: GOOD (  10.82  )
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

The Apalis iMX8QM/QP routes the second USB controller in HSIC mode to 
the USB hub on the module. Add the HSIC host description for the 
iMX8QM/QP SoCs and enable the HSIC path for the Apalis iMX8 modules.

The HSIC host node is added in the QM/QP specific dtsi to not conflict 
with the address used by usbotg2 on the iMX8DXL variant. Therefore, it
can't be described in the shared iMX8 conn dtsi.

Tested on Apalis iMX8QM with the Apalis eval board.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Franz Schnyder (2):
      arm64: dts: imx8qm-ss-conn: Add USB HSIC related nodes
      arm64: dts: apalis-imx8: Add USB HSIC support

 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |  6 ++++-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |  6 ++++-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |  6 ++++-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 16 ++++++++++++-
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |  9 ++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  | 26 ++++++++++++++++++++++
 6 files changed, 65 insertions(+), 4 deletions(-)
---
base-commit: eba4724641990bd9975ca10ababe726b6143f0b6
change-id: 20260821-add-apalis-imx8-usbhsic-84c9cc211d1f

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>


