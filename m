Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9D2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uvSiy5im8+ukroQ2/8CIqL5c1HixXr0B5I98YK9SCBM=; b=UsQreLkoIlDYROA7f5sL91vnEf
	ceBGN0g+YDhF2TtLCGKBOVFHXlRExO5/dWzQrJiQKZm5Mm+6+sjFyLLaYvCyqRsgeDHGjuQd6U37M
	islvDP2mWxgNyrZWuqd4SKZ0Wb4NROEZB9z5/HhaluNC9Uz9qaiszwt3dvwJG0B95LNYqYcDlwMWj
	gVv43u7nJKjsLLApAsJ7xDzdg38ImlwDUHFG8QEtka5RruBWIiT5Ln1ARfk5jx6odl/k4zeXcswVB
	lbkxuCrMzCwNZTh+8/rWvi96NetA4zmtBR5BgWKHA6bA0RqUmvya2TNDA6cFmxNZtqP4skLq/Rayu
	TTHyuJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjETu-00000008xjl-25jj;
	Mon, 13 Jul 2026 11:05:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjETt-00000008xjb-1K9y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:05:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80C1D6004E;
	Mon, 13 Jul 2026 11:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2801F000E9;
	Mon, 13 Jul 2026 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783940748;
	bh=uvSiy5im8+ukroQ2/8CIqL5c1HixXr0B5I98YK9SCBM=;
	h=From:To:Cc:Subject:Date;
	b=ZG9EXzsawu1YTuCCmQLhbPsoCKUx9xWbltM2GIcVVEYM54JcE6IqtLd+d05o/5B6N
	 hmHusz7UqMfzvZXFYJvUbjqQlrhOI5tri+hQRri0PrpGPMsBU3Yp1tHWZ2BImHjCSu
	 IfwemKJmkcZrWnfJB4kTxKmd7Vr0cICsJX4u2YemIY7RlQ5y1s1BXHjpwj2pf2qTz3
	 eyk5vrBt19RvZccLvT1C/nkmq/j0sdRB7HQwuruS+wrcjMqmx87Sbaic/zpkvEzfJc
	 Yj9Bb8zpXnn7wkzXyhPVmpbIDVT++LfgA8XTAaWc5CgVpfRVTrk3JwcR87MtiXSyqb
	 QmD+a02DjSHaA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: ARM SoC Team <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi/arm_ffa: Fixes for v7.2
Date: Mon, 13 Jul 2026 12:05:36 +0100
Message-ID: <20260713110538.1819713-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Regards,
Sudeep

-->8
The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-ffa-fixes-7.2

for you to fetch changes up to 980a8bfe7baec9b9ee0d5443b0b204552e41c407:

  Merge branches 'for-next/scmi/fixes' and 'for-next/ffa/fixes' (2026-07-13 11:38:34 +0100)

----------------------------------------------------------------
Arm SCMI/FF-A fixes for v7.2

Fix two runtime issues in the SCMI framework. Use full 64-bit division
when rounding range-based clock rates, avoiding divisor truncation and
a possible divide-by-zero on 32-bit systems. Rate-limit notification
queue-full warnings emitted from interrupt context to prevent printk
floods and prolonged system stalls during notification bursts. Also
correct a grammar error in the ARM_SCMI_POWER_CONTROL Kconfig help
text.

Fix the FF-A driver RX/TX buffer sizing logic to respect the maximum
buffer size advertised by firmware, while retaining compatibility with
older implementations that may reject PAGE_SIZE-rounded buffers.
Also fix a NULL pointer dereference in ffa_partition_info_get() by
rejecting NULL UUID strings before passing them to uuid_parse().

----------------------------------------------------------------
Geert Uytterhoeven (1):
      firmware: arm_scmi: Grammar s/may needed/may be needed/

Pushpendra Singh (1):
      firmware: arm_scmi: Rate-limit queue-full warnings in IRQ context

Seth Forshee (1):
      firmware: arm_ffa: Respect firmware advertised RX/TX buffer size limits

Steve Dunnagan (1):
      firmware: arm_scmi: Use 64-bit division for clock rate rounding

Sudeep Holla (1):
      Merge branches 'for-next/scmi/fixes' and 'for-next/ffa/fixes'

Unnathi Chalicheemala (1):
      firmware: arm_ffa: Fix NULL dereference in ffa_partition_info_get()

 drivers/firmware/arm_ffa/driver.c  | 29 +++++++++++++++++++++--------
 drivers/firmware/arm_scmi/Kconfig  |  4 ++--
 drivers/firmware/arm_scmi/clock.c  | 11 +++++++----
 drivers/firmware/arm_scmi/notify.c |  6 +++---
 4 files changed, 33 insertions(+), 17 deletions(-)

