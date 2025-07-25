Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107F5C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3Bo7hwgkDBM6nqKU7R0VFGIv7EhhZBmURTkrOYhE9o=; b=n6ntUz2EuFzDNi1tjzmO4pjEIp
	EWri1en3f7CrP/+2ZNBAn0WBmhRx0uK/7Lb6olKSmOCHyAzqQgGk7MefUFfVmGhunaCXM+OIC0wAO
	DFF09ohjX8iWrq/yqt/3kV3JoiV5PX82ndXNmfpBa7Uaf+i1YGx/iaZdzJdzseCoNd7tppS6gNDrN
	NlDWsmBiE9LNB5NtKU+twSN50phVb0wYQikU9dpvjzgAcSXcqz/3qG+MQ57MChRwXxtqitBPCiBjz
	I8DEoDErza2U1DhBx7TGvhosqBNM21IsgLsIvp8PoBeyC8W3MnMyDer3ztIKFwY6NQxnI7aCeaZmZ
	fxrTijhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBle-000000099RR-3Bbw;
	Fri, 25 Jul 2025 06:18:54 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBgn-000000098Tr-3TQC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424033; x=1784960033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r3Bo7hwgkDBM6nqKU7R0VFGIv7EhhZBmURTkrOYhE9o=;
  b=E7gFgCQW2V7tVS9TFYrZgGMEOYMCyZwgK+EbhW3ziDy7DgGsjINaQrBo
   4wKPZYzjt/kX6pz0TCQ/JR03AcIXp80Pd8L3a3BLnLeszSXVPLVtHKXCP
   j570hdFW47aqLREwQ1Cg2wmtfp/tJjNGet4ynS2DkidxuyryQvVDI1Vo8
   gfjAYR3ju03PNB0DIU/99wvUMVu8WkK5rkJa6juymIfGn9plJccrcI8DZ
   TbDQHF90hInDJHKLQXAqghl+89jryH6FdFtss+Vp/3P0VEpsKULt86gI6
   A+XheyLA+zNsnPrWMaopIA+tsTZKuZmVR8LpDqhQx6lUhSFFXVpHVerpi
   w==;
X-CSE-ConnectionGUID: Sr/Fpg8eRuKrji1bB1Ka4g==
X-CSE-MsgGUID: FPFU0K1EScKCHT8hl0Ybvg==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413013"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:13:51 +0200
X-CheckPoint: {6883209F-2C-FE216C80-D1ADDD01}
X-MAIL-CPID: D45E6833F87445DA0169DEC968CF19BB_4
X-Control-Analysis: str=0001.0A002103.688320C0.0081,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48A08173634;
	Fri, 25 Jul 2025 08:13:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3Bo7hwgkDBM6nqKU7R0VFGIv7EhhZBmURTkrOYhE9o=;
	b=tPjZmlfQrUB7YMY0hECYInTJljA9+8ujQYRO96v2k9rxOOQAr8x7IK4WOYEvosAf7g6JOL
	DOe4gotuafO5vMAlJuVIICZUVfQVLaxJ5QnZVjqc2iQetJm6LehyiYNWK6pakt6JAFAtpk
	1h4eFJ7hMI2nJBqircN2hD+QYq1pVr1vvdkiMJjoJHyjFfK4tLnA0DntcSr7hgVCfdE4Or
	2YyW99TyQExR/Genlz12o+2KWZuKEPjyOXaSLuon5Zrc8xlNvstjMAeYASe0EP0k9F+DK0
	gfFHcD2WYAKOYt95VqriRGgmyEiJEIrMxHvXcmbSO8qkh4QfIgCIFgqQb5iWWA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] ARM: dts: ls1021a: Fix gic node unit address
Date: Fri, 25 Jul 2025 08:13:26 +0200
Message-ID: <20250725061339.266125-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
References: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231354_171486_3F24EF45 
X-CRM114-Status: GOOD (  11.55  )
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

Although the GIC base address stated in RM is 0x1400000, the first address
being used is 0x1401000. This is similar to imx6ul.dtsi where the
GIC base address in the RM is 0xa00000 but 0xa01000 being used in DTS.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index e86998ca77d6e..fb44c76bf1d17 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -96,7 +96,7 @@ ddr: memory-controller@1080000 {
 			big-endian;
 		};
 
-		gic: interrupt-controller@1400000 {
+		gic: interrupt-controller@1401000 {
 			compatible = "arm,gic-400", "arm,cortex-a7-gic";
 			#interrupt-cells = <3>;
 			interrupt-controller;
-- 
2.43.0


