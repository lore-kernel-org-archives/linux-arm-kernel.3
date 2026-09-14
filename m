Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF0CC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bakTp6stDBZ5NtOXw79DszktYHeILhkNYFFO9zeitSo=; b=ZDHOs7BYRi8gNr9xYhls7qqJEX
	8R9ekEz3hHTtCUMubqfP+ZfJDlGEDRnnjbgUvcyPw6SSzSdd4QLRPh4JTXsawmork/GFq7qv/Ih0T
	jqnzgOUUhphyZ3MT2M+zch4YuyreZtuOhuybRcYOeAdtsYNdjxtwOEIjljMSjzzDhPw0zd4sZgvFg
	XaIJCrxJIEwB5ns056uAzYMB/Nh0cFISOwkM6CMCFf33NhPWbRihwcDQQ0BJxwOnKtrngwjStLODR
	GNa1ZnY4huM3ZJ0N9LLaDG6ZdhmRgHkfFOeVLxapFv96qoVIidTYpBgXpiFMNpI76VPMfJZzbvDiX
	HotxKCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66x4-00000003oxV-2QZQ;
	Mon, 14 Sep 2026 13:42:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66x2-00000003owm-2kuv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 13:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bakTp6stDBZ5NtOXw79DszktYHeILhkNYFFO9zeitSo=; b=GE81yVPf6Y8IO+mNG+XyGDNW9h
	TfPUkTIUxXVmVgNa6J7sic8B2zUrGNbv6mD0S47GnmHS88UrPaGvTrQ32oxbzzVz2lHwlw2tuUHKt
	dImJYpZ7OmqIz6A7zT4BjpJrSlC6YfqBZZnyAD/rTJ6Ad1SCC/8Cg/t5KfTC3DLVXPYSXrv9umf1s
	tsMm32pdDLvgruZCKBft9PxxrzBqS9pyX4kZayhUPCLwYXZqycPED01pBFlZ5gwCiBY3BL2peum4b
	0B4exFLyrGVfCG19S+EuXTzSiNwv5dKsOBeHCYSIxlFszEiJ5uOPT09CGjOGcT7xSBmnoLFGEGNtQ
	XZqBLQlg==;
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x66wz-00000005g0O-2uS1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:42:27 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469a34907so1882002b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 06:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789393343; x=1789998143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bakTp6stDBZ5NtOXw79DszktYHeILhkNYFFO9zeitSo=;
        b=d80jBkyC2EZVEcY9Ujfk78+3bApZC9Bj7DS30NdoHXliM6kG4E0afGQWIe3HfK9VJG
         Z0v4Oqp5jCZI1ZIwUG6E6S07w3jzcZtR3YwCtRwOlc3eSQCesEOFj5hp0LElhenE7/xX
         9mnqxlxHurBFGSukdGknATeXF2PYrFLEoMA+uMZpemJnWAp79CZNBZOmI5N32nNWb1SZ
         5ZCXNziHCuoQ92I43myOtVgKd80xJNexBJkkVqPo16fRKsG+Uz67lITDrTcZ0PzzzwiT
         YiiWoIXiafsTEI2IVfib2OVWwq4TeeeiwqhfG7OInubVmvBl1/APCpzJuAolhoySvwJL
         +3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393343; x=1789998143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bakTp6stDBZ5NtOXw79DszktYHeILhkNYFFO9zeitSo=;
        b=hjqU05nxwDUdxGJOxR8WEpIVeRIlbHfOSpGguuvhE9ZhufKbWXRN9QcEMMy5gRB7/W
         Jxq4TRXAFGlKmPn6V98/0jgR481a3/5Qy05lILbWtjPawZiX5KAekAlxbDqtAk39Xt8c
         yR+ZvPVfhnZEX1ZD2slhLTywzt7OjGh0Tqsi9AfV+GHjLdJ25xV9rIFGsr+m0m9luu4K
         thNxA1o5wYLWKZaofrnW7ChtQ8ERfbWgw6ZQlCU4YbvJhT55qBckoUPPAjyledZFuYzI
         KMHgIJKrfXGzF0rV23ZplLq4SOe6r/DPO2RQlVQZc49RVZmZCTY353yayMfr3+KGVRYc
         eClw==
