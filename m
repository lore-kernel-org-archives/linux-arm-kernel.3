Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76A9C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p29ZC+N5MNCvmmVB2BSVpm50cbVEH7Xlr6X0I1T2aVA=; b=nx0cCKwPYRNsWX95M6jAkIYJoS
	J+2MUTSJ9g8HSKN0xqySbzEY3wG5677O9O5KY30kIJT2HJRMsk0q6RHr36HrHdvIo8CWo4Yoa5p/0
	gPF0tPfhTiv7o/mHEV2IQeyVjVd/ipDsZSwJp1mqSN2qz16YfwJyt196WVDw0bf+kdDhBtcfsxmga
	5nK4JcOD7o1WO+geOxJlAa1WwvpikzxP/tbxeuES874WIpHVfm8FZr3YyR4s2OrvxZ/1aYXRhKxiI
	pJfH2Rpe2Cz/1Xudxbw2m3Q+M2L6njW0bltuamNC4EPtvmW1Dmrcj+pJ8x/Tjc2QnmjwP6/mfUnfb
	+EkbYGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29vX-00000004NWT-1flz;
	Tue, 08 Apr 2025 14:27:47 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u289X-00000003ztb-1pf8;
	Tue, 08 Apr 2025 12:34:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744115633; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G2Q7s94IYvGc/rZjsgLuhe+cCDOLf3PJ3slZvXVTxsECxHzgMXg7YfdWa1ZBdopcTI9iT15ilhS4RpcY44g0OnekOYzAO+c2CKF2oYXe8YpW1AHwQYzay8qXwxQAl30oCBdnoApral/kbkTQirVbfioa3boIZcmVhekJ8OjeAMI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744115633; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p29ZC+N5MNCvmmVB2BSVpm50cbVEH7Xlr6X0I1T2aVA=; 
	b=bvHlLW6AR76qyzVCZTPODBXED7R2+ffSCm59PkqrCucaX6x6kSXzaJoNsVrmEDZJ8NpG+8s4zmC2yf1g87sxvHhuHFeO8joXaWltWklUVKkl5UzZX0678uG/0Kry+YEUq5MQerez63oeiz+w01RhVrJSW05WtFzxpm62IEifyZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744115633;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=p29ZC+N5MNCvmmVB2BSVpm50cbVEH7Xlr6X0I1T2aVA=;
	b=Lz6zO/EAdAo1nNZMgKhQ+ZpMEcj/BiT6yNkAJC1sg3HQfBwxgUaGHe0f6DfUvs5G
	yD6FKvNEzdHuBJIsDEM/B+kHbdsrkFQF9LnHpYvwEA9ZojIRhjagQBlUg5XgPyX8lLf
	e9MFBEK8trDljsfnXT/uPo0dxqump073mA+yv1Lo=
Received: by mx.zohomail.com with SMTPS id 1744115632188591.1286847234378;
	Tue, 8 Apr 2025 05:33:52 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 08 Apr 2025 14:32:15 +0200
Subject: [PATCH 3/7] soc: rockchip: add utils header for things shared
 across drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-rk3576-pwm-v1-3-a49286c2ca8e@collabora.com>
References: <20250408-rk3576-pwm-v1-0-a49286c2ca8e@collabora.com>
In-Reply-To: <20250408-rk3576-pwm-v1-0-a49286c2ca8e@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 William Breathitt Gray <wbg@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-iio@vger.kernel.org, kernel@collabora.com, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_053407_550535_57D33D98 
X-CRM114-Status: GOOD (  23.69  )
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

Rockchip hardware has some functionality that is shared across many
hardware IPs, and therefore many drivers for them.

Most notably is "HIWORD_UPDATE", a macro with slightly different
semantics replicated across many a rockchip driver. It currently can be
found defined in 19 files, of which 18 are Rockchip drivers.

Instead of continuing this tradition with yet another version of it in
my new drivers, add a rockchip soc header for utility macros and such.
In this header, we define a new set of macros: REG_UPDATE_WE and its
little brother REG_UPDATE_BIT_WE. These are purposefully named something
other than "HIWORD_UPDATE", to reduce the likelihood of macro
redefinitions and also reduce the potential to mislead any adopter into
thinking this HIWORD_UPDATE is just like their HIWORD_UPDATE.

