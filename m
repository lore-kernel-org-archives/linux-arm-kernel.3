Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59359C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2M5zCaIWhbk8FXF6KTQw3rrtOvrfwFLiMBbwugEplvA=; b=K8Z39i7lucr6C1hsqMAJkuxUZZ
	fMNtPLAg8MsOiZ8fhLkiI1yNw8yuqtiKDVUUS7OAX2+TxhDWJq2H/XVFDMY4Mr8BX5JOiYwc5qjoU
	YN+OAqVJAKXEvOO4HEcgF1NNdqg79qQoEmPpSbwlGxEgJUjhxJFVTGk1pdBiM99QNhVeqh+KyHUsS
	6PuCF5R8Hakwpb7yVWKtVsz+TJK/fJakprs96C1rLKwe2SWwjBamZXplT2ucl89TLfl1QR2MpGYd9
	duN+3nhdVxUm0mdmsJ1xuqC/u1e7m6G+KHsRBQoPs5XcPt42vN7qntPd/9KnYRl7t/p5b4zt1vyah
	flYfKVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufC7S-00000009BEl-3I53;
	Fri, 25 Jul 2025 06:41:26 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBhj-000000098gl-1Bgq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424091; x=1784960091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2M5zCaIWhbk8FXF6KTQw3rrtOvrfwFLiMBbwugEplvA=;
  b=UNIiCXyGRq1RdTuOjB3JjRf2fjUzRp2weXf/Rx8GEF0JNFYPxObTyyrN
   IkbQxXRDVTLvbvhWGDVqOKHd0VQ3cR7xT54MqhzGEW/Yg4bReFB7b9DvA
   huafJ5W5K6XSDe/qBErIC9AOPLavdqLpqZLLOjp+zvwt2eOquMy0CM6RD
   /kuQEo2aHltHnk9LsH4qRk/c+V/gdJbNAcvAUeEUqJ/aLC5CB5Easl+DK
   aH2N8wVK2rIFa5QIvc0kSnyoJez3E0JLVxaGny34J4baQaPobTBavUZhi
   aDV6eRXKlYCiyGQtzv/mFlCyHlt5DaSDSFbSDMXHESK0bGPMsJIp7R48S
   Q==;
X-CSE-ConnectionGUID: vj0Xval+TU6L4E+KkYFKHQ==
X-CSE-MsgGUID: e0UYQv07Rr2IU+5AcuTbHg==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413070"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:14:35 +0200
X-CheckPoint: {688320CB-15-4FC15ADB-CD71293B}
X-MAIL-CPID: 7817297EFDE73460672EC898B02D0DEB_0
X-Control-Analysis: str=0001.0A002105.688320CC.000F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6552173655;
	Fri, 25 Jul 2025 08:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2M5zCaIWhbk8FXF6KTQw3rrtOvrfwFLiMBbwugEplvA=;
	b=VxiPD51TJoIhGqddFUk3rSN6Lk88z/vA/Zzm+qLUqzE3qOn9qqrX6NOJN2OMiatew+LAFm
	647oOsbU+HkUpShphEQkrc+/ib5sx6io/ufZvlpP3tMD4HtpJpTK4xJXhtXdaCwfrKsPrX
	iPLcYu3LUj8bWlyPAv6o2MJIUr5YaJ8EYS2z9lNb9xbqZJKNdgDGjjToQp6bL7+KGI5Bab
	h2ffTe8COXw0x5fSFMro3QDrvLgFW3jNOlyHO7SKzXXLb8blfAazY+BqKWp1XhXjHBeO1e
	TacC3iu5Qjm2TTvGB8+Ij0Z0/uf2Wi8x2n18+Kz9LG8zJ6PyNnM8f2qy/dYrJQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] ARM: dts: ls1021a: remove undocumented 'big-endian' for memory-controller node
Date: Fri, 25 Jul 2025 08:13:35 +0200
Message-ID: <20250725061339.266125-11-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
References: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231451_625011_BDE4F78A 
X-CRM114-Status: UNSURE (   9.39  )
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

According to binding doc mmc/fsl,esdhc.yaml and driver
drivers/mmc/host/sdhci-of-esdhc.c, default is big-endian, should
use little-endian for little-endian system. Remove 'big-endian' to fix
below warning:

esdhc@1560000 (fsl,ls1021a-esdhc): Unevaluated properties are not allowed ('big-endian', 'bus-width' were unexpected)

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index d8a43c5aac80b..abb3e5ed7e027 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -161,7 +161,6 @@ esdhc: esdhc@1560000 {
 			clock-frequency = <0>;
 			voltage-ranges = <1800 1800 3300 3300>;
 			sdhci,auto-cmd12;
-			big-endian;
 			bus-width = <4>;
 			status = "disabled";
 		};
-- 
2.43.0


