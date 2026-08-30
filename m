Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF132C624A2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MK3y/ljtjUexorjTzXkQRpOm/aVY9gRvt+fEa2i1YQ=; b=sHLSWnR+/u7V1DlwBWaxTUqkiO
	Ns6xXg3WdwWrEFolMagarrKghyoeAl9wcXob4M9XJIt7GNHp39OegrjNV4QVFJmylCXezYI8/6jYl
	U0CXEb+3/HHQ1LBAV8jwTKv/AzEmZ1u8dT/qHn9Ax4Bh/ysQogkfs+nwRks1St1oNJoI0cpen9Y7m
	z9bJFSt/h0uywM7HG+F+RSmyB9utohPLrYQtPeTQPWJh3VsDm0ZU+EqqY5ekWXwymlJQIGW0/ls5c
	4HO48x9gayuqW5ab6dCAl2yEqjtgw8DC9KDXRULmL4WViMZe+0+VcgWe+K9E0HPRwL4ifujpODAKE
	SC1VYFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0I-000000082sS-2JfV;
	Sun, 30 Aug 2026 20:19:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0H-000000082pU-05P3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:19:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 42B4843F87;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CA4FC4AF18;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121184;
	bh=qXUPQQ+/YlgdXuqv7U2bExUuKkk0IWuRWSMGsGl9d24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GJ0jFGFt/PDWF0Vso1akAhRp5S0U3a/6YdJBpeuK9uOHHRsQF6Pw3wbmRPznEORtI
	 7iRs/vL6bqNf46PdArQ7S2dc3kJDcAss63lKbX5OjbH2xZ66k8sxeBgrX0XTpoY1sv
	 XCvQJDPNmD7Sf8AIeivcxcZG/DuAGSAp4p+Wp0LmAvuNrPvB6n2+5o04dtaDNGwmcg
	 tu/Q//YPMOO3bxnA4MhTF3b/cJGBAEE+ReyTAbGWjHUQVtMmvF+Ror0+IcNqJyQCGX
	 D4zi4kYD+HptSB/5IVActGtN835TVp1Ilsd4I/E4zjijnug55SZTi9Cwm+K+8aO3za
	 H4ic72sWbPUVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B11C61DD9;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:24 +0200
Subject: [PATCH 06/19] thunderbolt: Try reading host DROM from device tree
 first
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-6-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=qXUPQQ+/YlgdXuqv7U2bExUuKkk0IWuRWSMGsGl9d24=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCaGOM/MNwkOWxbjxvMyYGvCJ007Rps1QtLpU8XVbr
 +iKws8dpSwMYlwMsmKKLNv325s+efhGcOmmS+9h5rAygQxh4OIUgIlcWs/I0O0jy9rxdsmdfYG+
 P+wuW8XIsHxscl7sKPuz7nfr3NWdMxn+V4sKilw9qjK/6NWzyc6fn67OeVP/MrHp742Ii4ku5RV
 pzAA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

On Apple Silicon SoCs the DROM is provided by a device tree property.
Try reading from that property first.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/eeprom.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 2a13fa6888ba..389de7df84f6 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -468,14 +468,14 @@ static void tb_switch_drom_free(struct tb_switch *sw)
 }
 
 /*
- * tb_drom_copy_efi - copy drom supplied by EFI to sw->drom if present
+ * tb_drom_copy_property - copy drom from a device property if present
  */
-static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
+static int tb_drom_copy_property(struct tb_switch *sw, const char *name, u16 *size)
 {
 	struct device *dev = sw->tb->nhi->dev;
 	int len, res;
 
-	len = device_property_count_u8(dev, "ThunderboltDROM");
+	len = device_property_count_u8(dev, name);
 	if (len < 0 || len < sizeof(struct tb_drom_header))
 		return -EINVAL;
 
@@ -483,8 +483,7 @@ static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
 	if (res)
 		return res;
 
-	res = device_property_read_u8_array(dev, "ThunderboltDROM", sw->drom,
-									len);
+	res = device_property_read_u8_array(dev, name, sw->drom, len);
 	if (res)
 		goto err;
 
@@ -500,6 +499,22 @@ static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
 	return -EINVAL;
 }
 
+/*
+ * tb_drom_copy_of_apple - copy drom supplied by the device tree for Apple Silicon to sw->drom.
+ */
+static int tb_drom_copy_of_apple(struct tb_switch *sw, u16 *size)
+{
+	return tb_drom_copy_property(sw, "apple,thunderbolt-drom", size);
+}
+
+/*
+ * tb_drom_copy_efi - copy drom supplied by EFI to sw->drom if present
+ */
+static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
+{
+	return tb_drom_copy_property(sw, "ThunderboltDROM", size);
+}
+
 static int tb_drom_copy_nvm(struct tb_switch *sw, u16 *size)
 {
 	u16 drom_offset;
@@ -675,6 +690,13 @@ static int tb_drom_host_read(struct tb_switch *sw)
 {
 	u16 size;
 
+	/*
+	 * Apple Silicon machines always get their host DROM from the Device Tree,
+	 * so make sure to try reading it first before any other method.
+	 */
+	if (!tb_drom_copy_of_apple(sw, &size))
+		return tb_drom_parse(sw, size);
+
 	if (tb_switch_is_usb4(sw)) {
 		usb4_switch_read_uid(sw, &sw->uid);
 		if (!usb4_copy_drom(sw, &size))

-- 
2.55.0



