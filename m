Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61A7F53D8F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 19:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TkN95hNBsM+m1Qz3oZRxzC56xhU/PBHEbmCbmAFQkVE=; b=Mkjd39+BTP9hTH
	SCQZiZjOkmLXawe2bFm6zS1vhuyZ4/gn1byLVm9dhxyvsPVVaGB0OOc+4s43WluneRuJ/ZGZtndQH
	fno6JABK0ZXtGW6+SJNg0EqWkS4AuxZP4Lpk7d/wuVHvM1ZNfYjamteW6jazw2cVu4mTCqTvu4TFS
	vWjmTABLJwXXclxDGrhzF1t2Si+nSUb/AvJzgtFIfyf3lGbYUdrBTblxstYBvcl9qVZ40yODOH2Ub
	ObP37i8mVJfGLRD2TFmzL0ustTb0uYYG3VDiucFEF23D7q1ZRdkuJcsqYEVC9iJYYr05oD77EgRoj
	1TBQ7z27tBQ8qNaXUTBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DLG-00000004ipj-3WuX;
	Mon, 16 Mar 2026 19:11:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2DLB-00000004ili-3W2B;
	Mon, 16 Mar 2026 19:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773688259;
	bh=EpEAz6ZqwJkDNkCZ+z+Y4RAWpZZLbaj6eavYPZTGewY=;
	h=From:Subject:Date:To:Cc:From;
	b=pHOvbA+Z+H70VRT8h/qv9xAaPLpvRevyDqH4eKCpvWUsJtLz846j+/5tcVlgw1oKP
	 0BOPeH9WwS2EW/6q8FdaysJYR6fAFNwwzmB8zvquKsrVzyOp/EEmGOsByhiENK0C3I
	 Fu4RHSpSrRCeXBGJbT4q7YNFJAHxDHmpJWqGOuNc8yYJF+utc7jVZHnEhVEUfcdYW5
	 KFFSGwT1kx3yTsdnCbC/CGAJ173KHcAF2xbt1792Xta/pHKeW+wzbTm6jfinUgqmbZ
	 xUFs9M3EnTZzUwT/N5oKa5WOL9d12MntNNdBPWO0Sk6aNXyVbiT+BFXindJjgjmLfA
	 Lz/VG99L8W3vA==
