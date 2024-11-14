Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFF6D6A224
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 18:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ljGXTXoD4990Ah9Pen2t1Ipd5y/qyu3l9S5U7tIzAro=; b=iXYrG30GD8zTTGEmHiKEPcOoHC
	YC0QyI64RDSFhRJ8SBe39KOgWeFmrD35x7AmZHLVxIhxVZ/go31UE2V2fR2bSMcQ/oCYaUdK1i21b
	sVNMhZ2y3wWkAgv5RicsXdT0b1tHGKc0mU9wqzR4f0rZKGyv920N1LsYESGozn9EQlWD8CwBWakpG
	gZM0pscgIdghYdnaNXGDePf6w2qhDRyP2FV137eTyPjVTphfOCEuYEkq0swl4Y8hsw3GdzGY3dOxE
	d3xrS5sHZvVYhSj1woaL13maTm+AfE0RnFschndrU/rcuBGytndaeqFwUvXIDBkEaUKJmjvtGSkBK
	H4++CNLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBe8t-00000000PbF-2Kh1;
	Thu, 14 Nov 2024 18:00:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBd6R-00000000DTr-0A8C
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Nov 2024 16:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ljGXTXoD4990Ah9Pen2t1Ipd5y/qyu3l9S5U7tIzAro=; b=nmpdZVkGpyjK6nfoUJ03VAUZ67
	9f25Z5tKuE/b6Dq4ULH/vYZW8sDBUKBj54obrhRjusgupXnpBUgSxfr0A1i6bRMZn3g1IEUa4UVCw
	eLI3ruOcZ5AczbvbNHSGNl+MVBCJcgopGt9NPkDdyM0oxQtUzpl3tWkBqaGEhK9vnUk28cWvHNgCm
	rXhQuKkVqaNFdhTfX0tyy/g22ruScDPlyJ9uvvfAHczgnZH42vc0oTc9j8+aYECe84T5xFF3bhPyU
	Aunv5grlkPZKrA2HT2XhiA3lqfysOn0iJH+sV1AjFMbkzZ2vioSDmoR3SKccgdg/XyjrbqV+4sSDR
	WAqBt9wQ==;
Received: from [198.47.19.142] (helo=fllv0016.ext.ti.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBd6M-000000008Zl-44Hx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 16:53:53 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AEGrZTe070288;
	Thu, 14 Nov 2024 10:53:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731603215;
	bh=ljGXTXoD4990Ah9Pen2t1Ipd5y/qyu3l9S5U7tIzAro=;
	h=From:To:CC:Subject:Date;
	b=Y4HGyCmzy8cvBefhq9HTJiupT6d8IRIuZvqBtq67y4ir1LgzGfkzgfNGrz56N5dsT
	 97zcHGyFxrTznbyebQZo5iKpBuRWBhKxtnlWaYfPuAv/AaAh9z+BL7dgq3UThzQPZ+
	 S6wzpjclHPM193LwvMwRRBTTUOhv3WJxxRcoscGk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AEGrZsE023505
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 14 Nov 2024 10:53:35 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Nov 2024 10:53:35 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Nov 2024 10:53:35 -0600
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AEGrYOh059681;
	Thu, 14 Nov 2024 10:53:35 -0600
From: Chintan Vankar <c-vankar@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>,
        <s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Chintan Vankar <c-vankar@ti.com>
Subject: [PATCH v3] arm64: dts: ti: k3-am62x-sk-common: Add bootph-all property in cpsw_mac_syscon node
Date: Thu, 14 Nov 2024 22:23:31 +0530
Message-ID: <20241114165331.1279065-1-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_165351_722664_492F4C8B 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Ethernet boot requires CPSW node to be present starting from R5 SPL stage.
Add bootph-all property in CPSW MAC's eFuse node cpsw_mac_syscon to enable
this node during SPL stage along with later boot stages so that CPSW port
will get static MAC address.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---

This patch is based on linux-next tagged next-20241114.

Link to v2:
https://lore.kernel.org/r/20241011110207.600678-1-c-vankar@ti.com/

Changes from v2 to v3:
- Updated commit message as per Vignesh's suggestion.
- Collected Reviewed-by tag from Siddharth Vadapalli.

 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 6957b3e44c82..bf12e25ad3fc 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -315,6 +315,10 @@ AM62X_MCU_IOPAD(0x028, PIN_OUTPUT, 0) /* (C5/C6) WKUP_UART0_TXD */
 	};
 };
 
+&cpsw_mac_syscon {
+	bootph-all;
+};
+
 &wkup_uart0 {
 	/* WKUP UART0 is used by DM firmware */
 	bootph-pre-ram;
-- 
2.34.1


