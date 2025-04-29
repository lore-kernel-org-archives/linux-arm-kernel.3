Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD6FC3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3IC7RgsdFRjgNaYf9Bgi/HQazgo9UqZR6LcWu3Lxorw=; b=FviO6BrzE+btSahr/EFYVJ+1K5
	TvcZu6BKNn6lnhHBjko722jd/7PVJxbiLW2yaJLOygGPa0UHw+X4mQ/piyr56BJz/M+2xHWmk7Kcq
	Z/aYbFJGpwOmuLWxctyQVaYzUpX8HRSNSy3Yau/5uPxymHr0iKs76kiHmGao+8Nz7dmhthpNPM2tC
	IcXQBjvFVLJ1pEdpfCEhJhKEc+XPQDzsKwa/mWXS34uZI/bRzoV4ibWKrYBoctIEa34z8CrmEeO1M
	bSv9kn3lScbTJ9L8aHcP904ClLp1bUjjBN4Z9exbBUfFwPYYAqp7gXVJgZyr6jskS4vlH9oLCJTgY
	9AQEYD+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jFP-00000009TVk-3oDl;
	Tue, 29 Apr 2025 11:35:35 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jBY-00000009SHI-0TBQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 11:31:37 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 904B31F945;
	Tue, 29 Apr 2025 13:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745926288;
	bh=3IC7RgsdFRjgNaYf9Bgi/HQazgo9UqZR6LcWu3Lxorw=; h=From:To:Subject;
	b=q6blwe0VuViLMGWdxk2Q8Jg5bwm254tstAbZUf3GJpHVVQYpsAiW3T8DM3OwSYin0
	 V4iyB0dW6x/prfk0GRhPDsumLqBPVV2BCklB/Xcnd2qzPKVfXkQg7FlhgWOhrusU1R
	 jX0b4rKAs2gvxO9awAp4WMNe+rsnvWi5nvLxYJvlPiNGBeMK8yPERXEkjTy8Vk1GZY
	 IolJAKQpk/ECxFpQRt9gEioJqx4EXhTd+KLXl5H728WXTf7mv239KPg36UL9LabifY
	 WMxz8K16saan9eple72fd7sXoyiE+HYZ+pYq+E+1OBdYkvCU3I4JK2Bvcp+nL/rqK3
	 dlh5kYZBle7Vw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4]  arm64: dts: freescale: imx8mp-toradex-smarc: add fan, ec, gpio
Date: Tue, 29 Apr 2025 13:31:15 +0200
Message-Id: <20250429113119.124427-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_043136_321550_6BE45726 
X-CRM114-Status: UNSURE (   6.33  )
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

Add fan, gpio expander and embedded-controller to the Toradex SMARC iMX8MP
device tree file.

All the required DT bindings and drivers are now in next:
 - https://lore.kernel.org/all/20250331072644.17921-1-francesco@dolcini.it/
 - https://lore.kernel.org/all/20250414171455.155155-1-francesco@dolcini.it/
 - https://lore.kernel.org/all/20250402102146.65406-1-francesco@dolcini.it/

Emanuele Ghidoli (2):
  arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controller
  arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander

Francesco Dolcini (2):
  arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configuration
  arm64: defconfig: Add Toradex Embedded Controller config

 .../freescale/imx8mp-toradex-smarc-dev.dts    |  9 +++++-
 .../dts/freescale/imx8mp-toradex-smarc.dtsi   | 30 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 3 files changed, 39 insertions(+), 1 deletion(-)

-- 
2.39.5


