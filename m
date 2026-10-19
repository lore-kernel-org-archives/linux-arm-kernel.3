Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BE5CCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 05:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y7f5qDQvars3uucYOGtjxBCghVoHGh2ieeql+cffk2Y=; b=eItJemT62EkeFGbZSK4/j5Y9SU
	sdmbmNBBuTa+/5lD2FgmifoFr+H1NiyXsl3ZWv8CebWn9Ob+qd2i09L8PezlgaGRn59pR3L+CUc0F
	2nmmlSj8zsl9d1oblx1YbeV4gRIHb42Hcpq64o/lGHryJWxBh0fLNxtIdYjat7I6dK6+zToxB8Xjv
	iLCYsuXeQZhmHZYP8VW4YUWvI47uD14jkIsBvwUUxJgUzoeGFW6X/IxsrvJgZHqZSqyoFAOwreBZf
	rJdNI6qkPjzrBpwp3w3NGHDHVkrf4rsDkqJSN4vYOp+cy6ZUsxNomVJuv4BFzqz4XNVZ+eu+JZkwj
	wB4L2lMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIg1J-00000006de9-29bX;
	Mon, 19 Oct 2026 05:34:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIg18-00000006daQ-1p4X;
	Mon, 19 Oct 2026 05:34:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D21C94162D;
	Mon, 19 Oct 2026 05:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4F27C2BCF4;
	Mon, 19 Oct 2026 05:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792388077;
	bh=pgIkA9EQP4kVbdf5QtIU9MRFvhNyPH6tw4oAfuEjiik=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=osk9oNO+pVwQbN8AhVKAKifgi3TxtDEA2fogTdzyKng9O0f68wCB7E5Q0PyS3DbXR
	 4ZmgLFe+IR59dwrSORr+QiVJDH56y1DS3Qzrf5CPodX3RHtHN/JT4A/KEwsfzZbHLu
	 rf5VNWJMgMtG9rMGYkeCfPBh0zolDLgcoc0z5AEtBBIsxIuPtWOBIfUTGlk1UjXFUG
	 0M38L2KtU9/wDRbvaCVMm4t9pJ7OpP+5tU0Yr+R6Oa3zpYzuTxkiwgPW2H5mOG49AS
	 l2PGFFV3KrgU9aVddIVvenxgTxnoylgbUYmeOwYaELZ9b9gMaLe9TjhK+BUdcTVQgL
	 fa8rzL7FQxpzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9CFCCF2DB;
	Mon, 19 Oct 2026 05:34:37 +0000 (UTC)
From: Junyi Zhao via B4 Relay <devnull+junyi.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] Add vendor glue layer support and Amlogic A9
 implementation
Date: Mon, 19 Oct 2026 13:34:25 +0800
Message-Id: <20261019-a9_i3c-v1-0-329d819d621f@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOGr1WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0MD3UTL+EzjZF3LFFMjE9MUA0uTZAsloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AmYvdyWoAAAA=
X-Change-ID: 20261010-a9_i3c-9d5245d094c8
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com, 
 Kelvin.Zhang@amlogic.com, Junyi Zhao <junyi.zhao@amlogic.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792388075; l=1948;
 i=junyi.zhao@amlogic.com; s=20260924; h=from:subject:message-id;
 bh=pgIkA9EQP4kVbdf5QtIU9MRFvhNyPH6tw4oAfuEjiik=;
 b=QIGcl9ephVHWpuLWE8j6m/z4Ati/770ms7/xAPm1vRqUYUPZMK1LXMa/5Whq8a8K6loC9Gw5I
 KWH3cPY2l1xAuI3YvuF4GsbgSjndplpbnU+NZEYeW3luoxe1XAHVz36
X-Developer-Key: i=junyi.zhao@amlogic.com; a=ed25519;
 pk=hiL5PjGIksGFiWvEx9J3MhQqU/ro6vNbj72NIw4bbvA=
X-Endpoint-Received: by B4 Relay for junyi.zhao@amlogic.com/20260924 with
 auth_id=1054
X-Original-From: Junyi Zhao <junyi.zhao@amlogic.com>
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
Reply-To: junyi.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The SVC I3C controller IP is used by multiple vendors, which may
require platform-specific handling for controller resources and
integration details.

Rework the SVC I3C driver to introduce a vendor glue layer that
separates common controller logic from vendor-specific extensions.
This allows different implementations to reuse the shared SVC I3C
framework while providing their own platform-dependent operations.

On top of the glue layer framework, add support for the Amlogic A9
implementation of the SVC I3C controller, including Device Tree
bindings and the A9-specific glue layer driver.

This series consists of:

  - Rework the SVC I3C driver to support vendor glue layers.
  - Add Device Tree bindings for the Amlogic A9 I3C controller.
  - Add the Amlogic A9 SVC I3C glue layer driver.

Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
---
Junyi Zhao (3):
      i3c: master: Rework SVC I3C to support vendor glue layers
      dt-bindings: i3c: Add Amlogic A9 I3C controller
      i3c: master: svc: Add Amlogic A9 glue layer

 .../devicetree/bindings/i3c/amlogic,i3c-a9.yaml    | 102 +++++
 MAINTAINERS                                        |  12 +-
 drivers/i3c/master/Kconfig                         |   9 +-
 drivers/i3c/master/Makefile                        |   2 +-
 drivers/i3c/master/svc/Kconfig                     |  28 ++
 drivers/i3c/master/svc/Makefile                    |   6 +
 drivers/i3c/master/svc/i3c-amlogic.c               | 250 +++++++++++
 .../master/{svc-i3c-master.c => svc/i3c-main.c}    | 467 ++-------------------
 drivers/i3c/master/svc/i3c-main.h                  | 297 +++++++++++++
 drivers/i3c/master/svc/i3c-silvaco.c               | 173 ++++++++
 10 files changed, 909 insertions(+), 437 deletions(-)
---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261010-a9_i3c-9d5245d094c8

Best regards,
--  
Junyi Zhao <junyi.zhao@amlogic.com>



