Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E757CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mEyqxPQTlvHE7Rb9nf0Ka5S6ku97HAqdoQLaDQei9o8=; b=kiJgSNG+NT5KS0uY/p2iQyizwn
	rnd2udJwAKkh41tGIeJKLNBUyuib0VnCHEy5MhuXEsLQWPs4n2RDGi5kFwBYMzdegeMg4Z1WIiX9v
	coVO2bxcj1ZbYiu3DOAocOd2qmtZ16rZVQoEApJAW4iJiAjHAr1Uulmt8zMD58+6K47BXpJWqjGFK
	PcbVn7jCB7jLIfg5YZv6aHGBdnVniyOy9JgIyMTvZVtYejWWUi0NjTaYtiumPEqRlEBvedbDqt3Zy
	h4yWMjTQdUwAVAIYizQ7nOe3pwWmPAUjtcKmIC7+uir6infD7qUiASCMaljsFBas0c4kG0hhFUuzH
	9xNRqmOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSfM-00000000ibO-3GEd;
	Fri, 05 Sep 2025 09:23:32 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRQo-00000000ECf-0ffE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:04:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso16765905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 01:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757059465; x=1757664265; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mEyqxPQTlvHE7Rb9nf0Ka5S6ku97HAqdoQLaDQei9o8=;
        b=ETROF4dsni8H/NAerxueWrBLetWZmRtdohLXCM3s41aICwvtbHvBj6wESe3PJSS1Ii
         9MqJKvXzKqA0Bvm6JDCgzPFKlCcIWobPXPSIC+Spfh1OQzokx0ElBM6gb4sebeip/pFC
         UkODQdRPPso+m0xBaEqMdSilqxUZSfEMINgadc2kbHD0CE44qV3pLYYtS9WvBAf+Dkzy
         pDGwJkfEpI/CUeTQD1ztm5ywarIiO1urM7fcv+vvpLLWL/BfdLy6LuwGCuTGzq5lxdFi
         1xDz/Jtc0Kirdxz7fek6t6xJVEGdgFsTSs2xVOSMEwAwAs7ZV+CqOQBP6XdLWlh2BARy
         RTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757059465; x=1757664265;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mEyqxPQTlvHE7Rb9nf0Ka5S6ku97HAqdoQLaDQei9o8=;
        b=QACarnpjt0Q+EoBvq2+mO1VJSpEXSDmrAJOBQ89RO6w2ucn9vQBMqLSFs/CdjtBFoI
         Fqigjk2MRN6gnFSdTbcbov6WoLfzQHkwJZ0Nmb/FZGZCVhzWktVMVfV8IcXV55cCo3I3
         tzHklluvmA8NsRq2dqNKXekx7wnqA+sjxajCbdfwvYCQOVH25+hGoU70BVx0WWoCMU1B
         R6wm81DZ4Xks41xKa0fJTHyDiyxhlY6SOKsnGwsm3rOVcB9sdnUuybG+YB1sJ21q9dxK
         M5PTVPqvHRAS8IYHCKqDDqYn4pxMZefChJRf/bNgu87Pqh+pSYt+CndYR4mNty1yZ0k/
         j1iw==
X-Forwarded-Encrypted: i=1; AJvYcCUmCMQJ99ZKiE359J6wDiVh9tFRXHZH53kOmyLgh0mJvlu7/I7x80ai4gPxR6v2yapKTQd3k6hZnnFs/WUfC6F/@lists.infradead.org
X-Gm-Message-State: AOJu0YzqbmC8iqGoD4Ofp+IttojaaXuFWst2V497JOjZrZ73ePT0J/DZ
	mIyxo3c6+ZG77BSm7dzeDCceYJINYL4Da0CuSN+XfURadeBWU2qFnhKVGRREMgBN5k0=
X-Gm-Gg: ASbGncv7n8gnK6OZRd6CcgdOuY0CrBgF/OfAt0pPjNApIr6eDLdRe+iHKmokVajUGLX
	S30aYGL+vKg6506lVo/vqRbaYfj1uTNIFzmE9l5e84D0xSqsMM+qNkw4KZL3xXMtadXdkQ0VmlQ
	YhsxUoujBl7IKK08A5AOhSwSUlHOqmGLOL42pFCk9i+op7nZ0b33LsyW7iye4Eri6l1mmFVvnP2
	+Asw/WALnGweOS7ZJQjgA4ab1MMutDQFoXK18SvLxyMZKdeAjYWjQvQqWd2jCphrRg54AOVBwrE
	p0CvT/zSAAzVlUVEqjC5GCNlOh9yPgRcgwm9P1+OTcmr3HzXOw3Y6Tt+4vlXpxsNkrq9Ehy1rQQ
	sgATaMXr56tcfbYad+gcotqyhKrhmbK4zFzkDQUtqRaXZ2mxE
X-Google-Smtp-Source: AGHT+IFg31bO3+yEGrU5RDt0pIsHa2/S7Tm9NAlDysnLBMH3Sorox3ujEfiAyqMx4B2CxZfrtHTl2w==
X-Received: by 2002:a05:600c:35c5:b0:45d:cf5f:cff8 with SMTP id 5b1f17b1804b1-45dcf67429bmr53251585e9.11.1757059464523;
        Fri, 05 Sep 2025 01:04:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf276d204asm30777648f8f.24.2025.09.05.01.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 01:04:24 -0700 (PDT)
Date: Fri, 5 Sep 2025 11:04:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-pci@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] PCI: stm32: clean up some error handling in probe()
Message-ID: <aLqZhL-DV4LOnHlD@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_010426_201099_72D969B8 
X-CRM114-Status: GOOD (  13.47  )
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

Smatch complains that the other error paths use gotos to clean up and
these two don't.  Generally, the implication with that warning is that
the error handly has been ommitted.  In this case, the error handling is
fine, but we can avoid a bit of code duplication by using gotos to clean
up.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pci/controller/dwc/pcie-stm32.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 964fa6f674c8..96a5fb893af4 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -287,18 +287,16 @@ static int stm32_pcie_probe(struct platform_device *pdev)
 
 	ret = pm_runtime_set_active(dev);
 	if (ret < 0) {
-		clk_disable_unprepare(stm32_pcie->clk);
-		stm32_remove_pcie_port(stm32_pcie);
-		return dev_err_probe(dev, ret, "Failed to activate runtime PM\n");
+		dev_err_probe(dev, ret, "Failed to activate runtime PM\n");
+		goto err_disable_clk;
 	}
 
 	pm_runtime_no_callbacks(dev);
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0) {
-		clk_disable_unprepare(stm32_pcie->clk);
-		stm32_remove_pcie_port(stm32_pcie);
-		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+		dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
+		goto err_disable_clk;
 	}
 
 	ret = dw_pcie_host_init(&stm32_pcie->pci.pp);
-- 
2.47.2


