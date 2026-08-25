Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2BAC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 06:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WQdyTi/FS8Kj61goZufr0DmEJyM53G/+OIGRH28vBGc=; b=jqdI0ywoQ3aP0xUj1wj4L1aycB
	LCmqGMV5qL2TmWVjRYC3XbC+9Ux1J1V4BKoiVh77o+s1iGIWqJMz1VkkLBpyW/fLTfoxNxbi4kRhl
	lNku5iCOaTLu+c+RQ1xrZnKi844Iq3olWVr6Ju7XIjm42RFXN2RbkA7mTRQ56nhk7/5kAPpd3PysO
	SRyrzz1UI4271i90AedDvjJOBaEUgTaVC4P4+S/uYxt1eNSqmuS4iTZxpv/d/JVhxOyYkfrAO9d/T
	Q3n8n7g+5lGYsK6BvN9NsGMdfnyPLRNlYZArb+Ntq2yrIR38bhCpyHFY6QNnEuGJuN3XlW8lvUHE4
	273dT3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykGS-00000000D2L-1SGp;
	Tue, 25 Aug 2026 06:04:04 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykGP-00000000D1w-2lPo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 06:04:03 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso450639a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 23:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787637841; x=1788242641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WQdyTi/FS8Kj61goZufr0DmEJyM53G/+OIGRH28vBGc=;
        b=LxqSlS7v6blVjcUNSqDWm30xGnB4FA9gXdRcXEm/pTP/KITodYmDTfc6vkjD2+jSTC
         E5BXdoIZCutLGGghrofJGvQnM8QDMOVpGryqp6tKwSxO808B2574JBGpqVHREi3NG7VC
         xhfS5fj2sSadc9T6TLesZJU/k0hrw7FY5mkEcq7ky/JMfSyrieJYOp3il/q5LLG1opL4
         wmpkbx3hCBFSjbEglw1aX0FGvEXMvPyhwCqoIaMmBF+nu8vX0pat2EogDHcXM4vBbGMi
         K5oaXYbXwzsVL6WMh8upIWDSFKBTWJAphMQ60JI5f2Xe4uliKZATrKrkfhZUNNBmmffg
         2vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787637841; x=1788242641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQdyTi/FS8Kj61goZufr0DmEJyM53G/+OIGRH28vBGc=;
        b=gBkmrY8LoPWcx2etMJ8ecTB2OMMhZojN/amIZ22ny2ZXMeJnseEBkRjM2I4Z9dcTJT
         peTY3L0u4X7Mjia9Xd85fhaGX0vXPxVzEUkpX98CY2a1UfHTbwXJjkLqC7vvOSqJwZGv
         YFeZ2IBIY2X53DPpFDb/GWIdOqTogrNfyAKCkBN2AJYpEVusRfCIKhDFMbjZmg9ckGRo
         AsiaettDHYocq0fjRzYRPUbYWqa16/5HJQ0LDjGseiX+oUcUYiWdQ+tZ0MEBLzyFBWy+
         1Y4PUusI2HbN3PRa99Sc0ggUCricGmA1fLJBFOacmkJ9wETk/gqc45UVEN6evSeulu+T
         k9Dg==
X-Forwarded-Encrypted: i=1; AHgh+RrHZwHMftVCIUliiLjKkK6POETWuk241pPveKE3DkNxvg3OkH1uqmK9mGBTMruOpAe1NNNL1/HfNCEZxmK4IBNu@lists.infradead.org
X-Gm-Message-State: AFuF++kH9cx1J6Fcut2QxTeS4L7/jByN2RHqbvChzNGXutbGHCJlE8OO
	u5ibh+CYtDIueSdtvCFoCAAz4+9rQItn0hCmkDQLiuz9n84H7jgjquKL
