Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF56F531F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 06:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pdsqpleAsC0hxA1u9yqEyqaShdftKvYAcsPRNsTY7Dk=; b=TRmrZqQYUEdBRZ6CpAL24Sq5hp
	f1M2u3hluNGrwNiNmRw1bkYDcwS+BZiiZyK97WhQTXKxNK0+RuF3ebEd+FcaBjKLnDjb42+Gab7op
	P+F/PuXNWvs8VMCg0dXhhY4J9yuU+i7ROFHG920AxiKF/ewssfx+kya4G0uPXKGGhguqiobimmjnU
	Y33b9zEQw1gEdPyvAezuDeRr8DLUtjK0S2XUuniyna27i5Jg//qYIcaaVnEPxaso3l+d9xoh1RH0/
	HVa6QMF0Zhh2dob4cENkyDyotCFwZdA2qP9w/80K4L8aKNQR1QWT7qIWB5bvSZzQBO2GtXhJs63zT
	Tt5rgk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXZ8-0000000GrWe-28kk;
	Tue, 14 Apr 2026 06:48:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXZ5-0000000GrWF-3MwV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 06:48:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3F8C43F93;
	Tue, 14 Apr 2026 06:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BD4C19425;
	Tue, 14 Apr 2026 06:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776149281;
	bh=sgQSnvH0C3Sqy1eWfjYwrIYFONIpzqlkzyRfsudm/xU=;
	h=From:To:Cc:Subject:Date:From;
	b=Et8EgnRsWhzdmcM4RENWMbVpkXKS8dXoteWcjVKiKsBIsvCbKJY/7smciG299ZLWG
	 8tH2CrpUVX4tT6Gv1IbzuEfayBYNMmfbCeO4ullqdeuT0wxNIEM1RJK0eDKTTDxH3F
	 nboa+k0ApHlnGj4VjghnFw6HdWJrt6d9af8VDYYRzkCjcWBG/w2Q9Vq84msCbNmnsk
	 kEAfI7TbIJanjyq+PtunxH+fuOM1+jwjO4arCliVHUcnUBAodyZxxWTWDUOU5wTVR4
	 6TWHeR38oIrsxjodpPfOOd8X3ZTYLRP4UkejezBYvSQ0P7Qw2xVv8G+ajSLEsLXk9C
	 0SAVbkmo2VYzA==
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
Subject: [PATCH] [v2] ARM: dts: bcm4709: fix bus range assignment
Date: Tue, 14 Apr 2026 08:47:46 +0200
Message-Id: <20260414064754.3129667-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_234803_865646_7E2E9599 
X-CRM114-Status: GOOD (  11.34  )
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

As Rosen mentioned, the bus-range property was a mistake, so just
remove it and keep the reg values pointing to bus 0, which is
allowed by the default bus range of the SoC.

Suggested-by: Rosen Penev <rosenp@gmail.com>
Fixes: 893faf67438c ("ARM: dts: BCM5301X: add root pcie bridges")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
index d170c71cbd76..e85693fba16a 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r8000.dts
@@ -139,7 +139,6 @@ &pcie_bridge1 {
 	pcie@0,0 {
 		device_type = "pci";
 		reg = <0x0000 0 0 0 0>;
-		bus-range = <0x01 0xff>;
 
 		#address-cells = <3>;
 		#size-cells = <2>;
-- 
2.39.5


