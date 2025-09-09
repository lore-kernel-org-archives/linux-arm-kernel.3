Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E62CAC589
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 08:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qP3G6myl3MLVKTHcbANuaTLMmEpTYS/jwY2qeegTips=; b=iRWnvw08V2yRvA
	xbF7RbDNzQQOCm1uYoy4kfgsU3W4r+3MhhIMn5I9ynCth9p0Ng44dnO6qDtaLjptiS3DJMyUB5m/X
	aA41LDSGRpa77xZzTJyFKmP4eHfGes0OIZxLbkblu9MOxzkX12a0KHlVHCXaLsBIS+JxO9qcCR6/v
	fsPAqMcOEvxRyXwweRNGV5ObqM+D/QuIc5X0zo/j1BZ1mrjOO6TgeXG5Tkg7u3LJgHEsg7a3wao0Z
	6N1TN1eKxiyPfMdJIcuFYurfoWh8pSZ/6z0p0GTxNGGQiFtXD4f13WtZj1nSZJ553dF5+5pnhZHFT
	Zayyvu7bJ2Q3DWWlT3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtZS-00000005WUT-2Xu3;
	Tue, 09 Sep 2025 08:19:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsSR-000000053Tr-42RO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F15F143E91;
	Tue,  9 Sep 2025 07:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A346DC4CEF5;
	Tue,  9 Sep 2025 07:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757401682;
	bh=aj2KpD4+D1Pv7BWU9Ys+UXE2/agJe+1Sc8aoXRD/NEM=;
	h=From:Subject:Date:To:Cc:From;
	b=ukjneAtHr4rv2iTB26j2H2YR0uGvEnrtBXWv+MbT9v9c97Au4GKfDNOkrDMPR7BB/
	 DpWzkccAwuC+MZr30j41B9SbQ+LRevfwFiHU7kNsljDxO0l41mnmnlX+dPdLe5mzB4
	 eZoMFU7klHV6AYnPJVpPHXzYJu5OK//ldyeyRlTcSpoLLGb1vqS/6zdWD+M8ISwO9O
	 2h2LnJNBIG8rtH8HHb5ONLNsPBulyEGmOP4TdE9nM/NbMq/rwLvLwVVEVlsP6Q2cvb
	 /as9EESgprvDcdiSWInY3oKrleU6aRXp5qBFBNqcFn/OHQ8ILbXAGR7CfF7leBLp6A
	 PsZmkpUi59vcg==
From: Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v9 0/4] PCI: dwc: Add ECAM support with iATU configuration
Date: Tue, 09 Sep 2025 12:37:49 +0530
Message-Id: <20250909-controller-dwc-ecam-v9-0-7d5b651840dd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEXSv2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyLHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSwML3eT8vJKi/Jyc1CLdlPJk3dTkxFxdk2TzZGNDY7OUVEMTJaDOgqL
 UtMwKsKnRsbW1AMwfPRBlAAAA
X-Change-ID: 20250908-controller-dwc-ecam-4c7c3136de14
To: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Jonathan Chocron <jonnyc@amazon.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3664; i=mani@kernel.org;
 h=from:subject:message-id; bh=aj2KpD4+D1Pv7BWU9Ys+UXE2/agJe+1Sc8aoXRD/NEM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBov9JNJTCYtxcExe9VsEp0xEbF+F+VktLwYnHZX
 d1peW9ne3mJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaL/STQAKCRBVnxHm/pHO
 9QoQB/wIKCYqFWkrm/M1gyG3ecHPFbPz7fMgl0ztBtlwoJEHhKG2g7dT3KHwp3tLFkeWWWZGMSG
 Kw1Sw44858gPqxmo2GPX5iOfh6lE1O8IUrwxHgcnKqSz20lXogewXUjh/up9Cv5teh1nj6XuW4z
 QZxQYnUzPdBYymu89UNLrD6QSpY+k1gYxDtcyt2nYWkpeE+mDnQl7WurFJhU2o83LR2jRS/wVC1
 +tc+H/I+2VCk7mTBt2PUjv4laJWpepIsBz7b1q+agdFt09K6CwlRX0QQ5DlDInuVTtyjhZbPZOb
 zEab39W8mKQJba5efHV5iAu0QtwuqO4F2rBM4WhFnDd7M+ej
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000804_052107_9AD510CA 
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

The current implementation requires iATU for every configuration
space access which increases latency & cpu utilization.

Designware databook 5.20a, section 3.10.10.3 says about CFG Shift Feature,
which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
would be matched against the Base and Limit addresses) of the incoming
CfgRd0/CfgWr0 down to bits[27:12]of the translated address.

Configuring iATU in config shift mode enables ECAM feature to access the
config space, which avoids iATU configuration for every config access.

Add cfg_shft_mode into struct dw_pcie_ob_atu_cfg to enable config shift mode.

As DBI comes under config space, this avoids remapping of DBI space
separately. Instead, it uses the mapped config space address returned from
ECAM initialization. Change the order of dw_pcie_get_resources() execution
to acheive this.

Enable the ECAM feature if the config space size is equal to size required
to represent number of buses in the bus range property.

ELBI registers are optional registers which are part of dwc. So move
ELBI resource mapping to dwc. Also change the dtbinding and devicetree
to make the elbi registers as optional one. Having ELBI as the required
one is making the ecam feature complicated.

The ELBI registers falls after the DBI space, PARF_SLV_DBI_ELBI register
gives us the offset from which ELBI starts. so use this offset and cfg
win to map these regions instead of doing the ioremap again.

On root bus, we have only the root port. Any access other than that
should not go out of the link and should return all F's. Since the iATU
is configured for the buses which starts after root bus, block the
transactions starting from function 1 of the root bus to the end of
the root bus (i.e from dbi_base + 4kb to dbi_base + 1MB) from going
outside the link through ECAM blocker through PARF registers.

Increase the configuration size to 256MB as required by the ECAM feature
and also move config space, DBI, iATU to upper space and use lower space
entirely for BAR region.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
Changes in v9:
 - Splitted the ECAM enablement change to avoid bisect hole and excluded pcie-al
   driver from DWC ECAM since it uses its own ECAM mechanism.
 - Squashed the patches 2 and 3 as patch 2 won't work without 3.

For the rest of the history, please refer v8 changeset:
https://lore.kernel.org/linux-pci/20250828-ecam_v4-v8-0-92a30e0fa02d@oss.qualcomm.com

---
Krishna Chaitanya Chundru (4):
      PCI: dwc: Add support for ELBI resource mapping
      PCI: dwc: Prepare the driver for enabling ECAM mechanism using iATU 'CFG Shift Feature'
      PCI: qcom: Prepare for the DWC ECAM enablement
      PCI: dwc: Support ECAM mechanism by enabling iATU 'CFG Shift Feature'

 drivers/pci/controller/dwc/Kconfig                |   1 +
 drivers/pci/controller/dwc/pci-exynos.c           |  62 ++++-----
 drivers/pci/controller/dwc/pcie-al.c              |   1 +
 drivers/pci/controller/dwc/pcie-designware-host.c | 148 ++++++++++++++++++++--
 drivers/pci/controller/dwc/pcie-designware.c      |  10 +-
 drivers/pci/controller/dwc/pcie-designware.h      |   7 +
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |  15 +--
 drivers/pci/controller/dwc/pcie-qcom.c            |  85 +++++++++++--
 8 files changed, 262 insertions(+), 67 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250908-controller-dwc-ecam-4c7c3136de14

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


