Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F4BCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZGL6vN01C4fpVYtMS2FjDXAheoK7OIOq3/QZwzVz6I0=; b=WQrA6HSCXzxFfQ
	nOxE31GjQOHu1m1n50faX+YVzMMUGkHKjdX5heDyoEJi+ZJkbBykg5JzPJWQUmOOsljWzWO2LsPUg
	2ArHesbi2gLHtAxCLmWnw5EoJ4dsi6sIaY5ysqLgiu0lAfyG6Q0RJENWs+p3zq/zvBtIjmGOp6auM
	kWxt5Be8qgcvYBqZfmLCtt8nI0M333o3WDBiKikcYJtWqEAw6OBvtzHsiDk/xuCNEpKdpe1tSoBR5
	0HfWU+d8ZUciKNY8dPbo3saRyvI61Y70UMfxy+qvkEiGIl3/GKgdcYLjQnB7jubLg19ZOi86e1z8w
	UFl2PoWQhhhiXVD0Kgmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI8rn-00000004BBE-0Kj3;
	Sun, 09 Nov 2025 17:06:15 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI8rg-00000004B91-2oMr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:06:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1762707963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZGL6vN01C4fpVYtMS2FjDXAheoK7OIOq3/QZwzVz6I0=;
	b=PO3jGN4Ozros9j3l2U07INj40Af2D4ml7LcHGzWPa7uIZ8xTXXkGjohxb2akm+VFyvrJKV
	T9FM5+PSPHXFV2snPZ8DPCTCxbpj55UVzS2v90khbSFokWOK4+ObTg7FeKrcGQeFYmby3p
	aVxoCpzYuQAZjF0wJZVsvbVlx75VKbbB7ulLGPJZNFuxcWcAJlZ7YDbs2hcmRkoac4nZEC
	LWLIDcz6YaoPzzWqmjIN2JYid3HIvORz9/GrZmJT7W02h0BCL3QLHLF/PdqR7PO9I3v8G3
	NvKb6mON2bwIVt/gwqYsERVbsNhLVnbcxB1O7AgglQC/tuv4Vg74yhHOVmXe7A==
From: Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 0/2] Fixes for PineNote DT validation issues
Date: Sun, 09 Nov 2025 18:05:25 +0100
Message-Id: <20251109-rk3566-pinenote-dt-fixes-upstream-v1-0-ed38d200cc04@cknow-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANXJEGkC/x3MQQrCMBBG4auUWTvQJG1BryIuov2jg5iGmVSE0
 rs3uPzg8TYyqMDo0m2k+IrJkhvcqaPHK+YnWOZm8r0fnevPrO8wThMXychLBc+Vk/xgvBarivh
 hl+7BI6UhIFL7FMW/aJvrbd8PUHkyX3MAAAA=
X-Change-ID: 20251109-rk3566-pinenote-dt-fixes-upstream-1fb32eff43ea
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Samuel Holland <samuel@sholland.org>
Cc: hrdl <git@hrdl.eu>, phantomas <phantomas@phantomas.xyz>, 
 Dragan Simic <dsimic@manjaro.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>, 
 stable@vger.kernel.org
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_090609_291786_99C6E313 
X-CRM114-Status: UNSURE (   6.40  )
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

These patches fix the following DeviceTree validation issues on the
PineNote dtb files:

    Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports:
      graph node has single child node 'port@0', #address-cells/#size-cells
      are not necessary

    usb2phy@fe8a0000 (rockchip,rk3568-usb2phy): otg-port: 'port' does not
      match any of the regexes: '^pinctrl-[0-9]+$'

And with these 2 fixes, there are no more DT validation issues :-)

The fix for the 2nd issue also fix these kernel errors:

  rockchip-usb2phy fe8a0000.usb2phy: Failed to create device link (0x180) with supplier port0 for /usb2phy@fe8a0000/otg-port
  rockchip-usb2phy fe8a0000.usb2phy: Failed to create device link (0x180) with supplier 3-0060 for /usb2phy@fe8a0000/otg-port

Cheers,
  Diederik

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
Diederik de Haas (2):
      arm64: dts: rockchip: Simplify usb-c-connector port on rk3566-pinenote
      arm64: dts: rockchip: Move otg-port to controller on rk3566-pinenote

 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi | 27 +++++++++--------------
 1 file changed, 10 insertions(+), 17 deletions(-)
---
base-commit: 6146a0f1dfae5d37442a9ddcba012add260bceb0
change-id: 20251109-rk3566-pinenote-dt-fixes-upstream-1fb32eff43ea

Best regards,
-- 
Diederik de Haas <diederik@cknow-tech.com>


