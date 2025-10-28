Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B0DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 08:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LrxlUs2OqGoFivRioLfSV6E3w/z5dRGbYVpsuMtAJNA=; b=zyaWu/IwGZb7pK
	U0it944ReOT57jtQ2d+x7dapK0fTeJnICfkaqLVk+EvQVb7Lq+XahdSdseQLu7IIvSF+OBhbbQ5PK
	TexyyqUgXOaCNSlVzDJmoHiNXuQIEoewEVFiIHhcIkfpLJHL3RlX84FagqIKNrGSdOSvKmGJJLJI5
	Tx/krYxDFRMHgW/c1EeNWB6PVnFejGmV8FZvOBPtFdRYyTjldbksyDq1H0h5oO/7DeMvisKVVam5g
	Wwxw9WDlUckJHKN3Dy+aBD/3il6OdsXOTB+BxPKdt+e2s8l7TJf49Pa01ZFZQOCTNMlFHumod/Cvr
	cXPJavx+np7jUdKffs+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeeg-0000000FUvp-48EN;
	Tue, 28 Oct 2025 08:02:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeed-0000000FUte-1fEh;
	Tue, 28 Oct 2025 08:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761638524;
	bh=w0hVbt0p8X5uVDG3kntIZUMpWvl4mJzdXMzRwu8Mtys=;
	h=From:Subject:Date:To:Cc:From;
	b=qxFBeKT1dUgT/LlBYTUYbJTMz57nWxhv6fGkB6yT9D3gkdCNLpPOLQrluXu2gAijV
	 U9Lxjp+UrbuxDGO4nE2YHX24L2h1fwvG/tAJBIUdCzyeSwk+w4EjKCsRaMPqaXXYxE
	 Ffs972t/IRjbof0BhdXGsNJSTMmkdn8tk95domcYJbexhCD2gNXSWySC3+ZDL2YbqA
	 TM8cGV5AO7HRLL4MREEVPX/h2M6uz/p/N8ALwDZ5WhQCrkDbmVHIofTCvW2NHwadsS
	 Xvv8OYD4uhbt4pwdyCMjJGxSP2wjhRz5cfx+vbNPBHYX+yIhE3lUEqd/1kV970RC0u
	 bI0Xju0TiOWrA==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id BCBDC17E1278;
	Tue, 28 Oct 2025 09:02:03 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH RESEND 0/3] Fixes for phy-rockchip-samsung-hdptx
Date: Tue, 28 Oct 2025 10:00:53 +0200
Message-Id: <20251028-phy-hdptx-fixes-v1-0-ecc642a59d94@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dmitry Baryshkov <lumag@kernel.org>, 
 Algea Cao <algea.cao@rock-chips.com>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_010207_607112_5E17171F 
X-CRM114-Status: UNSURE (   6.07  )
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

These patches were initially part of the HDMI 2.1 FRL support series [1]
aiming to provide a few fixes for the Samsung HDMI/eDP Transmitter Combo
PHY.

I'm sending this as a distinct series right now, since the FRL part
might require additional time for review.

[1] https://lore.kernel.org/r/20250818-phy-hdptx-frl-v3-0-c79997d8bb2b@collabora.com

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (3):
      phy: rockchip: samsung-hdptx: Fix reported clock rate in high bpc mode
      phy: rockchip: samsung-hdptx: Reduce ROPLL loop bandwidth
      phy: rockchip: samsung-hdptx: Prevent Inter-Pair Skew from exceeding the limits

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 27 +++++++++++++----------
 1 file changed, 15 insertions(+), 12 deletions(-)
---
base-commit: 33bcf93b9a6b028758105680f8b538a31bc563cf
change-id: 20250902-phy-hdptx-fixes-7308ffea4c6a
-- 
Cristian Ciocaltea <cristian.ciocaltea@collabora.com>


