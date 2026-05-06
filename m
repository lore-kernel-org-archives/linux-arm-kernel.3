Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF4ACD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nu1vquhEqOoFVaPIOUS9hiptXEpJ1h/rprk6WqGjJDY=; b=yX0gJg6RHtLjIzwcvUef6DQ4Sn
	GZrgM0Jc5z5C9iwnLxDTMQAlAgNcRVlvPAwdWLfWMewJjR8HL6ZLqY6rOk6cNTFYTEP6pA7oLG1v0
	Jlc9pOtdkga1X5b+3tAuMymLj1kCEc7s4Kf3kD52xAf60QB6NxC5c3TqO7egXd1RYjxZwL60ZrkYO
	AAHlVNbiSF9GUXKOE0HiWh0xLmfZNkIRgRn03WxoDgXAIwTjqytebGZ3YWp/Y1MkM2KkXsvZaR9C2
	rZtrCthn4Xf1q7yj04w/0Xlrc+rRGfXTSuYn7GoZwB/gK6Fn+FLMsRxoD4nMZ7ZP7R6sceImVnzfy
	UlrCayrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKiF8-00000001ufA-1wnr;
	Wed, 06 May 2026 19:49:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKiF7-00000001uee-3S8s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 19:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4ABA43C9F
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 May 2026 19:49:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80ECDC2BCB0;
	Wed,  6 May 2026 19:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778096949;
	bh=eKuy7X2bPfQQngcZlWjAGcHROH9JN9FtPA/+aDIQWeA=;
	h=From:To:Cc:Subject:Date:From;
	b=Vph2x3BPSzZ5RIOODvIAYAR3IfRO4N9+RIa/ESncGOp5K1DmEV/6eps+gulCXJV6I
	 AMf6ehBJ3Sh+k8YHtUSB9WZFq2xYPqt+R4vbgK8EK2twX6mdUXFiHmBYtiKt2Ka+3M
	 pKIp4Bs8sd4OhtClurTG7ogR9ZtMLCtmKFqJxfVd8Yyzz8ZIIgy/14vKXNJlkWFDiV
	 BgXNWikpkNYydJtXz13wBFmFV4c0nbwA19sljfNLjibcrSRfJx/6o8tuCff1CKcrB+
	 uaMhEWjMhiu7dkVa6RGeVbo3psnZsrcrrATqPwoWAZ3eKxhTLUiV0dEILUqFUuIIjE
	 U0NpSud7BYeCg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [GIT PULL] firmware: arm_ffa: Fixes for v7.1-rc1(Round 2)
Date: Wed,  6 May 2026 20:46:00 +0100
Message-ID: <20260506194602.3474096-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_124913_913234_A80441A4 
X-CRM114-Status: UNSURE (   7.44  )
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

Hi ARM SoC Team,

Please pull !

Most of the issues addressed are found by sashiko and other AI agents.
It all started with me missing the report by Sashiko in [1]. Each round of
fix expanded the AI scope of review and unearthed more issues.

Regards,
Sudeep

[1] https://sashiko.dev/#/patchset/20260402113939.930221-1-sebastianene@google.com

-->8

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/ffa-fixes-7.1-2

for you to fetch changes up to a6848a50404eefb6f0b131c21881a2d8d21b31a9:

  firmware: arm_ffa: Fix sched-recv callback partition lookup (2026-05-05 16:42:49 +0100)

----------------------------------------------------------------
Arm FF-A fixes for v7.1

The updates fix several robustness issues in the FF-A bus and core driver,
mostly around notification handling, RxTx buffer sizing, firmware-provided
bounds, and cleanup paths.

The notification fixes make per-CPU notification work truly per-CPU, avoid
running per-vCPU notification handling from IPI context, keep RX buffer
release serialized under rx_lock, validate framework notification payload
layout before copying from the shared RX buffer, and avoid dereferencing
notifier entries after they may have been unregistered.

The remaining fixes reject FF-A drivers without an ID table at registration
time, avoid freeing an unallocated RX buffer after allocation failure,
unregister the FF-A v1.0 bus notifier on teardown, bound register-based
PARTITION_INFO_GET descriptor copies, align the stored RxTx buffer size with
the size mapped to firmware, and fix sched-recv callback partition lookup on
the circular partition list.

----------------------------------------------------------------
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
 drivers/firmware/arm_ffa/driver.c | 144 ++++++++++++++++++++++++++------------
 2 files changed, 104 insertions(+), 44 deletions(-)

