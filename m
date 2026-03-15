Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1A9F3026E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 17:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nwUo5hAkI8FkU3V+3kGLnu098RQoJ8LL+Qih0GJFD4o=; b=b2m2RPuwEQ1zlO6AVKNhC92rAu
	9+x2y57+pAvF6z9wEwly+7Lr9ZtAtOOQdTOnZWi0usl9iq7FEXqiZcmOTIWURqpy1vHs9lFPBlU3s
	VdzFumXyc0yGmtoWeW7JE5LQ3gBBzwJ68RPkD+WIZGxy1hW6NHsYH+jRqY4OtL27zjuHUo3Mg1dc3
	/jy5K/VPsX9yF4n65YURtMjCjVut9c3DvBt10DjDNe39E5xgxOaCIb8MaHXzM7TUFDDsFSPT8gIgm
	Q7YgtZStPBslvw2sGC5Rf9XhCJcY3Bu4zBTMnaejqM6Lbigz5olBp82wbE7EKJmKTmp5l5RC/NeM7
	UHChqKnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pDJ-00000002lq1-3BMg;
	Sun, 15 Mar 2026 17:25:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pDH-00000002lpC-2NUM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 17:25:16 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43b3cfc38edso1041307f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595513; x=1774200313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwUo5hAkI8FkU3V+3kGLnu098RQoJ8LL+Qih0GJFD4o=;
        b=f0vWj/CPZFieRnu2iIUQqjxSiKT1Lc2+StR4NLaeYEaPx20iaJwuSfdZeuM4TF9piC
         QWBddGnyFk934MHrzCbhMZqwyqwe7sJfSRyY1OvLwE7d9YaTse3ZegbVt+BUrrloZGEX
         0XBhOEVkLdsyabmNDQ1HoNMKx1tlka3QR+ltXtKVUeh068/I5ZhMBKLRwglJJzxCTxwX
         9wIOm8BGO0DLLim2M7e49m2uzbhPuHpKzVfsWPIHrdTq4E4TgEXby2Gny2Wpslkwt89R
         kTK/qmbVVYITPJiegHu3OVek3yJKNEItQ+toRntQZ9ZqY/YA/VoyDQDiwVyFKfC5UIxn
         P3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595513; x=1774200313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwUo5hAkI8FkU3V+3kGLnu098RQoJ8LL+Qih0GJFD4o=;
        b=ID4VP4UJw0gx7GMoxBcDzylGiTLYCINKsu82xfWrzOnc3u+Hn3ZCBL+0qQLm4Fsr1t
         go61TXqeK8xjvS8PMIhvtQMN5molCzha2CvD3yarLuWZWquj8Sh/fze0uaXYqiWOHf5R
         CXA8DmukceKF9Kp8X1zOouqPd8EX+/wdg2WjfBviwd8XUFckxOa1RopFvF/tgifHPtCA
         lEZW0Lul3M/1ygGvfMUeaI50mwGLRobYnrpZJFy8U52d8luzdewyJi8j1vIaEtPxxsqm
         eZnitLkR+17egPTmtY4FCYHfC0tQJn3GR6VVnooVKWEUskkWRJDi8KZQ5HzeLYQhmFk4
         KVJA==
X-Forwarded-Encrypted: i=1; AJvYcCUzn/k5sm1B36UH1Ajxky8CnQKEohXpKK9ZOnCxfpSNSV5RjDV9MOf6VylbJHLxgGNIFHDrPyzg3TGFchVcZmZ8@lists.infradead.org
X-Gm-Message-State: AOJu0YwQFWIq5bbGD32f/KBreNJg6U+qUsIVWWVaFZHqm3eSIhPmbBy7
	hNOZJj68+nt4XOm+lODZCMQ2MuANcXEUy8/P4a1Wv3TzTIw95qMrhG6s
X-Gm-Gg: ATEYQzzK+5JMe5+TPP10RbXX+qL9iRb6l+f5GlOPApt+pDhFLw8vj08ZXe+SjSC0g+L
	k8qRtnEjIZy/VRBZnsWlbgw+VUQF6Lw6f0XUDNknv4JRe/c3dMCr92+A1CK1W2rfXvgWpVNfUns
	zp7cCKqhWTGSZqJmSt8YSK63h/uAA5HUwc3RaSDjErH3wO0slpTXiRygL+RvgmbCVX9Ho4X6u64
	C+RUJUyw8mtRnPso6Fi+MucOmbAvO4cTHz8m/ED+luvLqwlCnWCTJLynQclmJhASuy5Vgbm2XG5
	uudfWGaoqYLBrQQ/8Cw83d8Gc7W8XTvpvhDCGW26/XzQ3FD/9JuP35OziWVcdMGUxHVyeUVwwQf
	sLgIEr34WdKdElA40855CCOP0Ohg1LAqTe1UH4+gK6ypkbyE3iQNAU9vVi9Nw9iUaqIQdgupL+f
	s5pC4Tb2XaWyni9z2uLBQvO+fxzJUDTkdAN0Y=
X-Received: by 2002:a05:600c:45d5:b0:485:40a6:442e with SMTP id 5b1f17b1804b1-4855649c956mr173044125e9.0.1773595513423;
        Sun, 15 Mar 2026 10:25:13 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73easm457168325e9.3.2026.03.15.10.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:25:11 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
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
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH v2 0/3] Optimization and alignment for MMC, Rust and iwlwifi
Date: Sun, 15 Mar 2026 18:25:04 +0100
Message-ID: <20260315172507.270480-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_102515_620420_DF994436 
X-CRM114-Status: GOOD (  13.13  )
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
- Updated author and email to Adrián García Casado <adriangarciacasado42@gmail.com>.
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

Adrián García Casado (3):
  wifi: iwlwifi: pcie: optimize MSI-X interrupt affinity
  rust: block: rnull: update to Pin<KBox<QueueData>> for PinInit
  mmc: sdhci-esdhc-imx: consolidate imx25/35 data and add Kingston CID

 drivers/block/rnull/rnull.rs                         | 13 +++++++++----
 drivers/mmc/core/quirks.h                            |  4 ++++
 drivers/mmc/host/sdhci-esdhc-imx.c                   | 12 ++++--------
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans.c | 10 ++++++++++
 4 files changed, 27 insertions(+), 12 deletions(-)

-- 
2.47.3

