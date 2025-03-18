Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3CCC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IS58nPgz/vhhwTrnHBcU78ZbfsRgzftJFesloBEwajk=; b=pbqb4yZztg1ngR
	Mw27qn9Q/7UNf1xpq+GNGYCDWafwK8McVde+CFWrX8XkG7JqNEuecvU2nRgYAm+Y+ztIfwbt5NLLU
	8ni07tW1HTQEfVg/sI+F4Z6Ex4RgKr2RndpOFMDAQQQd4XNsVFtNfmxfz1rRL/ftpU8TXHqnhMHCB
	S6Kjz5Hzu0BkCCuQHGWM2QFTf9jgT5etV2QcogiuL6MjXW3uLeXkdtf94Tvu6QvbWmH7I6bA07WIu
	SZgoB91jeHwmW+JZ1KB7gAxQ2bFAfqHWnRu3N5maAzRhbJj7sdGPYPvz7Co3nWJTFI/VmBH+g7tW3
	meE2PC7p4E46S76CEoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZjf-00000006WFo-1zyd;
	Tue, 18 Mar 2025 16:24:11 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZhx-00000006VpQ-3hRg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:22:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so3581924f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742314944; x=1742919744; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IS58nPgz/vhhwTrnHBcU78ZbfsRgzftJFesloBEwajk=;
        b=xoSEhgZs8seEfoIUMwxcQFycVlp049+uaWF2F773/2jmpJS8R+tJYiZDPbfAAf1YeF
         DhGmK2rKmbTJBvhQT+uL2OJSByEkJPEugKdSJByKNDBLPXCy6MM8qC0AHLEd4d21A+Ew
         vbAJ8bTh3nEsXp8WqOfxQdyQDlK6MjGEI+LCEQDzxPp8KUKW3c3je5qOyhjbM2ab7aW8
         jNZTQlJ8Z/6py+B5cZKH5S93thaOcUG1728QESzsut2MIFbvfkQDBR9oc/Lj+TjtASyU
         McTQ92wHJBPmx09Ynfirqk0Xmz6mhnnTjDzgbTvGubQAyXRLQtCB8E5fRk27qBI7yqRU
         5MrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314944; x=1742919744;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IS58nPgz/vhhwTrnHBcU78ZbfsRgzftJFesloBEwajk=;
        b=YHyVWT6BHYGD/AkWsYcyoqkL0lka5i/Nx14ccVbWOVcyO9PUod5DogD4zMSIKDSDdT
         0NlIbwjcwaPhnMS0lfAMR4iRSN/BH+o1LDCYU0giV6H4CDOSLzVNgiDrmV1jamwIDsm+
         BI/+1mCzujMGCw9v6xxeo22HHgTmibabolUksrdim3hdc2zLybxrTJ0LRYAcWCInawHH
         +u95iJatPveOizIzzo/ot54lrjOifQ5uWavoMMDzpbjIRvLAP2p23LOo0BEsSA+8GbAf
         yxANg6gLhnZNmofPaN1Rr1LAegM2KsDn1cKHQ7Ivx/zSf/+J56iuF/FMyVhOlRHpIaU6
         dCNw==
X-Forwarded-Encrypted: i=1; AJvYcCV2hymtIxgbQa+zUsbHEYhJ7W61hUvsvMYiuyenfS7jyeUJylnz3M+6teOaFCbrLmZd75FbSRGBsIlYJFpNKGwe@lists.infradead.org
X-Gm-Message-State: AOJu0YxFcmndf/bczHjPCZeabsuxZuJ2GuIjdHazONNjA5yJFFEyDsZa
	bTxNpVTecYNddX4brHUdi07x2nUZ5CY2DdqkIF/psE1H6DIEVUx7UHMIGirNCvs=
X-Gm-Gg: ASbGncuPBF89uHv9Wehvz0y3KgSX9SBpp/Tm/heuWjzxL1i6oH539o+HHTPZ0T2g9Ip
	1wb0O2ClwqPcSfnYDgG0nh+Twg8GUlL4+3iuZ85FxfnsXNbk6qH/DkqIELL9AdRaLMaUuvK0UWO
	sDfWAVtW4DXd8yQY+GAXuovyA9Avsw+M2D2BJG+LgzXl5E0TYcPhSY4GEfW9W9HZOrV/F9i5zIu
	UEqwMVPzNwbqLHnWXw1OetLRH/xMSsBWrgSFFp6EQopOsX08HmxgSBtHxxRrkwWgLo/y4yC729V
	QHyuJmp8dq+hOaQvl5qGFI58CA8jtEaYY3ZdjZl6wl8bblQ=
X-Google-Smtp-Source: AGHT+IEwJEcXk3dumIi7rBste16wPAh7uoKDuJkycvX07wE3srIa49dtB8OVLWB1K6r6+XwTz4wL1g==
X-Received: by 2002:adf:9b89:0:b0:391:3fa7:bf66 with SMTP id ffacd0b85a97d-3996b46892bmr3310969f8f.31.1742314943988;
        Tue, 18 Mar 2025 09:22:23 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:22:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/8] coresight: Clear self hosted claim tag on probe
Date: Tue, 18 Mar 2025 16:21:54 +0000
Message-Id: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKKd2WcC/0XNQQrCMBCF4auUrJ2SSZuWuvIe4mKok3S0NjIpI
 pTe3aALlz88vreZzCqczbHajPJLsqSlhDtUZpxoiQxyLW2cdd422MONHpxhTMpZ4rTCOJM8YKW
 YgRjbDgMGz9YU4Kkc5P3Fz5fSQVNZTsr0Jx0i2mZofT10fTt4wN9DXVy9n2ZZSFOdNJp9/wDJh
 P2LrQAAAA==
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
X-CRM114-CacheID: sfid-20250318_092225_934092_283EE2CE 
X-CRM114-Status: GOOD (  15.40  )
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

Changes in v2:
 * Revert most of the interface changes, just call
   coresight_clear_self_claim_tag() directly. This is possible because
   we're not doing the read first, so it has fewer knock on effects.
 * Split out the change to add struct cs_access to etm3x
 * Add another warning for racing with external debugger

--
2.34.1

---
James Clark (8):
      coresight: Rename coresight_{set,clear}_claim_tags()
      coresight: Convert tag clear function to take a struct cs_access
      coresight: Only check bottom two claim bits
      coresight: Add claim tag warnings and debug messages
      coresight: etm3x: Convert raw base pointer to struct coresight access
      coresight: Clear self hosted claim tag on probe
      coresight: Remove inlines from static function definitions
      coresight: Remove extern from function declarations

 drivers/hwtracing/coresight/coresight-catu.c       | 12 +--
 drivers/hwtracing/coresight/coresight-core.c       | 85 ++++++++++++++--------
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
 19 files changed, 166 insertions(+), 134 deletions(-)
---
base-commit: 5442d22da7dbff3ba8c6720fc6f23ea4934d402d
change-id: 20250317-james-coresight-claim-tags-ae1461f1f5e0

Best regards,
-- 
James Clark <james.clark@linaro.org>


