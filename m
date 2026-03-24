Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E84DE9A750
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZNbwPwadK6eSTN74+FL8+k6mnPnpO9N/0QmszQIkW0=; b=aZvAJsLPhUb8sw99lxvZgkaXQM
	Ft7VKNZG73hYD+hBQdsKF1myfdjSCS2WUa3fESr6NUzwC+/xWBZ/1RTirecakh1RENmuXDmi2i929
	bzitkoKd27A+H3XnOHc62ryc5EsezeC5r+XBghh3SYHub19LxbKLmbdTiKgF3raZGXR6mUkYdHKti
	ol00uiR2pKkc9rhqOZ7j/5Y8WjgIjY54igfakh13ev5ubV5/96WgjBxVWMDaVEQSyEreUem4ylcsq
	KoFhXSP/0BySCUAn/ifMeZlmH5LjHjo5dZVLS5ENx+4CvBIvGFl4wZ+yiT762J6hhreQWW3Yv9QI0
	yTyGHMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCb-000000016d0-0ayi;
	Tue, 24 Mar 2026 09:37:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCT-000000016Yd-2eq2
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Mar 2026 09:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jZNbwPwadK6eSTN74+FL8+k6mnPnpO9N/0QmszQIkW0=; b=QM6fsSmmc5JkmPkVnuLDbLkFr/
	+b1WmzNuuzpxCrcTC8tgCvhVRwmjwryBBWKIwi7AkUDuc1Q0vkRhvRrjd2WS6IcQ9VqqVtLrgKGXk
	38Brs/pYI3txR2/DxEFSHboykdaOEknAUAFvRVb9U+rfxQttKJdOJ04+6a+mjIvkFWGq+BOJA2f+k
	cXWWGaDplqIGaWcw5ISgov70sIt32XYBFJxZfsRyiYZNbpSg/5MsXBc0L9/elI6Kz5+SLVPIxo0bN
	WYZSEO18GOJRbiemaKKH9w9IvughYF7Af3OHI8ZwhyrTkNt5PO1jkO5Jxq2yg8/XtLTLCRuGPhLWx
	aVyzAPkA==;
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCQ-00000003f5q-1rIW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:37:24 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 6E763275C2;
	Tue, 24 Mar 2026 10:37:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345033;
	bh=jZNbwPwadK6eSTN74+FL8+k6mnPnpO9N/0QmszQIkW0=; h=From:To:Subject;
	b=d7zUGY7STC+8wvXJvNrTv8D9IPNhjI92/McEqX6GJI0NuuG/+0d7K1uf+NWM7sb5M
	 TjdGWugioUNPQsDmFXP7sEv8IpATlpIBzVlf0n5YkHDyMvBXDPtPlLFgeXqQeQ6rrw
	 q4IQAqNj4bBFtvuk8p8bSrb/mjwWghqlqHI0Gvo5JVZekIlHRhmN8ZP2YnY6xw54Zz
	 ghWmSF8jwPu9XcJjUsmMNo7dSUDdQfmYp2MoZ7PyXrD78moszpNEysAMNM7ETHKMeC
	 JqgIwoJR+waGKxR7CrZiE3USC9OzFCUPWj5iDeHSC2pzAyh6EHwapaihkcs7qYUjoa
	 2OAZKFhKhJrgA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] arm64: dts: ti: k3-am62p-verdin: Add SPI_1_CS as GPIO
Date: Tue, 24 Mar 2026 10:37:01 +0100
Message-ID: <20260324093705.26730-7-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324093705.26730-1-francesco@dolcini.it>
References: <20260324093705.26730-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_093722_932523_C4FC4681 
X-CRM114-Status: UNSURE (   8.53  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add a pinctrl to use SPI_1 CS as GPIO.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 1c4c951e5e94..7ee894d59113 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -247,6 +247,13 @@ AM62PX_IOPAD(0x0018, PIN_INPUT, 7) /* (M24) OSPI0_D3.GPIO0_6 */ /* SODIMM 62 */
 		>;
 	};
 
+	/* Verdin SPI_1_CS as GPIO */
+	pinctrl_spi1_cs_gpio: main-gpio0-7-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x001c, PIN_OUTPUT, 7) /* (N21) OSPI0_D4.GPIO0_7 */ /* SODIMM 202 */
+		>;
+	};
+
 	/* Verdin QSPI_1_CS# as GPIO (conflict with Verdin QSPI_1 interface) */
 	pinctrl_qspi1_cs_gpio: main-gpio0-11-default-pins {
 		pinctrl-single,pins = <
-- 
2.47.3


