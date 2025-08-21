Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FA6CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yphWYoaHS5nu9ifCQj7+T3VqMef4QLjCMlse/aTxvYM=; b=X4qMQHR1Mi8ovHG6R885agaplF
	S54zOXVozCRClWN8PLgU//YfiISlmo8bw0z6Gj2dg82VuM/Gu+DMM1UWUvxkroDDxu5wMEaDC7yF0
	NzvVy3R4I0+Z5JuhyZDCjRayC4p4enheQ+r25yUcHShyfqsEtOiwPIdg8MjERky7xTE7Svtapkyqi
	CMoL3xwOfD/BjLA0lOloR02WynFlpg5RV7SDDO4wnGsXMzYY9UGPkUlnR1kr57YcujCTz2mXLaSf0
	diLHvQ6HQM5SyqFIcC9bjnsn5m5BbD/LaAEyMzNH48tP2N55bAWsMXVD9OAIoAufB9L9ExG3OgOcL
	vrXFyi3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDt8-00000000l22-1jmh;
	Thu, 21 Aug 2025 22:36:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7OW-0000000HQWg-345V;
	Thu, 21 Aug 2025 15:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AA545C6103;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40F8BC2BC87;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790803;
	bh=ezlFWvM1nBUdjZySW2SLHcZqvdOTrYO8BvJNCg37DNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rwKBmyNmPYHzHiw1yjRL/lEKSSs9N32vOnYxgaqrI6MbIHQ0tgc1vydZWAEGEahwJ
	 o73QCX43BIztfBDptpHRc+Fn9hwDMYgcd1y+VWAovuU2DECP/nTkaVngaQYmJzl/Rj
	 6LvgYP4NFi/3m4G9Cndq2mV42fp1qg333HJZeRsz0+igU8Wz8dTqaWTPLDVI1FgdwE
	 UK7SzNByPmodTncOZs5BANE77UXwAsyXf0j5zfWAW6ddQAxYQDNarTH1T/omgRmeZy
	 gtPgNIRhtErXu4jxhfwckEdLi6EOjP9eXYlNxXR+XtC5PUVTvlvWdUBnbMMtHWEXpf
	 IBSct6hGqgwqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D94CA0EFC;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:38:57 +0000
Subject: [PATCH RFC 05/22] usb: dwc3: apple: Do not use host-vbus-glitches
 workaround
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-5-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=K4xGHgVuy+gCBsZ5+L/7Ixe1BRKZmb/9H0zcphQVQWY=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy26XL+h6aXW/svSIoXp77ec99t4L5FxRE9iT+zz8Sv
 zhiwRuPjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEtgkwMvwx/5Zrkv990taN
 vudNDv9UPxd3rKY64paVQMfvQ4/PLU1l+Gd1L/hZwftLj6zC8xxPRr+ZtPYtr82Ze3sXXmI6wiC
 9XIkHAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084004_899668_D9B39714 
X-CRM114-Status: GOOD (  12.59  )
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

From: Janne Grunau <j@jannau.net>

It results in SErrors during init presumedly because MMIO accesses fail
while certain parts are shutdown.

Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/dwc3/core.c | 1 +
 drivers/usb/dwc3/core.h | 2 ++
 drivers/usb/dwc3/host.c | 5 ++++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 26aa507a738f001409a97ef563c6561433a1cac5..8d2dc7fa18114102cc8893c4ca0e745e16f30754 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -2273,6 +2273,7 @@ int dwc3_core_probe(const struct dwc3_probe_data *data)
 
 			dwc->dr_mode = USB_DR_MODE_OTG;
 			dwc->role_switch_reset_quirk = true;
+			dwc->no_early_roothub_poweroff = true;
 		}
 	}
 
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 38f32f2a6193c1b2662ab4f38f4d20cf4b0e198d..3c3a36ec37345b2f9e71444ba3b90b52dbd24443 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1155,6 +1155,7 @@ struct dwc3_scratchpad_array {
  * @susphy_state: state of DWC3_GUSB2PHYCFG_SUSPHY + DWC3_GUSB3PIPECTL_SUSPHY
  *		  before PM suspend.
  * @role_switch_reset_quirk: set to force reinitialization after any role switch
+ * @no_early_roothub_poweroff: set to skip early root hub port power off
  * @imod_interval: set the interrupt moderation interval in 250ns
  *			increments or 0 to disable.
  * @max_cfg_eps: current max number of IN eps used across all USB configs.
@@ -1394,6 +1395,7 @@ struct dwc3 {
 	unsigned		susphy_state:1;
 
 	unsigned		role_switch_reset_quirk:1;
+	unsigned		no_early_roothub_poweroff:1;
 
 	u16			imod_interval;
 
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index f7a71e6f9d80aca632f1f970d900a3de8a76f0a7..f7c3a0fc5fe258705311f89c1ba11ff599c01afe 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -134,8 +134,11 @@ int dwc3_host_init(struct dwc3 *dwc)
 	/*
 	 * Some platforms need to power off all Root hub ports immediately after DWC3 set to host
 	 * mode to avoid VBUS glitch happen when xhci get reset later.
+	 * On Apple platforms we must not touch any MMIO yet because dwc3
+	 * will not work correctly before its PHY has been initialized.
 	 */
-	dwc3_power_off_all_roothub_ports(dwc);
+	if (!dwc->no_early_roothub_poweroff)
+		dwc3_power_off_all_roothub_ports(dwc);
 
 	irq = dwc3_host_get_irq(dwc);
 	if (irq < 0)

-- 
2.34.1



