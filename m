Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9043BF3026E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 17:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MVyBXQRSzr9/lSeks120us8HXOhp+dnwI23FH9hEtAQ=; b=O/8SHnG6tv2j2ZMC5jMzomO2Fu
	gEpxx6o5fOKY94cycjqdZrIsZgQrs8ZoTGdLPZMKJrrE5SJ4U0IJnQxppZXv5ZV6pbaTCLn6Bc3HZ
	iD9zwDQg35k2kBIw8ytBoc8fUQnDVQlKfzDZGaODRTJJEIpLvgGk5Raom8+dMBVvNM5RCcbRqAQfC
	6PQ5a/EYBBvbBvtzbWZl8jFgTcJociyUmlPIy0P+wzamSHQSrpvOGpXLW7hXUzZK/ZYp4NRfKjons
	3R5FymBLnrGGemgjJnzdA/DXwCAB2Ekt4IweMiAsZMfVRNUSI438uEvpvoHotPV8yxTkyAg58m2S9
	ZjwxfONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1p5K-00000002lBW-3DDU;
	Sun, 15 Mar 2026 17:17:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1p5I-00000002lAo-1rRN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 17:17:01 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-48538c5956bso35228665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595017; x=1774199817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MVyBXQRSzr9/lSeks120us8HXOhp+dnwI23FH9hEtAQ=;
        b=ikh3Lh7/nk5bU6SYvA/GXHa7gmVVPf2ePpze5qGyfYq5/pYq02IAdgwzX9fGQOM3zL
         CGy/MnJe/hPW9AH6WQS3e5fK6962BWWcARDQRWUh3PAPN9Zp2bUToWcjyRfqF9GJJWnP
         xXCdPlrYs+kF7tv9eMp1vyf/cFlTOj3ijUwJpK3741Pi3stmX8Vs9Yxh9qTcFFjkAMn+
         uJQwJVuY+bP8Bz6Eoe6p2mmFbYHEyS2twORtVFFUoqtK9FaOhsy3f6TRwqg5E07wVqe2
         BEi6U5adYZT9Jo9Heh1ZiNA0GJmKMddjV9jfs03kPTSf+nHiMu4uPhan5xJ9DhAn+01B
         q3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595017; x=1774199817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVyBXQRSzr9/lSeks120us8HXOhp+dnwI23FH9hEtAQ=;
        b=ebzq3PAjcmfmP4Kz0QdUIlG897/BBxZUmWKyfKPplpXXrMUo/i4bjh0/lua10JFk0k
         YWl4pgCDzyw/VMpU0hzkiWZv/mUUOs+WKXdRBG5HPKtDixds0pmpt5nMMzTLXmJCbNm0
         a6KF+IDz1bdZVPlyVAxHyRP9tga61Znyuv2Q1bHo2nfNbORfT59LwoqlH2YbMtzfYJky
         WQkk6EVg/0RcIu2NKwANrwtGvlU1jRTSra1zd4ZZ0cEGbiAhw290Yp9kajkH/NDcVMdP
         eYBv6wwvJQJLcQ3KhcsZ281PDSj9kLRfIg41mVmhmby++BexXON/uDYA0+pbkWrLtmhr
         Kw+A==
X-Forwarded-Encrypted: i=1; AJvYcCUwFi/zkHVO3/hPywuVP2FluReBc+78veYim+SI7OmAznJNOgyixk1goNweWIRHbE974bkqDzXblyHXRuoD5hfZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwBYMTwyNS//c/zvSfrhhTO/DHfX0n+FCppvCyiV+qqs14grN7X
	b5hvBnib3gFRjHet8Qi2VGDSDEFSRKeDhkVyAna+LJWN7nmfTot5UOjD
X-Gm-Gg: ATEYQzyvSrlTzmcQD2uVtjw1nBBOJr61F+FNpfAIsfoRYTJLs8cl7VqEw7E6Xknbm/r
	x0eZkSk86t1VdKl+mHejnwPfYL50oAVFWuSw+LDA14vE5HDmJCqYpHWJpJMbSnXDdnLhBnetR7k
	8gVvKOm2zl0UI9TeqAB+AaNscf5iKJWKgNeJ1gR8OakkmEdQcXkdM3dWzWJREqDQ+K3Y8gLbau2
	J4TH4HQmaIA6qSgX/J1tLWfclw9bbA2wQtgTpyuvWTKMN5YvYwu2GCUscuK6pTpD9eb7y3bgiQe
	n23ML+ZFIMzthceO4Wkft+d5yrenesZIn+LpHlaeaI79LCseD/eh6ne28Xlri8oYSBkP1KcRWTt
	XcKL+9I6C1C2rbPq9yifwTNOGro1JNRY9m2lZIok2WN4CbZEYwbe0UHlZS1F71m250JPHywt55N
	8FB9+QJH3EaxJDWS1cJJFPkSgLFow+HwXzzw==
X-Received: by 2002:a05:600c:230c:b0:485:3a4f:8bfb with SMTP id 5b1f17b1804b1-4854f56bf7bmr178045195e9.6.1773595016983;
        Sun, 15 Mar 2026 10:16:56 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe21b631sm40536429f8f.27.2026.03.15.10.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:16:56 -0700 (PDT)
From: Adrian Garcia Cicuelo <adriangarciacasado42@gmail.com>
X-Google-Original-From: Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adrian Garcia Cicuelo <adriangarciacicuelo@gmail.com>
Subject: [PATCH v2 0/3] Optimization and alignment for MMC, Rust and iwlwifi
Date: Sun, 15 Mar 2026 18:16:49 +0100
Message-ID: <20260315171652.269020-1-adriangarciacicuelo@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_101700_520400_7BE80392 
X-CRM114-Status: GOOD (  12.56  )
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

This patch series provides functional optimizations and alignments for 
multiple kernel components, specifically targeting MMC quirks, 
Rust block driver abstractions, and iwlwifi interrupt affinity.

These changes were previously submitted as a single monolithic patch 
but have now been split into logical, atomic commits as requested. 
The code style has been verified against checkpatch.pl.

Summary of changes:
1. MMC: Consolidate imx25/35 quirk data and add Kingston CID support.
2. Rust: Update rnull driver to use Pin<KBox<QueueData>> for alignment
   with kernel 7.0 zero-copy initialization.
3. iwlwifi: Optimize MSI-X interrupt affinity mapping by skipping 
   the boot core (CPU0) for high-rate RSS queues.

v1 -> v2:
- Split monolithic patch into logical commits.
- Removed accidental addition of nested kernel repository.
- Fixed Rust code style (line wrapping).
- Fixed iwlwifi white space issue.
- Wrapped commit descriptions to 75 characters.

Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Haibo Chen <haibo.chen@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Boqun Feng <boqun@kernel.org>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-mmc@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-block@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Adrian Garcia Cicuelo (3):
  mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID
  rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
  wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity

 drivers/block/rnull/rnull.rs                         | 13 +++++++++----
 drivers/mmc/core/quirks.h                            |  4 ++++
 drivers/mmc/host/sdhci-esdhc-imx.c                   | 12 ++++--------
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 10 ++++++++++
 4 files changed, 27 insertions(+), 12 deletions(-)

-- 
2.34.1

