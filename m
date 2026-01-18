Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4E6C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 08:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kj8UfNtBvaeaAbcPqe3cu399aKYUpefB3CwEh0ou4Yc=; b=RCY6aO6QI9rgD7EHM0WWvk5NP4
	qt5h4hVr/Ki+kwpVnaeBe8PHS6CAq7MoWB8paGU+hnxAyiiIRm8RyR/qogejMkAKX0IDmG8qzhAOk
	s97Dx9Dane90q1BpPF5lEsSBD6wRgRKN5XKqsCmfkVUvowo5DBYpRHRxMtgVLkw6vRSA6ASvbIkCn
	lN3WDc0hxBH0xPG7ioBvfe+ZxVTZwlA6JdTSzO4cjYvdvBPk5MGsBL3BPJEXjoOY+8q2YxUIKRwOf
	H8Rw671zFT5jG2SAKmSLbLxclwZ7jPawsKC0LcutA+EsSVAe5f5p1fi7QM6qSwjYn9Y3GfOjL7/SZ
	OfGsWmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhNkg-0000000H44q-0wbj;
	Sun, 18 Jan 2026 08:03:14 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhNkd-0000000H43V-0bjn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 08:03:12 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2b6bf6adc65so2548766eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 00:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723390; x=1769328190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj8UfNtBvaeaAbcPqe3cu399aKYUpefB3CwEh0ou4Yc=;
        b=USZxq/ty/IWH5CQ9OVJdmY7RuLUe42B8nZfOOLX4S06NNp3y7zldIN6+3uGSaZs3Lg
         x2ByhvVp1oaOJtBMwBqjoTl3b9x/RSV0c9VRXH0MVATBXCDENiGWPX3y06JGOUZcdhs+
         ZowEUJ+3PCJm2eb0vKQuAuA1wTFbV+UV8aw8Htvmjym45mmcyvgqG2mcesgcgezQZ/7D
         JxlthqhHV60G4hiGLTlB7/CEAekEkTPsL+5VVwwuiJTSfJKi/k3J7fy+J7Vy6Lsh5bqh
         VIrvnNu5bGMkwmjjr6RPAp3A7UVUNodXB8NoDurNvFy/xQLfRmtPUq9Xm+7s+pbJGw0K
         SUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723390; x=1769328190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kj8UfNtBvaeaAbcPqe3cu399aKYUpefB3CwEh0ou4Yc=;
        b=kIZmfk3ydpz3M4WvktZl0mP7rVw32fUn3h9U6J+B4nr4JJ0vjuxg2yCOi0ZsPDY7Jc
         +mRkV2Opb/Wrb311AG5QKgygcTyQGptsJ76js/eP9C/xrxhXGYoKdI+SiV7RsRDZA7FW
         sZWvTYwR68OWcUPPs9K+oH2+Q2X97Y5opLIvHuk7vGTU8mkhuKbQe/3HsiLl5hffjzpS
         ovDFcJhtmlg9Rg7AyQPQLSVeKHBteSzTmhxAgGYbshNS1+ro3muPcg5LwrZ0T9BfMJxU
         MKoD++0BfQohdlvScz6ysXsjacDrBOASmTg+raUfqn6IOM9xz1wfhcCt9KIi2D0gpEGW
         S3lw==
X-Forwarded-Encrypted: i=1; AJvYcCVVlWupIVECbqSzsMZpRGSaKxFsyjNwWvaaU0mtMxR+s/rb5tB/tD/MHZkKj10HlGnrKptdr8vQJFgC69Mf+P+y@lists.infradead.org
X-Gm-Message-State: AOJu0Yy14MpkvX3rNitjH7Djlec5HABKxQ2T+mASHWwloeqBe8++dbXk
	6HEhyh3OzJ9Vat2sQcS2vu+eIBf4Aa7axA1cS8/kCo/tLGOUtfUJG3Gl
X-Gm-Gg: AY/fxX4/HtDaF+ML9AtE4bLdZ6qcQZEmm8Jh8LD08gSXw3pwCuTYpuMIbINR9cPGDdM
	BJ0IVr0iSvvd8pkktxS864AAfiPo5oYEG7dEU2CVtZ7cMH5g/olul5jkOFzVLFlNCRF8RDBZOtQ
	yByoiPQ9GCYOOJYxce5wCQXYCT8nqhPG7f1ojc5I8cjekF4Rt+r309i7UbP4/0YwJDHKxPBLDCp
	qKNX+1tll9kpn3/YIdmLLQ0qAGs5TTBiMYC8HJksqBgZv2pCff1irECvOBeae+hA3UYXOxQMezv
	i95jILz+mkvH1k4MnTsezPBE6X2m6UvEeBR7DMeGXtUfu8JNYG09l+EQ4/m3H3j+KLS2kbbPqTR
	6H7KDhRHmxSyXNiqFUNEnqCvazTyMQj9YromGqnNqA5vAAY4OkwQOXpT2RpGSlJP/oDmphORT49
	WfydVijKpuJd1kTR4hY1QaAUEsreffbsyFjBu5TBNNC6+LrAVJM5TgjpQlkXUNgOJlCkdsiK+yV
	yqDdL4=
X-Received: by 2002:a05:7301:1687:b0:2a7:83e:7b17 with SMTP id 5a478bee46e88-2b6b46e6ddfmr6064907eec.12.1768723390082;
        Sun, 18 Jan 2026 00:03:10 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b365516asm8498854eec.26.2026.01.18.00.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:03:09 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] soc/tegra: Changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:03:01 +0100
Message-ID: <20260118080304.2646387-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_000311_213837_2420A968 
X-CRM114-Status: UNSURE (   9.09  )
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

Hi ARM SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-soc

for you to fetch changes up to 70f752ebb08c85a5ea19471a5aaf26263e53dcb0:

  soc/tegra: pmc: Add PMC contextual functions (2026-01-18 08:48:30 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.20-rc1

This series primarily refactors the Tegra PMC driver to eliminate
reliance on a global variable, transitioning to passing the tegra_pmc
context explicitly across clocks, powergates, sysfs/debugfs interfaces,
and power management callbacks. Additionally, it resolves a warning
during system resume by deferring an unsafe generic_handle_irq() call to
a hard IRQ context using irq_work.

----------------------------------------------------------------
Prathamesh Shete (1):
      soc/tegra: pmc: Fix unsafe generic_handle_irq() call

Thierry Reding (10):
      soc/tegra: pmc: Use contextual data instead of global variable
      soc/tegra: pmc: Pass struct tegra_pmc to tegra_powergate_state()
      soc/tegra: pmc: Store PMC context in clocks
      soc/tegra: pmc: Embed reboot notifier in PMC context
      soc/tegra: pmc: Pass PMC context via sys-off callback data
      soc/tegra: pmc: Pass PMC context as debugfs data
      soc/tegra: pmc: Use PMC context embedded in powergates
      soc/tegra: pmc: Use driver-private data
      soc/tegra: pmc: Do not rely on global variable
      soc/tegra: pmc: Add PMC contextual functions

 drivers/soc/tegra/pmc.c | 425 ++++++++++++++++++++++++++++++++++++------------
 include/soc/tegra/pmc.h |  60 ++++++-
 2 files changed, 384 insertions(+), 101 deletions(-)

