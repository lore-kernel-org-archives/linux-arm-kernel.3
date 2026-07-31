Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71B6C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 13:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tbqtOFs9zlL8i8nLzqSqayZV4ABdonTOL9PAP1vFtvs=; b=PfYhpMrjanvVw4ICGDMfLFthR+
	QpbGX7CGiyY3qmfKg7mNuStr2Kesyc3a3gc3DgCSC5DcOA1PQOJPQxQCJKB26M71SSHqprgIU8YQz
	FW6KXQJ8kiaUcIfNOk7FI1BuARwRG/Au71/tQDmTJSkyxec4eZhWOu4O4GhatCDWyYnTSWqEBKDPX
	fYsOXzuWPVYWqCi4YAykpA0JF7GwPLxO1FMBS9HsL/c1b7/al1HlvU0meOTe0l9l5OSsg1Q5OSz8+
	3S6hkOixZmU08szPxVzrkz70MX5G/DXeJ1hh4EwGnoj2FFNf1ZWw+Tlcxrz+bFb0P++kkiOtxlGgT
	Q2NGVm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpnY4-0000000Cdm0-2dyC;
	Fri, 31 Jul 2026 13:45:16 +0000
Received: from mail-ej2-x01.google.com ([2a00:1450:4864:34::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpnY1-0000000CdlZ-0cie
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 13:45:15 +0000
Received: by mail-ej2-x01.google.com with SMTP id a640c23a62f3a-c15e0279316so38840766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 06:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785505510; x=1786110310; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tbqtOFs9zlL8i8nLzqSqayZV4ABdonTOL9PAP1vFtvs=;
        b=C1v4Umb2LFU19cBJo2ZLVcMaOTf/jVtTdJw5/C7cZOTHKx7R5Xnte4m4136qw8MwdJ
         hUGMFS4P7FKvDbSfKodTp/ppDvZL9vATVN+f4iab1yS5gCjE9mdY1NQDNf7QipCj5BF6
         N4e5XKRcGD0Svvxk2ZmmWC2LajVFyt1q+7oTcO/23c+iwyptnRA+8+NI/WUcoID2xUAg
         T3dXU5O09fFA5vjv0rLGmA2dzpwJDPZLLxhQUCTPFMF5RpbyBoEAGbYdg7IqqdLFoWgM
         ZMhUndU6jwnUBunj3ROmmBKaSU0IEEIcWyaiyqTjcrGVRMQ+Af4M7m49fC0/TpwNNyEy
         DTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785505510; x=1786110310;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tbqtOFs9zlL8i8nLzqSqayZV4ABdonTOL9PAP1vFtvs=;
        b=GKkEZmUWgGWGZY3M2fA1+L1G3evqOu+CToyrnvSvXLfVC5jRK1+H2ypU3iLd8V0FB9
         +VIF7uLQJGoR4574F9hwAtykZSOQxrPemsww2AEQ9vol06EWq7odpa2nPEwBi9vKkp+h
         bS9LEB3q1PQ29q8of+ZBPUweAa7KPyidS8YiAMkJYmUQhV7DsqESYhxYy56FVtaPpQIZ
         ySP+hlWx4v5Qv66otToc9eMDK9m9EqyKXZkG64kJxEl1HxaggHE4kh7gLFLcu2L+YAJs
         6jVKe8+79oqT2tReqrtc0UnfahlOYN/T9xaiZe4+pK5HcZII9wJSqCyCvX5kmY4VDgoU
         WZxQ==
X-Forwarded-Encrypted: i=1; AHgh+RocS2AAP2PgdBwCyMxG9CNVyGOb3Irv7T8Ku18sp+MRSwsmP4MBEh6+CKXdCq9U40tj5D2KAoc2o72Rm6IhBKr6@lists.infradead.org
X-Gm-Message-State: AOJu0YwNCYaLvChHCIPUSqVVYNFj6vKt6QMADaD7SSJNVn8GNBBPO6ts
	lBYk/Ibun3PSuwIumEwYEV/zBYdaFUXV90MkhobmD5ruD/WIPMsKBlnLo4u45dfI2fkODdjKzjk
	KIp+a/WTBaR4=
X-Gm-Gg: AR+sD128+Pg7AP6d5mJYjtsP80lpS8T5Tp4Oepxu5qzLY1H2izk06u91Arn3rcfkHkP
	Y2rdV206Y5HGLQUNFCKtwipB/Xvl03vnvpv9JfQWxGbQG4Hal6e49054NyBPfYa5WDBHIYyv1gC
	o3Z2qua9b9j9woG2f3IjPy92nK+YRCIDxWXiNzGioMo0+YVAsPG6ZAL2ryXnbP7WQIZuvHOb9BR
	9WVaw0To9qC019HjTF6kMZVNW6Shc/eqxhZJuAMW5aBuKP/v6fLyQZeh0ID+hZ2qnxK3BmIdzQb
	A7CC6BcODWTgTtsc+ymDZIAk07RPVXIP8NEkvIfOAjosrU7TUSjKncGrPkrMX4zsnvkzpzlId1e
	eJSITqFXP+1cD6oGcinNPb30+NXC3Pe81GMm38qzQYvEAegrEdY5NiLh181M0XU45giOdnD202R
	x2f0elfdASSdiJu8el6tJmKPGfk5WF7i1gdXpdG8rm9QnYmhZM+x6Si0/+fQy3EOM5AwFj
X-Received: by 2002:a17:907:9621:b0:c11:efec:6ca9 with SMTP id a640c23a62f3a-c1fd200e918mr139538366b.8.1785505509645;
        Fri, 31 Jul 2026 06:45:09 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c63d9aesm2059189a12.19.2026.07.31.06.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:45:09 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Date: Fri, 31 Jul 2026 15:44:56 +0200
Subject: [PATCH v2] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is supported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-l1-conditional-imx-v2-1-6016ee9148b2@9elements.com>
X-B4-Tracking: v=1; b=H4sIANimbGoC/22Nyw6CMBBFf4V07Zi2pjxc+R+GRSmDjIGWtJVgC
 P9uwbhzeZJz71lZQE8Y2DVbmceZAjmbQJ4yZnptHwjUJmaSy5wX4gKDAONsSzGJegAaFzCy6Vr
 JNfJSsTScPHa0HKf3+svh1TzRxP1pN3oK0fn3UZ3F7v0C1b/ALECAVkqrohLK5OWtwgFHtDGcj
 RtZvW3bB3cEs5zKAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3162;
 i=michal.gorlas@9elements.com; h=from:subject:message-id;
 bh=xwQHtsrljpLUNJTTWYKrxa5N2l9IwyucZA1Mt1aK1Dg=;
 b=owEBbQKS/ZANAwAKAWKaksyA3pPLAcsmYgBqbKbhd6STa3KbItAP4bOK6R6qv/8owrUVZ79/l
 eT+DTQOAE+JAjMEAAEKAB0WIQTgoC0bQQLz7jVH2W9impLMgN6TywUCamym4QAKCRBimpLMgN6T
 y8Z2EACdH7Z5EH7boQzskJW/YN42hEYIIeBVjKVlmUM5wxvYFMpm1VAa/kUE6COvGUX/shm1MrD
 Pl12ztVFe+ywQbXWGHaWc98cSB2najzZbS6/Q7A+4fDw3g/KX7bpwK8RxTSO37ksnzWs3zGIWFv
 wjKqY0831tZ8ZRCgFrWVCTnX+TVA+/yvocB48PPfdMvaHXrjHAwBFUbGFh1VSwofLjjy88EFzdR
 wQJ8BmXNfwmoX13f59mp3qCv8Q2xjD7kyOsIl4roIIFAf/Ti21EV/BtvtB56IaSMXF891Vdmk2N
 4rk+MYeJjsSMSjv9pwCsQO1c8bIP0P/+r7p8PFbWFZK7HkXkz9dTb9kkVhSqI3+APUHdHHq3TlR
 xX1wPGRByfHAEpueR6jogS0qiap0fwyTi6XocSUOLd0YF/ZjewO2tDR/TU396bXdfgg+JIThOik
 qiZ+S/pCBBrXGPjAS50z0moC/+lJ0M4eNPvAhljCXAgFnWXC3tZVh0vdi3uFAxz+quixD+JmG/Z
 6nY+402vHF9tq9AggXeomWSpPMQyfHMhZPmrGsg+2cDcsynUWomq++EoC+flKa2bodLXY1Ta/xJ
 mOyIX8FwVfEOj/CjJ6mPY//v1+2e8X1sPiwSyvlZLEbETs35Ph/iOgNCA42D9oMkSe1DxJuLsem
 lRJ0Aw80WCRfWLA==
X-Developer-Key: i=michal.gorlas@9elements.com; a=openpgp;
 fpr=B4EB74EA41969D1140A4D1791596726986433F8C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_064513_421597_C944A7A2 
X-CRM114-Status: GOOD (  17.06  )
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


