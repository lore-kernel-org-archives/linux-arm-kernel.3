Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F99C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 03:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMdUXEYopcfLSt7uB1VuVeSShg/1Lrd8ekJqi0vTcmc=; b=UCXA8YQa9Grku5sGPK8Jx1Vd4I
	gLb9C9Nk1mB0ij8+MRilpOtBoox0fYUqlP8wp2pDZyoTEzIUapfPnB/N1SWT4gbRqM62VxA7qEd5E
	FCmyJsSre02CYt6DogMalJGEIuzY5cUhq8edcMcmQ/LZ7Y6bPhSdynokNTS4GL9rI68SRVWFEyrBN
	3YvfX2peG301ExQxrar7vY9gdJDgEtFMlnykh5dHT5oGp1xrAHHcNn7w6uF43ihE58YpIxpKgPbXf
	g3qU+zz5NX7P69oN3iFAyspr94deDsEv2SXXRf4S7Egzbri+FkCeLhZ7rTRxhZa+gtl3LIiXhGS0Q
	wPfREM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMenc-0000000CRkL-3SeX;
	Wed, 04 Jun 2025 03:28:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcaM-0000000C92S-2RSZ;
	Wed, 04 Jun 2025 01:06:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49C7B49C22;
	Wed,  4 Jun 2025 01:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6662C4CEEF;
	Wed,  4 Jun 2025 01:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999190;
	bh=q7JYVPVG2dRLlDqWkJSfnGRBlhdWxwq+TInUPdY3o64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GMhwNPq3YNTYhv8Edqq4LTeDb5E92FsdNtPzGxUO+/DpiROetHGS1FIBfB+Z8Ptum
	 +/+pKCgxQ36t04fYQdCxA3ANLFO/gv5E63Nk78mwRyYVp21lCvbin1IlaQ4jD7709q
	 +Om8Itk2jsTobJOHme2LUUujE0647HmtXLQ4u8uFMT7aH5o/RTU69+CcUJ1cbsJUZ5
	 /O0C1VwfF6zzUSmztrDfa1LHVib+la3ckx/UhP7/TsiJfeRdXuOyyeFxWXKhljxnOh
	 Fx9WphGcxFx1LCJomQ40KsZlEZo6g0u/NaTW6EOtf+FQMSVXTviCcgwlviIDs2lmRB
	 gx5tSML0hQPMw==
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
Subject: [PATCH AUTOSEL 5.10 05/27] wifi: mt76: mt76x2: Add support for LiteOn WN4516R,WN4519R
Date: Tue,  3 Jun 2025 21:05:58 -0400
Message-Id: <20250604010620.6819-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010620.6819-1-sashal@kernel.org>
References: <20250604010620.6819-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_180630_668166_57707780 
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
index 82a193aac09d7..95c548f45bdf8 100644
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
index ffc2deba29ac6..c845e83897659 100644
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


