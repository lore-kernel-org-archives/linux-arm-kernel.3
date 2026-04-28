Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A9AFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 18:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1u08TvS5VZO19pH9mSpqHqvpUM9p0a4DMxk/QlMnzyU=; b=nROMGfsCq9aEmx
	uzqTI11/dwLTAEMbPN9G4dSrlkoYEc7LERomZ440C8AVqMUVxcNxQecuUkeZO5quwZFc6mYb/nqxf
	Hx/HN11rMYNa1++Ph6GA/5Dfh5Se/Heh9Bf8MVCaGqRlYvoKh5+fHWLOPVc/ZHNRmRBFLK+d0S4M8
	OrOoKF+j1fVWlTJ3vkBEhJ5+UEmoeN1GTBQ2zNlkI61Y8kvqNa8RNAPQCPnIedDyyoagiYd6wX3at
	is9AlICp8MomwYn2b4eVFvy0CFX/O7jh4RxisF6tK3Nk28KCaW5saKSlpnj9QC2RnqejZEGjLMAjZ
	KMbashpaJ8JT+lU/QQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFn-000000025D9-2dm3;
	Tue, 28 Apr 2026 18:33:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHnFn-000000025D1-07XK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 18:33:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C86E61119;
	Tue, 28 Apr 2026 18:33:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED86C2BCAF;
	Tue, 28 Apr 2026 18:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777401229;
	bh=EMyzlxpVvJDbrhhvh1Vj6X1lXlKjwC8Q+i5uCO+iUBA=;
	h=From:Subject:Date:To:Cc:From;
	b=B0eOsdtp0k+5cIjV70VycURCtopArbuJg0Cet0+PCQZkhRfiG54e631fHkcrEcyX2
	 jnyX/ak3xHJGBX3ZcU9YkMDa9nhb+Fm4Jz+nR8Pa3gF9140ZCDXivcr+Nuu8h9RrGo
	 nYf5tqSG2xIWv5+S1JsngAWOiH7CWRjFHDTH4syqru9LTnzQL4s5NoWoAl0zmqskh/
	 J9DUNy5ZAdKwGHf+aVvMLbnTFW68ZW2l29FTxFCRYSwy11AZaJWN/3J8Hg9vjaqoZ3
	 fqzStatm3Vdhn43/XuUzN+APcIHvc3FEX/hRV/otS0p6J3mpjITcRZBuyyeSaf0C8l
	 jcuX3WmyKHt7Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v2 00/11] firmware: arm_ffa: Fix cleanup, notification, and
 discovery paths
Date: Tue, 28 Apr 2026 19:33:24 +0100
Message-Id: <20260428-ffa_fixes-v2-0-8595ae450034@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHj98GkC/22NywrCMBBFf6XM2kgeNagr/0OKxHbSRiWRTA1Ky
 b+b1K3Lwz2cuwBhdEhwbBaImBy54AvITQP9ZPyIzA2FQXKpeSsVs9ZcrHsjsdYMSlmOKHcciv+
 MuA5FP3c/ptf1hv1cA9WYHM0hftazJKr3r5sE40wLsT9oLYy1eLpj9PjYhjhCl3P+Amb28QS1A
 AAA
X-Change-ID: 20260423-ffa_fixes-4ad33f0ee250
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Sebastian Ene <sebastianene@google.com>
X-Mailer: b4 0.15.2
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

Hi all,

This series fixes a set of issues in the FF-A driver around init
cleanup, framework notification handling, v1.0 notifier lifetime, and
partition discovery.

The fixes are all small and localized, but together they tighten a few
important paths:

- fix the early init unwind path when RX buffer allocation fails
- align the stored RX/TX buffer size with the size actually mapped to
  firmware
- ensure the framework notification handler always releases the RX
  buffer correctly
- validate framework notification payload bounds before copying data out
  of the shared RX buffer
- fix the partition lookup used for sched-recv callback registration
- unregister the FF-A v1.0 bus notifier during teardown
- bound the register-based partition discovery copies against the caller
  buffer
- reject FF-A driver registration without an ID table
- fix per-vcpu drivers own notifications handling in workqueue
- make NPI per cpu work item to avoid collapsing already queued work

This is the outcome of the self-initiated review of the entire driver
following the oversight of Sashiko’s review on one of the patches that
was merged.

https://sashiko.dev/#/patchset/20260402113939.930221-1-sebastianene@google.com

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
Changes in v2:
- Addressed valid comments from sashiko
  (https://sashiko.dev/#/patchset/20260423-ffa_fixes-v1-0-61189661affe@kernel.org)
- Added couple of new fixes based on the review
- Link to v1: https://patch.msgid.link/20260423-ffa_fixes-v1-0-61189661affe@kernel.org

---
Sudeep Holla (11):
      firmware: arm_ffa: Check for NULL FF-A ID table while driver registration
      firmware: arm_ffa: Skip free_pages on RX buffer alloc failure
      firmware: arm_ffa: Avoid collapsing NPI work from different CPUs
      firmware: arm_ffa: Fix per-vcpu self notifications handling in workqueue
      firmware: arm_ffa: Unregister bus notifier on teardown for FF-A v1.0
      firmware: arm_ffa: Bound PARTITION_INFO_GET_REGS copies
      firmware: arm_ffa: Keep framework RX release under lock
      firmware: arm_ffa: Validate framework notification message layout
      firmware: arm_ffa: Align RxTx buffer size before mapping
      firmware: arm_ffa: Snapshot notifier callbacks under lock
      firmware: arm_ffa: Fix sched-recv callback partition lookup

 drivers/firmware/arm_ffa/bus.c    |   4 +-
 drivers/firmware/arm_ffa/driver.c | 138 +++++++++++++++++++++++++++-----------
 2 files changed, 102 insertions(+), 40 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260423-ffa_fixes-4ad33f0ee250


-- 
Regards,
Sudeep


