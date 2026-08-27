Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1444C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tbqtOFs9zlL8i8nLzqSqayZV4ABdonTOL9PAP1vFtvs=; b=uvtax+kIPYAu9rau3YQ/a/VCST
	kl4C9O6rNgC1OkWK97zea968s7HBxyoDjHy8G45x773IBlokW4KCCdgbHVwy4SFHsuXcuMasNtmH4
	ApYDWgPswdvh04FWII6+zrOHD84CcDdR2CDH5qTTQUKBeEbgVSmksRsMlsmgXXUswsM/Hj+ntgqAz
	SR/iKIzBbLsPzvmbekmX8ScHC4vQUpG+PQUETWJDltS98sDpc1qxiZcULC0/Nf6FmmT9CMKEeehUs
	A9FeZ1Do816Cxnz2Jkd7g3qQzRuOM4CwttmZJL+YioJLhoR2BYZ0QfwayKOigy1Zanb47uSAtcPVt
	3nwPsukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdKM-00000004PM6-05Cy;
	Thu, 27 Aug 2026 16:51:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzdKJ-00000004PLi-0gN4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:51:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so12491975e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787849500; x=1788454300; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tbqtOFs9zlL8i8nLzqSqayZV4ABdonTOL9PAP1vFtvs=;
        b=AcNV2ihhdGR9i3vJzLOaL9fcfjINImBgHyapoP4cN28Qtwodzf9+xRXrMxojvD2T6T
         A3UIvG1rXUVC6qf98loVbNKJqss6gZnXohFZk9fygpRH2Ygo62gshc/EH+ESYCfbyh6m
         GDwT1ytv1beaAa/x4/5ZLUD7TRG7lEqGmsGGWNl0rke5bsGtD5DRC1K/ja5/lJIYtI+w
         99iT+HxuGBYthU2ahAKQRf5CGWXLxvzsqlTwTZQP6UZkY0d9gkA5G1C61HECZg+9w2z4
         Siw4755tagc08yRA+bl0RG2nqxWTD05yOGmXJXuR6ygx3l2PQEYEDtHcCHZDHj9zLDrp
         1+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849500; x=1788454300;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tbqtOFs9zlL8i8nLzqSqayZV4ABdonTOL9PAP1vFtvs=;
        b=feMf54knvyYFKSKLDsCuEjvEMa2K1Owqu/gwLfUBEVNG0TmKEils5WU6BQ4/QATwZl
         tJm4Xd1KjM31ePuabEpCtH10eL1TEtGUJOWN1gZnHlnhREGBNvajDL/cmnaFP4kKzVgR
         5Ehka6nfKL+0zw8sYwBJIvkTR0wiHqCBK5Xj+/VuNGq0hchX9HDDLJxkU8fUsd7mgGHT
         12zKaJcFjfVB1FJ9/vX5vZkWzaJMx70uWTiawNgAuDKDadaeqyN2QQ9TvMzP/9rGpSrv
         DriL9apgrvEwWtC7rqh4COdca7Xk8Nbh36TTXOf0Ly7pI8D085jsbzrel+bcOxCtTA9L
         TzoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr127cLX8a9P7YGz4u3u7HnqNM9OErV9ccd90ExgTzlgVY+zmCxQ5tjKw+8AzZYfDOo3+peEJl7S5kp+gTEZFMt@lists.infradead.org
X-Gm-Message-State: AFuF++kdTsNHIakD6+4Xo5/YoUqs5HIpAO0m6kjMyV2Vo2YOBcpDFn4q
	P1+MoxvMQr3hQSsMAaEU49X1UewUx9PMLsXKxkn89XIsxg/toA5eLgaViAltB+UberS9F/bdHCP
	gq0XhDg==
X-Gm-Gg: AR+sD12YbY1VMPWEnfEuHgxfaKDLe+7RaQ8NB4oyg8AFwx2/oDbA3wtojl+HUaYGPkk
	iLE8aIHa5+UujsLubw9tT4TUCq2fFXj9QQr6k4EUtNqVa5b2J+/NeAYhmQEHyyVVLbFKtgr3lKt
	Mwg1N2b3iHc6Rko6Z6yEHImQtsCcA/L75h5EzrXJHQL8kREmJ+z5x3kIcpC9Cn64aUc68ARrftV
	nQBTdneNXhkXOKvfIfq+Zz0QDJWqQ8NRd59F6q570P6/jgRB6zJ3lmvRdxGIMsk7tM8mQHtr9YX
	Y1bk4X1/7lXUGbhVtC8kU1+/P4K3U/3bhldxCp9IjTRAy9/OVbULQJdCjjFYDDZA/CulGvTWiDU
	nhqRMLAA3InKJu1jKblqpQATWg3xZGRZ1pqIE/QC7yJn+F/FbhzmCit2Xbxo3i/ggKFu1cmp514
	gwrNdp/EnY2nkhFEDRyU2yweTcm8hM6HQmPoMTbkN4mApReTL0u+uV+9TzR8YfqKRI2YHN
X-Received: by 2002:a05:600c:8581:b0:499:a760:722f with SMTP id 5b1f17b1804b1-49b91c47bf8mr3744675e9.13.1787849500201;
        Thu, 27 Aug 2026 09:51:40 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56826bsm78234015e9.4.2026.08.27.09.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:51:39 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Date: Thu, 27 Aug 2026 18:51:00 +0200