Old drivers can be moved over to the new macros over the next while if
their maintainers think it makes sense for them, which it probably does.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 include/soc/rockchip/utils.h | 76 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/include/soc/rockchip/utils.h b/include/soc/rockchip/utils.h
new file mode 100644
index 0000000000000000000000000000000000000000..3349069e75ff51ebd7a22089af796feafd227ffb
--- /dev/null
+++ b/include/soc/rockchip/utils.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2025 Collabora Ltd.
+ *
+ * Utility types, inline functions, and macros that are used across several
+ * Rockchip-specific drivers.
+ *
+ * Authors:
+ *     Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
+ */
+
+#ifndef __SOC_ROCKCHIP_UTILS_H__
+#define __SOC_ROCKCHIP_UTILS_H__
+
+#include <linux/bits.h>
+#include <linux/build_bug.h>
+#include <linux/limits.h>
+
+/*
+ * Incoming macro basilisks, stare directly at them at your own peril.
+ * As a gentle reminder to help with code comprehension: BUILD_BUG_ON_ZERO
+ * is confusingly named; it's a version of BUILD_BUG_ON that evaluates to zero
+ * if it does not trigger, i.e. the assertion within the macro still checks
+ * for a truthy value, not zero.
+ */
+
+/**
+ * REG_UPDATE_WE - generate a register write value with a write-enable mask
+ * @_val: unshifted value we wish to update between @_low and @_high
+ * @_low: index of the low bit of the bit range we want to update
+ * @_high: index of the high bit of the bit range we want to update
+ *
+ * This macro statically generates a value consisting of @_val shifted to the
+ * left by @_low, and a write-enable mask in the upper 16 bits of the value
+ * that sets bit ``i << 16`` to ``1`` if bit ``i`` is within the @_low to @_high
+ * range. Only up to bit (@_high - @_low) of @_val is used for safety, i.e.
+ * trying to write a value that doesn't fit in the specified range will simply
+ * truncate it.
+ *
+ * This is useful for some hardware, like some of Rockchip's registers, where
+ * a 32-bit width register is divided into a value low half, and a write enable
+ * high half. Bits in the low half are only update if the corresponding bit in
+ * the high half is ``1``, allowing for lock-free atomic updates of a register.
+ *
+ * This macro replaces the venerable ``HIWORD_UPDATE``, which is copied and
+ * pasted in slightly different forms across many different Rockchip drivers.
+ * Before switching drivers to use it, familiarise yourself with the semantics
+ * of your specific ``HIWORD_UPDATE`` compared to this function-like macro's
+ * semantics.
+ *
+ * Return: the value, shifted into place, with the required write-enable bits
+ */
+#define REG_UPDATE_WE(_val, _low, _high) ( \
+	BUILD_BUG_ON_ZERO(const_true((_low) > (_high))) + \
+	BUILD_BUG_ON_ZERO(const_true((_high) > 15)) + \
+	BUILD_BUG_ON_ZERO(const_true((_low) < 0)) + \
+	BUILD_BUG_ON_ZERO(const_true((u64) (_val) > U16_MAX)) + \
+	((_val & GENMASK((_high) - (_low), 0)) << (_low) | \
+	(GENMASK((_high), (_low)) << 16)))
+
+/**
+ * REG_UPDATE_BIT_WE - update a bit with a write-enable mask
+ * @__val: new value of the bit, either ``0`` 0r ``1``
+ * @__bit: bit index to modify, 0 <= @__bit < 16.
+ *
+ * This is like REG_UPDATE_WE() but only modifies a single bit, thereby making
+ * invocation easier by avoiding having to pass a repeated value.
+ *
+ * Return: a value with bit @__bit set to @__val and @__bit << 16 set to ``1``
+ */
+#define REG_UPDATE_BIT_WE(__val, __bit) ( \
+	BUILD_BUG_ON_ZERO(const_true((__val) > 1)) + \
+	BUILD_BUG_ON_ZERO(const_true((__val) < 0)) + \
+	REG_UPDATE_WE((__val), (__bit), (__bit)))
+
+#endif /* __SOC_ROCKCHIP_UTILS_H__ */

-- 
2.49.0


