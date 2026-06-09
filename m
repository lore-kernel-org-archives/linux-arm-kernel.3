Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE90DCD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GtRmLzA0ZT60bBVMGm4lGXTRSY/cD/E4T6nl5lxjKr4=; b=v1ybDQe7Gqt8DAG4JPQGZe0XLx
	OGpdbvf2S+Yk25Vs6OPICnlV1jNbK3FNPDwbjTXMzUyh3ecwYPOtMKeulvGM1uXoztKqy8ZHVnumf
	Sl9AZshPGyf2Lrp/CpTjlkH6KruXj/bIVHrewsWWnxujopQlhe67ukYP5ovN3DTwL/ssKHmylmi6T
	DSKt4RnVmr53bGig9pKPEdn7S7XX5N2l6+rY1DpYw3+bxFGf04cP8mWbubne80Ek7BVYOKSmEYRH1
	+9KVA6zBvM26xGB+8oQNZnqEJGcW36E4DonJ4sZ4n5uHjyn9ISqMPAv1phYENNthSN/2/Lu9/fWkq
	bPb4U38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt8n-00000005GWZ-1Xu6;
	Tue, 09 Jun 2026 09:53:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt8m-00000005GW4-1Acp
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 09:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=GtRmLzA0ZT60bBVMGm4lGXTRSY/cD/E4T6nl5lxjKr4=; b=MOUey+GVN1MrEDpCCp92K79q1U
	slNr4cLkoQMK3EE9SBXVHchqXQqlZF5ATI5MVC13VWPin/2QWJFO4VBL84K08kmQxizfhMzcvapex
	4QqqVqgMFz2CzI2TtC0UEuKxzAOfhxBCaJ+rXwjOQMnn4rZ9DzmOgCgI/HHrFEig64Ff9LtUFD3Uz
	htssvDCLqHbONjELGIsVfMjgtLylhyQty4KJXB56jqhwEnwpWpMmGmYZr5GUXMTNQeEXb2lE2D4NX
	82WB05UN/a/COQvREs47EWRkikJ3okQbDN72QpoOf03ynOuFK4kJDouFat3NVDEkiurwtmQ8B/b/g
	QNlTmijA==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWt8R-00000002HR3-1f7i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:52:55 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so2727494a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998755; x=1781603555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GtRmLzA0ZT60bBVMGm4lGXTRSY/cD/E4T6nl5lxjKr4=;
        b=huXjCJWFHAGhKLaM2gT8CdUwsiaTAqNGguVE0RRMWO3B6qbbsuApN9AJS/cZA4H0OY
         TE96lCodB5R23pwjrOe4coYhZvfVxkM6QVN1fNN9xYo1MgJsPlowKnx5Eu/LH4yh8BZC
         eIq1G0vhP82TADeR8D3QQRyysIkFGpmIvjUZLqsL/HUwVJRA1URK2Dl4DTWKzXRFF7++
         G32xaWJ3/DyOzgXArLKG/smChG4m1CodvfOL6ee52uPRfUzOL4BHxrNlKgNf4RkN8py8
         Z/RkQyboSxlG7Fig7NXpRvJYmQp4pEX6XBA5/flH4e2lXD1ajtXDoJRFrqvAV0glmYxf
         muFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998755; x=1781603555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtRmLzA0ZT60bBVMGm4lGXTRSY/cD/E4T6nl5lxjKr4=;
        b=JumfKxy+LlNhnLAzDeBW3EKtXUJnyfXz45yP+xCVdHNnmOD/qConMlRLfBwI8ZZjNW
         4KkKVCFHVCo2PxsOIezFEpclVX0IkpCP61s4oVogee5LETYscc2R579+FrlsA9Q3mAZq
         D71Hr9+5VwLnUazqymdWEu6VOInlglJPoXb5Ii7fVwgZlaOQyXLxLMuD+NB0KuajLsSA
         SJ5AU0dx/LOA7nltpBLmT87DzfaTejhcW5zi3Zyfnb7WOwNeiwrdzjQ8nNFGJbsJz+T4
         RMmD8UUEMQsDnrTaudmhff7UWRRBTIaO0XMOCFJXVZu2cPJjIyNQg2Rs3h+6WYRjtLcZ
         Qk+g==
