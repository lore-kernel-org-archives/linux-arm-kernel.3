Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DB8C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YxuvUQU/wvk/5tAU7GY5bOYjzHhQjt27KLZg5QIEMsc=; b=rGBVCS/bzs8bSLJvFTzh828Yl8
	/ql/2uZkC1FZLxRUWZjd3/Y2Mf1MHkEekrgffVtrdENiFlQFyLABh7Kj3/yvVIRQx5paS4jgDZvn5
	PgguVZY8Rd7CrwpgcZe+Nmi68JFhlvYGrZToAb14o+xDf3r9jlSwfaH/ROxtS1vopW/BzgR0NFlaZ
	gaU9QeaJWO3Jwxpn/yTfS0lfzjm+/ZCWFZmFFOjX4DmdLNsBQF/XRX97MntIYeg4v1nCdPHJ8SvGN
	90sdrIKN4u7HFVC5G2o7gq9VKqnIn/nA1nxzg8xDhk9Jxpf/Vs29ic4qAVXwGksAMPt/0RQTvzcr+
	Pyk29QWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TpU-000000017t4-0zRW;
	Sat, 12 Sep 2026 19:56:04 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5TpR-000000017s8-0H0O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:56:02 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d8239so3959065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242959; x=1789847759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YxuvUQU/wvk/5tAU7GY5bOYjzHhQjt27KLZg5QIEMsc=;
        b=QS8buW1yJZXAd16GS/MBm4gFHvR2nQj9STgKjJoBkuK7+MqoocGReqFvqAGjh/xOOn
         5lyibhMrQEFXfyb4LoTRctofjyihniFgJv74Ds3/7JyCIm1r0IUfNsqDPJdbPZo8S6Ki
         36TVhyUJ2mW2YOHN65l7hzvaqWyJqNZKAdNJK8F1kTUFFfhf120kURNFUXFZtL8ouj5e
         oSfCohK7RJl9xqwYs9mTUdsDFbBqLZpqaPXdfyf3BmJBTK9S1nTMab4e0sElk1yNdT39
         Dg1pdkaynuUri2h/u4IM6R4q1Xg32a1Qg1X5lPmmHrZEFimN4UWOAM+veTVWZgiL1dh5
         eeBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242959; x=1789847759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxuvUQU/wvk/5tAU7GY5bOYjzHhQjt27KLZg5QIEMsc=;
        b=qGG/FW0czMd7TmsLa8cqP7YQRoeMCJHMZCjGoBBqG0EN95IHx1B5WB7r0O6AsDg+/0
         a+P4sTkf33EYPZWpV1A2JwGHlwxXz2oYZ+4+72qaiWWYRK9GZFyNeVUoRSU96XvObs0e
         janRLjAUk2XB+x6LQsS/kcpQVYaBdHDh7o5I+BaxZGyHmZmo9OPpU75/3LSD4r4/Vr7m
         xpThs4P1lnR5J08iYJ5SzKquSZHZw60OoteUG82GcCt5GR81bH5/hvYlj7gs2y4CBAYB
         Bad/VkVFjKKO2QsLoy8SUozFHPwedF1yzm9O9iyGjgkRZgfW1+/6aqdoS5BmMgHpQ0V6
         WCdw==
X-Forwarded-Encrypted: i=1; AKwUvBy3pg9BLPjcCOFj8uGBLag0+ZdJ/YNF9ylHZ7pz8P9TTMO7R2kpjUjo5eHnRhh1K5Jzok3LuZk1ayURuOdc6cEm@lists.infradead.org
X-Gm-Message-State: AFuF++nqnND5BaRM/2wVi95NEeOiSFCu59dl1RyzMo3HK1Yj5qgh9SZ0
	G1/9o+NNlRe9UrV3/xV51DgfoEDRKWchcPuPglI7qnGr+cHjIyTxKwbU
