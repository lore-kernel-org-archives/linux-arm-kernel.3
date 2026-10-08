Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123A7CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 12:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42Mo73+ArLbP0zpgiGUvIhI3Eel59B0yPyKeMDKSscQ=; b=ECp3fnZOzNqpRCSf/AgJGjjsof
	TOLSHeRePtdiSIYExdt6JgWJqfzBSuymtDgrFxgASP+09mcCHOjfaSqfYrHoifCT64dnm0gBLUPeV
	+45gE7YhjVD3Zmk2lgHx05juectRyUF1z2y6/G3OteyUF0kR7hIqbApuqHvveunyW4bzGMxz60wzs
	95+ufI0sREEwl6FFzKJViIeqgSbIGBs2yIBSI5shr/0aWADJnFh8wmvZ7yorTSUiu56GZRdsN718r
	7GUgW9425r8NZLAMrWE/fHbYoGvm0AFoW5/KxuNmQixPvBOe4SuH919djT4PbxtzId1ilEZu5ymzu
	6XTksr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEn2G-00000004Kbi-2D7B;
	Thu, 08 Oct 2026 12:15:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEn2E-00000004Kat-3ES8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 12:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D4285602C5;
	Thu,  8 Oct 2026 12:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F3B5C2BCF5;
	Thu,  8 Oct 2026 12:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791461741;
	bh=Vdvmb/idCconkunwe5vqiLNHSM1hVRs9qmxEo8J62CU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tcUx1Tgzhe2IrqtHXyPnyeX6hfmOsewW3geO5QA7zbZJDJcKL6vWAen9NZVss5Q7P
	 O4nyZWcD/CIHQafRBmDPHD0NfSm/NKRjWao6KSEroYIcO5X88MA85g0uhmfhfA1iRY
	 awUQGhx1Zy25J6EQLjavbnVa5wplmnxNylx3L7Ulb4GaJOBrmEw3rQvWT1Q8c8Jw4e
	 pcfYFyOANszFuuom9rZYho4L58G56cX/l6N4rO5HDDZCzcmyI0rwE8Ib3M/TGNSr2S
	 J95clSoIbvUkzwF1OmR7PqMZRx5m3HSBfFwZzt9X3/aqJ+dwAnAobYy5IJGUdYEwO3
	 5NbtB7daNwU+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4100ECA6007;
	Thu,  8 Oct 2026 12:15:41 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Thu, 08 Oct 2026 23:15:41 +1100
Subject: [PATCH 2/2] arm64: Apply existing Apple CPU workarounds to M3 and
 M4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-apple-m3-m4-kvm-v1-2-7bb4cbf3d63b@gmail.com>
References: <20261008-apple-m3-m4-kvm-v1-0-7bb4cbf3d63b@gmail.com>
In-Reply-To: <20261008-apple-m3-m4-kvm-v1-0-7bb4cbf3d63b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791461740; l=1320;
 i=michael.reeves077@gmail.com; s=20261008-m3-m4-kvm;
 h=from:subject:message-id;
 bh=4DZxVFKEdF/Pu4GYU+OpToXoJYmi+szLHgZHQGkaf0M=;
 b=abXZoPRVUxn8QpLlM9NH1pz4/xpj6h3GJjVNe/wpQmf4rPCSbEySETEDlYQg8trN+7qvOD4b8
 FO5G/JfJ2FRBRnINns7srdp/CPX57G11XBwKnKf9G6NvfH+fnb8cNu4
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=oi7WuppQ1A+qFZp9DdfIwDnpC3WZ+XY6fJK1upV/CSY=
X-Endpoint-Received: by B4 Relay for
 michael.reeves077@gmail.com/20261008-m3-m4-kvm with auth_id=1131
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Reeves <michael.reeves077@gmail.com>

Add M3, M3 Pro, M3 Max and base M4 to apple_cpus so they receive the
existing PMU trap and broken SEIS workarounds needed by KVM.

Co-developed-by: Yureka Lilian <yureka@cyberchaos.dev>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
Tested-by: Yureka Lilian <yureka@cyberchaos.dev>
Tested-by: Myria Sarvay <myrialsarvay@gmail.com>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 arch/arm64/kernel/cpu_errata.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index e0c094025..8a7703b86 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -288,6 +288,14 @@ static const struct midr_range apple_cpus[] = {
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
 	{},
 };
 

-- 
2.56.0



