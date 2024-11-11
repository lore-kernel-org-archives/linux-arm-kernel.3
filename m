Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF83BD3ABDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPXChQtKvaQ6iLw3YfPfwlBuinAY1ycTD3ULqLXD9mg=; b=aKgdmwZD0FMzAKbKS8xOmmWiTG
	AM1xhum118l7CAmVTWiE6setOkPfkDHY0vGotU+j1ki3IMXTyy7trag2UHnWuceBjHW07GkhYgdeC
	1hIuce4rzcLWA56HFBuPiev6O8guiR5UTgiI15V8A3eBkoyE47XwPwBe3AqUUXo8yjW49+0r6uEbE
	6DCUCUroeQf5/VJ45gzYokhskUek8Pz6MlU7u6BNCaNyN0nUcpfjQEUCMLvNyzEvVPoVz2b1Z7Aid
	WCSXLD9Ok+s1QCXDWha1xnMIm+L+iGNKk4RHpgZGp7SbxxYFlRafvuLEQ5GqvGeFABJcAPsxhQ27X
	UO/aDqWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYc5-00000000nKy-0w51;
	Mon, 11 Nov 2024 17:54:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYWo-00000000mGb-4BqO;
	Mon, 11 Nov 2024 17:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19BDD5C5BDF;
	Mon, 11 Nov 2024 17:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28C54C4CED5;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731347318;
	bh=G69FHYexPwpw/irD51I+oJah3BCb6iFaLGhHwlC23Sc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C0C9bmDUJRRt3wJShhZ/CieKiCh5u0nABPCkvnDz8pS8l+fmwfewTXgapxgC5xugY
	 ZdOeu2hOBqVt/SQ57N8KR68elYetPbhdOvFDNOTlSVwXKPz+Z1TZiIM6BpINDMp3Sb
	 6CTgY+7UkK2o7yYOpahHvnyPF7eUNuACqUStjDsnYCzLl+VxoySmVeOhv23/MzMgkL
	 fHFL6VDhNIQGjbdARxv4//iGhgeTtJ2KiAQNVbZnY4/a7mWoxy4BlQamWmzJAO5+qb
	 0QlXzFvU3ioPxVKSIrpJ/0Xp+uoJJLgxcpAwCgOzlfcdRLo0GlvV3en2rM5z4R1mvy
	 sjcOmwxV41YUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CA0D3ABD8;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Mon, 11 Nov 2024 23:18:30 +0530
Subject: [PATCH 1/5] scsi: ufs: core: Cancel RTC work during
 ufshcd_remove()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-ufs_bug_fix-v1-1-45ad8b62f02e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=DVIcv3/NWxzqjqTgGie8L2Gx0Ep0Cnv9hngTv71tWI8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnMkNyuWNNeuyqHW6wHJWBMDDSw07Unxl6usmOR
 ufHW4bxRbuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZzJDcgAKCRBVnxHm/pHO
 9T95CACMdtOCvpWHJK1lxW2m+V6GbLEuNbAD0lZ2wBw1SXofplwVCWGJdvi40XW/5/caHDa4p3V
 8cl5LFsw29z6p0n6ZwMC4Fl2nQjs3S8M+frDwLyelMKBvzuuhqIKf1bp8oJZC8e8q7I3i/+hBbc
 g0a3GvGZaTFNACN7v88ROg0J9CvhylTTeAWC5gTWLOF/dIr+6AUP+8VTPa9v+zTeGaCibMJvN0e
 P632FxzWqbrUCP6X/NUCeptORHwrSlkmUtMK3pLku6vxzQRpDtM1l/S4o8ktUdVsglUmtXnzCNW
 Ix2pNkxM4jEkVNJqrZ9ceWl40kPLs2qa2Tg09M7wbBDHLane
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_094843_254002_39A6F63A 
X-CRM114-Status: GOOD (  10.37  )
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

Currently, RTC work is only cancelled during __ufshcd_wl_suspend(). When
ufshcd is removed in ufshcd_remove(), RTC work is not cancelled. Due to
this, any further trigger of the RTC work after ufshcd_remove() would
result in a NULL pointer dereference as below:

Unable to handle kernel NULL pointer dereference at virtual address 00000000000002a4
Workqueue: events ufshcd_rtc_work
Call trace:
 _raw_spin_lock_irqsave+0x34/0x8c
 pm_runtime_get_if_active+0x24/0xb4
 ufshcd_rtc_work+0x124/0x19c
 process_scheduled_works+0x18c/0x2d8
 worker_thread+0x144/0x280
 kthread+0x11c/0x128
 ret_from_fork+0x10/0x20

Since RTC work accesses the ufshcd internal structures, it should be cancelled
when ufshcd is removed. So do that in ufshcd_remove(), as per the order in
ufshcd_init().

Cc: stable@vger.kernel.org # 6.8
Fixes: 6bf999e0eb41 ("scsi: ufs: core: Add UFS RTC support")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/core/ufshcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index f5846598d80e..cc2555333512 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10225,6 +10225,7 @@ void ufshcd_remove(struct ufs_hba *hba)
 	ufs_hwmon_remove(hba);
 	ufs_bsg_remove(hba);
 	ufs_sysfs_remove_nodes(hba->dev);
+	cancel_delayed_work_sync(&hba->ufs_rtc_update_work);
 	blk_mq_destroy_queue(hba->tmf_queue);
 	blk_put_queue(hba->tmf_queue);
 	blk_mq_free_tag_set(&hba->tmf_tag_set);

-- 
2.25.1