X-Gm-Gg: AR+sD10GnGgcgWIUXiqhedKH+XbpI932/7Jek01Rd67z169EOeu3f6PUvLmdfkINE7n
	lD6IRqhIHnjudJcMAirnD1E7FtYGtfeiP8HfGXMOuMFQG9jbBnXxbayvJEGu9xq4A+Cib1BVzMA
	mCmLSFQxQ/hgEA26+uq1wM3Kb46TCEcrO5SgEF9t1Ywws1jALJ1VKACZV95Zs7si+S8E4HjLXDh
	uj/0YM9co3p2IeoSOKamuCSZ4R0F6dzyHKeLKUjb/mzSe+f4yzA76oyAkeO8zTEmJ5TnPOG97GW
	AyIO3I2Tlck+cdCS4SjSWGrJMHgLNCzRwTXdHMuQ79gqu9syYCW9RU+SlUXspuZug9kr4uh++7N
	6irJOiycNyu21amURqqN+KgF5Ud5bAT6ZWJ4NrokUC5f/hakYrOBIRjPwGhlyoIIVS9FMGZXvva
	4EgkKmvnOoTVvaUcr9dLIzQdBfHz3E3OZ8XEs5qgrfIUZrhXbhB/Odtr28ZkDP0KeBTLfzD6gAW
	nNK0l09QNR+ZiLpktrRRhed2ra9Iyt4xtRqB3XhInLJ0awXmHAc
X-Received: by 2002:a17:90b:1d50:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-395df29b3c5mr49167378a91.12.1787637840732;
        Mon, 24 Aug 2026 23:04:00 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645b82847sm2536296a91.11.2026.08.24.23.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:04:00 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhijian Han <hanzhijian1991@gmail.com>,
	sashiko-bot@kernel.org
Subject: [PATCH v2] PCI: imx6: fix endpoint init error handling
Date: Tue, 25 Aug 2026 14:03:40 +0800
Message-ID: <20260825060340.3767635-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_230401_702989_DA5BF15A 
X-CRM114-Status: GOOD (  15.96  )
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

imx_add_pcie_ep() ignores the return value of imx_pcie_host_init(), so
a failure to enable the clocks, regulators, or PHY during endpoint
initialization goes unnoticed and the driver proceeds to initialize the
endpoint against unpowered hardware.

It also returns directly without releasing the host resources when
dw_pcie_ep_init() or dw_pcie_ep_init_registers() fails, leaking the
clocks, regulators, and PHY that imx_pcie_host_init() acquired.

Check the return value of imx_pcie_host_init() and register
imx_pcie_host_exit() with devm_add_action_or_reset() so the host
resources are released through the devres framework, which unregisters
the EPC device before powering the hardware off.  This mirrors the root
port path, where dw_pcie_host_init() releases these resources through
the same framework.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260824152857.DB9771F00A3D@smtp.kernel.org/
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
v2:
- Use devm_add_action_or_reset() for imx_pcie_host_exit() instead of
  calling it directly on the error paths, so the EPC device is
  unregistered before the hardware is powered off

 drivers/pci/controller/dwc/pci-imx6.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b..f0fb4e1b0 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1488,6 +1488,11 @@ static void imx_pcie_host_exit(struct dw_pcie_rp *pp)
 		regulator_disable(imx_pcie->vpcie);
 }
 
+static void imx_pcie_host_exit_action(void *data)
+{
+	imx_pcie_host_exit(data);
+}
+
 static void imx_pcie_host_post_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1634,7 +1639,20 @@ static int imx_add_pcie_ep(struct imx_pcie *imx_pcie,
 	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = pci->dev;
 
-	imx_pcie_host_init(pp);
+	ret = imx_pcie_host_init(pp);
+	if (ret)
+		return ret;
+
+	/*
+	 * Tear the host resources down via a devm action so that, on probe
+	 * failure, the EPC device created by dw_pcie_ep_init() is
+	 * unregistered (also via devres) before the clocks, regulators and
+	 * PHY are switched off.
+	 */
+	ret = devm_add_action_or_reset(dev, imx_pcie_host_exit_action, pp);
+	if (ret)
+		return ret;
+
 	ep = &pci->ep;
 	ep->ops = &pcie_ep_ops;
 
-- 
2.43.0


