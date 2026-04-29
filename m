Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7E1FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qV0dHa1H26dNJYdioKxpR+rFrwvFtEas71faBHPqnL8=; b=kfaUbiWKwi3OjM
	eMulJDlm5mSYmhPVO6XdvNhPXjohcyQyWMz6zzqDw6f+jQ6JoctFjcMiZPWzB22TgDtiAbcMotQap
	YI+VfuH2VMLSvF0x/+rB5a1xr1jCQwHqbrMEAgTpsv8yxaw2r+HybY6M5S2iZqQtA/XFAIEQeiPFM
	fC3NvTlRedHzPThmMsW6/MFb7Ib4LnMEBK/UXp0zg1t7KQPtTRn0LDVVOfFquFNWsOC1iEHJ3c33J
	zH2Jc3TEeS/MPK9ltvvIvQTgYJLqYmFAeE7Gvyq85sb5sbg/Pv/ef1GjNO4JWIrHV/OAAXj/sPwGP
	CsmmB8vhylfhYzqUIVMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hq-00000003dVR-2rUH;
	Wed, 29 Apr 2026 13:11:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4hn-00000003dTK-0iIo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:11:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-448528f4e69so307346f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777468312; x=1778073112; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qV0dHa1H26dNJYdioKxpR+rFrwvFtEas71faBHPqnL8=;
        b=n4PecKQduuJB6xrR2DGIYj3y9CjpR1CgFwvK4jlfD4BrEllKk9M9FXVQc2P2h7LXYN
         MSzqD0HjqGdrh9XcVMQKSlY8hOOoZffbV11ua9KJOb27NeS4w4S2Y8rvhrQOmhl7s/x3
         bKhlRI6qTbz7XpZHnWkAU0LEPhDqwz+LhvwVJxWnupzmLoNU7ifCwrrh1S92KlqrAKz/
         YcgBbRBXO73MCWCikru2ZEamfzYlykRdz59fC8Bigh2j90V3U5IqYOmk+1KevPgT69SE
         22jXVheeeBHAxRaPbUPNPP7eBECPVlgr6oeeHy6EtA3s7vUnixEHDEOxIfEgmUzJmN/j
         TBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468312; x=1778073112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qV0dHa1H26dNJYdioKxpR+rFrwvFtEas71faBHPqnL8=;
        b=bMinrj0RLfh76lwEQg4DR76TN/ZUDJQDHYKr+akRruQwiez4QM/aiNe/jyWaI8t1yx
         kTkVOfE+BeEksRLC3h6dRT7wY1J1O6CHISYsB8ZpqVv0gTb/Qg5l1qZene8tRke1KuaW
         ADZ5ZzRaQwHlNkr2P/eTNK0kdbqMHuheXeCklGAbsdo2wMfdd9reI+EJz/SQIpdqWz2I
         n6UEvOZMY4wbkE8mvGlNQjKietBUjBVKLU9m3XDKEyj9XnG84ANvDc+YtT7YKvxrCE7+
         qQZDpSPxBoDwVNi1m/zPqKwXXMPtI24r0GnTxr1JBZE7i6uWkD3zC3FYXxHQnduqOwoo
         sVPw==
X-Forwarded-Encrypted: i=1; AFNElJ+4ZSdb8av2LgsNmaNn6ZpFUtOw4KFeflBGKKtJAIBk8Ttc3yDe6bgGDZTOgM0hN2jo3Sv+92Q0ZLXBTqB/RpHw@lists.infradead.org
X-Gm-Message-State: AOJu0YzYhbw7N7YVYehVrGK21guKTp/aE9gLqjHf2Yqc5JKXn5I9p0mF
	iedWV36xg/Ihm1m1Ia3TUnp9glBT59SIfpDQ0FgB/N8JNrkJXShYv1b5t26FKwhafo4=
