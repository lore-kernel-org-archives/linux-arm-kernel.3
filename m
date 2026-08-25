Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B930C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wGI8avUDsdCwdcQZ5iPHHrLahXfIYCIB9Ws1YZ5JElk=; b=chgkI7ahLfCd/Ws3ssEOb88owO
	xKj4ZU3C672tmR39RrFJpPiUrB3gSUtiuPGts5leZGCnDI1Q6qsTetVDaQGWXcHczcEd5MFA03S00
	dz609b4ctOlrY/IyU42jWUYoopAVTDHpo7X1B2COECVGyYKLY6uPBCmg7mcDA+EvAO3Fj6EFPsIO2
	N9lelg750puwXPazX/AccT65IDqVT0OaGxDNt8FF9AwqDp4l8i4MIYP/4BGU1qRPBoMfOL8bt/8e+
	3llen2Ri0IhCeDOURPXeTDEpbYdQFaOVzEamH8BtI/f1qElMx95t9KSthjIOaZoD+RFx0Zum1fW15
	TAMzcBWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrwM-00000000w9m-3uEn;
	Tue, 25 Aug 2026 14:15:50 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrwK-00000000w9P-0SPG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 14:15:49 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-848643382fcso5071649b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 07:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787667347; x=1788272147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wGI8avUDsdCwdcQZ5iPHHrLahXfIYCIB9Ws1YZ5JElk=;
        b=FRa850M2E9+Kz/adp8X8yG40S54G8k/9yfxMxAXBQfxN1Y2WENrBZ3BQk7fyHcCVbV
         CCUgkHW2GrFtqI5D6iSHgiLr68nGr+PDbJpDgE9nM60JBuL7G6V+FHUSIvUWYxpHADPk
         V31E6XUiMVhvrPDWOoGQYJcOGkt2QL259r44Ss+gba5QHAa1r//K471gwTBgnnolOfkc
         UPNsWEwpffe2mdSlg0jCvUzpPK8qIqVHofcFBDHWlv7DKJIQA1aBuBkbVL/pk0uCCtaN
         0I0JbX/vFCCPy1J5KkRkiEn6yHoF2N2yoEw4nHrlsNBAis7zid1I2CisuNd0KBy+4tDY
         32EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787667347; x=1788272147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wGI8avUDsdCwdcQZ5iPHHrLahXfIYCIB9Ws1YZ5JElk=;
        b=djVyPdDOVGtSMW9Iu0P3vQPg/7eiKUtm069l3n7mjEDjR6cgYlEsdqjyKG5cjXyNr/
         WSNo0+iyqbudM6Qe8nzN0PNobVcbdu4uM+UGoRKD54YrtQS1TiH5AsyUnqwN0FkmF76Z
         s0YHuDhOs/2anfcPU151oLMCwpGSFXshGh5LWrprLdamHZNmxo3hPmAa8D8LuUrOG10u
         E9cNX3TUTxt2zXSuNe2ATT9CuD/be1KAycpVpZpWm94j4AhVMol89mKYHTxTqP6if//m
         FT2CYUbzYwfB4FkP8XKp7ib4R1frQ+3todF/YUBqN3DD9c+O/6Jxts73dG1jri3CQ6eA
         ORuA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+BVqdIL3GsrW16iW0m2fhCzjyr2qRpK5/NTD9fslEnyIGCTMVBJuAXsNVpPAgim4QQjODgKRYyz5CD7W9T+WN@lists.infradead.org
X-Gm-Message-State: AFuF++kGGbmXr1z2ujiRyR4zfwBDEBB0IRvLwxTPbYz2l6Z9OqO0yNOp
	jHOO7WAq/fUeFJnc1dpOX9kE92qKQVc8PbeYHliHje/reM+2P0hQSj/3
X-Gm-Gg: AR+sD11XWb6t9urR9k4xjP5QGk6w4GEmtvN/jXDkZGg3z3Fgi98iCgeJVsJqM92FZ7K
	oX2TFfEeEbwzsWp58FfAq92GxvT1K1sMX7KlKKppH1kORphlMCdKI4X7DWSFXeFUzDF7k7poqZI
	fi608wNapMfpNm7ZHQMeod8QHwtGxTSCqOlLAcGsxShZccIQwYLpV6NbO5be5pUkDOLHXZC2B0a
	a6BEF/h+vhO1Hj+LvV+kwRZJq3HdsKnW7K9tQyJJyjrqN/z67sQ4YpMOaYDpHhCKms1qNUeOBax
	/3FKj/vixaQTg6oVJcfqxNTZk+SHsmqQ4XUPWnyIsHkPSNLXNpw5TEVqmGP4se/6hhh1inz4fHh
	ZUGQGpAa0jSrObZZKFctJtKbT/pSPKqi9NMEv47Pn3IEwSHsLJzXFx686N6+G4JNqw1YjMUdYnB
	xfcqRgYtxBdh8RO4QQjGOdVvu9C17sXIBZuEZbHnoBXTHRGPWqIOqafBh6cqTb0f0YUt9fzebQk
	OhlBETcYMwKPZN0oNhP70GwBt6qCL2r1RUHpT7Z88oV1UjFs5jZ
X-Received: by 2002:a05:6a00:928f:b0:851:ba04:ca02 with SMTP id d2e1a72fcca58-851fa070bf3mr58592115b3a.16.1787667346530;
        Tue, 25 Aug 2026 07:15:46 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520eed5034sm3122767b3a.1.2026.08.25.07.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:15:45 -0700 (PDT)
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
	sashiko-bot@kernel.org,
	Zhijian Han <hanzhijian1991@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] PCI: imx6: fix endpoint init error handling
Date: Tue, 25 Aug 2026 22:15:26 +0800
Message-ID: <20260825141526.3911472-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_071548_151413_E2B85973 
X-CRM114-Status: GOOD (  16.09  )
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
Fixes: 75c2f26da03f ("PCI: imx6: Add i.MX PCIe EP mode support")
Cc: stable@vger.kernel.org
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
v3:
- Add Fixes: and Cc: stable tags

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
 

