Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658BCCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ouWcSpiIf9dLpvZnWLKHc0VRpVvUzoJh4rEYwTYJ/q4=; b=YViA14tyi1FHaSu4yCzEqjpSZX
	1RPNY4y4wRGoLltmDRQ/u0m6xY3K6cp73EfD6Ct7FXoufNmH3USBKcltn1q96uJnFWv37ynzOdv1M
	iwGkM5hZ7SRbts+TLrfPLNNpMo+doCprLG7LxP6s7X9EFE6py2C0FnUs5pg4dpxVDtrc4X4mANRrN
	1Sbuat57AE62XFzyBKM8z3fFWxKDl+cglyocW0PGZ6kai3L7SVBXe89IjBb+BytTPLQ/TPPPh9j2i
	W1J119RNRXmnyLoO9acHHfxB+IstjnujOHZU8XwCILbrWBZeZWhfVtlaxAzLsVwRMaYp7NyCevdKA
	PB1DDPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92ey-00000001vTi-05pW;
	Wed, 15 Oct 2025 14:39:24 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92ev-00000001vT1-3YCP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:39:22 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-33082aed31dso6925474a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760539161; x=1761143961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ouWcSpiIf9dLpvZnWLKHc0VRpVvUzoJh4rEYwTYJ/q4=;
        b=axxVdOqbUxJDpRXNS0xpZ2EGfLRSRlDz6/9o/w+cCpxUBUNi0admBqn38y9jypV5a4
         0GaksKcc0Z+YPi5kJUiExkCWMrGVvKwPYd5hInHYr/XCQMwf9aLxjDPTOmV8nrkXFbpM
         0CRMlaiMD6v82NVC+8V87P+fotKxYFFUBR6Yo+ru/02ymE/3c4jNWNBIV2kO07KK8M5F
         +IxJr7m3L4h3KY0MqaqqbPBhdKslWNpF5yURmkzquzk+0Ectl2fkcoXRbFI11Wux68lf
         G4+0XiAEhNiFq1Nc+KYMgeYUMSWd7sU+Ahn/HaUtFAZsKfJLG0c5GunMGwVITo5gwMIU
         04Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539161; x=1761143961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouWcSpiIf9dLpvZnWLKHc0VRpVvUzoJh4rEYwTYJ/q4=;
        b=J3mT/19EY4tqaaweYfDVik+TNC96fuYyauIsoK9hbBBZG3rZ29l+kaXGX4Fw3zk92d
         XHB7aBOzkh3UtDJRCyozcCWu39Grcph/vQTJvsYnhpixz+sRX1MqfSgmtrgDqfvDmelY
         Y0NTgFVAGhXVGM3/SECgUvhLNDz06+PHFt92LuTuTwWacpKgjEHI6tBeuWkY2Ag0x+4L
         aw6LUqa+gjwRcOpDuU/exRaFM9wL7sv13xAVF2PAjMxh3bABLC4RybrpBM0PMp3d/wEy
         /aSWfAMzuOgLrtJUYvW6rp92T4kWDFKEiv0Om5AqL5d0WU2DA5KIM2MoqK86ROYz7YDA
         DP8g==
X-Forwarded-Encrypted: i=1; AJvYcCUoxbdKQuHdi4mY2HgBV27ZYEI6Wzj0CYg2f2faxSb+TUW3mIpQmxK4+Gs32NxejVWrp9kgL0eUrhNW1dwEvmJV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt8454aK3NyALDfO4IFqlzDDAZxHkiBG8fCPUF8C3nEAQt8zxF
	jwGwNLEFNercHNkGjm2yVmMUG24vYQKlQyY3FzcmzSSSjH4SHpGkjpW9
X-Gm-Gg: ASbGncu8BXlDZ4mSraH0p0l/oZsNy5f67srxCdDn3sISlDtCRBBFA58gXVzHPF8El3H
	z6Tz18AnAQWMChKawVlc9A/SYnj4ieC2Hxq8GZXz6sVO50bnDlN5yDAzDEEMq3pJLa/EBlDnfGL
	Gs9F8uuwpIu8qHq8W7uL/dxojIJerF/zRmtbVRBMTjCbjt2UyY0L+MKpZBLCdWggKKppp20zQ6d
	znadQwK0mCsV/YH5+wfmc7D5SpUAO5vQxwJPoMpXObGzkvHkVWVaZcNo6j8QV2+vGFmlUA8qqJ7
	enx8uXzG0JcUdQilSsv+FhjgXDQRUoHDq5gEE6rqSNEt+AqU7uVTRaszY3qzXEGSpjzwW97AtU1
	oRlWy+xP+z5vOWHdU/f4l4CA9lRqtZslxJeJOcZDKSDDYDxR0l9yxO6IxgI6aFJhN9IyAYY6UYA
	IPe5+yqX2fkzrbcZgIu0VU1hCqyrAynKOgqTyRVDJ7WlsbX21rkuxIbTnodCbWMxXa
X-Google-Smtp-Source: AGHT+IE502KIN4tz1ZiBR1VS+4c/5BDktMXSPvvmFW+gOT8kNcqJukYwWerUdV/VaxRhOB3SKUHsgQ==
X-Received: by 2002:a17:902:f642:b0:250:999f:31c6 with SMTP id d9443c01a7336-290272b4764mr317255775ad.32.1760539160392;
        Wed, 15 Oct 2025 07:39:20 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36738sm199853455ad.87.2025.10.15.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:39:20 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] Revise Meta Santabarbara devicetree
Date: Wed, 15 Oct 2025 22:38:56 +0800
Message-ID: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073921_904125_2BD482EA 
X-CRM114-Status: GOOD (  10.15  )
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

Summary:
Revise linux device tree entry related to Meta (Facebook) Santabarbara.

Change log
v3 -> v4:
  - add blank lines between nodes for readability
  - drop changes to already defined LEDs
  - add gpio name debug-card-mux and FM_MAIN_PWREN_RMC_EN_ISO_R
  - enable amd apml interface
  - add eeprom for prot module
v2 -> v3:
  - remove mctp node label
v1 -> v2:
  - add 'bmc_ready_noled' LED and update commit message
  - add sgpio line name for leak detection
v1:
  - add sensor nodes for extension board
  - add mctp node for NIC
  - adjust LED configuration

Fred Chen (7):
  ARM: dts: aspeed: santabarbara: Add blank lines between nodes for
    readability
  ARM: dts: aspeed: santabarbara: Add sensor support for extension
    boards
  ARM: dts: aspeed: santabarbara: Enable MCTP for frontend NIC
  ARM: dts: aspeed: santabarbara: Add bmc_ready_noled Led
  ARM: dts: aspeed: santabarbara: Add gpio line name
  ARM: dts: aspeed: santabarbara: Add AMD APML interface support
  ARM: dts: aspeed: santabarbara: Add eeprom device node for PRoT module

 .../aspeed-bmc-facebook-santabarbara.dts      | 919 +++++++++++++++++-
 1 file changed, 913 insertions(+), 6 deletions(-)

-- 
2.49.0


