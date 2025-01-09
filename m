Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CFAE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=exTdB6THt0qb0+Zib3wip/J1v0gX7t6NiMKROI4GdwU=; b=Qh3VtjDpnhnD2WGlR8R4nk0YR7
	6Ys6vHm/hxHxGYYPmXNvgPAXl6EkQl62hgjXJ/BrtcBtVIwp6nLt3dkhxx/flbF4n3XMFEolFtQii
	+C6rZL+cuwsi+Ty5chUUkFAAYefSS9PWWdVCJv/PC7vuTlqACpRNJHa1l7+mX9+3ux0lb8ohkWmRM
	omPk2g0bdjh0bwA73nDl7VRZJ1BnlxlC0nPV//ZfsZt06ikNJavZ3BrjoGVd8hfPliF3f69KbVnU2
	vX5Of/4xQMvfahEs04hROJVDSHw1Kn/OcFFvTpDEUa8kIwVm1DcXU/JDBMF/hRls9aBSobbbP3MKC
	7D4ImwAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuOj-0000000CSop-1J6C;
	Thu, 09 Jan 2025 15:24:37 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuLF-0000000CRox-0cnF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:21:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436341f575fso11793205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 07:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736436058; x=1737040858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=exTdB6THt0qb0+Zib3wip/J1v0gX7t6NiMKROI4GdwU=;
        b=jmIZtswarzV5dd4NyhA39iJED6NS5kMBEXiG/4TAY87ry2W95b1mHifHq2Vyq+jP6U
         jFiDSIpeUlxqh135CDMyZoQBvvfg4o8nlez5Gds5oWJmQR3S4EMLZKzl46VMty+JpHbU
         RKoECvLEtRPP7NVUhLNZ+jvAdPVuFUDVQVOMe/ZZM1PqJLW9BTibhWbgbnBr7a6PURV6
         z7MJZYIoxSYuk+TzsZ1ZvsJg7mOzgGWOumv+VQzl+PxLslym/e50bKi2kFecPC8ksfuw
         4UZobRgZc1tNw8zqDX1bRdAlPyN/k04uHsMT6ptnA4Y8V0S05GXA6fJhvaAFKJ2fdTgT
         Ivpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736436058; x=1737040858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exTdB6THt0qb0+Zib3wip/J1v0gX7t6NiMKROI4GdwU=;
        b=MEoEhRmrqJAdvrm+QsxTz8pAcHWxNNfOcXDorMTNxYDYV5lwiCTg+/aSOXsYWlnuu7
         UPr5Q7x0o9DFFkNWUWfwJ/NeRVa9exGIGde9zkEtUtLzGzFIOdfhSU0pz6iOr0rPVoKL
         ZCOccQ+bXQb7MYvzkGITU4uWkwF0c0s3O35L/A+DT7c28WAyu9M9jqrU+UDHXLzjODit
         nJW27lLZsVoMDDB4USG5n3GMCdT655OIOAoIIQ1l07qK74PoCAqDz4V1jKXlWd5LUylx
         8kZdGdkwivfpJUsnhbyh2nDeydj5MvHAoTcRfc/jG1xGKTaT/ZHpvTNqAklNm0cxj4Nm
         dqJQ==
X-Gm-Message-State: AOJu0YxmIR1R0rLxzde2f6fG0TyHfWVuqDj0v0CiTT1n9F2Xhew97m+k
	Xoj8wDVNAFwq4Osc5fgcLODjJBFRmTIiBYc+wy0SFtjUUZhXygDe
X-Gm-Gg: ASbGncute+6hNkdKuhWs/XcFkO33agukw/eJaqQdVhgQBJovImayA2NmRgi+D+zkBGv
	S81kMQUyE/01d1bMrYnKQANCNdUAUI3T0SWumzbgr6GPRJIJyLzgSwFnhKpCdQVzoxfCYAkM+SB
	8Vewo0APNocPSWKV8w/yluLXU4EwBYEKuI02DRbGbaUemMMzO3uXGusWdVOD2Yp8DFnM3KXdDnc
	wAnV1WrZi04OhswXJbqt0ULxX/UWFrC3WYdERlN9lJFmIc5eoaAeI76
X-Google-Smtp-Source: AGHT+IGVtF5OB2FrTFOAf2dgKuYZpm4SblUZ4Y9JRiHfrY6DtVzVJDDxyLSFvVtEBlD/IUlZuJUiiQ==
X-Received: by 2002:a05:600c:6b6f:b0:436:e86e:e4ab with SMTP id 5b1f17b1804b1-436e86ee529mr43113535e9.30.1736436058223;
        Thu, 09 Jan 2025 07:20:58 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89df1sm57766015e9.27.2025.01.09.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:20:57 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: dwc3: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
Date: Thu,  9 Jan 2025 16:20:55 +0100
Message-ID: <20250109152055.52931-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_072101_347536_E12F74A7 
X-CRM114-Status: GOOD (  14.79  )
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Changes in v2:
  - Split serie in single patches
  - Remove irrelevant 'Link:' from commit log
  - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-1-c7d4c4856336@gmail.com
---
 drivers/usb/dwc3/dwc3-st.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index e16c3237180e..ef7c43008946 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -309,7 +309,6 @@ static void st_dwc3_remove(struct platform_device *pdev)
 	reset_control_assert(dwc3_data->rstc_rst);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int st_dwc3_suspend(struct device *dev)
 {
 	struct st_dwc3 *dwc3_data = dev_get_drvdata(dev);
@@ -343,9 +342,8 @@ static int st_dwc3_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
-static SIMPLE_DEV_PM_OPS(st_dwc3_dev_pm_ops, st_dwc3_suspend, st_dwc3_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(st_dwc3_dev_pm_ops, st_dwc3_suspend, st_dwc3_resume);
 
 static const struct of_device_id st_dwc3_match[] = {
 	{ .compatible = "st,stih407-dwc3" },
@@ -360,7 +358,7 @@ static struct platform_driver st_dwc3_driver = {
 	.driver = {
 		.name = "usb-st-dwc3",
 		.of_match_table = st_dwc3_match,
-		.pm = &st_dwc3_dev_pm_ops,
+		.pm = pm_sleep_ptr(&st_dwc3_dev_pm_ops),
 	},
 };
 
-- 
2.47.1


