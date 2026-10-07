Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7128ACA6007
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oLYNuqjkWzyrA3tX1SXacbJGzDcV3DButmvf7uXrweo=; b=oC39CugnWCa/tId2gCwDpq4VVM
	7GQdaJrFzLAt2a/WJlKr8iA/S+2Zzwbd8eZBDsdoildEITbUQR00J/M8BLk1o+I0OPaiX5kshs3KV
	zIk3kLfqFciss3NhtSRCEwGo46aizbdIz7BY1S1OpOLPhu5OpAMXDGkBPd6Aou70QdWM3mKgMgJn8
	v76xBIB9REiUzHrpP+H/ftDpbY0nT4bNlaC6QY8157yeHy1VNjJY65Du0cqkW4ny5yAtccM9kXwK/
	i8E+P3qF3xESJj6k0FWsmvnYeeg/Pp8I2PVpSorMZ5EuupkiLEYN7rotbtyL8tzCJBuRmGFOWZ9dJ
	hRIcJxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xET8L-00000002ff2-4A18;
	Wed, 07 Oct 2026 15:00:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xET8K-00000002fem-1hOv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 15:00:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D6E4B40A9E;
	Wed,  7 Oct 2026 15:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CAE1F00893;
	Wed,  7 Oct 2026 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791385239;
	bh=oLYNuqjkWzyrA3tX1SXacbJGzDcV3DButmvf7uXrweo=;
	h=From:To:Cc:Subject:Date;
	b=CtVVktrKOX8rhw0sWmiumIwtGZcx30H0KJ+/9MxnxvM+Irf9xQBFjcEH0jr9am8zB
	 /1LAR+oT8ZdV+2Q1tB9RydvDCsF1nJSrXOsnLXn8wFRBdCXrvsDjb4yDlihbgQD4vz
	 vFSMA5UlcM/n454sx3yj9ZwQyPjBYaz29oV51OTgGgnXuaSHv8SWG6udgt+9anJP5i
	 mTI25Ge9FMiTJyFytzlaTiOOyFRCQZPS26PmOYb0Hf+iW3vFBMDqVx5XS+4LF7hZPM
	 19cWNHqJKRKKytR2T9nmTBb/YnI7LVddrCZurjfX2v3XNrmImwn+rS/CvKmeimPLGd
	 HYWBT+917yuXw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: SoC Team <soc@lists.linux.dev>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] ARM: vexpress: Fixes for v7.4
Date: Wed,  7 Oct 2026 16:00:31 +0100
Message-ID: <20261007150034.624664-1-sudeep.holla@kernel.org>
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

Please pull ! These came in recently and are in -next for a week now.
I am sending these early for v7.4 as fixes instead of waiting until -rc1.

Regards,
Sudeep

-->8
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/vexpress-fixes-7.4

for you to fetch changes up to 27b98d331f1dcebe088ab51a7061a387a7440cb2:

  ARM: vexpress: fix device_node refcount leak in vexpress_smp_dt_prepare_cpus() (2026-10-01 09:37:40 +0100)

----------------------------------------------------------------
ARM: vexpress: Fixes for v7.4

Couple of device tree node references acquired during VExpress SMP
preparation were never released. Add `__free(device_node)` to the node
pointers in `vexpress_flags_set()` and `vexpress_smp_dt_prepare_cpus()`
so their references are dropped when each function returns.

Both leaks occur once during boot and have no known functional impact.

----------------------------------------------------------------
Weigang He (2):
      ARM: vexpress: fix device_node refcount leak in vexpress_flags_set()
      ARM: vexpress: fix device_node refcount leak in vexpress_smp_dt_prepare_cpus()

 arch/arm/mach-versatile/platsmp-vexpress.c | 4 ++--
 arch/arm/mach-versatile/v2m.c              | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

