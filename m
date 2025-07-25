Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE741C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMho35ByK4WFlFJsFIVK8lEJOSFzjAi8I/P8vZM+HZE=; b=Z6KbKJcOdowKM2uv/5XuUlyQsm
	1TW0KeInYOyFSzE30V2WOalwC7ODMY+bZ3y0RuQuegBZ/L3X4RiJgviTmVc0v0+pihPBwNaQM/KTL
	7A50pe4pA3pAy5R8xvsKG5ZeuI3Z4h0c3gnVCMc9E23NO6LePtQbPTCTb9UG5T924372keYNlzYYt
	X+xQI8bEQbX1rIgzMOYw8DPbh/2A34Bt8w+0FT6VLjSgKW0FAabO5/hucXZPBI2M7GbQWPWO+N541
	OyYdNKV6ZR7MNV2i0y8cWKlJ4YBFxlMlOxr1zGQvdBa+iZNuO3BGTQkVpAV0b+FlkDWXzhdc0iB3z
	UrKmq/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBxm-00000009Acc-22EP;
	Fri, 25 Jul 2025 06:31:26 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBhA-000000098Tr-49I7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424057; x=1784960057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sMho35ByK4WFlFJsFIVK8lEJOSFzjAi8I/P8vZM+HZE=;
  b=OdMZAfJwk1WlmP1tlhceGb06rFdj7j0woYewXbPzEjCTXUmWJJQbu+5r
   5ZOBdfBHF/yFq2SyjUDtnNNP5nT8/F+xXK/DF4Hk8UbG08KJWrXdm3krm
   zcSSVMFkR3VTYNpcKEhbYgI06fOFJpNC+uHJFSm4W+tIipAwLCCVKIL79
   dkJiWpBgYgeQtpM8IeQg/cBkvMkddi2WcPLTzWzAhSH1RtK4LqWNLSoUP
   xEgHT0D1oa2Ml10DF3n6L9VXdBlLDu1yPuGUFqXlq8S17GNFFsg9Ua60P
   VpAUFrXZ69JB7UqgztNEoJJStDM8lYfsLJnmMNR7ipRXO2E9s7nGRUeHh
   g==;
X-CSE-ConnectionGUID: n1deL2OQQgSI6ZZZUofROw==
X-CSE-MsgGUID: kOboCL03Rs2UkMpi1GihmQ==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413029"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:14:16 +0200
X-CheckPoint: {688320B8-3-8CC3CD70-C1DBF452}
X-MAIL-CPID: FB3B08457DD236C33772BED2F00BFFED_1
X-Control-Analysis: str=0001.0A002116.688320E6.0062,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92A39173651;
	Fri, 25 Jul 2025 08:14:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sMho35ByK4WFlFJsFIVK8lEJOSFzjAi8I/P8vZM+HZE=;
	b=c9N+iIZ6gRtBEpFDCJRiOa5ms2BJPeuX+5S9pz+aqkX74ICX9zOfHt+O202wvtqRQIre1o
	MvRwRpiUQYrsJ4rxfRmStXUsyGyPmjQNVgGLiEx88jgE6SQan2tsbB3XT6+XNwxCtCuN6Y
	evHMX/XyiSHS89wTT2+xVIoXzpj7ONaMPFSnWNTohLYjIMWrWc940QCTnOF7zdL8an2F7g
	s/uPXiDPKsw8+HDPeOi3x8HIODP2gk0nnEYOJg64Gwssk+TI9mW2ICERT0TMwVP5qUX4mx
	Bga+PwvO9llfbwYfP801iue5jnmAZQ0cau74ViFxvm43y61Sr1QC/6wZs3Mbxw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/10] ARM: dts: ls1021a: Remove superfluous address and size cells for queue-group
Date: Fri, 25 Jul 2025 08:13:31 +0200
Message-ID: <20250725061339.266125-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
References: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231417_377758_7A560608 
X-CRM114-Status: UNSURE (   8.12  )
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

queue-group nodes don't need them anyway as they are inherited from
the corresponding ethernet nodes. Fixes the dtbs_check warning:
  ethernet@2d10000 (fsl,etsec2): queue-group@2d10000: '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index 2f4c0e468952c..3fbc3254d06a3 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -718,8 +718,6 @@ enet0: ethernet@2d10000 {
 			dma-coherent;
 
 			queue-group@2d10000 {
-				#address-cells = <2>;
-				#size-cells = <2>;
 				reg = <0x0 0x2d10000 0x0 0x1000>;
 				interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
@@ -727,8 +725,6 @@ queue-group@2d10000 {
 			};
 
 			queue-group@2d14000  {
-				#address-cells = <2>;
-				#size-cells = <2>;
 				reg = <0x0 0x2d14000 0x0 0x1000>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
@@ -748,8 +744,6 @@ enet1: ethernet@2d50000 {
 			dma-coherent;
 
 			queue-group@2d50000  {
-				#address-cells = <2>;
-				#size-cells = <2>;
 				reg = <0x0 0x2d50000 0x0 0x1000>;
 				interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
@@ -757,8 +751,6 @@ queue-group@2d50000  {
 			};
 
 			queue-group@2d54000  {
-				#address-cells = <2>;
-				#size-cells = <2>;
 				reg = <0x0 0x2d54000 0x0 0x1000>;
 				interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
@@ -778,8 +770,6 @@ enet2: ethernet@2d90000 {
 			dma-coherent;
 
 			queue-group@2d90000  {
-				#address-cells = <2>;
-				#size-cells = <2>;
 				reg = <0x0 0x2d90000 0x0 0x1000>;
 				interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
@@ -787,8 +777,6 @@ queue-group@2d90000  {
 			};
 
 			queue-group@2d94000  {
-				#address-cells = <2>;
-				#size-cells = <2>;
 				reg = <0x0 0x2d94000 0x0 0x1000>;
 				interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
 					<GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.43.0


