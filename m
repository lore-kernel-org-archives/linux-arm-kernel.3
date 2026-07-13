Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D941C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 06:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wr+dAOEOkwMOdgGfXNclz6OtU7jD1eICBMUfO3Waku4=; b=UnQnDHjYA3J6ByrkH2m73x7Tn/
	YqyuR7YOLOJYkuMfLkCU3/krwx5jteAbUuLsqcrHqzrdMqJ7GcNeuz0qms6ZtkWaNq+O7S2X/D2Yt
	ZFaPbYF1yz6RIX2NM5GfzAtfxAU8nZN4PRSI7hes6JXf/6Zt/h4dz8sa/f03qdp4OUgW0cUx8Zlu2
	Jxj16hES/xBLR2Wg/gkGlUBZDpZn/r2JEDdefmF5jlW7l7KHecMO+9WNSJW9qwwi0zqKm5Ivglnmg
	JxQDa5FGPWohwQdUUpPt24SNnC0BhfNsLwY/Kf/zIuFV8dNjqOZwiNLoYA6zP3pz8bW1ZGlXcL1qS
	ofNQQ40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9pt-00000008CHg-1w7q;
	Mon, 13 Jul 2026 06:08:13 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9pq-00000008CG9-2dwE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 06:08:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8486672f03cso2382639b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 23:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783922889; x=1784527689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wr+dAOEOkwMOdgGfXNclz6OtU7jD1eICBMUfO3Waku4=;
        b=i+W0P+jIF7O3bc85VZhe/rV9Q7HynRbJ4DIwz95UwPbr92K4Fb5gtqcFdVhLfXupr8
         UKfIu+nD1TqwDYKhvp7S2ZuijTyTqzZBVzaF+pZHTOinSnMPlVEyc+Ne4+DBd73rspJQ
         boQId+bBqR2Re7g4dkSQhXtTJiz+p+b3vDFdm0sa2axyIMElpJ4eZ78DpE0OyoVi8Ra8
         oO82Qho/FAKKFxdlev6JAOzDLJ4egXK/tXOxn4s9MRMR6p+vIVuS7EnuefsxDpG1h08T
         xJn5PupDBTuIKKkMjDo/hpXVi9eHJzDxoQQoWb7uxKgbJGrtntvfMdINZZCuj0cAE0Dz
         hZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783922889; x=1784527689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wr+dAOEOkwMOdgGfXNclz6OtU7jD1eICBMUfO3Waku4=;
        b=bLjClBpLjZMc8ZvcpX8gp13dYxf1OizrbSWBOjmysPHyTmAsGKxAPdPY0/yqn27X5/
         0SFiMD9PSfQKQ9DlN79yTVdl+FTVVr5mNzd6TMNGubgKyJx+CCjTVrlyxXsapFLwwh5g
         /+aEDCi0J1S6bLAIHGseIm6QdkIsBx5J/Ir/0jGa5BOYRbpgQH8gqDrsrXSjQvyhB9u3
         /YfSkk9Dh4hhSOObsRJNh5MkiBHv1l9IY6IBQ9eBqz78abmYdngD2vclQ0iaOmQg3MiR
         Q3Ovi1QT8gh50hD9w0/xR2gjHvv37LrJmcAXVtbkxIzheGbZ9YjbFXFTAD1Fx6jmpO/c
         vJKg==
X-Forwarded-Encrypted: i=1; AHgh+RoYzM8EyNOEJzTShfVhzv/FkBca/Ohx6loyiCKRbw00ft3cYcXoGkduyBqsLW406ACpbamqhYNjjYWg6GbXxHCh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7TuMCZXDytkX73wVCaLU5vtVbp0+4XMw1M69cMEJhWWRibDLF
	J8KJNQsGYVPsNZ2OBeuZtoOswzWtO87jG03mpKz6+BqMqBoFolC6qSio
X-Gm-Gg: AfdE7cmYo2kuDWy2v/1nR/ul1Avz5SWxn1R7ueIoRYlmcHHQ6SNrLXPCKXgWuI3BgQk
	wZcvndIEAaWa6wTYeii15GbsyxHp6zCyyMKvsrErZQRWJBU+KcvJWkbSMy4oU+dO0TjWeV8rH5P
	7EnK1bVO8hBVUZ0Rh6Z9hF9OwP/sL//zW0PZEyTHGciPkSoo2/7O0ysIgCsUbJURwqo06P/9slG
	t5LbTg3BkHJXcYBgMpcpmAOe9L9fQnTwW0Fj0S8760KBpIB7H4MqUq2oQctLwWO9z9xTCpafwpq
	dSYmisopa36DxeqdQDHY4hUz2vOcdWpfFJ/OlTkVo66L6V6+pD9EDx7wyMfSGJLThWPCbY7Y+u5
	C1uuHsmPr1CUEvoZgxPKIPZMdl8JV7bRGEbFo/3BYjoyYHUIXvdkRgHObF+Yr/QWUsX/MSlrZ9t
	AbjGavPAFxO+Z7
X-Received: by 2002:a05:6a00:228f:b0:847:8250:2b2a with SMTP id d2e1a72fcca58-8488971d058mr6850755b3a.60.1783922889156;
        Sun, 12 Jul 2026 23:08:09 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a3c16d1adsm771795b3a.38.2026.07.12.23.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:08:08 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Vladimir Moravcevic <vmoravcevic@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Swark Yang <syang@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	kernel test robot <lkp@intel.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH 0/2] spi: axiado: cond_no_effect and kernel-doc fixes
Date: Mon, 13 Jul 2026 06:08:05 +0000
Message-ID: <20260713060807.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_230810_673530_BA6B28A7 
X-CRM114-Status: GOOD (  12.15  )
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

Two small cleanups for the Axiado SPI driver, both defects present
since the driver was added in e75a6b00ad79 ("spi: axiado: Add driver
for Axiado SPI DB controller").

Patch 1 addresses the coccinelle cond_no_effect warning reported by
the kernel test robot on 2026-07-12 [1]: the RX-only/full-duplex
else-if arm and the trailing else arm in ax_transfer_one() have
identical bodies, so the second condition has no effect. The arms are
merged; no functional change (on x86_64/gcc 14, only
ax_transfer_one()'s object code changes, dropping the dead condition
evaluation).

Patch 2 fixes the kernel-doc comments in the driver: a copy-pasted
function name on ax_spi_get_rx_byte_for_irq(), a /** block with no
identifier line on ax_spi_process_rx_and_finalize(), and stale/missing
member documentation on struct ax_spi. This silences the driver's two
W=1 kernel-doc warnings plus five more visible when kernel-doc is run
on the header directly.

Both patches are against spi/for-next; they are independent of each
other except for touching the same file.

[1] https://lore.kernel.org/r/202607121827.djB0zLAj-lkp@intel.com/

Babanpreet Singh (2):
  spi: axiado: merge identical if/else branches in ax_transfer_one()
  spi: axiado: fix kernel-doc comments

 drivers/spi/spi-axiado.c | 20 ++++++++++----------
 drivers/spi/spi-axiado.h |  5 +++--
 2 files changed, 13 insertions(+), 12 deletions(-)


base-commit: 5f1b513690edf51727e6928b97705b6437f9a98e
-- 
2.43.0


