Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBECCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BhdLoXtc9kkNzHYF4QrrqBcMnO9w0fLSquEWS/rnbxY=; b=qf9pLqrfSo24s7CB5nW0aXcWQ5
	MH1aiZLIzaxnRbVQK+8MFxWZo7em2WgUL5DAb6vtxiHxk+ZclcpOSyvqAjxkSxgJO02MEzltYZntB
	dnI2hh+BYEyBxeKQGmAlUp4h2ips653WrK8m2UVU0tgaYNZ24BqRdcjUVcGbcprrMuHDA61ydhgHO
	rNFn7Jvxi8yFRLg2qH5sVT+9TTBMVqQuKHOnk8joLzt44a7bcOd8GsIsGiRhN+7kqrb6UDR/lJRyZ
	86n93J+ue5hIWD8pMuNaB3QbTQ3W6BGepeHQ1OFV6qJAzDuqDORtqUNCzeffRzKY38GwcuyIeiRhx
	ElhCrS+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQkL-00000002RNw-0V9f;
	Wed, 07 Oct 2026 12:27:45 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQkI-00000002RNI-2jNB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 12:27:43 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3a89d1ca907so772867a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 05:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791376062; x=1791980862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhdLoXtc9kkNzHYF4QrrqBcMnO9w0fLSquEWS/rnbxY=;
        b=LCo/ZnAJJ27k26wegxgkKGesnF+UwpzlLIkDbwywr59559CVbOddCtVmyCLlWUfcCY
         shAMfEhaoz4vofB9k4pGo6WZItXatZ9PIOoQ8Oz3iAoz2KnofIOkacg7JZIfQSDI9v6L
         XUwfMqGh8LYFk3hvDVHA6WF0cMqL7a1gcdw7tu25NYZBkEsfBfG5RWsy3Xrwe05YVhxo
         7ZZrTLkOi65liaD4crr1togscwhUkg7dvOiCtXMJKi+tXb57aaGKqYgmtglyPPGfYpNa
         gkA3ZqOGAcZmx2jN+XauV3o7d3qgcY4wvQfXsg2kydKYdIslvhDDLAHxdBgGvT421ExE
         BXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791376062; x=1791980862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhdLoXtc9kkNzHYF4QrrqBcMnO9w0fLSquEWS/rnbxY=;
        b=q2SeSdsLsDMFuKChF5gV6Q0qwL1LOR8/JERIgqQw4OOn+knn9ji12p0HmaDNonTowv
         1qmMfsTbElMFJ/C5tkLIUTZwQwzryre2VQ8yJqpghU4Tr7TBcdIoODt3PLAyAE3mA75m
         YSPlN1uf2axR2ICdH0lAmdvBNpy1RUyekqbIg3dMdKpeMlio857t/j5xfWpZga2cHtpV
         egCXJm+mktDBrJI5NSEeGktMNclc2UOSUxkrqvsb76omVkV7x59iQxxSi0v4iHuWIpq2
         RHo+luLf0lOHcLgo7XKNIDAXOPTf7Cu/kM62TbIR24iqVYh0E41GlO8WxnULpSYK1jHG
         hKYg==
X-Forwarded-Encrypted: i=1; AKwUvBwQIPuqz7/i8Lb1XmWYdxbH1Yn5oMidFuvPysa5y3Kfeoj+nTxZi3Qo1OJDD/jLtJc0haRiOp2W+Z7N3cjJ9Qj8@lists.infradead.org
X-Gm-Message-State: AFq9FYI2PinMGsBY2z2CtaM8w19BHhtSGxUP06odp9rUTIZUOdTNhR3t
	bpzxQG/RnByWM+LYZS78m6HaxCw7UgVqRW4iWpTEhDTWcwkPJz050d57
X-Gm-Gg: AYBFou1TYtcSkFaYfSLzPWqwM9onZFTEMTZ6gNd31bpexJRpgrLLXCk6f9CYx2ilInt
	gy4FZJb06y98JJN9ialiB5Il3v9sFNCNHV9DjsmqLU/hFM15On5zSIsmPCDDaMbCBG9oOVjzaCz
	XHhTlogEvGd4Ji5TRxgGbtZwOrHFEVpf8syFXw3IR5Ca2Nc2GQFqzaIP65xfOULNRmg35C+CwhU
	UZviDhXOHqKPHB8RBObuXaJJSJAFF+w/BpjjxX4Srml1jLdDmYGpNxlpsV/tNh4A8BNSGxDlsTY
	hTnyqbChKIAH5EwzUjhUsAfHIcvV+lnP1UkYutgPjQa0rcGnDm8munMnfakR2L5XjVJKzw+7SUc
	y+ST60PKxUtXzVsb15m3reY/ilKl3rXrwrfTjB3JhGDS5H/oxwYRb0B7Pep9BBioNqIkiu1DWyd
	B3nzc1arfNPjGNUkIb6NF6kFbtPJPO5lv7KzsJ19JtxsEbi3Ec9XNf3N0=
X-Received: by 2002:a17:90b:2884:b0:3a5:364:dfd with SMTP id 98e67ed59e1d1-3a8a0cd1a2dmr1992504a91.31.1791376061688;
        Wed, 07 Oct 2026 05:27:41 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::8534])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a88eff2146sm6384956a91.10.2026.10.07.05.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:27:41 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on probe failure
Date: Wed,  7 Oct 2026 20:25:34 +0800
Message-ID: <20261007122534.194286-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_052742_732170_7FA8C9B8 
X-CRM114-Status: GOOD (  11.88  )
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

hidma_mgmt_probe() calls pm_runtime_use_autosuspend() during probe, but
the probe failure path does not call the matching
pm_runtime_dont_use_autosuspend() before disabling runtime PM.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before pm_runtime_disable() so that the autosuspend
setting is properly undone during cleanup.

This issue was found by manual code inspection.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - Add the missing changelog.

v2:
  - Keep pm_runtime_enable() and explicitly add the missing
    pm_runtime_dont_use_autosuspend() call in the probe failure path
    instead of switching to devm_pm_runtime_enable().
  - Update the commit message to match the actual change.

 drivers/dma/qcom/hidma_mgmt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 4805ce390ffa..d8c56af5882d 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -310,6 +310,7 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	return 0;
 out:
 	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
-- 
2.43.0


