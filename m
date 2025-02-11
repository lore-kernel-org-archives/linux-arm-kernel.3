Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199FCC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VrQhaC3gKZKDAc8Ce+Rq4JirL36T9Iu7HnsPcFoyuXk=; b=Qwh8mOBRA//R53bluj/zozw6DQ
	eJ/RGPqNtcseDt7yVCLiTYwB4kp/eSZBQSvLvRAk347y3Xjw1iTnD3ryvRG7bX+MoZFVnfzR74fox
	b4S6SO+aq9LNI2WcCKf6hVPrvVIAxBF6oi9DzH9/qiXhOinRvPt2oH/uJhCUT95Nb/IkxmaPtqGSE
	8pXlvlWKIgRpj3V/2yXyBq0rs9o15IVAn6ObVPb+p0SFNyIcnfKEDllW+RAvorUCspzSnD1dwzYko
	D9cOcuIq0K/fQB+kUPfTgSWrU5yOPGwB4ZnaKa2/G+bbuIuKS5J4c137LAAitKHvPIcIQbvEePpTw
	uAwNsAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnke-00000003P9c-4BbX;
	Tue, 11 Feb 2025 10:44:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thngr-00000003Nr4-0Rnl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:40:31 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so2515393f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270427; x=1739875227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrQhaC3gKZKDAc8Ce+Rq4JirL36T9Iu7HnsPcFoyuXk=;
        b=vfZhIUWpkZz9r2oiBd8iePKolQMP4eHbg4c4OGG/c05vEh/oN7OB6a0ifoIzptWGe0
         hNLDYtJJJrwSrrefCnOaPDWNFVDxxuihD9P80RIlLvg/WW9ON6NzG/Cg8PFWIjY0lRF2
         S4hsaKHITwyPyGsRwlBIvT87tau8svn0MgrzXEpflKihmYPYC7Uzzq7eKUSxA6LDLyTq
         7TTGfbtUs3KExUXn97itokCxKpevrXyviXmnIGjVXXgGQgNeArS+Gd2l75SdgcuDF4mE
         0P9i75zXS+FwZmSlHCnQpJozWbT4VpgLAetwHPjpzuJwlBcyAQUnY6WqfYVAvGmSPxDb
         qTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270427; x=1739875227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrQhaC3gKZKDAc8Ce+Rq4JirL36T9Iu7HnsPcFoyuXk=;
        b=Xj4IV7iXdiiTzOCjsBjmY3e9l7JT1jL8FEG6C8fxiLPHYiaOTBuC8adpd9GtLIBpFB
         Y0CAZpOCHlkqoI7JZyXHE4ScirH4CshCJDjLHVAiTTYm6HXg4Z+6C0r5Ms60g5Rsk23q
         aw13lvb6BUJwkQiJv+6KEB642EeX8lHTqBiKp6sNqLyHRJMFdRFePtXkuCS+PspuaA2e
         vp81CjcJK9lpN+5AKnNsOI5uEJW6r9t4Lttqj+i8yVwHDy2l6TptWlH90kyjwfTwghxo
         KYVTaJAIik5wvqcR1/fV/QNQEF7cd3WbokK7f/e1+du8iLWU6f93sIgcSGogch58NqAf
         7Xkw==
X-Forwarded-Encrypted: i=1; AJvYcCU4OuvmR0GUB/6f3JxtDORAY+m00Q5Tv6hMYZQKrCQfWarGeGAGEsOK72nIkCD+gh5TqPNavcKiZtCXbj5iV0gM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0posnueynm2EiG0ySFA8fy1ZR39Ojyl+LjyB3fnSP/rbIkeLc
	+lsnZooqKUsRfHzTbdcV7pySuzoNMrJLC9oqKLOIMfSngLLXrfy22iZ3yDsUaeA=
X-Gm-Gg: ASbGncuFtujqRHuGcC9wzdZ87nKB7mzrExNDS2+Kj83DNQ0vAxtcDnloelK1F6fPyDH
	mXjOKBLcPgIcTXQRloD9Z/cWfW+iLEHjPeMLHhjAYuY/2HBh9yLgZjNUAkf9IJaO57QD0pqBSDg
	dFIEi2jwg5iT4UHVdN6R7Nfaj+9q/eq9BDignH2J10PNAzk2sj9a96sKOGM9yjVH+N9T9wqlUPG
	XO7fhbt9CRSpr2LumA7Zbiu1+FAsQoQ/l2SLNK4nckoYpDkqVI7uN05jF0/qZX1q/oRGEFkMlN3
	wZNaOxm9OFSg
X-Google-Smtp-Source: AGHT+IG4gEm4nSnw8t/iNqVVtVQKgUFA9cxJ4G6BsHMjOTxtxqqAhDt1o8nYwzMfYgssh++RTKqiSA==
X-Received: by 2002:a05:6000:402b:b0:386:3328:6106 with SMTP id ffacd0b85a97d-38dc9374026mr13853655f8f.35.1739270427442;
        Tue, 11 Feb 2025 02:40:27 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:27 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/7] coresight: Clear self hosted claim tag on probe
Date: Tue, 11 Feb 2025 10:39:36 +0000
Message-Id: <20250211103945.967495-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_024029_174861_EAEFD6D1 
X-CRM114-Status: GOOD (  11.63  )
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

James Clark (7):
  coresight: Rename coresight_{set,clear}_claim_tags()
  coresight: Convert disclaim functions to take a struct cs_access
  coresight: Only check bottom two claim bits
  coresight: Add claim tag warnings and debug messages
  coresight: Clear self hosted claim tag on probe
  coresight: Remove inlines from static function definitions
  coresight: Remove extern from function declarations

 drivers/hwtracing/coresight/coresight-catu.c  |  14 +-
 drivers/hwtracing/coresight/coresight-core.c  | 132 +++++++++++-------
 .../hwtracing/coresight/coresight-cti-core.c  |   8 +-
 drivers/hwtracing/coresight/coresight-etb10.c |   6 +-
 drivers/hwtracing/coresight/coresight-etm.h   |   6 +-
 .../coresight/coresight-etm3x-core.c          |  32 ++---
 .../coresight/coresight-etm3x-sysfs.c         |   8 +-
 .../coresight/coresight-etm4x-core.c          |  12 +-
 .../coresight/coresight-etm4x-sysfs.c         |   4 +-
 .../hwtracing/coresight/coresight-funnel.c    |   4 +-
 .../hwtracing/coresight/coresight-platform.c  |  26 ++--
 drivers/hwtracing/coresight/coresight-priv.h  |  20 +--
 .../coresight/coresight-replicator.c          |   7 +-
 drivers/hwtracing/coresight/coresight-stm.c   |   6 +-
 .../coresight/coresight-syscfg-configfs.c     |   2 +-
 .../hwtracing/coresight/coresight-tmc-core.c  |   9 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |   8 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |  20 ++-
 drivers/hwtracing/coresight/coresight-trbe.c  |  18 +--
 include/linux/coresight.h                     |  32 ++---
 20 files changed, 209 insertions(+), 165 deletions(-)

-- 
2.34.1


