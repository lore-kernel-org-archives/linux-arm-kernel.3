Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D121AC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 01:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7PhdusKrCZ0G+z+XVMqs0STmYqBCbFnffrEyg5UHGzo=; b=Vjy0lqsQQJ4lnQP6bELzTEubbV
	xPJ1whRk1BFJdpDPJkgnpeRC93aytneUClNbBGlCq9/QdHER6q2qU9nrQYKCjsXYnT/3Pg4tEYQBG
	Q1GZLErzu741vXlCbC0+PCA/ynfkhZZ3BKs8g87ddpYHnawb8Iid8emtk+cKl0++adQbVw8Boz2sb
	nVSQi2eIm5d2b2fudaAMjCwm/NXv1XDFDWYJV3jl3/ysEkdoLOYHiOgA3xDx7eKkIO3i4Yre1sCp7
	LuFlugXp5JPWaVK0qY1ZzVLAL0L3Jyzj65CA2ety+8Sw1o4rOisU4hkJoRCX+DoOAjLXZZ6SquQ04
	TFM3Cfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4v1-0000000FLtk-2E4V;
	Fri, 24 Jul 2026 01:41:43 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn4uy-0000000FLt0-3bYd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 01:41:42 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1229232a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 18:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784857299; x=1785462099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7PhdusKrCZ0G+z+XVMqs0STmYqBCbFnffrEyg5UHGzo=;
        b=iWJJp2B5KxisXGAlm98HTJfQtzTt0XUUEKwuHhet9S45cdiE49FgFd8AqpYKsDGC4E
         xfZ4Z6UDShBs06+ce5PcSxbFB/eceURLrmdxscEHcWFziXBn/zjUymo8I1Eg4c36zXXF
         ptIdCh+m7wDzTL5pVYdK1bMOvF/FG5IU+cvQMsX1BtWXjHSnxjNsf4dm0Hq1iEbd2EH3
         bAf4l2w2lye4nacUlaZes1d+6t1tobNo72oRh0BpYtdw3oo9tIDnrI6Fhlxoy1LC6lve
         B87vcTY0e9uyBmB+869S5kPsrFVxYMZOYY1/RMXNkDAuvX25HlVhSBlob1xIHfM+rRNa
         8/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784857299; x=1785462099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7PhdusKrCZ0G+z+XVMqs0STmYqBCbFnffrEyg5UHGzo=;
        b=C6hbZC8vIy9R5GQtVd2m7tB95w1yO2Fbutn65DI0cL48aLVwLFgI98cSvZbte/wnu5
         GiYBKDv6pwfRS/hjHvigbRmoyPeJliBYha5+M/7WSINviUn2K+aRZW60lUio3caY3yi9
         Y/O7+xGd0NExSS5v7m+W7ACYXQwJoNNY+A2JJH0MRoHcbzNwQ+376NfkIzHx2rnVVfFe
         awlKGHwLLPSh/4D2tKNe1EMn9WUfbeoNK/NVjJJZk9seIQ2JYtFwbJgeKskzK9ciD5R5
         D6pz4JheNfvWWiCnbEaNMkBWq0M72zHG47UtO2LUR9sdQjjEA4FyOaTBIAYulvVyirmR
         BuQw==
X-Forwarded-Encrypted: i=1; AHgh+RpTdUOnn2mYgcgJ7WO7kHV2c5SwnIobnTbovSDP6YwE7kMwV0ctnsDWJqf1oi+aln5oz/EhpF8EkpdAw/hZ0G0w@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/EZETBRwFSHCNyaVaDnH7GQRX+2R6amL/XEDL3I3DRY5IFr6V
	TbZV61WQgQOKV++EWPlJ2ke0GuiGvEmQRBzsbdgMpDsv+whvKB3m4wNe
X-Gm-Gg: AR+sD10//4nL6X8iyvk8lVkJjXNzEZeTroFQ7eUGu4KQtVQufu1OATBgeSOd6NINBcC
	I2i1n7EHHO22jS/uYx1ADMe/E5C0vsInN6rP4Vp9/x4G5H58uXaIUnbzPtrqAQ1z6E50HZQJJ97
	lrKMVDxhyib9yuHy0zWc5FmOWG9n4nTL/xGxjFmFIPhXCK+o9tWIxnWPL+9PF4hdsZ+7xk6xuj0
	yBwI2TunsOyRSmijS+oVnK4Ug6LPb+XS6Ta6cpAabJ6HLUQEgCvzaOIJcFZxUsbZVWHClh/DeiK
	pH+Y8xexYsCqAywU631Pb5C43wumiRvGtKMJgXy9as5CUrdqSZcyN2+r+oysOawLZuQN/yPQp0c
	XajEJAUIA51Y5vRmjA7YOz9kR2tzDPCCEinafk7jE7ez+cXpo+nNuEErlVhmM+jFPfid6YrZ4K0
	05QbyOcfdKhzK6I+wxCKj45KKbZfDiNp5IwXFSu/7cX7rFb+koJHW6E9maHHR53+4=
X-Received: by 2002:a17:90b:1802:b0:38d:f94d:4c6e with SMTP id 98e67ed59e1d1-38ec697e80fmr5448230a91.17.1784857299536;
        Thu, 23 Jul 2026 18:41:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm647015a91.5.2026.07.23.18.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:41:39 -0700 (PDT)
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
Subject: [PATCH v5 0/3] clk: nuvoton: ma35d1: fix PLL frequency calculation
Date: Fri, 24 Jul 2026 09:40:36 +0800
Message-ID: <20260724014039.1239552-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_184140_911996_CC6716F3 
X-CRM114-Status: UNSURE (   9.33  )
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
        the configurable-PLL branch; split CAPLL and DDRPLL into
        separate case labels mirroring recalc_rate()

Changes in v5 (vs v4):
  - 3/3: split CAPLL and DDRPLL back into separate case labels so
    that determine_rate() is structurally parallel with recalc_rate();
    add explicit default label; share single req->rate = pll_freq tail
    (readability suggestion by Alexandre Mergnat)
  - 3/3: add Reviewed-by tag

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

 drivers/clk/nuvoton/clk-ma35d1-pll.c | 43 ++++++++++++++--------------
 1 file changed, 22 insertions(+), 21 deletions(-)

-- 
2.43.0


