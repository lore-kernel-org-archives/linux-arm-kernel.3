Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5465C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 00:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7EWwsWIADyuXSEEcPix4PovWy/AjCSESwW0LVKRsciM=; b=g+asitLm/SUbf7UWBYE5nJUsED
	ylEhEs8AxEYhUlazndRxEb1M8LZeXNq+UBc56W8TPh6bi8KT4Iv1cwIV6HKXzFWmnaACs9aybVm1F
	X/zT6lAKAvS0nH0U5nGgkWJ/9Jz1HxjY64Fu84y/dn0H9czSwe4Fq7i42u6aY1Ce8iIR2NwEWxP1Q
	lxfn917KUErT6hiN4elU6TAV5UatleMiNziPRN1/Ecjz52s8Av5yQSruPQs1At1sfI6jWvNYkcr5N
	3pLNXmkBqx76aVDPb60O43xwKysVHfltLVKnY+IcHbS/bTTOdJcHDB2nKOlQPJuiCtfiJSGyLUFFn
	keFa9uxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlFhd-00000004elm-27aR;
	Sun, 19 Jul 2026 00:48:21 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlFha-00000004elO-18OV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 00:48:20 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-69c7ab350e9so11058352a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 17:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1784422095; x=1785026895; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7EWwsWIADyuXSEEcPix4PovWy/AjCSESwW0LVKRsciM=;
        b=TUbFUoQavgEO5MPXRriTLIfevaunbvUOo/F2ATJJAawZKVQqnkQ747HioJB7xJBCXp
         1s9ncvF98DCoiES3EXYZ+1cgFsS5tCDm+BkU50+VhxjgLBn4aHrjm/dTx+BV/9mJD9m4
         PBCq7WVUyOZgNqzxWFwlX4qsXiIdoD+XNkKxyIsDar/oO81vi2f0LcCoKBs4YPmsDACq
         yhw74vogd58+Lx1Mj9pL1vpW7SmD1nBAL1464yKhzq5+vudkokuJOFIjjolCl3tJUB0u
         o7Wivgqk6vo5H3HONJVr9+6itJaQazhBrCIIzVRLLJ1F8A1VmOe8TVR+fws03oTuq1Ji
         NHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784422095; x=1785026895;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7EWwsWIADyuXSEEcPix4PovWy/AjCSESwW0LVKRsciM=;
        b=HPaKQ3/axwbWEfOflQ0XCIjgi35PlMLRIm4AOjchbnnuuIfhDzn3xRAyoW+BZVA9Xg
         RnEIOTmQnenEeX48nN1AU8SkC/Pqtze1j9geLA+DIZva4mTZs/9DgB3zBglpcl9yZtqr
         T2nCgS5gYtLBbWuUxdS1a5NOkmgLkmpJH8Q5VmoPv4s+QgwMnwKjaOPEFlXbEGWbzWqE
         SdMOtXK2EUTQ74s+qXnt3VAXIfVbAahzziI9zEIwl5p56TUFYe85q81oJj3Nv6N3SX2P
         Ejbk+qPhFn2ADNvJ7C/QUCLyL7mdZGpFBJcWp570nU+lQXTNBmKViHMDnGB9H4zuAz31
         UAPg==
X-Forwarded-Encrypted: i=1; AHgh+RqYKRDY6P1AsKyQ7gSW7nUVcLocGLGTe7rxJRtKo+fdrUsayDN0YCDTEG5rFVIs4xTEqS58TVluRzS9iscTo1fI@lists.infradead.org
X-Gm-Message-State: AOJu0Yx435C8w70FUJAUuXjLGpU4KCYQybwpQEtEIXavQHyU2GbkAVep
	uTZq78LokzHxH7z7k7MftKOeeddYCBplk2GgQ6+grPv1k+g6Bxhwv1Gc5TviEXdp3A==
X-Gm-Gg: AfdE7ckO+6fHUW7C8LEs+idWYvHnTuLO2+UAIbytdQXBiXpbQbKEKOUwKX88WeGX8nI
	uSpT4oDFUXxV6EniSVph3BrfL/pIWZ8eqUcdeYqr1FWW75jpRCc0y8vFL8zCO2Ayh4SCRC/TEKJ
	34o34fBvAaBx56Ww6jMxHx3JIwcj/PK6HBOAq8diPsNV5Z4Jc7zHyRDqIbvrg3uxw4d8dUIzA8r
	Oj5PUSYrc/2hxvmwoW7OzHLNiuq8Mq1cmfTYAF22zVFbn0hWhnu0QcjVpHrVeac++RbH6puL1Va
	4H7tv3EYDauJWLI2rDe9HYC+9+lj9ERAr0EibOJ5FxD0ZV0pCbp9frvZgcf70Sbn2+ZNHrAcsjx
	B7846j+RRqg0cRwKMyAt9grBrs81ZpAM3DzCAYl3aYbC10F06CVENiIb18XILpQmudQbqj4BbrK
	uFCxgtPvrH5IK47zaVwpeaFjI=
