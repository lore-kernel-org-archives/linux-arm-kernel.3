Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FCED0BB66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwFiDc1hiKzfuZAf7wDn7BLFZ2hIohDQzw55SHVWscI=; b=1ftSRxt45eURFsHXnyoz43PXii
	tR2oJbF8I4VdYYs0O1BqlKb9SeRVujojHNI+oq1riI6OXDRa1clnIOLtY0AGYtZKAs27P4wrzBy0c
	+OxIVRXO/105ahW6DiZjgM34bY3tjZ0MYhZSOu/4ollJlIRcoTwdMv8VbpjSuW/jvw2X9Oaa4Fl4J
	6DFRLfrJBUgRTjI56OzJ88H7hMwXKKzUQqUzahijqQzzu5T4OTtb6N+ZxJUYwjjXJS8iva1QEP0GJ
	vM7GrfxcRDyy52XR1kNhj+tmNuMpV0p+dkznqDeYwr+GfMb+Ecr+Ymxsx2AweWizlay6a3CkO0AG4
	3HuADpMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rqO-0000000H0eW-3x2T;
	Thu, 24 Oct 2024 07:01:16 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rgb-0000000GyaX-06n7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 06:51:10 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id C1E1CA0DC8;
	Thu, 24 Oct 2024 08:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=VwFiDc1hiKzfuZAf7wDn
	7BLFZ2hIohDQzw55SHVWscI=; b=mWCpdugvEpYYvgldU8BpaCNf4axJdxj1yq/p
	7jYKrw5cSCxznoGf7hD/Wd4HL1SfqPjs8flitKDu4FDTuZ553uiFZ8qIILvZxOUy
	fSSH1ToY1djtUW3AyfFhxIcShhJY+gJEs3g/Zn4H1Z981rFLFntLbu2VUmgvYq27
	km+g56AD4clkYaoJh0DejslAKoH0xBxWBeZwfRcWXjFq8bhcHODJ5Au2dpWzSpuO
	B4lYH3XNXIe7vFVcQKTIh44wlCYr/5zMS9X5m/jNPXo/pWRcP3/HWdTi2jgFDCCG
	RUZgbePj3oyobtKYSailSZ94lGQUrXN9uHGFGRLLY3KeB3tNSAK8aaWMD1kRRxwS
	Ea9TiA8XqIcyquHcyxkFO3Ty7PzKXoIpUIOe9z2OnfuGfI9kjWb1OgOLG+MOC7v9
	Fkw32oDqN8HXehubHnFuhQKIrsF94zZp5rMfA4wbyGAnFuDBd3VIf++8QC+qOnCm
	5aw7Y8S9KKoS3vjcQVd2AemuVsF/0uokFeQSRofmBOadoeuGz0cLdkeMGu8IzNil
	VwX9BXwb8flw4Zh5ggbEvuMryvuOqpGn1kUe5IIzYDspfOs6okUFTgKKUuaR3T4J
	5L4m1W/wlm7UkgZnjD2+Fy2Ps7Ss/g2faks4PtbXcT3kxDHIB6w8KAmDDww/4ZDX
	/wgnhII=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 09/10] ARM: dts: suniv: f1c100s: Add support for Audio Codec
Date: Thu, 24 Oct 2024 08:49:30 +0200
Message-ID: <20241024064931.1144605-10-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <13ab5cec-25e5-4e82-b956-5c154641d7ab@prolan.hu>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1729752656;VERSION=7978;MC=4016601128;ID=153597;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855677065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_235109_318737_78B5FE23 
X-CRM114-Status: UNSURE (   7.33  )
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

From: Mesih Kilinc <mesihkilinc@gmail.com>

Allwinner suniv F1C100s now has basic audio codec support. Enable it
under device tree.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
---
 arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
index 290efe026ceb..e4b41bc93852 100644
--- a/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
+++ b/arch/arm/boot/dts/allwinner/suniv-f1c100s.dtsi
@@ -336,5 +336,19 @@ uart2: serial@1c25800 {
 			resets = <&ccu RST_BUS_UART2>;
 			status = "disabled";
 		};
+
+		codec: codec@1c23c00 {
+			#sound-dai-cells = <0>;
+			compatible = "allwinner,suniv-f1c100s-codec";
+			reg = <0x01c23c00 0x400>;
+			interrupts = <21>;
+			clocks = <&ccu CLK_BUS_CODEC>, <&ccu CLK_CODEC>;
+			clock-names = "apb", "codec";
+			dmas = <&dma SUN4I_DMA_NORMAL 12>,
+			       <&dma SUN4I_DMA_NORMAL 12>;
+			dma-names = "rx", "tx";
+			resets = <&ccu RST_BUS_CODEC>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.34.1



