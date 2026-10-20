Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDA7606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 00:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fEkVtoeN;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aGkCXRtp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gN0ju8lD81Sz1gc8sNBSSmRi9TErZR5ipKv96L1LgaY=; b=fEkVtoeNLVEyB7e4D6IsI2RisJ
	GmwaqSgQ3omoxRx5dhyXcB+KfcNaG+bIwNFHLX1+7fKPM1rD477JW75AtLl9RwHKQX2KqcmPpzoOT
	mmTD8IbYx5hVd6xwmeirydnKCQWbsak5EPi2HVt/MW8aTzoG/EbQ1YSAbCxZJv96O8f/FQVM7YJya
	E6G8yIBt/IVvgF+lgK3H9wcwm8LBScKIDRqvWuKGz/IK1+xduP6CMAtM2IyLFc3J3G9/MOF4vp2VJ
	1EOk+x1Ajjadq4qt9JnrxZPKkrol8uepd6WFot3nbXqweJkMnhmLs7oE4ZTV7Y9vY2CiyEPtxchBU
	mtUDo8Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJJe2-0000000ApfI-0JiI;
	Tue, 20 Oct 2026 23:53:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJJdz-0000000Apes-3zSN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 23:53:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D382541152;
	Tue, 20 Oct 2026 23:53:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792540402;
	b=u2U1bHzfkEY6I7lLCJ/SFHjBdyF/GaCxkT5TUxNB4ACAhGouKcmmPqqiVEYB0sk2pZHq
	 ISzQNcPJnwDBUpewZQIYvO6rfv6bYDL04Cb2ZfN+Et+1HFuNoSs4lPDGzkz3qVqCZnecs
	 DG8wenyHn16CIRZ+pKQrsjTIP2ooUNcaZ/6I9UdphRR0lUKinW/4WvkEOxnHKU2kYSs9/
	 rcMgUsM6V/XrzOtWR/GdUXCNMNwyq97Vh8XbtRqz1a6TN9tjdBf8m0u9QWyOrj10juwzZ
	 4T2ivFTanKGXaqHYG74iKfc9aMYfxyGaxkY9++AbKM5hakX8b8OXTriYB2v0Wgd7XSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792540402;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=gN0ju8lD81Sz1gc8sNBSSmRi9TErZR5ipKv96L1LgaY=;
	b=Sv1Qt/e4gRae3oGx14VIXcG0jDEJROu+8CXR8NqXEBOgnlY1s1wTS1Fh4bc0vBn3MiJb
	 aasfZ/iQsha5jbSxudUULoV1IEfN9DfkvUTvT+OscknNPfpEtewSOSF5HVDl3KNnTfoQV
	 5+2ymDaZjLKLqnFqNIqsI2XBsUihBwAC6a10n339uTNU+c0La2gjs/Zvkjh5rYToxt9El
	 Vw5Ui1JwQPyp//WlXhCbrJVx3Q2uW1akWv52Cue5/7BiAuO5Mdc0KJvM5vDRosaqJwIRT
	 y3FUyfJ7F10V13A+avCTRJLUNIDtVuXN+8b8nJht+6M8e7g1cudyYYtbq3B5NujzVhA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A7751F000C9;
	Tue, 20 Oct 2026 23:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792540402;
	bh=gN0ju8lD81Sz1gc8sNBSSmRi9TErZR5ipKv96L1LgaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aGkCXRtpC0or3gEmzbjpEJic9B2qM3E5Kg4IjQncI7M3S7657e2FivPIiEMEZw+r3
	 jJVubdBG1R38ftg2434RGaN8tCXxdi+3xBkhYJdss5n84ZzhFYH4eGopPJp5JmM7gu
	 0AYcI+XsS1UPIhjY1ObLV4fiyjZpzNZJfpA85swasNt+OZSyTKqCfNDtbnq8qbRrDv
	 eNPMUPnPDpnUJGqPp5Jz2ZpSvz8riwnKi7M95Ky/dO7t8SYEbY3Iwjq24j5GYK2CHY
	 U5e5yOCgdPI/fssr6cNoGFbt5NDkYonAMaapF386eVpivYXRVCn3v5NLEtvK6B8PnU
	 Vydixk8nuC9EA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 88B034325C;
	Tue, 20 Oct 2026 23:53:21 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Wed, 21 Oct 2026 10:53:20 +1100
