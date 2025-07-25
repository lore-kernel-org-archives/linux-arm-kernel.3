Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D76BC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECtHhyfFH38qadk/ISzZNL2Uf2YjTYogt8LaYtsMj5U=; b=OT4SSkPSnV67krXI9FhV3AYh0f
	FOX8QgDa76HmA2TA4Rvb7GCisnrc/y7qNPT9juwQ+c94t0Ch5UspoOTkwB7xnJ4W7YM0PjXk41kHa
	YvGwELP7rWdzk92hZIRR7GSpo9PmkeiVqJTFc6QFs1ulpnhYl1WisqXPoBiHbjPCp5SmMgvUra1Ak
	t2SeFdd4DYwbM55OQZwj/chysd3QzFGPAkGbpr3sAnL2LUwAo+8LmOhG5QZ7uOW14QVC7Jz1K1PKI
	K1rKLU1BS6KCvzqwIxC1CoC7o4J14N17JJ8egXAh1SL6AHW/UvLVnl91zcCX5HMs9tgb6+JeQ/NtK
	P/0u8jzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBvL-00000009AHe-0tZQ;
	Fri, 25 Jul 2025 06:28:55 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBh6-000000098Tr-1HAQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424052; x=1784960052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ECtHhyfFH38qadk/ISzZNL2Uf2YjTYogt8LaYtsMj5U=;
  b=LsB8DfbZZ9P5AfHSg2rdf9vuU/gDye+1FlhbhWPmNnF/aBkgIz3R3C/o
   nqPLYEZw3fk3YU2ibZp1GL/Fx3PLKsRkaL2PHOizWvTxrqLQnFKq1ZPPl
   u4IZljOBKNzIoi/N5wKTTUTrpeVioeCYC0OoKtMrQo5wnws+CddlzzLQC
   FFANf8gHHj0OTSGbWRn+5RFqdOs+TgRE4yptKeK5NyjEbYKsnuBFB4ANh
   Pb5MruZEpsP0bumLug4ygqdMn2ZBlg1tQ0bCpl7FSMH/jck56t8CkbpIu
   DnZrh37C1qv/QuQimpZQyiCUGxvw+RXkRpZrocXEPZ3gltxl82kje5ift
   g==;
X-CSE-ConnectionGUID: qMI5EVDpRGa/OG+Yv6VssQ==
X-CSE-MsgGUID: jJs88hQRQPiPS4/rlM/jNw==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413025"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:14:11 +0200
X-CheckPoint: {688320B3-D-8CC3CD70-C1DBF452}
X-MAIL-CPID: 12D093B559C5BFF32E5EC7CAF067975C_1
X-Control-Analysis: str=0001.0A00211B.6883205D.0085,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7D6C173650;
	Fri, 25 Jul 2025 08:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ECtHhyfFH38qadk/ISzZNL2Uf2YjTYogt8LaYtsMj5U=;
	b=YJxAjlOcigYq6HBSUfNW7fIqzJ81IdrkUUlopPbe7AXfIx8J8M4SD0Eu00bs8xBA1MOKUA
	Cfl1mmGrVrqIWhwZKWtV40AEUYR8hpdrTs6jOsjtcigCaJFBbkrGSe4D+tr/KneG/IZBpn
	YSUUrIo5PbAco+sieXIlwDPR7bbhZOPHaHtKZS4vhIjIz5hJyrkvF4EgNVAVDweChtbbD/
	LkTJviEhuztY3NFTQ4/Wwtgv87ssk4m64s8jxy2s9NzDFD9P7scxGhrv0XhQlLYOo+L6iO
	alJdSwUBl7mAtYhsmJ/7Zb0VliIB/cfEh64zt84s5az61Va4zMpxh5zXMcwQ9A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] ARM: dts: ls1021a: Add reg property to enet nodes
Date: Fri, 25 Jul 2025 08:13:30 +0200
Message-ID: <20250725061339.266125-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
References: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231412_639961_FDAFEF04 
X-CRM114-Status: UNSURE (   9.42  )
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

Add missing reg property to enet nodes. This fixes the dtbs_check warning:
  Warning (unit_address_vs_reg): /soc/ethernet@2d10000:  node has a unit name, but no reg or ranges property

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index 2c39981bb94ed..2f4c0e468952c 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -707,6 +707,7 @@ ptp_clock@2d10e00 {
 
 		enet0: ethernet@2d10000 {
 			compatible = "fsl,etsec2";
+			reg = <0x0 0x2d10000 0x0 0x5000>;
 			device_type = "network";
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -737,6 +738,7 @@ queue-group@2d14000  {
 
 		enet1: ethernet@2d50000 {
 			compatible = "fsl,etsec2";
+			reg = <0x0 0x2d50000 0x0 0x5000>;
 			device_type = "network";
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -766,6 +768,7 @@ queue-group@2d54000  {
 
 		enet2: ethernet@2d90000 {
 			compatible = "fsl,etsec2";
+			reg = <0x0 0x2d90000 0x0 0x5000>;
 			device_type = "network";
 			#address-cells = <2>;
 			#size-cells = <2>;
-- 
2.43.0


