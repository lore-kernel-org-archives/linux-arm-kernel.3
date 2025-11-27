Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38115CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 07:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2dVF2KlYm35Amf2a5Gnk993yXcXd/prgPbjpDZiGmKM=; b=erPDPrY25pJaHnbJ24UVaYABOf
	tFWy99jaigLfHI2hfWCc0UI8IhpppD4k7gLH0RbMxq6+d4hIgrr1lsyF3iqDlpadXz802TR5Fzmn4
	UnZDPkrQPCi2G59DNKIC21n+FVVPu4MH/E5ATsk7ogjQi8Rg6jbCqJRX5fzuoHWOTQtgKHguC92jr
	iPiRy7Fpv1yeA/jQeTuk7x7J1rdyXtPILw7oEXeOezDFU+WGbjILElf3ht6BPd68atB1nx5xsAWdO
	5rojnP51rhISAU3yC73WZX1K1Jn99e5evix88lDheu0uQi6NbfZHJCidKPLF6vpjghRVK3FGyxDeW
	C0xtee0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWCf-0000000G6aL-3AAp;
	Thu, 27 Nov 2025 07:14:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOWCd-0000000G6Zq-0n3t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 07:14:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso2137305e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 23:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764227645; x=1764832445; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dVF2KlYm35Amf2a5Gnk993yXcXd/prgPbjpDZiGmKM=;
        b=Unu8QbudH/K/lwzJ2bRpJRaw0d9OCcHUkt4aqRo/bWjqv9rEIA7mnRt8TCzgpJiRJT
         vwvy8ROj194Of1JAjt+tmG6awrYlqPH1sjVMK718fQ4oecNfUY3ceQKmpFX4BreOT1X+
         aHkFiZngpaU/4Z/k2WU1+eFl/YqaLMA4x1HQ6cmN/QZczeo0MlTJ57H7ZHRfixvVWKd/
         TtnLiwCly+I/sol8VsxexNClR0j14wAjpcXcrdJxBfHjQhMhlcsggjXLXBJDSiyWrUIT
         HFc8MimLTsXgNZwvIv5RBr5xiMINA79t0KvrRPnCk00gLC/D327fHSIjyBTNHCR1roa6
         O2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764227645; x=1764832445;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2dVF2KlYm35Amf2a5Gnk993yXcXd/prgPbjpDZiGmKM=;
        b=JavEXS+W1qQ5Ko8lMM5ApwqzTwdcT/2GWLvibae9y+hVOUF9nHOQE6F0vMu6u8VQUl
         6WLih1Rzefy7kO+x9sCaLX3D9rWctmyAt2aF2opWpslZSK+7eu5YQXxf6svzO5gryyFI
         GGHR/m/1zqkE8Pjvj9Fd3gVVP/N3hnaiabwDsVyoHop7TJcKny/5RHj7EwdMAzVJMWOy
         6IUWtarOxRT1bRfzqn1KjPuqzMF1smpxabMcTuE/nS7oNNNnIBYx0c5wtaxWefqFKvxA
         t8NArKKBekxD4OzdlhAzdIsinLmZ4i9Rb9VCc+DzvVpjSTXv5/oQOSdjdRhL2c0WR2VX
         XEdg==
X-Forwarded-Encrypted: i=1; AJvYcCUuf4cdLxxxbxLmfHuSjdzLBIIG9Aa6N8sHDsiLcZOKfxHsFa6h/Jq+o89D/g0ma90Hp1tRMB02T8/x/R8qmuyu@lists.infradead.org
X-Gm-Message-State: AOJu0YzD9d4trvmdFqigwYJwcxs7g9o2LkuZTlsoEJAX3tR/9ru5qMM9
	gd6LS2kJcHwip5qRCbn9jmLeXhf9KBRnS/zs26EnyvrbEu7XsrlOiT5xSDCe4FBG4wM=
X-Gm-Gg: ASbGncvNwRXl+dq9I1lVO/KVRRYxVr96rejdYFS9f2kDpxO3NA1MuYk9Y4JqtYvD4z8
	p0LOKCjkkFLmHGnb7wz0zzQGO0xYgMDtTEsPEeOsGRrIV/XhYzW6nHt5qxmA6o+gitG+V7E5ECn
	Ws0ToG3MpYfFV+LDZvWjqrJKF827Wp4umWvybclPki5On3QpmgjWYlbvxp9GAlCeV1XfCf7l8vQ
	iUGiiZlRzhk325Oj7puhEMTKYLDe7fN1lysnl9lKCwyLBAZdRRun57vHAU++dmffQiChIJcY8Py
	abXEvh8Z7VRxd+9SpmFQxF71GfhsNDlIK6rQ50TYOQVawNa8IepVFAUBO6MNguwBJxcEzwfQOa2
	UaR3KhKbmu97ohWfJotcpZqhq3VUuR3ctaQX1CTG3e9gxDsNAqp8fahVdTL/gfiK3nuiLBzV4Rt
	JAKVL7JTnPWyCBg453
X-Google-Smtp-Source: AGHT+IHh2yafLn0h6WCQ3rAqHrBsqui/zuUk1dGdvyyNWo27ENOUkyCq/IzM8raGe5NR4RM82hlgnQ==
X-Received: by 2002:a05:600c:1f94:b0:471:1765:839c with SMTP id 5b1f17b1804b1-477c1117949mr172473655e9.20.1764227645302;
        Wed, 26 Nov 2025 23:14:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479110b6da9sm17043815e9.0.2025.11.26.23.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:14:04 -0800 (PST)
Date: Thu, 27 Nov 2025 10:14:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] remoteproc: imx_dsp_rproc: Fix NULL vs IS_ERR() bug in
 imx_dsp_rproc_add_carveout()
Message-ID: <aSf6OerBbPcxBUVt@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_231407_234669_86B3A0AE 
X-CRM114-Status: GOOD (  12.91  )
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

The devm_ioremap_resource_wc() function never returns NULL, it returns
error pointers.  Update the error checking to match.

Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index be83b5f20f15..5130a35214c9 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -710,9 +710,9 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 			return -EINVAL;
 
 		cpu_addr = devm_ioremap_resource_wc(dev, &res);
-		if (!cpu_addr) {
+		if (IS_ERR(cpu_addr)) {
 			dev_err(dev, "failed to map memory %pR\n", &res);
-			return -ENOMEM;
+			return PTR_ERR(cpu_addr);
 		}
 
 		/* Register memory region */
-- 
2.51.0


