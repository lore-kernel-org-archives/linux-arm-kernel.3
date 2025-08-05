Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE63C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 12:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oe680uPUf2hke5nStuXO/mfK9ILQVwsMBsjxLSlqjyY=; b=DmBXEVQeezYg/v
	MLBegoYo+CT8Q3QAQu12gLEKS7NOlWNjmaSBPqIEwi13SUjOPZkvytcaveGHYtQvIhaeL30C6Rseb
	Npth1ewOvNlvGyYvbq7pRGf0UK5Li4AcGv3v9oahK7Ai5S47OKkFsikSzfZpC4PsYVSn8x2kxnBJ+
	jNhQlMvpM9YRDVRjfgqqpnx9emkMptXRRXqAmf2pkR3OPaIX1ry8UO+VY7+BOXnh/sSSt5z71ZM3w
	Scq3/xlOETbfGcGab3lkhvBjkEcBSXhO7UGv5HwTpaCaGGZ4WFEcMtH5fASCsbxCtvbENvy5ksdGZ
	0hkzfYnN3BTc7dQeANbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGMz-0000000CegQ-0VGk;
	Tue, 05 Aug 2025 12:02:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGHg-0000000Cdd5-3q0M;
	Tue, 05 Aug 2025 11:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754395006;
	bh=k1SsbcEubPLdbrG03mOUs1Bmt3XqU87WofwUgso3Gtc=;
	h=From:Subject:Date:To:Cc:From;
	b=F5GEecRf6Mfk4fSlMzpjcS80VspDpmMbvMLI9o5RmQTwNQyAndZgIjb7wQ+KHfDDR
	 qyGZb6oBmdMkenMmAFmS85WaGC/AzZawf+eIpJTYGjnyMSHX2gIG3tvTZuj2jLitvf
	 ybVVZsbLJO4cJvUgmSPB4zGXqQJcA4LCNujaYv0UYXDYw5zQbyTH97C+aDfii9YS+n
	 pJh5I03XNEEuOAaS3BkrL7Jk38QS6pu6l88dPXSPdKYkPDidWBdLi/hPWbtUkFeKsM
	 06HyzT3EYRJB3ArnKEQtum1Ius1gGRqmsiBSQSS4sk9y5Tv3PRJlwQLQz+GpM6qpWx
	 SzTai64H5Av4Q==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 824E417E0202;
	Tue,  5 Aug 2025 13:56:46 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 00/14] Add HDMI 2.1 FRL support to
 phy-rockchip-samsung-hdptx
Date: Tue, 05 Aug 2025 14:56:42 +0300
Message-Id: <20250805-phy-hdptx-frl-v2-0-d118bd4b6e0b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHrxkWgC/3XMQQ6CMBCF4auQWTumFLTCynsYFlCmdpJKm5YQC
 OHuVvYu/5e8b4dEkSlBW+wQaeHEfsohLwVo209vQh5zgxTyJpR4YLAb2jHMK5ro0OiqUmocGiM
 J8idEMrye3qvLbTnNPm4nv5S/9Z+0lChQGxLNnaSsTf3U3rl+8LG/av+B7jiOL2++RQiuAAAA
X-Change-ID: 20250708-phy-hdptx-frl-fc3377db9f2e
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_045649_108248_B164782F 
X-CRM114-Status: UNSURE (   9.35  )
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

The Samsung HDMI/eDP Transmitter Combo PHY is capable of handling four
HDMI 2.1 Fixed Rate Link (FRL) lanes, while each lane can operate at
3Gbps, 6Gbps, 8Gbps, 10Gbps or 12Gbps.

This patchset extends the HDMI PHY configuration API to manage the FRL
mode and provides all the required HDMI driver changes to enable FRL in
addition to the already supported TMDS mode.

The series also contains a few driver fixes/improvements that are not
directly related, but are not deemed critical enough to warrant separate
submission.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Added a couple of new patches:
  * Fix reported clock rate in high bpc mode
  * Drop hw_rate driver data
- Applied several tweaks to the following patches:
  * Compute clk rate from PLL config
  * Switch to driver specific HDMI config
  * Add HDMI 2.1 FRL support
- Rebased series onto next-20250804
- Link to v1: https://lore.kernel.org/r/20250708-phy-hdptx-frl-v1-0-cfe096e224f4@collabora.com

---
Cristian Ciocaltea (14):
      phy: hdmi: Add HDMI 2.1 FRL configuration options
      phy: rockchip: samsung-hdptx: Fix reported clock rate in high bpc mode
      phy: rockchip: samsung-hdptx: Reduce ROPLL loop bandwidth
      phy: rockchip: samsung-hdptx: Prevent Inter-Pair Skew from exceeding the limits
      phy: rockchip: samsung-hdptx: Use usleep_range() instead of udelay()
      phy: rockchip: samsung-hdptx: Fix coding style alignment
      phy: rockchip: samsung-hdptx: Consistently use [rk_]hdptx_[tmds_] prefixes
      phy: rockchip: samsung-hdptx: Enable lane output in common helper
      phy: rockchip: samsung-hdptx: Cleanup *_cmn_init_seq lists
      phy: rockchip: samsung-hdptx: Compute clk rate from PLL config
      phy: rockchip: samsung-hdptx: Drop hw_rate driver data
      phy: rockchip: samsung-hdptx: Switch to driver specific HDMI config
      phy: rockchip: samsung-hdptx: Extend rk_hdptx_phy_verify_hdmi_config() helper
      phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 670 ++++++++++++++++++----
 include/linux/phy/phy-hdmi.h                      |  14 +-
 include/linux/phy/phy.h                           |   3 +-
 3 files changed, 581 insertions(+), 106 deletions(-)
---
base-commit: 5c5a10f0be967a8950a2309ea965bae54251b50e
change-id: 20250708-phy-hdptx-frl-fc3377db9f2e


