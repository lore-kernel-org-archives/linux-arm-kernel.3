Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4042D132A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UuICAiXjI2F2FZ7Bp8hHTJ3HSlAaQYfbOcnrt69ITL0=; b=Coyo35QwW2QRiqHT/S8RU4LutV
	tzYIs/J+QUpnuAX9MWkccgynOUh6Zao3zymkbL9Z74QjM3dt/HkQyvdjimosTKXOaQMZ8abSopvbB
	f0ySISfsCShK/MWQr+O4gEuaQ+lxJDhC0bnNf7bPzN2cojHLgauCjSEvGtOIYzqAhSuMvsquT/u8p
	Nq+uv0vDDKACU+1Yc+qiZNl2UXNKJ1belPctQDOagT/BumZhwNxrpD0F9c8g3MAuoGlY4LAiEhxjd
	Q2Vs21hsyQQnbd5lCrsDAJy/RTKoL9Xxaoujhj4XCzYCI6wN/Bwl1c42/GqjhTpL/1N7WkNGBpz1O
	0mRJE1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7trY-0000000DEuT-0C6h;
	Mon, 04 Nov 2024 09:59:08 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7thW-0000000DD9K-0Hd1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730713726; x=1762249726;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UuICAiXjI2F2FZ7Bp8hHTJ3HSlAaQYfbOcnrt69ITL0=;
  b=h4eZtMCUnvmSLgA2UmLJknDHUNtj8o5G8/gIMsfBYh0SyyxuFMZddc4R
   shkWDrB6eLF6s7gLm9blwvLGq0ztLoNYXQvHIL0Q2w1z4tT4kSEZaQZI9
   tK4piTxdbDN1F+RLjPb8dAQE7nD62Ii3/TOiBaoAwK5RUMQlrbseQfwz/
   3vF3Dp0EGFAWTClRu0v1ZaPVacVPkByI1PeMWmOTAvWzOU08hBF8nRt/C
   yDXzsCbqP4m6cBENwhSIHy2kiaLCJa4tuWpLXyb0+jMiAPFnCvu/hDDqA
   7LBSvMdd8RYVoiVHeu52+BR0nEUuY3+uOqnRP1YTsxVc+V3iIbFFjMBvz
   g==;
X-CSE-ConnectionGUID: AX9g3WdTRRmwfGWeP6AMEg==
X-CSE-MsgGUID: l8qAhk0iS3eaSMyVNSAXJw==
X-IronPort-AV: E=Sophos;i="6.11,256,1725314400"; 
   d="scan'208";a="39827136"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Nov 2024 10:48:42 +0100
X-CheckPoint: {67289879-37-90CD5875-E0265C0B}
X-MAIL-CPID: 52AC217FE19ABC40E7F5504158A6E480_3
X-Control-Analysis: str=0001.0A682F1E.6728987A.0059,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B0F8168150;
	Mon,  4 Nov 2024 10:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730713717;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=UuICAiXjI2F2FZ7Bp8hHTJ3HSlAaQYfbOcnrt69ITL0=;
	b=dJ+HnWEW+KL3hZnB+0WamBID6ucVTyS01r63sBMeXhF16iLb60oDKT0/rsnOa5IgM2dBLt
	rS8XKKA2y2QOQZ59WO0mb++iJTqSQva+HmHG2Mm9WpiFFAEag72VdX2l8s7wUU+k4lBvA7
	Np5fFfEblAUW27tdAKP4h6xos5QWIeq+DBHWN6rtc8DTfIGbiNAmlsrRzmeJ0k9472QQhH
	0ShCiFB+H5c0tjNtdmQ3MDR9NmaAZ5KI/a9Ng9AAXalBv34j9Gy61JRoGk8UTkAS0xqhZU
	LDQPQzKtR6iuANDKrLO+GNA2++8tcxb9e4xUeUNMn5RXF9IuFddx3NAZHafYEA==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 0/5] TQ-Systems TQMa62xx SoM and MBa62xx board
Date: Mon,  4 Nov 2024 10:47:23 +0100
Message-ID: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_014846_635340_2F4A468A 
X-CRM114-Status: GOOD (  12.61  )
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

This adds Device Trees for out AM62x-based SoM TQMa62xx and its
reference carrier board MBa62xx.

Two of the patches are adapted from the TI vendor repo ti-linux-kernel to
add RemoteProc/RPMsg support for the R5F core. A similar patch has been
submitted for mainline by TI themselves for the closely related AM62A SoC.

Not yet included are overlays to enable LVDS display output and MIPI-CSI
camera input.

Devarsh Thakkar (1):
  arm64: dts: ti: k3-am62: Add DM R5 ranges in cbass

Hari Nagalla (1):
  arm64: dts: ti: k3-am62-wakeup: Add R5F device node

Matthias Schiffer (3):
  dt-bindings: usb: dwc3: Allow connector in USB controller node
  dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM
    family and carrier board
  arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier board
    Device Trees

 .../devicetree/bindings/arm/ti/k3.yaml        |   7 +
 .../devicetree/bindings/usb/snps,dwc3.yaml    |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    |  24 +
 arch/arm64/boot/dts/ti/k3-am62.dtsi           |   8 +-
 .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts | 917 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi | 346 +++++++
 7 files changed, 1307 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


