Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EA2C56203
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 14:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BB7YXaZxdMr/OyB4DMLiNUgJ/jOy4ltGcN2VfVrivUs=; b=2KQ2t4YJlX14lOncRxt8+o0uN+
	A1P11/XPEpI/5JDHgtOPv2U5dwwC2SXSQFMkcLykTnXFIdpO8WeF/endiLFKVv+kkOwmcq45DXt1i
	OgRN12ncLWrLDTwdzTqjpV8/NYVebduVZsi7os3RMSfzudNqrsozjXMvog4TuPz6KekyfDTJuFWAF
	v5EE6DNxHzC4goFFO1VJO2qMDxvZneT4FoSHqQy/jasT71rg/zR7xCGz7Srjxbv6fNNqQ6NJPQS8+
	oY4yOI/oLzNfNy//s9uLCJwu8AXq+ztIg1ZX45miFRKaIRqi0fa5YGa7F8tzJ8/2Cq5y9UMmEOlI9
	sTfcurGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRXl-0000000Ep9D-2HAU;
	Fri, 20 Feb 2026 14:31:45 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtRXh-0000000Ep3X-25iT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 14:31:42 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=BB7YXaZxdMr/OyB4DMLiNUgJ/jOy4ltGcN2VfVrivUs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597888;
 b=K0BcTOg16Xtqdpy+nIo763IjdZ/Xm2MnAcEHzKIPVDs2vk374rcu0pkRRjlZTpE7PO50+OTr
 aGBGpgT20OIOOiiySAHc+WH/Ng9W/4RH1ldLahbZWE8pgpgpmX59ny8eVfos9x9/Te6z0HkLpu/
 4DHJ/vnUHkJc4nu637dPH9S6d7MFb2szJmgZNgk8qR2UW+kr15IDso7Auq8BoBfMzs/hKPsPF2Q
 YqPJqkJ1+9Dkh2IDFyP3sYJbs8q/P1DRcbTah7dvYBU4/Pvu21JkpF82+lsHJFxh7mezTu62aKB
 cea7BLeuQ86VzuA4S7IEMj/UsLQJQxVbTe1Knx0mVL/8Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597888;
 b=bKncYozVOH+nUK64EHachpFKPEQN4YUK+NMm2VHUduh8xtxKA+snW4EFbTv2Gmi0LBNi5iLg
 gwqf+CziAVM4U3oyd52dXdEjW/HB09QFxqxcUQ6Yh5bIXrEklQaaNk6+dYaJjFIO6AX9FTpTsMQ
 Ttk8Tudp6pMK9GQZdPDakWxqaJYXw5gOFnC9kAUSXkrerVPekoZ6dfkcyfSldFe0WqZ61p79Cer
 giXGciS0K62A/Xt/l6L9zT/ij1U907pl6gT2eRRiDZQS7YOs5jOiPn1TTnFxqL3/iBHfdPnAVeJ
 LgrWX5hJaoZfwqkv6FF/NSVAk3dZNBrSZcK494QGWERDA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:31:27 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C44FA22059B;
	Fri, 20 Feb 2026 15:31:09 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] ARM: dts: TQMa6UL: modify for use in bootloaders
Date: Fri, 20 Feb 2026 15:31:01 +0100
Message-ID: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4fHXjp3cjnz4MJhF
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: b1566e3922d347dbabbbefc880e0b021
X-cloud-security: scantime:2.493
DKIM-Signature: a=rsa-sha256;
 bh=BB7YXaZxdMr/OyB4DMLiNUgJ/jOy4ltGcN2VfVrivUs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597887; v=1;
 b=BSErYJohTAivadnib1xB8jXrYFskyOweeH1MH5DtX3RPyWr9kFiqWp4+oVtZCYCXrcXFAJjG
 pO+pMJ6P1p5XIEACL5mq6vWmLQ3QgAHc8yc9NJFtvfVNpbSkXCgtfIrtExkHLOY1OpBBFtsmSh/
 fcnf0eOaLzaKw595c4qyCZZyFunGSl+zDsMCA4xZEDl8bKHkn5U+yB1FGsfEIXO76RaJrJ6bqCu
 RwlpViFuYoeUTpZdmVsy0kJ1K/saOTIjK1p8+dbZn5XDvMx9ywyI6l7iOEv8ghW1AFTSCYUxSNe
 2jEtVxqlmt6DWhSrL8fEEmRYBRrYWBAMbLQdIK6tlzNLw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_063141_690997_7E163B3D 
X-CRM114-Status: GOOD (  10.72  )
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

This series contains modifications for using Linux device trees
in bootloaders. Changes from U-Boot bootloader are incorporated
directly into the Linux device trees.

Changes in v2:
Improved commit messages for commits that add boot-phase properties.
Add forgotten boot property for the spba-bus in imx6ul.dtsi.

Max Merchel (4):
  ARM: dts: imx6ul/imx6ull: add boot phase properties
  ARM: dts: imx6ul[l]-tqma6ul[l]: add boot phase properties
  ARM: dts: mba6ulx: add boot phase properties
  ARM: dts: tqma6ul[l]: correct spelling of TQ-Systems

 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi   | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi         |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi        |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi                  |  7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi       |  1 +
 .../boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi      |  3 ++-
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi                 |  1 +
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi                 |  6 ++++++
 12 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.43.0


