Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9037BC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 07:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lzZ5jD5RunNd3+UowXQTeouIwkDZfTNMXfWOAb2dDtE=; b=nGCk2MbWBDaxmX9v4DL3VOcwPz
	Qqz7BVWw5XXWTJsWQirvwkjNk99Cv1IvOK3kjVTUaFx+BmifiN+0khVujjlRtEEsuYPzDE1JLrR8b
	/IKUMYnHYoT/XZlFxysbahKwWj18a87KAXNUaWwXfGOuSgF41WzFk2d1MoBDpNLp/g8JYZMXI1T3Q
	B0rZ8DQV/7my+LqmRATB4zeNs92u3t9PjfjHcYl0jO3yiQl10NI5O54vPC260OHTyO1gqJSGgrF97
	LsjaAEVy2VDFXiVzN4iolvtYBDinYLJNgr14lqLWkc65WOwkp5QWTBAoP+1l/1WtMRP3f4+5umTgW
	SCHroSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEk8Z-0000000BcwW-3XoW;
	Tue, 13 May 2025 07:33:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEk6a-0000000Bcbq-3Uau;
	Tue, 13 May 2025 07:31:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D928A4C739;
	Tue, 13 May 2025 07:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6A0C4CEE4;
	Tue, 13 May 2025 07:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747121470;
	bh=mhXaZrEiTTFXiKUS/evmkAlm33VGdO8jQP529dU/TcY=;
	h=From:To:Cc:Subject:Date:From;
	b=X4u91AU2J6XsZ6JBGzmgxBbFV7gICrDqeuWvPYXUE8msg68HR6wlrPE47xgh8Af+n
	 mDESEXxZw98PYFNgN6FAJ11HWzjjro+gRvnaBKaxeUTiZ9DehzGKWPMPUrqztvjf6E
	 8Kh8FyvKV8VKb6RkAZPnzI9BJ8kwwDAVB08vGAdYZggjt8/cl0xUdgrZ5+aUsBIqA9
	 2SB8XyLch8rQMxbL/c1A5zX+c/SaZiqrbO0KMobQtdYujSomr61+zwoqsC/Ss4CFVt
	 B9wJ6OfZgAUwnhhTmnGedRW2i0Aemuv2mmZRspX61EK0qhYzw0bUO2B8cR+4x+AFq2
	 2CJdAi10sxaNA==
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Alan Douglas <adouglas@cadence.com>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/6] PCI: endpoint: IRQ callback fixes and cleanups
Date: Tue, 13 May 2025 09:30:55 +0200
Message-ID: <20250513073055.169486-8-cassel@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=cassel@kernel.org; h=from:subject; bh=mhXaZrEiTTFXiKUS/evmkAlm33VGdO8jQP529dU/TcY=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGDKUvupfD9gqv7h4wy6jTLsv2isvS16bNP1o34J39dsff zhxK79tY0cpC4MYF4OsmCKL7w+X/cXd7lOOK96xgZnDygQyhIGLUwAmYi7A8N/pZq/8ok1uW8/7 pbmaaj3otZ0z7eLNnRIxK52so3dxiuow/I+2lWFyv/Zfxd2aWauR/fWK1XVp4Y/jd4UXf/gkyLA /iREA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_003112_938334_368A394F 
X-CRM114-Status: UNSURE (   9.25  )
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

Hello all,

The first two patches in this series are IRQ callback fixes that should
get backported.

The reason why the bugs existed in the first place is because the APIs
are very confusing. The rest of the patches are cleanups of the APIs.
These cleanups should not get backported.


Changes since v1:
-Improved commit message of the fix patches.
-Picked up tags on the fix patches.
-Added cleanups patches.


Niklas Cassel (6):
  PCI: dwc: ep: Fix broken set_msix() callback
  PCI: cadence-ep: Fix broken set_msix() callback
  PCI: endpoint: cleanup get_msi() callback
  PCI: endpoint: cleanup set_msi() callback
  PCI: endpoint: cleanup get_msix() callback
  PCI: endpoint: cleanup set_msix() callback

 drivers/pci/controller/cadence/pcie-cadence-ep.c | 10 ++++++----
 drivers/pci/controller/dwc/pcie-designware-ep.c  |  9 +++++----
 drivers/pci/controller/pcie-rcar-ep.c            |  5 +++--
 drivers/pci/controller/pcie-rockchip-ep.c        |  9 +++++----
 drivers/pci/endpoint/pci-epc-core.c              | 11 +++--------
 5 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.49.0


