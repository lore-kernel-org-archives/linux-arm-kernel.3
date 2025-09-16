Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ACBCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 05:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zf0rlUPIS9TkW6EtEY94PGkcqdgP6qxZVUo3leDvhyo=; b=ayesrl+IH5rNI8bHadci+bOyCs
	6Qva6VjdCDhdT8gLMzYIAlROJu3MjYNTPMg+qGI8411NLfnllkcpspF660zCbW+5bhSX9oUUn4ZAP
	QvlLr7Z6jVzaoFjw5K9+UQk4l+XBE2pZ1AIJvsxXJu/unoAaIf8rzCmLQ+ePNn2MePRIbFwj6Dfix
	eBNki4bqLnnyvjooHr1yM4+TEHDkW/A8OU6mKtVozQ/IETIAsYZLFb6WB1TPDje1rwW+Yhxu0Dc7r
	X+gjlXTZdxfI7ekhcGdj6BTiVnZoHEE1v3yE3iIIX4DVrqtbxLvYGpB+uv7UXlJ1WWjtmG8u9aAnm
	a574hhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyObO-00000006qm7-0Y7T;
	Tue, 16 Sep 2025 05:51:42 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyObL-00000006qkv-2OgI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 05:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1758001899; x=1789537899;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Zf0rlUPIS9TkW6EtEY94PGkcqdgP6qxZVUo3leDvhyo=;
  b=lMQtSDx+FiWNzPx2n98uyxnI4so7rKBmfHEF1xodVCvTEDSSdWenW6ir
   WYbZwNm0B1kNWh52VLP0s14Pj/0pcETcmn3fGJyDKbnNvIM3p015wZQPX
   lngPaZr0OotRF4Msbmsb54/lmJoWaZ3eUfhAI4Q5F6D1A5PrYIuh094Eu
   friYyCCqcU6bxVrOVkns3245enzPY7najyzOMLoUXEPmFgA6b27EyVM5f
   0Seb89nmonq/wamDXC6QCk6NaRVOZNaXSk/ZQuZaCaR3PYrKt1C/VewwW
   6AsCW/L4bNfmJiGOMY45kfDpm1nSBbOkLY1QYJw1BAUpPYA/P2KW1Git4
   Q==;
X-CSE-ConnectionGUID: GqKwsJ/FSj2dNT/lNi7LJw==
X-CSE-MsgGUID: j/DEDTUjTNW4Hmviq9tODw==
X-IronPort-AV: E=Sophos;i="6.18,268,1751234400"; 
   d="scan'208";a="46161273"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 16 Sep 2025 07:51:35 +0200
X-CheckPoint: {68C8FAE6-59-C678C473-E36DAEF9}
X-MAIL-CPID: DCEDB426389384B9BB85DC10A71F1436_5
X-Control-Analysis: str=0001.0A2D035C.68C8FAE7.0083,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB3F4166CD5;
	Tue, 16 Sep 2025 07:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1758001890; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Zf0rlUPIS9TkW6EtEY94PGkcqdgP6qxZVUo3leDvhyo=;
	b=AG+nWoDZtUHcldDs2EaC7re+Y5WymxigPUzfof2xilIK7b7VtyoBCTJM6vzrLJTFuGmG1j
	f3TvgG0BZABcRmP6vRphn9u3knvBmifL1FIVJkqBfbEHKQysW8uxagI7E9GqDCj9pYWzs8
	AecoUa+/QjoM/apFDbQbxZUVUhgnI98ZxvTgXuUJXLp+S6L3mlxA5ZM1mRVD49BHFI78VJ
	vYoMfVKYLanruLB7s3m2OeQGhCpDqTqPvZ1xeP8OmuTn/ToIT8mpxJdYvix8gqRdxxIgOP
	Qcqv0PVJYhSbYOODS1di7CG4OO6ndVtXhsiI9XgD0tLi39lqrI3RignDAu16Ww==
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
Subject: [PATCH v2 1/1] arm64: dts: tqma8mpql-mba8mpxl: Add MicIn routing
Date: Tue, 16 Sep 2025 07:51:18 +0200
Message-ID: <20250916055119.135637-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_225139_942738_32B7BDF4 
X-CRM114-Status: UNSURE (   7.59  )
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
Changes in v2:
* Rebased to next-20250912
* Removed dependency from local patches

 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 4eedd00d83b9f..59642a8a2c445 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -238,6 +238,13 @@ sound {
 		audio-asrc = <&easrc>;
 		audio-cpu = <&sai3>;
 		audio-codec = <&tlv320aic3x04>;
+		audio-routing =
+			"IN3_L", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"IN1_L", "Line In Jack",
+			"IN1_R", "Line In Jack",
+			"Line Out Jack", "LOL",
+			"Line Out Jack", "LOR";
 	};
 
 	thermal-zones {
-- 
2.43.0


