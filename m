Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5070CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ak8D4ewxAmt2mrMe4gZ32GJGlrTEsebf+7f/118zH7s=; b=dPW1xCgumeINLBlRdI+a2UG3eO
	ROZRno+ZmcqmFTN7bByM5bRv0bqiQSOdGuH4Ts7wOFsTFrijD538ciSWxrrKUpsyepNbDQBWK801g
	0iP8zFhfL1YpESy3FGFeKgNl5v6/GohRNfQ5yh7e1y5toLY8AU4AAeW+WbqpeSYtiM0t+nNARLKIF
	Ss6F97Fs6QBmndK+t/Od21pMtZ3m8FRW5m9mub8KWnJMzLyR43CO7mBosvKrpNaTOrEsLAemjae56
	BUarwPztT47svzPslKzs/2n6/QtCXAu+xXKQAa01Zw+CH11UmJPwAczGMN4oOgoMRqtaHOejjvono
	D1r9ZGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKYZ-000000011D8-07CV;
	Thu, 18 Sep 2025 19:44:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKYU-0000000119i-2KNt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 19:44:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 003DB60211;
	Thu, 18 Sep 2025 19:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FCDFC4CEFA;
	Thu, 18 Sep 2025 19:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758224673;
	bh=UMBZVNHnp7TR0KnOMakwtyW6HfF9SvkIdo+R8of+svU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bUqtbVT+0haYvdTHb6blpWAGsyWfD6JaY7UKgBi4jOSopmDbJZHeCxFoFu+/fht0G
	 N6gsaEeuXYxUNx19h3M20zlrQSQvN/OOpS7UNh+0vG8Atrw4GeFRl23UBOHHnD0OPN
	 sQwQu96Xbick4kY2JWoZuAwyghOmjSAmasf/n/qttCnRE/bjEqTF8y+Bz4ODB2N9C8
	 cf2einhRiGSWw5T0zRs9DOHxZkYqbWMyGqGFegKcqdGEBgQyjSYzcJcDgfXQnVdRt/
	 HoYZmNvUfikhEe256UpFX4Y98kGQpyREMS0OqFmDyQuV64M0UU9+aiDL3PQGBwyc0o
	 cezmwQxnZIilg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 18 Sep 2025 20:42:07 +0100
Subject: [PATCH v4 2/2] kselftest/arm64: Add lsfe to the hwcaps test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-arm64-lsfe-v4-2-0abc712101c7@kernel.org>
References: <20250918-arm64-lsfe-v4-0-0abc712101c7@kernel.org>
In-Reply-To: <20250918-arm64-lsfe-v4-0-0abc712101c7@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UMBZVNHnp7TR0KnOMakwtyW6HfF9SvkIdo+R8of+svU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBozGEYpaN8KxqpqbIpix7Q/eUM4BVEie2c349je
 H2Lt7wGNx2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaMxhGAAKCRAk1otyXVSH
 0Ok9B/4v32pVhq4xEn2WtqPBqKENxP6kucAsLZtwxf5iwOSrCiG9KVi/6YaIAC1kx/sjTIVaD9L
 mKEAYyfwg5c8BxtzTnuaHiK0R5mccV5TOEWPCLDMGeYsCfAVxI+uVBIUJ2Mbg7tyxUylzzmbwg6
 8Vn7mCxnstbDXzMVPy5OS73MNdRuJjzIsVe1dmV9cd1Fa/1eOBriDvdJYymtpApHcWiI5N0u5fJ
 m+NBZORlDiLa9d86fk+c7KVVLr5ahog42FmW/pYrdJHXOkWKbtFlyrW0SuXfcxYsmX53b4Fa4iU
 JF8LnIEBKNjJysOhlR0xW4jvKcBXNGNJdual7Un8QJbbKubP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

This feature has no traps associated with it so the SIGILL is not reliable.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 002ec38a8bbb..0f9a64932481 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -17,6 +17,8 @@
 #include <asm/sigcontext.h>
 #include <asm/unistd.h>
 
+#include <linux/auxvec.h>
+
 #include "../../kselftest.h"
 
 #define TESTS_PER_HWCAP 3
@@ -169,6 +171,18 @@ static void lse128_sigill(void)
 		     : "cc", "memory");
 }
 
+static void lsfe_sigill(void)
+{
+	float __attribute__ ((aligned (16))) mem;
+	register float *memp asm ("x0") = &mem;
+
+	/* STFADD H0, [X0] */
+	asm volatile(".inst 0x7c20801f"
+		     : "+r" (memp)
+		     :
+		     : "memory");
+}
+
 static void lut_sigill(void)
 {
 	/* LUTI2 V0.16B, { V0.16B }, V[0] */
@@ -762,6 +776,13 @@ static const struct hwcap_data {
 		.cpuinfo = "lse128",
 		.sigill_fn = lse128_sigill,
 	},
+	{
+		.name = "LSFE",
+		.at_hwcap = AT_HWCAP3,
+		.hwcap_bit = HWCAP3_LSFE,
+		.cpuinfo = "lsfe",
+		.sigill_fn = lsfe_sigill,
+	},
 	{
 		.name = "LUT",
 		.at_hwcap = AT_HWCAP2,

-- 
2.47.2


