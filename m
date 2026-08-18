Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A818C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 18:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Q6ZML4PkLQlkM1EJlZ9nhqZzRAkcWVhx1GwB+/mWrQ=; b=Tl66lNtf7tU1M/IfAPgiCuSSYX
	ewMafXtqtZ+iQeasSwTyIFd9/mvANipKGAGdOfpEc9vMCviGj2b514mUm3OExzkFq3qsZ9JXIkn2I
	d8TwgoT5+WFKUz17jsDxn5ddbiZ3wZ0dlaUrA3+Ab52PuVQAG5sg66dFDVE7cXyhL42XoS/SlhBIN
	IBUsCechioHG5V9ef2WyBWKgE6aM1uNM8AUyYeo/FdafZYuM8I/ssZLCaAe5cDuLJEcnY6sf0j9KS
	exqenzoVubHjwfnriYqJhjSrWGwGbhMjpI2qt3JWso9x9POUwuDVACfVRkrkt9jCWA2B7aq3t5cef
	uGeYCb9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOF6-00000008UAI-2v4y;
	Tue, 18 Aug 2026 18:08:56 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwOEs-00000008U9S-1yhu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 18:08:55 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5bf9506704fso62982e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 11:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787076520; x=1787681320; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Q6ZML4PkLQlkM1EJlZ9nhqZzRAkcWVhx1GwB+/mWrQ=;
        b=JI4aeaAdhdh1/rJuFerL5nX4bBm7oxZe5HuRnf/zPvVZchyuT/SfccvJrHdNSH4nKw
         Cq7VAwMwLgQDSeSSIwOQeSwiuBQCQXlEdpz1JLzIA7z4Ncqvn1k8j9ujoH6Bavepevdo
         Sc4hQ6dubXIJhic+IE8zcHglNZvZ8sQBtWjAXAeFLzQL6vZW70mqmT8GPk4p4R2K/Ro1
         VWJsIlwK0enK/1AoHFQR9ckovMCnHbT9OlNek57ug7kUnz1D6ajcSA+/pfZcspzzFyzh
         aNhJwSHOuzJAqcCJFLqaRQXnSoGSTCpngq+buIlG9xqdoEthEOoMn6nhlhnzQT4udl8m
         HObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787076520; x=1787681320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Q6ZML4PkLQlkM1EJlZ9nhqZzRAkcWVhx1GwB+/mWrQ=;
        b=Jf1lPKK+RTEjmhfsXgA/8fnGWs5/a7GNOjpivNfXRbX4LdFgTVnYqZcN4suHJXP1kK
         AIi9SEG1XdAWuJ3VNuLXnK2Sv+LOcWHLGdOgQCxJMldnlRucBLiYiNlVwJntcFde/TkO
         Eort5dfkSUUcj6htY1Hh9+YfQLHEOHdzxMFYPnqmgcL7bxu0981EQvtcT137hDo1k48I
         f7PSALIPeok6DaF+WHqeDm+O8Miw0qoClguQ8ONO85ybe3tlwXRcrLk9Fwq5Fi+mKEYY
         HB2HMBp2oI8AaDFDpqOYegZeo/YgMGRWhdP3fY6KK3JHIwjN05mv/Om8grBWPbsZ1YVm
         p1IQ==
X-Forwarded-Encrypted: i=1; AHgh+RqnW45pt1N0NhBFyIWTNGM0Xd8bj6hIpn/YwTXCgKYWgVS5QAJvwzMd9MEpNxYXfaxwaDCm9pqaMJvZ8unmVruV@lists.infradead.org
X-Gm-Message-State: AOJu0YwR85skp49GCtA1qf3uhvPSlbNUViObJxHIt+P/UpchXoixtaIK
	P0gcHYB+ACKJtYxFVJ/IfVbk9hi7OWZB54vM3/SUuPgYUyjB48egbtXJ
