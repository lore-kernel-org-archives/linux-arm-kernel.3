Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC748606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wzN6eM/P;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=ZAW7RLwH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5y9Wn4Q8THM2bDdoKlwdiambKkhALCwKJfsk0HKSgc=; b=wzN6eM/PQXlN3b8y3NppshXNRi
	20mwytMY9USbnVmzcP3aU0NCfjNUmb9/BamI6WaW5xx5gfofSnJXKfkvDILv6/NrfAs/FIewfBdov
	c1LTbOmp+Z/Oeo5A58SCcImn3PGoAEZ9BeXd0V/peXKSNRtQ7+j1mdiUQ6AvE6okFHXvxZRDW3IWE
	QPcEi1/U4yHs/7Ggy2+xJoaXPM7D3UFyMHeHXesGtLN7W2rp/l1Siur1MpSqLb0b7ei/KSi7AEnXs
	lLkZXsk/vmK6Kbqw6FWrGm6mc2KIwBiw/n2Cvwe3PXLmmj67Nh2X9PNCcGUpDhbG9QZm8cbraMYSv
	RU1XeKhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa7E-0000000CYEs-1yHx;
	Wed, 21 Oct 2026 17:28:40 +0000
Received: from lpdvsmtp10.broadcom.com ([192.19.144.205] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJa7B-0000000CYBU-1Gyl;
	Wed, 21 Oct 2026 17:28:38 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 3D950C0003DA;
	Wed, 21 Oct 2026 10:28:36 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 3D950C0003DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792603716;
	bh=juJmb3giRDQiI6RF7yM2p8q0loJJuWRb19tphTj3ShI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZAW7RLwHNMSk0voMvsDayy3hczNulS5nYCZWZGgbr94SPc0mIRXzpqsaBm8xTiSOO
	 ogPMtJb6co1VGRcC4CgUPTsqpg1DTBVvCWIWD/y/IzQYLMp8AjrmQqVwJjc472VSMX
	 ptycaSPhJjoT7fjiCcjc6xCApMChr2txpor/8vtE=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id D00CBAEA3;
	Wed, 21 Oct 2026 13:28:34 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 9/9] ARM: dts: broadcom: Use noncoherent USB DMA on BCM958625HR
Date: Wed, 21 Oct 2026 10:28:18 -0700
Message-ID: <20261021172819.668120-10-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021172819.668120-1-florian.fainelli@broadcom.com>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_102837_526204_0B47D04A 
X-CRM114-Status: GOOD (  12.64  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The USB hosts on BCM958625HR fail when using the dma-coherent properties
inherited from bcm-nsp.dtsi. xHCI aborts commands, while EHCI and OHCI
report fatal errors during enumeration and stop servicing their shared
interrupt.

Removing these properties restores high-speed USB2 device enumeration
and SuperSpeed USB3 operation on the board. Use noncoherent DMA for all
three hosts so the ARM DMA API maintains their descriptors and buffers,
as in the downstream SDK. Limit the override to the tested board.

Fixes: 56e2ff0346a3 ("ARM: dts: NSP: Add dma-coherent to relevant DT entries")
Fixes: bbe526f55b60 ("ARM: dts: NSP: Add USB3 and USB3 PHY to NSP")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index 0105afeca748..c896c390f042 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -86,6 +86,7 @@ &amac2 {
 };
 
 &ehci0 {
+	/delete-property/ dma-coherent;
 	phys = <&usb3_phy>;
 	phy-names = "usb";
 	status = "okay";
@@ -130,6 +131,7 @@ partition@4000000 {
 };
 
 &ohci0 {
+	/delete-property/ dma-coherent;
 	phys = <&usb3_phy>;
 	phy-names = "usb";
 	status = "okay";
@@ -255,5 +257,6 @@ &usb3_phy {
 };
 
 &xhci {
+	/delete-property/ dma-coherent;
 	status = "okay";
 };
-- 
2.53.0