Subject: [PATCH RESEND v2] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is
 supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-l1-conditional-imx-v2-1-40b324aa2a94@9elements.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3161;
 i=michal.gorlas@9elements.com; h=from:subject:message-id;
 bh=Cv42epPoNORB5PcqX0k0Mx2zGd1B1jSGrLyDLj5cWzY=;
 b=owEBbQKS/ZANAwAKAWKaksyA3pPLAcsmYgBqkGsXl1XXO7CczlDW42hMAd4AcZI7L/miM5XQi
 4HNMYkWKaiJAjMEAAEKAB0WIQTgoC0bQQLz7jVH2W9impLMgN6TywUCapBrFwAKCRBimpLMgN6T
 y4SzD/wJXnY4K3bTVEqMPYGKOQB6IFLjmxS3tCQvn8h7h8t5zTdtMDxOFbhTcZmNtsMWFM2KZ3b
 hGFQ41UMlczcyAe1IoHiRfx16B6MehkVhQYZaTR9Xc4yIhY4YPDHqMWll3BcRup8lRQDdeeU0z6
 bcPDaS0n9KjobxN5WwaVucD/5Bz423OQstjwCKLJcDCiGTVKIfMZF7uD420M1SBbMJIvwLiZi/A
 j8d8OYr9+QTsNKsU6HWf86ylOYXSwl2dH1fzh5rWkfmJitWKAqq7keIyhA3kbrCyVA9fsivsWQ2
 hOlnFLaXj7zbuKnsYSP1XJ3dlO5XtQ/Wnwt1/ZybSlFY5lVslsBm6Mssdn6ho8xejaRYHnH2/i7
 bC5g08hPvdLX+E0VkiN07CNG2LIdmYK6gW7+ckVek5T+ddG3i6+Cb/YBB71y4wlqS6o0g++uKzE
 +HK4CPkHupuSyC2MapHS1fDejhDh8/ab/nETLOz+uZ7SEMXlnCoHuXeCbEuhK0pzeY7VSFVje6V
 JyHtOsXDPTxO7JTcbhWO4v6rdu6+HAlbkJ/Bl/56rJmxXQqP9g8eK+zd+tIBoqkr+rRZgA37Aa7
 O0C3NOOnOWAKdeAMraI9QgkEix0O6xybs4nEcQSkUDsa33YGklAhit7mq0u2jBNjiK7Sa3NvDZz
 NwUnFbNbJkBgepw==
X-Developer-Key: i=michal.gorlas@9elements.com; a=openpgp;
 fpr=B4EB74EA41969D1140A4D1791596726986433F8C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_095143_358076_700BE447 
X-CRM114-Status: GOOD (  16.99  )
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

Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
states for devicetree platforms"), ASPM states are force enabled
on all devicetree platforms. This causes PCI devices on some i.MX SoCs
(for e.g. i.MX 8M Plus Kontron SMARC eval carrier) to enter L1 even
though CLKREQ# is not supported (and consequently supports-clkreq is
not set in pcie controller node of their DT), which causes the device to
never wake up from L1.

Hence, disable L1 capability in the LNKCAP register if supports-clkreq
is not set in the DT explicitly. For devices that set
IMX_PCIE_FLAG_BROKEN_SUSPEND, disable L1 on resume as well, as these
skip imx_pcie_host_init().

Note, the logic here is very similar to 613f3255a35a, only difference
is that leaving L0s enabled does not cause issues (at least
I never encountered them myself when testing on the device) as its
not dependent on CLKREQ# being physically there.
Since there is already a way of specifying its presence in the DT,
the driver should be aware and disable L1.

Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
---
Changes in v2:
- disable L1 unconditionally on resume for platforms advertising
IMX_PCIE_FLAG_BROKEN_SUSPEND (Sashiko)
- typos in the commit message
- Link to v1: https://patch.msgid.link/20260719-l1-conditional-imx-v1-1-a55a57915c68@9elements.com
---
 drivers/pci/controller/dwc/pci-imx6.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 98e1db751132..1fdcbcd2422e 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1318,6 +1318,22 @@ static void imx_pcie_assert_perst(struct imx_pcie *imx_pcie, bool assert)
 	}
 }
 
+static void imx_pcie_disable_l1(struct dw_pcie *pci)
+{
+	u32 val;
+	u8 offset;
+
+	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
+	val &= ~PCI_EXP_LNKCAP_ASPM_L1;
+	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -1442,6 +1458,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
 
 	imx_setup_phy_mpll(imx_pcie);
 
+	if (!imx_pcie->supports_clkreq)
+		imx_pcie_disable_l1(pci);
+
 	return 0;
 
 err_phy_off:
@@ -1748,6 +1767,7 @@ static int imx_pcie_resume_noirq(struct device *dev)
 			return ret;
 		imx_pcie_deassert_core_reset(imx_pcie);
 		imx_pcie_assert_perst(imx_pcie, false);
+		imx_pcie_disable_l1(imx_pcie->pci);
 
 		/*
 		 * Using PCIE_TEST_PD seems to disable MSI and powers down the

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260713-l1-conditional-imx-c2bfd20ae085

Best regards,
-- 
Michal Gorlas <michal.gorlas@9elements.com>


