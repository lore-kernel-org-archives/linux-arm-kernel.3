Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CB0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XSyraYs35D0+y1/ijk+T4yWpudMHNIOuixWwtG9nEw=; b=m2AlVnBU8XUwipn5QHUpi8YQT9
	zLra6zjkafXJXkPzP9MmiyPeFTIZCfYlPmuuQOf4tMX8nl0Jrk3rHA6dCSHZtf4/71YRozO/qmAVB
	C67S0o7XrwzckcufEPEqFgtJ4hMYJyp6kcOc9XBHJxUhg5bXEUelJWg2Fi8rp62QK1omSgM1aG+l0
	X0SD7Vn2wi3UIuRcGaXxLeH7sVBr55vh8wmrkLfGrvyqaTEgl1OuCk3KmGpUPYZaNFBOr3wTJW9Jo
	PWzAl2l1x/tc1c+XtG33NpBhVQAMuLmlZEe2Y7xo6BP+LGZhFCfocWJWrD+198+opKNF78FMYUaAC
	ZdH2hcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBsv-00000009A4k-1gaS;
	Fri, 25 Jul 2025 06:26:25 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBh1-000000098Tr-10RW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424047; x=1784960047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8XSyraYs35D0+y1/ijk+T4yWpudMHNIOuixWwtG9nEw=;
  b=qL0ByG41LGe19qAjA50kHtMiN/+dA/WlJfwaVneIn6SLaoEqz4L0hgGu
   bxvG4Q2rmiLHC0ZsithT0qB3fFngb/KeJy70JMv1ViCbRJPAFpmZUp0/7
   jBX7OwsTgN01dAKPeMB4IkWFzrg3Re01u3vQ6JHjoLwqNp5W7E+ntxFoy
   rGx1NXrALUoaFo+MC1OjSWmue9GBikwHbNJIubIUZJ5C5fQXc2LLf8sFG
   quUG6vdCN7MqeibuurQ5hqIyzG/xdQOQxzn274IhnEfZPWaP0sDYk8+YZ
   sSrekexM/8o6TNw/YOTbUCGsf/qLogGaTzvf+zBH5VDtMF6PXjLxvvCXL
   Q==;
X-CSE-ConnectionGUID: diKDlX/GR3S/6+w76OVNzw==
X-CSE-MsgGUID: R5bMwt1tQmmOYMZADQgPoQ==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413021"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:14:06 +0200
X-CheckPoint: {688320AE-B-943DFC15-D71A48EE}
X-MAIL-CPID: 122BD96570BF616A4CFE28D8AE1AE920_5
X-Control-Analysis: str=0001.0A002103.688320CE.001E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9120173644;
	Fri, 25 Jul 2025 08:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8XSyraYs35D0+y1/ijk+T4yWpudMHNIOuixWwtG9nEw=;
	b=DC1LDDxKENfFn5Dg4IpPxIDJFAmt/NQuaZcaMJIvj+t14Hty0lcvD5lbh+vBEqwDZbq6wT
	KFyVqI3qBf5/ARLs6q6xUM5KpZFX9MKOApF2DWdB0NLYFL0apq7k0h9821QWePZf5hFwHr
	BOeOa4O44W11Uwi0BFntZCaoXLhMwIcohSFooE8tjSIP3C/idIpTjAAsREl1iWNGFzPw7e
	WB28+HH7oqO4ZzzQ760DWG192x6piViH7CWVjMzYHXD/OhP7LlaNyK7cDJ22V8hNcckQfc
	orFwiK8hf3mA+tpQL+1bNtw4nufmuInCcuZ5UrNe7L8NsAK/N5FYmTW9TjRu1A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] ARM: dts: ls1021a: Fix FTM node
Date: Fri, 25 Jul 2025 08:13:29 +0200
Message-ID: <20250725061339.266125-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
References: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231407_584435_4D4A2E4D 
X-CRM114-Status: UNSURE (   9.54  )
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

RTC nodes are supposed to be named rtc@. Also remove reg-names which is
neither used nor specified.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index 2351374c2e107..2c39981bb94ed 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -944,10 +944,9 @@ rcpm: power-controller@1ee2140 {
 			#power-domain-cells = <0>;
 		};
 
-		ftm_alarm0: timer0@29d0000 {
+		ftm_alarm0: rtc@29d0000 {
 			compatible = "fsl,ls1021a-ftm-alarm";
 			reg = <0x0 0x29d0000 0x0 0x10000>;
-			reg-names = "ftm";
 			fsl,rcpm-wakeup = <&rcpm 0x0 0x20000000>;
 			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 			big-endian;
-- 
2.43.0


