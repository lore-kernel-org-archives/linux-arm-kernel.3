Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FA3606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 23:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oGUxgg1u;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AnYzOoRA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8uxk441ISQMCr6ffs1OiNE54QJj6KTHjiAkmGI9m0+8=; b=oGUxgg1u4qgjqo
	az7KKe/3f1Wr1QNO3mVN9yIu+57An9X7taWkmM8Mz5NVHLxcSfMCCwbimZEVO4fPRR9kWEfsyCgsU
	LAjghAZ3fVYMJZK90UkhPaA2LbLtO8EuMnhoiuQ31uZ/GCrdL4/zWqXe+8eIKZMn6u4gBIDg7Vu1l
	S54usJQMVFPdq/f0WZStiOX+S0WhD3uEhrwoKYIGG+OkUw6GAEAW6BX3YsMsyiik6P7HjnNW0anMq
	TxvjTwfTo5BP/Pn8cXy/Ij/zkatDL+isni9l9mpRrz4H67tnlaGIk7X90ltY4Vly+jeCeFmzJ8ubH
	hUF7pX+99s+LL662Gk/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJJe2-0000000ApfR-1C49;
	Tue, 20 Oct 2026 23:53:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJJdz-0000000Apet-3zvW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 23:53:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4327743A57;
	Tue, 20 Oct 2026 23:53:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792540403;
	b=vGtGllpzHJmtTtoDXCg/wNdQpRXjzeagkkaUhC3kYSrjoAieobwOfjcNRGqwEagu29v2
	 DZXyMIifnQAme7k/RnKFngawG4x32GnlrSXbyvVnqqnFHMyVhlPZp/r3R2bFKWxYWk7Gy
	 CjP/qCzYaXmXZzuGktnMEe/C7Owv8Kioj1U9da1N0YbDcYFEd4FHYfe7GDl4gObI3rk72
	 skCH/Z9g1oBTBTtluGgfaEmBI2O4j9V47Ch2utlsiFFcsW6NPv/LrqxqHMOGjnh/QL+Po
	 uIntX9QulJdGvObW1GIT77B2MITl+l5Lo5wsrtG04bv6gvogOF3NP5pgdb64hjNlNOw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792540403;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=8uxk441ISQMCr6ffs1OiNE54QJj6KTHjiAkmGI9m0+8=;
	b=3dBVmFlcpKRT4qxnYtLyF8fPXafZ0YSqKi92slRHj7qIzoo9rHxhWEYF5c9DZ87RXVl1
	 FW/zT+seH/RfyA1byFPttSi/y79qWyrbEfjQiC1IeZ0GhpFJfgAh+pbjNZ4PCf8cbDsab
	 09K+qKBYIBNuugIbSjL/cNDmZwuK0/qjwJsAbzXiaAkAJfhlDlKRmS6YTOm0Ia0yEcJYL
	 Gu3UgLkUxYj2r/umXtFIwE8aLcZ+Eyzgw/O+NThOu7lwL0agUDy+dy4A49/HJg7ZIQcUm
	 dXgZ6oLbsPYuid6fqklMZs4CJUaT9nmjMnzzzGYrNTfp7SAkHH7lOKrYpPd4aiU//7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A9121F000CA;
	Tue, 20 Oct 2026 23:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792540403;
	bh=8uxk441ISQMCr6ffs1OiNE54QJj6KTHjiAkmGI9m0+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AnYzOoRAI98rD6gX9bom8k7NKqrMiXMN8Iper7cSb6a3qGGkCzUL1Y8tU6xFgvcZ1
	 qrs3MphwSNQmt5Uim4Z3xqmG5mW6058AhgnFfT5a0EuVm9T8+MtBoCFQ04p+nz49p8
	 4eM6JORqX1/4J1wSqVZwnfiMNHH7tDfWocuXX7IXV7e/e1tXTVHXy+yaLXZXa6rPIM
	 cgZKS5mXoYVAnU0JUSdyyouURFr78EXAnFKHO8l4J1j2S7svNAJSKaaG/t/QVSNa3Q
	 ztORLw6d0Ok9MCjzm2d7HU7JrNTzeer3DFhT5fmgdLqayEvlo5S3GgAZlJR9hxL7B7
	 EviZIwlXSMLqA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9015B43267;
	Tue, 20 Oct 2026 23:53:21 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Wed, 21 Oct 2026 10:53:21 +1100
