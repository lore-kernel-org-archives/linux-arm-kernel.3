Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45883606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ffi1EgYA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gUAaUuz4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=; b=Ffi1EgYAXb/S8Lxt9oiN38oJVQ
	rfngTUlm6RYJeHHeYfzj9dMzMDikf3IrkRRhaz9T0oYOm6qDnhYwqelIvodligVFKwzZEIRA+ZBy1
	ZkpWLYQRYBRKNDVf4X4MPtV0fzXKGVLL4CBQ4BdN1zTUYoOQSCeVMMkXglCbmS0ou4u/TQnQCvXeS
	NKOCeDVybiXMQ4zpx+s+jfVrG0EkWx1l0xM8OG6sg8pp3ECzI1qYoZuJNMoFBx/UJrKu/bVISZo/X
	GFjsYvqSIERCecBrbgsW2BZ8/txo1JGIzRWPYIabRMJXQAV7me/KVbtgmmFz81m+gnuKZYkkn6FOw
	FoGPVAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJc-00000008ZSw-3Zlf;
	Thu, 05 Nov 2026 11:07:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvJF-00000008ZKL-1Ua2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:07:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC1BF40E11;
	Thu,  5 Nov 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793876828;
	b=s96P2GJdw+RyW5J4ghmu1liE3uEatmNjgoWMFYvtoss7yXQveo+GKM5YOa4ciOvU3fAp
	 NaOHffNW2iQIBrM5g8jqLsygOlYXNQsERW6ui1uM6PY9H7WGc0GqMp5QytvR9DW8jvTu7
	 iUgYky8ptbYA/BmYTg4IA2PSKe6Ug290vWJyX52zUU1uyobKhMqYc0B63Q4hWNyTfW1Z6
	 5G8tkYDvGBb0cE9Sl5A0uG6f9dqoS9GZ8MgfepPD2R0Rfbv+Nyybn1X7uKMNWBwVx/HLn
	 7f7s9XkulnS8CcTSRgvT1PP5lMPOvQCNAwQ1NIvXXeyW6wozw20WQ9ZS6LxaG2lXpDw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793876828;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=;
	b=jCrPANQEZ3M4E5yLEYdEaAz8fdHDrQrwqk2ROuNyipHsL9v9N10u3BZmVBsqM1Wr7c8k
	 RpHJlAFjKF6JullJLG43ZDYpMh6gIubTljQrnGC0loN2PfABDwtDqQR3k8+8TGLkmthDO
	 biH7ozcvgDjcn8LysHNydOnPnVQJ7x0kWFhRXYCylZEW4TvmDblVekCV61Q9JEnz4ch1b
	 hlYGdDArlya/mSmPQX3edAaBiETpp3aLHYu78POMfyXe33EQ6lr6UWGSTgP6/0qivbCVB
	 /bc7skJxNOjM8dsv5Wshe7eOJG8MdXV9yU5mNhE5FVMzdse/Iu7AmqaHRbdzWgSBE1A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2FF41F00A02;
	Thu,  5 Nov 2026 11:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793876828;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gUAaUuz4bH4JwQ5ITO9U5C/moLkQm6VlKx7w5Kgmz9W+VJ+V5iHYCNUM/jPuuK85C
	 O5gSErDnsU5fQr86s2xKaW/nbw0lysOqQ0ELlqHbzriPR5j93V4qvHAFqGe8TbGhzA
	 9J29EIHd6VfrES1N/A6lxTubeeZkoyo/gNiC7T+nA6sXrHHsO/jPa/c05rCXadteA1
	 BWskZGNHEEXXv74hZgUprNtoh1l7/Rue2F53qxunlq89ef1J8m+Ss9CUTyf7LLDYk1
	 YT+Dlvoa0dLX8wMUJ5AIwhfElbND4oJTZ32rDT4O+Ympw5GUXwR+vdfNyQzA8sIvx1
	 G75tqdILPuwKg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 83AC147213;
	Thu,  5 Nov 2026 11:07:05 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 05 Nov 2026 19:06:39 +0800
Subject: [PATCH v11 5/5] MAINTAINERS: add ARM/AMBARELLA SoC support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261105-cv75-soc-v11-5-aa6ee0b2380d@ambarella.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
In-Reply-To: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793876823; l=1241;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=66/FpPmSuU75AtQewU8cj7mu+Qa/5qamx4Km8ySoeYo=;
 b=xAh3tkUI2kmwUkqlbkc1QWPFQD/HdhXVQhlU8BXpEX2u+sz+O9JyPIE8rVMYW/JtELUrTdBSD
 NBuBvxdiaj5CHQ8X5WOgk94QE+DZNn1Jtq5NrV5bnbRUOwSp7uOhT/v
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Long Zhao <longzhao@ambarella.com>

Add a maintainer entry covering Ambarella CV75 bindings, DTS and
related drivers.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 803b60ad628f..59e5b32d7a02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,20 @@ F:	drivers/clocksource/asm9260_timer.c
 F:	drivers/rtc/rtc-asm9260.c
 F:	drivers/watchdog/asm9260_wdt.c
 
+ARM/AMBARELLA SOC SUPPORT
+M:	Long Zhao <longzhao@ambarella.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/ambarella.yaml
+F:	Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
+F:	arch/arm64/boot/dts/ambarella/
+F:	drivers/clk/ambarella/
+F:	drivers/pinctrl/pinctrl-ambarella*
+F:	include/dt-bindings/clock/ambarella,cv75-rct.h
+N:	ambarella
+
 ARM/AMD PENSANDO ARM64 ARCHITECTURE
 M:	Brad Larson <blarson@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.34.1



