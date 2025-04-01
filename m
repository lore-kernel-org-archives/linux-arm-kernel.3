Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D634C36017
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q0PfzpCMr5r3+GX/b1ckWGTmdB14j6hf4mNGcJLZXjI=; b=F1iALr03+ld0ODoEXrkjKjt58K
	tPuqlLKRJU61xYRdGef2Ivfd9SAQNZYJWR0IDWW7nRFzoFtsuDrSBed7hNdjq04lrTlCm+F/H8hUW
	VNokVRQ8LdluxR3qTIBe9ZKiLE3VJ0SL+1xBnqJwsT/eIDiKIlhGwdm+V7qVIklUNn8eRlLXp5Ehu
	xamF+yn6pNcHl/uJ5N0JzT4TS3RGDUapSPn+qKXCpLl+Is7HYfRjBPTeLKqfqCrPYsDFsvCCbP2gz
	zN5PXQybIeG/zG9xN8p7u79bGbPc3B9Sh3Pfd2HN90YM9zpfoXXj/5Fe1diObzBA3yo0OgcddYut8
	DEqcW4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZAG-00000002fsF-0ry0;
	Tue, 01 Apr 2025 10:48:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYrz-00000002d7F-3hmT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:29:26 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4394036c0efso35870045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 03:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743503362; x=1744108162; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q0PfzpCMr5r3+GX/b1ckWGTmdB14j6hf4mNGcJLZXjI=;
        b=PhHM/5BFJgyxs6577ojBnMkuqKfN5LBdTPisGrp4pOAFUXlLsG7uRT8hYD2XWm6xkR
         cnw5v0oXOtO7moYEhS1ueOZSyxEjirAEWcBozOW5M4M10NU3MXhy5rRzNq1t4URuPZDY
         Cj7V9qtxJ4pP7+C7MYu8t5rk0R5DXXPrsrcuISGZ9iHxUjx0g4e4VgzMhi+T1OfqMXTK
         K7YXaJZ9tdh/cWgtjF2djMPrMvcfPntsU0LjnF/7FaRDhZBEScRWJ7jMpgabq4C5kwxF
         H0xuEzCchep35mDGJunxdxFBRRaLlCExUqGNE3eV/jd6ETyZQfZSV+uiOItS7IK7HDJ6
         9+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743503362; x=1744108162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0PfzpCMr5r3+GX/b1ckWGTmdB14j6hf4mNGcJLZXjI=;
        b=RIwWzuFLmAaE2wZ5PF0NSe61XJFWhnW0KHR5n1qU13O6hIEUuw70ADPaxUERmZ/1Sb
         y65xl15IJo/JgwT+XWHgccjDb8tDm1Cl8eFcPFog9wny45pTrZJ5NZudnyeHCgPcuDI3
         N8gPJ+qBJ01J7hxZSITlt4egO8p1bkAoGxw+5Xp4TWKwci1eU0OU4SVsv24O/OsWTh7J
         iSVt1TM92TqMJ28ifX7w4zvRADG+Nv9u/lfryBEZR6E4dZmkODw4ehzafe6Zt0W0X6lH
         QgXAh0JdxuGIRdy0yidw6F7N1B0UK/OtgUxrbtLYekBxu3fwX/vRfWVqh5DYe/XH982o
         txHA==
X-Forwarded-Encrypted: i=1; AJvYcCWP19EaWiOuHpcqObZW/P6hBd7dcACiMCjZARVVb9i+pfuPmHqXuuNmq9YF33r+qeLfIp3Bpq5ySOZmqK7wmMV6@lists.infradead.org
X-Gm-Message-State: AOJu0YwD4JxhzzbJe2nkeXu0A/6WQtXz7nkJpClzbDGMiTxr/exKfo5b
	OPFC4zcVzUZjX2c2Vupknr0TD32S+MO37v7jMRL4ANhs5puejCY3OBoK3Nu2ZLE=
