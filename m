Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733DCC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NF+0Eh+B7CRrv91L1LEQIL8RYBdIoY5OhO6aCb2cgjw=; b=dfb1IY2kQ2RNxQAFguB7xWvVCK
	2kq71RIsptWubn7Pume3j5TyNpsM2yk0kYqK8k/7/xK/ZYzAcElr+n0oHJ5fRqW5AEQO3lGD8YO4w
	0Ib/IHTARP4aQgdbjdOSZ6tyQvscRNbH6Ea3EbZEMbr7jVqOfFmpWAcCB5+yJOGtzzfEw/7SOgyzh
	ZHFTJp45nwlqvFCMBOYLphex0BwxvXCikrS028WyQEn2uQ4d8+8mvp0kyjg2j/BlgAKoHoOUjf/Qh
	UGI2K7OKjirSAbBL/e2pwVSz+qMNvYCCRlhuPo/t7XgkvNekdqu8q5gxctn4Ndw8is8j46emjUWo5
	3DB4fGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AvH-00000000FT9-4AhA;
	Thu, 03 Sep 2026 17:08:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AvF-00000000FRc-1rM6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:08:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so904445e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 10:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455299; x=1789060099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NF+0Eh+B7CRrv91L1LEQIL8RYBdIoY5OhO6aCb2cgjw=;
        b=DLpHs/ZA7R5HrFtfFhKdIAiw+yPAqqbMqdV7MLiQgCJ0YMg9ZLJRO6bygEZ2HMPcXF
         RhWVKwyQFpxSnUfJHlBl9sryEP3G1jYV/7nPr32CMSedLo8XWawEBsZKHeXSZK0trbKw
         44aifZBKfcfza1n9sqfcEMtx1IP+MFiTOI3sIhTe7NogHNZ6AT1k4o5e46yRFuEm1dMd
         z8BGEfkS8LuaikJ77QNIvnfbobQtA/xARaZGNa6sQOHjAbx0oRihyV0ldXfLJ0G7COt+
         3NrJHfMdA6mD6qqtaRTFEVm3STca18QwIiee15ITHR2P6zagXAiyolRARnaKa64XSpwY
         R8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455299; x=1789060099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NF+0Eh+B7CRrv91L1LEQIL8RYBdIoY5OhO6aCb2cgjw=;
        b=C7TM2ywzQXQqpcakg3lr8jNjsDTDDodDgx3rnC9TndeaA8TftciIyNXG4LTWo/zx2J
         jlc/XJn7EbUMUkYG98I3RUP73LGy7hQlEyQAk8rWkzYgRyXSHb4PsiIPBhxrgPvo3JgF
         FgCUzqAqG9jSLgPFH12jo4mzacoVLdvJnCyVjOEq+oeuliAQwFdrYdGVpmNII17eL6PY
         IDaoUHt56GmhSl4H4EruOyIUKzN/XkPbDxvJB5cTy1RgZjv80XkMCAO7AfIjH731KXZv
         bBwq7r07vdeq/W2idnVGCjovQwOE7hTegZdTA/80rA2e77FzKt9fBPvpN4JdySqnmboj
         s6ZA==
X-Forwarded-Encrypted: i=1; AKwUvBzdiOFTcm+Jsy6hwX/WhqB/8jmamgYKOreP3Z39LbyjEGgiuukH6mj9TtqXTGn+ZnefcJjBYdwPHrgJvHmR7zBE@lists.infradead.org
X-Gm-Message-State: AFuF++kBLgQ/n9bA0Ip1/mEOTfhhNQ6z3n2CiSuzQxPCHdOL18ObrlUh
	MM4l9r1IXV261ahhHMNw/dD5jbikymEgPSijBz/TqcAqNxrxRsay505l
X-Gm-Gg: AYBFou0KMV9O1skqjO8ahrMo0WCxQV/O6vUyGlpXrBAdIs0VI7s3L3YDVx8hxHWDlB6
	4fz/upQ2w3ODPGfRdzBjaYH4zmIIy0/eCqCym9gmcgUB3uLWcWU9hSRGRUhiu8IEV4Rnc66/Whf
	JamsFgyfOOcPJb0csd+GIoqaCcAYqyUFabnYdLsn+tqS033yHl3seTpvqU4reMNrLmZ1cvwBVLV
	OvcpiGHJ+igTr5zcf73NcgOkNxZKNAjefxtcaRqmgOT7rZwrr+RnJ6mbT/nVsY7ItESru9Vj7yz
	zhlAtwfWjmGZLbq0Isse9dPjM0vmEjrvyMHQ6wdoLZo0iTLplb5lS9dhVFlPNIvbjoZDk9SXjUg
	+gT3UxUA55N+c/gG1x2GFckWhruwlDEoifCzEneuU/b2aBhv9Cjl5XLL1pL2BpSYc23+/ye/qh7
	Wt3IwUMK8lpoZpy/yguMCL4sq5kTsdLDKiCHYP1uUUZ3d7hS5dm6XTc6+678BHHULAgc0UxwZwD
	Uno3pduV/N5bn9UYVxN+f+vJA0MzBym7A+uHC8ZdTL1uARjSbIV/1UusXGNqHuBsiMwxCy+usIB
	XSBoqX1t7/i/+x4S3a0/Xt1gby4+doOYRhedwQ==
X-Received: by 2002:a05:600c:4f87:b0:49c:d293:70c8 with SMTP id 5b1f17b1804b1-49cf4f9dce9mr56543595e9.3.1788455299039;
        Thu, 03 Sep 2026 10:08:19 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm107799565e9.3.2026.09.03.10.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:08:18 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 03 Sep 2026 19:08:01 +0200
Subject: [PATCH 1/2] arm64: dts: freescale: imx95-toradex-smarc: Add ENETC
 port 2 in SGMII mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-add-enetc-port2-v1-1-2a21139d7a7c@toradex.com>
References: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
In-Reply-To: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_100821_509256_87C2A3B7 
X-CRM114-Status: GOOD (  11.17  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

The SMARC ETH2 uses the ENETC port 2 as a SGMII Ethernet interface.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi    | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 7437e523ff639..ffe537ccd5bd5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -64,6 +64,14 @@ &enetc_port1 {
 	status = "okay";
 };
 
+/* SMARC SERDES_0 - ETH2 */
+&enetc_port2 {
+	phy-handle = <&ethphy3>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+	status = "okay";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a6c5398a81e3c..27ac9731733ce 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -15,6 +15,7 @@ aliases {
 		can1 = &flexcan2;
 		ethernet0 = &enetc_port0;
 		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port2;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -221,6 +222,12 @@ &enetc_port1 {
 	phy-mode = "rgmii-id";
 };
 
+/* SMARC SERDES_0 */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0


