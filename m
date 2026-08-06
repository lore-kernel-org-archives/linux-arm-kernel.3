Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C961BC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 06:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=331DRkSFWDCKr7dCFic+xle6jZcQv2JhNVnEK+JljZE=; b=dHXNzApZV4LANipWVojVcuMY4h
	I9waIOayHaMhL7dfjxr+5SoLTCRRV0t8+uAhVP6uwON3nLWjdV7qjy1CBkzzm7vU6OpX08PtMgIXY
	6v0U9r3morFD+Vc0saHUTpy1xgiaOaylgp55zEM6Waxh8NnAaKH1U2kJlsU7pxCMpx/hGSN77K5az
	3dt9QHHmC9krR3rvQWmujynJhnoAPfDEXDt6uRwNw5+Al3FXWjhj04pYX5Ruu/M9qn0pPJEe+Mw1q
	Io2ckummtURk2jXVPLOtkR4qa3DoZZWJK+1voXlA+gbVU3Bp2RUoMaSz/8eODlyQutdQL1lGRT3QD
	12chrNKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrryc-000000055kk-1pYY;
	Thu, 06 Aug 2026 06:53:14 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrrya-000000055jw-1FjE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 06:53:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1694973b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 23:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785999191; x=1786603991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=331DRkSFWDCKr7dCFic+xle6jZcQv2JhNVnEK+JljZE=;
        b=hVOGXW5Qi7lsbJFQb1ALnRLyc2urjb8kwPoIfTToCdzS8rWO68NINvWQGPb2kka3a/
         ROZcpPIDYUD6S5mirjbVqlM3bU14f/js8SLUjcUtECoh+w14gvYM7UdvniddTqGoBfeV
         DMdsP+pJ/7aRqhtlxkzGDb+676oHISS8Huk4saxteINWNiGlabpEwkId3yBeQxaSK5AZ
         aVJdlrcPM187D+HIzWFKmnxi6JOUX6JOhVIdjXTKdAuO1Jms4MA9mcu4cYTcoKpo1nVW
         mN/kp+ENtU0ElJZf/0GEHKVZItSin7rD35bx3ahM3Exy3h66eQNchWUB+9G84sRULWvM
         NDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999191; x=1786603991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=331DRkSFWDCKr7dCFic+xle6jZcQv2JhNVnEK+JljZE=;
        b=OvkajyomnBrhy77BWRZIBWQ7pHqiE6Y4VqUOwakqdCqfm/OIt+ZVQDHenC2ESR8uUN
         0NiHRA2EQRwW2WxNdeWxLPe+zTi5xaXHXFr+5L+qMQ+y5XBwGMWekko3k6klT6WXe2iB
         O3GCSuGVzWACCM4dt76AI/ubuFKHRse10o3vFhYrVmslnUX5dOWs/Z/cqdR0GOVnW4Gw
         T2QWc9SRUVWk9FD5MHQ5T7qI9i0x1HA7HfghxvswzoE91On3iTq7k6YkRD/N36Srd2yF
         yogGuJinzMDQkgWqGpHX3wzk3EiqW2UzUXvVNd02xsLX9PnPcMCbWlwEsxMb6MNZo2og
         3/hg==
X-Forwarded-Encrypted: i=1; AHgh+RoCqe5BcWLOPF3j5qBXwB+r12vppca0SLeg0RBZgMJcm1sb83YlW6HpZoQYCwS4aEjOEsyg72HNcNhrUUwex23T@lists.infradead.org
X-Gm-Message-State: AOJu0YzS/DdUs+aQOPMQmpHu9Wfdb0vuekPzsHkHsNzu/0wwgHC5+o61
	/B83w0BDWqefij6pmmHNqZ+FEY+LeYs+zKp/GFqjK1/qM3nxLCsc8/os
X-Gm-Gg: AR+sD11qh8O6/xx3fhwftnhQMj3+VWyQSmQB6ac5YBiyETCAfwauhgLlVg63j3OvnjH
	a+2Uo6skzsLzvswgbQ/6ajiT2AWxBo9kBh5FLUn81tkZWeomWKLWYcwHeFVbEgXQai2aALDkWEl
	OY7kOmg6KJkBaf/NroM3gpE1iV4RXCN3bZDT/7PXX/uHUtCRcBP9c0ZqE3kkwDLhfs9KNx/UrNn
	2PGyVAA5WxQ9rSfkF9oQ6TvPDVxp53WdU0TPcJLzB0Jj3s+9zf6+1xe9c+LFrhybC3n5Pm0Rttr
	4mBauMF3Azy3mHLOypYFPHCp2yCKhdM6uDfdfvWU6xwza9HLI4ZIRzwr/VG3OGGXdewDBZ/EXil
	EvN4/PjEzl8HUyY71DErfOMgG3FOSKQuRHrsR7izUnZVcWDOfwHY6Uw/Lov75vi/wpYn/Rz0z/b
	g61dzcpna8JbqTGTvKb14+b8vyWKfxfVnToKAUJ8IqLcr8lqXbqJ584GbzUzCWckat3X6gP/rqk
	3xqLvzk/6vC+srp5L+2CK/ppzQiHsZc7U4rq0/GmEbr9CP20IAuvdoY2MfZ9TSIfSBAaRxOKMxT
	SY0u
X-Received: by 2002:aa7:8884:0:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-84f2e031490mr13109342b3a.6.1785999190781;
        Wed, 05 Aug 2026 23:53:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f459ba2b9sm714920b3a.48.2026.08.05.23.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:53:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] usb: chipidea: ci_hdrc_imx: Propagate -EPROBE_DEFER from IRQ lookup
Date: Thu,  6 Aug 2026 13:52:54 +0700
Message-ID: <20260806065254.28204-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_235312_337478_D6D3DBA8 
X-CRM114-Status: GOOD (  11.63  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
re-probed when the interrupt resource becomes available instead of
continuing probe without an IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..f53d09e90010 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -525,6 +525,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		data->supports_runtime_pm = true;
 
 	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->wakeup_irq == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-- 
2.43.0


