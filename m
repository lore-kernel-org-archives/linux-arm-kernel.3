Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457DCC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 11:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7VAE1l1tpUe5n89B57iDz0Xbo2ff8Z270c0+Wxzb41E=; b=e+7SKQ4MDYX8tHIFQgxekhMUXZ
	pnRMFfjzOJZIdwpKfz3n/GJKcFfW3lTnN1FD6uBPbLSHYjl6ZMNXpQqq7MMDBqbztg8dh9MGYvQLI
	ULFO64N8QX8+P04c/0XcTbE4fJF/x2hRg7+b0UckFxyDw3PWGrLnGuysmDcekJGWhhiBkPPszuob+
	nuQZq7S/mXwViIqUxbStBM7iH9ybpCd4dPX9/8ExdyL91hJIDhhWuyuBZs6++R8KbmJmUmgVDPsNA
	E062A8/ST/K76oEx/8Q4R0vVawYIhPxu+OW8c+fwB2XecviEwZcO80S0U+qXMga11EunuRMFryidp
	2lCCjwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBu2B-00000007AXf-1iSJ;
	Mon, 05 May 2025 11:30:55 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBtz5-00000007A4w-0JWU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 11:27:46 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545BRbvl749119
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 06:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746444457;
	bh=7VAE1l1tpUe5n89B57iDz0Xbo2ff8Z270c0+Wxzb41E=;
	h=From:To:CC:Subject:Date;
	b=xqPHvnCefJpaNzVTFRUbNh9JqxFlmrjuAhxWI8HIX09m2S5otd4n+VbhRI14cO03W
	 /fKKMSaZcKNYGZdR0BARJPbPrTp3v+LHOyFZ9kn2+AFXHlqcmHftpH4zcDfOy3dL2j
	 iam6zIBJc84l8JYm858A50I0R5dX+gUggG0ivw7s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545BRb4t001198
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 06:27:37 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 06:27:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 06:27:36 -0500
Received: from prasanth-server.dhcp.ti.com (prasanth-server.dhcp.ti.com [172.24.227.142])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545BRX86029127;
	Mon, 5 May 2025 06:27:33 -0500
From: Prasanth Babu Mantena <p-mantena@ti.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1 on J721E
Date: Mon, 5 May 2025 16:57:31 +0530
Message-ID: <20250505112731.2515734-1-p-mantena@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_042743_244140_E8FD8315 
X-CRM114-Status: UNSURE (   8.39  )
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

J721E SoM has MT25QU512AB Serial NOR flash connected to
OSPI1 controller. Enable ospi1 node in device tree.

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
---
Test log : https://gist.github.com/PrasanthBabuMantena/9dda540dce88282117de7e0e945e24ca
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index e3d0ef6913b2..3112b351c052 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -571,6 +571,7 @@ &usb1 {
 };
 
 &ospi1 {
+	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
 
-- 
2.34.1


