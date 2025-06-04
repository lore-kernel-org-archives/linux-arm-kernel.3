Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D80C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 03:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plSmHSndiuDXOg13P9pI15wcgr/wKduXPQw1tP6SZhk=; b=MuVEYlj7rqo4w8AgWy0MRGqi3+
	zePJfreVvl/LvXTlDN3Vk6yjYzaKUSrUdph1tvxh9VLBxG67IS3DmRaCMg6lv1vI8tEN6D08JZ0Pz
	wDNEIBZk3c1XRXD0EqAWlUJGv2FSsWYIFD+n9J/vnVi3hNTYoJ114bWkAC9rQvYw6FaEH5UiwB6fV
	vkucdAjEj7VdwkN53+y8nudZhvyvG3JeHKb1L2p6Eu1yqqMohVDAzcQ9TO/0jmDit8LelZiZavUpZ
	s6Xr7RCP6uw4JVDeoBgZkJlPhl1tVqdvAsMOMRxL9cDeZ/bUsKHDk/ks7puQvZQWA4DPWog6yS+f2
	d7kaARhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMeaY-0000000CQ93-2sM5;
	Wed, 04 Jun 2025 03:14:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcZS-0000000C8vf-2j66;
	Wed, 04 Jun 2025 01:05:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CCFD43C8F;
	Wed,  4 Jun 2025 01:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C88C4CEED;
	Wed,  4 Jun 2025 01:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999134;
	bh=sTr+czi8H5o5+cE59kBVVJbF4lBVkGlhby/Bbqi5gO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EglhJB6H9jJKtFVcN0CMwmxuJ1sDu7Hep+mXsdn6jVefTy/4xjwHWxBliW+pzRqgM
	 zlKmjSzPlGlfW5plhd19kJ9TEhEG6sf/fy+VYAJW3SPrpcqiTgZIQWSKxf5hpsGdJj
	 mpnpPyAXDdxHtlWlsqqiYmYNRIAo8R/u8DNIzX4qbAWNBmDMM1cmWEbPSSzezyC83w
	 jxlr8rzHyvimg6RiNgAgq/yuprdqxC+SZkAOJ470gDsqepDHlKWu8dlpBnpCckQ/Mj
	 X6J+megIlVp1vsXkf//m5Q53A48pnRPdmbyL7CaUh6sycISBSF5pmJH5PY+F7Dmo4u
	 otHEGBQ2A3d1A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Henk Vergonet <henk.vergonet@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	uwu@icenowy.me,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 05/33] wifi: mt76: mt76x2: Add support for LiteOn WN4516R,WN4519R
Date: Tue,  3 Jun 2025 21:04:56 -0400
Message-Id: <20250604010524.6091-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010524.6091-1-sashal@kernel.org>
References: <20250604010524.6091-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.184
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_180534_731945_C962E560 
X-CRM114-Status: GOOD (  19.35  )
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

From: Henk Vergonet <henk.vergonet@gmail.com>

[ Upstream commit 3c0e4f606d8693795a2c965d6f4987b1bfc31097 ]

Adds support for:
 - LiteOn WN4516R
 - LiteOn WN4519R
 Both use:
 - A nonstandard USB connector
 - Mediatek chipset MT7600U
 - ASIC revision: 76320044

Disabled VHT support on ASIC revision 76320044:

 This fixes the 5G connectibity issue on LiteOn WN4519R module
 see https://github.com/openwrt/mt76/issues/971

 And may also fix the 5G issues on the XBox One Wireless Adapter
 see https://github.com/openwrt/mt76/issues/200

 I have looked at the FCC info related to the MT7632U chip as mentioned in here:
 https://github.com/openwrt/mt76/issues/459
 These confirm the chipset does not support 'ac' mode and hence VHT should be turned of.

