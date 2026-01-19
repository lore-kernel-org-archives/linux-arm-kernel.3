Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4366CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kMyqcpJJP2P08zzKIVj02gHaGo8sAGB5aCenicHDwI=; b=sASvfqJu/PJG1bOK5ZclWMck3i
	wXVyadRgBpBkSfIplU0dAjYrPP6MtC/lCLcFIaIe72piazoQ47aDk1SEKEIRZDHm+VJ+Xdqp7DKKl
	DoojFYHwxk6n+hV6vVj2RxdjuoDJaFwninSHKmM6n5bdcKaa8HWVrSl2Db8EprWuCNS8bVtUO0V/C
	EKRi2tDAz1Th7wLZOTS9HIxrXPwVNoc8Uijeb0KCLMgV/YCO81UB/pYIbRiOWKu+xHhwDfyr6BeaU
	KpPl/bgc1Gpi5uQxQGGYZuyTdHsTO6tcD1Wmfsk477eakipmi+PBt4j7fCVU/CE9CLEmMV2s/+1lQ
	KuX5I06g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjLc-00000001RpC-0dlh;
	Mon, 19 Jan 2026 07:06:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjLP-00000001RlT-2k5Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 07:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CC9C44502;
	Mon, 19 Jan 2026 07:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CD08C2BC87;
	Mon, 19 Jan 2026 07:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768806394;
	bh=u3K96sn3kaP5ZMu4Inbphv8OWU2bjFbfkLD6u/MxeC4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gw3yHfoTaTPrAyMvnzd1S/99WaaupLVOWze2HSvrDL4JJLbfS0XdP4bNwVwprQCIH
	 akDLUMOpG/TuA7XVdSsbgdLydSSm+JULAgHADdZH+Tkr8x3QMfB1L2ZPPoU7fDcHIf
	 qOTNngttO7Weo3TXir/tj5LeqYUqbLPKSrjcM/oYduFieXA6JZhERiqX6RIG3XlUYW
	 a0KHWDIkwuasI8u/Hap3SjHIzEP5IG+4H8O+pf/yRf4o8k5x1y39yk/v2uV71mFrv3
	 gdWbdRjNj2XMJuPBvX+ynOuEQTi9OKa1lajQi8BXbUdwAL8Y0pxOctn7rIISqFqgD6
	 gzbcLg/PSG0BA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44547CA5FF7;
	Mon, 19 Jan 2026 07:06:34 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 19 Jan 2026 07:06:24 +0000
Subject: [PATCH v3 3/3] spi: xilinx: use device property accessors.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-spi-xilinx-v3-3-4566c33bac0d@nexthop.ai>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
In-Reply-To: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768806393; l=996;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=5Z9Lfw4Ms5TcSIWQwUqr5lvpEWwq7CP+Bn9jodMd2/I=;
 b=b2d156WBDJn95t3Soo/2/DM72vaW8XXHo3TSPZhHT46rJH8In8ygdUXGPL58qNn052PIiR7/E
 eygipSy8BSwAJaNyL3HRid4K04WCK1lspGGY5DooTVfKb1F+Pks67El
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_230635_717322_6DB48A53 
X-CRM114-Status: GOOD (  12.33  )
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Make the driver work on non-OF platforms.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/spi/spi-xilinx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index 4aa67fc61cb6..9fb1da2fcce4 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -405,11 +405,11 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 		bits_per_word = pdata->bits_per_word;
 		force_irq = pdata->force_irq;
 	} else {
-		of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
-					  &num_cs);
-		ret = of_property_read_u32(pdev->dev.of_node,
-					   "xlnx,num-transfer-bits",
-					   &bits_per_word);
+		device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
+					 &num_cs);
+		ret = device_property_read_u32(&pdev->dev,
+					       "xlnx,num-transfer-bits",
+					       &bits_per_word);
 		if (ret)
 			bits_per_word = 8;
 	}

-- 
2.52.0