X-Gm-Gg: AeBDievFxerX7Fb7/+jhm7L09DTmw0Aj41xR4rS1paQ6AnrWGvxnTElT7RHv/wq4z8X
	1aCxZHuGCs85LSYaICaDxr2aJGqDg1Z32vWgGEW3nKbTFvbmQ8gXUyGU/CypLezzYi79uM1Mc5v
	h+sX/i6W4VHKmOWptp1ACAJRYJ4eMTxfVLoaNZmCzoyP0Mfmm8uv70UFHlMjiyEhNnTcQ7YhIWI
	DesKKRGy1VYCeP5IDyg3WpksWBVTjFVZsT58BsQswH2dPnrAPuIPKs1uQNk7Mti+X7ZQzddCKW+
	m/Gu3zzHz2UlM3E9nL5Na+1wH3cuzvt0K9zzY9fQliWBZWmgFsvf9hL+tcR6dtYsJkapKHQ4fF4
	QwA/77Rm2cH0gqUMXCplgOC6br4T+YyjdlFW4sPAoMADEv0lkYoYBMBjSO7XEOAD9eqpR6Nmtfl
	8aViCt0fnCyAjNawBMVE9YMQExMZubqYPB2KlQwzWASJJCg0zPPeVVqSzvVksnmxdlIBpPhVKkq
	6HhDjqiKcyXNrfv2w==
X-Received: by 2002:a05:6000:420c:b0:43d:613:4036 with SMTP id ffacd0b85a97d-44649c995fdmr13980592f8f.37.1777468312077;
        Wed, 29 Apr 2026 06:11:52 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca67b9sm4752867f8f.34.2026.04.29.06.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:11:51 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 0/6] firmware: samsung: acpm: Various fixes for sashiko
 bug reports
Date: Wed, 29 Apr 2026 13:11:49 +0000
Message-Id: <20260429-acpm-fixes-sashiko-reports-v3-0-47cf74ab09ad@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUD8mkC/43NzQ6CMAzA8VchO1uzlc958j2MhwEFFpWRlSwaw
 rs7OOnFePw37a+LYPKWWJySRXgKlq0bY6SHRDSDGXsC28YWKLGQGaZgmukBnX0SAxse7M2Bp8n
 5mcEQVnVBbZ5XSkRg8rQvxvvLNfZgeXb+tf8Kapv+xQYFEhBVWZdaaszpfLej8e7ofC82N+CnV
 f60MFqq66qWdGa0Lr+sdV3fhGeJRxEBAAA=
X-Change-ID: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777468311; l=2613;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=O60dEyNAeg9/bJQwp+6nhzKbZ4rJnrr7+9Wd3xUIU2s=;
 b=FCGUU44RTE/wiRQEp69ZEhQQ+fxvOozPURXqNN8E86+ml1DTCB3s3/1Cjt91nRXJZ7dmP5zkH
 vqHTqqZgVAhBVRn2fAnlbXv0n0hctdhA3YVK4PceOG7cl/7RhEN6u+x
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_061155_246202_6881073E 
X-CRM114-Status: GOOD (  13.15  )
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

Fixes for bugs that were identified by sashiko when proposing the
GS101 ACPM TMU addition.

While the bugs are sane, we haven't hit them yet, maybe because we
don't have enough ACPM clients upstreamed. The fixes can go either
as fixes at -rc phase, or as regular patches for the next merge window.
If the later, we'll need a dedicated branch, as these patches toghether
with the other ACPM thermal preparatory patches will be needed by the
GS101 ACPM thermal driver. I'm thinking a dedicated branch and a tag
will do. I will respin the GS101 ACPM thermal driver series once this
fixes set gets in.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
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
Tudor Ambarus (6):
      firmware: samsung: acpm: Fix cross-thread RX length corruption
      firmware: samsung: acpm: Fix mailbox channel leak on probe error
      firmware: samsung: acpm: Fix dummy stubs to return ERR_PTR
      firmware: samsung: acpm: Validate SRAM shared memory and queue pointers
      firmware: samsung: acpm: Fix infinite loop on sequence number exhaustion
      firmware: samsung: acpm: Fix memory ordering races in RX and polling paths

 drivers/firmware/samsung/exynos-acpm-dvfs.c        |   3 +
 drivers/firmware/samsung/exynos-acpm.c             | 113 ++++++++++++++++-----
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |   3 +-
 3 files changed, 90 insertions(+), 29 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


