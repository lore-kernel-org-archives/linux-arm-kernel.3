Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1E0C44515
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 02:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+NUPIvRLKWSiPc+3XpkKDvMYecUDiomRS2Pf6sjZ7Uw=; b=ORR6245EQEL/EfprEdAPlzxpo0
	9qsUY8HADOuJY//BppHYQThd2qlQ38ljfCyTO1lJD+UFbMgtPNMW9VugfDGdXnxwJTRSfKdTUqedg
	Zlbew4/LgqdGVqxSRUl9yhP11i4FyGu3ASoCYYEBsAiHiO7gW2yAp2DcHZC0fafzehpkmmrGsHS3j
	87bV2ZRrLg3wL5627WdwZalKb6jsk3fTqBr+iFUocEtqP6VxzarwtLgDwb8ZiFCVvMIrGSBXLZekA
	Q9fC4YV9vgozX6JjmC0Q5/GNBxzbHGKgXP8aSkUhe/VUrvRU2IuMZyQ83QeO53XnCE0gpHCbojXuk
	UXQKTMEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm00W-00000008E98-0LDO;
	Tue, 21 Jul 2026 02:14:56 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm00R-00000008E87-4BQE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 02:14:54 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso6796156a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 19:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784600091; x=1785204891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NUPIvRLKWSiPc+3XpkKDvMYecUDiomRS2Pf6sjZ7Uw=;
        b=iORbEN3ZUlWvPu/tltWknz5A2QAeP/5k12o2PyYRMjq2YzkP3X2ioBrBqAcVIC56KQ
         wnnMNz3N14p53Pji6P8OMblFez4N4rkb7Lta4FzLI3c+2eFj/kkQ5VfpskQPtbYIJdVH
         cvIvCwir/GfcAEgKDVTdpNXnjIF34o9g/Od0D736i275RjmnY0XK0zsdTK6iXvrLuYIq
         gEPfDX79aSPVRDpI1wXq4DbmdAlEKNwSxsi1gx+huFT/j3IUnQ4UMJ+HUb+0/RxRj+rJ
         uobRPae6/yztqJp0ueP/OC3RCv34bUJzJp2U+X7H5LQ8AJYpm4V1fbg+XhDnpwteuUGS
         KFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600091; x=1785204891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NUPIvRLKWSiPc+3XpkKDvMYecUDiomRS2Pf6sjZ7Uw=;
        b=JkOp0h/61W0xSqfBQFO5MGOWSOSvbyUn/U+akzliHGh3jbqY/F3y40BeWEn6W19vbi
         awLV66mPnt1pbEebiKA9TCcz/HE1unACPN8+mJjY2wzcxWlORId3JeRRw2eY99SroBOH
         /01xYcy0Vp3JnI3SBAooOALZgxyALlv31MZZx66u5mnKurRu2Z/hhLdYeECBT0vr4QBJ
         bo0fdfLJanOmip0QqREV/PSvzqCHofCTZHjurZz2TWOjeu7uuqe8V1+VkyMg26eAW2Ex
         xInsgzyFog61jFcsQ40AiGDtHM6r9ggL5y81HtQO1eunOqqcOLM6UG4K6rdACeTnv0Tc
         scGA==
X-Forwarded-Encrypted: i=1; AHgh+RoIwPEu6TJIRM2aQ1QszpVhAQQAx51T2lY8bHwf3XJZm5zIUSbEhphM3iXUw6wszs72LJtuf6EW1ngwnGzr5bWf@lists.infradead.org
X-Gm-Message-State: AOJu0YyZbny/5aQvzsqyIzRUcACVngQB6uAvnlrH8pOVO/m9L+DQoH2E
	L8Bx/I1IULw/dsDYergASOqQZlDRBJ4724I5OdSHLq01mq9HTTaOroFo
X-Gm-Gg: AR+sD13M6IQwTfTJ4Ln4LGYFdfRIcj52OqaIJlJyyHpgeVsRXviUGIPJOh2zWBhVB8/
	+i8n+mu4KjDTpbel8y4nDU6fqhl1Nd/nA+p+yOS2WGzvPGbY5929vKjcQIXFHI4zbnzgsOMpgIC
	OSmm9SOV3XHUhoYePi6TjiK6f5u6RiqgT9fcqtTC6lfTX0xr0aYp23HEAERm3Im/3zaOVWhiEcV
	xc/m/dvH0+HOCkvx2uIpN+gipkFiBSrWxk4UANEe+8W/wvbN7UKpruQfduKXtja8LjdzWot9gAZ
	qJoo5XQTFkRGEmfsvDl8ORTH5vpFIniI9bkliJMfBRW0TGvZOyTEyT2caoBNYf/yWfWFpwU4nfh
	EmWZI7BtXzIK3HY/HHRG8+8+yAnjZAiFdQVOZ7KFi7cGMilan3/2icCwZQq6h+UlreTE1QfnS0w
	11B0gql3W80WgzW/LK527fJ7v7LU70fOAaA98v2gJLLMCP7Q2OTdfnkvacVCdeC5o=
X-Received: by 2002:a17:90b:5905:b0:381:23d5:693f with SMTP id 98e67ed59e1d1-38e4b534bedmr16004770a91.28.1784600091023;
        Mon, 20 Jul 2026 19:14:51 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9235a4dcsm586241a91.12.2026.07.20.19.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:14:50 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v4 0/3] clk: nuvoton: ma35d1: fix PLL frequency calculation
Date: Tue, 21 Jul 2026 10:13:53 +0800
Message-ID: <20260721021356.288506-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_191452_034762_8AC4AA3E 
X-CRM114-Status: UNSURE (   9.69  )
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

Fix four bugs in the MA35D1 PLL clock driver that cause incorrect
frequency values returned from recalc_rate() and determine_rate().

v1 combined all fixes into a single commit.  At reviewer request,
split into one patch per logical fix:

  1/3 - fix div_u64 return value being discarded (affects both
        ma35d1_calc_smic_pll_freq and ma35d1_calc_pll_freq INT mode)

  2/3 - fix PLL_CTL1_FRAC mask width (8-bit -> 24-bit) and update
        the fractional-mode arithmetic accordingly

  3/3 - fix ma35d1_clk_pll_determine_rate: move find_closest() into
        the configurable-PLL branch; unify read-only PLL handling

Changes in v4 (vs v3):
  - 2/3: add Reviewed-by tag

Changes in v3 (vs v2):
  - 2/3: replace the manual round-to-nearest expression
    "(u32)(((u64)x * 1000 + 500) >> 24)" with the kernel helper
    DIV_ROUND_CLOSEST_ULL((u64)x * 1000, 1ULL << 24); the result
    is mathematically identical but more readable and idiomatic

Joey Lu (3):
  clk: nuvoton: ma35d1: fix ignored div_u64 return values in PLL freq
    calculation
  clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field width and fractional
    calc
  clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic

 drivers/clk/nuvoton/clk-ma35d1-pll.c | 38 ++++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
2.43.0


