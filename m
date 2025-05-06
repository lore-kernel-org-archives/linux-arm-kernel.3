Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E533C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 07:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/LksMGCAHDbgW5q1U+/iEuAByuFAAYSoBipu9Zzq+rM=; b=RHMT7clRDAyTkNPQaFma7zhALr
	sTsYSURBEquL/tmP8JqlOeH0n95XNsLFG6L5hfODUUMgnw0LYOGTDfu+ZHn0VxvmJ7FCRFak4zSei
	17KKiPGgDktVCY0ws7k+HnMMEOTVYIiPtgsyvC/qWys1ShZ4TcYvRihBBPVWzQ0985hNDLVK9vaUp
	aFcMf5NhfFqCyJx+FrM0fVRLDmT0BX1EaeCxFL4ZlrXFu2Tu4QGInssoPDkUfJmqkwZ+uElhplqkg
	59IPGX7f8IiIcNayymLINLRss6hbgkEjOiPkX+ws8Oob9E3s5PZZxjNa79ksY0vJtCELhTv7/vgUq
	RgMxRhQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCCwo-0000000AzBV-2ZoN;
	Tue, 06 May 2025 07:42:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCCu4-0000000AyOf-0NqX;
	Tue, 06 May 2025 07:39:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D1E161154;
	Tue,  6 May 2025 07:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC72FC4CEE4;
	Tue,  6 May 2025 07:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746517187;
	bh=6TO1Noew8Rmq68imwQlh7EbC0TUncfmpyl6I2bKeN58=;
	h=From:To:Cc:Subject:Date:From;
	b=JhP+SbQS09oMuqBK/ge4+Dtfkcli4nE+FZi/DJzIVogt1qmZkjF48k/6ArdpNBpF7
	 fFpvn2BM8nxjsNuRjWn/Oy4ES9XfnzeRFmso7qlS6CuJ+wGDm7JcMBKQ+EFTj8nJ8Y
	 frQmn8JaoxioWRf0W4akI4K2ZfF18ktCkJClGOxDjmAa0isSVr3cddW+2WMRvnVTNm
	 MoJckLJLERjy1VU8e8RRb4bJekKkX/5kY/ZEjIrHuo3A08eeqpmT+42310hMt657GZ
	 ssitxgJA98PnbT92FxWQWdB9cq9QMUcl8i6mUWYCMrc62BkPbmHR2mYQ5kSYO8QTdG
	 BEq/LbIifYFQw==
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
Subject: [PATCH v2 0/4] PCI: dwc: Link Up IRQ fixes
Date: Tue,  6 May 2025 09:39:35 +0200
Message-ID: <20250506073934.433176-6-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085; i=cassel@kernel.org; h=from:subject; bh=6TO1Noew8Rmq68imwQlh7EbC0TUncfmpyl6I2bKeN58=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDIk92wLWrd5lVmczqKAgpU7yzdY7pzss2OB3T/mIBs2t ajntpskO0pZGMS4GGTFFFl8f7jsL+52n3Jc8Y4NzBxWJpAhDFycAjCRp6aMDLvfL2tZ6iK56ULL O7UPdmfNE3btEPNWlTzPel9f0u1N6gGGv9KrbBesdFxjtkX1+JnUjDN/rkreCJjvVMrdING/cyF bDisA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
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


Changes since v1:
-Added missing include pci.h that was lost during rebase.


Niklas Cassel (4):
  PCI: dw-rockchip: Do not enumerate bus before endpoint devices are
    ready
  PCI: qcom: Do not enumerate bus before endpoint devices are ready
  PCI: dw-rockchip: Replace PERST sleep time with proper macro
  PCI: qcom: Replace PERST sleep time with proper macro

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 4 +++-
 drivers/pci/controller/dwc/pcie-qcom.c        | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.49.0


