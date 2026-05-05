Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7C6FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/WTpRXtFTscssgW//d4BsVFh1NygaJXve5EIy5ifUx0=; b=RG+s0ld3q5P50y
	Ky7GpJHB+UmTcAEUefd71nLgSX0mj79+CzpoossvpI9yo4zh3NTbHJzs8sez+YvQZS0XU5Fl6VRkd
	bd5LzpRj0pj4/lOHbuhGBAyJTNlIKNJAt/h5fM5Uz2fnJmOJYz7mCeO9VmaoRhVYemhBw6A2rn/9c
	yyJfiN9PoY4PQgJJVoQ/JHQRljWCvB4IT/YEJ59OI/FVosmZScQzGydOfjsJNwQTO3zRIawyQqGRh
	PrKybvs2MLbwvM75ePRdmwoFL9fDtCnCn7Ze7bCt0k8RzmnD7kQR6006rhEmwFmIL9T0W/lf93Aok
	XodWh+0CRPff6dOq2vbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFb2-0000000GIDs-3kp1;
	Tue, 05 May 2026 13:13:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFaz-0000000GIBX-1t4t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:13:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so83100875e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 06:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777986831; x=1778591631; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/WTpRXtFTscssgW//d4BsVFh1NygaJXve5EIy5ifUx0=;
        b=DvwwdoxVKMvDX1jaP3NGQndgUzZRm3kSBexmqdD4HHA2maAtzBwNNiQne3L47COCMX
         PgL7pEGk85R0jSXyUV06FT2Ky5ygs8iPoeRGElJkoVgRTxlcM5EYYeKv7VdspKsENgjH
         sIu62KsvcgVXkuXaHrk3gc6AMKt875pOP3vGkYv8Z7uw7BjlmyG42ZTkxqRRMUPpcR4p
         2q3sbVM25H99kocvHwUfUdOH4ry/KixVCl/qvkI05RcVdYLoqhDhIBAMkjnEu0Ja90X8
         OsGCq1HFIHmZ6DKnv8GR9q64sXw3T26ZF39DzclOtpuxRb9oG4ePnDhApZshR8QsNkc1
         UNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777986831; x=1778591631;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WTpRXtFTscssgW//d4BsVFh1NygaJXve5EIy5ifUx0=;
        b=qOJSAS/L7Z01bvYOmgurEs74FFOJI5AXvNqxWO/rOzf7YX02gzLR2o51nnIdYVKsSB
         6K0GGcUbA/QDofxqYuPUBaLb3HW0WaidcikIB8ssQgAhJLJOYtHkC+bp3UXUGJapRbMi
         MrqMg2TLQ7P0YPyKsZ3vRbOdmAFb1TepLdzcDB8WyEhggQXjgDOyE0FpQTPeWfUc6o+j
         NTeR7yjTch7/Mwki5zjrn76Un3GDt1O0g0EYq/14bMvordH7F6RyGaIqCgH63lmiE/uT
         kwa7g5dHjd8Fq7gIyuRny+MytkAgg2JIfQfY3BEwfPegoNTpUrJiU4/qqIyekwATOI4P
         HNsg==
X-Forwarded-Encrypted: i=1; AFNElJ9cUj4NIpHpyVxDvRn1OED2nB8aZXjrLe0J5o1vPYyLK6rkfXolQ/KzfX8oN6HOZFPCN4yrkewbAWkIw+tOKMoc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2MRYYwTYRtXw8pvgEkzYfgZIHxyAi/BQDMcZhJ6yXxIeVMLv5
	EvwWweVKmRKkFKyji636WrFE1XXsIgtghHQHzut4Y08dQoQ4UBzxzs6Kzfku0Y7ot5k=
X-Gm-Gg: AeBDiessFlLacG+QoZkJmOvDXObGBetp0hePecbCfwJBh3mg+NsxA9Gc5hUICXtDejV
	el1jgYaS4JgwTPaXj4hzYeXoj5PVcPmzyZJ3ezP+2meVVnFh2n5E47FuHY/WIXXeB/t6Rh697Bb
	JtO3oS5jQ65pLO1J2qlVtFsybA+8XpQKSqISa7KS4neKDjZe3PvYkmoYYtBnEGLvs/DP9NQuKcQ
	l6blaP8i0D8mOom19fufRXLkVvQNNyy+2P+1wJlCIbSNSoxKw5JmcIz5erFqOGXsUU56GwnC76z
	BR9PpChjULRqbhmf4XnfBRjKXpXJ+m6k1PjHYgM/d58waAXJsonW8znHVk9nhd+3VfNUZz456iu
	pylg1tZaNjxeXT4icP3yTS3UiuB0ueBEkJGunmXJn7Rjg478YjUxBuSI2ynR2GkJHsvUjZ3fFMf
	+yIi+TnK6e6Xs55U8lOXVGhIeC1LJpaAWz9dTB0sbRKy09m/rpwgQn8ZKZoXHeTIAivmg8Cb8Hc
	H9zMr0bnwBvSELLhQ==