X-Forwarded-Encrypted: i=1; AFNElJ/1m4Z4tCkfFZZCOMDcyqi3lag5tld33Gotn5PHtxi6s8OYb98Y+ffTCN9BnC8aQsL0If4ND2FpnF/8E+MOdcry@lists.infradead.org
X-Gm-Message-State: AOJu0YwcELqTD4Hn5GyNs/WGSBG8Zaci6RZclVOepog0RRUOzMc6dNsP
	WEdYwS65Vwjokws47bUFWKvBeen3DNHLXvQhHG+4OoDZw7PtvmSKSfir
X-Gm-Gg: Acq92OHr3JF4FPSuzH1R0C6AUt2DrbGixnA6J7aDPL3XHv+Fnl/6aKotNclCt53Meaq
	//ThoGkVsEms2Hq4nehlx1t+xN3VQJ8h2rPpyB/zB02Cer+/nrMUPtgMTYjIWV0NuZWrHhllqP3
	2xBpwCfeRma5Fz2lDyoTXj2UQ+iq1WTPDwaahhrhpGnLvI9DCXyntkfMktaioGFQW6kZ6yviPBL
	E/EyzIP6mK9N3UgRZaZ2IL7hz/o82xzsZI/CsVBOAzSSrmqAd/jHxnnmAoM19e869GLS7PVPKIx
	PnwgvBGOwAxY7zYX9kcjBagSQUN8VNW2df4YzU+JkSs+fRnxBi8RITD4VSc+LHofq5fqn1ZiJzf
	CndyqlzLMzHH/VAJicEyLDBgVPeU9gXrD9IMFYOeQTHRUjGOKk/hcGx0w+w984GwTg97IYlLYEZ
	zi3v9xS+5SkDlHGcktOWzUueQmJaVGwS+k4YWBPxSbIW63un4o3Ckqvhcxfb5Yqy/viOv4KyGdm
	m5N0tRyMxrbR8bPavgWesAAX+fBKBwg3N/kR41QgGbFKBr/yPsXFw==
X-Received: by 2002:a17:90b:55cd:b0:368:ac5f:d31b with SMTP id 98e67ed59e1d1-370f0770bcemr20382207a91.24.1780998755286;
        Tue, 09 Jun 2026 02:52:35 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3713346cd9fsm13185172a91.2.2026.06.09.02.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:52:34 -0700 (PDT)
From: geoffrey <geoffreyhe2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 0/2] soc: samsung: exynos-pmu: fix of_node leak and refactor regmap lookup
Date: Tue,  9 Jun 2026 19:52:22 +1000
Message-ID: <20260609095224.1706036-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_105254_282281_CEB55291 
X-CRM114-Status: GOOD (  10.54  )
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

From: Weigang He <geoffreyhe2@gmail.com>

exynos_get_pmu_regmap() leaks the device_node reference taken by
of_find_matching_node(): it passes the node to
exynos_get_pmu_regmap_by_phandle(np, NULL), which with propname == NULL
uses the node directly and never drops the reference.

Patch 1 is the minimal fix: drop the reference in the function that
acquired it. It is small and safe to backport.

Patch 2 is a follow-up cleanup that factors the shared PMU-node lookup
into a helper so that each public function owns and releases only the
node it acquired, removing the need to pass NULL to the by-phandle
helper. It also makes exynos_get_pmu_regmap_by_phandle() reject
propname == NULL with -EINVAL (passing NULL was never a documented use
of that interface). It is a cleanup only and not needed for the fix.

The leak was found by the static analysis tool CodeQL. I do not have
Exynos hardware, so the series has been build-tested only (arm64);
runtime testing on real hardware would be appreciated.

Weigang He (2):
  soc: samsung: exynos-pmu: fix of_node refcount leak in
    exynos_get_pmu_regmap()
  soc: samsung: exynos-pmu: refactor PMU regmap lookup helpers

 drivers/soc/samsung/exynos-pmu.c | 71 +++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 28 deletions(-)


base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0


