Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB94109E52F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 23:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha/5sfOMsSyvOXEiIdNwWWMAa5E2iOsts4es0l9yhz8=; b=0LB0YIzSzkcGNGadmZUG4fRh65
	3DF6m5yRKyze2FwdvQhegACwh9p4K5qR4lC4kVdpxGMJwOzUs9eKvKGacg15gDKdys+l8LdzomDFP
	QawrBrK7wDKtIZucmP75Yq0fSA+bZXVKGE/TnSf0ms1ojGTCX/RHWxeP3KCFnmR70KOCBshVnDLYa
	20btrBaY1n1HqVP2xS9KFEqrLBpCu7jggl4tZLdN6Ija1im8kjnp0ap8kjHjQdv39ByDr0v1h5/wd
	nBarxurQVufp10Um2vExCzqKicl0LdPZhg2VZg8xv3Fq06G/z1+dv1aB3n95p8FPy1Rvv55qlQhJw
	6XoDY9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5XgB-00000004QOi-0FNz;
	Wed, 25 Mar 2026 23:30:27 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Xg7-00000004QMj-2x2V;
	Wed, 25 Mar 2026 23:30:25 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 050D57A01A3;
	Wed, 25 Mar 2026 19:30:21 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Wed, 25 Mar 2026 19:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774481421;
	 x=1774567821; bh=Ha/5sfOMsSyvOXEiIdNwWWMAa5E2iOsts4es0l9yhz8=; b=
	XeulIDjODnhXGxbMiFN6D3NlUFGAlu0kvHyqESMO61eIzkek4y3Aj6f/nrFh2G83
	efZvcqHXAXiOvVZreMAHl6r43PV7EfYmX63ptzA7R8wVEek/HyNmW+IZGChWgeWW
	G10mpIilSz0mNIYctGjdWl7CQXQTAPwtMGJ4WYfDt1TXzDfG6HqdO7hQRFLW4reE
	ryFqSU5TNr2dmidI3dxOO7XCshieLHXZYn7JUvxtP8Yyh9Q6bPVswpSI4wLALkKq
	akpcmQcPslTJ7Qcf1Xp4NPCRYO7nPzX/U+XIc0v9MtEKgmjMK5XA7K3XFT59bUGT
	h9u5Q0DO787tFzTM4hNiOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774481421; x=
	1774567821; bh=Ha/5sfOMsSyvOXEiIdNwWWMAa5E2iOsts4es0l9yhz8=; b=W
	Hhzq8ToknmfBshEwDryEqY9GebpkqeLQN8fFoAYKyJNNbPrH3JLA+bn+dsl5Ur2L
	smaB2JCkvpSX8p6nb+DupSsvoBqqXeVsNInnB1jgx8Q18Q6ywSsGcf1TmD9pgErs
	TV5mZJ+fW68MXt6GrCuQ+KMznTOedoCDU5AyWyw4Pn8aEC9CQB2yjzlqjLmIQ43t
	PHCHkGiskQpllSQkTWd9N/NfHVhmQH03K/DYvpe+SyxxtBUUrrDau7dfvtn7ExJt
	v/kl9JOGar3eAcfi/I1Z0w6qbAFuh5FToaxd4k8RA3UGpZUjXJQopqFX8FxqSb+O
	FUx1IlhcOYH0+a/gyrVXA==
