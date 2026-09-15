Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF62C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 04:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R17raKv3A7dRbP0Z0IS8IcCAkKFbNj8l0X/n53cwErk=; b=sXFpzgu/TRyHa2N0LSCpA9tb6V
	tBHEI0pxc3eLyu5UelUs7tXpey3JW6zCjqW1G5KXT3HT8/SfbzFvwCNJdbOBVkXEacWD8EsApM4Ji
	zp/uOGvQhiyGMQp6rUx9+4svyw3Qp3HHcyowXxL1eVn/8T20cqgQ2EsCwvyouoSfcNdoW1jdltrh8
	nOeq0f0WN5LR3k9Tf6oI7Vz/8uNgw2K9O+mjp9OrSMTqKTCiCH0sX2aq9S7I3UvIl9AklLn38q1d8
	QbhY0LJ6728yB2gSOPAlJh2fTpkFkLT5hDJifXtGh48HZg8raj8IU2YVm3cgmYqiIMPzQZhhCJCcQ
	nCVkJfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L1X-00000005Chs-0gqJ;
	Tue, 15 Sep 2026 04:44:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6L1V-00000005Chh-3Cpe;
	Tue, 15 Sep 2026 04:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=R17raKv3A7dRbP0Z0IS8IcCAkKFbNj8l0X/n53cwErk=; b=Fejze0j+SE4/cndYjFxdg4IOzM
	WUgfnycJcmEIBwAejWLcqVpKYQnfDPsWHRRvQVjXG7QdIMvqnE+W/pokid6PqE0vnMqQiaGKYb3hu
	rYFTQERPr6VNTb0tn1PV2WAOpGVlQ84QJQG1lpsi+bkY9VED8ppaIFY26FFOEuDmU6qd5Xkjz8Tkn
	VYTmoa0ttWfx9GgA/CyTmta9/HPOd3x6niaZEqs6DtNePgW+6mKVqdE3IwVNpTIYSUwb+PnezxTER
	N1uO5clI0D51/UYl6tG0JFm6r6mo5VOSPXRKp0Fnr0rEq3D0bHcSCL9ZZJ31SQH6RAMMj8VIB7Bad
	QRg/rvdA==;
Received: from mail.mdapi.ch ([31.3.128.54])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6L0l-00000006Gbm-1EAr;
	Tue, 15 Sep 2026 04:43:58 +0000
From: Martino Dell'Ambrogio <tillo@tillo.ch>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tillo.ch; s=mail202603;
	t=1789447383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R17raKv3A7dRbP0Z0IS8IcCAkKFbNj8l0X/n53cwErk=;
	b=OuSbTTxeQeoVaSq50k3p04BeRq+7cMcJ0MvPJa0qOXiCzU3MJVtd+1bfodzWQfmfQqSjqY
	qyvXMojZFVSTC2VhK2xjejCpSE8wi5tEA3yrGa3jTzqc2bv2YHNyXjKJe0prFuibH0Gc1o
	XoPH8gpNaxsEZfVhCxbEipAishcwGSS2iqNv9wvrNZgzBJQlEDzIA8AzJvATBc2m4EyVEp
	M0aQhmfexP4p46trWHu9WZW+R6jqGMGsjRZa6Yc06rTuqjJBfMBZV2ZwEWkeYyWJS/z+Eb
	zRBupS6VDq0EnaFl/RL4l30rY6daSiSGAlhS1Y8D7/DTYuraPrjfsQFlQFScWw==
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com
Subject: [PATCH v3] arm64: dts: mediatek: mt7986a-bananapi-bpi-r3: add ramoops region
Date: Tue, 15 Sep 2026 06:43:02 +0200
Message-ID: <20260915064302.1595204-1-tillo@tillo.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_054330_968706_F88E2F3C 
X-CRM114-Status: GOOD (  14.00  )
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

Reserve 64 KiB of RAM just below the ARM Trusted Firmware secmon region
(0x42ff0000-0x43000000) for persistent kernel log storage via pstore/ramoops,
allowing post-panic console output and oops dumps to be recovered after a
warm reset. Without it, kernel crash logs on this board are lost when the
SoC reboots.

The zone sizes (record-size=8 KiB, console-size=32 KiB, ftrace-size=8 KiB,
pmsg-size=8 KiB) consume the full 64 KiB carve-out. The requested ecc-size=16
reserves a small Reed-Solomon parity block from each zone's own allocation
in persistent_ram_new(), which lets pstore recover dumps even when the panic
path truncates writes mid-record.

The no-map property is required so the reserved region is kept out of the
kernel linear map. ramoops remaps the carve-out write-combine via
ioremap_wc(); on arm64, leaving the same physical RAM mapped cacheable in
the linear map at the same time is an attribute-mismatch and risks losing
panic data to dirty cache evictions from the linear alias.

The region sits immediately below the ATF block already declared at
0x43000000 in mt7986a.dtsi, so no other reserved-memory child is moved or
resized. BPI-R3 ships with 2 GiB of DRAM starting at 0x40000000, well above
0x43000000, so the region is always within installed memory.

For the carve-out to actually preserve content across a reset, the boot
loader must avoid touching this region on warm reset; on standard BPI-R3
boards with the stock OpenWrt U-Boot fork this already holds.

Signed-off-by: Martino Dell'Ambrogio <tillo@tillo.ch>
---
Changes in v3:
 - Resend; no functional change. Rebased on v7.3-rc3, where the v2 diff
   still applies unmodified.
 - v2 drew no review comments. It was also sent, in error, as a reply to
   the BPI-R4 patch's thread rather than its own, so it is likely to have
   been read as a duplicate of that board's patch. This version starts a
   fresh thread to avoid repeating that.

The matching BPI-R4 (mt7988a) patch is being resent as v3 at the same time.

v2: https://lore.kernel.org/all/20260528123655.2650868-1-tillo@tillo.ch/
v1: https://lore.kernel.org/all/20260528093038.1945245-1-tillo@tillo.ch/

 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts   | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 637e556..322a12d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -142,6 +142,19 @@
 	};
 };
 
+&{/reserved-memory} {
+	ramoops@42ff0000 {
+		compatible = "ramoops";
+		reg = <0 0x42ff0000 0 0x10000>;
+		no-map;
+		record-size = <0x2000>;
+		console-size = <0x8000>;
+		ftrace-size = <0x2000>;
+		pmsg-size = <0x2000>;
+		ecc-size = <16>;
+	};
+};
+
 &cpu_thermal {
 	cooling-maps {
 		map-cpu-active-high {
-- 
2.47.3



