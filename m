Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B6EC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxJ8svvO++lwqiGfnRQsUVlvsvUpsD2cA8gkdWdUYHk=; b=m2Belg/vXmplahzh2Z7FPOypGW
	4G8fRUBfoSn3cdY3ejhqJ2SIvQ7C34KwflkkmyGZmpNnVKEUkjc4IZvwOgleroX/j3CwNwCymvJ0A
	pUVB+cZBq+wTGzOHNZxI3M+LHFNz4sF0I3ZUcgHYY0SBXQV6IFGUmEclqXAjQkZCfU1w23dkIvEtm
	KKQ0jbc21IQtK9rcE5i+FYRmH4Fr1ruzNPDbWKwW/woPIpLI86xKtGhY/InWvI1x2TaQ1RmNYrv78
	6/q84zdeJaHuRJcQeAIBcoNUUCa35szuYxMFZQr2Iy47O0ubAZ9x8OGO1j+HgnZPGtBpe2zTnwerp
	DwZqvHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufC2c-00000009AuV-0wVY;
	Fri, 25 Jul 2025 06:36:26 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBhh-000000098gl-1tON
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:14:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424089; x=1784960089;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CxJ8svvO++lwqiGfnRQsUVlvsvUpsD2cA8gkdWdUYHk=;
  b=g4apdgdQ43otEgIQSa0vVOJUjIBnP5n+0QMz9kEeqc93/t20JnUw0tLH
   GL3zVpZRPBgQgHnD9y/8PdUbWbWwwrGQheYA89pWH0xqqQSk/vxRzuc51
   ICKEvKsSmuuBi1eebPxQBULCNfiv5bjzppMPOc+QhuxScBgB1GRE8Zy/v
   zSHyhdcMiLhHJi+qky/pPsg+EnMxtwB+wHQKmuIx73MIai3v0LcNXwB8m
   au3TVdOjxCp7PT0yS0ZMe0gF+BRBNL7Xs1hmE+3/k8dJvK30HaHG5ZLSV
   QcdksuhqwCL+43X8eYI2BqPSsq6+3RJg8pnShNR2nq5+xoiwu+jrIAlgo
   w==;
X-CSE-ConnectionGUID: c6Zya/w8RyanKZQEpvl8XA==
X-CSE-MsgGUID: lobUtPqRQXyh2mmX6V+53A==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413066"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:14:25 +0200
X-CheckPoint: {688320C1-23-BB1FFBB0-EB2CC75E}
X-MAIL-CPID: 532422985F7306734FDA00AB5C8892EC_2
X-Control-Analysis: str=0001.0A002110.6883207C.0030,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 377ED173653;
	Fri, 25 Jul 2025 08:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CxJ8svvO++lwqiGfnRQsUVlvsvUpsD2cA8gkdWdUYHk=;
	b=PPZLW9WCqXyqd5/239u4YWQcP1hQ5877JtkflTQbZFl+QTi+5Rj01qhejTCaTU31S+E5AY
	JQ8q2dj9GsgsiwDimq1Eo+g6Q7tDF43BNHYD17NwTjCIRfxCg0v6+QEhR0DH4fS8/9HcIp
	+mHwUpeorS2L8oZppTeAPZcPS/KkIsu25hKvDkI+mjAa2cvy+VKN7DGoASRAazpd7funLa
	Y6QQl+I7Sn4QWQ4yrIEKG0rrx3MhPIHU1C6pKaYbt5WwKKzrnuAwlza13Ur0+86tJcvWNI
	Vyoy+KKuluoivZrVKtfvCmygOtuD9uhVwJNKQ1IdUEg0LGL1qVAtO3pwC3CCKA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] ARM: dts: ls1021a: Fix watchdog node
Date: Fri, 25 Jul 2025 08:13:33 +0200
Message-ID: <20250725061339.266125-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
References: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231449_788824_0C3C9A2F 
X-CRM114-Status: GOOD (  10.16  )
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

There is a dedicated compatible for ls1021a. Using it also fixes the
warning regarding big-endian:

arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dtb: watchdog@2ad0000 (fsl,imx21-wdt): big-endian: False schema does not allow True

Also remove clock-names which is neither used nor specified.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index 9c9044ce7bc65..3879cfc3efc99 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -610,11 +610,10 @@ pwm7: pwm@2a40000 {
 		};
 
 		wdog0: watchdog@2ad0000 {
-			compatible = "fsl,imx21-wdt";
+			compatible = "fsl,ls1021a-wdt", "fsl,imx21-wdt";
 			reg = <0x0 0x2ad0000 0x0 0x10000>;
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen 4 1>;
-			clock-names = "wdog-en";
 			big-endian;
 		};
 
-- 
2.43.0


