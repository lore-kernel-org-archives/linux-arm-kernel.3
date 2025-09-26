Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD68CAC5BD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UG4uxZiojP11HfAzfNkD/+XG141vFfKemjKhOVKqMzg=; b=uF6PxZKwnD90owirnvT2ZfyTqn
	wQmxKN/rG4V216VVzqwMUXSWZ8TC7XyvQHUeHzjzELmW0IonUjH1pKQ2gDtFAzp3zlMs+jCo+BKpG
	WutvI7KQdeY/ZBk648nKXXijys3ttWuxu9ZJ1acadn8sbPLoxi+98OnU6jgud5uD5Kv1y6b5TITiJ
	gu2ZygNP2ipQXrr6qJ4MHaEg9NRUylsqz3VZZWD26dWXr+yOm223T+VSQ7MFSGi4rqrIohMpULgAc
	AAvFmTdL/EKAoA7WOtZ5Pg+k5CFZpHtQ4nkoaulfRusJ3Ezt6SA6wrCqKehz2OBpNQH0pC4xHS2Ft
	kn4PojaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2D2z-00000003Y7w-20IH;
	Fri, 26 Sep 2025 18:19:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2D2r-00000003Y4X-2Qxr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 18:19:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B2C8B45993;
	Fri, 26 Sep 2025 18:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F05DC4CEF7;
	Fri, 26 Sep 2025 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758910788;
	bh=lYVqTM5HGwA9Xf9f5r70Ei4he25vltCACwgM1SXxA1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=D8RvxJGN2EJb8fp2WswI1IxOP/pZOwR9SpLXITBjUXoKPP0zF7zYV7w/EFCmj09P7
	 SQo6pIc6LRr7CVALcT2z9Wzp6XC17QPLKSQoTdfPeHnPXhx7wtu81Lck0p2H1AwoKF
	 bDeE/ho2zKA4IyvMvLwgIuKeBG5CnpgCpQGOcHPPQuiFZ1PyOWWgUyfd2BPi5Q6iJe
	 aHJe7bon7UjqbdCNcM8vH0V6jTZGWjbbqtHGz0sBOzmJq/7vk4hlZcpowEPTQEl93O
	 ukg9iyFr0pEUQs1m/hKVC1iWpjZFLj3RXpKsIG0d5hJcSJQhsZMGDjVxiNFMjMhCXZ
	 8ujOt5mgX6rxA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C188CAC5BE;
	Fri, 26 Sep 2025 18:19:48 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Fri, 26 Sep 2025 14:19:42 -0400
Subject: [PATCH v4 3/4] usb: dwc3: dwc3-generic-plat: Add layerscape dwc3
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-ls_dma_coherence-v4-3-21e9c6bdb5cb@nxp.com>
References: <20250926-ls_dma_coherence-v4-0-21e9c6bdb5cb@nxp.com>
In-Reply-To: <20250926-ls_dma_coherence-v4-0-21e9c6bdb5cb@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 bjorn.andersson@oss.qualcomm.com, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>, Ze Huang <huang.ze@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758910787; l=2222;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=x/YV7GviRuKrxoFTMOltiDCmXq8scFHKV8v3SyDackg=;
 b=zZv6x5+g8lfoX1KRaaggYbBkew2o/+XvY0hrd96Jjw8UPPJxQY0NRQWt4cPlSUCLsW32ifK71
 nSDr3kZJ75IA3vYcn4qGZcMwlwp0IBo4XbvweePGgD892OhcCvN/iaI
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_111949_666209_834F6C0E 
X-CRM114-Status: GOOD (  14.55  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Add layerscape dwc3 support by using flatten dwc3 core library. Layerscape
dwc3 need set gsbuscfg0-reqinfo as 0x2222 when dma-coherence set.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
chagne in v4
- rename gsbuscfg0 to gsbuscfg0_reqinfo
- use flatten core's properties.

change in v3 (skipped)
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index af95a527dcc27a7a14d38dcc887f74a888ed91e6..cfcefeffd7ad6c0a21ccc9aaa4483b9acb9dc4e0 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include "glue.h"
@@ -29,6 +30,7 @@ static void dwc3_generic_reset_control_assert(void *data)
 
 static int dwc3_generic_probe(struct platform_device *pdev)
 {
+	const struct dwc3_properties *properties;
 	struct dwc3_probe_data probe_data = {};
 	struct device *dev = &pdev->dev;
 	struct dwc3_generic *dwc3g;
@@ -75,7 +77,13 @@ static int dwc3_generic_probe(struct platform_device *pdev)
 	probe_data.dwc = &dwc3g->dwc;
 	probe_data.res = res;
 	probe_data.ignore_clocks_and_resets = true;
-	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+
+	properties = of_device_get_match_data(dev);
+	if (of_dma_is_coherent(pdev->dev.of_node) && properties)
+		probe_data.properties = *properties;
+	else
+		probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+
 	ret = dwc3_core_probe(&probe_data);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
@@ -146,8 +154,13 @@ static const struct dev_pm_ops dwc3_generic_dev_pm_ops = {
 		       dwc3_generic_runtime_idle)
 };
 
+static const struct dwc3_properties fsl_ls1028_dwc3 = {
+	.gsbuscfg0_reqinfo = 0x2222,
+};
+
 static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k1-dwc3", },
+	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);

-- 
2.34.1



