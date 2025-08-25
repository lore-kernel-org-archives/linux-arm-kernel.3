Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D4FCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 12:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e1TAC4JB1aCLzQopA/pMqP1k8qqoWrMTjSNzHCIhNVg=; b=nrix7zDW0x2AWP
	wwPfnLlFoFz3mEGC5cyzxZkBG1lTCA7ERrAGlHXUIIdpxE+4xhBOHkw967Sr+SESz2fh3tkovHEa/
	F/bndOniKSjDXtDC+yCBtix25/2es2bEJDsKRrCw/5AB8a3LvjuuwnzWVu3aUaR4PsY0t/dFkqcM4
	lQejSOQyoo/mI2BREN45NEBU7jba9Q4jN9Tpfq1s27tNKT4ZnRopQef/ybOykvURQKagcW2F5qRz4
	87HfeHpgx22n0blX3i2NXIX9oQVvyoNqZhC+mpTj8BzQjGXdEZsKzCbAeEj80J+WZXbVIngPgqPZm
	L9Z0Rf7hB6MHJuHXRzDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWgV-00000007yHq-3NVl;
	Mon, 25 Aug 2025 12:52:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqU85-00000007as4-0IMu;
	Mon, 25 Aug 2025 10:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756116522;
	bh=it5FFa21DEVOmToBYVfJbzv1d4wyjQlQ0/n5ky7NZLE=;
	h=From:Subject:Date:To:Cc:From;
	b=SjKxfUdOsmc74i2wI3UDREW4VtozOBQigB4OrN2p1Ox3OHsiVvNh4YMhlhrVg4IUd
	 LQZ5LBDkmEIK9TlMnATchDCUejCHiEqy1xTQo0EUS/CGnlm1acqUgTvYluvN7J4gIo
	 CcYVCcO+hpbf8eEQXb2QuUyxDPJ4x8A/2+7HJylLmuIYtyVKs75/M8wgz204pBUWMf
	 fyNTxv/EA7u7Xkhr1bW2CatPQX7SQtpIJEBe6BrYdsrbxdZj0qvDsibHqh3nP25MZ2
	 +xGvGBOCzCiMt6WLKdcIFVN6s43BwRGm2CFdBG8I6gH73sAwtrp/lAcsEsXq+k4VfC
	 0qG9qnplbw6EQ==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id A0A8817E053B;
	Mon, 25 Aug 2025 12:08:42 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/5] High color depth support for RK3576/RK3588 HDMI
 output
Date: Mon, 25 Aug 2025 13:08:31 +0300
Message-Id: <20250825-rk3588-10bpc-v2-0-955622d16985@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB82rGgC/3WOMQ7CMAxFr1Jlxih1GwiduAdiSFOHRtAGklKBE
 HfHBCEmBg/f0n//PUSi6CmJpniISLNPPowccFEI25vxQOA7zgIlKrnGEuKxUlpDKduzBa2cqy2
 iplUluHKO5Pwt43Z7zr1PU4j3TJ/L9/cPaC5BAm2UqU1rXa1xa8PpZNoQzdKGQeyfH3qky5Udp
 8/ET5GNM1dWX27fDR4sWT6jncKqY2wzZ83WJALGDn5qipFuE+S2RsVDzxfd3dG/FAEAAA==
X-Change-ID: 20250721-rk3588-10bpc-85ff4c228e63
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_030845_275500_9664C3DD 
X-CRM114-Status: UNSURE (   7.68  )
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

Since both Rockchip RK3576 and RK3588 SoCs are capable of handling 10
bpc color depth HDMI output and we've already landed the required HDPTX
PHY driver changes to support the setup, let's add the missing bits and
pieces to VOP2, DW HDMI QP encoder and bridge library.

Please note this conflicts with the HDMI CEC series [1], hence I added
that as a b4-managed dependency.

[1] https://lore.kernel.org/all/20250825-rk3588-hdmi-cec-v3-0-95324fb22592@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Replaced patch 'drm/rockchip: vop2: Add high color depth support' with
  'drm/rockchip: vop2: Check bpc before switching DCLK source'
- Rebased series onto next-20250825 while adding the HDMI CEC series as
  a dependency
- Link to v1: https://lore.kernel.org/r/20250721-rk3588-10bpc-v1-0-e95a4abcf482@collabora.com

---
Cristian Ciocaltea (5):
      drm/rockchip: vop2: Check bpc before switching DCLK source
      drm/bridge: dw-hdmi-qp: Handle platform supported formats and color depth
      drm/rockchip: dw_hdmi_qp: Switch to phy_configure()
      drm/rockchip: dw_hdmi_qp: Use bit macros for RK3576 regs
      drm/rockchip: dw_hdmi_qp: Add high color depth support

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |  11 ++-
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 113 ++++++++++++++++++-------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c   |  60 +++++++------
 include/drm/bridge/dw_hdmi_qp.h                |   4 +
 4 files changed, 130 insertions(+), 58 deletions(-)
---
base-commit: 0c5416a62c0e4df1b3f79b5c74c03cd48df51357
change-id: 20250721-rk3588-10bpc-85ff4c228e63
prerequisite-change-id: 20250703-rk3588-hdmi-cec-cea8f523df48:v3
prerequisite-patch-id: 6d0ed574c38c15e66677e704b2d0260226430d78
prerequisite-patch-id: 014adacca1c18f77c1cd80cf6877aa5d653b8f48
prerequisite-patch-id: 79fd783c35b5979cc99f3f0420309f63ac49ad01
prerequisite-patch-id: 4e7d4735f222b9fabfff3987c578c5d954579ae5
prerequisite-patch-id: 7960aba70d8916b60e81187cfa0253025b532774
prerequisite-patch-id: 2f0338d330aee42e0acc62fb815f08a3eeef58aa


