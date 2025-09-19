Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B466ACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 21:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9GhVAJ8zczcdk5RoUmHUOCQ0cenVmOQiaDZXnPFubC0=; b=q1JfoBBW0lZz2EVZkShrcDxHvI
	AqWixpPfyAMLRn5D4zp5q8gmotmXNZXLJ/dW1ZCmXgIlWLor4lsZ9AbHltB9948EK00bFqDXerjcM
	jHUvqVE0JKBFd5GT7aDzOeWdxKeN5c7ucTWd7puMe6NTrxm7+wQDKfWLMwbz0CMk0QAosPIt4sYWi
	qQX2EzLT5W+Zgf9n8j70yV824ALTbD7SPhoyvN1ztJBzQZTzMqSCpfwzrkpTgscU9hJMSDOrEL7Lt
	6kQSu8zo4Bm78ah1vIeqv6GUm0uVBLmz2vzvnmFQjdcsxrgKsCZEN7baTtSwLayWHZxnbbCIJeyfD
	oSje3JnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzj4s-000000048g1-1uGu;
	Fri, 19 Sep 2025 21:55:38 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzj4o-000000048fS-3nwI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 21:55:36 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-74c1251df00so1471312a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758318934; x=1758923734; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9GhVAJ8zczcdk5RoUmHUOCQ0cenVmOQiaDZXnPFubC0=;
        b=CSJ727D+6tFZhlpNjhXWGvB6YiY9hg6BPJ13N/rkWxCFtOke2W3T7AuIyMeO4jvJVb
         HWICeY6B1M/OP2+wK5/UFdEVvW1lJeGdUl4V3cks54LY5zMFyozofd1C7FV1sTAlHLSc
         1/osnyTTBeEdUExw5iFma7iu3rwMruXK+pvc/lQdSrJCYWhMm4OQb6I2VkRNqvnzAig1
         bonJjZHEJnrDMmDw7fv9sgISIMJmzt+QvN104oHa96NB5VG/wK2U9CK+O005WUMfjq+J
         d4fZrYo7V/xLCoTM2EblDQzhMgA/2NjzltQXl6ACpJWYlxMPDWgKVfIJ4juVSTGmFAlz
         kZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758318934; x=1758923734;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GhVAJ8zczcdk5RoUmHUOCQ0cenVmOQiaDZXnPFubC0=;
        b=PrbohSqe0du6eU4C3nAa5/SIkfiRSqjwJ/By/4HtYfpjC9Iy6mpJaZfjvbxA87jTOz
         jX9UKNE4CeragOP5G2rlR64sL89qHOxzWIegbu2WXCztuERrW7uIpPvtNTOmevqxMuO7
         u/J+QKpmffun0traXjX4NRPUOlmTwJerC7cOYMJQcZMdBYSlyCYwhbL+VhtCb8KSGxVj
         zRQhlFjSKJt3JxYXVk4AJ7Udq/l8YoQlfOafZ+0ZYM2xKrOOTmSKyT/wXPK6axySG1UH
         i8/yBfA/Je/AmI8rbJ6Il19Rv/7beK/uIN0zP+aYF/E6W1vgOkD/yA8zwk/REAzjwVYj
         +rog==
X-Forwarded-Encrypted: i=1; AJvYcCW4nNhzLafXajMHT9akZh4mfkoCrs4A66ezt6+kQXQgj3PihYNiawlI+Tmr6tYTap9Zatc2O/cSn2NfkHGMlued@lists.infradead.org
X-Gm-Message-State: AOJu0YzSEbKtZVFxGFQhOW4wHtr+3tjJsh67ttSYQSRB+SJ5KH24QeIJ
	C8e20nq+43JKgHaQD5Nq5GlqOiDknMIMUjF+yVGt76mAl/C+FYDxiFTzK5Si5BPEc18=
X-Gm-Gg: ASbGncsEXE0HwWDQ64JX3fFMWEep4NQO+B/O+uCcZv39Be46gmIsrhfcu1rURgDG4Fk
	ZsF0CrkQaDXH86R2LaPn48DV1RWsKqWXQX7DyrPiaaSWb0noL0X87N1xmwV2pU3GEQvsgaC2iO0
	c/zfdUKHhZsmnExO1nvgbw+V4S8zKjYDEWPQbY6ZUYU6RXcsbEZYG4mJTBOEepooFW4A8wzdV3q
	KC4viERadriHLxWWcm8xKiuOjPwzZP/uWGnnEYfWhhICqdt5/cWAr6eMokGwH+elXyc/TCPjbgQ
	lAjXC5QINJVuFqjjqvt6b5hq0p65fd5z60o+vbBrliPohSCBOKjP3sxUcjS93CsXzZrPF2qDa6s
	Mkk43YC0DmBMKUe9tLGhMonroQfEJZEQZLg3uQlDutAtVPDwGjvrMbv2DFg==
X-Google-Smtp-Source: AGHT+IEakeFSJ15e4E3+APHquCTiCy/olIvfzEu180a/k/E2WjZFyGY8R305NCwW8HGY7XD5NOI+Hg==
X-Received: by 2002:a05:6830:6d25:b0:741:3929:31a with SMTP id 46e09a7af769-76f70de94femr2698840a34.12.1758318933696;
        Fri, 19 Sep 2025 14:55:33 -0700 (PDT)
Received: from localhost (static-23-234-83-233.cust.tzulo.com. [23.234.83.233])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7692de28b95sm2926581a34.45.2025.09.19.14.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:55:33 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: OMAP: SoC: updates for v6.18
Date: Fri, 19 Sep 2025 14:55:32 -0700
Message-ID: <7h7bxup0ob.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_145535_191333_EAF4AB9E 
X-CRM114-Status: UNSURE (   8.06  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.18/soc-signed

for you to fetch changes up to bb676996ed583464504123721195e98a708fbba9:

  ARM: OMAP2+: clock: convert from round_rate() to determine_rate() (2025-09-15 16:18:01 -0700)

----------------------------------------------------------------
ARM: OMAP: SoC: updates for v6.18

----------------------------------------------------------------
Alexander Sverdlin (1):
      ARM: AM33xx: Implement TI advisory 1.0.36 (EMU0/EMU1 pins state on reset)

Brian Masney (2):
      ARM: OMAP1: clock: convert from round_rate() to determine_rate()
      ARM: OMAP2+: clock: convert from round_rate() to determine_rate()

Kuninori Morimoto (1):
      arm: omap2: use string choices helper

Miaoqian Lin (1):
      ARM: OMAP2+: pm33xx-core: ix device node reference leaks in amx3_idle_init

Yang Xiuwei (1):
      ARM: OMAP2+: use IS_ERR_OR_NULL() helper

 arch/arm/mach-omap1/clock.c                  | 19 +++++++++++++------
 arch/arm/mach-omap2/am33xx-restart.c         | 36 ++++++++++++++++++++++++++++++++++++
 arch/arm/mach-omap2/board-n8x0.c             |  2 +-
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 12 +++++++-----
 arch/arm/mach-omap2/pm33xx-core.c            |  6 +++++-
 arch/arm/mach-omap2/powerdomain.c            |  2 +-
 arch/arm/mach-omap2/voltage.c                | 12 ++++++------
 arch/arm/mach-omap2/vp.c                     |  4 ++--
 8 files changed, 71 insertions(+), 22 deletions(-)



