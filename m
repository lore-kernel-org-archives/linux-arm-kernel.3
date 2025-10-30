Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4412ACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ndy5f5iXLygAktyMJBu7gDkXxI7rvNnRYgFdYkcYKx8=; b=zDggUCWr3eHNnM
	oTDMMBQWnRVxQLpzaFNn562x2dTq7EwZXak9tClQGcFRC1jlHq3rBrtvueus1nxzqxiqlFD+XbX0p
	6Gju8aTNIwZa3WI4jlLt/NwtGxFx1UfwCuIzYkP5e7HVaA/9Exvh1n5tGcfNwH3qow8QKr3NYTDRH
	W1gfOonE3/6KUjMC8bxlKVJ7TD6aQWsifiYAk4lOorZSSkpCBryv7tGNB4ZwAV8jdIZTMH7aF0vpr
	q9Nmxmy60sjzclyOEPiKVLNPLWEeOydgUxxg8LLkgPxvbfq6wsr6M8AJoxoix+gdKAHu9oHLN8uO0
	4q88zrMCZejnm/pxjsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUs0-00000004PMT-25Nr;
	Thu, 30 Oct 2025 15:47:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUrz-00000004PMI-46Uk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:47:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D9D060191;
	Thu, 30 Oct 2025 15:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F12C4CEF8;
	Thu, 30 Oct 2025 15:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761839242;
	bh=+700ZoH9beBUCGWPdpdtRrHrZpBqINFzjki0JlY+WIM=;
	h=From:Subject:Date:To:Cc:From;
	b=kSCvkpnWAFvxXim34lW/0VaSlUE+r7nA0g/2z6xu6EtrFLL2Vxbht1Nc94nIfPg6m
	 NyciTW/5MsbXMhB3A7mZMnwA1M9GMswJqHnSt6XRBMqzD0R5QdHMaP1pIjbYVEWpTj
	 SJDTOCYT8XrpFDTaHV9/BtROFkuBVIf3HKrlj/GpRm9vkH54ivvWSv2X0YQNlhtt8q
	 /Wo6Tzoa1TMzPNJyJQBnjNfILkKvE5wYcyzFUEvR+nnLsSjMvmeyEt90HbJjQTbg3a
	 nG61vRJaWR/jsQ1FlIDwoOyeA134/gRjPDZrS9jdMYQJQy8gTM12t7sPWYlTRkY+Vp
	 Ox4Pc/WR4heZg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] KVM: selftests: arm64: Improve diagnostics from
 set_id_regs
Date: Thu, 30 Oct 2025 15:42:46 +0000
Message-Id: <20251030-kvm-arm64-set-id-regs-aarch64-v1-0-96fe0d2b178e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHaHA2kC/x2M0QqDMAwAf0XybKAtrs79iuyh1kyDqCMRGUj/f
 cHHu4O7QEmYFF7VBUInK++bga8ryHPaJkIejSG48PAuPHE5V0yyxgaVDosoNCmmJHk2R8PQtl3
 sGucz2OMr9OHf/e/fpfwBox+vQW8AAAA=
X-Change-ID: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-88d78
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+700ZoH9beBUCGWPdpdtRrHrZpBqINFzjki0JlY+WIM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpA4iFRz9aKzGShuvRtfEbfX3NhTm+GpE7qdJVU
 9mLWnT7HAiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaQOIhQAKCRAk1otyXVSH
 0MiEB/4gsZLaeP176xWNHCFoMI210dAWo/OxnDFWqQuSDbWvV74qEFThEfGIMWBjS79ZkCwZ9Hb
 +nG4LaTF85FPUVWs262tIEV/DtYiltFySzXW3sINV83pWZYijjNBr5x9jOtJZ9NCPJBObvWzC8g
 +e+8Odemr4DbLuKbuWcYZHgA9Ff/36CmqLOlzKXhxPaJgEj17A6wxRkY+ICqWTAAFScujFVyqHu
 CWKPM8IB5HlWx2qv6sHeJfRXun2NVXW91pxyiQTWBkhiuslmMvFhHGOptK/rGqf3DhK9f7cA28Q
 8Fr/NqxlzjWe7J8/TJsLN2MwKuu0TyPvvcVJcJ3vAB6rDh5c
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

While debugging issues related to aarch64 only systems I ran into
speedbumps due to the lack of detail in the results reported when the
guest register read and reset value preservation tests were run, they
generated an immediately fatal assert without indicating which register
was being tested. Update these tests to report a result per register,
making it much easier to see what the problem being reported is.

A similar, though less severe, issue exists with the validation of the
individual bitfields in registers due to the use of immediately fatal
asserts. Update those asserts to be standard kselftest reports.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (3):
      KVM: selftests: arm64: Report set_id_reg reads of test registers as tests
      KVM: selftests: arm64: Report register reset tests individually
      KVM: selftests: arm64: Make set_id_regs bitfield validatity checks non-fatal

 tools/testing/selftests/kvm/arm64/set_id_regs.c | 108 ++++++++++++++++++------
 1 file changed, 82 insertions(+), 26 deletions(-)
---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251028-kvm-arm64-set-id-regs-aarch64-ebb77969401c

Best regards,
--  
Mark Brown <broonie@kernel.org>


