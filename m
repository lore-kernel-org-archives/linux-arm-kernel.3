Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3DD10F3DEA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 13:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WU+mpx/OV/k7fh3sltYwG2JFTu0rklZ2yVd16Spyzwc=; b=DLrExaRZw50G+F
	nX/GPrKWnI5cMDvgliqyT97qmGMdf6O+xqc9QmAi/AHMYEFHO8Hx1mJRP92j2zC0BYjicbh38hWxa
	Y3C+02NOcu3ID/zb5ykr4+PZlVBlA5uhbyfyRm9iO8s2HK9R1gUX8EauhM8US9FjeMV7unj08tv5V
	K124ITdQg061TVAdBPsmaacIzxwbbmMLYz4IIuC/laQ+VJNhTKc3ORmfW2/Zi7+sANPpom1GRLXjD
	m0aspil23XXIUiqytrKUXhJK+oi1Ry4ZgVO4aLnLW/qFavPoDHVfT64jSgtY5VXFMextsb3qhwFIH
	yD2sHj5LEBK+jD0E36ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6U85-00000008zgE-33Uq;
	Sat, 28 Mar 2026 13:55:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6U83-00000008zeU-0LPj;
	Sat, 28 Mar 2026 13:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774706102;
	bh=C4vWLiX5wARffrLgB+AKxv5ttHgJVjRxFMq153TPLJ0=;
	h=From:Subject:Date:To:Cc:From;
	b=qk3oXKMA7nl5srs2TfynK3hEqlSE8hEGKnV3SJ7VQHf79fes1APLgRCgT8/P+09hu
	 RP+FDPzyGNVPkJG/l5jzVpcY0rsVyjN3qo2h2Gygw3tqQNUEkOPCY7we97ezVnFslX
	 Co31iJUJvud6c1mTAoBLkC3RV/9vXwlCZuZfSPyEIYEmELJlYM9eNZO52ceo2P7KkW
	 o3WQv4sF82zUJW0YZ1kytrj+Der8mlTc04eO3SvmxnCdR9zXMqJxil4PH763t4+ipb
	 8vRVs5XNj2qmPbmdbL66v2+11PdStVk4erUcf/aukskjv5jQHVVWdjA5LBC5zdu1xH
	 rPxdV2wUxxCXw==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5237817E5F2E;
	Sat, 28 Mar 2026 14:55:02 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/2] phy: hdmi: Add FRL TxFFE level control
Date: Sat, 28 Mar 2026 15:54:53 +0200
Message-Id: <20260328-hdptx-ffe-v1-0-53ebd5dea20a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0XO2wqDMAyA4VcpuV5Ao6vaVxleuJrOsnlY24kgv
 vs6FXb5h+QjK3h2lj0osYLj2Xo7DjHSiwDdNcOD0baxgRKSSUYldu0UFjSGsSkrfU1ZyirJIe5
 Pjo1ddutWH+34/YlkOIZ/UYndIypOT7+euB9jXuQkZUamlKTm9AffG8+ox763QYmBl4DnNwXU2
 /YF2mqZDcMAAAA=
X-Change-ID: 20260328-hdptx-ffe-a89c51e66904
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_065507_278229_E2E294DF 
X-CRM114-Status: UNSURE (   7.34  )
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

During HDMI 2.1 Fixed Rate Link training, the source and sink may
negotiate a Transmitter Feed Forward Equalizer (TxFFE) level to
compensate for signal quality degradation on the physical channel.  The
source starts at level 0 and may increment it up to a maximum agreed
upon during LTS3 in response to persistent link failures reported by the
sink.  TxFFE adjustment is optional and entirely independent of the FRL
rate and lane count selection.

Patch 1 extends the HDMI PHY configuration API with two new fields in
the frl sub-struct: ffe_level to carry the requested level, and a
set_ffe_level flag that switches the semantics of a phy_configure() call
to a pure equalizer update, leaving all other fields ignored.

Patch 2 implements the new interface in the Rockchip Samsung HDPTX PHY
driver.

The series depends on the "[PATCH 0/6] phy: rockchip: samsung-hdptx:
Clock fixes and API transition cleanups" patchset:

https://lore.kernel.org/all/20260227-hdptx-clk-fixes-v1-0-f998f2762d0f@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (2):
      phy: hdmi: Add optional FRL TxFFE config options
      phy: rockchip: samsung-hdptx: Add support for FRL TxFFE level control

 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 74 +++++++++++++++++++++--
 include/linux/phy/phy-hdmi.h                      |  6 ++
 2 files changed, 75 insertions(+), 5 deletions(-)
---
base-commit: f7b64ed948718290209074a50bb0df17e5944873
change-id: 20260328-hdptx-ffe-a89c51e66904
prerequisite-change-id: 20260227-hdptx-clk-fixes-47426632f862:v1
prerequisite-patch-id: 5c1d442fae39103bb758f54738aff33d2491401d
prerequisite-patch-id: b86f30292308345387d2a6b50949ad040b931592
prerequisite-patch-id: b1335105db9177cb10c64ed1bf0867832e6aac2f
prerequisite-patch-id: 83db6603d13e19f239e89fde2b26366eb0106b7e
prerequisite-patch-id: b534395ad315811861f11859a3946f65c90c631a
prerequisite-patch-id: f9637e57c902f35218cda658397416f84f7285cb


