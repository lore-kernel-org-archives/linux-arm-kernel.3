Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C91F8FA88
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JSTaymXgcLnfG/5isEb1MNeVw5h4YjUGt/i5U5Hl7A=; b=lnsxOHo3Yg8Wt/CQUtwjyG1nVK
	tQzE0OZMwiEuIandiw51ZJfN+vGGmj5/k6FyXCLraUzv1gdOW54BVLViYgGtD1JQRulEszmlWY7B5
	bIWf91O1PCHqybrWsavjyC7JjN2EDVMx2PPku9410tVq0vzkj233D6RSmbPInpxbk0DT+LuIsjHgw
	qwgADN6Kbj4NrO6fWcvWHAjyF4Ay5YjMQOPE3h9z0cFB2vcVzH9B3JE1LgiSmOgHP7TCiPGVXB2IA
	+mCVIRI1qEvzKGbMBgsjxBvxeWguvYru+NiMvWdz3th0VYF4eTTe1snHuD8zNuh1QawJqjOrE9vFu
	qDVUVqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCJy-00000008ku7-10p1;
	Tue, 21 Apr 2026 14:43:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCJt-00000008krF-1m9H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 14:43:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14740302D;
	Tue, 21 Apr 2026 07:43:15 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F2543FAF5;
	Tue, 21 Apr 2026 07:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776782600; bh=99NNtnuLxi2s8quGtXHfvn6Pw2cy8v6tt353X7vUA+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ig8P47/VPrUc6cbbK0AOOhF1x2CHw/ZnSTD6dKK4E0oK6LFtGMBmT6xWeQtqr+lM2
	 mzY7JY+XKA5hupSoLRUGoUDCibnxhVNuzniRs0blD2R2JRT9yo8tnI5XbEkb4oGKlY
	 td3grQ0QQNuq4SjWG30c8HYBhc++7h25IWztbqs4=
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/4] kselftest/arm64: Add POE as a feature in the signal tests
Date: Tue, 21 Apr 2026 15:42:50 +0100
Message-ID: <20260421144252.1440365-3-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260421144252.1440365-1-kevin.brodsky@arm.com>
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_074321_496574_12D55A05 
X-CRM114-Status: GOOD (  11.44  )
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

Add the POE feature to the signal tests framework, to allow tests to
require it.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/arm64/signal/test_signals.h       | 2 ++
 tools/testing/selftests/arm64/signal/test_signals_utils.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/test_signals.h b/tools/testing/selftests/arm64/signal/test_signals.h
index ee75a2c25ce7..c7c343494cb8 100644
--- a/tools/testing/selftests/arm64/signal/test_signals.h
+++ b/tools/testing/selftests/arm64/signal/test_signals.h
@@ -36,6 +36,7 @@ enum {
 	FSME_FA64_BIT,
 	FSME2_BIT,
 	FGCS_BIT,
+	FPOE_BIT,
 	FMAX_END
 };
 
@@ -45,6 +46,7 @@ enum {
 #define FEAT_SME_FA64		(1UL << FSME_FA64_BIT)
 #define FEAT_SME2		(1UL << FSME2_BIT)
 #define FEAT_GCS		(1UL << FGCS_BIT)
+#define FEAT_POE		(1UL << FPOE_BIT)
 
 /*
  * A descriptor used to describe and configure a test case.
diff --git a/tools/testing/selftests/arm64/signal/test_signals_utils.c b/tools/testing/selftests/arm64/signal/test_signals_utils.c
index 5d3621921cfe..4b12dbd7669d 100644
--- a/tools/testing/selftests/arm64/signal/test_signals_utils.c
+++ b/tools/testing/selftests/arm64/signal/test_signals_utils.c
@@ -31,6 +31,7 @@ static char const *const feats_names[FMAX_END] = {
 	" FA64 ",
 	" SME2 ",
 	" GCS ",
+	" POE ",
 };
 
 #define MAX_FEATS_SZ	128
@@ -341,6 +342,8 @@ int test_init(struct tdescr *td)
 			td->feats_supported |= FEAT_SME2;
 		if (getauxval(AT_HWCAP) & HWCAP_GCS)
 			td->feats_supported |= FEAT_GCS;
+		if (getauxval(AT_HWCAP2) & HWCAP2_POE)
+			td->feats_supported |= FEAT_POE;
 		if (feats_ok(td)) {
 			if (td->feats_required & td->feats_supported)
 				fprintf(stderr,
-- 
2.51.2