X-Forwarded-Encrypted: i=1; AKwUvBy0gQT5n2VBUxLZLotWNDoUYLlQxIYi9GG/22rTQavQqWCMTpYpOnWTo5ZnhI0f8uapyuGhDIK/cjwR809+iVCK@lists.infradead.org
X-Gm-Message-State: AFuF++lbQnZN7n6UNQUss6qp5JQlPrzUKc5K8PNeRHfYlqCDGrypZ+MQ
	YIiydonTrz+3DrKg1OxilOxaqAWteCD9v881HzkLIrN45FlF72EUcKZzOrwlzl+s
X-Gm-Gg: AYBFou3I0JZdCxY/TYRV+BhmqxxX1LUZyP2a3acdiep3sbiBPk+wisiLqNAhkGH1HGv
	djaBQzKoZQRWFeIxLgwyMbP6raI4wxQu04YaXwxznxBz+Vm1YWXNyDLmPo4JW66xGlu6ihFSiVo
	h61LeVHb2G5NLr+XjDFguULHuNz+OPTeOCLvTKjRCO8/3dmJGvt/l/BGQEY3moZCCzH54fJO8KJ
	px8PO+D69cRQagc1ihGNb41Y7gRY6Xtfe1Fugd8tQrpD5fZd8yAYjAmxlq9XvQco8w+aCkmlni1
	PjAeh9hB/djIxsAhxslKmh81tNEWsxEZWisJpNdtWPa+KiW49RnNX0GDwunS1RT75kUOKLh9rGL
	G6Bb4YKtQ4NRPhPPldiiwl8QQUJWbtjqrJg24sJ1f/I9Wfax6BT8WBnucObdl1k6k/yDxv763sf
	CTjKbUHrHeheETzEbu6dtQVnxyCf4KkDMteE67noB//hoI7S1WB5bDOw==
X-Received: by 2002:a05:6a00:1c93:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-86f84b1da7emr5036133b3a.14.1789393342959;
        Mon, 14 Sep 2026 06:42:22 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29dc09d4sm4536921b3a.47.2026.09.14.06.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:42:22 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] irqchip/imx-intmux: fix runtime PM teardown on remove
Date: Mon, 14 Sep 2026 21:42:11 +0800
Message-ID: <20260914134211.1734163-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_144225_876356_B58ED275 
X-CRM114-Status: GOOD (  17.74  )
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

imx_intmux_probe() enables the IPG clock and then drops its runtime PM
reference with pm_runtime_put(). With CONFIG_PM enabled, the runtime
suspend callback disables the IPG clock. With CONFIG_PM disabled, the
clock remains enabled after probe.

imx_intmux_remove() accesses the CHANIER registers without first making
sure that the device is runtime active. The device may therefore be
runtime suspended with the IPG clock disabled when these registers are
accessed. In addition, the remove path only calls pm_runtime_disable()
and does not balance the clock enable when CONFIG_PM is disabled.

Resume the device and acquire a runtime PM reference before accessing
the registers. If resume fails, skip the register accesses but still
tear down the chained handlers and IRQ domains. Disable runtime PM
afterwards, drop the acquired reference without triggering another
runtime suspend, and explicitly disable the IPG clock.

This keeps the clock enabled while the hardware registers are accessed
and balances the clk_prepare_enable() performed during probe for both
CONFIG_PM configurations.

This issue was found by manual code inspection.

Fixes: bb403111e017 ("irqchip/imx-intmux: Implement intmux runtime power management")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/irqchip/irq-imx-intmux.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 47c2681d138a..de2a8f98f625 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -288,12 +288,16 @@ static int imx_intmux_probe(struct platform_device *pdev)
 static void imx_intmux_remove(struct platform_device *pdev)
 {
 	struct intmux_data *data = platform_get_drvdata(pdev);
-	int i;
+	int i, ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
+		dev_warn(&pdev->dev, "failed to resume device: %d\n", ret);
 
 	for (i = 0; i < data->channum; i++) {
 		/* disable all interrupt sources of this channel */
-		writel_relaxed(0, data->regs + CHANIER(i));
-
+		if (ret >= 0)
+			writel_relaxed(0, data->regs + CHANIER(i));
 		irq_set_chained_handler_and_data(data->irqchip_data[i].irq,
 						 NULL, NULL);
 
@@ -301,6 +305,11 @@ static void imx_intmux_remove(struct platform_device *pdev)
 	}
 
 	pm_runtime_disable(&pdev->dev);
+	if (ret >= 0) {
+		pm_runtime_put_noidle(&pdev->dev);
+		clk_disable_unprepare(data->ipg_clk);
+		pm_runtime_set_suspended(&pdev->dev);
+	}
 }
 
 #ifdef CONFIG_PM
-- 
2.43.0