Received: from jupiter.universe (dyndsl-091-248-189-119.ewe-ip-backbone.de [91.248.189.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF16017E1380;
	Mon, 16 Mar 2026 20:10:58 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 96ED248002A; Mon, 16 Mar 2026 20:10:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v5 0/8] PCI: dw-rockchip: add system suspend support
Date: Mon, 16 Mar 2026 20:10:44 +0100
Message-Id: <20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALVVuGkC/33NQQ6CMBCF4auQrh1TGkBw5T0MizIMMhFo00EiI
 dzdSuLW5f8W39uUUGASdU02FWhhYTfFyE+Jwt5ODwJuYyujTZ5qU0Jw+MSePXhkAlllphHkJZ6
 mFsoCO13aS2NMpSLhA3X8Pvh7HbtnmV1Yj7cl+64/uPoPLxloQDKUNrqoTGtu6IbBNi7YM7pR1
 fu+fwAM4/tyzAAAAA==
X-Change-ID: 20251028-rockchip-pcie-system-suspend-86cf08a7b229
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3490;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=EpEAz6ZqwJkDNkCZ+z+Y4RAWpZZLbaj6eavYPZTGewY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm4VcKFqlGl/fxwkTLfzc3W9keZVjO3HZb8s
 cvCADBCqIpXg4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuFXCAAoJENju1/PI
 O/qayNkQAJYNUnYaejzv1Ufxf0z2l33ZQASBefGbXGznijrK2sS2O6B++zqm+HA5M0UbMnLK9i5
 CWP8jQt5dGugU3mFiPZ1zHiwlydst0eKgzQb+1/oMu1qXTH+X2AOwbL5IwzoG6fDp2hBcH2qXJV
 FqCNY5syO8M5czUGtQ5ZuW9N3NceGiZJkJgxJQ07PpQFMdM5f4Xk0F3y5g+ZUd5mYIMiNGSysPR
 tKe/yr7f7UMFC0uS7DcxWOnMbO4DzrTKkDDVXKhv/iNQbbG2PVuuYIJNHrFlDYEHm/1SK9emFzC
 v/GswuV3n6RyuOrhNv2LsOSKQPOnodFSBJLnVLkLeALpZjUn6GV9kOaMPVPFW5K/MJcak83TmVw
 H/s3CPMKMVRcWrrtldKLS2mJXtzFkodGnsr4XGaeWxrRgmq/Ca8Ze0yPpk+1z0Z2XIwo2drUR9+
 RhOgbhGWvQh3XgMsl4EmplG0/ZryfNtKYVzQG+tUdl5NdN0r49Rj0jFblQqWyw909xk6t6Evep9
 zw5sV9ztwhirfHzGmpM9C3/tPR1Ha0T+6sgPKEGEAkDV6jBC3lxHQ6egmxDa+HK/Y3PmsDHHwbS
 n2O+U+kPoBXWnZ+rVHMYw3l3PckPRsRSLZu0eRoh2XaDmaVsXstGjrZ3u5CCitdZ+JnJInU63Hr
 +tccvmMBjcmr1czvRfKI2Tg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_121102_036650_27C8CC11 
X-CRM114-Status: GOOD (  14.68  )
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

I've recently been working on fixing up at least basic system suspend
support on the Rockchip RK3576 platform. The last open issue is missing
support in the PCIe driver. This series is a follow-up for Shawn Lin's
series with feedback from Niklas Cassel and Manivannan Sadhasivam being
handled as well as some of my own changes fixing up things I noticed.

In opposite to Shawn Lin I did not test with different peripherals as my
main goal is getting basic suspend to ram working in the first place. I
did notice issues with the Broadcom WLAN card on the RK3576 EVB.
Suspending that platform without a driver being probed works, but after
probing brcmfmac suspend is aborted because brcmf_pcie_pm_enter_D3()
does not work. As far as I can tell the problem is unrelated to the
Rockchip PCIe driver.

Changes since PATCHv4:
 * https://lore.kernel.org/r/20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com
 * rebase to v7.0-rc1
 * Add an RFC patch at the end with some bits I found in the Rockchip vendor kernel;
 * Made some tests on Rock 5B+ (RK3588); with this patch series suspending works
   when setting pm_test to devices. A full system suspend fails in a later step,
   but that is independent of PCIe.

Changes since PATCHv3:
 * https://lore.kernel.org/linux-pci/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/
 * rename rockchip_pcie_get_ltssm to rockchip_pcie_get_ltssm_status_reg
   in a separate patch (Niklas Cassel)
 * rename rockchip_pcie_get_pure_ltssm to rockchip_pcie_get_ltssm_state
   in a separate patch (Niklas Cassel)
 * Move devm_phy_get out of phy_init to probe in a separate patch
   (Manivannan Sadhasivam)
 * Add helper function for enhanced LTSSM control mode in a separate patch
   (Niklas Cassel)
 * Add helper function for controller mode in a separate patch
   (Niklas Cassel)
 * Add helper function for DDL indicator in a separate patch
   (Niklas Cassel)
 * Move rockchip_pcie_pme_turn_off implementation in a separate patch
 * Rebase to v6.18-rc3 using new FIELD_PREP_WM16()
 * Improve readability of PME_TURN_OFF/PME_TO_ACK defines (Manivannan Sadhasivam)
 * Fix usage of reverse Xmas (Manivannan Sadhasivam)
 * Assert PERST# before turning off other resources (Manivannan Sadhasivam)
 * Improve some error messages (Manivannan Sadhasivam)
 * Rename goto labels as per their purpose (Manivannan Sadhasivam)
 * Add extra patch for dw_pcie_resume_noirq, since I've seen errors
   during resume on boards not having anything plugged into their PCIe
   port

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (8):
      PCI: dw-rockchip: Restore vpcie3v3 regulator handle
      PCI: dw-rockchip: Move devm_phy_get out of phy_init
      PCI: dw-rockchip: Add helper function for enhanced LTSSM control mode
      PCI: dw-rockchip: Add helper function for controller mode
      PCI: dw-rockchip: Add helper function for DDL indicator
      PCI: dw-rockchip: Add pme_turn_off support
      PCI: dw-rockchip: Add system PM support
      [RFC] PCI: dw-rockchip: port some suspend code from vendor kernel

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 242 ++++++++++++++++++++++----
 1 file changed, 206 insertions(+), 36 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251028-rockchip-pcie-system-suspend-86cf08a7b229

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


