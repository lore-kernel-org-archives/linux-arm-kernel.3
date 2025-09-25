Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7ECCAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 08:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gphyOsNtOdKDqs9aSBR2mOumTKsLxXqSuoON6fWyPlc=; b=yI2I5T1hJYSzZxsq6sMxjHDRdG
	k5Pd4hlXUqRMTbisswGvynxKEa/0TAtFhzUhyGHrsFnyTS81iXKal2RqgNUm+ESQODydIEUel+hFt
	VxnlAIyBk6CMyaTsr9vcpQifEH4HUTLFGDMlO2CPpEk/N0MXC8AssSrfM0SXFiEi7m6l0AlBP8PhK
	YIaEb+Ley10VfdKX4lKyyDM03fFqCHScmc3/tRYLl7tRCQVloS8vcM5tMw/9Pg0C5QDTPbmonxnQO
	58rBTF7UBK1UdYNHHh0JzSxy1YleRMXY0qh6oUdVT9te9kt64UiCpGqBRr4ZSYecR1LbC+vjl8N2+
	eMVMb1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1heR-00000007H5e-02Qf;
	Thu, 25 Sep 2025 08:48:31 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1heN-00000007H1G-1vLK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 08:48:29 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-77716518125so391199b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758790103; x=1759394903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gphyOsNtOdKDqs9aSBR2mOumTKsLxXqSuoON6fWyPlc=;
        b=D5ra5J3pv3mQF+pT0ttygy7dIe1EkvYfr2uPfXyTmAU2d+Ehj3M4XPCGjcgkMzVAw0
         eSY3mfY1NKTg4s03uPg2jPFabGlGlt9nttv5XVGjwV3VzBgylREqtgVKjJJtrPfTdXxu
         dRZWEEqHjXL1hAmv944b3CGvClVSq3alXib7Ft+VpzrzdTsS5Emr2HaW9eN9vHhNrItN
         3EKAMc+vkmC/QSZ7OOfjfzftTk4IrC4S3svMqOy65NmqgXog5FBnaZeQLt1R64/Cybd3
         2ugJs3qHCe6ULc2/30SVTu7cn3DStgY+iF7mGO0+OEBw1D2+sCJ4U/1/DUOo+paxVSxx
         bUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758790103; x=1759394903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gphyOsNtOdKDqs9aSBR2mOumTKsLxXqSuoON6fWyPlc=;
        b=kPMHYt+07UYSr8s52zuHuTHzv2JOBr8Rt6zkPqXzaRSJA7rgf55Ce8Ad+YzwvWX+/2
         3G/hqYG9MHhb+cNxAw6lTdJ6bm/gsk/1ibjG4T5QVC9TEHPViqU1UvVfFfXH7aJpNxuP
         nH2SxaK8sUtbKDzIC+Is/D2pbDQ8++VoN8kbIgFVIYIYGakvQJgu/d+wxGHHCN2sqbgb
         lpLhif9Jf2Xr7H0DdsrvnwsQJWTFiT2E2CSSJoWV7wwryYDdKowIuSbtZN9bHEhl7zxm
         q2WwZr3moxr3Nd2XjFTTpHjhxvL2AAwjRwpieIuiNR1zImLW14LJwgt+jUhPRM5R+NR4
         RQ7g==
X-Forwarded-Encrypted: i=1; AJvYcCX3NVi85EtEOkpOjMyTvaJzdnv3MvrpbOx0C/v08YUPmjYgR9TcWINsvZS+X+kACTx1Q/JwOO78IbqjxHuWxk7d@lists.infradead.org
X-Gm-Message-State: AOJu0YwMVpV398X269KBojJAj+7F6CtJNOSgCb3d7+zmxDQ3Lw+U3J7B
	1fTvSpYzX0ErgAmrJye8u0RDizr+cQKdSdBLwTdnhLdZH0TPd1yHEDg0sqrvwBv29oU=
X-Gm-Gg: ASbGncsPO6hFMEaQRP9XVfJ+nXuyInqtsoGh4Cw94CAR4B6pjfeCbWkrgsH6eq4xnbz
	JAa4j4IOBGE6t0l8Uh5I4aZAq5yCYcyhn2gUIBECIRUHtNGnqZ8o7jbBkf/SsqDxrKO/5856/69
	YPAeeGP7q9pYMFbtRNZzd9D/tF9/Y1o9ZB4oRjlPD8YlJYxt9sI54GCMJWHMTk/u2TH8u5Hj02U
	BHSFI8Dd4pNI1Vd0zoo6sVJOp8v8PqV2eBfKinQWlRwnPcwRJbgxtWjhkdIILKRP+fP26uCj2yV
	eCTTnOrKaUkx/phEEVkJ88X+MkoH8ESmNTpwZWDwG9CbsVMbe8BnJ4basE6eXxXJLrIg8+ltv/+
	XC5XR0LXst84L9rofQmNZGDI2HReiqoOBkOK6lXAlbiE1nCZv3s+90eqfYxlMiQJG81IgSZU=
X-Google-Smtp-Source: AGHT+IF5o7MsY/7di1Syx2EkRYGotHHFJz3EjXekBBptiHMX8QMKY8RAgGzMhfi8YFQVNtPQp29NcA==
X-Received: by 2002:a05:6a00:1255:b0:77f:2e62:1e3e with SMTP id d2e1a72fcca58-780fce9a124mr2974997b3a.18.1758790102952;
        Thu, 25 Sep 2025 01:48:22 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-781023ec6aasm1321867b3a.46.2025.09.25.01.48.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 25 Sep 2025 01:48:22 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
Date: Thu, 25 Sep 2025 16:48:04 +0800
Message-Id: <20250925084806.89715-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_014827_800965_B493ED39 
X-CRM114-Status: GOOD (  10.33  )
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

Link: https://lore.kernel.org/all/CAD=FV=UEhVCD6JehQi1wor2sSmtTLDyf=37xfo-DOTK1=u1xzA@mail.gmail.com/ [1]
Link: https://lore.kernel.org/all/20250916145122.416128-1-wangjinchao600@gmail.com/ [2]

Yunhui Cui (2):
  watchdog: move arm64 watchdog_hld into common code
  riscv: add HARDLOCKUP_DETECTOR_PERF support

 arch/arm64/kernel/Makefile       |  1 -
 arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
 arch/riscv/Kconfig               |  3 +
 drivers/perf/arm_pmu.c           |  5 +-
 drivers/perf/riscv_pmu_sbi.c     | 10 ++++
 include/linux/perf/arm_pmu.h     |  2 -
 kernel/watchdog_perf.c           | 81 +++++++++++++++++++++++++++
 7 files changed, 98 insertions(+), 98 deletions(-)
 delete mode 100644 arch/arm64/kernel/watchdog_hld.c

-- 
2.39.5


