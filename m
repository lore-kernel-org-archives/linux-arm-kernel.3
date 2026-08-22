Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04110C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 01:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XNcfeMEYwNlJBKitvYBP+hWuT3fX1KTsmGqaiTl4+vY=; b=apKxtDl04Pad2fdR7M+JGZyny1
	RftkarhInsUDR52yl7KSdX6gI8iJVtY70+dhFk5dwzvu83qV0nRb8ELl46P13M0hqRV+Pi2oNlRkj
	cbbeYZcQKVHtsDtLaafP4briL2otDaLizmdTJoljaUaD/BVCjYMsAlLK2i8/RT45JHn0tb5vo88aR
	JUmN0gBYAgnNcHLKMO4BA3uYY9KjD6aWMknz/v4iUGyn88zj6c2qD5MrSrKcThkuisafzIp0dbzxA
	QripV8P6VYGqe866iuuVeuB+OCFVpX8Sifh182khJclmLByjqKFnT7h4keQgcpro8tZMXgrVZo/TH
	zY1oABTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxaRG-0000000EDix-20NX;
	Sat, 22 Aug 2026 01:22:26 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxaRE-0000000EDib-2aS9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 01:22:25 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cbb7926836eso1229398a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 18:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787361743; x=1787966543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNcfeMEYwNlJBKitvYBP+hWuT3fX1KTsmGqaiTl4+vY=;
        b=sGsUxTo97E4IuEofrxgZHdL0x1MJ8kEZCvCXIZfPAz5emBWZKR5RLSVEA2aDc2e4A2
         HYx0FwlVH06c5ygQlp0taTLmLLFkrDAISOwQeEHtQEiECmNG1rQTf/dMAV5/M752b7pj
         p8XBby1qlbnT/JO0Oebz8v+gmYNPYA+WSjjFBhaV8gYEiHksjNT7ie64DNpRvWV1jSYj
         jddlIOoKi8EyWBTuy/6UkBzK3kUSo9muTnKqkgCy0PYHMTdnjPSO94lAJpjPbb5oOk/o
         oANBkWr/ilm+u8J8JWmU4VUtDeueVWRv7uxORgw9/rpn3KODnU5EEykOrgzgy5RZixBD
         xpbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787361743; x=1787966543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNcfeMEYwNlJBKitvYBP+hWuT3fX1KTsmGqaiTl4+vY=;
        b=BYgZQ0v3I/hJYgwfBYrSUs+LGclzlZUppgyD+seRCOjQwQWypCUlYqsU4jM+DHzDK7
         +zpCskYhdhGuAeWrMx4JQjJu0f0YrfCt+7Hi9+60WpQUOicX89Ml0T4prrrBNZp2/LJ3
         DATR6F9JsNi/4ChE+FsCSq+TKhSw6vvd6ic68ZOd8u6wPW0+G3Mf9+Ye6Uj7THW0DDOs
         a5a0kdr4FM3zVXdZII2NN/WhUZ8RO8liccOwCHXTkZYWouBaRs50sjOEWyCjBT/puwkk
         jpY/HSdKQ40PQz2k3Vl8zyRut5DD52HkyqrhCWU2vDecNhk67wlU0c3dJS1y0zVPGdUr
         gD0w==
X-Forwarded-Encrypted: i=1; AHgh+Rp2CDIXGuQwn0CgNCa31UbTZ8lUiysnK+zjIVqfmblLp1z/NNrBdpEwQGTcX83GH6fDmateQqIGyZ9zuBSVwzvU@lists.infradead.org
X-Gm-Message-State: AFuF++ksweaj9RUe7HlvgUHjF82L5fy6n/X4QXkOe5wRV9vcVsfjZ6Z1
	IuOoEpf03DYINa0QLfj6MXusI22YTCBJpYJhOWn8mn0MoNALjQD4ZicR
X-Gm-Gg: AR+sD10iMqVm7pLMSLMozKjW9TpmBSDymHxCTZFoqOecEDS+zgChcFd83VTgUE1yU3Q
	B4TOF4tiI8o/TFhbP0hvMZJGpdR5b1neU47R93NUmQmzZRcO7byQlVL/QpQknlf6WKJhBOli/DV
	YMJ3dPU+6I2Pkw9Cynv8+jLezM67+/izCB88k8mKxSStPIsKm+5WnjfHe/6VENPfPupEwq7vll6
	ivL3/ZzPy3Bzw0f4ppLujLAM+CIAHGXHVDu3HVp5TKMnAi6kNe2HvrPqepNmqB4c02iULVziLub
	EKnqx4SMcURtE+LECN9k7QfbtFdQimiToN1AITtyeEbhIoEkxG4rm3hjtmePn+RmCjKovVrllsX
	PAi8yhLWxzs9FijcyckJKgvwRE68444JGdl9E17tqUC/o39tZJRi8VlPvMQyI6cZgNiA1rrrPIy
	KpYwktMYOKNS7EmxlcJMbSZ+I5qypvwJlxKFjQ5i55RxyMwF1z5cEB2s8OcWPhFlFtozjczA2Lq
	2iVytSQwiQzr4S2EghdpzI1jseVQrBBYE/4qTb73lfRKLkHNVWR6Vpc7i/fvSI=
X-Received: by 2002:a05:6a00:1407:b0:851:8394:1696 with SMTP id d2e1a72fcca58-8520ba16a9bmr3668474b3a.12.1787361743351;
        Fri, 21 Aug 2026 18:22:23 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f03b243sm144370b3a.31.2026.08.21.18.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 18:22:23 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>
Subject: [PATCH] PCI: imx6: fix pwrctrl device leak on PM runtime setup failure
Date: Sat, 22 Aug 2026 09:22:05 +0800
Message-ID: <20260822012205.2459806-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_182224_665580_9960D193 
X-CRM114-Status: GOOD (  12.90  )
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

In imx_pcie_probe(), after pci_pwrctrl_create_devices() creates the
pwrctrl devices, the error paths for imx_add_pcie_ep() and
dw_pcie_host_init() both jump to err_pwrctrl_destroy to tear them down.
However, the error path for devm_pm_runtime_set_active_enabled() returns
directly, leaking the pwrctrl devices.

Jump to err_pwrctrl_destroy instead so the pwrctrl devices are cleaned
up on this error path too.

Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b..616c42932 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1975,7 +1975,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
-- 
2.43.0