X-Received: by 2002:a05:600c:c089:b0:48a:7965:b943 with SMTP id 5b1f17b1804b1-48a98676d56mr203077035e9.29.1777986831533;
        Tue, 05 May 2026 06:13:51 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb72a17sm366599525e9.6.2026.05.05.06.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 06:13:51 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 0/7] firmware: samsung: acpm: Various fixes for sashiko
 bug reports
Date: Tue, 05 May 2026 13:12:57 +0000
Message-Id: <20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANns+WkC/43NwQ6CMAyA4VcxOzuzlY0xT76H8bBBkUVlZCNEQ
 3h3BxcxJsTj37RfRxIxOIzkuBtJwMFF59sUcr8jZWPaK1JXpSbAIGcCMmrK7kFr98RIo4mNu3k
 asPOhj9QgFDbHSsqCkwR0AZfFdH++pG5c7H14Lb8GPk//YgdOGQXgyirNNEg83V1rgj/4cCWzO
 8DaUpsWJIvXdVGhFkZr9WNla0tvWlmyhCprJYxl2lQ/lvhYkolNSyRLggaRW8wt2C9rmqY3wdj
 k06kBAAA=
X-Change-ID: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org, 
 Titouan Ameline <titouan.ameline@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777986831; l=3844;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=wivIsrOrOOiUhQN35CYh7ZIXSWFpSvCVQrdHqBKvTe8=;
 b=aEK9MQsKZxlVWGLIEhKEu90rjntliZ7E+u0ZHa5Qd5IirP4CClxnf4EwhhYhDUcP0cM28hhtg
 v8sZQCM/392CUw8B+mejQzCnPkBIJdPiHQ9XMjSUPzZuQvC3onGRe6c
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_061353_553830_21917E55 
X-CRM114-Status: GOOD (  16.42  )
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

Fixes for concurrency and memory ordering bugs that were identified by
the Sashiko review tool when proposing the GS101 ACPM TMU addition.

While these bugs are genuine flaws, we haven't hit them yet, likely
because we don't have enough ACPM clients upstreamed to trigger the
race conditions.

These fixes can go in either at the -rc phase or as regular patches for
the next merge window. If the latter, we'll need a dedicated branch, as
these patches, together with the other ACPM thermal preparatory patches
will be needed by the upcoming GS101 ACPM thermal driver.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v5:
- updates to the ACPM polling state machine and sequence allocator
  to resolve cross-thread Use-After-Free races, false timeouts, and
  LKMM memory ordering violations identified during code review
  (Sashiko)
- add parallel credits to Titouan Ameline on patch 1.
- Link to v4: https://lore.kernel.org/r/20260504-acpm-fixes-sashiko-reports-v4-0-529246be6b2b@linaro.org

Changes in v4:
- Drop the SRAM boundary checks patch, incomplete band-aid.
- Split the concurrency and memory ordering into dedicated logical
  patches. It involved reordering of the last patches to avoid
  modifying the same code twice.
- Add a missing memory barrier in acpm_get_rx() to prevent weakly
  ordered CPUs from advancing the hardware RX pointer before the
  payload reads have completed.
- Fix a false-timeout race in the polling path by decoupling the
  polling thread from the global allocator bitmap.
- Use test_and_set_bit_lock. address dependency was not enforced
  when using the plain non-atomic read with find_next_zero_bit().
- Fix kernel doc.
- Link to v3: https://lore.kernel.org/r/20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org

Changes in v3:
- validate more SRAM parameters and queue pointers (sashiko)
- consider/fix the acquire path (Krzysztof) - patch was moved
  last in the series to avoid touching the same code twice.
- Link to v2: https://lore.kernel.org/r/20260427-acpm-fixes-sashiko-reports-v2-0-1ff8de94a997@linaro.org

Changes in v2:
- drop patch "firmware: samsung: acpm: Fix sequence number leak and infinite loop"
  The patch freed sequence numbers on mailbox failures or timeouts. Because
  the message is already in SRAM and tx.front was advanced, a delayed
  firmware wake-up will process that abandoned message, stealing the
  sequence number from a new thread and causing silent data corruption.
- fix mailbox channel leak when `acpm_achan_alloc_cmds()` failed. Did it
  by  moving the `devm_add_action_or_reset()` call.
- new patches, last 3 in the set, they fix some more sashiko reports.
- Link to v1: https://lore.kernel.org/r/20260423-acpm-fixes-sashiko-reports-v1-0-2217b790925e@linaro.org

---
Tudor Ambarus (7):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
      firmware: samsung: acpm: Add memory barrier before advancing RX pointer
      firmware: samsung: acpm: Fix false timeouts and Use-After-Free in polling
      firmware: samsung: acpm: Fix missing LKMM barriers in sequence allocator
      firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion

 drivers/firmware/samsung/exynos-acpm-dvfs.c        |   3 +
 drivers/firmware/samsung/exynos-acpm.c             | 145 ++++++++++++++-------
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   3 +-
 3 files changed, 106 insertions(+), 45 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


