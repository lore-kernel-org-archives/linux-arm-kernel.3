Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9E6D3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 18:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtcD4vDBdIEc6kqx9Lu6ty03JmOyslcZDRLkcEX0aQA=; b=xVVEqagRv6RKKBypLOWmfg6MN/
	LffSBLhWrhWE0meTsOeu/zxnvlWIwdz6sN5kvbkpw/uBJt5FCUyxoMRZxZh4pSFseQ6Wg7TwSsuW7
	AXtgopvY5ykdpfHSnKmHF4cDgyKZKsnZi2Btk2q82BmGmy7nA/JgozPLKJvZfsK3s+WgNkd7gAAaB
	4u7+w+O+Ii3NRfSGiBIpQHywinKME1m+MEiud/DgLxz45xNgsmhcVmUnAc5yIdx16+DcA7G010UXb
	Bl6yxdKHRHeJiDHNvGU0VBaQgWt+Bha4ry35Qol0ziyvcW1I58pE73r0QQN7CWkvysPbQRWaOQvrr
	XlT1RUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYj5-00000000oUQ-0FvY;
	Mon, 11 Nov 2024 18:01:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYWp-00000000mGd-0OoI;
	Mon, 11 Nov 2024 17:48:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 583485C5BE8;
	Mon, 11 Nov 2024 17:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 643CFC4CEDB;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731347318;
	bh=oDE7Z60Sda7MtMa9I9XNVVTr3fEGh1yrGGrVYaCcTKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RhG6k+OwUJC1t04TSz4zO7clZcsLk+DpR5jn7nvioxg06YPsK4iWc7sahrq8Nojv7
	 9ntUEWatyace+HXfuyaax4YvyNZ7h26d07FlcWa+DuJBYdBMV5fOjmcMFzUIcfFkN4
	 u25OJptbScTaVk0T7nIhXlm30rgVGG0UA1Oud0msyhRqH5oGHO3HsRJROFL/QCMFMo
	 TJfRzl5Q8PtablDqvQiRMYA+L2C76O3PejEgJ1wn/1E/5ReqM23pkiLSolPd/IVopK
	 nUcSl2xQMwNDRmcuIwOKAln0H2gkXy5k2Oa090ie7n7n1n0v5Fkv/CYL3IkMujzT2E
	 cv1i0UIsWz9og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F31D3ABD8;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Mon, 11 Nov 2024 23:18:33 +0530
Subject: [PATCH 4/5] scsi: ufs: pltfrm: Drop PM runtime reference count
 after ufshcd_remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-ufs_bug_fix-v1-4-45ad8b62f02e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3829;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=A6udAVAOGCzcxAfO6FoxgGhhFbo2oCHyG4WxttE28E8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnMkNzOShxk1jlTg40JZj4jvQfsj5GfK53lnNIi
 ZOY7wXm8qWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZzJDcwAKCRBVnxHm/pHO
 9T/OB/4sbcr9eWAA6RiaVVP/+LULxj5QJg3KHy4v2BNhRXeZOONM48cElO2R0XYZjzS27ZonXgh
 kgHDoLaBxehlHMSnxjlYr62Qlmu2LuKcjRD+O23Eo6yxjhvXyggQK6ed9XJkMPNabDFJwbQ69Kq
 OW+2NT539Mc6iR4H8uKZx1oTvEdgHjMxeDwWLOl17vpqLu1Ox88OILTTHeEl4KGqDLnUmddrV79
 Zzya0F92nny+pVesqZD3ro8KyzXMco+GIc+k2YTwQmPgn9CvLInsQzVKjGW94stZ8bRWcOYUmUu
 uZUBJLAza5JxTRgweA1wVS23jdCS6EdWIApaMfCASCOl+LTJ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_094843_312958_6A85842B 
X-CRM114-Status: GOOD (  13.74  )
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

