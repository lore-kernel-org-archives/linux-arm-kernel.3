Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49CBC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=svU6xwFGf/9QtbbQSKtklx6ByIpuWbpg6lXD+wNFaQY=; b=s6HjQllWW2PuFki64O7+lilfm9
	JxAru7PMbChMcv5hPFwLfDtEd1XxAaiNbrcfauiWLpDqlzMYtrO54ZJh4lySp3iE+EKc7nxXAbCw9
	kMJ75vcQZX3IaU9DG2gQthUJu3pMBw2GiEcTLCKEtPSwcPU21r4BVRSEpButbR4ZqtiRsJzmYU15e
	BNn0xAP1Sq0UJPmPNRDPDofI1DPlSaJt/aHVooqJtmNdahVnYRfo2jAiv9MwTXfZnM9isYRkUbVuo
	qYmqzKTE5FDZjG10jF8mVUPch267U0bmukLsoA4zSQm5jTuMmp71FfnpohzVk4rCa3ttw2vzXJni5
	NiDI8tsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRpH-0000000CD8c-20M6;
	Mon, 10 Aug 2026 15:22:07 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRpE-0000000CD5N-2Blf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 15:22:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so13694085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 08:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786375322; x=1786980122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=svU6xwFGf/9QtbbQSKtklx6ByIpuWbpg6lXD+wNFaQY=;
        b=lheUxjn/hRnVewX/H9X5uHy8mVCRAMgDYjyBBWgqXLeRJnsqQBkgoQSAC+xcB9YtAX
         EKjNzPdfZRwYf1ocp30MpbFkdy/ua3AiN8cyJt0nsuCNkj8Kstg2mSh0KR7vRzuSKNMJ
         BzE44FUWQTqurPqMln+7t6R9aE1ueKABMaRywkbP2aSdvQB6SjOdpHFNy9+daVEcKCxk
         KXBnR3GKlNgURxrdkaOnAjxyLlUq/1VohMU4UZqoimP6l6mJDpC+hmv5PhkJmeOAqs2v
         m8vlZJDCnlOA9oWcLe7TtqvCeF7/qwVhtL6Ko4nQPyEOtLRF7w0Vid2CEh6pGoHwY5Hv
         YY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375322; x=1786980122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svU6xwFGf/9QtbbQSKtklx6ByIpuWbpg6lXD+wNFaQY=;
        b=MGEUGNIWYWSgBlLRJHpJkMD0E4C6Mh7o9Ljrq/6r2+GMMVRluR90s0LaV44bRwKU+1
         qjnL1r6b8Y8jsU5r3g+v8T36HR7SP9f6NmbHF2w8WsDhHjMeWr4KDe6yXPf2H9Gg4Smc
         6qIwgtsaIsUIvlGFjHkQV+Z0L9EHVdPPTnEihgUnF0wQo0oEl0p2zPIUBjqR+BK3HqmA
         t3Yb8NRRq3N8lzNh3ujjBsk8LoDo4F+9FlUljkVr7bPBmZvy+3fgPLq0XtdC7y+IGs3a
         3wcyORaQSzqtujJgQ6f//cyL3pZgVqjij5vquSIlcav4AcXE1oRWZGZvd4VKbq3UOXP6
         7j6w==
X-Forwarded-Encrypted: i=1; AHgh+RoGldFXegyRSpZhpNRszBMVkrugZxX3Z7UVd7toNIEl34V8TY1iGyMVAUlUYWu816x4B+OHob0j/IjVLkbbhiXA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmi4v6qiYdU3R4ytvI/IENpiVFVRfM6/ZhU8LRgGTVTjDyKzh9
	m3QPLHObYx3GOddvzAS01z4Ncdr04z9nclx/Y2yIMAWIFXdp4e/dedUa
X-Gm-Gg: AR+sD1227Sr63JpwjSTs6jhUzyCri142DWiT6VPAkrRZm6XnKjw87xVkusUYzExpdoY
	tnzQEkn9f2LEyphAUIOX+uSViwNTA22PEGfIobUnv20sNDAJbXX33rrogDYoyKZDatnOmQ45/ID
	8EMqjPxlx/9AC7gESxW3t+uKak0MYUCkiI0Fsy3xaTXWPu5CrS5rS7KVkhDGKIKzcVJHdW+0Yyq
	hoT1o5ZxxxyDwOcoFPb/Y8fqSR5sxCQBwWkEAxwSDRRQxHjJal3/lKu8dJV8ItMxXidlrVuLOOh
	l2tsEhLBKndJhztQwpcWTBj22SlHFQTObLWe4T35K+bVIdCcF0MWV4Nm5f64w8xWia0Gz3Y5H4k
	JgwCgWgCAt0krd/mevxEBoc/ecLjgx+WTtwdysbeFjdr+Itgj2SDQNzKyLqvrJm/52X4haWMdoh
	4MHCjEaUtL1JkzBbleXk/3KKxzYDpZ2QjOp8OXd21vK46xXjCsTSXmTGv3JfQZSsthbuo=
X-Received: by 2002:a05:600c:4e93:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-4996193f165mr287140375e9.3.1786375321792;
        Mon, 10 Aug 2026 08:22:01 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499740a70c3sm99255e9.3.2026.08.10.08.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:22:01 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: vf500: describe the Cortex-A5 L1 caches
Date: Mon, 10 Aug 2026 17:22:00 +0200
Message-ID: <20260810152200.3230971-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082204_568498_34413F77 
X-CRM114-Status: GOOD (  12.12  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The cpu node carries no cache properties, so cacheinfo has nothing to
build the hierarchy from and gives up at boot:

  cacheinfo: Unable to detect cache hierarchy for CPU 0

The level and the type of the two L1 caches come from CLIDR and CCSIDR,
but the geometry does not, so /sys/devices/system/cpu/cpu0/cache is left
without a size, a line size or a set count.

Fill them in from the Vybrid reference manual (NXP VFXXXRM), table 2-4
"Platform modules": the A5 has a 2 way set associative 32 KB instruction
cache and a 4 way set associative 32 KB data cache, both with a 32 byte
line, so 512 and 256 sets.

Tested on a Colibri VF50. The warning is gone and sysfs now reports both
caches with the geometry above.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf500.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf500.dtsi b/arch/arm/boot/dts/nxp/vf/vf500.dtsi
index 71ccdaa..a73e9a8 100644
--- a/arch/arm/boot/dts/nxp/vf/vf500.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf500.dtsi
@@ -18,6 +18,12 @@
 		a5_cpu: cpu@0 {
 			compatible = "arm,cortex-a5";
 			device_type = "cpu";
+			d-cache-line-size = <32>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			i-cache-line-size = <32>;
+			i-cache-sets = <512>;
+			i-cache-size = <0x8000>;
 			reg = <0x0>;
 		};
 	};
-- 
2.54.0


