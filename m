Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266B5D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 00:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9eNZQQZbqRBeDJBMnjy4fDIculr+RS+/XQy2lmKyBaM=; b=nEmXiUqqE3TD9UHF+QdQImaWFj
	MOZvySWLwJZEm1uePSrl551gM4ykvsAZVDnuo7pDQ7YOS+PY5GRkRf3akIGIMsawQDVHIzse4tOcu
	HDsadNP8rzidvyaSkUHczKcLPKS1v0jvTxDYTHMuUJu7MwiORDPIRkq1PNidgDe8eEg1h0l//FmPl
	Vl+Fq5C2OPSG0vBCU/TY9NP8LIzY39JvSsqBTtaig0D/vQfweNTuKcWVIXGByTPQjJuHEaGndf10e
	LnK/PFAJROkJgAPbiDFeCnfur7zeEjdf1MeF92cYE4FjVYB0hyixvjNd0aEzHbG8xScY6ir+rqUSE
	rlgIKl9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP993-000000016EN-0MKX;
	Sat, 29 Nov 2025 00:49:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP992-000000016EC-1lUQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 00:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 447F160198;
	Sat, 29 Nov 2025 00:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9BFC4CEF1;
	Sat, 29 Nov 2025 00:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764377338;
	bh=nEUcoR9iWdz6yB51JHK9UPbmFj+a6cm+4UL+mbMBL+k=;
	h=From:Date:Subject:To:Cc:From;
	b=bvgjXRuOqTFYd/uQqWWs6mMAbpWjCkRzy0di1Un3k3130x665YYKYh25718NHgrzv
	 iBOYrzYGScZK0yhhlbEEhzhtZKX+u96PkJA3F/nWQDRgCWaD6PpxJFcQIUB0fw/hma
	 2kLbb8tc1fW4KTh5Wt/TUkrwS8wN8heawYLBIGg+0wDT4m+FQNi5ncd2mHRCKv4qtR
	 ReGvkRHunY6nzwgCKPp7rvwX+9g8Z9bAmrnUwmbzrXXNzv8KLrk+uRrt4jxaJvhFSG
	 oGPVFdb/+uu1M+sgVJJKbD9h4XWLBYZL3+xwkLjWJCTtjhpRkIqZp/r7D/wJgDA52h
	 7J5JKeDn3uFqw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 29 Nov 2025 00:48:45 +0000
Subject: [PATCH] arm64/gcs: Flush the GCS locking state on exec
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-arm64-gcs-flush-lock-v1-1-902b3ba6f39d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAO1CKmkC/x3MTQqEMAxA4atI1gZspop6FXHRqakGf2lQBsS7T
 3H5Ld67QTkKK7TZDZEvUdm3BJNn4Ce3jYwyJAMVVBpDNbq4VhZHrxiWUydcdj+jqT7svo0nChZ
 SekQO8nu3Xf88f8bIUBRmAAAA
X-Change-ID: 20251128-arm64-gcs-flush-lock-163eab9c22f4
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Yury Khrustalev <Yury.Khrustalev@arm.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-88d78
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nEUcoR9iWdz6yB51JHK9UPbmFj+a6cm+4UL+mbMBL+k=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpKkL4DIiz6bVybHOUsOHJg9zsT0j7sck6+H+O4
 fnymV7fmF6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaSpC+AAKCRAk1otyXVSH
 0Au6CACA/pa8ugnkCwCHSsKjDC8M5nK8giyylPWOuZLc/23z1cDZhmnJ3rIl+6B0C0o5+GpDqT4
 pvL7cQm6AVE1seRok97UUXWpT4SVqZO9zeyl0Noj/zBdO5ZFw6z8nAeqjppL7PABGUTuhotL5lE
 JwI2pUUfvAJd3OvIW7MOohrtW7UUzacnTr9RtY1UlVDKSFRbcDrs3btfPi78NVUgdn17hAwTEAW
 Fv/j6pqe3XjAILojfzHT6/+WYruKbz3z+kyOb1RQ2Hr052ktvxAihaQzi77lWXt4lVZ7YT2Lzzm
 ofJfe3Kj/h4MW3Z2cyS54KGowfEolYwc4PZKR4Su2iSxzMAU
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

When we exec a new task we forget to flush the set of locked GCS mode bits.
Since we do flush the rest of the state this means that if GCS is locked
the new task will be unable to enable GCS, it will be locked as being
disabled. Add the expected flush.

Fixes: fc84bc5378a8 ("arm64/gcs: Context switch GCS state for EL0")
Reported-by: Yury Khrustalev <Yury.Khrustalev@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/process.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index fba7ca102a8c..489554931231 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -292,6 +292,7 @@ static void flush_gcs(void)
 	current->thread.gcs_base = 0;
 	current->thread.gcs_size = 0;
 	current->thread.gcs_el0_mode = 0;
+	current->thread.gcs_el0_locked = 0;
 	write_sysreg_s(GCSCRE0_EL1_nTR, SYS_GCSCRE0_EL1);
 	write_sysreg_s(0, SYS_GCSPR_EL0);
 }

---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251128-arm64-gcs-flush-lock-163eab9c22f4

Best regards,
--  
Mark Brown <broonie@kernel.org>


