Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4778C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 03:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SMetgcZ2RVSRdUKhAuqyb+tQgU5bfkA+NRCyaa9S9ME=; b=jmD9ZStWGrDL5WzcSIWrmVH/Nq
	N2RarNTDWakmUgnb1PJ87s8MSMLNV7Zm4SOSiAZvTLnbuzS8V7Q0Lmlf7y+gIvKhA3UPIS51poOce
	1Ds7njMXw9JRBoTaNJsNS8IvR7y1pOmtBb/tDm6uLgg3iUoHP5/5LAgTvsfDxATwPPgCI+tA6qdlP
	4YvFAL6bSwgaX80fbnIwB8bELgEQkh0e7MlwRrI3ngXXq4wnwglD6wV6cwDv3Xa+k48v/dsQecaam
	wGF6Ze/dXQgf1lUcp/EUHLcwysGQ+Es40Qp2Ys8o/5pwCzqElPUHPh1hFZSERc1c0uqvDylAIx2N2
	rON1teVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlHzF-00000004iDK-1INI;
	Sun, 19 Jul 2026 03:14:41 +0000
Received: from m101-out-mua-6.websupport.se ([2a00:1968:0:9:109:235:175:106])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlHzB-00000004hyw-2Roe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 03:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1784430611;
	bh=SMetgcZ2RVSRdUKhAuqyb+tQgU5bfkA+NRCyaa9S9ME=;
	h=From:To:Cc:Subject:Date:From;
	b=PId/MM28j35HDNy26lo+Ib4JZhpuMWMOx1rcckCKZfysBYnrDFcYMGurn8vUT8VMr
	 cHgL5z/ZH23FFLXIKbCNZZcXyVYkB4tQrW8+DmnQZ2Dug1hB5bv54SN7MF4NWWeZG4
	 Y5kkI+PpIg9qen51Q2AccT4J7fWq0p3waqScNgk/w3KZdzsNBys2Lbsdw3TGwYdIzc
	 Zn16aazUCZokQwTAW4vS2sJRmbIw86GY1LSCtF93ywMlBYt12tToTkhSm1b5S8ZJV6
	 cLCbGDIoeVz5Vjf0VZuLe8fOKKH6nr7m5nIoe3rt1qbEi+eHzITYl/mG6muewIPKNI
	 H9rSeP1IQBcUA==
Received: from m101-u6-ing.websupport.se (unknown [10.30.6.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4h2pYH1xbBz1l7Q;
	Sun, 19 Jul 2026 05:10:11 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u6-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from palvencia.se (unknown [193.180.91.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u6-ing.websupport.se (Postfix) with ESMTPSA id 4h2pYF46KFz2yPs;
	Sun, 19 Jul 2026 05:10:09 +0200 (CEST)
From: Per Larsson <per@palvencia.se>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Per Larsson <per@palvencia.se>
Subject: [PATCH RFC] arm64: dts: allwinner: a523: Add SPDIF to x96qproplus device
Date: Sun, 19 Jul 2026 05:09:16 +0200
Message-ID: <20260719030927.2417-1-per@palvencia.se>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Out-Rspamd-Queue-Id: 4h2pYF46KFz2yPs
X-Out-Rspamd-Server: m101-rspamd-out-5
X-Out-Spamd-Result: default: False [2.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:35790, ipnet:193.180.91.0/24, country:SE];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	HAS_X_AS(0.00)[];
	BAYES_SPAM(0.00)[85.14%];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	LOCAL_OUTBOUND(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 2639
X-purgate-ID: 155908::1784430611-3BF041C6-785FE4C3/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_201438_069023_E1421F48 
X-CRM114-Status: GOOD (  13.89  )
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

When spdif support was added for the Allwinner A523 family of SoCs, only
two of the three possible pins were added to the dtsi, since the third 
would clash with the first ethernet port (emac0)
However, some devices don't use emac0 and instead use emac1 for the only
available ethernet port, leaving the pin free to use for spdif.

Add it to the dtsi, and to such a device where this pin is used for spdif

Signed-off-by: Per Larsson <per@palvencia.se>
---
Marking this as RFC for a few reasons
1. This is my first submission, hoping everything is properly organized.
2. My testing setup is not the best: I get sound with this patch, but
   the pulseaudio daemon needs to be restarted far too often. 
   Hopefully it's just something on this minirootfs. Testing welcome.
3. Not sure where to get the hash for a fixes tag or if that's even OK

---
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  7 ++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    | 24 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..7370e8ed24ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -216,6 +216,13 @@ spdif_out_pb_pin: spdif-pb-pin {
 				allwinner,pinmux = <2>;
 			};
 
+			/omit-if-no-ref/
+			spdif_out_ph_pin: spdif-ph-pin {
+				pins = "PH7";
+				function = "spdif";
+				allwinner,pinmux = <4>;
+			};
+
 			/omit-if-no-ref/
 			spdif_out_pi_pin: spdif-pi-pin {
 				pins = "PI10";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index a96927fbdadd..b172985583f8 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -44,6 +44,24 @@ reg_vcc3v3: vcc3v3 {
 		vin-supply = <&reg_vcc5v>;
 		regulator-always-on;
 	};
+
+	sound-spdif {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "spdif-out";
+
+		simple-audio-card,cpu {
+			sound-dai = <&spdif>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_out>;
+		};
+	};
+
+	spdif_out: spdif-out {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+	};
 };
 
 &ehci0 {
@@ -275,6 +293,12 @@ &r_pio {
 	vcc-pm-supply = <&reg_aldo3>;
 };
 
+&spdif {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spdif_out_ph_pin>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.48.1


