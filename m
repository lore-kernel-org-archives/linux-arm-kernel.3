Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EE4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 05:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K7M/Q3yMw6BAIPte+sWOvd375dRIYu4Pkgf89ouVHmw=; b=0FA0wuRd50W1Fe9NsLdxKiJs9d
	ugbCwj1HDwk/jl/c5pyhKMlOynOzHx8Mv8xCTbvOA/vVkeUzsNBdWaCyvE33I0mlS4XbqpHW5/0QX
	D0OVLSKqtd/40pdyvGrFz6Ka4UkBhYxqTS7eXRx0STqjb9PzQNixSgUzzfX7dj7VF41Tk0mgn6xBv
	c823SPs/0LG6/IXcJo2odjhGOZTuMlXQTP+TsyenUKc+8HTgl5TNdeAkVU9bvWyy27H0AjcNe4Fyp
	wk7ZQ2wsCBzIVK6QiIWMQxLgBRR0hfOyZXLY1+RqZ/4V2Ah2srHNsbqC1c5yF1mHnLmCg+LlaUwIc
	JbGLi32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOVrG-000000040TX-13yp;
	Fri, 20 Dec 2024 05:47:30 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOVpv-000000040Gd-23jK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 05:46:09 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BK5jtmY020148;
	Thu, 19 Dec 2024 23:45:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734673555;
	bh=K7M/Q3yMw6BAIPte+sWOvd375dRIYu4Pkgf89ouVHmw=;
	h=From:To:CC:Subject:Date;
	b=n2ySVPdVXbtbILUdkz4C4IkgY5gEZSoF8Ghj4KE7jzvWkWlW/+MA0RbqrdkuXNHhB
	 i2k1UzTQO9MAmJl97TDzGgsBPzK1/YaI6Gk1lHuojRHWk/u9LE9QsyhhVl5E2x2HVd
	 nA7wcIeTjoUI4ki1uDBjtk7P+8UC0Q7wQmxkMQVo=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BK5jt7r027353
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 23:45:55 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 23:45:54 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 23:45:54 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BK5jo9j125990;
	Thu, 19 Dec 2024 23:45:51 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rogerq@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am62p-j722s-common-main: enable USB0 for DFU boot
Date: Fri, 20 Dec 2024 11:15:16 +0530
Message-ID: <20241220054550.153360-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_214607_576308_A6DEF46C 
X-CRM114-Status: UNSURE (   9.73  )
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

Add the "bootph-all" property to the "usb0" device-tree node. This is
required for the USB0 instance of USB to be functional at all stages of
USB DFU boot.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on linux-next tagged next-20241219.

Enabling USB DFU Boot for AM62P5-SK requires the "bootph-all" property as
indicated at:
https://lore.kernel.org/r/20241218124542.3519447-5-s-vadapalli@ti.com/
This patch is being posted to have the "bootph-all" property present in
the Linux device-tree in order to have the same property in the U-Boot
device-tree in the future via DT sync.

Regards,
Siddharth.

 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 41e1c24b1144..4516a95b7504 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -651,6 +651,7 @@ usb0: usb@31000000 {
 			interrupt-names = "host", "peripheral";
 			maximum-speed = "high-speed";
 			dr_mode = "otg";
+			bootph-all;
 			snps,usb2-gadget-lpm-disable;
 			snps,usb2-lpm-disable;
 		};
-- 
2.43.0


