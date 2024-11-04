Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0366D132A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 10:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBTSAJVXid3MIQtg2BBLWs/I1t+jzrKm6A0/aL6KyAs=; b=xZNb8TfU5MyEsVadeCfxQtdGr1
	HuQBHC1zqIK4QxwMN5zVpuNn+0voHXD8xszmtWMtYOY+kblCytf9KGQ5RRnMeTzrj84MV8C7rsQYp
	/0RBGxoFIOI/M2P5IfXy+3pPF+LCEhQbL4UO6mrYPFZhmhBz/L16dBVKlWL8/PDsfDgfMZRhE/Dcu
	xbbaT2ThdVzhJPdaG5c6lvUTxMtq0uYQH3VeaO0SI8RkYYRcuM0Eu5txwfgVnc5XqsRv1hJuiq8ZZ
	+GufoWUcFk08sND8DfZT5XqjL+ctgfWu39G95fZ46w01tCAJB3CUpQ7jbC/4tx2MqA7s/BPwUjgQe
	eNeK/yLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ty9-0000000DFoF-0crF;
	Mon, 04 Nov 2024 10:05:57 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7thm-0000000DD9K-20vq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1730713742; x=1762249742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZBTSAJVXid3MIQtg2BBLWs/I1t+jzrKm6A0/aL6KyAs=;
  b=JEwrKskMGPs17hE5F7Knetcgf+IB4QDYdfHznsK+9fUFfhfnn08WpX+a
   4ptJCJWHUZClmLibClx2dl3SuvoyZW4GKC+jtxe8XyE1SHSMbpv0BTMek
   fKheb1nTLBIGQNDIWni7g5xq9y4YxbSOutqgo/7BrQ042tYyL81IxiIOd
   qBBiBrOwNPywxiNeqN7qtAFuKVf1nYSEYR1fK9Yr1F1QQeAEShVuuWqR0
   WEdIeAltaFor1vN6nqzd4imxmjG4Wt+0Knahca8zarXlOjsgps08VkLZB
   g6tBcVcYU6STZh7UykatLbY7sE2o8qhGLNPFc1ogwghd7zkmJlpKNCMVz
   A==;
X-CSE-ConnectionGUID: a4QuwL1+RUqg7rke2wMldQ==
X-CSE-MsgGUID: 9Oy5HxWCS7CMQvnISBSEPg==
X-IronPort-AV: E=Sophos;i="6.11,256,1725314400"; 
   d="scan'208";a="39827146"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Nov 2024 10:49:01 +0100
X-CheckPoint: {6728988D-22-F5DC7025-F79421CB}
X-MAIL-CPID: 9EBC8F9B5B9B36D47A3FA86AAF017B77_0
X-Control-Analysis: str=0001.0A682F17.6728988D.0113,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91CD6169DDD;
	Mon,  4 Nov 2024 10:48:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1730713737;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZBTSAJVXid3MIQtg2BBLWs/I1t+jzrKm6A0/aL6KyAs=;
	b=Hd5cqe4JUcoeN/yaLmIR2qvjHQaP1Hag/PwvQ4ctbbH5N2YBwhNjw3ifwPatq9lUUxxv/b
	hx9eaRHL6TiKh53SD0/v6+OZSatqVqxRqHnYXlveKmooxFCVhAKQOQEdXV+rjuOIVFnYCc
	13UkZGJWChNaFrINBEerZB4jN2zG8dGNFnPT0c1bxjdUoBeWusSN7w4ks5yUNLXTkPCn4X
	aXBVYZBvzA4HKaaM47G3RMjPjJbOA7GGKIQiB3nRaxiHe6pAE/bN3GCCqj52hvuPolLqt5
	wIDONEW3bauxCgdYgQbINNadm8s1a3p2c69CdaaKVH8SvpcsqvX2Ocgz7WwMBg==
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
Subject: [PATCH 4/5] arm64: dts: ti: k3-am62-wakeup: Add R5F device node
Date: Mon,  4 Nov 2024 10:47:27 +0100
Message-ID: <b0b98b4377559f72bde58ac1ffb7833c17124175.1730299760.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_014902_861460_CCFA04D4 
X-CRM114-Status: GOOD (  10.96  )
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

From: Hari Nagalla <hnagalla@ti.com>

AM62 SoCs have a single core R5F core in wakeup domain. This core is also
used as a device manager for the SoC.

Co-authored-by: Devarsh Thakkar <devarsht@ti.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
[Matthias Schiffer: Updated to match latest submitted version v5 of "arm64:
dts: k3-am62a-wakeup: Add R5F device node"]
Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
index e0afafd532a5c..cd9d2132009bb 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
@@ -101,6 +101,30 @@ wkup_rti0: watchdog@2b000000 {
 		status = "reserved";
 	};
 
+	wkup_r5fss0: r5fss@78000000 {
+		compatible = "ti,am62-r5fss";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x78000000 0x00 0x78000000 0x8000>,
+			 <0x78100000 0x00 0x78100000 0x8000>;
+		power-domains = <&k3_pds 119 TI_SCI_PD_EXCLUSIVE>;
+
+		wkup_r5fss0_core0: r5f@78000000 {
+			compatible = "ti,am62-r5f";
+			reg = <0x78000000 0x00008000>,
+			      <0x78100000 0x00008000>;
+			reg-names = "atcm", "btcm";
+			resets = <&k3_reset 121 1>;
+			firmware-name = "am62-wkup-r5f0_0-fw";
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <121>;
+			ti,sci-proc-ids = <0x01 0xff>;
+			ti,atcm-enable = <1>;
+			ti,btcm-enable = <1>;
+			ti,loczrama = <1>;
+		};
+	};
+
 	wkup_vtm0: temperature-sensor@b00000 {
 		compatible = "ti,j7200-vtm";
 		reg = <0x00 0xb00000 0x00 0x400>,
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


