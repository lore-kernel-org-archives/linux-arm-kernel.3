Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9887C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zWqSKq8lxW1S1zlDmMfS7DXWWilNffxfMKmzzQZ/n4s=; b=xczs+HyTHquaUeNjmeEkXchZ4G
	VLyIUOn1eI4gxPVZt07KWM0F26tdz0plsbzED/UGM9S/QlRzeUSugc5s2/5HKmsqgUkbtkY4LrTaW
	UWa3Qt13MR+E+281E2C9JQBoP+FChNIVTq+B9Cqv8KTbJG27C9ZozW6u7WZTe9o8eVNWrWPhrIu4r
	u37W6nUU6T+EZ5GMNesr5/SEaEaYJW+kVZug8WIGYLSXoZj7HtTtHSMtBnLmTAItBV28NUPLg0Kn4
	1dhzBZu4rHA21XxP3SYvc3u15L9wKgPCdhHjwMa19tUO4kNJOPGvgqpp9zULe/T2qn/cKtF1x8hqN
	JoOUW1eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lC5-00000008jaj-0G3O;
	Wed, 16 Sep 2026 08:40:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lC3-00000008jaB-1xPJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 08:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zWqSKq8lxW1S1zlDmMfS7DXWWilNffxfMKmzzQZ/n4s=; b=B22HRAZmtIqsRdYYNZHLCNiz1H
	HYmuK7kEdyLKVSQCGZ1/uzqvHT2TNV7dXNDRl1En3N0aa53SHZjVNBbdEAcYVSRb5S6QcqSBlRnFB
	2AemNrEYDeo5agjn9DhrZn9WmLxWMXad/0NgjbXdMcrdGW/pAsQqb+nVcR78grxwtowI71MMqLfO5
	fAciyUg8ybNDSeul1SYwnlqFleFTw1kPvyqXBMIpG7HtJ0G3xJFIFv0BWKL62Z188o6jYP53df70h
	dZz++Qb9nKIN9xglGcQlJea8it+3AvTeW3Ye33kg+VE+KzjJuAX+SCFqVCNLfU2FpCBI+cJUQYcXi
	hrSgYshA==;
Received: from mail11.truemail.it ([217.194.8.81])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6lBz-00000007dny-1jZz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:40:38 +0000
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id CE6F61FF2F;
	Wed, 16 Sep 2026 10:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789548033;
	bh=zWqSKq8lxW1S1zlDmMfS7DXWWilNffxfMKmzzQZ/n4s=; h=From:To:Subject;
	b=nOziChr3YwBuPZgHA9Hl/gMVdcT1NQx80zjZ/SlYkK/H+d68GEp7E9vPY34m4hBoE
	 uQnqWJqd8pV5xxF1cn3tNYPZ0S1mBNuOAUxj0Gpchjf0YZtZmze5guh1RFQWzMwmJ4
	 syxDdXOqPx1e/Yc6kM0kVNYVEAScIVUpSH5I4gaMHtwdp1/oGsBc3oEtdn0Sxh53Sh
	 evc/ETE6e3hmBVxo280r8kdAOEWa27KxXbUCfTfkg6IOggXZ3yBO/c4cLvimyv1ZRw
	 gZe74GUs+2aFYOraxrPgt/Fs+k7XMCr+JIOoc7ovhh+ZLBvcgdfaItEJa1vA6z0x+/
	 5JDkisHQ8EPRw==
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
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx8mm-verdin-ivy: fix DIGI_1/DIGI_2 gpio-line-names
Date: Wed, 16 Sep 2026 10:40:22 +0200
Message-ID: <20260916084025.274229-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916084025.274229-1-francesco@dolcini.it>
References: <20260916084025.274229-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_094036_092962_41230727 
X-CRM114-Status: GOOD (  10.24  )
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

Fixes: adca46171ff7 ("arm64: dts: freescale: imx8mm-verdin: Add Ivy carrier board")
Cc: stable@vger.kernel.org
Link: https://docs.toradex.com/116799-ivy_carrier_board_datasheet.pdf
Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi
index 29075ff5eda6..b64751aa31d5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi
@@ -270,8 +270,8 @@ &gpio3 {
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


