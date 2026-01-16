Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCBEC9830C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 23:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rr1twA4iZh+FcXu79e86gzYn/j7DQvtF/WDnxVBdvpQ=; b=bFNEWahmicL0ULA0Bjo2NzDOkT
	IWtCmHOpKIPzAiHUP9sELANy9SXxsSZA27KiBbJeY0DQnZa9HZQwYgPAFzAPnF7PRMTPreT6BlyVg
	8GRN0idSHO55JnQa+6YYO4zgaNCJ668HLQ8TI6KsVh/hk3RYpEbiXhxLDWz51WBI449xpuUkJ8EkS
	0ILmpP7JeSBYI1Z9/A1tHjawv0bUddY8q4tPzsD46xBSoEXlUG5Jftn5PgMtyjmXi66Lj1BxFEGkn
	8fYZyfAQWGtcV6zbdbkuKi8646GZNirGH9PMgdXk+HH7crA1c3hZ45p70ENWcIHyreeskxljsg6xA
	jcxBfy+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtM7-0000000F17n-1YPf;
	Fri, 16 Jan 2026 23:35:51 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgtM3-0000000F172-2xgD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 23:35:49 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-12336f33098so2278955c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 15:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768606547; x=1769211347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rr1twA4iZh+FcXu79e86gzYn/j7DQvtF/WDnxVBdvpQ=;
        b=aGF7nqJd/5r0K09BZ0V7aJZC7nAY0wC+W0lJ7bi1cg9ZWtciYADw0iGVAIsT9ja9Sd
         XSEtxb9ful4V5iZfRrtwv0ifS7k/i4VEtVcdCIA9Ss6axpOiPf9SsdMjweJi81CPG5xq
         BCkln7Y6yBHHEU5lJcoBxlfV3JKGUh1d4FEsb1jRTa3I6VJnxjltjNcYybDKmc7QlQMR
         2LjThrhEl6KrxFT4bokp1ZMzrFgZ2FvnArHcUJsypGKuoEr3/aaVVAeDizdbTDg4dUH8
         wTxCwFvC3Ufcqy2AG1TnIeoqHcIjnLcjI8LGDT3fqhH8JkHtbj12fooZzMszmiGncWcK
         SEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768606547; x=1769211347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr1twA4iZh+FcXu79e86gzYn/j7DQvtF/WDnxVBdvpQ=;
        b=GPiZRHrj8+4HphgMnft+6rSmfogIwveTDgE9hkk6tlrBOUHkNSJpPP0AWKeARMoxng
         J6wU8Chd+sPpS9s6qCFNZf+d/KSUjcwb8oQwtQdaGXHeBPXrB+01h5N6VBF5GAUg9jcg
         3pUM6baGRHhlZOtbiAWt4rqqB2Ws1FlcmU7OOLIQgIUi8AyjwhF7TD+d8s89qiG9OIQf
         IXSdQfo18N3xTQmFGbEcnLuj+SLZXvb6UAuawJflxRPorvu5enGaMzObyEbSet99lyR9
         +MRg/QTPCC+eO2j8UWrd8QIEM7pC0zqvmMWdYLgprW08TVakutejWFppUGj7LxaVzuIq
         HgBA==
X-Forwarded-Encrypted: i=1; AJvYcCUDicSaWub60LJ9HZ1HpKCea6BTRPxyGFJI773jqYfDzNL6B+o+kkkhG7mfg5SwfX7Yr3pwNFpA/W+WnjG+mTLu@lists.infradead.org
X-Gm-Message-State: AOJu0YyfXMZS9JTzED027FjGEH2rKEd7Fp0Fc1oQ2fgOR2RPd7tSZl5N
	q70adOMj1fSM3pU8AMNi1iDjOTFSHVm4N8wJZj3cV4HuddNOhsQAz+/BWFXbO5sAUZM=
X-Gm-Gg: AY/fxX7gGWVy1GXtZKfBzkkHHqAoxbxBYmUGXsIoa+xYdHz23LzoA4NpHo55065EoKi
	Y57FgN+/g2LWVgB4r3MC2j+jC0Vi00uYm3oRpawiX1L+eU2rDhIaUejXSBIdRlRiemIMklXICOG
	wHxib4u7S402/Bio4cpNVqx+V38saLrr3JSitHTbbbQEC/EeSoF+C/1Ox2lB/SJeYOp49LQumqa
	pzFHVD1SK7VFoPwEUmBQeB6tNyOvt6Wn5qBLPK43oXvr+hG4J2HhJxE6an3velLkdskPrRWUD7z
	IvNrzWoFakJwUcvqqNrU3iDpIl6OVHknGhRkL1bFhyyWCQkhLBEMA0vK4efJQvM73J0SHW4yVBj
	V0lTkjuUpO91Si0uCvWUqvYGTDkzyVhQxX2N5GMztAIttVXsT7wsh5pJhcNnqAoKORUJgij4aS5
	GJ5RF3K+HjAWE=
X-Received: by 2002:a05:7022:6181:b0:11b:923d:7753 with SMTP id a92af1059eb24-1244b30817bmr3456497c88.3.1768606546673;
        Fri, 16 Jan 2026 15:35:46 -0800 (PST)
Received: from localhost ([50.145.100.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4653570c88.16.2026.01.16.15.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:35:46 -0800 (PST)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH 1/3] spi: xilinx: use device property accessors.
Date: Fri, 16 Jan 2026 23:35:33 +0000
Message-ID: <20260116233535.260114-1-abdurrahman@nexthop.ai>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_153548_657183_6541DCE0 
X-CRM114-Status: GOOD (  11.69  )
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

This makes the driver work on non-OF platforms.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/spi/spi-xilinx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index c86dc56f38b4..c4b70e95b695 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -405,11 +405,11 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 		bits_per_word = pdata->bits_per_word;
 		force_irq = pdata->force_irq;
 	} else {
-		of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
-					  &num_cs);
-		ret = of_property_read_u32(pdev->dev.of_node,
-					   "xlnx,num-transfer-bits",
-					   &bits_per_word);
+		device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
+					 &num_cs);
+		ret = device_property_read_u32(&pdev->dev,
+					       "xlnx,num-transfer-bits",
+					       &bits_per_word);
 		if (ret)
 			bits_per_word = 8;
 	}
-- 
2.52.0


