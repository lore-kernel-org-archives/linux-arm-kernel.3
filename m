Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B3BE7DF19
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y0SQA2DCPtCAyrCB1taAmCcHiX9Y9ssa35y7xR4oBdg=; b=AZnYVoJT8RdZik+ZuYcnmwz4OH
	KMNvUSiGlhVeDGhecZbM3xxe2jzgkVHtDHSq5EsgVKWa+OJiAuLY65X1XHZGe9n/SsPNIQjGUe715
	shwKKyz4BWoDKYTkJUxUBiCCwkaCsJVf/B2hjGQS6rzjGqyOQ0x1c86iRFy3tN99NNPadDdJrpD7A
	EtRsx06F3BC9SzyN2SubcSZoXtO4/PRoPZFcV/hjMmaUrOXqQLl4rL7tfHoQsZuGIQ3oo69BLYoZk
	VNkbTt9kuZJ/vQTsGZgLWnOyGRUeiL607SBH1Cg8b/gcy4YKJrvhegGD1ojRguQdegYK6ZfCio69x
	VMH3bCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyji-00000005QaF-2TTO;
	Mon, 02 Feb 2026 18:33:22 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyjf-00000005QZV-3G2l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=y0SQA2DCPtCAyrCB1taAmCcHiX9Y9ssa35y7xR4oBdg=; b=tTDixZsKE24SXoghdvPSJIy8bc
	OY+nKwrZMGHsblrqfVwV+w5FzXC4t0XVVaaBBBZLJsSWb0WmCBybILhPr+TbSpU2xYj1m0+dYUkHi
	GVb/T3KLnt+/2P9nV8NjF5SfretBVNqa+HbAzxlxtrIMoE6Wrhe+0fzl3u6COvhsLNQev2LyKRuA2
	4ct4blldhRSM0ke44hB0deUx1+jbr92jFIHpXXqlkSwxEkvq2YPF1UthY+Dxo0KxkBSmNALUNn2E+
	qDwzGSAvDXLcGsnH+Zh1G7IlUutt6iVONhthX+0mkIt6y0VUpbEJlB2EPCFoSa5k1HlrWgzyG68Lo
	yb0ORK4A==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vmyjP-004Eqm-Q4; Mon, 02 Feb 2026 18:33:04 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 02 Feb 2026 10:32:51 -0800
Subject: [PATCH v2] arm64/gcs: Fix error handling in
 arch_set_shadow_stack_status()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-arm64_cgs-v2-1-e6a837edf021@debian.org>
X-B4-Tracking: v=1; b=H4sIANLtgGkC/03N0QrCIBTG8VeRcz1DzVzuqveIEdOdthM0Q5cUw
 3ePrS66/ODP71sgYSRM0LAFImZKFCZomKoY+LGbBuTUQ8NACWWEVJZ38W70xQ+Ja2uOshbq0Eu
 EisEj4pVem3Vuvzs93Q39vAJrMVKaQ3xvZ1mu3c/diz83Sy65t85YrZxxtTj16KibdiEO0JZSP
 mSeIOa1AAAA
X-Change-ID: 20260129-arm64_cgs-496817025d1e
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-f4305
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367; i=leitao@debian.org;
 h=from:subject:message-id; bh=MmPseQkgfaXXHt/9anSYmv5Kd61ckl4pLRDdwCFqgN4=;
 b=owEBbAKT/ZANAwAIATWjk5/8eHdtAcsmYgBpgO3bMxMjQORPcK48PqktX1No+2mRwB7F6LhCu
 zXTewSqDOiJAjIEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaYDt2wAKCRA1o5Of/Hh3
 bZSVD/dytK0P3BZSDUHDJxU/yCmzV6hGAp5K8Q5aOuTXPXFXcl1Xw3hiMz4hOEzRzBKnH9tt0gZ
 6rAul496Tnusr5EATsIjSFd8D2MZKcnMV1L2TShE7vB8DbPN4txylihnsrpI/DqTzEs5tuO7Io5
 s0kMxxdJGy13qGD2bxxJAwpNTIt1/bST8KPhoOwhJgyyt2Io3K0p6AHmWrx1Vt8ozzlbH1i7+Ql
 3rm5Q34NufWbf1xu8JS9lm7eGL5oELHK05TvbabeuKdLffi8pa8KrnjHb8wWV+/xGCcWNKJHliz
 oEtlEslte00pLwVYBBvwqFwhYrFr+5bhtXTVuPbbKw71uyC3Jw24tR9vnZj5RF0dGFuyitd0Rfv
 7NhrkrncuuoJdk1+fp1pou8z9DBjdvt16J26L2XUZpLBd55xMZ0Bmi+bEzGGBcemrgcdI6HmhHN
 EoY0yo1uUeIR0KLFDuNjcJY5yLhdFZMMiIkhdC7DlsIPoJkrHWdZzAh+CkA0+dSzUHrM6cmb/22
 rrRNH3N/uUPHptRhBbpqOPBYx/emTfJbOrs0kUrbY64aSkuKA5Rf10fKLhAuRktDQlGKzOlxqvW
 xsOnOfcbHVERVuiMqAhAIbWcYiQqdWjx1wNxEjgp2PtxSL6s4C9MQpLq8FzEyVpw5x1HQW78Q2X
 1RClQ37Qc5hyq
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_103320_056966_CD5E1AAD 
X-CRM114-Status: GOOD (  11.73  )
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

alloc_gcs() returns an error-encoded pointer on failure, which comes
from do_mmap(), not NULL.

The current NULL check fails to detect errors, which could lead to using
an invalid GCS address.

Use IS_ERR_VALUE() to properly detect errors, consistent with the
check in gcs_alloc_thread_stack().

Fixes: b57180c75c7eb ("arm64/gcs: Implement shadow stack prctl() interface")
Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Remove unnecessary PTR_ERR() conversion (Will)
- Link to v1: https://patch.msgid.link/20260130-arm64_cgs-v1-1-c9b6942b6b70@debian.org
---
 arch/arm64/mm/gcs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 6e93f78de79b1..04a23a497f205 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -199,8 +199,8 @@ int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
 
 		size = gcs_size(0);
 		gcs = alloc_gcs(0, size);
-		if (!gcs)
-			return -ENOMEM;
+		if (IS_ERR_VALUE(gcs))
+			return gcs;
 
 		task->thread.gcspr_el0 = gcs + size - sizeof(u64);
 		task->thread.gcs_base = gcs;

---
base-commit: 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
change-id: 20260129-arm64_cgs-496817025d1e

Best regards,
--  
Breno Leitao <leitao@debian.org>