Subject: [PATCH v2 2/2] arm64: Apply existing Apple Silicon CPU workarounds
 to newer CPUs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261021-apple-m3-m4-kvm-v2-2-04905152cc2a@gmail.com>
References: <20261021-apple-m3-m4-kvm-v2-0-04905152cc2a@gmail.com>
In-Reply-To: <20261021-apple-m3-m4-kvm-v2-0-04905152cc2a@gmail.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: Myria Sarvay <myrialsarvay@gmail.com>, 
 Yureka Lilian <yureka@cyberchaos.dev>, Fuad Tabba <fuad.tabba@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792540400; l=2838;
 i=michael.reeves077@gmail.com; s=20261008-m3-m4-kvm;
 h=from:subject:message-id;
 bh=PFEvneEC+/aHCyp+lZlYQ70fLEswRlQt4crDxkng4ZM=;
 b=tdzSqkZ6HaKIHAWImFyWY66JwbtNxJmwuTwJTnGZZiLnX6q5CW+eemkITphNFG4ER38EIwCOr
 6m8dQm1oFgJBeqMtTnFaL2l0m6ROA2s5BnrD3vmK7nq+4wKb+MQO9vF
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=oi7WuppQ1A+qFZp9DdfIwDnpC3WZ+XY6fJK1upV/CSY=
X-Endpoint-Received: by B4 Relay for
 michael.reeves077@gmail.com/20261008-m3-m4-kvm with auth_id=1131
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UPPERCASE_50_75,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michael Reeves <michael.reeves077@gmail.com>

Add M3, M3 Pro, M3 Max, base M4, A18 Pro and M5 Pro to apple_cpus
so they receive the existing PMU trap and broken SEIS workarounds.

Add these CPUs to has_vgic_v3 so KVM detects TDIR support and can
trap guest DIR accesses without trapping all common registers.

Co-developed-by: Yureka Lilian <yureka@cyberchaos.dev>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
Tested-by: Yureka Lilian <yureka@cyberchaos.dev>
Tested-by: Myria Sarvay <myrialsarvay@gmail.com>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 arch/arm64/kernel/cpu_errata.c | 12 ++++++++++++
 arch/arm64/kernel/cpufeature.c | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index e0c094025..bc91bc13b 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -288,6 +288,18 @@ static const struct midr_range apple_cpus[] = {
 	MIDR_ALL_VERSIONS(MIDR_APPLE_M2_AVALANCHE_PRO),
 	MIDR_ALL_VERSIONS(MIDR_APPLE_M2_BLIZZARD_MAX),
 	MIDR_ALL_VERSIONS(MIDR_APPLE_M2_AVALANCHE_MAX),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M3_SAWTOOTH),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M3_EVEREST),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M3_SAWTOOTH_PRO),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M3_EVEREST_PRO),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M3_SAWTOOTH_MAX),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M3_EVEREST_MAX),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M4_DONAN_ECORE),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M4_DONAN_PCORE),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_A18_PRO_TAHITI_ECORE),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_A18_PRO_TAHITI_PCORE),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M5_PRO_SOTRA_MCORE),
+	MIDR_ALL_VERSIONS(MIDR_APPLE_M5_PRO_SOTRA_PCORE),
 	{},
 };
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 3ae3ad1a1..bb82b80b3 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2357,6 +2357,18 @@ static bool can_trap_icv_dir_el1(const struct arm64_cpu_capabilities *entry,
 		MIDR_ALL_VERSIONS(MIDR_APPLE_M2_AVALANCHE_PRO),
 		MIDR_ALL_VERSIONS(MIDR_APPLE_M2_BLIZZARD_MAX),
 		MIDR_ALL_VERSIONS(MIDR_APPLE_M2_AVALANCHE_MAX),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M3_SAWTOOTH),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M3_EVEREST),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M3_SAWTOOTH_PRO),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M3_EVEREST_PRO),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M3_SAWTOOTH_MAX),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M3_EVEREST_MAX),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M4_DONAN_ECORE),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M4_DONAN_PCORE),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_A18_PRO_TAHITI_ECORE),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_A18_PRO_TAHITI_PCORE),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M5_PRO_SOTRA_MCORE),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_M5_PRO_SOTRA_PCORE),
 		{},
 	};
 	struct arm_smccc_res res = {};

-- 
2.56.0