X-Gm-Gg: AR+sD12XUlI8pTi3Ad4ffIWqw74flCl6+dxRQRD+6aiocuuv45feYoyFkiB3ZsqnEP7
	rLeqsSGJzVRGPZDYhfqycCv+RCFngsa6cDszwkd3oYoJpTlvSboXtquM+mb3h0TfEmFOIxvvCEd
	euqLFN8W9igDWhNNn5lcsKmciEv3vRDo9+Qu/2Yp9ivdDQNYEhiCFQaoJ5r9p0AhnR8GafYevZO
	MZFiTGipkwwppzjZGugWDR15qM465zP/1etOJz1wHrTZlcuo4OHZ4zf2sB9LJ6cst41huGxnn30
	c0363ezf8MHEHkvkGi+3CDo99qdmMg0t6sdzYh/MddIC3xOyYb8H6gkZyM6hro0E8fhH5uzMRDP
	6k3yK+rmVC74W1aXI5D8Q2JkNWCVP7OGxyDe5thuzFUtQFF6gu+LXvRyuJ4cBOBz5SVXRfbwos7
	s/EbWDB8B5usYH111pkcC/11UxbVU1dgVEred+9NjaDBEiQB5eSSZ6T9filONFZQtum1w=
X-Received: by 2002:a05:6122:3401:b0:5bf:4522:fca7 with SMTP id 71dfb90a1353d-5c591c966b6mr8543926e0c.4.1787076520216;
        Tue, 18 Aug 2026 11:08:40 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5c78ea7desm4440166e0c.13.2026.08.18.11.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 11:08:39 -0700 (PDT)
Date: Tue, 18 Aug 2026 15:08:33 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an3tiDOUUYLb8PAq@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_110842_532146_372C1C53 
X-CRM114-Status: GOOD (  37.43  )
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

On Thu, Aug 13, 2026 at 11:15:04AM -0500, Frank Li wrote:
> On Thu, Aug 13, 2026 at 12:43:29PM -0300, Leonardo Costa wrote:
> > On Thu, Aug 13, 2026 at 09:58:52AM -0500, Frank Li wrote:
> > > On Thu, Aug 13, 2026 at 10:33:35AM -0300, Leonardo Costa wrote:
> > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > >
> > > > Add a device tree overlay enabling the Toradex Capacitive Touch Display
> > > > 10.1" LVDS V2 on the Verdin Development Board with Verdin iMX8M Plus
> > > > Mezzanine expansion board. The panel connects via the i.MX8M Plus LCDIF
> > > > on the Mezzanine LVDS interface (J10). The panel is an Opto Logic
> > > > SCX1001511GGC49 10.1" WXGA TFT LCD LVDS and the touch input is provided
> > > > by an ILITEK ILI251x capacitive touch controller.
> > > >
> > > > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > > > Link: https://developer.toradex.com/hardware/verdin-som-family/add-ons/verdin-imx8m-plus-mezzanine
> > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > ---
> > >
> > > what's difference with Add Toradex Capacitive Touch Display 10.1" LVDS V2
> > >
> > > why not share one dtso?
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > There are two main differences:
> >
> > 1. The mezzanine one uses different backlight controll pins, so here we
> > use the 'backlight-mezzanine' node, instead of the 'backlight' one, used
> > in the one without the mezzanine.
> >
> > 2. The touchscreen GPIO and interrupt pins are also different with the
> > mezzanine board.
> 
> 
> And there are for imx8mm
> https://lore.kernel.org/imx/20260724-v1-verdin-imx8mm-dtbos-v2-3-9d7988bd76f6@toradex.com/
> 
> https://lore.kernel.org/imx/sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl/
> 
> Any ways, it is too late for 7.3, we have enough time for 7.4 to discuss
> work on optimization solution.
> 
> If use nexus connectors, we can share one dtso now if there are not
> clock settings.

Hi Frank,

