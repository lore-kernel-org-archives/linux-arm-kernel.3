Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6457C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T3uKjmvKFIJwQeQjhs6y043yl808flrdLcwtYSXqapk=; b=yfb14v91CjCPCt
	Hnq0qkZJKGUKD//R7YGICdOWw9Y5+2YZ27SI27pNASXAfjdsDtXBFgRbjhAGGWFaeL0Bob2Kk/ECF
	uKLm+xNdzbFs6LXmkI+n51tf3fPfKDuFzi4jh3XXS+MT+F4jrvZXn4eZCU5vhWkGV3RY+4yBDTFQX
	He9+9Ub+3IEi8+2aAYG7jMh5ONPzJvjWwsh5BCpcqoH2+VWZVoc/jU0akayTOM+X7MvKWgY9JTNix
	a7EaZ0zv9SbNTIFpqkBtiTyS7sv9DOJhp855CIFnIqlvTgUoek+VX1erOkkwZWOPh/KaXzCyKDoxR
	mNdRs535WeT0ulM3J27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvH0x-0000000CPKV-2xxu;
	Thu, 20 Mar 2025 14:36:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvGzF-0000000COwv-35MW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 14:35:11 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso4309285e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742481308; x=1743086108; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T3uKjmvKFIJwQeQjhs6y043yl808flrdLcwtYSXqapk=;
        b=rqp5lSpVdWpMFiCLLbdG0xF18KaoMr3jwKjb3zVZLnLktd8qzaB3kyQ4m7/BQIfGxB
         YKutLpc/A3v1j5F0sw/KwFp8wcbwtTbwHk1knaPXL2kyiOgV6mzLqvjhQsd3HJ7gii9Q
         keraK50BbJPaiPvFVQJOx+LQBUgkPW7vbtFD1FkadDypOE3OqgQp5jFxdIJ73+t+Gg/9
         VLNrmGuf02b1P6U9TtscZKq9S5icpkWyb9QJidT7ZYx8Gze2GL4ZjEv/b1wwD0wRWVYk
         GwyowsIQuD0ZjMAJIWkHyeIRHpBy5e342facE3ZU0/guGvt7XlyfIMn6xntP5mFyWeqP
         Otpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742481308; x=1743086108;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3uKjmvKFIJwQeQjhs6y043yl808flrdLcwtYSXqapk=;
        b=kT+qgNkecs7lqMNnaTMvHFLfaPgWCf7E30Vf2vRXyh0IhcZTzEhtWA6JcaynT0ClYy
         FYQ5KQ6eNc/eA6a2mG5wnrR3+qnPLkIMMOJ8La6PMBhws2bmVf+ccbOXOWHNzl7+1VIH
         jLelChDjd5p7r3Sie2QaiXiCg6meEUuCcHybptWuGNgDIBoI/mRyr1gyjQ6kfW4f0mWJ
         B+bJJljPxdC5XqVp734VyfToNyVoVXUpXUjcKqxtcQ6eDqS2z+1xnzM5o72K/aRL0Yhe
         yJvtlkrqIU2VvCKLHmyvzpW8r7gLcjusZ6UX7M4xVCPZad1BpgAWXeyct4xr9k9ISHZU
         HV4A==
X-Forwarded-Encrypted: i=1; AJvYcCUVJujd2gY/u9k7ffCV5kyOP1TT4M0X+ySXQFEcZn+VavSfG99Qi1TXt51iaGcA58vRm2J8qZd7407dLgAnqVJx@lists.infradead.org
X-Gm-Message-State: AOJu0YzQrOVGWfsvenEeFrKSRxxFAsSiONGy2Qqpz60snOR3mYKIL/Gq
	5/G1BpR6RRXMWUHKg/qioP/a0FwusLQhIUJSXPJ20ziAYutKlDSFDSlSfD2ACsExxin80KiSPZ1
	o
X-Gm-Gg: ASbGncscEs5GZZM30HtMuKSqEbhgUe5dwJz0kJcFfT0twKITSEix5Uu4ORtq4yZMQQH
	Wh3Fk528LGWKffxvO125eJL/ZHhOzXhc+eh03tLt9P9FQRV7xFQIRj5xfZBq9+Y6j3+Z0wbBMou
	FpXEBs3Y+at2xUjGmSKbmg74D8rJeXHswig5rINyyfyreN7cf0DJGKpjngx3nHFC7x8FAHvqnL5
	Up1769Jidn9AmxjrghGwAon8nngCiTzDuyNiQhJW/RzkXDkWsCsKePdkNiPp65GOTStf08WqDF6
	/sYQTd92SRth+AUC3rHprQQnq7RbvKtvilEFszHM7e2CjfU=
