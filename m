Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86292CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 15:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nldvaWty8I5E20Jn3Utrwqefv4fix1llm1hvljMYchc=; b=M+HyBihcDwarBOdSCh46s9Gjlk
	QlsCBErg8KU9hVx05F5AxXgvL83l81PG9wMWy6e8g3AdE6PIudBiNFxAUBjLQUOnSv9Qll2i4n47c
	3mMJKedJpi4U/w9mqORQq7891HAP88s5mkiaFEWGVuBFtSZSjKgBdzGZsu2NTesPn+iYAJS1B731t
	sg16WaEmy2fG2cwN4qNnwE6o1i1GpQfI+6BuB1HE8jF1k0FDgk0ciKvbVWE0Nyq/wQ/bxhta/jzoR
	DFhy1Y5rjOz4Nvl9Y9gx5m9mVLq0GwzMUEv4ic29+Heb9dTBLWtVSVHeRcLifg+sglkullADyC39J
	dSu4Hw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ6w-00000009bAe-1qEG;
	Thu, 01 Oct 2026 15:54:18 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJ6q-00000009b8F-0jjo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 15:54:14 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id C6C8B1FA7B;
	Thu,  1 Oct 2026 17:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790870048;
	bh=nldvaWty8I5E20Jn3Utrwqefv4fix1llm1hvljMYchc=; h=From:To:Subject;
	b=jxkKekKcuQjNzIIkOuifbqr+9Mn9hf0cPp3k36cSqiwJdeIqPzcxTstKwWCsWTF4a
	 W2SiyfCqAMDXXWQqmXSgfASqUJ4yJtX/IPlYHdncsRRbRkk9n+3cXM/6Q+p8nNLtmW
	 LWoElcmIZZ5taiwYEKPPxjw4POfiaDjloEXHQIcP3+tbx+fpKl755I+zuKUKe1Irlc
	 RtQ02KUWt7DhhKeK+iqEFgWKrVZd9qtCqg/ah1Un5cwO8D5mvSp9Iyf6JTGLR51V++
	 i8g6QfdnezHG1DvBnJP5kxnPweGzphsjYkfWIT+nKcTb6M9qkZZG+2CdJPD2XjQ0T7
	 1ulx6gGzInDqw==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ARM: dts: imx: enable SPI on Apalis iMX6 and Colibri iMX7
Date: Thu,  1 Oct 2026 17:53:57 +0200
Message-ID: <20261001155401.2584935-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_085413_107883_986424F5 
X-CRM114-Status: UNSURE (   7.10  )
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

The SPI controllers of the Apalis iMX6 and Colibri iMX6ULL modules are
disabled in the module device tree and no carrier board enabled them.

A device can be instantiated from user space through the spi_master
new_device sysfs interface, so enable the controllers on the carrier
boards where the signals reach a user accessible connector.
The Colibri iMX6 and iMX7 carrier boards and the Apalis iMX8 ones
already do this.

Francesco Dolcini (2):
  ARM: dts: imx6q-apalis: enable SPI1 and SPI2
  ARM: dts: imx6ull-colibri-iris: enable SPI

 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi      | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi   |  5 +++++
 4 files changed, 35 insertions(+)

-- 
2.47.3


