Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6CFCCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 06:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v3wtCgrKpXpY06IA1iepJUf0jmIsp0liDp9ZApSd2Z8=; b=Drj6z8Q8Q0WAiAxMOl0wXLcdJ8
	Vm/t9xL8C/0+ydAmG6lhK1S23N+dgMJM/HFNIHiluWo3pn1452x133Q9Gg4p25qxHdHfYNLrP9WFs
	ZPmyBRYMda9fmEI9Ie+9y48TfFHA95nbd8zZM7uQvaZ4WMeTL1oSuNbAc4b7RQBXwiagGZn3ceaAd
	lYiI9fw1swGdAXLDP05aTNwb2k0CW1TJ0TrrnVNl19DghsT9gJUcOIl4IzUFNO3cZ+lksOYDYSnZH
	wz7+0Q4XKoBwpJSrPoz2FldETI4XkbcvgjHYuLXWIxQWy0cmI6mN5o5KgO1kwQWgiZBivCMQgBldy
	PwPVHGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAj6S-0000000BzLU-3Lld;
	Mon, 20 Oct 2025 06:10:44 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAj6L-0000000BzHJ-3jh4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 06:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=v3wtCgrKpXpY06
	IA1iepJUf0jmIsp0liDp9ZApSd2Z8=; b=RcAlToUCuHt6nQyz8co6yRNGfUNVuA
	8UzaTOqAm+ZiKuYB6NvSL17xZZHja1eptPR9iXoEYQBGPdQC3sXqxoudg+VG9Gmv
	OxUSs4rwvpAAgGWj9GHbiy3mt5o3RLhYbpUAGKNgwuIxrnOf9s1PQVJFGAPWouwS
	B45m5DP9YiELKZ+xmtYQlTFsLRSEfyPp6EDndXCiaT5lRfuDe1cmcokUmxi1OUQK
	KRBi4E6z51+bIw8ljzVmThRm8I7SANs4R3Pymh4pKIU88x+vIlSE29oX8FH3V4vP
	3UB8yZtXWU+4F5Dt5qQ7k1mIgouCg4AvmpmdWAXvteCVTfOmyVNzKRew==
Received: (qmail 940898 invoked from network); 20 Oct 2025 08:10:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Oct 2025 08:10:25 +0200
X-UD-Smtp-Session: l3s3148p1@9Ldn8JBB9LkgAwDNf0fPAEuMhp6AgTGK
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: devicetree@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	imx@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Liu Ying <victor.liu@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 0/4] dt-bindings: treewide: don't check node names
Date: Mon, 20 Oct 2025 08:09:49 +0200
Message-ID: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_231038_778880_063A05BF 
X-CRM114-Status: GOOD (  10.42  )
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

Node names are already and properly checked by the core schema. No need
to do it again.

These are all occurrences I found in linux-next as of 20251015. I did
run dt_bindings_check successfully. I haven't done a way to run
dtbs_check yet because I would need to identify the proper architecture
first, right? Is there some tool which tests all DTs of a certain
binding? At least build bot is happy, I don't know if it checks DTs as
well, though.

I'd suggest to give subsystems some time to pick these patches before
Rob applies the remaining ones?


Wolfram Sang (4):
  dt-bindings: bus: don't check node names
  dt-bindings: nvmem: don't check node names
  ASoC: dt-bindings: don't check node names
  dt-bindings: spi: don't check node names

 .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml        | 2 +-
 .../devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml | 2 +-
 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml       | 2 +-
 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml   | 2 +-
 Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml     | 2 +-
 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml       | 2 +-
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml      | 2 +-
 Documentation/devicetree/bindings/spi/spi-controller.yaml       | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.47.2