X-ME-Sender: <xms:DXDEabTqnhD1yD6UPgDJ887kMv2hgnK8RR1zTe4XFWqYFrYqFYvy2w>
    <xme:DXDEaXl6BizYPwgiykGmkpZX66_9xphrVKkgKnrBwKkvM5JLHvztXEV-r4gbNzHoD
    _B7heXXTF0Kq-WBzXyWVRJyzlOUcPfr_7idkiM51tvIY-Yj4cRd2w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdehjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepoffhfffugggtgffkvfevofgjfhesthejredtredtjeenucfhrhhomheplfgrvhhi
    vghrucfvihgruceofhhlohhsshesjhgvthhmrdhmvgeqnecuggftrfgrthhtvghrnheptd
    efvdefkedutdejfffhheehfffgfedthfeuieeiteetgedttdfhveefledvkeejnecuffho
    mhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhlohhsshesjhgvthhmrdhm
    vgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprg
    hnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhnohestgholhhlrggsohhrrgdr
    tghomhdprhgtphhtthhopehluhhiiidruggvnhhtiiesghhmrghilhdrtghomhdprhgtph
    htthhopehmrghtthhhihgrshdrsghgghesghhmrghilhdrtghomhdprhgtphhtthhopeig
    vghlnhgrghgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrhgtvghlsehhohhlth
    hmrghnnhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhi
    shhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguih
    grthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhn
    uhigqdgslhhuvghtohhothhhsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:DXDEaWzi4FjqOxaz3AspgK4wI0Tv3XATq362Asedh2GTlQaIEOAAqg>
    <xmx:DXDEaVVxMnfcJxmHfhWygL_QcN2XTmlhNfWzulLBrPgcqi7zGrqbLQ>
    <xmx:DXDEaS93xp5_s1IM6nCvb5rx-Y-t6p6wWJ8ZZ_g3BE2zQahf7dpqRg>
    <xmx:DXDEaYtw62MrsY-uM1yk-9J8Ppl4KvQk22jjIyagBUbaHP20xI8sKA>
    <xmx:DXDEabvkovO72iR2V8OAEEG0Ni5Pdi4Oo2SQWzE_405jpz471sWXxNr9>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B1ACD1EA006C; Wed, 25 Mar 2026 19:30:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Wed, 25 Mar 2026 17:30:18 -0600
Subject: [PATCH v2 1/8] Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-mt7927-bt-support-v2-1-b892a3252880@jetm.me>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Ryan Gilbert <xelnaga@gmail.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4756; i=floss@jetm.me;
 h=from:subject:message-id; bh=CwYziX7xhBfn2m25duSkSh9rcVLfhh5k5QRM0huwOl0=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBpxHAKjrjSx3dwyBYdsaD5Biaa+2Zws6npBTtYg
 J/2P2ykR42JAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCacRwCgAKCRC17sMLqGd3
 H5LjC/0T2bHPNVpNlG9YTuVlgHjSqBtbbUlbPYLJLPJizHGhjRJceGSfIIAcXQ4B971EdFoAT5M
 YDDAekpjX1C12T2RkaapWnuzNuz3PAzD81DrbozzV5TpPuTwqvfgO+TJ+ytyUI8K1eCXwsj8T7C
 hdH27RoWkYm642FRkyScUyUjJbgaEhM5Wa/R3zJHPtxRbL07/C9eEmqgJ8C/5WXsbM98rC+Xh8P
 u8QVNXMnir/5eJ7lOWcRTv1FWio0raIXx3rtlmseSB/w35f7vheMkd5bWiIfbaizKuuOwaWc5+G
 kSsD4etZ8RhROLvlRWYRemyVb2vCiAcJ3x8lQTpeobN4cWjCCfjYaLxeRWIIRdPL1ybqqHdrlOZ
 bIhalEPjyo6tDSao6KNSMkyPDBHbCDZxDbxynD0FcqQp5hCpJTF1wetJFpYVTjn/mbnTOz6Rr2L
 ldrKaJJ0QqDNqfwar75R9uUjX0rwVUDz8QkkeZDTPZFX9xHvoa8EIsn+dw7YAUbMAAK6I=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
In-Reply-To: <20260325-mt7927-bt-support-v2-0-b892a3252880@jetm.me>
References: <20260325-mt7927-bt-support-v2-0-b892a3252880@jetm.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_163024_183697_9CDE6DA9 
X-CRM114-Status: GOOD (  19.42  )
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

The MediaTek MT7927 (Filogic 380) combo WiFi 7 + BT 5.4 module uses
hardware variant 0x6639 for its Bluetooth subsystem. Without this patch,
the chip fails with "Unsupported hardware variant (00006639)" or hangs
during firmware download.

Three changes are needed to support MT6639:

1. CHIPID workaround: On some boards the BT USB MMIO register reads
   0x0000 for dev_id, causing the driver to skip the 0x6639 init path.
   Force dev_id to 0x6639 when it reads zero, matching the equivalent
   WiFi-side workaround that forces chip=0x7927.

2. Firmware naming: MT6639 uses firmware version prefix "2_1" instead of
   "1_1" used by MT7925 and other variants. The firmware path is
   mediatek/mt6639/BT_RAM_CODE_MT6639_2_1_hdr.bin.

