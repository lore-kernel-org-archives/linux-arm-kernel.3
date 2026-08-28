Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01875C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D9vn94z6fRxQMjXUuhba8xPlc8Nhl/43jHnKAHyxeqo=; b=QRMPckmElUg+BRDHAz+xGbwk+E
	eaiSIwBnuQRy3BVYyLSwja4sK0A4qlC0QdMsIoPngCOya1pGku++3QYBPsd8HQ5A10iIgBu7bxrp+
	Rx7+OKTflHVnoH47Fb+TEiyxkzSMB964IO4Onvj2Yc4Dzejmu2cnEbuzPhbVwuHzNZI4+UZWmEZ6s
	1/TNteEroJC8P01ZD+0oBMOgyp5tC0mwEg999grGUcXO+oiM3EirC4i5hINUGom22xYMHOSYE5m41
	Zpma8kpQSf5stl0U12sFC1xLxbAwp+w5v1YqhqFV1FaBhz8t2uMrhyjHKAQ5mVMcCev6fl9kHIJeu
	cj5U2rhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwM9-00000005nIE-1TsZ;
	Fri, 28 Aug 2026 13:10:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwM5-00000005nHM-1xd4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:10:51 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so6927015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 06:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787922648; x=1788527448; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D9vn94z6fRxQMjXUuhba8xPlc8Nhl/43jHnKAHyxeqo=;
        b=DJAwokjq/YLA+YcGVTPTA3ik9AvWjaWmWARV/QtxuQR766AwTaPINWGm1EVZVXvid3
         vvsy5kpmJhtdBP4Xy0ZcujJYLEWy7qCkW4w8+vcP+BtfafQmixlhQ8TMgqmwZ6JMZTng
         MvVztgK+QOSA4f+l4rEr0mgWOcw5DMIk3cEzkPH90AR9k9V6QM/5qRwceq6+RLoqZNXG
         GbHPdGR70KVKC8ReCf4cgPG1hc7OBE/KRZCMclgwGe5r8XPTZEllNjEGd4pehhX36xog
         2EM6PEDuqKogSVgWtUf3FAlfdq4Abkf0+s9vFH7I/SA8PDyZDgUa3BNB/IIj17yU0fZ1
         E9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922648; x=1788527448;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D9vn94z6fRxQMjXUuhba8xPlc8Nhl/43jHnKAHyxeqo=;
        b=Bp2/GzhnVzTN3ykN8A4Zgh2XU2p8nhgJvWnd/3KcVAkUjenyUAx19LglStRicac5Cy
         Yr4M310RdcwhI4Cyxq6lnAnPF0R3wowSuWkpbnOvg3wpxQel6T/3Rw+uScsrzLBmgfbY
         kWAnPgT2InV3eqWpOjFlGB13iUbb1vzdgpO6P0xkF2wLmFOk+qtfGGqeCyGtwcvnp5E7
         OYiglqoS5M1K7Jh4PW5gpkR9YgYgbcVBHdyijcFfxX0nHuSQpY44kArdmMYu03KRiVQP
         yQYY2fYGHjeP7EhM/IhnFOW3mcRMItBRqrTzh8AbiI06Kf1SWcTbmldcAplfLAoTRO1z
         tcuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpL2PG31c9C67EDTlFtMra6tlVcypyMvI3h73s2ty8MGE+23sWI7V/u2AiQ/U5NuQAqOoMDQx+kGzKqOMnD7w/l@lists.infradead.org
X-Gm-Message-State: AFuF++lrJoOx3gbFsvVXA+oAUMBGAGG4q9sF5hJhk3jbAkZrioUoVEuy
	vq7clBEKKtCKTrpeTy+UxnwSXREvbNuhv4fo1RTrh/CcH+ELcrYQ7aVZkFI9ATs8zA==
X-Gm-Gg: AR+sD11ZmbxoDfYGQmVLAFAsDNznlsQdSrxEHeSlT0zZytuaWry1vgF3nz1THx+g4tC
	0rN03ggxttnPLunC1zXYSpx37uMXEs2EDXzwdglfbLpTv9Wjjx5+6OISB5UH2/tYpL9GG55yHAh
	bo/UrPHE7Uhm+Gi+Uu0eBiWsFBaDYM6Sjw4h5SXquXsGTFTDpdm84Jmm4oRzTFktckX2oYLi0r7
	IGSEIz9aACZ+AysemsWYt9IoKDVg8HuLw/IZCYk5Xfe+LueRxrMgqjWUO4G/nXuDoZM+YerlP6l
	sedy8HxupfYpJDfCsIIDyq7kwLAzjsmWpcN487cMF29/5RIR94z9fXUyb8+Wt+c2fJsPTFf/CrG
	hD2E4j3XY3HrR0byb/cuarjnLJVZrEIy1wbz+QWfE4G0sHvcxjXXqVfBnMigET/M3F8meFhVc4g
	avvfb0vQiE0Tqnyb+CrDjz1W80V0znZoU07ve3ZGfmoWe2KeOTlDFd8fpSM9ZNj4+4eLOO
