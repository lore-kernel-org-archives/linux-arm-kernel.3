Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB7FC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TT5lRmym0T1mzXaOaX/8a6/gNfD3HTc1xl19TrAEELM=; b=eWl/Hh1YBDvuTcDgVe6YW0EVj+
	9e6ASr2PIVEVkutEtrlRrVEiC8rBi3A1q1KJx0dT39BytlwUlXP+F4m2VfavLBrFohBFMBJgAemEd
	pUOp0OxLY7fBeHn94abMd9gZr91lZPQDNnYxLriwN/KNJNZN2FY+ggZgUO8cdcs3ZJWEO7ux7QMP3
	w8f7pYhW3TE/zD4VNPE5+lIR3lyO78ll0t+29aofnO7NSi18jFsyFJ3hThyKO/h27J5ztDuTntsH4
	zyGUpeucOUfedOqYcruFq1B8N58cLwALCbc8V9NkCepbUp3JLXJGZQ21zK60u6Q12YYc3z4KJMDfR
	hrtfRJRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDJ-00000001gVa-30Ls;
	Mon, 21 Sep 2026 10:25:33 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDG-00000001gTE-3a0t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:25:32 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so3036748b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 03:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986328; x=1790591128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TT5lRmym0T1mzXaOaX/8a6/gNfD3HTc1xl19TrAEELM=;
        b=e5jgnpAh4VVbEfICKqyZDXGmXbO2xLXEJbi5W67ZguFD0j8KT8+8z4ajuP4Ef7ZEdL
         pps8kX23njl9sRq3oqvAOxwQDHfiaay8SRazbzo191vI+BCpBxTsOE4KSSA5iqVXgNAb
         fYFeTVrt7U60Itc9BVDgDZtpML3JbPgECGXQCrk7G6eIIa3uUOUVTktIUZCYuWxGR2qj
         b3ExXSRTbaYq5de478Psz79enWmXaomM0OgzGk0lhpnDPoL5xL05WIpvOk1r0e1cBRzW
         w3FT/usaT84Yo3iM3bN0fzFO0B0/Sj/RtuFOyagcfQen+jihjORkNn3vlmJwFx31a95h
         EohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986328; x=1790591128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT5lRmym0T1mzXaOaX/8a6/gNfD3HTc1xl19TrAEELM=;
        b=jbdyoInHedL18NtmbvLkTDpDyaD+pwLPisy9770Mfnic1W0P6lRDfH/tPT5UGFtU+g
         o16xgv8FLlfwjnwCvo2agTCQcYmhf0qfecCrc0/+yqwZMeLUUMSbdEj5+67zSmC3XU99
         lkkrJ8u/81MGEV3HhPGHl4jBZwP9ExQgAXMk0SPoLIoCfvxQBBM8MDMpEXTqol6MeuEm
         abfLPc1U8a5fSSmD2g3pYxb/9NdItVpP0fh9ljLlA3FzfRH7IQj/BxN71WvQt/LDEYZy
         osgYiw2qOW3QirvDE0MwNZ7TnTTFIeHzZ1JR6nonkYce7TvpZBapZHnnMbyyJHu4notK
         Xg7Q==
X-Forwarded-Encrypted: i=1; AKwUvBx6uwydXroDFfSKSC4bQp81HeySHtfIwAtv+Z+6BPw/ezHheKu92+ocwtH7txFc4bvrFpzObK8cr18821e5wuSY@lists.infradead.org
X-Gm-Message-State: AFuF++lQfAl1o125PXuoQzmuZ7d3dERDaN+IYmJOjmV0rM+EeNED7w0t
	zhLqWhwiIe/OywXYSgjrDWq8uEyaQ9yoUS9cOUi7xQNo4W6gveOyVSTK
X-Gm-Gg: AYBFou3THJY66wLPTKpNq6Nnbbp1qsGQJo3IKBlxPnioD55UhIgqy3lNEezuODmKFWM
	JILo/2Tn8Dzh/rpYnNBGvctgaskFl5Ua2+6AFNj5WkeuXAyWEKy5NxgbLs2XhqSuifagubfw64Z
	77Ciw88JL54S6IeCEKq3JLysn1X3RSB5lMIHMCI/8pubdcsqVo1Cd1DoIxYcG7ZsP+/Ul1xtar7
	WU+Dgn5PrSK/EaZvzXNztwfWkY9u5iUypeCwt3xBbmkkyQgVJ9EXiznDHbWJvqAJqXKnjx4xrox
	Xje0NZWOfpwwFYzqEd4CBcw2+Qf+X5fzahbu0FuRePtxW5BivIH4orVd8D4X/usFACXKWIij2WP
	3NG3Er0FrGjf7euqi6Zva3xdFZN/E6b5U2odhM0lDNbqtVLsG+fUzwIg//2HbMdw1k0X9Gh5lKn
	qltJ0ogPTeusP9Nchb/Guyda6N0Xuz7IXP/MbAQ3OJxTGqWA/zIaa0SwQAqboUVyyp8vqIGA8s9
	l2L5JRIZ7GojJ7act+5IUVZQopb
X-Received: by 2002:a05:6a00:1911:b0:878:34e7:9a3c with SMTP id d2e1a72fcca58-87834e7a3a3mr7459656b3a.53.1789986328468;
        Mon, 21 Sep 2026 03:25:28 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:28 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 0/6] clk: mediatek: Fix descriptor clock ID allocation
Date: Mon, 21 Sep 2026 19:25:16 +0900
Message-ID: <20260921102522.1640072-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032530_923773_399C1FAE 
X-CRM114-Status: UNSURE (   9.35  )
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

Several MediaTek clock providers have clock IDs that do not match the
size of the clock array allocated by the common descriptor-based probe.

Add dummy entries for missing IDs so that the allocated onecell data
covers the complete clock ID space used by each provider.

Akari Tsuyukusa (6):
  clk: mediatek: Fix MT6779 clock onecell IDs
  clk: mediatek: Fix MT6797 clock onecell IDs
  clk: mediatek: Reserve missing MT8167 clock ID
  clk: mediatek: Reserve missing MT8173 topckgen IDs
  clk: mediatek: Reserve missing MT8196 MDP clock IDs
  clk: mediatek: Reserve missing MT8516 top clock IDs

 drivers/clk/mediatek/clk-mt6779-aud.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-cam.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-img.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-ipe.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-mfg.c      | 1 +
 drivers/clk/mediatek/clk-mt6779-mm.c       | 2 ++
 drivers/clk/mediatek/clk-mt6779-vdec.c     | 1 +
 drivers/clk/mediatek/clk-mt6779-venc.c     | 1 +
 drivers/clk/mediatek/clk-mt6779.c          | 1 +
 drivers/clk/mediatek/clk-mt6797-img.c      | 1 +
 drivers/clk/mediatek/clk-mt6797-mm.c       | 1 +
 drivers/clk/mediatek/clk-mt6797-vdec.c     | 1 +
 drivers/clk/mediatek/clk-mt6797-venc.c     | 1 +
 drivers/clk/mediatek/clk-mt8167.c          | 1 +
 drivers/clk/mediatek/clk-mt8173-topckgen.c | 7 +++++++
 drivers/clk/mediatek/clk-mt8196-mdpsys.c   | 2 ++
 drivers/clk/mediatek/clk-mt8516.c          | 2 ++
 17 files changed, 26 insertions(+)

-- 
2.55.0


