Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABC3CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 03:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h9mILizSboCplYbQmD86FAClfic5oRmsIwqr8yhg9y0=; b=rmY3IDOdZbfCbc2Ocw5JHd8eN3
	Fb6q2ZxE/mStne06hGXDeXwxDWtFVLkV6fVUHTHLyLa/6sA6W9SizadE0zpgaMJ+c6lW58LtjZ2fE
	9s6086ti/T8THsbjMpLY/EzWyy2Uu3gG1K+nrMXXHT8HD+OYfcOcoEM6AEnLmLBkevlbrZaf9Op6v
	c9wPY1jlFgIxLvbi13i1RUVs3iWwuCxj5tSsHBs7Q88b3ooMIRizrGoDwW6Pu7TdTUngeXoHIoPfv
	F3xUQHsUxfYCCMxTlP0HJcpmEL34kw3ttp0etC7fuKRWyTCXpN/ZPYCwj5yUy3yUyAoJGIYFF4dxg
	5XTCbCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VV2-0000000F2FJ-3rWQ;
	Tue, 14 Oct 2025 03:14:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VUz-0000000F2EO-3Xrs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 03:14:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-269af38418aso57170605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 20:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760411690; x=1761016490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9mILizSboCplYbQmD86FAClfic5oRmsIwqr8yhg9y0=;
        b=BWUPZgbrr1peQujD1YFG/DSVpBLXagouB/rWK9JvvLcMUZ0gqm1s350a39AeIINlB4
         D3otxhlk0/NJk65aF1QnXpmHVHLN6v91mMZ6D2pbajBUU+2kj2YhTm8VrZ52bKLe1H6x
         djtbBmyG7U0pd5zAQ0DzcJ0IVO+u3IKkVaYHJKC7gDOEC2Itcn7iNoAAyJxjFYcn7mUT
         3POvgDN3OZsz654fPdp6QfWc7GZUtqTTuUWv1oqYimHFD5dqgTdfeiZt5g8bwHXPtCy8
         miQtA/GI8fBctMcczuws3FpJUsYqEt/dk0BtdG4nkDhf0v5a1A8faxYyoKChT/ANK+s/
         2nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760411690; x=1761016490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9mILizSboCplYbQmD86FAClfic5oRmsIwqr8yhg9y0=;
        b=HR4TrnLqxbwMWcqo4HTe9DTKOyE6qKnsgLboerQhbjJWyU9V2+07cPh8QaqDDO79Ff
         O7RNJzaFAaTrC7ipCQ+K3X017ZonM26RjrefMPU03W4RI4ZuN/PTh2/H4Xkqhs6w5nW4
         lppecprMBq0vlNuYQGOLiM56pWHDsrOhciiYsOD+xiJ+RozTWXJBDPUBvOUTzuMv3Jzp
         trR0PI4Dv0fkqv8KHN/8HXuX4Y4s8A1yT1jQlcwR4LEEqdf+lH39mxuwc8aGM+X9dFUs
         8O3Nb+wwnyk9gJKbFZPmTpkvfPU9NYc7rpLERaiC+bek4S9bTdOd5t6EI4SBb9pnljLB
         m63g==
X-Forwarded-Encrypted: i=1; AJvYcCW+H/+EOC6aGLpvcLyimzYxLQGoVVA2lAtUQjZZt4xn/uj1p0Qk+M0Ow466FZp2jnZA/qMf2rEgA57WRsQKJpb0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2l+tYkOcYZufWbAAwyvJAvAxUQoCJbGC+biCp9mCrMJ1F7lRY
	H8swU1Efi3+81jFfZlztkuCQxBAi+5kybT1NRZXtrq7TDaLu0DxwX1We/2OBb/rwmoE=
