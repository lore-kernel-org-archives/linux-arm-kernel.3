Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900EFCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NoYnG+jVemCKfDia3hV2uX7KnTcLeGcvlho/J2VVvCM=; b=y4QoZ73aB2m74AR1hG/Lo09v3w
	9uM+QUJe6hbAh50tlTEiFIZnAkd7S/SLw3sh6il0Lls6aoUFPN+kXgodvTnQmSpNK0bcujmiIHDdg
	KJ0KKYNC4NCRZC/NCkryUy60CKrvScV+OMJU5bvj2IlSi23Af7pfIHT6ifKKVhW075eIjgRbcqvrL
	RwZAQhNXNt1WrzS9eIr3IV6Xo/x5BVvTknCqkFqJ4nJEXm+/6dcxfHUhvcYhMatbsZ/NEZm7Jymhc
	4JNlLhINHQYFop1nL7ODLUMqmhzpVo9zHiTiCHLR7DIfL89L1lJWGHkZpUzb6x1G/GRPzsBgcVEyb
	xpqbhWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5at-00000001qnR-1srk;
	Wed, 13 May 2026 09:09:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5ar-00000001qmu-3ep4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:09:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so7197245e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778663367; x=1779268167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NoYnG+jVemCKfDia3hV2uX7KnTcLeGcvlho/J2VVvCM=;
        b=I0anuNvjPS4oH+bV+sWNGA0uoVd6SaweCww/HLrnstjlCa+TJEG/gy+it3Wjd5uXID
         H0R1NhwWpZFp/vPX7gnlfEBcH15FiWY+2q4ZVwYWMb/4h0DeBkdtAk4jcweYz64rjhhO
         5Y4JQwd1IO6MnxgY3+C4XVvRuVT18GtbrSXko6BzOshOTz77q01UDvjvqCKTlnjSk9Kj
         i5HPVfL7DVGfQ392RAboxoB0I8fw+/QGR1aT0RrBcTWZkbBzSdJMSoV3CQRk6QbRUGsc
         tyAFO0qQQmkxczOB+rbUY52AEtGRW8ZDxpKQDUeeBIWY8sugixiAhrhpl0VUglq7pmNI
         SQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663367; x=1779268167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoYnG+jVemCKfDia3hV2uX7KnTcLeGcvlho/J2VVvCM=;
        b=L8DOt633R3a0RXa7uD40r2s2f5cevNLyigpVzLD+B1tTTnGSM17yBLFefgEoPpK3Fl
         qGONmrTH1POT5EcPjDf4z5+IVi2ajEyeC63KISsTunEeyldY3j5yw2Vt+YtObmFc6VTR
         +wL04q0aMFnrl7Fi37TWbu8KeuJkWg3MBlVIDsP1WWWciOQXq2T7te5Ppl4iXk/8YdGj
         eGSf6iOV0QRZ2Tq9CQl+chNRRbWy4HFzsRFqkfgJ92qfX2i+g8ikZUhF0FAVxxGtgdCt
         FLY+yQdf2D6rBFAPwTzenHNPO3L21xmLRgM3js0H7/9qVKVNJFwY6m/225RRoF54SYpq
         RomA==
X-Forwarded-Encrypted: i=1; AFNElJ8FX0OQMpJrEWasXbskbNyeT0L3tZCJmusUSO/HEhh2jWLLTAFpwAhMGtZoHfLyvkrtt6ZWmv2PE4fhNbhAVwdR@lists.infradead.org
X-Gm-Message-State: AOJu0YyS/LNshyIlBoAnGTZ59Y6pxq+HKokaHvLFJgYdkswl+cmQFQTH
	NHQESwSS+St1RVt0hm2cGMXuUxmKg0Fk5xZBzx/X1agq2FpwYLJY4J5T
X-Gm-Gg: Acq92OGUlRfZL7MmO9GfQiUx123yvpzseQ8SUtTerO9PMkfNxDV6WvzgTa2OLk3ViOL
	M4OgwQ9iklMaQM0//S0W8hycxq/RS5p5quksxPRYWri2RPhhUOApOu3AGTv3dOYXIwxjDbyWBsL
	0+hRoGVC0QT8M1x8fUinhTDPVo+j/paq6SghMjRtSEdOzSvsxbj7HgeqC6J9N/aWod8fZVhAj6R
	PcbOiK03MOSZHckoo3UCikzCB3wGJo2Hga5yk/90UkIqowceeEmmBXFWPpnJfnI9Z4tMCB0XAcb
	++SEYla4aZdAO7wfWDOnk4LMYDXuTgpYVim98gHo0PKWr++KKztQRWXSmNd2lEgSG62BUg2fT8A
	nKSAHEeVSegW6WGanBQJQ0j0KorwAB2pIhED9cv8x+xDa0P637n4bw0yr0Hk3DkaFloTzXODDeE
	aIr69Mz/c6pDy7LgZTVVwYeR7In9o6w5gL1WNu+5DUp2c=
X-Received: by 2002:a05:600c:1910:b0:487:1fbb:5a28 with SMTP id 5b1f17b1804b1-48fc9a09523mr17069725e9.1.1778663367456;
        Wed, 13 May 2026 02:09:27 -0700 (PDT)
Received: from localhost.localdomain ([94.158.58.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce065732sm30871365e9.6.2026.05.13.02.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:09:27 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: sudeep.holla@kernel.org
Cc: cristian.marussi@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] clk: scpi: pass child node to of_clk_del_provider() in remove
Date: Wed, 13 May 2026 14:09:00 +0500
Message-Id: <20260513090900.5323-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_020929_917780_2726B527 
X-CRM114-Status: GOOD (  13.86  )
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

scpi_clocks_remove() iterates over the SCPI clock provider's child
device nodes, but passes the parent node to of_clk_del_provider()
on every iteration:

	for_each_available_child_of_node(np, child)
		of_clk_del_provider(np);

Providers are registered per-child in scpi_clk_add() (via
of_clk_add_hw_provider(np, ...) where the np argument is the
child node passed in from probe). of_clk_del_provider() looks up
the entry by node equality, so a call with the parent never
matches and silently does nothing.

This leaks the struct of_clk_provider allocations and the
of_node_get() references the helper takes for every registered
child, both on module unload and on the probe error path
(scpi_clk_add() failure for child N leaves children 0..N-1
registered).

Pass child to of_clk_del_provider() instead, matching the
pattern used by clk-stm32mp1.c:2350-2351.

Fixes: cd52c2a4b5c4 ("clk: add support for clocks provided by SCP(System Control Processor)")
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/clk/clk-scpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
index 7806569cd..24cee7c9f 100644
--- a/drivers/clk/clk-scpi.c
+++ b/drivers/clk/clk-scpi.c
@@ -258,7 +258,7 @@ static void scpi_clocks_remove(struct platform_device *pdev)
 	}
 
 	for_each_available_child_of_node(np, child)
-		of_clk_del_provider(np);
+		of_clk_del_provider(child);
 }
 
 static int scpi_clocks_probe(struct platform_device *pdev)
-- 
2.43.0


