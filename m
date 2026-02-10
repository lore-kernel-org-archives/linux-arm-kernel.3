Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661A7EA3F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3tE87q+qfGSEa6Oly0BwPABhpAUQacJ2LeCqBjkgvs=; b=H7jr7zXRM0SpXcBMPV1ITsvqLO
	1/GLOpGeNHt/FSQhs5ZOUoBzDFhqEVEDSLcf+btuoF5oFyevCoXmFSi4WbdGH9p4gq5X01zF5gtDy
	KW1huA/CCfmxrfKkCpsSsnmNUpvjnAOJuLa4QF2Zf/Kmx9iWczbUi1X+2Iu/we2YmaNiX+z6Q+hfh
	IAUIGvt3S7t3MFlXLgsBzQFTKscClnLDPzIUEORqa1SpNCTvlvjOtTMestBzB2IJSl1x9ygad5DoP
	HyFI6l/Xm81dCzBK6wgqMk9d8oo75MBVY5plGz9iQiUgSeuDhxTfJwsVzRs3vf6zC85iCsV1yvP5E
	j9dr26eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUh-0000000GU6C-2fua;
	Tue, 10 Feb 2026 05:41:03 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUe-0000000GU1J-0bMU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:41:01 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-8c6d8751c88so548333885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 21:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702059; x=1771306859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3tE87q+qfGSEa6Oly0BwPABhpAUQacJ2LeCqBjkgvs=;
        b=Au/y28rXI+CNXaEBwD+6yz1U0dF4n4CFNgfHIsh6aZBKYITOhs9RU4I+3N3Q+FjYzi
         Hbt6tC7gm9ZZivxduhb0RnG7ZlF9tUi1VLNETNvTMLL4pPrIRgSp/VnIHH8Vvc3ukrTj
         Xqpijljkf2Q0zH+oz2UdpagdRb6KVHDWHXkpQOG4DxilS8OAYWxXl/TngvbvHxY0+/KD
         CISfoAzzzfH+FgMOF1eJC9fX3t1LfJh4BDn1i35dwNBf2N3CvRm/MQqPxQ7qRUIsGGtb
         E82FIZhJ49ay7SKT7WeDknOz7NRYakrN++oIPHGzUMMMxQPYwEBOlCMXjQTYqJCAIq18
         x59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702059; x=1771306859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3tE87q+qfGSEa6Oly0BwPABhpAUQacJ2LeCqBjkgvs=;
        b=Hpv7pYB7UHxjPot4nL0Q1L5OuO6gZWG1P5z4Sd2U4mMI9Q92HRjWVCpzEg6EfmAjO5
         rXPOVcb/drj7DQUkyzxP5sPsoUxJph26NnUlqcq3cFVWpF1GK4pWRj/dV8fdbC+3IIBe
         hHU499c0KhI+ptSD1KberajbVDbTSgaro9pZhlNtImE3i+LyHZNLNxM5srqPx/3pVtDf
         Rf3SmRc253rm7Ssf8nqtzDcVy0AWW/eEmpWYLxtF4TtAQnnbBrJ8a6PLkw/8EL7I7GD2
         IW8I3QKw1f065JKXU7lv9Y9HJ5n7bpBEMMLZyUAKCZdqOzKHjZYez9o3QmBiemsVsNMa
         tYAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNmSJqfqcVuRWJsz+paAKkT7nG5KfLiOoYguvWHC8IbzSdKTrJcrejGib8z9QgbDEvMp2jlh9Y7TELObV/YPP7@lists.infradead.org
X-Gm-Message-State: AOJu0YwzY0lLyKc+OqAtRMOGobiT+h0VJFy54AtPST1aO4KmqJ0Gl5yd
	a8aXb5zv2ng/ayNZgkVV/5DYprmwFDFIozAKnZ9OhfkDPlLMHOrjw6oo
X-Gm-Gg: AZuq6aJsseUgVx42gQfPxyig6YPXNFQ1WNYJRNhiRv6xjWGJvodRru1aukPYkgvqeE5
	CvjvdV+FxTpu+Q98mZQdrzv7oRDzDGJpTFAG/LjWeI73qDn7KqLZa1bqCgsflxt36NBi+6c/vfz
	98jvaAQUTnvl9f91A4tOG72xmc5Z533eYq1vWT4Ay1fMwwwSr8Q8EaamN+MXpZoc8ZyJpxVCXn5
	hlKrL4C+bv+hYTvBKd+KwOnfIoohAFz/JPvZeatGl11z6cwMwuPqQJECaT6S9wPHyto5Iua3vi0
	hoEXs8FU/tOGYdyAk9mw32fDRRkmEH4YwAMZltDBld8am2n0sNZ/Y6LyTMF2R0wtTcydQUqybnI
	rSFwoOHuLqPgMWyYnSYqN10KF5Oe6XuiqoVBAKrapkkuEF1TfZy6Ii6ZMxQ6ZNnuz8MTs9AFfUD
	bEgPxSkGvEh50TBp+95MgYfpEWo3Dcw/UavnZ3D5Dq2GBT9MotpRIFGAh/C/IuCBcl+5LvqGFFY
	w==
X-Received: by 2002:a05:620a:4041:b0:8ca:305b:748e with SMTP id af79cd13be357-8cb1f6ec283mr118885285a.57.1770702058705;
        Mon, 09 Feb 2026 21:40:58 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:40:58 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 4/5] regulator: mt6363: Fix interrmittent timeout
Date: Mon,  9 Feb 2026 23:37:04 -0600
Message-ID: <20260210053708.17239-4-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
References: <20260210053708.17239-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_214100_310072_698031EE 
X-CRM114-Status: GOOD (  14.70  )
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

Sometimes, the mt6363 regulator would fail to initialize and return with
a TIMEOUT error, so add an extra instruction to wake up the bus before
issuing the commands.

Fixes: 3c36965df808 ("regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/regulator/mt6363-regulator.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6363-regulator.c b/drivers/regulator/mt6363-regulator.c
index e0fbf92e7685..03af5fa53600 100644
--- a/drivers/regulator/mt6363-regulator.c
+++ b/drivers/regulator/mt6363-regulator.c
@@ -861,7 +861,7 @@ static int mt6363_regulator_probe(struct platform_device *pdev)
 	struct irq_domain *domain;
 	struct irq_fwspec fwspec;
 	struct spmi_device *sdev;
-	int i, ret;
+	int i, ret, val;
 
 	config.regmap = mt6363_spmi_register_regmap(dev);
 	if (IS_ERR(config.regmap))
@@ -870,6 +870,13 @@ static int mt6363_regulator_probe(struct platform_device *pdev)
 	config.dev = dev;
 	sdev = to_spmi_device(dev->parent);
 
+	/*
+	 * The first read may fail if the bootloader sets sleep mode: wake up
+	 * this PMIC with W/R on the SPMI bus and ignore the first result.
+	 * This matches the MT6373 driver behavior.
+	 */
+	regmap_read(config.regmap, MT6363_TOP_TRAP, &val);
+
 	interrupt_parent = of_irq_find_parent(dev->of_node);
 	if (!interrupt_parent)
 		return dev_err_probe(dev, -EINVAL, "Cannot find IRQ parent\n");
-- 
2.51.0


