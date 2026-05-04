Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92740FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUsuLRSeuIGkFfh6WNuAvk/R1MMvm5m1C1zWcRocwNE=; b=qfcvsWA6XX+clxl/k9/wEdAIFW
	3ByYe0KStCW8Gpvr6t82UA8xojwrf71/ITTeS5GAe+4EvWwl8g/M2KrsR2p5/IXZUXf3B6chg4QgT
	5Qa9UQuHdmW5RJUX61Lu7mWNK9Lxn4Oy69yBOANRmOJof1RUxYT63ZKXHDqZSX4WEv13Qa0MJ61n7
	bOsHIPmGhw/MjNaLovJtBpXOOB812spW3YI22fx3ipXN3Hk2+hgRkt8vTcBK3REnU/TMzwacqVKkP
	OFd7tIWHJ7eQvlNTlqwSNsI2XoWrMVf+aPedy0qQuoI9FHHBu7CPCsWt5cvPq8uCc35PBQn+wSrHn
	S4NQ8WFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqEW-0000000CsrE-2xsk;
	Mon, 04 May 2026 10:09:00 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqET-0000000CsqL-3Dnx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 10:08:58 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3938cc204a7so13099101fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 03:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777889335; x=1778494135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUsuLRSeuIGkFfh6WNuAvk/R1MMvm5m1C1zWcRocwNE=;
        b=aS6izmTibCjEVBa9CkuxaFV/SY4BWuSVBTz4hP/tjvBaP2CTXlWmlemSzfS1+jpQg/
         X8feuJiXhoxeg1Cl0G24hqlip4fQ4IhhChV8pWfJHRrxdRdgkeYOQ+/1g9L6WGE3GGtu
         i90hsUo4aWPMSKDTx2eqKgkvn2g1HzPn4OoHFw3NfrHileGt85mLAuTxg7+qE4EFN7tx
         7+ByEhiDidvnxYM00wYGh5BjsQdrVplrMJhxBF3hiwlIPFTNUX7Aqsdqfq8+eCKqtxAB
         6Z8R+yC3bKoCpQtiCeOF/ZtAbGWTjxQvb20sB8qapj7K43OdCWMv+9wODkqExbiOkI7Z
         4Bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777889335; x=1778494135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fUsuLRSeuIGkFfh6WNuAvk/R1MMvm5m1C1zWcRocwNE=;
        b=YDKaQ8VdxvlV2E+dK6JysVdnGRGsTKmh10ai5q3IEBLir4uS+PA5JZI9AQPxoBenNC
         MfFiPUYH0gCQZPIY34+I6OlfpX0SZJ+sMjZ5hb3thpphP89Im7EELCCifzPOEzcxgWhP
         DqGxho4QHaFep/Ks3HJeS+FG4d4oNFcO2c9eceQEC8idHPMybErli8KT4JJM+6YxnsWT
         OS3Cypa6raUbL/VUk56DUu3/DoQ9WPRInzALOjG6wZNxxxV5+Haj5p853Q6JpNH6fQ8F
         wT0YyAUUu0pPZvPJW9qFeKEu1DkpJAQ/BFNojlwitYKK6igEstaLQBqZMLnEGTFziqAJ
         oAwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+u5QtF4V1eIbWcDcdX2rnbQpL2g1kQrM1L9L4pUukUHkrVqK1hGT7DTWJNJYERgcKQqKTCUzmOveWqFpS6gw6W@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ5BluLrghAy4Ka+asqS/Mk/GEwLljcP+4sRbJZ5Hd9D+rmpOe
	4FEqJ0lNUkkF+NMd+W0nLZuSaVNGRX2bW64jAimINXKl7kFLFWWxWk7F
X-Gm-Gg: AeBDietiGomslKj8mQZYgAU5bDllfUfE8yEp2odcRAfgURNOtgzCMQ4t3juPrTtSTnZ
	5MzRh5/ZcaBhEoJ8HQAa5ptJLK81+udj88tfDX8dd8uPv4KJZwE/m1BzANZR41YvsG0TkVGSIDT
	1J5yHbdWNBRHhTFpBSr+oikY2t+W79ibCafYQUNAq+FwCmac1uNkQVveXwugEPdaYYYFSF1FWf7
	38FbwcXLAJ3vQqX/V/2a9202CsF2NSqlLw9QBwZGo5SLmQmVSluR1kCY3z5WPvpW5rg4A+sOEcO
	LtoxxmSNbEtjCe+zLQYB0QcNyOAg09EJqBKOMmibCPEMeu+My2Kt/jcBH2LbPxfsxwUksNRC3tB
	CJ6ZZG6fmpMRN6dl+Da6PxhifHJmhDODWLROdBKYYX4WlcqldkyRVM/4H1crW/KTK79hbuxB5Eg
	CMGVKpoeC9rE8osclLQhFNG7lpdivW0sWzD8R7Rjs+KXET/0th/DosdMTV/ET05tvi+SyJP2M=
X-Received: by 2002:a05:6512:3c8a:b0:5a8:6ba2:225a with SMTP id 2adb3069b0e04-5a86ba22265mr1869874e87.39.1777889335210;
        Mon, 04 May 2026 03:08:55 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86645ae7csm1979099e87.79.2026.05.04.03.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:08:54 -0700 (PDT)
From: Vastargazing <vebohr@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Vastargazing <vebohr@gmail.com>,
	stable@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 4/5] perf: arm: pmu: fix reference leak on failed device registration
Date: Mon,  4 May 2026 13:08:46 +0300
Message-ID: <243cb3737b41fae32a09117c17809a210395e69f.1777889235.git.vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1777889235.git.vebohr@gmail.com>
References: <cover.1777889235.git.vebohr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_030857_883693_D8E436CD 
X-CRM114-Status: GOOD (  14.18  )
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

When platform_device_register() fails in arm_acpi_register_pmu_device(),
the embedded struct device has already been initialized by
device_initialize() inside platform_device_register(). The error path
unregisters the GSI interrupt but returns without dropping the device
reference:

  arm_acpi_register_pmu_device()
    -> platform_device_register(pdev)
       -> device_initialize(&pdev->dev)   /* kref = 1 */
       -> platform_device_add(pdev)       /* fails */
    <- acpi_unregister_gsi() called, but kref still 1

Per platform_device_register() kernel-doc:

  NOTE: _Never_ directly free @pdev after calling this function, even if
  it returned an error! Always use platform_device_put() to give up the
  reference initialised in this function instead.

Fix this by calling platform_device_put() in the error branch before
unregistering the GSI.

Fixes: d24a0c7099b3 ("arm_pmu: acpi: spe: Add initial MADT/SPE probing")
Cc: stable@vger.kernel.org
Assisted-by: GitHub Copilot (Claude Sonnet 4.5)
Signed-off-by: Vastargazing <vebohr@gmail.com>
---
 drivers/perf/arm_pmu_acpi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_pmu_acpi.c b/drivers/perf/arm_pmu_acpi.c
index e80f76d95e68..c2defbc32ad9 100644
--- a/drivers/perf/arm_pmu_acpi.c
+++ b/drivers/perf/arm_pmu_acpi.c
@@ -119,8 +119,10 @@ arm_acpi_register_pmu_device(struct platform_device *pdev, u8 len,
 
 	pdev->resource[0].start = irq;
 	ret = platform_device_register(pdev);
-	if (ret)
+	if (ret) {
+		platform_device_put(pdev);
 		acpi_unregister_gsi(gsi);
+	}
 
 	return ret;
 }
-- 
2.51.0


