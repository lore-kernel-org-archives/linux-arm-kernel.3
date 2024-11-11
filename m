Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F00D3ABDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 17:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Okwg137E+WmcLluBLQ6H9l9KczMVszee4vGZWHXW4w=; b=SSaWSJp5vKKmfmVI1NmEZyhBux
	Ga00d+8hqpp5bk5RAcKmeIKzrZ8qz+b1CVyj7FaWmYa+nPBD4V9hw7b3enms5dmfngmO/pW1lgJ4R
	Lo3MJwk5f1IJ9xsSvVxZhjPflk67IJiq1pr6AbURHYtgvuxDPoUMOHiVqlbvcf+LVg6V2YRrgKfHC
	bqW9ulVDFreabN3mRhZN3+GhIImJmcog5h1Nb4Pnp3YcKSLChlq80ZusGcQ4FZE77IAbPH0lj90Dg
	7vINaWJc8DwhxSDakhSQvTzgcrh3tpOHt0fxUwequniya4vRuFi04u8p8UUokbGCtk405LqnEewFn
	9R5qfpiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYfa-00000000nse-0DIo;
	Mon, 11 Nov 2024 17:57:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYWp-00000000mGf-0PjR;
	Mon, 11 Nov 2024 17:48:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8ACAAA417E6;
	Mon, 11 Nov 2024 17:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E462C4CED4;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731347318;
	bh=9AGnp6ItSWGEIvcEPYHznGFKAqdl+UeCsmI5khCjdS4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c2yPXxfUHlgwnZrp7qGKCLwqQZc+L/+2ddJpo751E4RCy8EIs4Ij7Ka8P3CxN0rgM
	 JV0JkMFh83ttQ4ajP/K3Q87yt+g5CZWBQOxj8AAE0SBeXg6T4NHcHE3Gb9bybL/smS
	 uPpgH6DjmDqUljRvBXspip4Pc9w3ocTEseJn4X9indc3hcj/s/jdwoGWT+l5TruKrx
	 sUzNvn3eLVILCLlS+ImDoqSZa5Iv7xX5k8Q78jUk5BhSGh3M0+tf2nozGfxZ+Y9CG0
	 +2L/1YOD6Ul71mcvdcHaYeGyAHaIvVAiXaUYUzh7pA4PMa5wbuU40lwG1LL9h0ejxp
	 +vxbc+hVknnBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745DCD3ABDC;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Mon, 11 Nov 2024 23:18:34 +0530
Subject: [PATCH 5/5] scsi: ufs: pltfrm: Dellocate HBA during
 ufshcd_pltfrm_remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-ufs_bug_fix-v1-5-45ad8b62f02e@linaro.org>
References: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
In-Reply-To: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Mike Bi <mikebi@micron.com>, Bean Huo <beanhuo@micron.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Luca Porzio <lporzio@micron.com>, Asutosh Das <quic_asutoshd@quicinc.com>, 
 Can Guo <quic_cang@quicinc.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Peter Wang <peter.wang@mediatek.com>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Santosh Y <santoshsy@gmail.com>, Namjae Jeon <linkinjeon@gmail.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=858;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Ni+UMeWf+BGon+9C+5L79ezS+b3LAVE2IIekW3iQ9ww=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnMkNz9MkYBdX398GAmfAQsbBw3ppRcumSjtutx
 sOoQ3zoTZSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZzJDcwAKCRBVnxHm/pHO
 9VkjB/49ADTQJu1nV/d8/ynBuBn+ItayJXBzyHg85nSVkxMlnER5vFjUX6+uT2sZalqVXL/QI8o
 3OX7c+Wq8TTYC69nVWpjgtcBWy0B/ppoGuhVdk62pN1guua37AURco5SSqzjrJCBheHwQJkTa+s
 uIoNZuFlJhQT/wAUu/f6zmX6aMToz3Cz4NLYPC3mkyhLlZQ2CMY7lvqpRmVpFkGb8EZVcOc1RP6
 q1BB36FdG4dvO5e3jqx/ALyfnfapbycjFzXYZHXu9CNyUlesnt/Eglfz9XvclcQIzpgusXtqRxW
 3+zVfvcoGPZP1DfDfFedH8LuL2Ykimb6v6PRL7/ry3dN066b
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_094843_363583_B49D5AB1 
X-CRM114-Status: UNSURE (   9.88  )
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
Reply-To: manivannan.sadhasivam@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

This will ensure that the scsi host is cleaned up properly using
scsi_host_dev_release(). Otherwise, it may lead to memory leaks.

Cc: stable@vger.kernel.org # 4.4
Fixes: 03b1781aa978 ("[SCSI] ufs: Add Platform glue driver for ufshcd")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufshcd-pltfrm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index b8dadd0a2f4c..505572d4fa87 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -534,6 +534,7 @@ void ufshcd_pltfrm_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(&pdev->dev);
 	ufshcd_remove(hba);
+	ufshcd_dealloc_host(hba);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 }

-- 
2.25.1