X-Gm-Gg: AYBFou0tc8jcVOjkPHZG/gNmEm+2ervfccrxRU/s/CtuQOxqIv2m574I3cOCPgvb2Uv
	GNq17Lj5rzB49gJUu/jkjPFSQnVknh5iMYZu3Ab7i+BL0x21AzGWtLbuWT6OLlZXOxyQCM07Er/
	FtNcTsbyY/ThmvcrFbIepDas2TTPxIMtDaixD7mDgCZ7sLk07Uwx/VjmjZiLtRo9iGtvy7ybcyk
	4SgL54N00vZAcQv0zhqTipTCzD5dHAn40cWRdXPOVWOdgwoNiPXSBcJqqaMU53urSL7z5TvaT7B
	IEaK2uklslMapw2ZXxeSTLQ83LxjRWt+XvRc32UhMqJ5BjHZfBmQfrZvAOVQRNIuoiqDrgsg1uc
	MriFPcevkBlU6dcjhF54gh6Z6Z1eAzrRBypkT7J/0FFURARQiZKVHa84qbMT/TcHfzh9O5rvFir
	6+N7xU39kGcGPAVgSNz3v/3r/WQrsw0OEsoRfoeN0g7Epo8+vFuMvE9LKFrccQeDV8DW3oMfO5/
	oNvf1ALJKl05HZQIYJvchFIhvZW8URFKB9vsjm1r5mpjyjB+rjsX0d7sfQaXwcLY/TXNmuFwGja
	DTA89b5nR7v/QhojFvWPk0EsHZ5tSmjznRXt3SizhDSi+vXzWrUYed93pr61G/tgprwLUMVo2Oq
	zvEqIGdpyE2HGWLVDOA==
X-Received: by 2002:a05:600c:5249:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49e6caa782cmr34402295e9.5.1789242958359;
        Sat, 12 Sep 2026 12:55:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm267089045e9.14.2026.09.12.12.55.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:55:58 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Radu Rendec <rrendec@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/4] ARM: allocate the cacheinfo early to fix the PREEMPT_RT boot warning
Date: Sat, 12 Sep 2026 21:55:48 +0200
Message-Id: <20260912195552.76673-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_125601_124567_7FD26A60 
X-CRM114-Status: GOOD (  10.72  )
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

This series moves ARM cacheinfo allocation to the boot CPU to avoid
sleeping-lock warnings during PREEMPT_RT secondary-CPU startup. It is
based on 5225b8eec4c9 (7.3-rc2 plus one day).

Patches 1-3 prepare for early allocation: bound cache-leaf writes,
include external caches in the allocation size, and guard CLIDR reads
on older CPUs. Patch 4 enables early allocation. Please take all four
patches together for stable.

Tested on QEMU virt (Cortex-A15), vexpress-a9 (Cortex-A9 with PL310),
and realview-eb-mpcore (ARM11 MPCore) with PREEMPT_RT, plus non-RT
virt and vexpress-a9 builds. Cache sysfs output is unchanged for the
normal platform DTs, and CPU hotplug passes where supported. Additional
checks cover DT leaf undercounting with KASAN and ARM11 DT cache
descriptions.

The full series also passes on a Raspberry Pi 400 with a 32-bit
PREEMPT_RT 7.2.6-rc1 kernel: the boot warning is absent and all 12 cache
sysfs entries match the baseline. CPU hotplug is unavailable there.

The series applies unchanged to 7.2.6-rc1 and v6.18.

Karl Mehltretter (4):
  ARM: cacheinfo: avoid out-of-bounds write in populate_cache_leaves()
  ARM: cacheinfo: count external caches in early_cache_level()
  ARM: cacheinfo: guard the CLIDR read in populate_cache_leaves()
  ARM: topology: allocate the cacheinfo early on the boot CPU

 arch/arm/kernel/cacheinfo.c | 49 +++++++++++++++++++------------------
 arch/arm/kernel/topology.c  | 13 ++++++++++
 2 files changed, 38 insertions(+), 24 deletions(-)

-- 
2.53.0


