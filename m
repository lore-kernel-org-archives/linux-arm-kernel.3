Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97F8D32D8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 13:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQVIvXoPZ3PeZcriMWnHrZ2EtdPUqjmfM/nrBzKRoRQ=; b=GWJFu09zkdIHm3MYt8hcfgzL43
	m0Mt2NKVR1PmMl1SVWfYrs1I4SLI28CHVawo5Fd16+hBrKeFf4uJ5tjl7ZF2876Y2rlFPcLkxNNse
	BQegG9LAp/RcWglWAcdrLqBxjTQNuMeYnHHwGy+V6FnH6isK20jv7DnNra9kzkTW9zNB0ZbE9a+tg
	eqtJXSNz0XIvawkwUj2I4RICoM+ph0YPwiUDS4m7AwUNGsaYPUDTUS4chX5AMOIm9QU1k4qm61dCc
	TkEop6VJqw9NShDH7EuX8Wg8n4lFNi+CdZuk814RRZdgOO5mhqGXXSWZhJnyN1gogWu3LODBb2CKZ
	+/eGKUzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqng-00000003XMA-3V0N;
	Tue, 12 Nov 2024 13:19:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqdF-00000003V9o-264E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 13:08:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD4AA5C5777;
	Tue, 12 Nov 2024 13:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A504C4CED6;
	Tue, 12 Nov 2024 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731416912;
	bh=ADBvwCUOO5PzFobBknix6AUoJgfpspN/bImmNrGH1RY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NQqlaOzCcHY7WQnszum5TrNB1XKd11DNYw8lxjVX2bkVXTwa1MxeOQ30LCC5xXg2c
	 eJtVPufkZD5Ipzf6l0DgZkog+o9V2KhiuebgoCjE24t9XPZpRcQiAiMX0ja5eDX9S+
	 C/NvKBsSfM3kCOHsCPDb0MVjXZMRmQZEj005nfLi5OBwZQrQymw0ShgeLk6+Z9sOOm
	 ReWVDSSKZ5q/rgMyhj93ag7iPDzPXuetJZ2t9AKNrgCTQrdSm3QCAuqaQJ6pVAHVDe
	 4IPtOFe452Al4iIz2669VQmvp9UJ9z9edsBOW7zOpQLChljcilOYrZqvJwrpE2a9zo
	 899RfQ08oxU1g==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 12 Nov 2024 13:08:15 +0000
Subject: [PATCH v2 2/3] kselftest/arm64: Expand the set of ZA writes
 fp-ptrace does
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-arm64-fp-ptrace-fpmr-v2-2-250b57c61254@kernel.org>
References: <20241112-arm64-fp-ptrace-fpmr-v2-0-250b57c61254@kernel.org>
In-Reply-To: <20241112-arm64-fp-ptrace-fpmr-v2-0-250b57c61254@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ADBvwCUOO5PzFobBknix6AUoJgfpspN/bImmNrGH1RY=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhnTjYI/TscnsGw4p6T8rFpu/Z8a21dEC7N07L6+d3B7jz
 L1qaUZTJ6MxCwMjF4OsmCLL2mcZq9LDJbbOfzT/FcwgViaQKQxcnAIwkfKV7P/s2vhbJ01ISNP5
 06LS6M3UzK+XfPbu2SeLLl98J8HxTkfCNlO/ylMrrvhRqu2MqDpDM9+q6CSOyfri60tK/nLUN1y
 z8clfrcDl/ceroyv97g/tbeLLAxZ1c6dM+LJ2ztm+JIZ1YcL1Sy5yTtn3MKDy5O5d608xVO6YGH
 mHb2a2RqtX3FaFE1zHHx4q/+ha98v5896SB2l1/ukZ8SwXJ5zWCzNS353de9W/tHpZtey09apcY
 apeipXa7+uLfYQZgpQr5tW2Tfe+ftKoe5FukWXtnU/f2f6c9DB2eeUpvLGjUmCq187zqob6y5jK
 +7OX1GlNa2RdLcFy0vnzqiSdPNfwm2vmGp9azv9czqsAAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_050833_676927_20A17511 
X-CRM114-Status: GOOD (  12.78  )
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

Currently our test for implementable ZA writes is written in a bit of a
convoluted fashion which excludes all changes where we clear SVCR.SM even
though we can actually support that since changing the vector length resets
SVCR. Make the logic more direct, enabling us to actually run these cases.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index d96af27487fa642e94ecc971f53cb78c233e7b44..56cf6e02c535b5c1cf1134c5b1973605c96024ee 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -1078,21 +1078,19 @@ static void sve_write(pid_t child, struct test_config *config)
 
 static bool za_write_supported(struct test_config *config)
 {
-	if (config->svcr_expected & SVCR_SM) {
-		if (!(config->svcr_in & SVCR_SM))
+	if (config->sme_vl_in != config->sme_vl_expected) {
+		/* Changing the SME VL exits streaming mode. */
+		if (config->svcr_expected & SVCR_SM) {
 			return false;
-
-		/* Changing the SME VL exits streaming mode */
-		if (config->sme_vl_in != config->sme_vl_expected) {
+		}
+	} else {
+		/* Otherwise we can't change streaming mode */
+		if ((config->svcr_in & SVCR_SM) !=
+		    (config->svcr_expected & SVCR_SM)) {
 			return false;
 		}
 	}
 
-	/* Can't disable SM outside a VL change */
-	if ((config->svcr_in & SVCR_SM) &&
-	    !(config->svcr_expected & SVCR_SM))
-		return false;
-
 	return true;
 }
 

-- 
2.39.5


