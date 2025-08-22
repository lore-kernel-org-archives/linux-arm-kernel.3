Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B88ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i8SzWexuyxV3a/gZZD74upExkExDhyw1A7Y1hYQSeJQ=; b=klGPNK2YhiBzW/vP3lvE1bmMgC
	XEGSkXVyqhruGUDIJ7tZmmpanhDqoPzdw3DdpWDvlQVSnu4yJy8BWet2bVed+y8KEaMLrGYYAwfGt
	o/KXKuTOCbc5NDrgdZ3fDpygviGXJmAy6G/BjnG3Dv6/ncCpH9xAr9mEtDNj5LRER0sNCn7QtHGoF
	6sK6bBG+/9wWfde7yaQVZmAd0zC2boEHMYoOq9Gp+7pbA68mJIaVjHD7XKs04prhE8rew4QhAOx8Y
	p89/oQSq1+X6ZoyEacHzI8Ag1A4lWT1FQzxW/QgTMQhCH7PaN4BsKckw9Jg1MsHK/tmHow16ZYf3a
	X5CavbbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphqd-000000045ZI-480r;
	Sat, 23 Aug 2025 06:35:32 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upS9n-00000002g5C-1p5y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1755870615; x=1787406615;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=i8SzWexuyxV3a/gZZD74upExkExDhyw1A7Y1hYQSeJQ=;
  b=QgGX7ZhP/qsjNITTnIeOJm/Z0tJcrWt4uLrPb+EU0lDt0wOGKnwjiTqr
   jUAp6bGQV/ANp8cUmNTOEAEXbGsrgmrR5cxbZU+gUupc2wCdKm9guwM4p
   MpS/BbFgG5jOmAZdyAA3CJIVA+TM9B528yvhZlkVsNu57/dfXLOjPC4ur
   pAiUdU+v1aWH/q2LgVPEtcMPGCCr6268SPHsvJeK6tiFQRUI87ayn97Jn
   YA6OwmRm65cBknDoVpobfoHlAyibt+7TtIWCejXybRYvySc301n20zK8s
   7jGR2fkogF/f5lJvD6j1jmqHjVas94KycAwUfjrZlXdwIrfErrCYVz9pt
   w==;
X-CSE-ConnectionGUID: RK9H41DpTCS3CByLwAY3rQ==
X-CSE-MsgGUID: skqb6SrqRDSeFAom8mYn5A==
X-IronPort-AV: E=Sophos;i="6.17,309,1747692000"; 
   d="scan'208";a="45868362"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 22 Aug 2025 15:50:12 +0200
X-CheckPoint: {68A87593-22-20CAA7DA-EC9DC758}
X-MAIL-CPID: D0CC8B2240F01A85C119B8645B255DF3_0
X-Control-Analysis: str=0001.0A002119.68A875CC.0049,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 626E3160B0F;
	Fri, 22 Aug 2025 15:50:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1755870607; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=i8SzWexuyxV3a/gZZD74upExkExDhyw1A7Y1hYQSeJQ=;
	b=s+1VBDk+fgy9gxQMAjPdNyt098wOeiyJM/96Fa9To++aaoDGuGvZhl03gt1aOqHeZUfrB1
	ArdVeUUUoVzwcwfmAegOUzfppZgiPNXiFBuyZyiwN3bXNohJBcpiBNT7SgrRpv45BwaEFn
	aRA3A7gu+R6nBseyw4TnWdFt1RH4UlqxBnS+HNIvEmS+0ZILdwhsu6on3PP8sCTStO1p20
	EZj57KM7ckqM9BVz+muI/Ez6XlIK48KtBOqdjHnXusyLLWTG9eZIJvwYHJcOF2oII7OTl1
	8VW/1l+r7sEv5OV0eOIu1VNwovmcUjoR0DSNIxUmJkGbNSMw8p5+5RIZs+4Dsw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ARM: dts: mba6ul: Add MicIn routing
Date: Fri, 22 Aug 2025 15:49:54 +0200
Message-ID: <20250822134955.3321137-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_065015_963641_BCBA966D 
X-CRM114-Status: UNSURE (   8.00  )
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

MicIn is connected to IN3_L. Add routing including the Mic Bias.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
index 67a3d484bc9f1..65fde4f52587c 100644
--- a/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi
@@ -146,6 +146,13 @@ sound {
 		ssi-controller = <&sai1>;
 		audio-codec = <&tlv320aic32x4>;
 		audio-asrc = <&asrc>;
+		audio-routing =
+			"IN3_L", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"IN1_L", "Line In Jack",
+			"IN1_R", "Line In Jack",
+			"Line Out Jack", "LOL",
+			"Line Out Jack", "LOR";
 	};
 };
 
-- 
2.43.0


