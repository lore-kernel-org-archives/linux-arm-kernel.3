Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2DBC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6K3JoQ/La7gglTSywyKmCSq3qYTAVbtDQfL9xWyo6M=; b=o7XjhL5l8ac7QG9XYpAnytrvOI
	8GOU9ERtWU8skZtnxZEpfR8pXkX4oNmAXep5I78UClNnEG7LBtR8EZe4vKILLCBrnQ2XYgeXfWJVG
	ld69hlNfrhYCO3agSn3hkVQtu5b3DG9UCTMC0IPLzvNhMo6dBebzr0HROvdSqRfIrsatWx1sGf9Gq
	HFrbTuyKPZAPvdmNy6NZb6l9zx+frIIAvx1guyqOPx6reUlAiEgpcxHWF0UmVj/gDKKZrCxnM+3Hk
	cwdK7gByK9UDtsDZ+wHTvC9ECULciof8ATFPR0xM8pnP1I+WEztjVES+iHfTg/KtDworS80m0IgXh
	JOvD6fzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wls1y-00000007ZTP-3MFo;
	Mon, 20 Jul 2026 17:43:54 +0000
Received: from m101-out-mua-6.websupport.se ([2a00:1968:0:9:109:235:175:106])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wls1w-00000007ZS2-1XZL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:43:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1784569430;
	bh=a6K3JoQ/La7gglTSywyKmCSq3qYTAVbtDQfL9xWyo6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uRE/tTHmCL6OMXyzABtlR6iHJJluQr/DgUbHrnzemJ7dyb+eRnbFvUG2uA9/1y4UF
	 zR7kn+0OSQgMzzPmwjQLZlXIjK5tDdX4Qvw6q7GqNauLf2SanNE/8XNYIMf4LxVG9B
	 EHNPmqJuLvnhFjFeYU5w8fzdtaOjZXj6h8PcRBv7MaJb3iJllp5PFuH/JTP2NqF1V8
	 zroBCHdhrvvPoXCJyd497KnuIY2OgDLSWhFlUsLnRMLlB5JhUDJC3Brq0ud3DRC6+M
	 nsDtGeZpb3ReQ4kdyk0qePn5Jqv3X0W5X/4XWqP0R9GYrSfnx4FVsi/Oxw7YmetIJD
	 4dubC8bFVQBkQ==
Received: from m101-u5-ing.websupport.se (unknown [10.30.5.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4h3nts714szRD7;
	Mon, 20 Jul 2026 19:43:49 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u5-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from palvencia.se (unknown [193.180.91.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u5-ing.websupport.se (Postfix) with ESMTPSA id 4h3ntr3rKVz2p3h;
	Mon, 20 Jul 2026 19:43:48 +0200 (CEST)
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
Subject: [PATCH 2/2] arm64: dts: allwinner: a523: Add SPDIF to x96qpro+ device
Date: Mon, 20 Jul 2026 19:42:43 +0200
Message-ID: <20260720174253.7686-2-per@palvencia.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260720174253.7686-1-per@palvencia.se>
References: <20260720174253.7686-1-per@palvencia.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Out-Rspamd-Queue-Id: 4h3ntr3rKVz2p3h
X-Out-Rspamd-Server: m101-rspamd-out-6
X-Rspamd-Action: no action
X-Out-Spamd-Result: default: False [2.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:35790, ipnet:193.180.91.0/24, country:SE];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_X_AS(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 1315
X-purgate-ID: 155908::1784569429-3D7071C6-507E0540/2/76550713453
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_104352_579432_EF77A507 
X-CRM114-Status: GOOD (  10.19  )
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

The X96QPro+ TV box uses the PH7 pin for its SPDIF output
Add the relevant bits to the dts now that the dtsi knows about the pin

Signed-off-by: Per Larsson <per@palvencia.se>
---
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

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


