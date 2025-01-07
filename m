Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32898E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS3pClhkPDA+LwJhdHeZUgZI8RZQtDpKghxvyQ9FWH8=; b=pWFwVrXoKJofuXfvthRU6/4fg0
	BNJrjoP70caGCQXfA6/gn2ANHdpliWfglONbLISjqsKmFUPfPls58Mz94G+bI76uX5rascGj/ctw6
	bioNqgJNV/quNTSUJJaQZnf400HSAfDV6S+p8QzIceltvKdDgByW2cnIbny8JvdFGfI3/SfJdf/jQ
	kORnDas5tRERw4NASkI7FB+lMvxzANlqP6MdOuEXRsqsZ89gfj0pFwJ869qSqT5BUC/qtg2V1QzfZ
	k/T4rpdw0jd2nIxrQ0fuam25mZpjSld/x7Y1fISM66vLOvZV/IE65C5HAyGEEQtOl8EseETE3z4XD
	3lb7rJJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAEr-000000056vI-3Ley;
	Tue, 07 Jan 2025 14:07:21 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVA9K-000000055XH-2JXH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736258498; x=1767794498;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GS3pClhkPDA+LwJhdHeZUgZI8RZQtDpKghxvyQ9FWH8=;
  b=RS+Vx9iShaM17boFDsJbqJPz5AFkZsBReJ6dTO6SBZ5r2jUo8QWNWuJu
   2jpcJ0qmzdsS8gPFbww9/TMFibpJ5I0GKq66IuugEM9ywBn8FDCZP2OvR
   ZMEtxBbdqCG1SDvSFL2ezaDkzqbck5E2OUFvbF5JuQzmzvJVfypmg5w/i
   qSipKcrf6MsAGCdjeJirgbostMvmnlvCBUXUYz13cvBQxs8rg6EGXPVgR
   epgn7Po1iC4LSOMUC092pVcmmIkMAviGpEMI6qu0NsDiV8ul6ktPmoEGO
   lMojXk09oM9qOKV802N4lyebZnRy2VpGKa6tqsY2T1MqCkBDN2mIHgzCA
   A==;
X-CSE-ConnectionGUID: sijIt1uwTQ2iWSD4Mcq7Xg==
X-CSE-MsgGUID: pQkbwoTpTRC8ZL1KtKdJSA==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40896224"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:01:36 +0100
X-CheckPoint: {677D33C0-4A-3C670366-E45AD810}
X-MAIL-CPID: E9B2B5707E61DDE3D759F2B39E22D7DC_4
X-Control-Analysis: str=0001.0A682F21.677D33C0.00D3,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8983164F28;
	Tue,  7 Jan 2025 15:01:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736258492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GS3pClhkPDA+LwJhdHeZUgZI8RZQtDpKghxvyQ9FWH8=;
	b=Sjg0BqcGNHUmWKsaSLDRySJbRiDoIzxHxmJ8GX637wdihyry7UUk1x9akC7kDvbEhIu2ft
	fBr0zXhcgJl7GGese07uUNALW6BLca9XhwS3oZ4A3iEODSOTbGAwvmVAK0KHnI1ITxnJgN
	m0bmdBsjM8wuEM1W9JQ3xS9Zwu5h26Ou0hc9K/hf0+tk/VcyQUf+YzmI0YhmnC33i5CTBH
	pJ43souOKQKCfj0bapOSopVAUhkAYpv/DEyi2cKeIZOlylRvAdGklPDpOsY0PQzIvCkTlQ
	g76g8CtgQnt+pkNoOWQRD2Gq8yK0luDU+Zo0OUqeWdEcweSyNlr3CbLbvhpL9A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 3/5] arm64: dts: tqma8xx: enable jpeg encode and decode
Date: Tue,  7 Jan 2025 15:01:08 +0100
Message-Id: <20250107140110.982215-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
References: <20250107140110.982215-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_060138_893280_31BDD090 
X-CRM114-Status: UNSURE (   9.20  )
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

Enable jpeg encode and decode.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/tqma8xx.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/tqma8xx.dtsi b/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
index 86b4e2b75adba..50aa41e3b6d51 100644
--- a/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/tqma8xx.dtsi
@@ -115,6 +115,15 @@ m24c64: eeprom@57 {
 	};
 };
 
+&jpegdec {
+	status = "okay";
+};
+
+&jpegenc {
+	status = "okay";
+};
+
+
 &mu_m0 {
 	status = "okay";
 };
-- 
2.34.1