Signed-off-by: Henk Vergonet <henk.vergonet@gmail.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Link: https://patch.msgid.link/20250418143914.31384-1-henk.vergonet@gmail.com
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my detailed analysis: ## Comparison with Similar Commits This commit
closely matches **Similar Commit #1** (XBox One wifi adapter support)
which was marked as **YES** for backporting. Both commits: - Add new USB
device IDs for wireless adapters - Include hardware-specific workarounds
for device limitations - Fix connectivity issues for specific hardware
## Code Changes Analysis ### 1. USB Device ID Additions (Low Risk) ```c
{ USB_DEVICE(0x0471, 0x2126) }, /bin /bin.usr-is-merged /boot /dev /etc
/home /init /lib /lib.usr-is-merged /lib64 /lost+found /media /mnt /opt
/proc /root /run /sbin /sbin.usr-is-merged /snap /srv /sys /tmp /usr
/var LiteOn WN4516R module, nonstandard USB connector linux/ {
USB_DEVICE(0x0471, 0x7600) }, /bin /bin.usr-is-merged /boot /dev /etc
/home /init /lib /lib.usr-is-merged /lib64 /lost+found /media /mnt /opt
/proc /root /run /sbin /sbin.usr-is-merged /snap /srv /sys /tmp /usr
/var LiteOn WN4519R module, nonstandard USB connector linux/ ``` -
**Risk**: Minimal - adding device IDs is very safe - **Impact**: Enables
support for new hardware without affecting existing devices - **Scope**:
Contained to device identification ### 2. VHT Capability Fix (Critical
Bug Fix) ```c switch (dev->mt76.rev) { case 0x76320044: /bin /bin.usr-
is-merged /boot /dev /etc /home /init /lib /lib.usr-is-merged /lib64
/lost+found /media /mnt /opt /proc /root /run /sbin /sbin.usr-is-merged
/snap /srv /sys /tmp /usr /var these ASIC revisions do not support VHT
linux/ vht = false; break; default: vht = true; break; } ``` - **Fixes
critical connectivity issues**: The commit explicitly fixes 5G
connectivity problems - **Hardware-specific workaround**: Targets a
specific ASIC revision (0x76320044) - **Conservative approach**:
Disables problematic VHT only for affected hardware - **Minimal
regression risk**: Existing devices continue using VHT as before ##
Backport Suitability Criteria ✅ **Fixes user-affecting bugs**: Resolves
5G connectivity issues on LiteOn modules and potentially XBox One
adapters ✅ **Small and contained**: Changes are minimal - 2 new USB IDs
and a targeted VHT disable ✅ **No architectural changes**: Uses existing
framework, just adds device support and fixes capability detection ✅
**References external issues**: Links to GitHub issues #971 and #200,
indicating real user problems ✅ **Clear side effects documentation**:
VHT disabling is well-documented and justified with FCC information ✅
**Follows stable tree rules**: Important hardware support fix with
minimal regression risk ✅ **Confined to subsystem**: Changes limited to
mt76x2 USB driver ## Hardware Impact Assessment The commit addresses
**confirmed hardware limitations** where VHT was incorrectly enabled on
chipsets that don't support it, causing: - Connection failures in 5GHz
band - Potential instability when VHT features are attempted This
matches the pattern of **Similar Commit #1** which added support for
newer XBox One adapters and was successfully backported. The
risk/benefit ratio strongly favors backporting: minimal code changes
that fix real connectivity issues for specific hardware without
affecting other devices.

 drivers/net/wireless/mediatek/mt76/mt76x2/usb.c     |  2 ++
 .../net/wireless/mediatek/mt76/mt76x2/usb_init.c    | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
index 9369515f36a3a..4e14548d27215 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
@@ -17,6 +17,8 @@ static const struct usb_device_id mt76x2u_device_table[] = {
 	{ USB_DEVICE(0x057c, 0x8503) },	/* Avm FRITZ!WLAN AC860 */
 	{ USB_DEVICE(0x7392, 0xb711) },	/* Edimax EW 7722 UAC */
 	{ USB_DEVICE(0x0e8d, 0x7632) },	/* HC-M7662BU1 */
+	{ USB_DEVICE(0x0471, 0x2126) }, /* LiteOn WN4516R module, nonstandard USB connector */
+	{ USB_DEVICE(0x0471, 0x7600) }, /* LiteOn WN4519R module, nonstandard USB connector */
 	{ USB_DEVICE(0x2c4e, 0x0103) },	/* Mercury UD13 */
 	{ USB_DEVICE(0x0846, 0x9053) },	/* Netgear A6210 */
 	{ USB_DEVICE(0x045e, 0x02e6) },	/* XBox One Wireless Adapter */
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb_init.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb_init.c
index 85dcdc22fbebf..41b9a99665822 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb_init.c
@@ -191,6 +191,7 @@ int mt76x2u_register_device(struct mt76x02_dev *dev)
 {
 	struct ieee80211_hw *hw = mt76_hw(dev);
 	struct mt76_usb *usb = &dev->mt76.usb;
+	bool vht;
 	int err;
 
 	INIT_DELAYED_WORK(&dev->cal_work, mt76x2u_phy_calibrate);
@@ -215,7 +216,17 @@ int mt76x2u_register_device(struct mt76x02_dev *dev)
 
 	/* check hw sg support in order to enable AMSDU */
 	hw->max_tx_fragments = dev->mt76.usb.sg_en ? MT_TX_SG_MAX_SIZE : 1;
-	err = mt76_register_device(&dev->mt76, true, mt76x02_rates,
+	switch (dev->mt76.rev) {
+	case 0x76320044:
+		/* these ASIC revisions do not support VHT */
+		vht = false;
+		break;
+	default:
+		vht = true;
+		break;
+	}
+
+	err = mt76_register_device(&dev->mt76, vht, mt76x02_rates,
 				   ARRAY_SIZE(mt76x02_rates));
 	if (err)
 		goto fail;
-- 
2.39.5


