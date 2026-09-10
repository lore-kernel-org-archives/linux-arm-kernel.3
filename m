Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8F0C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNRyQaZXRTkzI9mv9AhQ2yqB0XmwnrhAx+kU+GucctM=; b=hDS5b+H9WmOuF28PPDI+HMHA52
	yRqlqwpBq8Jd0cLVNoVnLfD25k7sCHYtKc9PeZpV085iewlDSSf9vpWgVHvlNuTs5q55RgNkXgtyy
	JsW4kHM9f9eb9KytHB8LzDQL5ITUjTJ4vqGyT4/1uiUlOd4stceXIvBv0pB3JfnGHc8FqJfAnB3CR
	6xdhsUOPRBL4h2kAt6D5gacT0eCpVnlf3xDM8Ti0XT0z0UzqGOcowwSPFiZWQyUbMhTuPfIh8bZ2b
	odG2iPYocqNsdWNyWijZ28OtzEYW5i67l52HLeINzWgAtPLbQZj1YHYrN65prOvH+eDHX19Hshpp7
	EaqNnVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewl-0000000EV6j-1sku;
	Thu, 10 Sep 2026 13:36:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ewO-0000000EUW8-2DtU
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 13:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lNRyQaZXRTkzI9mv9AhQ2yqB0XmwnrhAx+kU+GucctM=; b=kTqPkWRbme45RCmHEZe1UT/k5j
	cvLOgDClXp1ww9MZ5n7o0I5dqzXWeCnmGDpOr6fL8AMYVjF2mEUZ6JDmLodKGEM5ebHGUR60YK1FE
	PmB8X0PDRgnAtFTsosFWxDlIflzqirDy9+mT0WVrV8yBG5T3t7/P2gjCGZBa/GrcAVUstFnhvRqWF
	DfsYJCNu10Ns9HUcNh6m61X6SOqs1tCYXshq5b8Cx9b42ytMqIOOjB3/OwcRQg2CScJx3RU8v4dm3
	tdlFhxy0t+45n0jcxVhfx+LqLUGdODQXBGHKr67qcunzCwoKqnMjNivrJam6zJRFD8G/hReWLhk4k
	IvWFo4gQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4ewL-00000002Xh1-1l2l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:35:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6BD5322C8;
	Thu, 10 Sep 2026 06:35:39 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 801593F528;
	Thu, 10 Sep 2026 06:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047343; bh=vFiGko9W5vY2zPx9uystmT+pgsJatJ921+bOqjDFnsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TMigpWmVs+gqlwFfSICdSaAmeo6lDUIvUP6cV9HfrbQt55FN6fTzomymOP19U3v9J
	 f6VS/cUdGXCOgakdg9hL8rw6vkvhAOCtOPHpv2tmQbRYrLHCKE3+EGZOdPbMKr6CaC
	 Njqm5G9HmtqPDwAg+e3/s/nDqc31iNGz9UqrHa3A=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 6/7] pinctrl: sunxi: a523-r: add a733-r compatible string
Date: Thu, 10 Sep 2026 15:35:17 +0200
Message-ID: <20260910133519.459011-7-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_143545_653917_B9F64824 
X-CRM114-Status: GOOD (  14.23  )
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

The secondary Allwinner A733 pincontroller ("-r") is interestingly not
using the same new MMIO frame layout as the main controller, but is in
fact very similar to the A523-r one: it has two banks, with 14 and 6 pins
each. From the driver's perspective, this is all we care about, so we can
re-use the a523-r pinctrl driver for the a733-r, too.

The individual pinmux settings are different, so we must not use the
a523-r compatible string as a fallback, but we can surely let the same
driver care for both the a523-r and a733-r IP, as the pinmux values will
be provided by the DT.

Add the a733-r compatible string to the match list, without further
distinguishing between the two. Should differences be discovered later,
we can easily split this up then.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index 9e07fbb5be7cb..dfdcfa740ecc9 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -40,6 +40,7 @@ static int a523_r_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
 	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
 	{}
 };
 
-- 
2.47.3