X-Google-Smtp-Source: AGHT+IEi+3lvXUBBl0Xfy6+/zMNSE6JUBwO9nHsVgmXy4u5Zz77pany2bxefRYqYSeHLwQMSeBXSLA==
X-Received: by 2002:a5d:64c4:0:b0:391:2d97:7d0e with SMTP id ffacd0b85a97d-39973af6beamr6757865f8f.42.1742481307687;
        Thu, 20 Mar 2025 07:35:07 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a27sm24238187f8f.31.2025.03.20.07.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:35:07 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 0/7] coresight: Clear self hosted claim tag on probe
Date: Thu, 20 Mar 2025 14:34:09 +0000
Message-Id: <20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGEn3GcC/33Oyw6CMBCF4VcxXTukLde68j0Mi6YMMF6omRKiI
 by7BWN05fIkk2/+WQRkwiAOu1kwThTID3Gk+51wvR06BGriFlrqXKaqhLO9YQDnGQN1/Qjuauk
 Go+0CWFRZoVrV5ihFBO6MLT02/FTH3bKPlz2j/ZJaKSVTk+WJKcrM5KDeH5Lo8uV4pcGyTzx3K
 9hTGD0/t9hJr+ynq/rXNWmQgMZV1rgGqwx/2XpZlheviR+aBgEAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_073509_786162_02D6B7A3 
X-CRM114-Status: GOOD (  16.79  )
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

I've gotten stuck a few times with unusable Coresight after a warm boot
due to lingering claim tags, especially when testing the Coresight
panic patchsets.

This change does some tidy ups, adds some debug messages and clears the
self hosted claim tag on probe. The last two commits are unrelated
tidyups but they touch some of the same functions so to avoid extra
conflicts I'm including them here.

This gets as far as fixing the claim tag issue, but there is some other
state not being cleared on probe that results in the following error.
This can be fixed up as a later change:

  coresight tmc_etf0: timeout while waiting for TMC to be Ready
  coresight tmc_etf0: Failed to enable : TMC is not ready

Changes in v3:
- Collapse rename and locked/unlocked addition commits of
  coresight_clear_self_claim_tag() so we don't change the name twice.
- Make coresight_clear_self_claim_tag() a bit more generic by only
  doing UNLOCK for MMIO devices (although there is no use of this right
  now)
- Link to v2: https://lore.kernel.org/r/20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org

Changes in v2:
 * Revert most of the interface changes, just call
   coresight_clear_self_claim_tag() directly. This is possible because
   we're not doing the read first, so it has fewer knock on effects.
 * Split out the change to add struct cs_access to etm3x
 * Add another warning for racing with external debugger

--
2.34.1

---
James Clark (7):
      coresight: Convert tag clear function to take a struct cs_access
      coresight: Only check bottom two claim bits
      coresight: Add claim tag warnings and debug messages
      coresight: etm3x: Convert raw base pointer to struct coresight access
      coresight: Clear self hosted claim tag on probe
      coresight: Remove inlines from static function definitions
      coresight: Remove extern from function declarations

 drivers/hwtracing/coresight/coresight-catu.c       | 12 +--
 drivers/hwtracing/coresight/coresight-core.c       | 87 ++++++++++++++--------
 drivers/hwtracing/coresight/coresight-cti-core.c   |  2 +
 drivers/hwtracing/coresight/coresight-etb10.c      |  4 +-
 drivers/hwtracing/coresight/coresight-etm.h        |  6 +-
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 28 +++----
 .../hwtracing/coresight/coresight-etm3x-sysfs.c    |  8 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 ++-
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    |  4 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |  1 +
 drivers/hwtracing/coresight/coresight-platform.c   | 26 +++----
 drivers/hwtracing/coresight/coresight-priv.h       | 20 ++---
 drivers/hwtracing/coresight/coresight-replicator.c |  3 +-
 drivers/hwtracing/coresight/coresight-stm.c        |  6 +-
 .../coresight/coresight-syscfg-configfs.c          |  2 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  9 ++-
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 16 ++--
 drivers/hwtracing/coresight/coresight-trbe.c       | 18 ++---
 include/linux/coresight.h                          | 40 +++++-----
 19 files changed, 168 insertions(+), 134 deletions(-)
---
base-commit: 5442d22da7dbff3ba8c6720fc6f23ea4934d402d
change-id: 20250317-james-coresight-claim-tags-ae1461f1f5e0

Best regards,
-- 
James Clark <james.clark@linaro.org>


