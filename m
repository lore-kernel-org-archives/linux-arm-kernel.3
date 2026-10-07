Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B72CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1S+23ZtOjWwrYVTwNmNORRFxt1wYzNyVlF7uFakN9wo=; b=Ro7bIlZhNmxIf4sOTk8hTcEd/O
	awyL7oH4VkJILWjqObQHEAjpJr8FNAtTtXx3fm70fuHSzQotp+J2U8iqonHOWJsRngPO/1BvRwrYw
	IpVRhuy/FJZYK5ag8T/m4onnXUnghnnp1d5jPm6DhwOflqziRXRHZnZcJjoNSZDQqtJVYFTemw4p/
	FNWCWVBBx1f7godhpvl/s+6n9b0AXsZMCdyQfKLgZJF1YYJ0Hr+e+05EUzO91qBdkn7ZHOTCRdSls
	zq+YVBVxsYFvAFU15yLk2SBnF6vlNXcF6WQB3R/FiIVes296jQwnzrn2osWFeXftwxpKmO+YtX1Cx
	bJZ3CyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ0v-00000002Lsa-2sfD;
	Wed, 07 Oct 2026 11:40:49 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQ0t-00000002LrY-314R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:40:48 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1685311a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791373247; x=1791978047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1S+23ZtOjWwrYVTwNmNORRFxt1wYzNyVlF7uFakN9wo=;
        b=hDu0XaR1gBU0A0H024k5C8Qxj2/clcOuj3h0hxXZNZp2XP6mAMubUh4EcKqkp4HqOp
         l4TCYqwAs6HaohQra7567+a0RwYOivV6K6oWBx8LRT1p7RPiWpB+XyvGISXdITkqdnfq
         sBs3Z8HXajdKhK/eV9/Fv82vATPDHAkFPzZIYSLzkyLXp6e5O1PcyIqFYHBF3+wxcrir
         DNcqMcl9RE12huBZKgjSOwmlSpDh41sMAqBP1wg4N6Ckfm/7xmZXDqhHxMBKTZVm6LG2
         SU3FmIyxe0M7RUJwm4LVp4Ouzu1rdRcxLU0sJ+6KH0rq/XAEvK8BIIr/mtzh243Lkw53
         oLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373247; x=1791978047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1S+23ZtOjWwrYVTwNmNORRFxt1wYzNyVlF7uFakN9wo=;
        b=XVAxNT/Dlz/+MX4F6TBGaniD0lE0orl4VSsXgK63cfSFj+7hd9fUwL0vyAGP+H7Rpt
         9XIfDXawUGL2lXPAbMwXc8SfqW3YkZaYfF7rFI1iRZH+t0deYlWYP3dYFFx9/JMVrgbN
         qOBeuoijhVLntLrhD7RKlT5QO4CwVRaS1M5txCyUUIUGxDPaCUf4w1bNwDoQlGUgQsSJ
         olc3vcr++3PG0aPMd0PUTVtmI1lNKUzPoTxt33+glwpVCCz8hb/x8OBWaqg7q5A+fhkQ
         hUipuvzO+DaE8fcofBcFZa/uHPEwfgygOwN8eNTdBaBovllEI6/GHTSyn8loP0A42KQR
         mt7A==
X-Forwarded-Encrypted: i=1; AKwUvBy/LRKZ+GwO1VmFJBHz9k4PsG2HSE7HVEjq6wuXSj/cWe5nT4XDW0UKNoVKpj4JkjKc3609HkDY9cb7Py2jNE+p@lists.infradead.org
X-Gm-Message-State: AFq9FYK+ptqSZOP2RiIaIf6+FRoMovNzP+LHnfPDOn21t/ps6fLlZPWj
	YIvfiB9AJCTM1wMBxNAeX+8CGPVJXug78n529wKAE9NPtlp/xzU3Hpc9
X-Gm-Gg: AYBFou3LanURZgHuwIwkGR7swKeVBJBW2Pj59qXXoP5aqev2qHZLcUXifnGwqVAWUBf
	309aD26NxbIRUwi7Qjzkyt7iyKZ8JdqWVWAsg9fj9JeRo/88hm1FsWzZvA6ZnbxOx/dyUxWRuEO
	yzZ6wAMFyDeeJBDnPSWvEMGRCM/Au2WijQPJmbOAToYHLue4q/tfKEkMOkvS5j/a/fBKTtji66C
	JnXJgqEbkpIo0Mg/070lFL3XjMMMVedHwcXcOU1NM0zi+xLJKhk/5IX5LHFrvSQhvmbzxRgRNxz
	d6td8txQOqAwZfFl8myiqc7pfK9+P1esNVASnTwGlHt4K/obK4/yixqrwahWrK2H1QEZCiojAVy
	VPmxVArk+thgtxWNsL/jylaLFTaK/hfJvq0qrtuFn8COP7MJudcPzeeqc8ayl8sOBtsyw8Ygmwl
	GZz0ZK0SMwJOHpzE27ziQZ1WCbMruWzJX9rR3ceXdY5XlDQZwbQRdyhg==
X-Received: by 2002:a17:90b:384d:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-3a8a1553dedmr1695567a91.61.1791373246732;
        Wed, 07 Oct 2026 04:40:46 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::8534])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89b5c5d9asm4127072a91.11.2026.10.07.04.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:40:46 -0700 (PDT)
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
Subject: [PATCH v2] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on probe failure
Date: Wed,  7 Oct 2026 19:38:36 +0800
Message-ID: <20261007113836.115774-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_044047_761008_B75B0EE2 
X-CRM114-Status: GOOD (  10.15  )
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


