Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02BEC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jGTI6dUm2MRiVeGplFX7z/KtFfB0S3Uj2G+oen7A4jo=; b=Og3u4Fn4H7gv29
	i+aMS9fEZ3muqLzi6fsy3iaBn+3tA39NKdmzTUAbwszy8FUx8qup8lYwvPjlmUqI+6WkMZzHzqeBA
	HLaA35tViXGsIc337V2IAkp3P97MAbfhEcpdgbd3B8D7fdzW6ihbOGoTWRbhkkcShmpX4ZxKUCV4y
	OlQj1Px0I6sccSFrD1dRoBe93rgQvP7+1daIW+i3Z9MeygvckUXYTPzLecpsSQjanIyvTdCBFgKmN
	UDqtZmDR/ZVsDwWcPT8cNYI7WCQg0rrHcCdU+O8lBeJ9YCOJFH5q/8htYNbslu9OlsstmVAPSH7z7
	1/+BhhRCeE/omcNXvT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx35S-00000005keo-0DWi;
	Tue, 25 Mar 2025 12:08:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2vy-00000005iNT-1Hoi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:59:07 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso34421725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742903944; x=1743508744; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jGTI6dUm2MRiVeGplFX7z/KtFfB0S3Uj2G+oen7A4jo=;
        b=S10uOwX17z2qZffPQ9du7FEDeRlUZa0Ch54hnSXDV6C8QZoPmIXlmkt+ckFhsShREZ
         /zxvRPQnlC4H2a9ommz14t5/lpxGUlEyjDoYAoo2AUGz/vot6SRcfLuZ3Pj8XHdcnWJL
         pBvJ5D0ihAjvRCNklgaULUGU9inQiuV5+pxYZ1qxMWyp7a5prtm4ytVf/zKTcQ1U+nPE
         yxGeQc72LiteL1V97Vhkv3sT+BIDTJAqotrhSuQwrWaBG5StzpbXdLQ/lc9HRUTFc7hn
         yY4DM+p0mN+dCjgtrx94X8I9EkudlUy/nfNJO2tItKJvYQikDpdM3wpuGu4Zfp+c0gXV
         kXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903944; x=1743508744;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGTI6dUm2MRiVeGplFX7z/KtFfB0S3Uj2G+oen7A4jo=;
        b=okTeYSnFrNAlT1momfPZAUxYgdtCcuj1vKBKAOKhlgKk7sMq87ypfEkqax3ODIH3a6
         CXfQSi9TLjEjPemcDLVdU2uGEsUCBWcu0cxLKesITABtA4ein4V8Jp7pcT3pNOObCWWN
         f4MPWBkjCtt/rni/b60LJljNpsoyF4b0FmlN/+gwlVVOYCkVB7rqyI9DB8KKAi8xmZxp
         gicWAknd1LRhd4XfVMIizfVdy1kBMVouLtrocq1NeVU1MGsXLvXad/Jm3HFsyYHpEqdJ
         k13/7/nMRwqrfBWT5n8pcdAqyRt9fGr84xsZksoCJzVX/pzE70/Kqc36ErUOhW64GqrL
         tjpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8GImuAndtn53+F47psMTXj8HjvgRyiX5v15RhtburdNvrQI7ogKOol93g+fWuokGKrdA/TV7k5PYdlwHwCh69@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/3vxLe2VpxcDirF6Sk/bdS9ET3gWHxWJwJ50myCBWmAXgfD1u
	X2c05THM/SXgNC9GRJ9H+BMTPHi1CC2jHa8Pj2PnxqtUId8XSgFi8IHj8Vh9Ej8=
X-Gm-Gg: ASbGnct31eDO0Y9Ew1zWEAeZXZ9euKqBSOspwnqtCnTJ9LVU/xRKDGr0BB7UJSFFt2+
	+AkEWp/yQWzdEy0BOsSgRhLFGhPVac5iD8UEUipbC+N6S7A77n4ZKxD/a3m8FpZY/gczFjTG6Hh
	fHEilU0I+iPBEs5dDuj9FmtGaI33AKWg8sGwv18+hDvh7GlrWJbgIZsiGI7Pi58ApLiXhEQRcTO
	I0+JgTEnh3s1FtbN7hkN8AfQBmPKI21E2Jq9UYdd1Xn8ncaSmcnOTvbK1SmnlxLCuXWsLsrfc4N
	ogdXLvrqAgu091dcnUbYVC1F4PsJu3eO/dYmEXpz4q2ciXiMOq6ZOKbKq/E=
X-Google-Smtp-Source: AGHT+IGi3f+WduASAoJyESw/dkvZV/1xs7w/6CimQs/4qOoGd+9PrfPjTXiaYW1ipNvTLM3qNBE+cQ==
X-Received: by 2002:a05:600c:4995:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-43d491b7dc5mr162584035e9.10.1742903944481;
        Tue, 25 Mar 2025 04:59:04 -0700 (PDT)
Received: from [10.42.0.1] ([145.224.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6676sm13687169f8f.62.2025.03.25.04.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:59:04 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 0/7] coresight: Clear self hosted claim tag on probe
Date: Tue, 25 Mar 2025 11:58:45 +0000
Message-Id: <20250325-james-coresight-claim-tags-v4-0-dfbd3822b2e5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHaa4mcC/33OTWrDMBCG4asErTtGo5/Eyqr3KFkIeWxPm1hlZ
 ExD8N0rp5Smmyw/GJ55b6qQMBV13N2U0MKF81SHe9mpNMZpIOCubmW08driAd7jhQqkLFR4GGd
 I58gXmONQIBK6PfbYe9KqAp9CPX/d8bdT3b3kejkKxT/SIKK2wfkm7A8ueMCfD0115eP1zFOU3
 GQZNnDkMme53mMXs7G/Xe2zrsWABgqpjSF11Dp6ZLewxT5YRj+1bLU6i84n9LY1+p+1rus3IFN
 REFIBAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_045906_368087_E004D948 
X-CRM114-Status: GOOD (  17.42  )
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

Changes in v4:
- Add _unlocked() suffix for consistency
- s/cs_access/csdev_access/

- Link to v3: https://lore.kernel.org/r/20250320-james-coresight-claim-tags-v3-0-d3145c153820@linaro.org

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
      coresight: Convert tag clear function to take a struct csdev_access
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


