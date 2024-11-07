Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF3CD29FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 01:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jzlyVk+AVcvH3QU4ipMxv3YkT63k9s9bH9ssnRNUGEs=; b=tZAQVt3Gn5ujdf
	MjRkCTBbyr/JvS8guiyJecXwhF8enXTlgDffsMVRuEtvcZ09ZsFto+6KGPOZxfTqQDINRg97lKpRX
	CdKNUf5BjA9w82sngxEjzaIeKjuCwSWKugNVSpQja3vyk4n3LI8otGctAt1FxjckC44cpOE/eyu7n
	88z/4cbpyMOTXny/lHtJLkwN5eCJqlCtc/hbgzQ7w6aNfr2WROOg7Z1AKjte1hxeYkBMFgv7hRZKR
	M625YFMD5DILkGXy55mmsM0Aj01W3Xkq6gFZcAUq4Rik1n8GyY5ulqgEzCeoXLLO+VfkuyqIAe9mW
	rg6xzDublldkbuUNlu+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rjh-00000005MHw-0SzK;
	Thu, 07 Nov 2024 01:55:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rYu-00000005KBL-3srY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:43:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 013DDA41F27;
	Thu,  7 Nov 2024 01:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59F8C4CED2;
	Thu,  7 Nov 2024 01:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730943830;
	bh=FhICeJvrCrMnhdIC0qbv97Akl1RvVJJpaEaD5gQEQkI=;
	h=From:Subject:Date:To:Cc:From;
	b=nhvhSiowtMf8/jmGZFs5hS9PWKjCrMfrUBKFofjAdOsy7xW4rruML9GDvgRv3864C
	 cL/xowZYZdQt07JxJBXHUOeVrTdY+qTLLuCFwyuLgPq9ZNXWgdpn8yrmDpiITcZBBZ
	 PuDFJXPmoDEGDK+jA+KlgKkXRuyWVCmHnLWEDWIf7R6iDd28Svw7xa0E//AvGon9XB
	 bfOlahysdUQK7jjMvBKNXEm4zXhuKq8hgrYVF5ps82dDdWpY2EcF/9eJDpOdJjj6Ug
	 dasT1MrzMMbpWomAw02dpYx0xVdQy6ttfWx3EBs8HVi5waNWLRpLir6Qm9Jd8gd5Om
	 XbNIqGFAl6XOQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/6] kselftest/arm64: Test floating point signal context
 restore in fp-stress
Date: Thu, 07 Nov 2024 01:39:19 +0000
Message-Id: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEcaLGcC/42NQQ6CMBBFr0Jm7RhaWyOuuIdh0dgpTFQgMw3RE
 O5u5QQu38//76+gJEwK12oFoYWVp7GAPVRwH8LYE3IsDLa2ztT2hEFeZ4dpRs1CqsginEOeBL0
 zPlFjQ6QEZT8LJX7v7ltXeGAttc9+tZhf+o91MVhj8CYk21yic037IBnpeZykh27bti+YJFURw
 wAAAA==
X-Change-ID: 20241023-arm64-fp-stress-irritator-5415fe92adef
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2115; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FhICeJvrCrMnhdIC0qbv97Akl1RvVJJpaEaD5gQEQkI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnLBtPi1qDcL+XawjQAGXXQlcQzDYJjTrJcbT0hrdY
 f6lTU3mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZywbTwAKCRAk1otyXVSH0KqqB/
 94CvW0iwYt/m+SSaM1tOpg0sIMZGdjqX9W9LiI1I9s+MgwaQO6VWnL1ZmxWKVBh4wtuqgnl8iGwh2s
 QeHdfTFAKXd6j7rDgD14MgjEZsu42KjRuey45UBc8zEUVhN1GJxshOfBz9pxcTC0o4TFlymX6UJhiF
 39++v7nxzary5Z1hwOv/WnIb68f4SgBDjbGxWICR0mYwl66Op/AYbzRkbveCGQoC/ud7f1vCVRYF2j
 RPnv4gU+VhDtXq6VxDPLFMlAItqxN4QsdXssCiikt9Sle5Cz4dSsiR7TVq6hnckL8kMI6NvmFcBOam
 TNoaSZZeMLYY2GObPj5bVHUN7tyLKJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_174353_449061_2C63A361 
X-CRM114-Status: GOOD (  11.31  )
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

Currently we test signal delivery to the programs run by fp-stress but
our signal handlers simply count the number of signals seen and don't do
anything with the floating point state.  The original fpsimd-test and
sve-test programs had signal handlers called irritators which modify the
live register state, verifying that we restore the signal context on
return, but a combination of misleading comments and code resulted in
them never being used and the equivalent handlers in the other tests
being stubbed or omitted.

Clarify the code, implement effective irritator handlers for the test
programs that can have them and then switch the signals generated by the
fp-stress program over to use the irritators, ensuring that we validate
that we restore the saved signal context properly.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Change instruction and commit log for corruption of predicat
  registers.
- Link to v1: https://lore.kernel.org/r/20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org

---
Mark Brown (6):
      kselftest/arm64: Correct misleading comments on fp-stress irritators
      kselftest/arm64: Remove unused ADRs from irritator handlers
      kselftest/arm64: Corrupt P0 in the irritator when testing SSVE
      kselftest/arm64: Implement irritators for ZA and ZT
      kselftest/arm64: Provide a SIGUSR1 handler in the kernel mode FP stress test
      kselftest/arm64: Test signal handler state modification in fp-stress

 tools/testing/selftests/arm64/fp/fp-stress.c   |  2 +-
 tools/testing/selftests/arm64/fp/fpsimd-test.S |  4 +---
 tools/testing/selftests/arm64/fp/kernel-test.c |  4 ++++
 tools/testing/selftests/arm64/fp/sve-test.S    |  8 +++-----
 tools/testing/selftests/arm64/fp/za-test.S     | 13 ++++---------
 tools/testing/selftests/arm64/fp/zt-test.S     | 13 ++++---------
 6 files changed, 17 insertions(+), 27 deletions(-)
---
base-commit: 8e929cb546ee42c9a61d24fae60605e9e3192354
change-id: 20241023-arm64-fp-stress-irritator-5415fe92adef

Best regards,
-- 
Mark Brown <broonie@kernel.org>


