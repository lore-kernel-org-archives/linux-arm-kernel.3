Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EA3CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 11:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BWkCz+DqFTW7wt2D8of+2AGF26ajnxS3iJv9/ADODgY=; b=LtxiKWn75snLoYD38x6mm0V4El
	kIxGerTq+RoBu3w2X8GKYyRewlwUFrT250UHgVKe0nTGKkc03IVpwaOVpwNHH1oONDKpigfbIDiTU
	q+NggoWf+wpOQHxraM5j58zaD60vSDxDoMa2+5nhHB2FqwcL/d8Ao417QKTUOSgRWT1ke+nQ9Ab9/
	Oc+Rw+kaD3umiAKYxWsIKYFHC+kJgoQEy3P4/rNsyP8u2PvvANdAYZ1Sc6N03CZoSm7t9PYIy0rQw
	tkDiNbq2r12qs2DBBiVbzM7VXFjJcUgFU+9/UjeanUyRTCbo5AhjRHq4FoYueWwFYXR6OvjHaSjLI
	RJSHMgbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8EI-00000002PQW-2hhQ;
	Wed, 13 May 2026 11:58:22 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN8EG-00000002PPV-0Czf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 11:58:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778673495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BWkCz+DqFTW7wt2D8of+2AGF26ajnxS3iJv9/ADODgY=;
	b=VrdfOcauiFN5qDLFCLBeLAA6nq75l8wwLg5R7Bic6nYZqEnjZcSNYnxweNnKkHhRvcZ8ZB
	A1c8ZOy/pHTwCFaLNekV2WDAD3HqjCRnDduPSn3IJTfQ8iSNtjLpJCYy+UtpHXJ1XO3Dsz
	YsTrGvHO//YRJm3XFpSDGU53PpNOhBA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	shechenglong <shechenglong@xfusion.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Jinqian Yang <yangjinqian1@huawei.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: proton-pack: use sysfs_emit in sysfs show functions
Date: Wed, 13 May 2026 13:57:55 +0200
Message-ID: <20260513115756.447661-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2798; i=thorsten.blum@linux.dev; h=from:subject; bh=86KR6ysRrOFZZ3Ztz7ike1WiQ1Qtx2XB5IZuIv60m1c=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFks6S4ZXmUl/y7EP3hgvcZNyuJkylw9xffrKq4eSrx/h PvT58eGHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRe22MDAfXnbzFvUbKcn+I Xdbx++G+bteDL6VdXeItuarowS7fIwEM/5N2T9kQIDgp+7+L3WNLt607ck+JvQ65vENf1P1o64T aTywA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_045820_602595_3CDFF7FD 
X-CRM114-Status: UNSURE (   8.86  )
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

Replace sprintf() with sysfs_emit() in sysfs show functions, which is
preferred for formatting sysfs output because it provides safer bounds
checking.

While the current code only emits fixed strings that fit easily within
PAGE_SIZE, use sysfs_emit() to follow secure coding best practices.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm64/kernel/proton-pack.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index b3801f532b10..7bb6553fec08 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -24,6 +24,7 @@
 #include <linux/nospec.h>
 #include <linux/prctl.h>
 #include <linux/sched/task_stack.h>
+#include <linux/sysfs.h>
 
 #include <asm/debug-monitors.h>
 #include <asm/insn.h>
@@ -61,7 +62,7 @@ static void update_mitigation_state(enum mitigation_state *oldp,
 ssize_t cpu_show_spectre_v1(struct device *dev, struct device_attribute *attr,
 			    char *buf)
 {
-	return sprintf(buf, "Mitigation: __user pointer sanitization\n");
+	return sysfs_emit(buf, "Mitigation: __user pointer sanitization\n");
 }
 
 /*
@@ -126,7 +127,7 @@ ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr,
 	switch (spectre_v2_state) {
 	case SPECTRE_UNAFFECTED:
 		if (bhb_state == SPECTRE_UNAFFECTED)
-			return sprintf(buf, "Not affected\n");
+			return sysfs_emit(buf, "Not affected\n");
 
 		/*
 		 * Platforms affected by Spectre-BHB can't report
@@ -136,13 +137,13 @@ ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr,
 		fallthrough;
 	case SPECTRE_MITIGATED:
 		if (bhb_state == SPECTRE_MITIGATED && _unprivileged_ebpf_enabled())
-			return sprintf(buf, "Vulnerable: Unprivileged eBPF enabled\n");
+			return sysfs_emit(buf, "Vulnerable: Unprivileged eBPF enabled\n");
 
-		return sprintf(buf, "Mitigation: %s%s\n", v2_str, bhb_str);
+		return sysfs_emit(buf, "Mitigation: %s%s\n", v2_str, bhb_str);
 	case SPECTRE_VULNERABLE:
 		fallthrough;
 	default:
-		return sprintf(buf, "Vulnerable\n");
+		return sysfs_emit(buf, "Vulnerable\n");
 	}
 }
 
@@ -438,13 +439,13 @@ ssize_t cpu_show_spec_store_bypass(struct device *dev,
 {
 	switch (spectre_v4_state) {
 	case SPECTRE_UNAFFECTED:
-		return sprintf(buf, "Not affected\n");
+		return sysfs_emit(buf, "Not affected\n");
 	case SPECTRE_MITIGATED:
-		return sprintf(buf, "Mitigation: Speculative Store Bypass disabled via prctl\n");
+		return sysfs_emit(buf, "Mitigation: Speculative Store Bypass disabled via prctl\n");
 	case SPECTRE_VULNERABLE:
 		fallthrough;
 	default:
-		return sprintf(buf, "Vulnerable\n");
+		return sysfs_emit(buf, "Vulnerable\n");
 	}
 }
 

