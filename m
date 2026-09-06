Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14330C79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 03:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YNopptATUu6tkEGXcgMAKMvS7a6eNXNKQGXv4gfsEdA=; b=lslLQH2Nyj2dQ1GQcaILx6Z2u5
	2rUUPrPWKWj3wcs92bEoZkSwt4X/jGJQETLFbSjTggoTwBVmHU0SSaluwCEz82EWulMZjREKj7czV
	Fq8t/ioQ5sSVm73qMRPT6Ko7yvFK8A6Zbq5bNkzFCfjbPpjAmZaeorOln0xSC1UXNc0FcFFklOslm
	hrY1m56gi0PxKdMHAr6JcsYW+O0/hu+7Z6YrqhBg+9drNCpjG88TSKPTeG+sThzoWGNCeLzPKdqdA
	7c0x+RcYxqGLsnYCrUa71EkU1XZnCwvpQBqg8TxJFidj5bh9cWzSXugayn9mlUjvLHtKaW4PbtRDP
	IMoX/YwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33kZ-00000004dxY-3Sj1;
	Sun, 06 Sep 2026 03:40:59 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33kW-00000004dwA-3V1Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 03:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=YN
	opptATUu6tkEGXcgMAKMvS7a6eNXNKQGXv4gfsEdA=; b=cSAuZc6HfNkuS5G+1R
	pPSq9pX7ayFbhxLzg9kZoJY2TOlCNqXm6X2O6RkM6bvTVlVRhz4zRd006SA4LZzs
	ItgaTlv6actVkxXIEBe34y01tjLEVPV0yQ7nCvTI7WQUziHc7BxqVFisIn+fTGOH
	MBZ7afz7gTc9zCbq6CaPAdUF8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCXOSWx4Jxqg+X7QA--.59154S2;
	Sun, 06 Sep 2026 11:40:34 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jingoo Han <jg1.han@samsung.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: host: ohci-exynos: Propagate clock errors from resume
Date: Sun,  6 Sep 2026 11:40:31 +0800
Message-ID: <20260906034031.85248-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgCXOSWx4Jxqg+X7QA--.59154S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFW3Zr1DJry8JF1rCF1rJFb_yoWkGFX_Ca
	48GrW7Xrs0grZ09r1DGa4UAFZ7KF1xXF1YgFWIqw13GFnrtF1vqrsrury0ywn8Jw47tr9x
	Cw4jvrn3XryagjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb1rW7UUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxhIm7mqc4LLKIAAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_204057_283354_6E56FBAA 
X-CRM114-Status: GOOD (  10.48  )
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

exynos_ohci_resume() ignores clk_prepare_enable() and proceeds to PHY
and OHCI restoration.

Return a clock failure before enabling the PHY. The existing PHY failure
path continues to undo a successfully enabled clock.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: e864abed546f ("USB: ohci-exynos: add clock gating to suspend/resume")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 drivers/usb/host/ohci-exynos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index cc5cb0900988..aa4eb9f9d69b 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -231,7 +231,9 @@ static int exynos_ohci_resume(struct device *dev)
 	struct exynos_ohci_hcd *exynos_ohci	= to_exynos_ohci(hcd);
 	int ret;
 
-	clk_prepare_enable(exynos_ohci->clk);
+	ret = clk_prepare_enable(exynos_ohci->clk);
+	if (ret)
+		return ret;
 
 	ret = exynos_ohci_phy_enable(dev);
 	if (ret) {
-- 
2.50.1 (Apple Git-155)


