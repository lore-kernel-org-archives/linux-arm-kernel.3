Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8581EBFD22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TPmAxNSCbTPp6CjZrL2sCX31Xc/gawGqaJo4Qab7NKU=; b=yeU2YgA9GLI0o9sccInOUkxlRH
	1qPQBuChIDQ3O8BfMwr3VZGm1kLl9rZQTeJGpQT0SkOMaYaGBDYfJIdgL6Ygj3nllc4ra9cu7wukD
	/aEN3n6anIrcmCPCd/xAU78d0TI9ilHkq9+ln4dbQsaC9w3JAvBn08D4vCRa9yECpLJ/lAF5uYzAV
	/+1kULiw0C+PxS/6WKsuHfKl+e5b3mOZjeZD07HBZvCp1Qr7DejjwqysAsWE68k5DTqfw8P19f5oo
	VaP1u2+3GR9RusdQQ0/KhA0xrYCVW2ubSyEmitA9rUrbxhxxFxYM1DXTfNtEFOUiokNDz++fLS/gL
	7RaYEMOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDUZ-0000000FM4u-0ShD;
	Mon, 13 Apr 2026 09:22:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDUX-0000000FM40-1aWG
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Apr 2026 09:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=TPmAxNSCbTPp6CjZrL2sCX31Xc/gawGqaJo4Qab7NKU=; b=URw0HaY2ESaRfgVVTTptW/Tv9B
	9kNrmyFdLKaHxzsYDgUwS5wtd+8uwEDjzMGDw2hZzJUqtrMcA5JUcRXD8PlAYB/RfrcGWYXaJpWfm
	m5VBI1PWNjb6tBhfj/cP+M952/GyPmxa4clezJfGbCqRWlONtx69riMAGlvitGoujXsZ5T4mcDMFP
	mGQwTwygL4s+XbGePdfGw8AH/MQKddV5dKGSJ0qPMTKc1AuzdOYRQhmAr0OinqfJK8yiblgaDi6tN
	28bllFf0UMndnXjB3bG5lO+IUQ3cOtPVhIhwiglW9RxSsueb0LvtPtaeZ4H82XbrkgY9DrYPf8BLG
	VO/veFiw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDUU-0000000GUFr-0zrU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 09:22:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C9FA4061F;
	Mon, 13 Apr 2026 09:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C547DC2BCAF;
	Mon, 13 Apr 2026 09:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776072114;
	bh=HCn68mfmb+0zvBExHJU/0JnG9Yw0KL8/dTH9fyp1YFk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZMlkVj5v9hYKqB0SK/x6fwgekTr/gQZaVN7yDdNdvBl8McY2omPgeVkH5MXB7urIM
	 LiJRS0P90mJod/MefuAgYa+E7m8yKs6UXLNnnvd2aNUqBrwKhFEvCRGePNo2rrVQlO
	 DemG8VKeMkFHP06ygKzv56zrYXtA9M9yJVFwjPpA/dB6iToyyVOEND8jYFcVC98XMe
	 pLyKiQyBAK0JTEunpkqZGRIlElceVQjOBkPJZfArxNCHuD4bspZLUpa4iqog0B8B99
	 /EolN/e2Dxoce0CnORvKXA6Sbi7oDRTKCSVuID18WIceSbySdzHC+AVxIASr6Hv/eG
	 dlkT7WgZWnxsA==
From: Arnd Bergmann <arnd@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rosen Penev <rosenp@gmail.com>
Cc: soc@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: bcm4709: fix bus range assignment
Date: Mon, 13 Apr 2026 11:21:45 +0200
Message-Id: <20260413092148.3870746-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_102158_526145_EDBACB20 
X-CRM114-Status: GOOD (  14.87  )
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

From: Arnd Bergmann <arnd@arndb.de>

The netgear r8000 dts file limits the bus range for the first host
bridge to exclude bus 0, but the two devices on the first bus are
explicitly assigned to bus 0, causing a build time warning:

/home/arnd/arm-soc/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:142.3-27: Warning (pci_device_bus_num): /axi@18000000/pcie@13000/pcie@0/pcie@0,0/pcie@1,0:bus-range: PCI bus number 0 out of range, expected (1 - 255)
/home/arnd/arm-soc/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts:142.3-27: Warning (pci_device_bus_num): /axi@18000000/pcie@13000/pcie@0/pcie@0,0/pcie@2,0:bus-range: PCI bus number 0 out of range, expected (1 - 255)

I could not find any reason why this is done in the first place, but
this can be easily addressed by reassigning the two devices to
bus 1, or by dropping the bus-range property in order to allow
secondary bus 0 to be assigned.

Assuming the bus-range is intentional, fix this by moving the
devices to the first valid secondary bus number.

Fixes: 893faf67438c ("ARM: dts: BCM5301X: add root pcie bridges")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index d170c71cbd76..355be5014943 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -147,7 +147,7 @@ pcie@0,0 {
 
 		pcie@1,0 {
 			device_type = "pci";
-			reg = <0x800 0 0 0 0>;
+			reg = <0x10800 0 0 0 0>;
 
 			#address-cells = <3>;
 			#size-cells = <2>;
@@ -162,7 +162,7 @@ wifi@0,0 {
 
 		pcie@2,0 {
 			device_type = "pci";
-			reg = <0x1000 0 0 0 0>;
+			reg = <0x11000 0 0 0 0>;
 
 			#address-cells = <3>;
 			#size-cells = <2>;
-- 
2.39.5


