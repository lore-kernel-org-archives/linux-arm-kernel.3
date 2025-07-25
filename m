Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EEDC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFGBAdS+mixe9vk7NaiCL/hL2zPXjl2DzAJ2n+tbizI=; b=1EDr91Q4QBhowTSvXbMqFuWTeQ
	Yyy/Of53Q1WEndifrBOvzaIj7BeGTTcfRmsz2fB84xQinfwaBBoZ+/24Jf2qDL1f82JSRurT53LDx
	xYYX9EV3/+7cbyQNj++XhMtGYwvIaDoEL5U3a/M26Tdo6VJ2Mb+Djpr7bpTR54de8gqX3UFhp/0R+
	acFTOeafkpUYxgRzESQf+1FbGmzFJvrcoIwZsR/WCC3T3vHU/HsdyTaxzkgtd2DMtmYw4iwCCUDe+
	toDQfoW6eLXCO8R9zwJ1dhbS52lOhtypcmPxjMHo9rWiiZ9aDsm7MllAXCZSSHvc7/BNi1nn7/75l
	Tuk5Awmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufC0C-00000009Ajn-18vF;
	Fri, 25 Jul 2025 06:33:56 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBhf-000000098gl-0U5e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424087; x=1784960087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OFGBAdS+mixe9vk7NaiCL/hL2zPXjl2DzAJ2n+tbizI=;
  b=q8IICe2GC5KekDbURtOI7Xmous52YSAddHUZdG0XSnQt6oXWNITk5GrG
   0ZR0w94a2brKJy9PTJiMHGZx9Z+8Kc6Hs131+rpdlITOeR9UX6PfahsU2
   uo0Gp3vl0wVjdYJLxLjKVeE4sDI8Y6D6rDXN1ASNjCaHBuOcmsssGFr9O
   P+DOuxOW2jyzqa8XPpj49MvrXBOHTeH+0Hld003DmMSS65qjzZ1qKGyIU
   7eU31/Ge56nSJZbBR+cc3ccB5Gj64tbEqg0/XgxiJQ53PBUEm4jzzk2Pc
   bKUklwamoQkP79umeju1L5QOSDuCHEkor0wGrMQ+9HEetpSDhn97B6XZq
   w==;
X-CSE-ConnectionGUID: bzj7nb9TQAKxnKlZqZLnuA==
X-CSE-MsgGUID: exDXFFPNQHi60rSerMCF6Q==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413061"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:14:20 +0200
X-CheckPoint: {688320BC-3B-8CC3CD70-C1DBF452}
X-MAIL-CPID: A3594A0549AB77DAE7113CA3E525A7BE_1
X-Control-Analysis: str=0001.0A002116.688320EB.0034,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 661C2173652;
	Fri, 25 Jul 2025 08:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFGBAdS+mixe9vk7NaiCL/hL2zPXjl2DzAJ2n+tbizI=;
	b=m7w2JHxqYxn/oykfXDu4chZ4yORMelf6Aynzt+QVB98vD2uz5Y3puvLIs9g5nlCqZ4pMTX
	Ou+ivFdcYzh3uJVRRaPwg3tX4s5TfwvyqfV/xQibZ5XWz7Pa4N97KSm659MeRFa8oQW3rz
	GC8PinSNp99/R795NTVoKW74iGJ/E565dbNrIpGwF1WGdO3zSUkgmMJGGaScp3Ad7eN2Q2
	KrsjZ7vvs7AdhYX52mNLc2kEvXDooDUBzXspNvUGY4PfrpCLRIV0Xs9QuVO5lFeoEAuvcR
	ZAnH+tZD9Ro42gHMI8y9K/GFodKOcNBXIYxs5+hCz6wsMEbBAlBAAWcZezBkyA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] ARM: dts: ls1021a: remove undocumented 'big-endian' for memory-controller node
Date: Fri, 25 Jul 2025 08:13:32 +0200
Message-ID: <20250725061339.266125-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
References: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231447_461066_20ECB1A0 
X-CRM114-Status: UNSURE (   9.38  )
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

According to binding doc memory-controllers/fsl/fsl,ddr.yaml
and driver drivers/edac/fsl_ddr_edac.c, default is big-endian, should
use little-endian for little-endian system. Remove 'big-endian' to fix
below warning:

arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: memory-controller@1080000 (fsl,qoriq-memory-controller): 'big-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index 3fbc3254d06a3..9c9044ce7bc65 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -93,7 +93,6 @@ ddr: memory-controller@1080000 {
 			compatible = "fsl,qoriq-memory-controller";
 			reg = <0x0 0x1080000 0x0 0x1000>;
 			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
-			big-endian;
 		};
 
 		gic: interrupt-controller@1401000 {
-- 
2.43.0


