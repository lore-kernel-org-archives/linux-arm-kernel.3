Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A87C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 20:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gwQNucgdxcw2xaZoUzt8fjy3dhGHdMi9HJkfZPr1mCU=; b=boSWfUKhksYX1fcWAw+9AmWmpL
	6ZK3eTB334dEFrBEt3Pge95NyKHbIFzRuclLYuJaVTM6jVGoNIavz5CjcMHPge3aa48ZstYxjacZz
	Tk/7vOEhzt/Cxvlqy20W8J9KPuzaBKIvhefr4hgTx3cQbigxeW2BW6jSH7Sj1sVTCXip/qP3NNlqt
	bD/1shzUjkFu92qgAv07BeF32/5QG2Pl2BVWq+rdQB/mAkbg/QP8pREMUC90Ymni2hbTo8BEyXrz6
	lnR1XtLz867X8C0t+EIDW8wF1Q2xZngsnWDIrrniTJ6NuPlfTbb/FYwo0i2s+X00lDKu74bmLllH/
	lOFXkX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42B6-0000000A9cg-1KIt;
	Tue, 08 Sep 2026 20:12:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x42B5-0000000A9cY-2UBe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 20:12:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BC4543AB0;
	Tue,  8 Sep 2026 20:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230951F00A3D;
	Tue,  8 Sep 2026 20:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788898343;
	bh=gwQNucgdxcw2xaZoUzt8fjy3dhGHdMi9HJkfZPr1mCU=;
	h=From:To:Cc:Subject:Date;
	b=ULmnvtvXbDj0LU0MoJUty1kIDEUyjF0WebZxLtJn+xd9gC+G4AV1T8yB2y7XjVUuu
	 XWdux3ddf/fbY7xt0Mg+0CzHB2V+Clyd0LoRGSBzLVN9IUDYVQenLTLjX6AaW9Fzm8
	 9vxFRrY9XS3rpT2a6MS3jaEoPhDzQcoCJRv2fhTCKMnmG8dIktrYJVGGbpAg5rWrFW
	 AJDn2Z4SMeVdmE9GIRekxICi6bLAnPHRqxbjNMlIpWwrmwm4IcQxSnKJhwTLUlXeDZ
	 iuRZ8J+BdNu96UlmWePMjw2LKbMv1mCHZo7xnf+MJ65GcR420QMtngExqria/ahZhE
	 7FWTdGHiTSjcw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: SoC Team <soc@lists.linux.dev>,
	arm-scmi@vger.kernel.org,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [GIT PULL] firmware: arm_scmi/ffa: Fixes for v7.3
Date: Tue,  8 Sep 2026 21:12:14 +0100
Message-ID: <20260908201216.2993544-1-sudeep.holla@kernel.org>
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
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/scmi-ffa-fixes-7.3

for you to fetch changes up to 8544e0da1a04c77b98e2e313a423a5c72e48ea32:

  Merge branches 'for-next/ffa/fixes' and 'for-next/scmi/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux (2026-09-08 21:04:42 +0100)

----------------------------------------------------------------
Arm firmware fixes for v7.3

SCPI fixes address resource leaks and invalid firmware responses, while
FF-A gains shutdown cleanup needed for normal kexec.

- Release the device node reference acquired during SCPI domain lookup.
- Validate SCPI DVFS OPP counts and indices returned by firmware to
  prevent out-of-bounds accesses and invalid clock rates.
- Register the SCPI cpufreq device only once across DVFS providers,
  preserving the registered device pointer for cleanup and allowing
  retries after registration failure.
- Run FF-A teardown during orderly shutdown so notifications, partition
  devices and RX/TX mappings are released before a replacement kernel
  boots through normal kexec.

Also includes replacing a literal platform device ID with
PLATFORM_DEVID_NONE and correcting an SCMI comment typo.

----------------------------------------------------------------
Hemanth Selam (1):
      firmware: arm_scmi: Fix typo "upto" in comment

Sudeep Holla (2):
      firmware: arm_ffa: Tear down driver during shutdown
      Merge branches 'for-next/ffa/fixes' and 'for-next/scmi/fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux

Xixin Liu (5):
      firmware: arm_scpi: fix device_node leak in scpi_dev_domain_id
      firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
      clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
      clk: scpi: register scpi-cpufreq once and clear on failure
      clk: scpi: use PLATFORM_DEVID_NONE for scpi-cpufreq

 drivers/clk/clk-scpi.c             | 11 ++++++++---
 drivers/firmware/arm_ffa/driver.c  |  1 +
 drivers/firmware/arm_scmi/driver.c |  2 +-
 drivers/firmware/arm_scpi.c        |  9 ++++++---
 4 files changed, 16 insertions(+), 7 deletions(-)

