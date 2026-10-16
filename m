Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2174CCF2CA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cvy+391oTanxGqmzW00Z6jrTSaC5oITVoE8vhgQJnRc=; b=vd8aPu7lEwAOlW
	dJSGaI+QiDXVlA1KDKz/yhen1yiDSCQ7Z9GQEeAlXZWHtxQpmYqKVJNMXWOYbMTDA9/QkUp4wOrMd
	fcUQyrQhKOCmhH5QmBsBjqYcOcyEywGtqRuFYP775Y3mzfG9IWnXVIyzLQaZjjHHENRcc+KVOFjog
	H9ljAEgQ9kX9h5FLO2DAYZfQJkCqILPyzrt6MVQsGhdyP/DWmfmAhYWAnGV/+Z8fxdNkwh73DR5NT
	Lw5R0vNrVBTc17D1jdmaYPdJvpvqdWfD4nuOHAiYQxwxXIA026K3DdDCZTYemOL6DBsgc3v5UbMUf
	9AOnq5Q0FqkpolbGKoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmuD-00000003i3b-13NT;
	Fri, 16 Oct 2026 18:43:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmu1-00000003hsF-3NyI;
	Fri, 16 Oct 2026 18:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792176214;
	bh=lafkWZYBNHhbOVRV1jA3lGSBxHse1lNgAtW7kEH9UHI=;
	h=From:Subject:Date:To:Cc:From;
	b=EutdyW9kgMwF0BqrlN+klPuiSYAXEC6iWuGC18N3fr0VAcpDxBX0ZAzCZw/kENNXK
	 /6DO5QoySURXCJU7u8s03pza9Y9xoTVklj/pNfx8Ug7d9Hs2l/HzxLceZJKL6puUYI
	 bfs9NuH/BDponxhNy5+hMWFS+vbH089Xwq5EjnqxkCWE1lcoKEYU6SRCISwMSY/2iX
	 3YeaxdleOxsYkh7jbxm0yD/3sR/XKMAvOmLOZRlCXLnPfdU0M/BU4B68AIQJ3DMQKS
	 w7wLnCpa+jDLuikzce1EkEsh6PwNjtHBPWdM7XM4dTVC6a6ea0NHZGKfI+64j4jT67
	 vPlo2CcoOeOxw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AAC3E17E05D6;
	Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 5F90448002B; Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v17 0/7] usb: dwc3: introduce Rockchip glue driver
Date: Fri, 16 Oct 2026 20:43:16 +0200
Message-Id: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XOQW7DIBAF0KtYrENkGIztrHKPqgsYxjGNE1Kw3
 VaR7x7iRGrVTZYfDe//K0sUPSW2K64s0uyTD+ccRL0pGPbmfCDuXX5gspS6bIXiVvEY8Ii9v3D
 3hfCbDsNEvK1bMlBD5RSwjFwidf57bXh7f+Q02Q/C8a4+LyJ9Trl6fJwxaxJxDKeTH3dF01W6c
 x24Bi27C71PY4g/6+RZrB+e46pX42bBS15rsLZSupGK9hiGwdgQzTb3rfws9B9TqtemzqiQ2kh
 qBQDCf3RZlhv1gGTpaAEAAA==
X-Change-ID: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4111;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=lafkWZYBNHhbOVRV1jA3lGSBxHse1lNgAtW7kEH9UHI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrScFbvyrLI4Tnw5Z5FqOsSdZoHWkwWWqMG1
 Qy5IlNHcMBRD4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq0nBWAAoJENju1/PI
 O/qaK2UP/1Qr3xb+XHDLi2unF7rmyLCNVFrVrr4AQYPBSwMXqbcj96g6hCTHoHt9rD3joQGx1fV
 CQwN/36tMtVKZf5jMh5ceGPDa3MEX1GwvT6affDa7ogmwGnV82IhYOLCVignt14YDqulj5RGsbh
 8D/JrID84WFJTVPBTSV+3mG44wNTrsK59AWWoQshL1Q90yNdWwVLN9uqj9631uZlA/O1dh483zl
 SiczT7Q74DXQuEGWAWY8nvLp+I84DncJ8ORlWi3S7Nw+OVog05QSIrZtBproVs87ECMZ7teHptT
 jtYHiReuBxLZjvjFUfhKkIc/X+Y8A2JqSOhmk1AApY2tz29VBgzhSgrS5mu4ZgSer9z0fKxnJml
 zH1qjLPHkoH2ZuYH+fLM6RwOAsynp9q22IsvlvacrxF2iZehkZ1AcU6Zd2sW5azjWAYCEGIq5RW
 wrYGE8/zgahjmlP6syhe5KBUqqg822QJyuPAH0/fqFJdUFH2Rs4J70p+ZQTiWuqLsrLHaYUznO5
 GxMRo6Do7+m2q9Vbzl+GPTW9nPyqjy+ZPh+8DWz903We+UWmw6oXwSedsSvY/EAbfdkhB5jDzgj
 uXH5Cklh6uUfQ2OGhfLqNBNFUOpZZtyasB4wQEcTVbSaWvuWcpHDks7k8QlmwZHjGleaCrYqblU
 SKrbVVpB/GfH1BnGgbdQw7A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_114338_001724_6F232C3B 
