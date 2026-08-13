Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35329C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 16:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=REc2CNetkw/IR0cYYmcVDcXvVokY9XmMkULq1ud2MQc=; b=SKvV1L5H9Mtwkp8J/5pD3abXNA
	wZkLgTpAAl3UFDWxNUA9/CO3mNFt+fRoHrT6qs4RSYcN/ATcdaRhyLAr1l9v4GeuUS58HmgXfwVRF
	Nb7oN6zurUHuTHdqcZUUpz9yA9mEekC3+Cvo9vGMTzCXhM5zwBxxXvRbkhXwCSze3aw72TY4gzdUL
	kdhacJ9jiWNDURL7o1RVDcZ0MS94giuCmVldt8Xpv8UzKsvPOHa+gz5VEjf81rZGKwadr+6tmsFzV
	vUyI+EEbwNFBXgUdqFvVJ7gBiKhKPFFa0KdIr8ETe6UgBlSQQ/srcYiXl5QacrFeRXMh4i4Y6nSVp
	yvuFUSrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY1L-000000017YS-1Z90;
	Thu, 13 Aug 2026 16:11:07 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuY1J-000000017XM-1Eus
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 16:11:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f633e6058so2491f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 09:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786637463; x=1787242263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=REc2CNetkw/IR0cYYmcVDcXvVokY9XmMkULq1ud2MQc=;
        b=tBomVFRbGHz5LfzxSt6iUtbN1W96PY1uztE4iKXxEhbwjfFwOGd2LY2UAficMN/C5p
         Ks+QbRMrbBySH13oZkyoK2PRQW4a2I/b+zQrTBSKHAY5lrgv5iEiF+dvZLlVDcqL2Hw0
         BHHZNYYXTdRMS84d0GW8QAfMC7ti3SJZnlYK1WUhWWFe9duCZTEGAgejid5wadOmpzP9
         XsmryCuHWdC4fL2bLyLjNF1o5xrvSRlKPfiTmgwR3pSZuchAAapTtDj1A6S+dCkOR+Fk
         zn3UkjgERx5DIQBcmmvfgrBVqzNLQN4Gnd3kpT2fZU0UF6MpI4+wdf2z2swHvZDirJkb
         n8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637463; x=1787242263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REc2CNetkw/IR0cYYmcVDcXvVokY9XmMkULq1ud2MQc=;
        b=LRBmwHq0TxQz1PuR7ug/7Q1ITb9MnuRs3KykfAIGbH5rO/FWGZuRmFqoRNdR/bAAM/
         iAMVFoFpFngp1OX6Le31oK75yuVmLDA3njF8DZaekpHh6Ok1Zy0bRzQ2D6LEMmJwGJ63
         RaMH4PQ+LVbhZiSyF/+uYNggWCqQGY2BrJPThx3AmdmytLrcquOIGf5mWgiQ6xu9pr5e
         s4U19SpjyGFSLmCA/7AG9PdAlgnWzSzztySFPN0Qy5nM3zNKrSOZtnd1CFjvyu2514N+
         RTU3RWGZwteL7xTMCrJ0Utv+3Lx2EbXaIoxNbjb5PWItxbm3EEU0rb87ybjh0w1Mt86K
         ET3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpmwg2pfnIediJOn3pOO2ZnTOzXPL62gC73PcQWshRS1V7E8KHyl783gVuojVrIfTxs+6wNz9BLnlVElogYsGYM@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf+2duNvD708MSfR+OicaZamHsE9CdXJQEGgZ5NkKU7nouaWJS
	ctqheUl4FiP7IqhClcRo+5k5fJ9+FTp9EuEsNQ5/79wGDGz1JTgwZ/ib
X-Gm-Gg: AR+sD10ws6gZb+KUJDxfap5mYUIylBENK8IurAlwDA3cWZweKkJhcuWvD09RgGA7q/0
	S/8nVOUsMrwW4o7ULfU0SsuFHWmA2qcMGyHD9JyefQewRH9/+5Pwz9y4T9yVP6+MX/eKuGfEpsn
	RLvAP8JkoG0Q1v9OOdv4rEkibv5nlZnW2u2dgZuTUUZkEnus8dgU2AEiCZJM/bOh9RYLZn0hzn/
	y4+NDrvwYJc1piXr+5Dekufk/0teNY35i9k9kDXbAX5byxCmhjGaAp6lyghFlG3kUK/9m/lnu0H
	r0YFQoiTFTAEWW1DKgvEg8QNV7jANEO/W7Mchs1AjRx2VwWxcl1cdkmvEkeMLmNf8+YyOpndsxc
	jYvDUoLGlLOukRn4NhD0dskiE3TV+WAtit8hUw+mOSv45fSpexYd6p9kmc7DGGmtWq3LiouWZAP
	4aUwxBX/ulKcXSUVe0kF+yZTYCTRPs6ZltbdBgIv+ayKmztVc5HTEPnYQwYmKF1Air+3LXIYr9o
	vf0
X-Received: by 2002:a5d:5f56:0:b0:461:e27d:5690 with SMTP id ffacd0b85a97d-4815a0414f0mr9891561f8f.26.1786637463204;
        Thu, 13 Aug 2026 09:11:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f21a24esm449409f8f.11.2026.08.13.09.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:11:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v4 0/4] ARM: dts: vf: Iris carrier board for the Colibri VF50 and VF61
Date: Thu, 13 Aug 2026 18:10:57 +0200
Message-ID: <20260813161101.2274327-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_091105_352167_23EA34F0 
X-CRM114-Status: GOOD (  15.96  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

This adds a device tree for the Toradex Iris carrier board carrying the
Vybrid Colibri modules, plus two small preparatory patches for the
module-level dtsi that the i.MX Colibri variants already had.

Everything was tested on a Colibri VF50 on an Iris V1.1 running 6.18.

Changes in v4:
- gpio-line-names packed four per line (Frank Li)
- keep the EXT_IO pin group applied next to the carrier hog group
  instead of overwriting pinctrl-0 in the Iris dtsi, verified in
  pinmux-pins on hardware (Sashiko review)
- enable pwm0/pwm1 like the evaluation board does, so the dts matches
  the commit message; both chips register on hardware (Sashiko review)
- the compatibles keep their hyphens; Krzysztof asked for hyphens in
  every newly introduced compatible in the v2 review

Changes in v3, following Krzysztof's review:
- fold the Iris compatibles into the existing -on-eval enum entries
- use hyphens in the newly introduced compatibles
- drop the fixed 5V regulator that only fed the VBUS regulator
- sent as a fresh thread instead of in reply to v2

Changes in v2:
- add the dt-bindings patch for the new compatibles
- describe the USB host VBUS regulator instead of hogging USBH_PEN

Mehmet Fide (4):
  ARM: dts: vf-colibri: apply the EXT_IO pin group
  ARM: dts: vf-colibri: name the SODIMM gpio lines
  dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
  ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

 .../devicetree/bindings/arm/fsl.yaml          |  12 +-
 arch/arm/boot/dts/nxp/vf/Makefile             |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi | 126 ++++++++++++++++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi      |  56 ++++++++
 .../boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 ++
 .../boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 ++
 6 files changed, 220 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.54.0


