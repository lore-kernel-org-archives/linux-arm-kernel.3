Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673FDC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 09:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qHh7E26OMCaprlKM6bcmUFvYmWt6auyVozS9jYbxen4=; b=Zym+Ghtj4ZKhADCwxLOGYbQyWM
	PZdG76VJ+z/zAHSaYiVQhDs9nishHjdUvIIhFDIlrDu+Fv9mmp5k9ERb1y6GGRBoKzTNTbTWaZSR2
	HlhIwQZH/5/nYh0PlGQBp/x2r6Xng91ymoZNC7wG1tMY2XyNIfejZZeLVAPnVFJAoE7iCIGT6gH8a
	2MHFCIZp7va1WKs4/fRkL8AUkQE8aecLlf7Gg/en+YT8/jhBSPLNMytGo+pEzCXo2D+//kUQUeJmg
	i6xa+VX9tEx0z2EaLZegbBo8OARtL32OwDidkX2W3Hz0runOslr1CgZ3yH5zYra1pHGSfhR0zNmDj
	EZ4gUqCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBs7g-00000006vEf-0Ezx;
	Mon, 05 May 2025 09:28:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBs5d-00000006ulH-2Yni;
	Mon, 05 May 2025 09:26:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 505AD5C555D;
	Mon,  5 May 2025 09:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB01C4CEE4;
	Mon,  5 May 2025 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746437180;
	bh=DN3ERg8zsCk+ghA8/wCrbbGaeNolgYO/AVElrgswuPE=;
	h=From:To:Cc:Subject:Date:From;
	b=VvX+ZyN0o0c8Rt/vlhx+eqQs7PTPAfcpzfaOC5POHtDY5EQLrSbqNxsM0ISNy/5kt
	 UpcZCXGg/+SZ1i2OBxDec47MDXsty/6EdmSMt75EskDWSH+T5i0VbDGDlq3Q6bSrgc
	 c8sH3aMWiO1AVrrZa4dxRHwvYPYWxvpigmh01BRmxtuLPeEqKc/lD4HYpZvjIskyMO
	 SZu8rXFUgqlVFP8Crq7oG3ykIwWM6VHFnk7NZxa/YjfHRbyx6XNMgtjU8bbwjDYPxw
	 z/tD+u/m/GdGsmJGz3E201GdNx2IXcBk4BynOmJhCzScLW76LOp+hSt2p0i1tWSB7W
	 QYbtsITDux3Nw==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Niklas Cassel <cassel@kernel.org>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/4] PCI: dwc: Link Up IRQ fixes
Date: Mon,  5 May 2025 11:26:04 +0200
Message-ID: <20250505092603.286623-6-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=cassel@kernel.org; h=from:subject; bh=DN3ERg8zsCk+ghA8/wCrbbGaeNolgYO/AVElrgswuPE=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDIkWrRZjAVWLDy3O2UL1886j6ZLzj/Z04VClRySY/yqN 8U0BJp0lLIwiHExyIopsvj+cNlf3O0+5bjiHRuYOaxMIEMYuDgFYCJO0gz/Y74oSLR29a45kpQ/ re58xCPP95lhS2esK4vZcspS/mFEF8P/qqaA0p92906vXHWUzbF4y//g6bPfhlmsnHbY8fO9Fau mMQMA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_022621_689917_1C136023 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

Hello there,

Commit 8d3bf19f1b58 ("PCI: dwc: Don't wait for link up if driver can detect
Link Up event") added support for DWC to not wait for link up before
enumerating the bus. However, we cannot simply enumerate the bus after
receiving a Link Up IRQ, we still need to wait PCIE_T_RRS_READY_MS time
to allow a device to become ready after deasserting PERST. To avoid
bringing back an conditional delay during probe, perform the wait in the
threaded IRQ handler instead.

Please review.


Kind regards,
Niklas


Niklas Cassel (4):
  PCI: dw-rockchip: Do not enumerate bus before endpoint devices are
    ready
  PCI: qcom: Do not enumerate bus before endpoint devices are ready
  PCI: dw-rockchip: Replace PERST sleep time with proper macro
  PCI: qcom: Replace PERST sleep time with proper macro

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 3 ++-
 drivers/pci/controller/dwc/pcie-qcom.c        | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.49.0


