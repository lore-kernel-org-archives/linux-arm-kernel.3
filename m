Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D8BC02196
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 03:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UYMUDf0U+sam2c6CFInFyZHHseSO9b7zpf93O7tAZgA=; b=B73Nw7+GIRrKh69LHwN/Ee8OjK
	qBOkNVMn8zpHnaVaRmANSaBuWo7aNgW2El8E2LL7e9HlumNBhgVXcjgRMezT9bRv+/hu0tRKMRXUH
	4gomcWmzCT2shIrh+eivSC56D2e1tyqraxbe1AvT/KyJCd5tTgJqiOBQjxZtTSpxP8Dwm/PHjvgsC
	1DT+/KwMBczuu5kmm9QVKngeFdFC30J5qvk4CWiXwFh54SES5MggmNfyNLPLw4o86X805BTLIeny1
	jHVPceYXVIEDjr464lX6sLFAXmUgbIPoZf0TB3LpIoe1NPamZBlObh/sBuo6G2FHmo1vEcuMwX8j/
	EmhuCGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVtT-00000002Cu2-1SEs;
	Wed, 05 Feb 2025 03:16:03 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVs6-00000002CgI-3wh9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 03:14:40 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2165cb60719so114901425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 19:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738725277; x=1739330077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYMUDf0U+sam2c6CFInFyZHHseSO9b7zpf93O7tAZgA=;
        b=dpCmwpn/EAhe+ZTiAfVHhnLoXmHq3GS19gV32RU7jZiStu38jKqjfcRXYH9w5Q/p3+
         q/EcV8I3WYUxuaS/XzF71QzyNDldNXfKnBXoIcNcTpvWs1hC+/076v6pTuusQ0KArJkU
         Na6nJ0zFqLvwDVV5C8HdhMcgUoU9r6B7tVlx0JNyduW88ZfbW8FHmUQDXGeoHFQADP0J
         QA3eZmA66S97lxuhpZxVpdJaSd6EgrD61aeOdBKzKn66KC6nIzwVOsSRTFpXT5f0kgAJ
         HcB+q1oMXjC7/a2VERchIXcOz2rIpsuWyZN7QVncMVfsg1oIB9bmlxcCMWMxTybMM9u7
         fecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738725277; x=1739330077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYMUDf0U+sam2c6CFInFyZHHseSO9b7zpf93O7tAZgA=;
        b=iB3equrIkAH9/iJeKYNc2M3sPHxczEowm4TcO69Jsjn/6pgpQa7UqRaM2z9ky2JqPQ
         A7U9pLC2fQdBuHh4CyX89pa2o9XPQnMfNcFtN516r9MRpd9m6Y+l6M1izrqw/Kx4PZoV
         J/Aq4hcgh4aqaMpLFtvtQp6hkzw0+LErYiyCLW5+PPwfwwdNlTqELd74uXAv9uW1xSa2
         FIP7PaqXFfcyOxjtVN5Yt6QvjNSzswywSfSJilii3ktXIjpaxIjeJUAJVkkYNQtsoaQN
         SaiuzOtrweRS1YZRPos5swcx9OzOHmZLnQVn37BjDB52Ccg0UJZaUlRyX7zwRzsb0/Ey
         RAmw==
X-Forwarded-Encrypted: i=1; AJvYcCVNWhnnXD+QSg0WaW2rkyNjdsE3ZWeO25EiPZRNLdGCr0A/f7SVPBewSisvriNFXE3gV6sAi1GpWsAMv7YgBTbV@lists.infradead.org
X-Gm-Message-State: AOJu0YyKwYRa2EpZAeKGFBzqISYijw0Cv8VDlphWpKtaNtDeINfKKfOs
	MWZMBhAmMLeM6QrDHfl2sNwUqaSIov5hvH2IOsBjmUxLS9J5R5TTCN20Uc6ygk4=
X-Gm-Gg: ASbGnctX7EJlY4GazsSOFs6nMwm12R9M+jQ5MAIWDdhkzRytx53iex4LhCDtGtTuZzt
	8cBL/0bRbP3xNVWoQNh1INgf8Jp1OYz9YRj+w9HxwS3J46qFdPANqa04wg1hsNkIE2XB4JfWbOV
	NaOh81fvVwVAA3n7Z2t2sL7OH0Y3c0258vBYEsQmQ8B/cAQvWoHDNIZqFeyfk5O7351gZFNbL17
	DBd5aL4mTSZZWwc6bkhLXQuQHI2UvakSfKyS6h5DkExJbCJPy1T0/MJmvttSWs2Weu3o7ULRtBV
	hqpsZ3zZK+izitFvzh9kHh5UTDNe+PTxkNifj+zhBS80CJ6UfQ==
X-Google-Smtp-Source: AGHT+IFDPCWHUwtXqg+k70YQs3UcC9V7LP3BF4/Ea4bhDSCyvX6XTQ9pdwUU2CcxAcZ+siU2q2RAZA==
X-Received: by 2002:a17:902:cecd:b0:215:83e1:99ff with SMTP id d9443c01a7336-21f17e48cf6mr17420455ad.27.1738725277309;
        Tue, 04 Feb 2025 19:14:37 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de330342asm103509115ad.193.2025.02.04.19.14.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Feb 2025 19:14:36 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 0/2] Fix dwc_pcie pmu driver issues
Date: Wed,  5 Feb 2025 11:14:23 +0800
Message-Id: <20250205031425.67265-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_191439_087834_7B7B4611 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
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

v1:
Only sent the patch titled "fix duplicate pci_dev devices".

v2:
1. New patch: "fix the incorrect reference count".
2. The "fix duplicate pci_dev devices" change is made in two places:
One is to remove the modification of the PMU name. The other is to change
"for_each_pci_dev" to "pci_get_domain_bus_and_slot".

Yunhui Cui (2):
  perf/dwc_pcie: fix the incorrect reference count
  perf/dwc_pcie: fix duplicate pci_dev devices

 drivers/perf/dwc_pcie_pmu.c | 62 +++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 19 deletions(-)

-- 
2.39.2