3. Section filtering: The MT6639 firmware binary contains 9 sections, but
   only sections with (dlmodecrctype & 0xff) == 0x01 are Bluetooth-related.
   Sending the remaining WiFi/other sections causes an irreversible BT
   subsystem hang requiring a full power cycle. This matches the Windows
   driver behavior observed via USB captures.

Also add 0x6639 to the reset register (CONNV3) and firmware setup switch
cases alongside the existing 0x7925 handling.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221096
Link: https://github.com/openwrt/mt76/issues/927
Reported-by: Ryan Gilbert <xelnaga@gmail.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/bluetooth/btmtk.c | 23 +++++++++++++++++++++--
 drivers/bluetooth/btmtk.h |  1 +
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 2507d587f28a..13c6e45deede 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -112,7 +112,11 @@ static void btmtk_coredump_notify(struct hci_dev *hdev, int state)
 void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
 			   u32 fw_flavor)
 {
-	if (dev_id == 0x7925)
+	if (dev_id == 0x6639)
+		snprintf(buf, size,
+			 "mediatek/mt%04x/BT_RAM_CODE_MT%04x_2_%x_hdr.bin",
+			 dev_id & 0xffff, dev_id & 0xffff, (fw_ver & 0xff) + 1);
+	else if (dev_id == 0x7925)
 		snprintf(buf, size,
 			 "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
 			 dev_id & 0xffff, dev_id & 0xffff, (fw_ver & 0xff) + 1);
@@ -130,6 +134,7 @@ EXPORT_SYMBOL_GPL(btmtk_fw_get_filename);
 int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 			      wmt_cmd_sync_func_t wmt_cmd_sync)
 {
+	struct btmtk_data *data = hci_get_priv(hdev);
 	struct btmtk_hci_wmt_params wmt_params;
 	struct btmtk_patch_header *hdr;
 	struct btmtk_global_desc *globaldesc = NULL;
@@ -166,6 +171,14 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 		section_offset = le32_to_cpu(sectionmap->secoffset);
 		dl_size = le32_to_cpu(sectionmap->bin_info_spec.dlsize);
 
+		/* MT6639: only download sections where dlmode byte0 == 0x01,
+		 * matching the Windows driver behavior which skips WiFi/other
+		 * sections that would cause the chip to hang.
+		 */
+		if (data->dev_id == 0x6639 && dl_size > 0 &&
+		    (le32_to_cpu(sectionmap->bin_info_spec.dlmodecrctype) & 0xff) != 0x01)
+			continue;
+
 		if (dl_size > 0) {
 			retry = 20;
 			while (retry > 0) {
@@ -852,7 +865,7 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 		if (err < 0)
 			return err;
 		msleep(100);
-	} else if (dev_id == 0x7925) {
+	} else if (dev_id == 0x7925 || dev_id == 0x6639) {
 		err = btmtk_usb_uhw_reg_read(hdev, MTK_BT_RESET_REG_CONNV3, &val);
 		if (err < 0)
 			return err;
@@ -1322,6 +1335,11 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 		fw_flavor = (fw_flavor & 0x00000080) >> 7;
 	}
 
+	if (!dev_id) {
+		bt_dev_info(hdev, "MT6639: raw CHIPID=0x0000, forcing chip=0x6639");
+		dev_id = 0x6639;
+	}
+
 	btmtk_data->dev_id = dev_id;
 
 	err = btmtk_register_coredump(hdev, btmtk_data->drv_name, fw_version);
@@ -1339,6 +1357,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 	case 0x7925:
 	case 0x7961:
 	case 0x7902:
+	case 0x6639:
 		btmtk_fw_get_filename(fw_bin_name, sizeof(fw_bin_name), dev_id,
 				      fw_version, fw_flavor);
 
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index adaf385626ee..6645bcadb523 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -8,6 +8,7 @@
 #define FIRMWARE_MT7902		"mediatek/BT_RAM_CODE_MT7902_1_1_hdr.bin"
 #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
 #define FIRMWARE_MT7925		"mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin"
+#define FIRMWARE_MT7927		"mediatek/mt6639/BT_RAM_CODE_MT6639_2_1_hdr.bin"
 
 #define HCI_EV_WMT 0xe4
 #define HCI_WMT_MAX_EVENT_SIZE		64

-- 
2.53.0


