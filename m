Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF77CC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eYBxqvQy8hvAWZmQDYiSaixg+yBCBKhpGm8smCMPHE=; b=HdTWb8jUgz+JEu7P5I8GwLOnst
	GtehXmzwlYz8iCPUcQktuGY+XlR59LAFcoYQacrqEqpKvONFHBw4WzxFYGuFWg6YkjTT8Uh1QIEYt
	N+SiENtORaL8jGzb2TKXsUgUVj6OD5NwZHeb5I9eu5WjHoxynQ5SG4CVQc1Ct5i8ieJPkZPw/zCRV
	BbMiXPzdlUdf9JVUiprJDqszVYkoJumQhnhUA28ohWMP7EE/c9VymlaRmPbYp2V7jMNfH5HJjDWB8
	GLAQlnvwgmWP0d2tZWwlMUW5nKx51uyK5A6aQPDqRrOqIyYdxg3TaYwntIwUNj3uWdhM9F23GOBrc
	HonKAkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lCE-00000008jfF-2kTt;
	Wed, 16 Sep 2026 08:40:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lC5-00000008jac-0k3J
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 08:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5eYBxqvQy8hvAWZmQDYiSaixg+yBCBKhpGm8smCMPHE=; b=TcGu8oXGdCPqn2Ny7stcjrm7Lk
	7QMNZfmydRMO7kWGHeQ+hDCKSQoprzNnScb9gHrUQAKsIRaCicgTGq6/rfaaJIbcBpJV2Z8oxcdY5
	OJMIZPGGRaqinZh0zaKeyN4UIzRHYDjsQY4UKpKrJLbNKufgFJwfNvfMwo7mjWylBkVXeyMIq8YSm
	MD+fM9y3aLwL9Vf5v9EUUgvlrzmIc2gWfEcM90/1KQ8kzVEQYN5mO4KV72cJ7rlsy22s55RtEQH1r
	Xi2VfQ5iwaRlAz9s8ttMRxWRHP0X6KJZQ4SfliP9+h+iaaPPve7rFUkTdSTiCP1ENfcYi/OF/pbQU
	rFxY6rrg==;
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6lC0-00000007dnz-1OLp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:40:39 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 8901A1FF37;
	Wed, 16 Sep 2026 10:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789548034;
	bh=5eYBxqvQy8hvAWZmQDYiSaixg+yBCBKhpGm8smCMPHE=; h=From:To:Subject;
	b=Mfqy4pYcGUn2b1aYTfmUL5VUBkULfLfUbc+70XN6kHqas+6AN2M5Bu7XnafcNssyR
	 Piv02UBwN4/gHLgbXWNBjMLKaaho+eirrjOE+2b9K5g4hdJWVmFWbVlZ2BBfNTcVT4
	 vAO8qY/C/NtXpswF6DafhO+a5LSGFe1NdQ53ynRJygAvGRmme3UWlsAevdjV8NGNbY
	 VhQkqgQjE61vEArQ6LJVl1ZyNyXfSdx71fNjxgT5/hZCY3TqaeelGa9L3vtG1UHmmc
	 WpaccGUUyvKpOT7pmkqQcfcL2BnfHErkTkb4T2pqelxM/23H1ogX0hxI26zKv5wQZ5
	 OArYEWT2GHHag==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx8mp-verdin-ivy: fix DIGI_1/DIGI_2 gpio-line-names
Date: Wed, 16 Sep 2026 10:40:23 +0200
Message-ID: <20260916084025.274229-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916084025.274229-1-francesco@dolcini.it>
References: <20260916084025.274229-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_094036_627982_9DCC0B61 
X-CRM114-Status: GOOD (  10.04  )
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

gpio3's gpio-line-names names the two Ivy digital inputs "DIG_1" and
"DIG_2", while the official Ivy Carrier Board datasheet (Section 2.10,
Table 12) names them DIGI_1 and DIGI_2, matching the
k3-am62-verdin-ivy.dtsi variant for the same carrier board pins.

GPIO line names are meant to be stable across the whole Verdin family
and its carrier boards, so userspace GPIO tooling that looks up a line
by name works the same regardless of which Verdin SoM is fitted on
Ivy.

Fixes: b98948b04295 ("arm64: dts: freescale: imx8mp-verdin: Add Ivy carrier board")
Cc: stable@vger.kernel.org
Link: https://docs.toradex.com/116799-ivy_carrier_board_datasheet.pdf
Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin-ivy.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-ivy.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-ivy.dtsi
index db1b4ee7728c..bf021e85cfc9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-ivy.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-ivy.dtsi
@@ -333,8 +333,8 @@ &gpio3 {
 		"",
 		"",
 		"",
-		"DIG_1", /* SODIMM 56 */
-		"DIG_2", /* SODIMM 58 */
+		"DIGI_1", /* SODIMM 56 */
+		"DIGI_2", /* SODIMM 58 */
 		"REL1",  /* SODIMM 60 */
 		"REL2",  /* SODIMM 62 */
 		"", /* 10 */
-- 
2.47.3