During the remove stage of glue drivers, some of them are incrementing the
reference count using pm_runtime_get_sync(), before removing the ufshcd
using ufshcd_remove(). But they are not dropping that reference count after
ufshcd_remove() to balance the refcount.

So drop the reference count by calling pm_runtime_put_noidle() after
ufshcd_remove(). Since the behavior is applicable to all glue drivers, move
the PM handling to ufshcd_pltfrm_remove().

Cc: stable@vger.kernel.org # 3.12
Fixes: 62694735ca95 ("[SCSI] ufs: Add runtime PM support for UFS host controller driver")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/tc-dwc-g210-pltfrm.c | 1 -
 drivers/ufs/host/ufs-exynos.c         | 1 -
 drivers/ufs/host/ufs-mediatek.c       | 1 -
 drivers/ufs/host/ufs-qcom.c           | 1 -
 drivers/ufs/host/ufs-sprd.c           | 1 -
 drivers/ufs/host/ufshcd-pltfrm.c      | 2 ++
 6 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/tc-dwc-g210-pltfrm.c b/drivers/ufs/host/tc-dwc-g210-pltfrm.c
index 113e0ef7b2cf..c6f8565ede21 100644
--- a/drivers/ufs/host/tc-dwc-g210-pltfrm.c
+++ b/drivers/ufs/host/tc-dwc-g210-pltfrm.c
@@ -76,7 +76,6 @@ static int tc_dwc_g210_pltfm_probe(struct platform_device *pdev)
  */
 static void tc_dwc_g210_pltfm_remove(struct platform_device *pdev)
 {
-	pm_runtime_get_sync(&(pdev)->dev);
 	ufshcd_pltfrm_remove(pdev);
 }
 
diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 953103b69e2c..6dedcc8b22b4 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1960,7 +1960,6 @@ static void exynos_ufs_remove(struct platform_device *pdev)
 	struct ufs_hba *hba =  platform_get_drvdata(pdev);
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 
-	pm_runtime_get_sync(&(pdev)->dev);
 	ufshcd_pltfrm_remove(pdev);
 
 	phy_power_off(ufs->phy);
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 512b4e43787c..c834d38921b6 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1869,7 +1869,6 @@ static int ufs_mtk_probe(struct platform_device *pdev)
  */
 static void ufs_mtk_remove(struct platform_device *pdev)
 {
-	pm_runtime_get_sync(&(pdev)->dev);
 	ufshcd_pltfrm_remove(pdev);
 }
 
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 38732dd48331..91127fb17186 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1845,7 +1845,6 @@ static void ufs_qcom_remove(struct platform_device *pdev)
 	struct ufs_hba *hba =  platform_get_drvdata(pdev);
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 
-	pm_runtime_get_sync(&(pdev)->dev);
 	ufshcd_pltfrm_remove(pdev);
 	if (host->esi_enabled)
 		platform_device_msi_free_irqs_all(hba->dev);
diff --git a/drivers/ufs/host/ufs-sprd.c b/drivers/ufs/host/ufs-sprd.c
index e455890cf7d4..d220978c2d8c 100644
--- a/drivers/ufs/host/ufs-sprd.c
+++ b/drivers/ufs/host/ufs-sprd.c
@@ -427,7 +427,6 @@ static int ufs_sprd_probe(struct platform_device *pdev)
 
 static void ufs_sprd_remove(struct platform_device *pdev)
 {
-	pm_runtime_get_sync(&(pdev)->dev);
 	ufshcd_pltfrm_remove(pdev);
 }
 
diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index bad5b1303eb6..b8dadd0a2f4c 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -532,8 +532,10 @@ void ufshcd_pltfrm_remove(struct platform_device *pdev)
 {
 	struct ufs_hba *hba =  platform_get_drvdata(pdev);
 
+	pm_runtime_get_sync(&pdev->dev);
 	ufshcd_remove(hba);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 EXPORT_SYMBOL_GPL(ufshcd_pltfrm_remove);
 

-- 
2.25.1



