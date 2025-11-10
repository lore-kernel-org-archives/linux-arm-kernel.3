Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3121CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 11:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6+JY7AOKey3FDjj6FvnrDJHIL5n0tWzWiuTW9DK4ln0=; b=eMSZWcnTERvljU9V00do/rAYHf
	Q/ZJn34ihtMRjFhIfVgjoqJEhnflu8lNF+B5vkmcZPuFJYEEg4oNLT1fvo1QKpMgY5TYuilXG71Uv
	8qMinylEc0Eup0bHRqJ08ex/Wk9hLp2SrtTAZOjlpv53GWSlUTguGeW4HOz24pVqfWVgmtSNj1rMc
	e9FqW+GjiDYg8QyG5f73/qhAh2VuCvfrXTB5kD/Gz5EYLOHTlOKJdEDcP0lnKhlSnBjpC2208bWxc
	X+GiZO0MrpT1VHoBH8ComiVG0gtY3bBwq/Bibqpt0cR4LEbl+hPryLTTsRL1lWJt/ARjJ44mEqpGO
	PqQ0ZT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQPz-00000005M6w-3Qbf;
	Mon, 10 Nov 2025 11:50:43 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQPs-00000005M3X-2YOA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 11:50:40 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=6+JY7AOKey3FDjj6FvnrDJHIL5n0tWzWiuTW9DK4ln0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1762775420;
 b=Y8Vie9no4FdeymuAPdSRHeaV6nNgis23QIDIokVy11XtZbCf3M/7YxKGcfxSKesSCN2CQdUZ
 MFNtzR0uONkcY2dDiv6sQ61sYWsyHLyx0Z4UnrZSt2atqIkUstst8YmK5qpCAxUAR3ZBdtRzQhg
 9wzsDJYPga/BOo99G2TtnQdwlvxKxbpRVreIx3nOb722o+WJqGhmpzaDq4VWbyFe0nxpEfDucSD
 q2MpKkl959g/w+gh6sohwz8WQrwVtPmmVE/5/qexnWuA3G9w5PlwME4Tl1aM3TEu+0f2QnIRdaN
 +vP73X73XF6az/O2nPWUptu6BEihDQXdbjokaXV/Jq7Hw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1762775420;
 b=TVNWq5RqPqPL+6kwUPn/O5O52pItpZTKZ8Jvi0d8hPQ7LTJiQ0J1r+U9Rz1yfSm0+igCtHy9
 lrJdHknzCE7GMuEWdZscTr5/oOVW10l9lVcVKUt9DJ/Pc/g2USIUJ+U3noulGBDbovYGNvA7r52
 Jy5Uqf8tkL8g0k9o/VQ0lWdqS0RVLWYk9DcqKbvHQ8OE9An1J1NUX53t2kb+9pDEu5I7ePNAfkK
 aTpryuSI4tAUR28+CSR5ikchGWRvcSt8u+z2JM1t8gTwAzmty9KeIoqv5MBydPpgl8A+PJqdkN0
 ZyiXtcXWjbfaiJJW1cmnobIV2Lzc0klAMFnL23BupEOag==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Mon, 10 Nov 2025 12:50:19 +0100
Received: from schifferm-ubuntu.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8EFB1A41305;
	Mon, 10 Nov 2025 12:50:05 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH v4 0/2] TQ-Systems TQMa62xx SoM and MBa62xx board
Date: Mon, 10 Nov 2025 12:49:44 +0100
Message-ID: <cover.1762775119.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4d4nz22xmnz1kNh54
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 1af9115dd2db95f7ea9e58f71e1f2d89
X-cloud-security: scantime:1.819
DKIM-Signature: a=rsa-sha256;
 bh=6+JY7AOKey3FDjj6FvnrDJHIL5n0tWzWiuTW9DK4ln0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1762775419; v=1;
 b=Sg/JNvkIvUOKBkUEvc1BmYH+MkQJMFMgzZakQLzP7AvAua2QP53uytElPqH1iTG2cfX+KEbn
 P0zAVYtBEZVuv2jgN7093hKCELbjgMmrCCij7ffQm0r/EqlM4DBpH46q4Ws5HiDZqYpmOtuDZ3l
 UMl4ccBiDBQ+Q5m30Y3m4l0yJg/GdPncxX0wczli6cGzb8f9DqCPgywZfbbakctlInwPmPRooQB
 SOHwWYwXWVOA7OZ/TnTQoMQ1Rrje3OlS5i0vRt/1muKM7d+LiJROsRtGmIq+RLrMx/e4BO2O1FS
 aW01daClnWaaPuvLAZGZUxMByN9VIYXBiz2HVw45rO78A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_035037_005587_5DF8E51A 
X-CRM114-Status: GOOD (  15.07  )
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

This adds Device Trees for our AM62x-based SoM TQMa62xx and its
reference carrier board MBa62xx.

Not yet included are overlays to enable LVDS display output and MIPI-CSI
camera input.

Changes in v4:
- Rebase onto latest ti-k3-dts-next
- Reorder boot phase tags after other standard DT properties
- Add missing supply regulators in SPI-NOR flash and USB hub
- Set status = "okay" in &cpsw3g, as it is disabled in k3-am62-main.dtsi
  now
- Add disabled 1400MHz OPP entry (will be enabled by bootloader if
  supported by PMIC configuration)
- Update copyright years in new files

Changes in v3:
- Rebased onto ti-k3-dt-for-v6.18
- 3 of the 5 patches in v2 have been applied already and are dropped
- Include k3-am62-ti-ipc-firmware.dtsi, drop now redundant configuration
- Change node name for MCU reserved memory to 'memory'
- Use rgmii-id PHY mode
- Drop now redundant ti,rx-internal-delay
- Update simple-audio-card,name to match other TQ SOMs with compatible
  configuration
- Reference dss_pins in dss node (actual display support will be added
  in a follow-up patch series)
- Consistently use GPIO_ACTIVE_HIGH define
- Drop unneeded usb0 quirk flags
- Add boot phase tags

Changes in v2:
- Collected acks and reviews
- Rebased onto v6.13-rc1

Matthias Schiffer (2):
  dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM
    family and carrier board
  arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier board
    Device Trees

 .../devicetree/bindings/arm/ti/k3.yaml        |   7 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts | 930 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi | 331 +++++++
 4 files changed, 1269 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