X-CRM114-Status: GOOD (  21.96  )
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

The recent Rockchip platform have a combined PHY, which does USB3 and
DisplayPort as well as muxing the lines in arbitrary order. Changing its
enabled functionality requires a PHY reset and as the PHY provides a
clock to the DWC3 controller, this can result in an SError. Apart from
that the PHY might not start up correctly when the DWC3 PIPE interface
is running. This series prepares a Rockchip specific DWC3 glue driver to
help out with these problems. To become useful more patches are needed
on the Rockchip USBDP PHY side, which are send separately.

This was split from the USBDP cleanup series. v17 has a dependency on
the patches that have been merged to phy's for-next branch. There are
some additional Rockchip USBDP phy fixes, which depend on this series
(which is effectively also a fix).

Changes in v17:
- Link to v16: https://patch.msgid.link/20260924-b4-rockchip-dwc3-rockchip-glue-v16-0-126a2e9133c3@collabora.com
- Add new patch adding just sw_mode, which was part of the "phy:
  rockchip: usbdp: Fix power state handling" patch in USBDP cleanup
  part 3 series; sw_mode will be used by the dwc3/usbdp reset quirk now
- drop generic PHY reset notifier API; I discussed this series at Linux
  Plumbers Conference with Vinod Koul and he prefers a local driver
  hack/quirk instead
- rework USBDP and DWC3 rockchip glue for the local driver quirk
  using direct function calls
- Ensure that the reset handler in DWC3 is only called when the PHY is
  initialized (and thus DWC3 is running)
- Also set vbus in the last patch when dwc3 is configured to device only
  mode (in contrast to dual-role mode being in device mode).

Changes in v16:
- Link to v15 (sorry, I missed force setting the revision for this
  part in the series split, so the series says v1 in the patch subject):
  https://patch.msgid.link/20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com
- Update first patch to also build the PM functions even when
  PM is disabled
- Add new patch for defining an empty usb_udc_vbus_handler stub
  when USB_GADGET is disabled
- Add dependency to Rockchip DWC3 glue, which disallows the
  configuration with USB_DWC3_ROCKCHIP=y and USB_GADGET=m
- Collect tags

Changes in v15:
 - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
 - Avoid #ifdef for CONFIG_PM in the new glue driver (Thinh Nguyen)
 - Do not add #if IS_ENABLED around the DT compatible blacklist in the
   generic driver, using the glue driver should be mandatory as the
   generic driver results in arbitrary system hangs. Thinh Nguyen suggested
   updating Kconfig for this, but did not clarify what that means.
   Current Kconfig works the same way as the other mandatory glue
   drivers.
 - Split series to simplify review

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (7):
      phy: rockchip: usbdp: Track PHY power state
      phy: rockchip: usbdp: Add reset hook support for dwc3
      usb: dwc3: rockchip: introduce glue driver
      usb: dwc3: core: add post PHY registration hook for platform glue
      usb: dwc3: rockchip: add USBDP PHY reset quirk
      usb: gadget: define stub for usb_udc_vbus_handler
      usb: dwc3: rockchip: fix USB-C reconnect in gadget mode

 drivers/phy/rockchip/phy-rockchip-usbdp.c |  79 ++++++++-
 drivers/usb/dwc3/Kconfig                  |  13 ++
 drivers/usb/dwc3/Makefile                 |   1 +
 drivers/usb/dwc3/core.c                   |  17 +-
 drivers/usb/dwc3/core.h                   |   9 +
 drivers/usb/dwc3/dwc3-rockchip.c          | 263 ++++++++++++++++++++++++++++++
 drivers/usb/dwc3/trace.c                  |   3 +
 include/linux/phy/rockchip-usbdp.h        |  16 ++
 include/linux/usb/gadget.h                |   5 +
 9 files changed, 401 insertions(+), 5 deletions(-)
---
base-commit: 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
change-id: 20260914-b4-rockchip-dwc3-rockchip-glue-979ea3735d43

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