X-Gm-Gg: ASbGncsJGR1zxKu6xN6tBLKQXFUcLDYq9GhAZg6ZLriyOhLBL7iUJorbCSbGLPlmQ1i
	K2HDGBFJKLHVHFPeQ1bNy/5GoxI85sliMM652zEU7J63I6laXyq+twiw8KuJYUKZyp3V3ufqjAF
	jwSXbZ+91/xe+iqL4kql3bAEBV0vRPIiegJNcb7aXsMuzW6vQhhktFyN4/XrJ3m9QH99dzcKrIu
	0z9QvgMV1JL2mJRQn/yJtfF/XTXliTSDkeeEpdvM0N/INph70TJ55U0yQO3jbvUXeyUJCqsCs0E
	x47xoAkiAzpq1pFUcI6ylaFMshTkWB55o9FBvwiigVXjrWQlVW4DPH30KSoyzW3m417Ecni3Bn1
	QQB6P6gLKLTXRzuyz9CbDLbLV0usGpYMovnNrUyxz2eglzqcjnude/8SCTWUlFjC/jgaHuhS+BG
	TRxAWq9g==
X-Google-Smtp-Source: AGHT+IEI3jpH2kWAbzu7oGE0nlZT9oIWVCOT7IZNd6Yq9DFB9XEbqH5fgzxf/doWGth7+r0MSrD5Aw==
X-Received: by 2002:a17:903:37c3:b0:269:a4ed:13c9 with SMTP id d9443c01a7336-290273ee214mr291664165ad.30.1760411690202;
        Mon, 13 Oct 2025 20:14:50 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3de4asm148315845ad.92.2025.10.13.20.14.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 20:14:49 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	catalin.marinas@arm.com,
	cuiyunhui@bytedance.com,
	dianders@chromium.org,
	johannes@sipsolutions.net,
	lihuafei1@huawei.com,
	mark.rutland@arm.com,
	masahiroy@kernel.org,
	maz@kernel.org,
	mingo@kernel.org,
	nicolas.schier@linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	suzuki.poulose@arm.com,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	will@kernel.org,
	yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
Date: Tue, 14 Oct 2025 11:14:23 +0800
Message-Id: <20251014031425.93284-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_201453_884245_BECD88BF 
X-CRM114-Status: GOOD (  11.10  )
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

After discussion [1],[2], hardlockup_perf cannot be completely replaced by
the hardlockup_buddy approach, so this patch is still being submitted.

v1->v2:
The contents of arch/arm64/watchdog_hld.c are directly consolidated into
kernel/watchdog_perf.c.


v2->v3:
Add CONFIG_WATCHDOG_PERF_ADJUST_PERIOD to enclose the period update logic,
select it by default on arm64 and riscv, without affecting other arches
like x86 and PPC.

v3->v4:
Place the line "select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF && CPU_FREQ"
in the Kconfig files for arm64 and riscv in one line, with no line breaks.

Link: https://lore.kernel.org/all/CAD=FV=UEhVCD6JehQi1wor2sSmtTLDyf=37xfo-DOTK1=u1xzA@mail.gmail.com/ [1]
Link: https://lore.kernel.org/all/20250916145122.416128-1-wangjinchao600@gmail.com/ [2]

Yunhui Cui (2):
  watchdog: move arm64 watchdog_hld into common code
  riscv: add HARDLOCKUP_DETECTOR_PERF support

 arch/arm64/Kconfig               |  1 +
 arch/arm64/kernel/Makefile       |  1 -
 arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
 arch/riscv/Kconfig               |  3 +
 drivers/perf/arm_pmu.c           | 10 +++-
 drivers/perf/riscv_pmu_sbi.c     | 10 ++++
 include/linux/perf/arm_pmu.h     |  2 -
 kernel/watchdog_perf.c           | 83 ++++++++++++++++++++++++++++
 lib/Kconfig.debug                |  8 +++
 9 files changed, 114 insertions(+), 98 deletions(-)
 delete mode 100644 arch/arm64/kernel/watchdog_hld.c

-- 
2.39.5