Subject: [PATCH v2 1/2] arm64: Add CPU part numbers for newer Apple Silicon
 CPUs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-apple-m3-m4-kvm-v2-1-04905152cc2a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792540400; l=3412;
 i=michael.reeves077@gmail.com; s=20261008-m3-m4-kvm;
 h=from:subject:message-id;
 bh=juCh5R4p12iRnVQ+5ShiPPNpDD7QYQmROKo57ewmfzo=;
 b=xd1M2Vm/pX07aguQJcvtqE1esHZjP8TTsj2WXuu/Kgl1MA1T8FOezXwcpxMsXOpvoEXMhu6Pe
 LZ08uLRwMngDkSFJAG1IA5yzYxFGrG7GYwxpZ+W0pn3NU42VQ0jyU5o
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=oi7WuppQ1A+qFZp9DdfIwDnpC3WZ+XY6fJK1upV/CSY=
X-Endpoint-Received: by B4 Relay for
 michael.reeves077@gmail.com/20261008-m3-m4-kvm with auth_id=1131
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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

From: Myria Sarvay <myrialsarvay@gmail.com>

Add CPU part numbers and MIDR definitions for M3, M3 Pro, M3 Max,
base M4, A18 Pro and M5 Pro so CPU workarounds can identify these cores.

Use the SoC codenames for M4, A18 Pro and M5 Pro, with suffixes for
their core types, as separate core codenames are not known.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 arch/arm64/include/asm/cputype.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 1fa29616e..86adfebcb 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -155,6 +155,18 @@
 #define APPLE_CPU_PART_M2_AVALANCHE_PRO	0x035
 #define APPLE_CPU_PART_M2_BLIZZARD_MAX	0x038
 #define APPLE_CPU_PART_M2_AVALANCHE_MAX	0x039
+#define APPLE_CPU_PART_M3_SAWTOOTH	0x042
+#define APPLE_CPU_PART_M3_EVEREST	0x043
+#define APPLE_CPU_PART_M3_SAWTOOTH_PRO	0x044
+#define APPLE_CPU_PART_M3_EVEREST_PRO	0x045
+#define APPLE_CPU_PART_M3_SAWTOOTH_MAX	0x048
+#define APPLE_CPU_PART_M3_EVEREST_MAX	0x049
+#define APPLE_CPU_PART_M4_DONAN_ECORE	0x052
+#define APPLE_CPU_PART_M4_DONAN_PCORE	0x053
+#define APPLE_CPU_PART_A18_PRO_TAHITI_ECORE	0x060
+#define APPLE_CPU_PART_A18_PRO_TAHITI_PCORE	0x061
+#define APPLE_CPU_PART_M5_PRO_SOTRA_MCORE	0x064
+#define APPLE_CPU_PART_M5_PRO_SOTRA_PCORE	0x065
 
 #define AMPERE_CPU_PART_AMPERE1		0xAC3
 #define AMPERE_CPU_PART_AMPERE1A	0xAC4
@@ -250,6 +262,22 @@
 #define MIDR_APPLE_M2_AVALANCHE_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M2_AVALANCHE_PRO)
 #define MIDR_APPLE_M2_BLIZZARD_MAX MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M2_BLIZZARD_MAX)
 #define MIDR_APPLE_M2_AVALANCHE_MAX MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M2_AVALANCHE_MAX)
+#define MIDR_APPLE_M3_SAWTOOTH MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M3_SAWTOOTH)
+#define MIDR_APPLE_M3_EVEREST MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M3_EVEREST)
+#define MIDR_APPLE_M3_SAWTOOTH_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M3_SAWTOOTH_PRO)
+#define MIDR_APPLE_M3_EVEREST_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M3_EVEREST_PRO)
+#define MIDR_APPLE_M3_SAWTOOTH_MAX MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M3_SAWTOOTH_MAX)
+#define MIDR_APPLE_M3_EVEREST_MAX MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M3_EVEREST_MAX)
+#define MIDR_APPLE_M4_DONAN_ECORE MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M4_DONAN_ECORE)
+#define MIDR_APPLE_M4_DONAN_PCORE MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M4_DONAN_PCORE)
+#define MIDR_APPLE_A18_PRO_TAHITI_ECORE \
+	MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_A18_PRO_TAHITI_ECORE)
+#define MIDR_APPLE_A18_PRO_TAHITI_PCORE \
+	MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_A18_PRO_TAHITI_PCORE)
+#define MIDR_APPLE_M5_PRO_SOTRA_MCORE \
+	MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M5_PRO_SOTRA_MCORE)
+#define MIDR_APPLE_M5_PRO_SOTRA_PCORE \
+	MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M5_PRO_SOTRA_PCORE)
 #define MIDR_AMPERE1 MIDR_CPU_MODEL(ARM_CPU_IMP_AMPERE, AMPERE_CPU_PART_AMPERE1)
 #define MIDR_AMPERE1A MIDR_CPU_MODEL(ARM_CPU_IMP_AMPERE, AMPERE_CPU_PART_AMPERE1A)
 #define MIDR_MICROSOFT_AZURE_COBALT_100 MIDR_CPU_MODEL(ARM_CPU_IMP_MICROSOFT, MICROSOFT_CPU_PART_AZURE_COBALT_100)

-- 
2.56.0



