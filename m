Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8105ED3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 17:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWg4o1fSag5CPkLJL8QjYA2cB+he/rMzoNvj7WSilXA=; b=yYCqSavPVgDdcD+oI//6G+NixB
	+nn4f0DNc2XX1dGbkAGrhD/h0uy8KDJvXWS5ZodDRaobYIxWmfyBJNtWeoswWBhpiRylLf+aGbiRL
	vi3ON0OcWXjGjYxoAyLK/VKIexPSEMQppGfWfVA8ws33Z0h9mr78RtifJ1e03x3ODHzuvbOmWAsku
	Q8v8OJwOA2ofKzvLlBgPjxNVg6+208EP3EZtyDvbRCUFdkD4uLKOeUyYs1iqyyRD7BO6zSEnz0akC
	oBqxJZCx/M9L6KdSvLDYcVor+T8vZkKp0zmANdRvYeUQqt5R1hGqrNpbnh4d6T+kY3OZGBC6P0Nv2
	ecD17nlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYdp-00000000nan-3YUG;
	Mon, 11 Nov 2024 17:55:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYWp-00000000mGc-0049;
	Mon, 11 Nov 2024 17:48:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 427F2A401A5;
	Mon, 11 Nov 2024 17:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BD31C4CED7;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731347318;
	bh=fuQ00GAi9j38VTJ+Mk4loS5qcVMhkxws4U8+NkGhafM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IJKSMR23utkGbtJsEmrf3ChMvfo7qg1qtUzv5kPI1oEcHbSDuTrcSy+QB0oN3imyd
	 6V2ZtWKHMYKU52mDsFWkLGTO2sHibSXgRRaEDO9UGrKkb7oK9dc2KIvvX8DO3F5jxC
	 NFUGAluwBDdaE7X1nR1f7tjBBlGuPjUOF1nhPl7mFrQmGQEg0yQ/t7rOMQbt91iQNb
	 ls2MeMG3f0vLOPoVlXcG/66lDtsAJK/2GRLPF5fCO/lXeelnGK3OqIu7Yim9+BUz7Q
	 KQt9E1jg7uP/1EzUQmZrsmx9ml/ahUduvJs9IO+Celr7MBtm/KncaYRp0TPsB8d5gB
	 KamMRcYIOokEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C932D3ABDA;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Mon, 11 Nov 2024 23:18:31 +0530
Subject: [PATCH 2/5] scsi: ufs: qcom: Only free platform MSIs when ESI is
 enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-ufs_bug_fix-v1-2-45ad8b62f02e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=EbvyeMTjnnXzYsrb6hiWc8REw/zP3a1kZd0DUfTawxw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnMkNzWH2qACCnRiu+0ZVgDwFBCU0StL7JZgEET
 u7l9pbT9CSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZzJDcwAKCRBVnxHm/pHO
 9S7JB/90TEoS/+sDZO0X0MjP4rilFN/QiPGEBYP/qeEnMEreebOIEx2KZBTyGtPoSlH0U11whee
 h/cQ4BaWi8qJs7uxTqoKKez1yUb2SynV7Xdd2KNrBAl1cdbbKsCE0Se33qic7aRVq7Nooh5mcAQ
 hGW6jj2UyKiNeTsdwsaYTIMx2Jde6PpwKv90WjQXQxunrwVt/yv3+o0/CJObO4HXIBZy9n4f0Cv
 OwaEBqBG3UdbwwewFV22V93QQ2gn5pS+WQnQiS3G6aM78r2N50xoSWOLQEN2Q4iIYH5bpMNR4TE
 f1m2EtfA79wWzq2cuV/irM5AZmWRP3LqXGP9NZApfm7jXMzT
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_094843_318024_BD4CFBF1 
X-CRM114-Status: GOOD (  12.36  )
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

Otherwise, it will result in a NULL pointer dereference as below:

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
Call trace:
 mutex_lock+0xc/0x54
 platform_device_msi_free_irqs_all+0x14/0x20
 ufs_qcom_remove+0x34/0x48 [ufs_qcom]
 platform_remove+0x28/0x44
 device_remove+0x4c/0x80
 device_release_driver_internal+0xd8/0x178
 driver_detach+0x50/0x9c
 bus_remove_driver+0x6c/0xbc
 driver_unregister+0x30/0x60
 platform_driver_unregister+0x14/0x20
 ufs_qcom_pltform_exit+0x18/0xb94 [ufs_qcom]
 __arm64_sys_delete_module+0x180/0x260
 invoke_syscall+0x44/0x100
 el0_svc_common.constprop.0+0xc0/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x34/0xdc
 el0t_64_sync_handler+0xc0/0xc4
 el0t_64_sync+0x190/0x194

Cc: stable@vger.kernel.org # 6.3
Fixes: 519b6274a777 ("scsi: ufs: qcom: Add MCQ ESI config vendor specific ops")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index ecdfff2456e3..1bcc538ef8af 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1843,10 +1843,12 @@ static int ufs_qcom_probe(struct platform_device *pdev)
 static void ufs_qcom_remove(struct platform_device *pdev)
 {
 	struct ufs_hba *hba =  platform_get_drvdata(pdev);
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 
 	pm_runtime_get_sync(&(pdev)->dev);
 	ufshcd_remove(hba);
-	platform_device_msi_free_irqs_all(hba->dev);
+	if (host->esi_enabled)
+		platform_device_msi_free_irqs_all(hba->dev);
 }
 
 static const struct of_device_id ufs_qcom_of_match[] __maybe_unused = {

-- 
2.25.1



