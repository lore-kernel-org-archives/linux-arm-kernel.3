Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BCEC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+S6G4zmkA5YzJTmgMp+eR+5O8QLItpFjyk2X1UppwnM=; b=4gTJmtxqgi+5fdFLSfsqNGPuDZ
	FDizXWp+o3SuUAOwsXKP4RN/oRbIdGT7Wjdm9wTqrRvBiivB3o3wNaocrnwuUnnQnkqcPnbS7PoiG
	1v+aoSf1aVADH5teEEquYLzso/9geLQuBdc1lFGLD/zu3dSDHQInapZHqM8U/4vlP0TsCZJ27uHFP
	Y7YO5mFaVPxqCS6cqvuomJcWOLZMWJBJ1N/5lkCiNNPPzvPeZnBstYGG5+DYZ1zR3sAbLKjsxnZy0
	AdXQGjA0wgQhRuTCJkeo+CH2gVAu6j+HD6yGARCfciL9rfpDCtXEFal2YBocFKakh1bmyeLD2zzqw
	6GAZhSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbRn-00000002f5v-34wa;
	Wed, 05 Feb 2025 09:11:51 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbQQ-00000002exO-30O0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 09:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1738746612; x=1739351412; i=wahrenst@gmx.net;
	bh=+S6G4zmkA5YzJTmgMp+eR+5O8QLItpFjyk2X1UppwnM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=NXWJAh5/TP0katLwlPIkMz4gW1nMygeAwVIc9QKTIGd8F3iLQ05GxXm6j39g81a/
	 yV0DPJakaW/+/hGOaIT/2axh8rlg3XS1DP6noOG3sE1Y2rASjH9iuU0ofdUHoR5KM
	 LUElrviAffarXTH/1AOi3B4MnmNwBvAPIibU4RJvlCvN1nAALAa7VP6SEmd7sbtTa
	 NVkkPdCxKZwx1Au8WlHg642fzbz2Q6We1Mijhj7bMSIjUCzDj3UUyZ74GesoSj7DV
	 ProE8gcJh3M7OT/slYg17cMlIVRzIINL67/UeUbUtBMNQHXPpxlxIxdYUW+wgv198
	 CeMLTC/ZtjxQGw6acw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.251.153]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBlxM-1ta42S1z5A-002ape; Wed, 05
 Feb 2025 10:10:12 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: Luke Wang <ziniu.wang_1@nxp.com>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] tty: serial: fsl_lpuart: Make interrupt name distinct
Date: Wed,  5 Feb 2025 10:10:07 +0100
Message-Id: <20250205091007.4528-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:60Tc+1nIQ9nSFeQy+OlyzbUZCfnlD2oCBLSginRi6opc//X7uOb
 0PM7u/75AlC9rhPjKduoQfozROIpMV/lE3LsNPtQCbXn51Lt0Xva/mdv5XC2F9rv5xF6cGT
 FVWQNryz5HHI62wVv4756mgg/wDt3nHPNZRjznxi+Q5x5Oefiy9yx3ORqUHJfqrkwT9oP6G
 9EFO56uJ0Wu9NOmoLqXiQ==
UI-OutboundReport: notjunk:1;M01:P0:+udilvF9vPM=;1P0AXIvJe/Fy0DmsA/dAQLODzdr
 jkatR2oOVXuNJo7osLepH56asvcNnkJlkNsImJG0SkIjiNGIzhGIe6asdsMl07KhJ6ncr4dJF
 o7J86t3VkYiatuOHxvbIR7I3kQnh0w9WpieaRVBi/oC/ISgJfoO22ESrY74shCdbgAzR0Pg4Y
 AVI0E+1kMXLmXERy1PbTUCl1/TPBIEI+HwX+5bVZSOveymFpldBr7wtgPtwW670Hisqy5Uuwq
 602rsSHmjarX8DBAva7n/zjHyWEfN++lRWFlg0eMnUDVGCl+N0RNDkLRMoz15WxeFF9McUcdw
 08aIOJaKp5a2eFxhnDPxHEB4RPlJkI5ZrT3Wor0vIgyjR/Xiutd59VdmsooL9sZhlSn+JXwwl
 FjfqbCQ68wf3GL7C4P2et7xrUTgPISU/IJraniAyD7TUWHr4Ulzbe+u0FNKCf3u9hPdZZ+Ddg
 Bt9c37UXN72FTXlCZAQNz1mpQNJFM865o0OUXZ3PjUhnfYv+l9zfL+5SYNToeA8l1lp7iL1IU
 DzGbfYgUlil6oZFGviY0m+CHBRRq1i7AStRPZiAHKVaB0iTrs5gxZi/E3hj3M+a/qf4ZlkJu2
 a+K80OihyVLqGqd+xhO6+RzAgB2Vkj86aFAGidoBNBCnfBh46QUv+gJjqbpgJQN8U7D+tjj63
 NvNtAC0+EYZVEvj022B1C90QtFHg1tqUZP63dDLYjjjQ6f3E5lieao1ToGn4ODPEJmwDa6t4v
 8a5fpwVn241eVkB+Oz9VMX3QlHIYQAPu2E02ar4MRYOruy4veyvQrg1kvzfRyin634PnTfwti
 DbYtEW2cUSePItOwHgnBMqSX0N0lV5rbbJdAAKid4oVCnvfkP2gbzrcmB8CaqCAVAd/sfhAmh
 +dOVNeI86BB3n9ADgHlI5eO3L5kuDZNZX9j6lHow6ppZ+3uA4ee4LMjIqkAo4s0+4zYvQhUYA
 rNt3SUrPJhYWZP2WeNMdS8i6h9HRLBlP1AbTimCjBNFRJ104j4GHvOA5hlZ+Ny/107heEXG73
 jJpHDDAp/LUzsT4MJy/4uooRc/wcAloOQwH+ZHlhUSxJ2nQS9J5IYxLQzz1vCHRjZoYRY7nVT
 Z+IJWnGyzIQkgA/oCmLQGcxBOr98ANRh0Ja5rM0saicGfRJ39uxfTuGSoPsvqVL3onTer6+oo
 MAFnkXORlXL5gDXYVRbeR/p+QpE6HcnEHAWkK4zB7Bb4vb8FmintDQd5/xOisdkNTgrCk/m2r
 ooXU1JPOw/6MIpb1Rm+G2230DUIASPD6du3RQD+whDEmXkddaWWSCWnEuT9xIHDsC2oySqjrA
 A/3D9JMQFPWPOmTsgsJjysrbDhyd68dQW5BHme65/CvL4s=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_011027_196944_291E4371 
X-CRM114-Status: GOOD (  10.43  )
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

SoCs like the i.MX93 have several lpuart interfaces, but fsl_lpuart
uses the driver name to request the IRQ. This makes it hard to
identify interfaces from outputs like /proc/interrupts .
So use the dev_name() for requesting instead.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/tty/serial/fsl_lpuart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpua=
rt.c
index c91b9d9818cd..91d02c55c470 100644
=2D-- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -2954,7 +2954,7 @@ static int lpuart_probe(struct platform_device *pdev=
)
 		goto failed_attach_port;

 	ret =3D devm_request_irq(&pdev->dev, sport->port.irq, handler, 0,
-				DRIVER_NAME, sport);
+			       dev_name(&pdev->dev), sport);
 	if (ret)
 		goto failed_irq_request;

=2D-
2.34.1


