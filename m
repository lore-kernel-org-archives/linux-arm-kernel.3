Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B11E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLrjxzIVn96+FbEmeJSRrF1ncZ62LbWRlJhGTdPCluc=; b=p0naId+6S3JBNgHDu533korD1V
	l9ARu58kzLpX1M0nvjA0CDLfqT3SeL8KxHmDSmuOe+cHCAPbXnsQ5ZVp+diWiCD03/rzPhd23t4ia
	W2OQe8De1jkdmtrUSXai1MAGXko/tJw6yfVMXb9+XaTXUddPBNX3fDXQ72/3B02l7MR2WfLin7aC8
	7IAI4EzpesYVz2vAmnmldzYnlmEkdCIsmjegk6Oq8+ytJTorCwA5pqF1TaOHQLVXJcDpU2WKAXUMb
	dCU9wUD8iN6sRLYLteOc1QhArwTD5s2oMcmjlG5QPYLBOhGVY7PitgNjAITEnrnkV3kg3/+DPtkpA
	omLIr94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaoo-00000007FW8-2PsC;
	Mon, 09 Dec 2024 10:16:46 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaRT-00000007A1b-3Z7M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733737959; x=1765273959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kLrjxzIVn96+FbEmeJSRrF1ncZ62LbWRlJhGTdPCluc=;
  b=l7xb1JeuzjUHLvHPMkR/b/Ak407fGr7qhGcOEaqBN94EO61hQNXDhEMz
   BSH9n8hKH/DMIMST48VecZJ2F0HN6ZrIvecHmpYzu3LikzwHUO6Kmz+Xv
   Uwn7xKWVCAfF8uiz78dxIZAWrhqP/o1e4PLj3QGiS6PfT7AK2Hq0ks5VF
   Yj3G5gBb4X0kKqm0x0TrYaytiscfRjJOY83ye8/eqHmvxYax6cXmRseaE
   YK9IwXt1+XIdR5Gvb02whzfI47BbJt0kSM6yGwl92KA1yY078ZipC5/eO
   zmii7vH7AGMr6koYtUf3Y3a5c38vRnKTOUqTrgW1GDb6lTKUr17HHvwmW
   Q==;
X-CSE-ConnectionGUID: z5XlGf4cTO6Lf3vaQXJMSg==
X-CSE-MsgGUID: qhAjyFzoQxqaRRGZWIIYyg==
X-IronPort-AV: E=Sophos;i="6.12,219,1728943200"; 
   d="scan'208";a="40481356"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Dec 2024 10:52:39 +0100
X-CheckPoint: {6756BDE7-2-90CD5875-E0265C0B}
X-MAIL-CPID: 71BC7653E07C44C1F1C13074E1221AAF_3
X-Control-Analysis: str=0001.0A682F1D.6756BDE7.0041,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA6B51664AD;
	Mon,  9 Dec 2024 10:52:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733737954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLrjxzIVn96+FbEmeJSRrF1ncZ62LbWRlJhGTdPCluc=;
	b=XiwUo0Hm5zbYAE2EQFKVKqMMsMEmTWgY4SRz71uMMtFRrz451qc5TodJQWnLzUouN9h0VO
	EfRpbv852JBcRQ3uX7qEaxFUjgc4UR7154Ytqo1ZWl08jMV81PH9pInBNqW4B5uOqguwWJ
	+NII1Qh3agM8rgjL7FuQQZD+SjfoJoT66lrdSJp3Gius3VHhZPyUt7XhE0l7qai97cjY6G
	TnFCQ9NgtHHE3JWNLHv/qsz7l175w2llTJ7CdivUfu2p1Qs96iO8UUM8gy57HUAiCg5eKm
	5ucZUvUg6UmJy1BvNI54mCpWMUo01cFnw0Si2chns24JYaYO7nx4IVkU/Nf2Rg==
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
Subject: [PATCH v2 4/5] arm64: dts: ti: k3-am62-wakeup: Add R5F device node
Date: Mon,  9 Dec 2024 10:51:35 +0100
Message-ID: <87517cce567e1dda89c38f82db93ddff292c5c10.1733737487.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015240_183474_587FEA54 
X-CRM114-Status: GOOD (  10.38  )
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
index 9b8a1f85aa15c..619848e889cf9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
@@ -106,6 +106,30 @@ wkup_rti0: watchdog@2b000000 {
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


