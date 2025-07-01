Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77418C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLehfsqvOq2rldbx14TVd1s2tM/WPFuPqjQ5HJp7toc=; b=pdgobED72tPq+aOLSzxcbBSFhA
	dfpIHL2PIVrcbuc0nHyb8wQA8jtqPkf5oqkW2jprzj36greDpYlwDmXdZLSHFXwhq5K5yv4erqLFn
	Kq1UHGugUzWUxEe0Jwcb4DgxUx4yKBPcp6Dp4rBM+UrxZctNNsil1CuuricC1EQWRvKVSjRPEImqv
	wrefDbXT71OVjSqEdjazGG3S9QFhwZCjCmlvH0clMNKVfsCGu4UzLCo96mDFmhvoNESGFD5iuWkSB
	9bxluDJRiBtQ76n2fdTz0YRA2YFIULXxXtj7C6lk2ERw5VkY4ScAUe7Zs//H+UxQ/RGI9DApNa2CI
	xq2zfj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaHf-00000005M8T-0m9Z;
	Tue, 01 Jul 2025 12:40:23 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZTB-00000004urj-295D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:14 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-555024588b1so3686908e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370492; x=1751975292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLehfsqvOq2rldbx14TVd1s2tM/WPFuPqjQ5HJp7toc=;
        b=QUW1r4NZSA6bvaLIufJTSkcIsiCDVuyGJcyQbbjcims0Gn9cmSc8s9dkbCrkQcNf/C
         p7Rq4qypHoAa2CoBLXkTCdlfYeWi7AS6f3wJG7GQJZxrKrhAekyGpB72N7j/bhSOpu6p
         urHBxgfbuLIGZFv252jxHz/NvCXKhkxsqWwxS5CpnIhmbqGt9uwYZA+OXlQ1Pu1+i/2X
         +N/zHhAxFQ2cZCbj03b+mgjTW3+xYbaXHlMIkvH8GE0/nj7NgQdfUOEl+Sj2/DeVuMip
         GER/kzWiPh2hHKkQxSdPfodxQ01ZexQicGV2Q5fFyxJzKZP8UbJzijaUhKWfASLqS/36
         fJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370492; x=1751975292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WLehfsqvOq2rldbx14TVd1s2tM/WPFuPqjQ5HJp7toc=;
        b=cgTXxPLXmADniXIXMzSn0r777wNcrsNULnff2yzPgQAPxJr7BnGiZ1niK2qQxWXkgV
         YxGzylRNDPWibtFNyibynRWTMga/bMWFmWVkTfBBhY5vb5itkOcq0KKuIpw6pLnbZF67
         rC/a6Alx3cNE8CsQ31zB0vITit7OOOrydi4GFd7IHCuHYjHIYlvsQEYPJwn6CYQ+JZDm
         MAWV27fQd3MpUaXwH1jSd5/jjDELBkSKa3HM4FvgSxcTpTyd/KyfdDPtN4P1YUyWM+Zm
         gkopNIUXrwb2U8/OEBZgR8/gd9zI0+VCvmcDwsA+Qj7UYFGpI7yOUQSTsWtIfB5MI+HY
         INgg==
X-Forwarded-Encrypted: i=1; AJvYcCUI7f7YZHcSQctovU2DRNFhxEj+suzv36fHrptG5YlAd23JPrBSNtue2h0SYWaaFJsNzPu6SO74uN0x2nHRCA1m@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1lHowwEBOsiy2yFl9/aXzu9LU6hK1nSz6pylm1NpoIWzx8LuD
	hO7tZZYpl/24CDZ4W3c8GXna0e95GL3JATv3ig9iEsU/YPYOS8Y+dR79SJQylM1HLJQ=
X-Gm-Gg: ASbGncvjKsx0p6zeDFwuRnmkQGafOC7Ur/GUtukB8c31hs1lfepptjJgknPJrhDImqn
	rHj8DFd4OVtkX0clt+wYEfAjPFPaQoaQU3sRIMpFa9O2cYGwsUOMxezaXnALrG21Pjw2YNBYm60
	vldAk46YoNsUPFaVmQxbrCKPY5Uti0gjzsVBYNJg5ZPtGVDLxKK+Ec+Z9mLqsg3oiGcoaW1hNjR
	gGqQcLN319mk2DOw0VtqwBpQB2jFdYG6wWZv16+EylPYMnd7I9UkfHBEkbsfYotYgdbrjGtC+lF
	VnD73bTxMwFXRO0xbx6Lqb9311rt9+qN1q2VFu+I+Fm4ZtUnPFrJj07u+5NSG7yzuoCdVTy8HWP
	7PfSFCkCD+HUqk4kJ0nE42+OGkZAWC8sGCN7r
X-Google-Smtp-Source: AGHT+IEFrJBlVC7VlfyoWKCWgUF1BoulcpmDcaoQJgnAjb01VTeoCZDNnR+9q8S12QM4kbT+CovL2g==
X-Received: by 2002:a05:6512:3b9d:b0:553:aadf:b0c4 with SMTP id 2adb3069b0e04-5550b811339mr5665246e87.11.1751370491736;
        Tue, 01 Jul 2025 04:48:11 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:11 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 20/24] pmdomain: core: Default to use of_genpd_sync_state() for genpd providers
Date: Tue,  1 Jul 2025 13:47:22 +0200
Message-ID: <20250701114733.636510-21-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044813_551995_43AC70BF 
X-CRM114-Status: GOOD (  12.34  )
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

Unless the typical platform driver that act as genpd provider, has its own
->sync_state() callback implemented let's default to use
of_genpd_sync_state().

More precisely, while adding a genpd OF provider let's assign the
->sync_state() callback, in case the fwnode has a device and its driver
doesn't have the ->sync_state() set already. In this way the typical
platform driver doesn't need to assign ->sync_state(), unless it has some
additional things to manage beyond genpds.

Suggested-by: Saravana Kannan <saravanak@google.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index ca47f91b9e91..5cef6de60c72 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2600,6 +2600,11 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 	return ret;
 }
 
+static void genpd_sync_state(struct device *dev)
+{
+	return of_genpd_sync_state(dev->of_node);
+}
+
 /**
  * of_genpd_add_provider_simple() - Register a simple PM domain provider
  * @np: Device node pointer associated with the PM domain provider.
@@ -2628,6 +2633,8 @@ int of_genpd_add_provider_simple(struct device_node *np,
 	if (!dev && !genpd_is_no_sync_state(genpd)) {
 		genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
 		device_set_node(&genpd->dev, fwnode);
+	} else {
+		dev_set_drv_sync_state(dev, genpd_sync_state);
 	}
 
 	put_device(dev);
@@ -2700,6 +2707,8 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 	dev = get_dev_from_fwnode(fwnode);
 	if (!dev)
 		sync_state = true;
+	else
+		dev_set_drv_sync_state(dev, genpd_sync_state);
 
 	put_device(dev);
 
-- 
2.43.0