I tried implementing the nexus connectors in imx8mp-verdin-wifi-dev.dts, and
modify the Mezzanine overlay for the LVDS V2 display to do an initial test
(diff with the changes at the end of the email). They worked partially, but it
introduced an issue where the drivers come up much later. Before, the drivers
relevant for the display (in this case, LCDIF and the touch controller
specifically) came up at around ~8s. After introducing the nexus connector they
come up at around ~20s, after the board has already booted (complete logs at
https://paste.debian.net/hidden/81acfa7d):

    [   21.008400] input: ILI210x Touchscreen as /devices/platform/soc@0/30800000.bus/30a30000.i2c/i2c-1/1-0041/input/input3
    [   21.014785] [drm] Initialized imx-lcdif 1.0.0 for 32e90000.display-controller on minor 2
    [   21.029634] Console: switching to colour frame buffer device 160x50
    [   21.029823] imx-lcdif 32e90000.display-controller: [drm] fb0: imx-lcdifdrmfb frame buffer device
    [   21.031376] imx8m-blk-ctrl 32ec0000.blk-ctrl: sync_state() pending due to 32e30000.dwe

Was this behavior observed before? It may have not been noticed, since the
drivers do come up at some point, and it may not be an issue for other
interfaces, or they may actually come up earlier in other cases. In our case
this is important though, since visual feedback from the display is expected
early.

It seems that the drivers are being deferred at boot start by the
device_links_check_suppliers() function. It runs through the drivers before
they're initialized and defers them if their suppliers are not available. The
GPIO and PWM drivers are able to follow the gpio-map and pwm-map properties
(through the of_parse_phandle_with_args_map() function), but from what I see,
device_links_check_suppliers() has no such mechanism. It follows the phandle to
the nexus connector node only, and since there's no compatible driver for it,
the function defers the consumer drivers used in the overlay.

I think this is what is happening mainly because setting the
fw_devlink=permissive kernel parameter (which sets the DL_FLAG_SYNC_STATE_ONLY
flag) solved the issue, though I could be misunderstanding something.

	int device_links_check_suppliers(struct device *dev)
	{
		...
		list_for_each_entry(link, &dev->links.suppliers, c_node) {
			...

			if (link->status != DL_STATE_AVAILABLE &&
			    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {

				...
				device_links_missing_supplier(dev);
				ret = dev_err_probe(dev, -EPROBE_DEFER,
						    "supplier %s not ready\n", dev_name(link->supplier));
				break;
			}
			WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
		}
		...
	}

Has this behavior been observed before? Do you know of any work being done that
addresses this?

See below the changes that I made for this test, relative to my last patch
(only a draft):

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
index b78322907192..4aa1c407af3f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds-v2.dtso
@@ -21,9 +21,19 @@
 #include "imx8mp-pinfunc.h"
 
 &{/} {
+	backlight_lvds: backlight-lvds {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		/* Verdin GPIO 4 (SODIMM 212) */
+		enable-gpios = <&lvds_native_connector 1 GPIO_ACTIVE_HIGH>;
+		/* Verdin PWM_2 (SODIMM 16) */
+		pwms = <&lvds_native_connector 0 6666667 0>;
+	};
+
 	panel-lvds-native {
 		compatible = "optologic,scx1001511ggc49", "panel-lvds";
-		backlight = <&backlight_mezzanine>;
+		backlight = <&backlight_lvds>;
 		data-mapping = "vesa-24";
 		power-supply = <&reg_3p3v>;
 		height-mm = <136>;
@@ -53,13 +63,6 @@ panel_lvds_native_in: endpoint {
 	};
 };
 
-&backlight_mezzanine {
-	/* Verdin PWM_2 (SODIMM 16) */
-	pwms = <&pwm2 0 6666667 0>;
-
-	status = "okay";
-};
-
 /* Verdin I2C_2_DSI */
 &i2c2 {
 	#address-cells = <1>;
@@ -69,10 +72,10 @@ touchscreen@41 {
 		compatible = "ilitek,ili251x";
 		reg = <0x41>;
 		/* Verdin GPIO_3 (SODIMM 210) */
-		interrupt-parent = <&gpio1>;
-		interrupts = <5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-parent = <&lvds_native_connector>;
+		interrupts = <1>;
 		/* Verdin GPIO_2 (SODIMM 208) */
-		reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&lvds_native_connector 0 GPIO_ACTIVE_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
index 72a4f846d694..1103da3d34ba 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dev.dtsi
@@ -4,6 +4,28 @@
  */
 
 / {
+	lvds_native_connector: lvds-mezzanine-connector {
+		// NOTE: Placeholder name, no binding for this yet
+		compatible = "tdx,verdin-lvds-connector";
+
+		#gpio-cells = <2>;
+		gpio-map = <0 0 &gpio1 1 0>, /* Touchscreen reset GPIO */
+			   <1 0 &gpio1 6 0>; /* Backlight Enable GPIO */
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+
+		#pwm-cells = <3>;
+		pwm-map = <0 0 0 &pwm2 0 0 0>; /* Backlight PWM */
+		pwm-map-mask = <0x0 0x0 0x0>;
+		pwm-map-pass-thru = <0x0 0xffffffff 0xffffffff>;
+
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-map = <0 &gpio1 5 IRQ_TYPE_EDGE_FALLING>, /* Touchscreen interrupt */
+				<1 &gpio1 5 IRQ_TYPE_EDGE_RISING>;
+		interrupt-map-mask = <0xffffffff>;
+	};
+
 	native-hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "X37";

Leonardo