X-Received: by 2002:a17:906:9c83:b0:c16:67d8:79e1 with SMTP id a640c23a62f3a-c16b46ab93amr334444066b.7.1784422094905;
        Sat, 18 Jul 2026 17:48:14 -0700 (PDT)
Received: from [127.0.0.2] ([185.213.155.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a62e79sm270250066b.30.2026.07.18.17.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 17:48:14 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Date: Sun, 19 Jul 2026 02:47:54 +0200
Subject: [PATCH] PCI: imx6: enable ASPM L1 only iff CLKREQ# is supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-l1-conditional-imx-v1-1-a55a57915c68@9elements.com>
X-B4-Tracking: v=1; b=H4sIALkeXGoC/yXMywrDIBCF4VcJs86AGnqhr1Ky8DJpp1gtaosgv
 ntsu/zgnL9BpsSU4TI1SPThzDEMyHkCe9fhRshuGJRQR3GSC3qJNgbHZQy1R35WtMpsTglN4ny
 AcXwl2rj+otf17/w2D7LlW4Led1B9dBB2AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2389;
 i=michal.gorlas@9elements.com; h=from:subject:message-id;
 bh=8Dy6qNmKS8/8LS04fDzhefwfpJnXc37CXJeUp6zA7iw=;
 b=owEBbQKS/ZANAwAKAWKaksyA3pPLAcsmYgBqXB7KH3m1ik9qYpuspVJBQkL8K/R/s7ZipXoyz
 NDJmhIbCdOJAjMEAAEKAB0WIQTgoC0bQQLz7jVH2W9impLMgN6TywUCalweygAKCRBimpLMgN6T
 yzUPD/9oPKNRqS9GxYGjqWNGDtsU8QIMyrii7nok9dJ2lQMYAfa13pVUQMpHlvF+jmPWBG+am31
 4qTo/4Wrol4fEBMS4GxoCtc9OcahIcvd3GKR6UBdEm/8uTaAg+ooA8+XZF5JtEEbqvX+zL6hq7U
 v05X5N0vyrVGl5ebf2lQQ1cTzln+ZasaS7NynA9DDQL+nXPbmYX+6hSK3C8sMvMHkJxXswXZAxV
 4hy3Ta7ZNwe/Qp+51ns3A6km+hXSJOZKEy8nwyaLpe4XNzFk5uneFbdzIG+kylbIPPkSDCzUPrG
 9NYvgWVZwAm4ZAPG+pO2UTJvLPrpMfL9KTYKDpd8wQcjZToBQgRA+/x5EFP8qc3oV9PsQ+eF2Zr
 MXCimhOClJGj45c+ACTfP5PY7TmX/hiwk7icuDK4RqAljjYXYSHEGtMSb6FXrNSo4oqDd7VCCwF
 81PHQ4FsYfGVAiDh8pi8XtM/cdZ7JR/rZ7GsTg+VZ4iCBIQJmeanHGaG7kLli6NgZzFqRK4XXrT
 ywrbiSNkIEiA7rtp5kJoPK5k67Rz2qxxMRznl1iJ1VBFJ8aZACeNspLmFN8PnbKawWF6IYaw6q5
 oZj/HelhlljJE+RyAxM8axJqL0Rx5tzM0CIDW95/ywdf5WlEpz5Ca1NbHKmxVXq83LXJAPkdqBL
 Hs/qeMJGbHP+7wQ==
X-Developer-Key: i=michal.gorlas@9elements.com; a=openpgp;
 fpr=B4EB74EA41969D1140A4D1791596726986433F8C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_174819_038057_54621C1F 
X-CRM114-Status: GOOD (  14.64  )
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
on all devicetree platforms. This causes PCI devices on some iMX SoCs
(for e.g. iMX 8M Plus Kontron SMARC eval carrier) to enter L1 even
though CLKREQ# is not supported (and consequently supports-clkreq is
not set in pcie controller node of their DT), which causes the device to
never wake up from L1.

Hence, disable L1 capability in the LINKCAP register if supports-clkreq
is not set in the DT explicitly.

Note, the logic here is very similar to 613f3255a35a, only difference
is that leaving L0s enabled does not cause issues (at least
I never encountered them myself when testing on the device) as its
not dependent on CLKREQ# being physically there.
Since there is already a way of specifying its presence in the DT,
the driver should be aware and disable L1.

Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 98e1db751132..7471501fbf04 100644
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

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260713-l1-conditional-imx-c2bfd20ae085

Best regards,
--  
Michal Gorlas <michal.gorlas@9elements.com>


