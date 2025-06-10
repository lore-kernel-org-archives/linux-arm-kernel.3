Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4A9C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1YKCRYyKegQz5Ls9DCaJZH0Xv1muG7P3W2k0Dksducw=; b=qZlcSGeKEGZs7K
	GlGG0DUfmAcn1cwkOg4diyK9sL8ilBWkoj4IviTikjOjQ2qVUuzDwPpGdnx4pyrHe5/1dkVJ8mOyj
	ZhIOKhif2sUfI6JrEvTZbpCSmqo/FeqOnVa/S+uBjUvV9UHtN70vqffBwxL08muMN0QrbMVKw+2Fe
	FdsXUd0Hoe7nHuWvruX4fL9N65tRJ3zr6BrKPTy97+9+gCmGor+QR0d4DGgjb3d+eInU/+c+LAQOT
	5+PWN/rfdxWAxnHi7AqqYR7RXqsa87FwnaQ/6be2NoWoX6RioqgUJHHul4PHYN/4LhGKaUShK2K97
	JwMIbLRGsc7wcNtL2v1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2Vo-00000007aLi-43aJ;
	Tue, 10 Jun 2025 17:11:48 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzdn-000000075ME-26XI;
	Tue, 10 Jun 2025 14:07:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749564457; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jq1vCW75V2QNYvEvbkvO0N7oZ0gErIh8CfcIufwxUBZMKne8HUrcTdpYbZB8Xl+NttwgT1mESz68if7LQDVtTu2B20uynNW3CV0v9Iy5CFFIR1uoEds38LAcQiIliKoFYkeUoNf7sptLTyXlFiS/Ukvxjpxk3tz1lPp+at3xjoQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749564457; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1YKCRYyKegQz5Ls9DCaJZH0Xv1muG7P3W2k0Dksducw=; 
	b=CWRWGRCsTcn6Sd95prXW7NvFLnh3hFQUqGVBksJqyDcINR72DjJXfc4zm3nSoSn3APhTl82+jqVOX7nNO93+Dmz7CZI29gD537DgHRtSGiiMTHPCCdVugfzJwxo/dcnhn0YBk5JkBCEbDbIEiGHlItI5C5jUbxswMacyvptcCL8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749564456;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=1YKCRYyKegQz5Ls9DCaJZH0Xv1muG7P3W2k0Dksducw=;
	b=e7ujAxH+/PfqfxOtoy5JOjsLoXQ/Lu0lgkquImmdVOvpdrHz95gH8j/pTAZuFOBx
	c5qP03cstE431oYo1FawqGaFx0nwy7BwKx1Dxvi2Qls5NdqQYbCWdSSmGqbr4Sbb73w
	O5+rR9vtC+h6Dy16MtfnqOOKdqSOO4Eognl/EIZQ=
Received: by mx.zohomail.com with SMTPS id 1749564453383526.4021268269228;
	Tue, 10 Jun 2025 07:07:33 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v4 0/4] RK3576 USB Enablement
Date: Tue, 10 Jun 2025 16:07:08 +0200
Message-Id: <20250610-rk3576-sige5-usb-v4-0-7e7f779619c1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAw8SGgC/23Oz24CIRAG8FfZcHYMfxZ29dT3aDwMOCipSgsrs
 TH77kU82MQNp4/M/Oa7s0wpUGbb7s4SlZBDvNTQrzrmjng5EIR9zUxyqbmSI6QvpQcDORxIwzV
 bkIoLLpEIHbK69p3Ih1sjP3fPnOjnWuXp+cksZgIXz+cwbbti1sJAcoI9ho8hTzH9tjpFtOl2u
 efD++UigIMZiJwwxo/Sf7h4OqGNCdeVb2CRL6S+BURWZK8t9oprrywtIeo/stREVWTcWK/RiN6
 5tybzPP8BojEL3GsBAAA=
X-Change-ID: 20250328-rk3576-sige5-usb-230102aeeaca
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_070751_572532_3F993EC6 
X-CRM114-Status: GOOD (  17.89  )
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

This series is the result of what I thought would be a quick 10 minute
job, but turned out to be more like 3 days of pain, suffering, and
confusion. This should be expected with USB Type C though.

The first patch in the series extends the inno usb2 PHY driver to fiddle
with some GRF flags in that driver when the PHY is connected to a USB
Type C port. Without this change, devices on USB-C simply don't
enumerate at all, as the state machine gets stuck waiting for vbus to go
low or something along those lines.

An alternate way to implement this would've been a vendor property in
the PHY binding which is then checked for in the driver and needs to be
present in all rockchip inno u2phy instances that happen to be connected
to a USB Type C connector. This is what downstream does, for example.

Patch 2 and 3 allow Super Speed in reverse orientation on USB Type-C
connectors to work, but I am not entirely confident in the solution I
arrived at.

Patch 4 adds the USB related nodes, including associated regulators and
Type C controllers, to the Sige5 tree.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Changes in v4:
- Rebase onto v6.16-rc1, no other changes
- Link to v3: https://lore.kernel.org/r/20250507-rk3576-sige5-usb-v3-0-89bf5a614ccf@collabora.com

Changes in v3:
- Drop the utmi clock patch. This was always a speculative fix for a
  problem I could no longer reproduce, and it doesn't conform to the
  binding, as Robo-rob correctly caught.
- Link to v2: https://lore.kernel.org/r/20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com

Changes in v2:
- Rebased onto next-20250505
- Drop the u2susphy quirk, as I can no longer reproduce the original
  problem with various amounts of ripping up the DT and changing the
  config. Yeah I'm not super hyped about this now being a heisenbug
  either.
- Drop the bindings patch, as Rob showed me there's a way to do this
  without extending the bindings
- Rewrite the usb 2 phy driver patch to no longer walk an OF graph from
  PHY to connector, but instead first find the USB controller that uses
  this PHY, and then use the USB controller's existing graph connection
  to the usb connector.
- Adjust the Sige5 DTS patch to now have two port connections from the
  USB connector to the drd0 USB controller, one for high-speed aka
  USB2, one for super-speed aka USB3, ordered as per its binding.
- Add a patch for rk3576.dtsi to reference u2phy1 as a clock in the drd1
  controller.
- Add two patches to fix USB Type-C super speed in reverse orientation.
- Link to v1: https://lore.kernel.org/r/20250407-rk3576-sige5-usb-v1-0-67eec166f82f@collabora.com

---
Nicolas Frattaroli (4):
      phy: rockchip: inno-usb2: add soft vbusvalid control
      phy: rockchip: usbdp: move orientation handling further down
      phy: rockchip: usbdp: reset USB3 and reinit on orientation switch
      arm64: dts: rockchip: enable USB on Sige5

 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 160 +++++++++++++++++++++
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      | 113 ++++++++++++++-
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 154 +++++++++++++-------
 3 files changed, 373 insertions(+), 54 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250328-rk3576-sige5-usb-230102aeeaca

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


