Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB59C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RzZYpXWuLukFnorYt90tOqNjJYKiudsOHzjl4cgxJEg=; b=JCImFp7UCfAXy4WUwa7Db1QEMf
	JVgZVNtzPvwjTqXytfe3LwNEmkurC1Ks1bEOAGxYGVbaPDil5hkcyrxg6vwEb7qY6PvGz2dXfJrBY
	9vOdmqQl7T72l3Oz8l0F/+jFC5DMiMmOB/yFBFkUpfs73y/9nFfaGeYJWmBvPJI35F2bZIdfWUuCL
	7rDWTneUaT2iGW2ZqCJ/28yfa3yLvCbBE/wPw+E+ws3EHws1QkSH0a3SSbETO36u8RfR/92Ver0TI
	hHvnfLsVVa6ObAlqPrlHejlYaTE7Tl1x1bObKf5YpafC2L7z52JOcEm3eECBCSyKTJ5s4SmXHKl/J
	iZ8n9g4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZuT-00000002Axo-0xBu;
	Mon, 10 Mar 2025 09:58:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZkx-0000000290Y-1qfc;
	Mon, 10 Mar 2025 09:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFC355C5B98;
	Mon, 10 Mar 2025 09:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5F2C4CEEE;
	Mon, 10 Mar 2025 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741600146;
	bh=8mizgwqRIlps/wmW9ZM0NYMHVTcUp4zqPKkWqvWVlHY=;
	h=From:To:Cc:Subject:Date:From;
	b=W0j8zJyQnTnLhtRRmPnPFvthCiQvnRGus0WMEpK4ugXr+VLHzjChy3idi5KDBrJJl
	 jk5zvLHvo3pFsU1/QOvj0TVFYYXESs+UEr7ukQuAOfjXkFxTAPuO5PrN8Ug2/WgCxb
	 Ozrr696XGiWCAkh9pYk5BAMJyYfIR0jFiP4Cq//17QuWL7Xz4+EVx/FAO2Ljv8e69p
	 9RB3zWhsmdRWaji4L6mV1eOsiFHZzo4vEE4AP8fyNzPZXp7NlVHbvuDg8z4/kJ2lfm
	 AORYmcfNmYLR3BlvXkVxK96qYm0loYK6DQqgQMil33DPAiK4lQVcSYfejpQwzrpTg2
	 woibjJLH7nzyA==
From: Niklas Cassel <cassel@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 0/2] PCI: dw-rockchip: hide broken ATS cap in EP-mode
Date: Mon, 10 Mar 2025 10:48:26 +0100
Message-ID: <20250310094826.842681-4-cassel@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=864; i=cassel@kernel.org; h=from:subject; bh=8mizgwqRIlps/wmW9ZM0NYMHVTcUp4zqPKkWqvWVlHY=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGNLPbc3yPjXTveR4We+FcuaiI2fYLj/1P7NH6zf3DhmFy MrF7wu7OkpZGMS4GGTFFFl8f7jsL+52n3Jc8Y4NzBxWJpAhDFycAjARPldGhnVmrCoB/zZ6rOFP Mp11+O5rXq7AV4brz5jvjElYKj6hWZbhr0D0nNfaORk2R5ZmufW5PUrjFWDi5roizybWbt/iy1T ODwA=
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_024907_522560_CA7B84C7 
X-CRM114-Status: UNSURE (   7.79  )
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

Address Translation Services (ATS) is broken on rk3588 when running the
PCIe controller in Endpoint Mode.

This causes IOTLB invalidation timeout errors on the host side when using
and rk3588 in Endpoint Mode, and you are unable to run pci_endpoint_test.

Solve this by hiding the ATS capability.
With this, we do not get any IOTLB invalidation timeouts, and we can run
pci_endpoint_test successfully.


Changes since v2:
-Added missing EXPORT_SYMBOL_GPL().


Niklas Cassel (2):
  PCI: dwc: ep: Add dw_pcie_ep_hide_ext_capability()
  PCI: dw-rockchip: Hide broken ATS capability

 .../pci/controller/dwc/pcie-designware-ep.c   | 39 +++++++++++++++++++
 drivers/pci/controller/dwc/pcie-designware.h  |  7 ++++
 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 27 +++++++++++++
 3 files changed, 73 insertions(+)

-- 
2.48.1