X-Gm-Gg: ASbGncvjsNIlc98oLHey0+Gwnd6z7Zbws6pbugnbOWvwxK7YZr0kk8ErgwQEzSuOCir
	jLi9fBAddbUkyclhL4KlLQjgLSaRI7D739sXNb7EHzcIw9m+S+EHdRk+av6sPwnhfmpU7XErBgW
	M3Gwb8SWh7s1d2lNE01/c9P+ZuYHqxb8FrQVQlBrAgTMCvt2X0aMtTPFit/eBxDl0gsxt1m/hNb
	BeFODtgb56t230gKfDdck15cU0FR3YiPuaMxeBuIV8jUMqoswED1LDx4a7Wpk2DUmPvh6Q43yjh
	qLDYnKXavmL0U/UM1r9LHi69eTbrn/sI1NuGYdjlex1nl7DDVU5Y1vGaZl4NZNscJ4BfP7DinHb
	WV7w5X74Dc4Y=
X-Google-Smtp-Source: AGHT+IGN/8xtmvsR7BrUAKwR9bwciAz3ATDbeXewiQ0x0Dm4mfRj6ANi/gUvbdb/jQ4tFiVRD9OXlA==
X-Received: by 2002:a05:600c:470f:b0:43c:fc04:6d34 with SMTP id 5b1f17b1804b1-43db628b92fmr101141745e9.20.1743503361776;
        Tue, 01 Apr 2025 03:29:21 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b79e097sm13519539f8f.80.2025.04.01.03.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 03:29:21 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Thierry Reding <thierry.reding@gmail.com>,
	Patrick Havelange <patrick.havelange@essensium.com>,
	John Crispin <john@phrozen.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [PATCH 0/3] pwm: Fix division by 0 issues
Date: Tue,  1 Apr 2025 12:28:58 +0200
Message-ID: <cover.1743501688.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=k35u2EHomx5KhPtDUzNnrpfLz4tm2XgwgswH3kk6XHQ=; b=owGbwMvMwMXY3/A7olbonx/jabUkhvTX+19/r5C6V2VsrFdyu6nCI97D7WLUi7BiU3a9cP9PY sm++1I6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZjIrlb2f2YFmhpltmbrfn6N qvb/tTlRo4737k99bQf1P8u8V7J9kehXm7L/umDdQ43AMIlGE73uss372p/+/3xYVyiw+C/b2di UqqTOArf7XkH1HxT67VtPLitWu7XZ/6/x1d3Pt7fU8uaxFfz+/X41e3a2TumEQxEnfkyWW74vVf ymQcjsmfrquh4FkhUpr26rVfo3PNKYnzO1vaFxC4ebwe3i1cypO65c5b712+Z3ZvjDhsePVU/Ft P/Z87Rkw6RDpqetCkv7wwINGfrScwJ3nusvV/0ZrayjyV9lt2baZNPtzhcU/4rPMn85v372apnH x9Yej2FTTXhz2ag/8dylgM+51d2dH488YnT/s/W/W40tAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_032924_174226_0796753D 
X-CRM114-Status: GOOD (  11.52  )
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

Hello,

triggered by Josh Poimboeuf's patch to fix a warning by objtool due to a
division by zero in the pwm-mediatek driver, I reviewed all pwm drivers
for similar issues.

Josh's patch is resent here, the two additional patches are new. objtool
didn't warn about these even though these are quite similar divisions by
zero. I didn't debug why these were not catched by clang/objtool.

I haven't made up my mind yet if I'll send them for inclusion in
6.15 given that they are new and only build-tested so far. Also the
commits that introduced these problems are already old (v4.12-rc1,
v4.4-rc1 and v5.3-rc1 respectively) and there is no indication this
problem triggers on real hardware.

I'll put them in my for-next branch anyhow for wider exposure. I happily
accept test reports to (hopefully) increase my confidence in these
patches.

Best regards
Uwe

Josh Poimboeuf (1):
  pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()

Uwe Kleine-König (2):
  pwm: rcar: Improve register calculation
  pwm: fsl-ftm: Handle clk_get_rate() returning 0

 drivers/pwm/pwm-fsl-ftm.c  |  6 ++++++
 drivers/pwm/pwm-mediatek.c |  8 ++++++--
 drivers/pwm/pwm-rcar.c     | 23 ++++++++++++-----------
 3 files changed, 24 insertions(+), 13 deletions(-)


base-commit: 6df320abbb40654085d7258de33d78481e93ac8d
-- 
2.47.2

