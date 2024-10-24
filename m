Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B93CE8E73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 13:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U2WiB+g/HawECyadHqc18p2lcEQdvPgRpIqGrQpt9EM=; b=EmynpPdmNLFrdN8IA2cQbBjHJC
	nXSOF4A9CU09zA7ocpG9yqJLKE3Lv6pAkgPOO403Dcgbd/NBgzaiVbF2mJjxlhIBqrprhCyhy0HIk
	8geByc0qfhPv7kOKFloy881AaRro8x+R7y61DJVKZdhyOug+EBUZO9r5upL8S0uugsth2Jj9SxG/4
	pq79a241tdVCyDy3z/dp2rUqoSzO4A7qSiH88YGGzmWW9oJZpvWN8Rpf/4mndAEOenB0FwR4NHLDC
	5yVtcZW5OuJpNVYexCrPSY9Xbw8cQ24wxDx7Z5rqOyFDs8aYbK2z2Monq1L90MjTvBVJc1zUbJqOH
	GzFZVlDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xby-00000000RvQ-1ozA;
	Thu, 24 Oct 2024 13:10:46 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3xYK-00000000RAT-3ubr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 13:07:02 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7188D1F99C;
	Thu, 24 Oct 2024 15:06:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1729775218;
	bh=U2WiB+g/HawECyadHqc18p2lcEQdvPgRpIqGrQpt9EM=; h=From:To:Subject;
	b=cIXGvtpGnjuv6sP+m18GCQo+7vY4iBu19JRynCqQmJp9tD4lP0uDkhfVmxpUWkSr1
	 NlVXrpxNkiL8OMI7d5b4Qp3J8jsQ+7TD+9BbBSMmFmac3w+7sAfUulxfFeflL9+SFO
	 CIRfUb4Bi5gX/6DGA7sc7NsipH14yseKlAfFJzdAeGOzjLdaZyA4OnrJUOTE7afOxL
	 QdBT+rTC6uzObAJIF9B46+Uu3OBpwmST9m1wbcwf4ViXsv34tOu34ABhdaWfjTxdmH
	 6g4tUv9r6mIKfexV9AUHjlaTqsImECdt0Qa09CAFQbr/7SL3s2rJK1t6p0mvDRlwqz
	 aXutOsrR0ipUw==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: freescale: imx8m[mp]-verdin: Fix SD regulator startup delay
Date: Thu, 24 Oct 2024 15:06:49 +0200
Message-Id: <20241024130651.49718-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_060701_182883_A140ECC8 
X-CRM114-Status: UNSURE (   6.90  )
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

Francesco Dolcini (2):
  arm64: dts: freescale: imx8mm-verdin: Fix SD regulator startup delay
  arm64: dts: freescale: imx8mp-verdin: Fix SD regulator startup delay

 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.39.5


