Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96276CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 00:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2HdlAWdjeMiye6hUd5QaqiRVp5gEIQPNXzXyC/HWY7w=; b=3sDEvb+4urYQJLVl/nlBtfH1RJ
	cVNaZ1qNgFrn6gzPAkj75EuMiW/8NLtLnDtYUD6soQCEVH34AJvegVn01CRX++gVcTNqWfMji4lM7
	HWG1QCqPZ4+tz1wi+/MgjsCDlkNJYTCvoSarfU/R90+kH0xy4vgyrofx+HDrNmWQDEO/N8mOFGYhj
	Czcq5RKEc3MKI9zrVN0YxNm0fdY7ewLUcXxdc/9anYSlPxieaNeER+HQmHGhSeMDHX86Vr3LMRWjk
	HEHQHyrXoJcoGHzDTLmXZBlWWj8EJyQ4G2fDl/76g1QhKGWpbTHS1OfvqGHoecboa2UdCdDDnAR0v
	YwgrgMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMxZD-00000000n1F-27ld;
	Wed, 13 May 2026 00:35:15 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMxZ9-00000000n0n-33pw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 00:35:14 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so14844324eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 17:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1778632510; x=1779237310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2HdlAWdjeMiye6hUd5QaqiRVp5gEIQPNXzXyC/HWY7w=;
        b=HpEQgVv3xpPmURGNM9fK8AWkdhQ9h2I2Gthu+rufW4xdH+7gj124UM1tzj5+latJDV
         4+NTOZSzbT+E5efSRCZCNuKH9KnduVMIKc57/po1uNsZeHDzn5BT2Lom8R87BSInjXDf
         Ny+vxRnwCQnHRUNyK4VZlfNBn6MWBrDUvTt/O4DlMyHCtKxuUt0lGIdZz75U/YuOMs3u
         EX7pMh5ditUrujBeZW08gF9K4dKcbsdbj1Yk9NbE9Apcvm+Nz84OLEaSd4RXBHVi3WCz
         +wonbxiS4mP/0kcSqwaZUG+2ggTUCmo4z6QJfW5bkTKPND2vNBHDezP/f2l6Y9EURjMy
         +pHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778632510; x=1779237310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HdlAWdjeMiye6hUd5QaqiRVp5gEIQPNXzXyC/HWY7w=;
        b=GfaPfIgY3acTJ2BRQuA30QjoLtXnPRoRZTlzLFFJC+fHK7fj6EvPSE/YhVevFNHhIY
         4anMe9DTzbIX5sX+MAR9qF6aef1VJvDNYYvzenXVLyVOtdkyBmBoMNMmb9j6g2aW1i+A
         kakn5Z71U5ctx+pMtaBGTk1cQKrkeYp/4R/fKBCqVr8et3ixffNgWETGZfkrh/oK9S1+
         CDnIuFcFE1ag1yKffSxwOJWJYTVvaF9dUhx/PVohmLP+//SxE/BMg1naG/Hs7AU1SjAa
         rXtbfpIkPTs1UntTCART7UC+soDNQgFOERf7FSDk8kwHuLw1hI/k7PAPwHiZrYSXwHGp
         mHjA==
X-Forwarded-Encrypted: i=1; AFNElJ+xmpX/9WfpW2wxUl4pEgHayYLug/JNcwRogHp8FUjci7kgU1Bs2cqU7BF7uP3rIgut1ZSplLIvjwL+dKu/tLWa@lists.infradead.org
X-Gm-Message-State: AOJu0YxdvhG7zLOYdw8woQ1a1k9/186WpLJaEB/8rcbBrMAiBAO9fSWI
	o0h6qKUax3w9Hx0M360Ir6b0WZhKilmfKfhkaG/JQ1k1WCcwAC5SvBpBONppQZhluPo=
X-Gm-Gg: Acq92OFhBf1AfSxYuFeYhh1SluodEu5NtcvJLcxG8qksi0PR8dqCJ3JG6ARSETV5D2m
	C5JsU7qORXkvfqSlpCVRGvmKo1fcqpCzvpWDcG+p71HpOqsjVlcFNFJL9HWs1jiS0InyrPvWuZy
	Kl09HS6HvODcHEGqydoLzZ3baTHdgs7mQAFqsK/tcxBh6FmmguSFdKM5dMMrs2V7xsS/Vj8yZdA
	9P/DkYgCHGoXG/gWZT/8thfhfHSpS0ThDTUsfY8a7gyP4S7p64hs5KZv/nOqMTzayirY245X6vy
	WEMS55lZV8BYSTy+Bjbpyak4kqPzUU3S9QbnLpjhE28eY2/dqna8/36zGjAZ3+7dCBPvX1VmwSj
	8L++2EVB3P2IoYKeT2f45f30SbcbU1zbSJY+EGLM5/5tNkRbsig2y2jF9JROYbeOfE+SMCV0sF9
	MgyHvwau4+OIrejkZujurp6vo7biWvzluk9uCSeWWcCLgmMtsHR+Z2Tu0NR6AphIDPZ1FE/8hIQ
	0TwMPqOTmaTwAzCRPO+sKrZLeF3ZKyzfT5/CsaRDlzKRHEy
X-Received: by 2002:a05:7300:b586:b0:2f1:3aa8:f2c with SMTP id 5a478bee46e88-30116e980c9mr798294eec.4.1778632510419;
        Tue, 12 May 2026 17:35:10 -0700 (PDT)
Received: from gui-host.Dlink ([177.140.77.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm18471381eec.0.2026.05.12.17.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 17:35:09 -0700 (PDT)
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
To: anand.ashok.dumbre@xilinx.com,
	andy@kernel.org,
	conall.ogriofa@amd.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	manish.narani@xilinx.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	salih.erim@amd.com
Cc: Guilherme Ivo Bozi <guilherme.bozi@usp.br>,
	Jonathan.Cameron@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v4 0/3] iio: adc: xilinx-ams: refactor alarm handling to table-driven design
Date: Tue, 12 May 2026 21:31:49 -0300
Message-ID: <20260513003503.339418-1-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_173512_291684_4B6CCF79 
X-CRM114-Status: UNSURE (   7.36  )
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

This series addresses significant code duplication in alarm handling
logic across the Xilinx AMS IIO driver.

To address this, the series introduces a centralized table-driven
mapping (alarm_map) that replaces multiple switch statements spread
across the driver.

This improves:
- maintainability (single source of truth for mappings)
- readability (removes repeated switch logic)
- extensibility (new alarms require only table updates)

No functional changes are intended.

Series overview:
- Patch 1: fix out-of-bounds channel lookup 
- Patch 2: convert mutex handling to guard(mutex) 
- Patch 3: introduce table-driven alarm mapping

v1 -> v2:
- Fixed Fixes tag format
- Replaced AMS_ALARM_INVALID with AMS_ALARM_NONE
- Changed alarm_map base_offset type

v2 -> v3:
- Replace 'i >= num_channels' with 'i == num_channels'
- Add missing trailing comma in alarm_map array initializer

v3 -> v4:
- Removed unnecessary 'event < 0' check for type e32

Guilherme Ivo Bozi (3):
  iio: adc: xilinx-ams: fix out-of-bounds channel lookup in event
    handling
  iio: adc: xilinx-ams: use guard(mutex) for automatic locking
  iio: adc: xilinx-ams: refactor alarm mapping to table-driven approach

 drivers/iio/adc/xilinx-ams.c | 190 +++++++++++++----------------------
 1 file changed, 71 insertions(+), 119 deletions(-)

-- 
2.47.3


