Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBAEEB5946
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 01:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jivEQvL4i11K5bRMGCc+nSULGNrxIk8t3KCJl0ckdTQ=; b=Sjk0txG+O6XhUgAVNa1ndU9ij0
	n5UdCZuksSh9cN+xNoG5khX2GggB2ELj67IflD4F8PiE1iglZDOK50iJphEk+tTyfr5oqUWXFEb45
	cJvRLlNcxUq8Rt509WU8Qkh62yY03lSRSW/S9XzhoB6JLkAXwF7JYCjGmalSU8yHqzI1UU8A3HgrP
	q0zlZJehoiFPZi7vSo1N38KmzMgF+2hsTZmkhfXIUQKycW2Fih2fERlrnxzPVvxoxufnyrSyN0pYg
	dPu4ElcwpHQg8ySF6qk0drLyggUCAoteES2gVgzK6Ko5msxBh1e5K8VCWDLsURRRD0Py4ISqgrZrl
	glLstGQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpyxf-000000005LV-0Fis;
	Wed, 11 Feb 2026 01:24:11 +0000
Received: from n169-111.mail.139.com ([120.232.169.111])
	by bombadil.infradead.org with smtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpyxZ-000000005Kz-1HLM;
	Wed, 11 Feb 2026 01:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=k4rY8dyGr+ZMmzENq7OohDKkBqouz9FEPkuvpZpoPy2YaK+fGQxhYpcBPyeZ+Q+QDqaRoIenyGLWP
	 SR5+0/xsXrRQzCd7gXlTkv4tYv5GSmppWI8powPt/dLQursmCCRm9N+Ujc5LLHySiwEJwG4NK9lJxg
	 oXFIH7Jrn3vN73gI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from NTT-kernel-dev (unknown[60.247.85.88])
	by rmsmtp-lg-appmail-18-12021 (RichMail) with SMTP id 2ef5698bda265d5-02609;
	Wed, 11 Feb 2026 09:23:52 +0800 (CST)
X-RM-TRANSID: 2ef5698bda265d5-02609
From: Li hongliang <1468888505@139.com>
To: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	u201911157@hust.edu.cn
Cc: patches@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	miles.chen@mediatek.com,
	wenst@chromium.org,
	chun-jie.chen@mediatek.com,
	ikjn@chromium.org,
	weiyi.lu@mediatek.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	dzm91@hust.edu.cn
Subject: [PATCH 6.1.y] clk: mediatek: fix of_iomap memory leak
Date: Wed, 11 Feb 2026 09:23:51 +0800
Message-Id: <20260211012351.2076922-1-1468888505@139.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_172406_322430_5EC9773C 
X-CRM114-Status: GOOD (  10.60  )
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

From: Bosi Zhang <u201911157@hust.edu.cn>

[ Upstream commit 3db7285e044144fd88a356f5b641b9cd4b231a77 ]

Smatch reports:
drivers/clk/mediatek/clk-mtk.c:583 mtk_clk_simple_probe() warn:
    'base' from of_iomap() not released on lines: 496.

This problem was also found in linux-next. In mtk_clk_simple_probe(),
base is not released when handling errors
if clk_data is not existed, which may cause a leak.
So free_base should be added here to release base.

Fixes: c58cd0e40ffa ("clk: mediatek: Add mtk_clk_simple_probe() to simplify clock providers")
Signed-off-by: Bosi Zhang <u201911157@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Link: https://lore.kernel.org/r/20230422084331.47198-1-u201911157@hust.edu.cn
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Li hongliang <1468888505@139.com>
---
 drivers/clk/mediatek/clk-mtk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 7b1ad73309b1..c2ca3d7576c2 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -505,8 +505,10 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 	num_clks += mcd->num_mux_clks;
 
 	clk_data = mtk_alloc_clk_data(num_clks);
-	if (!clk_data)
-		return -ENOMEM;
+	if (!clk_data) {
+		r = -ENOMEM;
+		goto free_base;
+	}
 
 	if (mcd->fixed_clks) {
 		r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
@@ -594,6 +596,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 					      mcd->num_fixed_clks, clk_data);
 free_data:
 	mtk_free_clk_data(clk_data);
+free_base:
 	if (mcd->shared_io && base)
 		iounmap(base);
 
-- 
2.34.1



