Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDAECD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 18:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nr8CyOu1jAgUyzExSTfTJ47zvCfGtulOLtwadhcScWE=; b=e3kGDQCMtnRAOy8dcCU2DQignV
	oMAEdeZ7+kzng+b7/BcX0MpwtDY2jp4nCQfTbpy9ObKq8Onbvf+WrdPLWjE82Epo5VoelRBSgV4mN
	d04HnW80V+MXRok+VcBHI8LmXeWxNXRZ2AwELN2A3wi0Si2j6TlAfEpM9f2O6Nez01qb6cF2zcuXT
	Qj13XcDGi7J5W62vUbuP1voYy249aAXOy42Yvu9hBLKDlVryjUgBs9iJ1fPQD74VCcG/1Iog5bsg2
	Ve6NAdtCugh/2xyYU3IJtpIhTnZgf+g+CDtKlD7cNK/dFvbsMRcyisdCr7pPShQ1+puMbaLKopeYD
	yP2r6sDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJFVh-00000009WSm-0VYn;
	Sat, 02 May 2026 18:56:17 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJFVe-00000009WS1-3mvA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 18:56:16 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g7HDp6tmQz9slK;
	Sat,  2 May 2026 20:56:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nr8CyOu1jAgUyzExSTfTJ47zvCfGtulOLtwadhcScWE=;
	b=urkVpFDH8o76gzBzivWuQc4ccWWmNIyAtZ5AMEDT+cjAPGQCTIGlKPoMZOFZjQwcAZAbeY
	VmZ2tCAjhwf6cnRd136y3bT3wd+/Tv3HrekcONSfS1HR0sdEwdGSglZchq5erEQ7xch6Ib
	Dt8sv1NUKINVhpxZ9050NcxsbUJTPHj4iTa/q/PJQ0Lxw92uQSk60UOZyTkVd9cWTp2vQJ
	1yhn5C9WYG9HiPtStoZYM8BYpXJ+cYbreEKjiG8/ksco8XorbjLCyvXKImEoxKJLxeN3Em
	YNM6bl/jcPtXyyGHNftqxAxmqnzL+nyEMhKPLZy60YvSN11afFGg08PbYZiwPQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777748169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nr8CyOu1jAgUyzExSTfTJ47zvCfGtulOLtwadhcScWE=;
	b=DNdkN5rYz/3ln3lP4+ifoRGkLCjjHsmS6LvU7H/B9l8m96fmdspTiAKwerS+M6pvKkh6+o
	bLl+MxfN5jrQumTg3HafyyCyImcgtXUJEuynddsBBOsrjj6IrRKHwyD+/SQZTty5z4Bi7N
	4f5FB8If/gdm9frFxmYF6WR8qaleKHXz3vNg1zgRvy8Z52fcJ8VIZiGPnkxrgWIiVw1/Vb
	A7V3aVBsdTrOYJw2peU2kd8Y/DB4WAF7Fh5pfB4C1eqqvi+2vpIWrDuwoD/E/gm9gLgfN0
	E0MOYyBAUYPZzvoOTx03y7Dy5TaRth7n+MiyolYGZI8uSz7nWNN5H2VwxvBiow==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6
Date: Sat,  2 May 2026 20:55:42 +0200
Message-ID: <20260502185557.93061-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 3scm56hh3excz98e688ii1y83ibo3aus
X-MBO-RS-ID: 413a3d3222bd004d73d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_115615_084625_1FCDD604 
X-CRM114-Status: UNSURE (   9.52  )
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

Document ZT trace bus and ZTR trace clock on the R-Mobile APE6.
These clock supply the coresight tracing modules, PTM, TPIU,
ETB and replicator. Without these clock, the coresight tracing
can not be operated. While this does change the ABI, it does so
by extending the existing clock-output-names, therefore if an
old software is used with new DT, the coresight tracing parts
will likely fail to probe, otherwise if new software is used
with an old DT, there is no impact.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml | 2 ++
 include/dt-bindings/clock/r8a73a4-clock.h                       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
index 925ed35d6658a..703b5bf26717c 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
@@ -90,6 +90,8 @@ allOf:
             - const: zx
             - const: zs
             - const: hp
+            - const: ztr
+            - const: zt
 
   - if:
       properties:
diff --git a/include/dt-bindings/clock/r8a73a4-clock.h b/include/dt-bindings/clock/r8a73a4-clock.h
index 655440a3e7c68..028ecef81451c 100644
--- a/include/dt-bindings/clock/r8a73a4-clock.h
+++ b/include/dt-bindings/clock/r8a73a4-clock.h
@@ -23,6 +23,8 @@
 #define R8A73A4_CLK_ZX		13
 #define R8A73A4_CLK_ZS		14
 #define R8A73A4_CLK_HP		15
+#define R8A73A4_CLK_ZTR		16
+#define R8A73A4_CLK_ZT		17
 
 /* MSTP1 */
 #define R8A73A4_CLK_TMU0	25
-- 
2.53.0


