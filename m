Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFD3FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=77H82kI7dEYyg2WwlnQ3ymitG+32GA2zsOuxHnqBHNM=; b=OfukNZaEInSDJpcsBPXfCdRXka
	DScJvaJ+A5r/fU6hrhTl5c1bK+ile0Iu4NGlMiQKIcerGrOAg4tD8iqISbnqralXpUDZowGq8P5PH
	3+RkUfvTLroUbOASJ3UrcitrXClthEXyHD6Tle8MqoGXMxHqe2t+6rWcBrA5AYBbgHrCQ4NGwRQOa
	kyZnMPS/WaZaBwUwmecvaAd5AtQc+ZmgCGWMEnk/nHPBbG9Ep6Aq6cYPzEIMSLANZ73ztS9vVwig0
	qhfWE596t1DxXg4Y4vFKD8PZw5YbeUhG3vGe2Z+fquSkk2EnKLeEuT8Z1k+FgucWpEidaNm0dT8uv
	esStyVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGYFe-0000000EE8e-27Yv;
	Sat, 25 Apr 2026 08:20:34 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGYFa-0000000EE86-1vdv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 08:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:Message-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=77H82kI7dEYyg2WwlnQ3ymitG+32GA2zsOuxHnqBHNM=; b=xoJLqkkQjuw3W/n8FeUBsU77vL
	F88vRCLY/lCbMZiq869VVSqh8QGAqngnES81nsgPQpWHUCPIqn/OIq9cqAJf9eJ6h1HJ++EqKi0ud
	9SMBhnHJnmSYjWfIoKi4qg/CV2GobjHzNRfDL24BTpT98FRkMvhTXAh1PzKkxwYNwub06sSJtqTdB
	M4DDi7jjRr4PxFzv6HJQ5q60URh1wmNR6Xo9T4wXedgps3P9sXdTbo/XsxeZ80OsLuPXzCpmTLvod
	Si9IpRf9vwiPIBOws6iboQEiYmElteeH5AM2yWxfEtqKZl3RoSgZGaq+fjPRfkYSw4CpifxVqH0aC
	Wo5u4wVw==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wGYFX-00000007jmm-0qEx;
	Sat, 25 Apr 2026 10:20:27 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Sat, 25 Apr 2026 10:19:40 +0200
Subject: [PATCH v2] arm: dts: allwinner: t113s: enable watchdog for reboot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-t113-mangopi-reboot-hang-v2-1-fd343207a4be@mmpsystems.pl>
X-B4-Tracking: v=1; b=H4sIABt57GkC/42NSw6CMBCGr0Jm7Zh2VCKuvIdhAWWQJpY2nYZIS
 O9u4QQuv/+5gXC0LPCoNoi8WLF+LkCnCszUzW9GOxQGUlSrqyZMWl/QFccHi5F77xPuQTRN1ww
 83omph1IPkUf7PaZfbeHJSvJxPZ4Wvat/jC4aNd6UIjN2NStjns4FWSWxk3P4QJtz/gHSh2fsx
 AAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michal Piekos <michal.piekos@mmpsystems.pl>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777105189; l=1190;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=6rULUYpY2mknKqA1TfHfaz2jSO4ja87Ku+5vnKG9jWI=;
 b=gFFthnoA2sVKwhTKhyPGfugGxsXISbKliHdFH1o+xU1MVWeBVxcu2MPV746gFWvtHprV6qACR
 wIFXFnYNdZlDWfNbj4RKdyHhwGSKf5kf2fFaEAXHmGMmawX8YxRyNfW
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_012030_992211_E9951112 
X-CRM114-Status: UNSURE (   8.24  )
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

Reboot hangs on T113s boards because no restart handler is
available.

Enable the SoC watchdog whose driver registers a restart handler.

Tested on MangoPi MQ-R T113s.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
---
Changes in v2:
- Moved watchdog enablement to SoC level dts following Jernej's
  suggestion
- Link to v1: https://lore.kernel.org/r/20260412-t113-mangopi-reboot-hang-v1-1-5002cfa6e0cc@mmpsystems.pl
---
 arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
index 424f4a2487e2..d3bbed84eedb 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi
@@ -34,6 +34,12 @@ cpu1: cpu@1 {
 		};
 	};
 
+	soc {
+		wdt {
+			status = "okay";
+		};
+	};
+
 	gic: interrupt-controller@1c81000 {
 		compatible = "arm,gic-400";
 		reg = <0x03021000 0x1000>,

---
base-commit: 27d128c1cff64c3b8012cc56dd5a1391bb4f1821
change-id: 20260412-t113-mangopi-reboot-hang-c9a9def82e2b

Best regards,
-- 
Michal Piekos <michal.piekos@mmpsystems.pl>


