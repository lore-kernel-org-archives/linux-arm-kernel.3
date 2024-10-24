Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C70CE8E70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 13:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=081XwwT3SpMBjNjgf6iNtj/s3WBFhspA1TJEtsraTTY=; b=SUpGeRiycq37SLWsRdbHovGval
	35clnuZOM/Ku8iTXVo6nNgOeOwykkUHW06hK0SIqZNj/YC/m5i5uhkRds8C5D1LL9DDPTkLg0tLsc
	Hk4XAm0OEBw/TFbmTDmhedrQkiw+RDpClYlh22M2NeT0QNxsdvF4oAgNIhlPzuIHuTi+vj6PH6w/d
	z6ZmgIrAiD/bnrxqhV9AzYiN1dsuKWe9XJxNMq9QFhzScmN9KVxKrIQL8wenNcrznAEiPbsxgacLf
	F2vTq5SsWlwH1hv73M8+/tqETi0rqzsUtJ+zyO0zIrPwhizARmdaBHqFeKirB/RD4eXlTXOF8En0t
	dZWmMqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xdT-00000000SCj-2BTq;
	Thu, 24 Oct 2024 13:12:19 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xYK-00000000RAi-3uyW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 13:07:02 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 0AC181F9B2;
	Thu, 24 Oct 2024 15:06:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1729775219;
	bh=081XwwT3SpMBjNjgf6iNtj/s3WBFhspA1TJEtsraTTY=; h=From:To:Subject;
	b=G06owoBc4B57W43v3eIlBbGmIsD5pHkC4J5ScyvVQx3JaohBWEAahWOPJy5dMsKaY
	 ejh0ciq7dzNuNnStK/JvmPn5mTA+c/oLPLtUIcWDYkDPUVQ6W6UCENv7YRcAf0wgWP
	 uRTgaP8wlLZDBXqAkRZdzMCl+FMmSrxb59b6oFP5kvBwV6fYN9kqNmQhjOj+bBffU3
	 53ZVBM2ydbGhSd2GYWIJlQzKOiEv+JjvNPoTgD/L8Sn9S7zXXo/Sg71zB6Ol7Mnj+0
	 KovtEa/fRJG5ULSYC/q4DoAFYKMEn9m3RSTaJgZPT3xwagFb8mh38rDrylgYSYJYmt
	 QgGxSBt4UtodA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx8mm-verdin: Fix SD regulator startup delay
Date: Thu, 24 Oct 2024 15:06:50 +0200
Message-Id: <20241024130651.49718-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024130651.49718-1-francesco@dolcini.it>
References: <20241024130651.49718-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_060701_179967_A8FCD1E6 
X-CRM114-Status: UNSURE (   9.92  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The power switch used to power the SD card interface might have
more than 2ms turn-on time, increase the startup delay to 20ms to
prevent failures.

Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
Cc: <stable@vger.kernel.org>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index c20c2da17524..01042c1e9e7d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -162,7 +162,7 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		regulator-max-microvolt = <3300000>;
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "+V3.3_SD";
-		startup-delay-us = <2000>;
+		startup-delay-us = <20000>;
 	};
 
 	reserved-memory {
-- 
2.39.5