X-Received: by 2002:a05:600c:8106:b0:49b:9161:db26 with SMTP id 5b1f17b1804b1-49b91c5554bmr101629195e9.14.1787922647567;
        Fri, 28 Aug 2026 06:10:47 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm56510265e9.9.2026.08.28.06.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:10:46 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Date: Fri, 28 Aug 2026 15:10:27 +0200
Subject: [PATCH v3] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-l1-conditional-imx-v3-1-6fbba62164d9@9elements.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NywrCMBBFf0WyNpJJTR+u/A9xkaZTO9KHJLFUS
 v/dpCKIdHnh3HNm5tASOnbazcziSI6GPoxkv2Om0f0NOVVhMylkKjJIeAvcDH1FPoC65dRN3Mi
 yrqTQKHLFwvFhsaZplV6un+2e5R2Nj6ZINOT8YF9rdYTIfQPFVmAEDlwrpVVWgDJpfi6wxQ577
 w5m6FiMjPJHk8CmRgZNKiBFLOCYl/JfsyzLG+PCBvIRAQAA
X-Change-ID: 20260713-l1-conditional-imx-c2bfd20ae085
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3353;
 i=michal.gorlas@9elements.com; h=from:subject:message-id;
 bh=iFjL9XI9CHMHdv0QincBDDMEbFGBO5icuMXCstbvhdQ=;
 b=owEBbQKS/ZANAwAKAWKaksyA3pPLAcsmYgBqkYjTmIJt8HzaDIwWBTuzO0XYQLVdHphGqgd9t
 Ozgk/OH9HiJAjMEAAEKAB0WIQTgoC0bQQLz7jVH2W9impLMgN6TywUCapGI0wAKCRBimpLMgN6T
 y9lAD/9Dpcx4rPTWIi/H3T+yE1CkO3UrBGGil0YZcJK6Nwmj5nficiQ2wPGBFmYcq5o3O18dOrj
 g45HsYt22VGBm/SZttLS5SZE4Uum5hB0fl4nLEb+0YII3xG5CUfWZOoKS2+5/vOT9ifd6NS+8mo
 fkvMprL8gXyydiPFz1egwgG2MTKlLrVzgsdMZqNxB5+FFcpVOBb25NHijfYQKJAdmf8NSy2oOme
 AShDxz3D8et5fE4nbWbw1TnAIFzaQJ9W2toAusfgFVs7UP4luI7nchOOKZMxDlCJxtYpdCM1l7w
 27lExhbVWpxcGxgha4JKvc3dhc3ZtJFSAYPnjhZyQkDZZXjDlmINs1+zdrJKttfENCUuO8Hp3N9
 nnHCBcvVDSoFRcHyMfpxQ7fbCL9BX7Rc0TGgEmOjfpOo/x/fdnGgyP+Yst8k/s7pREkYW7kuDLe
 xzrMrpCAQZ77ObhdrrNdzCQk3X4K+/LA0DeWhqY6Xx8+47gT5dhR9r3LdF0DwCzrPgGS+Q5wU6I
 KbXSiPeptwyiNId8PSIwsoXI8Wg5NobJkh+7BhjaZz26fTznFtYbbHUEttjdGhSGP4PWU4RP29S
 ypzhaVjUk98wp/0mbjFBz2vbvDTLo35xAebud6sOsNouJE79S92U/t6NWA9dEmTaLq1AgzOG05f
 x7dsOOE2HhA/VKQ==
X-Developer-Key: i=michal.gorlas@9elements.com; a=openpgp;
 fpr=B4EB74EA41969D1140A4D1791596726986433F8C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_061050_002240_8A1DD097 
X-CRM114-Status: GOOD (  17.31  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v3:
- pick up the reviewed-by tag
- Link to v2: https://patch.msgid.link/20260827-l1-conditional-imx-v2-1-40b324aa2a94@9elements.com

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


