Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691FCC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXQnRB/nHO1IWYbvBq2662vmfOoejPsA25AzXQKF5g8=; b=WsUe6zwDSLePkldRSDlgT9rcvu
	NxIZQWn6C9APTwxh6eOFjh0Fba6mkeIzrMu06Fs7haA4b/6oIL6uRG9mKWxoDNq6x1QZ6keJ6z8l2
	0P5wLVT7O1h392rdxmfpbrSQbU7HyE5YD7IfVqzHGLSKwCcwupOeXtmWdWa4wpV5F/kweDVypCe/M
	upGFk6fWW8PNJpqKM4TanxnWa/duVEP15JsqFpjLoz/nGH1N1IJUv4G2bVCwcf5vwTqPawD3LmbqA
	xxFEfgfh/4yUKYbJlSbOMGyE2baF3v6eOBdvSjDLaj39b87iBEyd+ThfghC2I2AE37vAik1+Z9JaS
	7X5cfBtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hYQ-0000000Ar3g-3gdy;
	Thu, 24 Sep 2026 11:23:54 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hYM-0000000Ar16-0zQ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:23:51 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-398beb616f5so780799a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 04:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790249029; x=1790853829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXQnRB/nHO1IWYbvBq2662vmfOoejPsA25AzXQKF5g8=;
        b=eV0Qb2U+nA9jqq+mnsfhSkhHzE7jvJyN5rNke3Q6+la8xXxdCHwwJ9iuZDHRvOEep/
         OMnkxo9aUVAaRqe80WveSz7ChE9qFy6Q7DIXy4+y4QVgnwW9E5+pjD3hLsBX0P0ztff6
         SfQfbOurRJRV11OmlcWarEceJeP8znR0Lx27/Ji8KzsT+TFhOajl7Szcif5HI9DfWct9
         mDwy7aq/Fl+mcTvJG0iChXucElOuWtcHMu1qhuCoEmL4nt0T50EIYjM/NKYNnIZ4Mx/E
         2u1Csj9vHnLgOuq7NbzC72z+OEglALZ9vL2VadOQgIdsnXgrU3wGA2vn+Ksl5KGQTSFn
         Qs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249029; x=1790853829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXQnRB/nHO1IWYbvBq2662vmfOoejPsA25AzXQKF5g8=;
        b=fAPvNd8B9LVl8qDbouM0ABDy3nXR0nTu1A5ZhTM167oYhhH76SbiVWlE69Fi7UiPPw
         fvVZbcmtMECdQn1Dtxod53F7VlGf93uSswrDp1UpslNK4AKXq9eNmsVAB0z0+3Ppq9OT
         b+uOefgZ9d+cGc1dnZklhzjB606GMzzBBm+MsNxhvF9ilXki5qcQgt2AZywdi+0PW1t+
         yiDFZg1xIU2WCm42vRbp2FQ3DYPnOYF1Ivw6cnNxRhP8DzP+juBYswP0mV/bAJGJ84ee
         luqr1TjaudZbbX4OpGA+xKzniZQmFFSWUheLp8YgF6pw5QTcKCBt0sKhiEbxEUM0tFaR
         Gs7A==
X-Forwarded-Encrypted: i=1; AKwUvBwg72LZlzWDDfYG2VJqwEUgqQyT/fSCKiq1Jadqer7WmF1bRM4Nz4SvL6Vw9SnLX8iIQk7qlEtfKkL8lBibMb/O@lists.infradead.org
X-Gm-Message-State: AFuF++kEHoWNUhJTd6MzD9J2IqH3z+MaMmV1ukC1L8gkuWdHh60t+uKD
	vcSQoAIX0PWyjUft7FMciRVzSO/Dxjy3e3wOwaRftElFEs6j/gAKyET5
X-Gm-Gg: AYBFou0Zr12vx+KWUXK1zdz29aOD28U9rA6IsGTgg3UjiFiF3nJ8C33X18TlKUOGLoG
	7syFwF5/GZePLSbVQ5YSvFUubtvWrOK3+OaYNlk5FxQAeZ3/qa0tSMqbX08uoM0Lq1LwrVTYuZ8
	DYEXoQ3Km6jmjipiUzzwRJvYz0wJOtYMirS/Lc14jK+R0FEKujEz34tgrIL4ZCQd3Z+wRAu2Rwe
	KipcEn7LKXYbRg/5cqyqXPQ/oG52Md8u9WXTnGzuCMosQc1s4yLTwgViezu6lbb4uT6QTHx64qO
	Vc3v+j1roWJ65Mkqs7gH59ROXVVdd83wtlFsM4NHzlOqRTisnebw1kjt4IsIG6Lu03R2k9Uzu3L
	hi1Ot3nOWDDzX54WjLNfj1LRu0WAwINusxc6Do86rfs9E2HdDGhs+5U915gBxj+UTWBWsidhE0n
	KnR/KqJbRJgx5Vanwyyle9LBP60Efs3ZAVghHmSis/LOSGDxgznu5m9Q==
X-Received: by 2002:a17:90b:2e03:b0:39d:e1da:81e5 with SMTP id 98e67ed59e1d1-3a09864ac91mr1422278a91.11.1790249029396;
        Thu, 24 Sep 2026 04:23:49 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0813318c1sm3586800a91.4.2026.09.24.04.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:23:48 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	jon.lin@rock-chips.com,
	bcm-kernel-feedback-list@broadcom.com,
	noltari@gmail.com,
	lgs201920130244@gmail.com
Subject: [PATCH 2/3] spi: rockchip-sfc: Clean up runtime PM on remove
Date: Thu, 24 Sep 2026 19:23:28 +0800
Message-ID: <20260924112329.1566051-3-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924112329.1566051-1-lgs201920130244@gmail.com>
References: <20260924112329.1566051-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_042350_278243_A68EE003 
X-CRM114-Status: GOOD (  10.05  )
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

rockchip_sfc_probe() enables runtime PM and autosuspend before registering
the controller. After a successful probe, rockchip_sfc_remove() tears down
the controller and clocks without undoing that runtime PM setup.

The probe error path resumes the device, drops the temporary usage count,
disables runtime PM, marks the device suspended, and stops using
autosuspend before disabling the clocks. The remove path lacks this
matching cleanup.

Mirror the existing error-path sequence in rockchip_sfc_remove() before
disabling the clocks.

Fixes: 8011709906d0 ("spi: rockchip-sfc: Support pm ops")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/spi/spi-rockchip-sfc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 662a994da60b..6e1c7d6318bb 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -747,6 +747,12 @@ static void rockchip_sfc_remove(struct platform_device *pdev)
 			 DMA_BIDIRECTIONAL);
 	free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));
 
+	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
 	clk_disable_unprepare(sfc->clk);
 	clk_disable_unprepare(sfc->hclk);
 }
-- 
2.43.0


