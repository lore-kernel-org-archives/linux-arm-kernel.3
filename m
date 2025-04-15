Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44D6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 21:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mO/SLhVwR4ngfZVCoJSJBtW/BUjVaiA2u5pFAT8P3Hk=; b=vWzc5Y1txeSfZTHE99BVM7tNvY
	pBmz6Vz7C+c7z0TgtlkKO40qWbahDQwQkunNJrTghXsBbIiV34HmPPQrcRbK/nHTghwmyfO2CUL13
	pDVjLjhTNH3aacur0NUMMiZZEaGVGAOPHIxHm3rLAfxGINCtPdrRsxp72OmeSvdFbvQWuwB6kdfkf
	KYSPYmWJtVAhFqwlphCDXKWyYquKOc/GHUAenXciy1l+G566TOlsz3b6H8PmVVc76D01rHxaCJFcL
	IwVnL/ThiFS4BDqFI5fhYCuNMpgucr3H8SWVaxak+lFMeUpwmUJWQv+LBEZLKarPp+VUSd/b1IUwC
	mkV9WOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oFL-00000007Fn4-14Xy;
	Tue, 15 Apr 2025 21:55:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4oCy-00000007FGq-2g2b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 21:52:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9559744B5F;
	Tue, 15 Apr 2025 21:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73842C4CEE7;
	Tue, 15 Apr 2025 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744753963;
	bh=jBNCv2rda4YJZMZlnqUFKXhD2YixBW/bajeGa6Tnahg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZTC875YDSXTbhMKwBPJqLXIDR4ehZNUQyv27RtLDUGt2lWnURr5FL53iytvdRoQ0k
	 DNtByinSi0TTzxSAb5GBdpuiqqHHxoaz4R7fpmjDEhpcTkzkWoVCIJHvo5JaKQhTbw
	 NOFEFM+SI/PWr07PCTXx8P/czUGezvVP/Aog3+LMoNIaaZeXNM47H5yElOxkn/sxfx
	 TNR5DnBs+x2+5GT0lMSwIg5cie3u6EVVL4lF4fpEODX9PP/wmzKe8VV/0XPGLpHKr9
	 a4Bdt4QYs/RDPhH7QL/IQvaAbYExNREcpFsRCaO2C8AYB8EqZhX58md6uRu651L1kd
	 EWbLYuOxG0dFA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6138DC369BD;
	Tue, 15 Apr 2025 21:52:43 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH 0/3] Generic SPMI NVMEM cell driver
Date: Tue, 15 Apr 2025 23:52:33 +0200
Message-Id: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACLV/mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0NT3eKC3EzdvLLc1FzdVAMLM2NTY0MzQ3NTJaCGgqLUtMwKsGHRsbW
 1ABuu0b9cAAAA
X-Change-ID: 20250415-spmi-nvmem-e08635316175
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744753962; l=1432;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=jBNCv2rda4YJZMZlnqUFKXhD2YixBW/bajeGa6Tnahg=;
 b=z/bozObO8yi+GVG8sufEa3NcrtwV6CqAU6PzOgE14u6VKIBZuU8qylsUv97vpKOw9XrAYnnts
 RA/RVyk+lJwCJ3/TPasI9fumkGl32BPZfim4W4o7J+IHeyGvfsrR/2T
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_145244_717152_38956F85 
X-CRM114-Status: GOOD (  10.39  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi.

This patch series adds a driver for exposing a set of SPMI registers
as NVMEM cells. This is used on Apple ARM platforms to store the RTC
offset and to communicate platform power state between the OS and
boot firmware.

The NVMEM cell consumer drivers will be sent in a further series.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Hector Martin (2):
      nvmem: Add spmi-nvmem driver
      arm64: dts: apple: Add PMU NVMEM

Sasha Finkelstein (1):
      dt-bindings: spmi: Add generic SPMI NVMEM

 .../devicetree/bindings/nvmem/spmi-nvmem.yaml      | 44 +++++++++++++++
 MAINTAINERS                                        |  2 +
 arch/arm64/boot/dts/apple/t6001.dtsi               |  1 +
 arch/arm64/boot/dts/apple/t6002.dtsi               |  1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          | 50 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi               | 50 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi               | 50 +++++++++++++++++
 drivers/nvmem/Kconfig                              | 14 +++++
 drivers/nvmem/Makefile                             |  2 +
 drivers/nvmem/spmi-nvmem.c                         | 62 ++++++++++++++++++++++
 10 files changed, 276 insertions(+)
---
base-commit: 2e0e70c95077172b29a5b13716c4b159d578e82c
change-id: 20250415-spmi-nvmem-e08635316175

Best regards,
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>



