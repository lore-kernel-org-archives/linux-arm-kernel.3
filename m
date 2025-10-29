Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49600CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZsFEbE7S0f9y/qD7Uf+hx5utkZdSrSsSnttbBapzqkU=; b=F/pzpyVMVp6/M7m/mntqJpktKQ
	ue3Bw+++qwrGhYhnziIyXmX9YRzUBX5iZDnMytHDs/EFVIKvX3/y04HcFsAlGnLGgMg91zZ4/lnAi
	u5vl33k8v5nMU6Ayd9O2tNllbJWzkI7ZoptCrpaPRFbQPD+hDWoCvCdp029dg3CgVka3GxqsWxb+m
	eF9wr4BneRBvPTrY2ZHsiuIsPwIC1V5eQ9ZEHBZURnMMllVYx3SaPpGk6G9/R5DqVKymDeJTk9cRQ
	ge9ybmjnLrLve+PY1sLAyBBUqSgDx0DpdLQEUGiT1kuJGzCPUEMFgZ4Pj822apdHBRbA6FW6lCtL+
	em6aUiOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAQS-00000002ItS-0X9B;
	Wed, 29 Oct 2025 17:57:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAQ1-00000002IRa-2cSd;
	Wed, 29 Oct 2025 17:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761760623;
	bh=k13cNh78f2SsMWLEgXiABWQ57IKXd/nXYc2niTuOENU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A+G8aKZKZoQJhZ2r63Er3ESTCLUAGWRbu7+BKxqLwWR0cSy96jDfCG5znd3fuZaWU
	 NRBYQGFqEgC/on9T1UBI2dye05RJfIBTwEBQnaPP5bdX7s5ZoMjuHuk31IWe1zINUP
	 uSwAtzqLcHK7nBDEn6LNxOCl5uno8VBYoRa95eKW//Vd8tbz2IQkSmnp419BQYml65
	 LpfQ90LWjvzU8uYz7BZxkzzlD9znooaPA9fl4GzGC8ywJ3MefFCmx7pK48bHcXm2y+
	 Fuv2P7tYn0p+NAyd+PwHlX1ahZvY8riZy9vSJcfxCNzHvKyVRl+a6v5og9fZ6I8TEu
	 sAFp6GOhYyU7w==
Received: from jupiter.universe (dyndsl-091-248-085-053.ewe-ip-backbone.de [91.248.85.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E9D8F17E141E;
	Wed, 29 Oct 2025 18:57:02 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 2622C480067; Wed, 29 Oct 2025 18:57:02 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 29 Oct 2025 18:56:48 +0100
Subject: [PATCH v4 9/9] PCI: dwc: support missing PCIe device on resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-rockchip-pcie-system-suspend-v4-9-ce2e1b0692d2@collabora.com>
References: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
In-Reply-To: <20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=k13cNh78f2SsMWLEgXiABWQ57IKXd/nXYc2niTuOENU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGkCVW7puYacCmFgJdWTqKj+Qh5jDC97SrAtp
 xZ17UhDM6EmyokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpAlVuAAoJENju1/PI
 O/qaeDsQAIIP71M1+TU3X3W6kWf7SlBQNcLuJtFUeN1eHFEH+QCIrjX8BolGbKr6yU4V916Ex5z
 zfdhyQXlMFVwpeODkmuT/6x143JVegZBHAborr80gBcFhxgve8zlHpGs54xc/b6fooU1j6m2eh0
 t6N2nwuqu4iX47PL48Aol7Nb5vQ8L16XfyvbapDlLfb/7dZ93bYD+xeO2qlSHGWND2EmUkWpQd1
 Wi73+1UjZSM0JGeXPcfZSLm2MbSjdQ6sFUyNKdOTDldDzJ/bJwbUCxBhwRU8wKz+quUDY/woo3m
 kPz9+RHL0/kFp52rfcl4gQdlHw9AUJv35af3Ii45liecfNansATiiriipmh9Tf93CbiXUmZLy8k
 kKYD+i4OBdYExn6cjEWnVkDCsRdlFpiefVUUic0fA/RhGML33KGoT5W/o/Ie8Bw++jgatGqHbzL
 wZdZqilIX5FrBohby7gsBwfpI8MYCdec4ywdGeGRWFZJZCi37wwA5vrJ0vPWsqjAniBNZzDpTb9
 IpncuzihfoqHsPmz2DJqNayvvurRNQZiy/7WjKWXnGtOPRiLVL3ROJsCaqQxLjUiCtNt2LqMBMI
 II9Pp5I6X10hfdAERoaZqG2DgQq+LM2tsd0CyU2LQhapp1A/LQvycTDbo2LIkjvRgij8o5ofIiO
 7RowZ/MZ6hJFmXmdjiZwuPw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_105709_870169_0F8F29B6 
X-CRM114-Status: GOOD (  16.16  )
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

When dw_pcie_resume_noirq() is called for a PCIe root complex for a PCIe
slot with no device plugged on Rockchip RK3576, dw_pcie_wait_for_link()
will return -ETIMEDOUT. During probe time this does not happen, since
the platform sets 'use_linkup_irq'.

This adds the same logic from dw_pcie_host_init() to the PM resume
function to avoid the problem.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index e92513c5bda5..f25f1c136900 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1215,9 +1215,16 @@ int dw_pcie_resume_noirq(struct dw_pcie *pci)
 	if (ret)
 		return ret;
 
-	ret = dw_pcie_wait_for_link(pci);
-	if (ret)
-		return ret;
+	/*
+	 * Note: Skip the link up delay only when a Link Up IRQ is present.
+	 * If there is no Link Up IRQ, we should not bypass the delay
+	 * because that would require users to manually rescan for devices.
+	 */
+	if (!pci->pp.use_linkup_irq) {
+		ret = dw_pcie_wait_for_link(pci);
+		if (ret)
+			return ret;
+	}
 
 	return ret;
 }

-- 
2.51.0


