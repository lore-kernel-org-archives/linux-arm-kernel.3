Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CBECA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OhfDopMLlSzRjCi00Eq04iQOcGmfz7Cch60FwRXbW2w=; b=UipMOh06PTnvjcM5n7/SpQ8t5H
	FbAUdBaiBfIYX4P9UxCrpSzFIGJDRtDYKLCFVKGTRKY45WeoEA7N0+ppvJcAWLSRTZ9HRxTeUiF8z
	gSiis+ijxd24IeD4+4PNnERKpmbVtJV1+bC7tEsQVUeQxFJspforES/CH1PVR3txZLKQrl92wAw9L
	aJSWUo0S+NvjgHJIciZPQwKQkaSUWOdNoJA+MVaZYpl3zT4KOSHEDkvk0GofbhUcxFzPUZEmO6VLh
	s59N3lTtO72KalmAi5J//Z5JL3FU43fIYOusME5++IMu8cMH2nMyFq6dW6Si3bKwIAF93UBbss5vd
	woRREJmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEWD-00000000uev-2TLj;
	Thu, 21 Aug 2025 23:16:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9Kk-0000000067W-2WNv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 17:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OhfDopMLlSzRjCi00Eq04iQOcGmfz7Cch60FwRXbW2w=; b=bOJ6kBEdqkrsjj6Ncj7wyV0pSR
	R2xIoVvbjl0QvrPE32Uhdg5FnOgsr2klRchP9lga5iy4N57EbG+APRy3+pMAZVSaQoT39UiyCWWO6
	TUQuPERYTVcfemXY0LY6JzQp4TLCfcum1Xdf5K09WpQgWLsUPdAjt8VEO2TobVDNTT77gTLh4vFpq
	aQy8jaVhf/+ZPkxI97a5ujEpQizScWRionK8OtQSu9VH66iS2eaXBi0YKivfm5hOMRMoZLib2ri5o
	e1wZaMEehLMESc6b0EJpi0+dliwwg+RlRkmy6mGfSa/QNSFMoZ1AqSh48qCg60quf7eWht4NbzF+S
	JyJbsfYQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46994 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1up9Kg-000000001SK-0GL4;
	Thu, 21 Aug 2025 18:44:14 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1up9Jw-00BbOE-VC; Thu, 21 Aug 2025 18:43:29 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH v2] ARM64: dts: mcbin: fix SATA ports on Macchiatobin
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1up9Jw-00BbOE-VC@rmk-PC.armlinux.org.uk>
Date: Thu, 21 Aug 2025 18:43:28 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_104418_636577_6CC6145B 
X-CRM114-Status: GOOD (  11.10  )
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

Booting 6.16 on the Macchiatobin, I discover that I can no longer
access my disks, and thus the userspace boot fails. The cause appears
to be that one of the SATA controllers doesn't have any ports:

[    1.190312] ahci f4540000.sata: supply ahci not found, using dummy regulator
[    1.196255] ahci f4540000.sata: supply phy not found, using dummy regulator
[    1.202026] ahci f4540000.sata: No port enabled

This is as a result of the blamed commit below which added a default
disabled status to the .dtsi, but didn't properly update the mcbin
dtsi file. Fix this regression.

Fixes: 30023876aef4 ("arm64: dts: marvell: only enable complete sata nodes")
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index 6170ca8f908f..8c7db2e87e30 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -388,11 +388,13 @@ &cp1_sata0 {
 	/* CPS Lane 1 - U32 */
 	sata-port@0 {
 		phys = <&cp1_comphy1 0>;
+		status = "okay";
 	};
 
 	/* CPS Lane 3 - U31 */
 	sata-port@1 {
 		phys = <&cp1_comphy3 1>;
+		status = "okay";
 	};
 };
 
-- 
2.30.2


