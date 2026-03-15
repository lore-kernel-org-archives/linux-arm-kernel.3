Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744F2F3026E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 17:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nwUo5hAkI8FkU3V+3kGLnu098RQoJ8LL+Qih0GJFD4o=; b=n8H31eMt8VFJfFfCSJKEJ8nUac
	ZyShIJTaYfCWBeKwkKtveUFaGpO8tCTsqldNkSL89JAgbMBb8NdFsEHshdH3zNVKv6rnCTI6puJWl
	/vutm3ac08HO/meqzCf0dQfo4sQnOpLCkENDbWpIK7I+uIsTd07JW3AevhEn39nYFuqJo9mi2400R
	WGPkkkUcY2cRozGZOha8Nj/eNTgnYubuugzhQIrDtbzVOvkUQZs8neKpEvMKH82ZvhA9hNtDLInkv
	TgaUIqB8r5M/3fUtoOGSlXcC+EIwEPUamRLR2u79qAQTTV6kOLMzaDIuS+vEzW9u4n81OoTi4X1bp
	aOgZ3o9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pFr-00000002mP8-47zO;
	Sun, 15 Mar 2026 17:27:56 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1pFq-00000002mOO-1nNZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 17:27:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-48538c5956bso35274355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 10:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773595673; x=1774200473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwUo5hAkI8FkU3V+3kGLnu098RQoJ8LL+Qih0GJFD4o=;
        b=IMA9jiS0j664nRM1f4J6bvE+WXJK9For/Qur2Kwrps+zc0P3XNKx7pKZh/qBhLctw8
         0vlAPBsfjtc8aRNXHiRux8KB/6gKKpzkoda257j868ifslTaYG9Axmg0h9ZHWMZVXgwp
         ynjzWwx79BbTPS1vJ6hhgtd9GLIGu6ApHZrojo4/xBiA2jSgovD0H3eEenBVWrvdnTpw
         aQfVdBeNivowST8ZdY/4ft/i9GL0+Maa8+ZIqS6XLXNoPE3LsmYjV1o85GOZAmkwpZTt
         e0NcnvJyYXg8ThoKh7CWSK2QiZECIqAku1SoW6ZKoK5Y78bl0fd0jLKO672dDZk9Rh7q
         h9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773595673; x=1774200473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwUo5hAkI8FkU3V+3kGLnu098RQoJ8LL+Qih0GJFD4o=;
        b=rJh9vhlexxzvgmHpVyi2KBgtVEkiy08HMR1CA+pTQ/MllMpcgJxAAfioYPeiEZYZvN
         dfB5zAmPhtzJcETnwRAyyTK4sOZzILwKTh1N2iUtFDlEz5vFoXcSAudnxri7Fbts3LeS
         Dfuk1Cwfpm9PbKyIcRlII5PM2INSlGtZDvgvca0aMbncIVH/VP7JFOlQP9P885wNOaQD
         R8gJmvdZMDhGyeEKYjUaCtNrozFL37dJfXCciCEz2TCDFBAdtsLC7vhOhHEH9YT6yBqB
         3pTJxZGTdMcEBHGB9uUCyVYrL049sxa4sVpopBZjOjTo9wtkzmbco2yeKj8TTE4mcE0v
         aLkA==
X-Forwarded-Encrypted: i=1; AJvYcCUmyf3Gx6aBzvDptdOf5dZKiXkmWBN6dkHi89tdGDCXq+OihtDeUJF2tQzIsvgz6XmggZGseeIPN9fLAT2bi2b6@lists.infradead.org
X-Gm-Message-State: AOJu0Yws7wdSeFEHBK1BdR1c4x9+z2Dn9XzLns0Pl8ZURRYfaxOgWLWe
	cePbkTt+q+mnqx5Sj07PGyLPQ27sZXqYIJkpCNVyqfyGB0y6Uo9iQvR2
X-Gm-Gg: ATEYQzzMaT2v1HqhATcLcr+N4L5+AjjJgYeq4zNDW6VER31LM7vW5r6Agc28FYgTxSN
	Ksu7BE3JWH13W7nXUxlPaNG6PXaHXk9W2ZYFXdN7io8Lm+J0rum69p08jgpOgQVLYyAL5A9+Mz8
	o+ZuGs/apTo/ubDiAnI33x3rrVG1MKAkUtrWK45NgbXbZNIjzuGyjk5LAlbgTvAqIlM1E4A7NuX
	eCYl//lmBm4O8bg6TSqlT4eBUYY4Q6dFot2aDE+AjufOMMmIwl90DtD23PLPYwDITb8qwWsgjVy
	/VwEN8y3ahzPfRQ3ZhU0ToZOJ2PbqhXfj+p77K5iUJIZt2o7oD4k/EUGRoS8+9KVx8DVzapGU+u
	+JI1biFyou3k6T+ngJ2YkEAdFuU2iN5KfdifR9j3fWP4IZFcXduQlJB6//MsV/vUp0F5ej0Q9Uc
	K1Ow78DWvvxQWKztKmfopROmD84At7eRu5bFmeVwBn1+5hVg==
X-Received: by 2002:a05:600c:4594:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-48555acaddcmr154699455e9.8.1773595672220;
        Sun, 15 Mar 2026 10:27:52 -0700 (PDT)
Received: from debian.lan ([171.22.84.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6586csm73644905e9.20.2026.03.15.10.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 10:27:51 -0700 (PDT)
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
Date: Sun, 15 Mar 2026 18:26:37 +0100
Message-ID: <20260315172746.270734-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_102754_476037_720E85EA 
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

