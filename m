Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBB7C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vQz0h8Cg0H00hKBW/D9u6XEnTUbBcY/hnTwQjAPVemg=; b=aYVv268RCczO3D
	+3eaXpHX+rBaFY3bS/coVianpIMeF/08XODBbZRbdVFp4r1f22H2whp+4T+sJBQ6n7SryJNEIVo4f
	0GChPKuXPSTCSaGz0D/fOknkL4nDFUZSJg3JVEwdaKd6Kxz9VPJn7uwgmkhmC8Tfpi+CF7iz7h7uX
	o0ct8EsGm7757rkxs6uTe/h0ELOKtD8TvwqlKemxzEjHTkHvjFz6yrEPJ/lHbhrHvZd/PPYx7duBh
	HQ+Ia7D59ikt0VwxJvbJ2nJGINby2RoGiaY7q/eNC9Tna4LubRBPPLPS4fKzvuve5msfPY6SwiLpu
	UqVRRjbL4y3CHw+ZN92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzl0-00000008BXB-3gDb;
	Mon, 05 May 2025 17:37:34 +0000
Received: from sender3-pp-f112.zoho.com ([136.143.184.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzb1-000000088u0-3ogw;
	Mon, 05 May 2025 17:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746466016; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eYJLW9VKE8LhtiM5lq1YZimviiv1G7ucXcu2rts14+KpCXlIAulWWuUGPiAyyQvCLCchqlgyptNOAbHFGuogMuuzp4SGPNIvhCSkwE3UK6iWlmDNaifpix2DBSh6SOkYasHv9ZNLJu3koUttaJ3VEXUHfgAdwz94IivBMM1owwM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746466016; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vQz0h8Cg0H00hKBW/D9u6XEnTUbBcY/hnTwQjAPVemg=; 
	b=dkQ3WSUAJ4e6mKzZUtcZl87lmeu8Y3k9XQqwbyEay7CRlvXc7EbGDTxkOLXInM+Y2Cs4DHZvAfqd8aUfmQ2T4oWT9Ofem9Fe2ic4Wg2FGFUPWx7jSX3AnzEQYqAWI6Hdvn5uvGS2ZYGWIE40csMUOgKtR4jjdGsheeaNQqokJrY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746466016;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=vQz0h8Cg0H00hKBW/D9u6XEnTUbBcY/hnTwQjAPVemg=;
	b=IE3iWLrihEHOABe6/b8r/JpoAQ5kRnNZQ2BmDBRi2oB4EFjHtVpGCcWGRkylVh42
	tWghVJndZw0DKwh83wTjvaUj4sLxxYrcH9NoKI5TcmionZFKkSPRM5VEjnD5zyObvWS
	sFA4oFHf9yrqTs83+zF4u6tq8FwncLIzlXI9HsZs=
Received: by mx.zohomail.com with SMTPS id 1746466015237302.45549093734485;
	Mon, 5 May 2025 10:26:55 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v2 0/5] RK3576 USB Enablement
Date: Mon, 05 May 2025 19:26:35 +0200
Message-Id: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMv0GGgC/2WOQQ6CMBBFr0Jm7Zi2SCGuvIdhUeoAjUC1LQRDu
 Lu1LM2s3kze/7OBJ2fIwzXbwNFivLFTBHHKQPdq6gjNIzIIJgqWiwrdMy9Kid50VODsGxQ540w
 oIqUVRO3lqDVrirzXBzt6zzE5HEtolCfUdhxNuGYTrQFTehz4Cb3xwbpPemnhyUj3Cyv/2xeOD
 GVJpLmUbSXam7bDoBrr1DlWQL3v+xcS9V7A5QAAAA==
X-Change-ID: 20250328-rk3576-sige5-usb-230102aeeaca
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_102716_005664_70D95216 
X-CRM114-Status: GOOD (  17.37  )
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

Patch 4 is what I think may have been the culprit of what originally
made me add the USB2 PHY suspension quirk, but I'm somehow unable to
reproduce that particular SError fest anymore.

Patch 5 adds the USB related nodes, including associated regulators and
Type C controllers, to the Sige5 tree.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
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
Nicolas Frattaroli (5):
      phy: rockchip: inno-usb2: add soft vbusvalid control
      phy: rockchip: usbdp: move orientation handling further down
      phy: rockchip: usbdp: reset USB3 and reinit on orientation switch
      arm64: dts: rockchip: reference u2phy1 as clock on RK3576
      arm64: dts: rockchip: enable USB on Sige5

 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 160 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   5 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c      | 113 ++++++++++++++-
 drivers/phy/rockchip/phy-rockchip-usbdp.c          | 154 +++++++++++++-------
 4 files changed, 376 insertions(+), 56 deletions(-)
---
base-commit: 214464d4c3491d4eb2c0e9d1310d7f60c408b94b
change-id: 20250328-rk3576-sige5-usb-230102aeeaca

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>


