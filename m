Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4984CD3ABDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 17:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aLaeXdYA8Tifno2xkiLCPGQlN6waci0Dwn7kcxqgAN0=; b=cDPVJyUnlW2RRAUJ+/P37+ndfR
	Vi5UU24pTKKgXtcbqBg7hVm5mFTV/+r7i4KMChNd2aVbkLl5C5UVEsuCbHQTCd6pTgFN70uibO9Z/
	bW6I1zGB3nnG8TFiE/op/RQIogeT8T6alVlfPq8kvxsNwMdAKRF/7Aum0PQIwrCW1LI7L6X3Ev7Xx
	mYOhRLQnEB21VzGYXynn+e6dpRP9pqWAhqjwGi2XjZgBXBz8BMfKngaBG7EsiFai+/Y0d+FcP3B3S
	8tybRxm3tqizSn63MjZUuu5B1Kz+qx7tWOGLgWS8wOZD5bwcggM/1Yys7bUIUGfiBkAMgSCNNweJv
	aEXf7Agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYaL-00000000mxk-186t;
	Mon, 11 Nov 2024 17:52:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYWp-00000000mGa-017g;
	Mon, 11 Nov 2024 17:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 013A55C5BD9;
	Mon, 11 Nov 2024 17:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 143CEC4CECF;
	Mon, 11 Nov 2024 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731347318;
	bh=Y+khpFiawXKLU/+l8e747ZP6KaaIIh+gTXQA+EIkgkY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gfD79ezbyqAT5rvKeu/bcNk+MqWjLhBgv82QIF/tIbz1tWRuHXO2hqhXMblEdVPjh
	 uLWSskpTn0NmbCS8ovAvPJNwmOCD+sEvFuY5H39CXkmtdFWd5YC2nEieNxQRc/I99o
	 U7IQ0t8lfGL6a9x7XtdAvZul3zH6DbCJ4SHk4BNHxN4qMgByWrPQNh+GNmgGwLVMFW
	 5kFUqPoQTKfdsOEBglpmjDw8gP+n70gDwcBkSKANJClp4+04sSwRjT77we8vHjhqgq
	 0YvS2zBf6EmIbdDpX54lBKmW1z/IT8syb8Ns1cZ4VY6Zjr0qNNt+7l5WToJMnaGMYb
	 cYYNgkm1oOPEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3C7D3ABD9;
	Mon, 11 Nov 2024 17:48:37 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH 0/5] scsi: ufs: Bug fixes for ufs core and platform drivers
Date: Mon, 11 Nov 2024 23:18:29 +0530
Message-Id: <20241111-ufs_bug_fix-v1-0-45ad8b62f02e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG1DMmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDINAtTSuOTypNj0/LrNA1SzE0TzO2TExLTDRRAuooKEoFCoNNi46trQU
 ADEBy810AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=Y+khpFiawXKLU/+l8e747ZP6KaaIIh+gTXQA+EIkgkY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnMkNyVRymijja4WYsMTq3UufBBioidTEf49F/G
 g6j4UfgEmiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZzJDcgAKCRBVnxHm/pHO
 9d0jB/449IToaB9ZcYdJONBd23MdNRpN9XTjoQ3UaKzzkCrBwemdD8ACugH5wLUaPzsStvYYt3C
 6oYkky5KzIlqwZMoQVr4rSs7t0C+05tD/fKah7PQkWE2sWw6qy5weu7aZdzMMLT4eewC1jVW+OJ
 6sDx7OKs23eLysMs5PpefkS/XDYDkowgBvPz0f1E11UQDoA4Ra1Wd84CkcdyqTh0XDMC0EV4D0p
 fGBOBK0Tpegsz2LI686Q6vrLJQBtn6pZNWAx2GHhNxEGbg97Rg5kF/7FtcnvVdgcDc0CDrxeyOu
 HAIwSVg9lV19dgsYP/y7m/iTY4qce8LrwLtHgy5oTwjONKG5
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_094843_236165_E112F376 
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
Reply-To: manivannan.sadhasivam@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

This series has several bug fixes that I encountered when the ufs-qcom driver
was removed and inserted back. But the fixes are applicable to other platform
glue drivers as well.

This series is tested on Qcom RB5 development board based on SM8250 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (5):
      scsi: ufs: core: Cancel RTC work during ufshcd_remove()
      scsi: ufs: qcom: Only free platform MSIs when ESI is enabled
      scsi: ufs: pltfrm: Disable runtime PM during removal of glue drivers
      scsi: ufs: pltfrm: Drop PM runtime reference count after ufshcd_remove()
      scsi: ufs: pltfrm: Dellocate HBA during ufshcd_pltfrm_remove()

 drivers/ufs/core/ufshcd.c             |  1 +
 drivers/ufs/host/cdns-pltfrm.c        |  4 +---
 drivers/ufs/host/tc-dwc-g210-pltfrm.c |  5 +----
 drivers/ufs/host/ufs-exynos.c         |  3 +--
 drivers/ufs/host/ufs-hisi.c           |  4 +---
 drivers/ufs/host/ufs-mediatek.c       |  5 +----
 drivers/ufs/host/ufs-qcom.c           |  7 ++++---
 drivers/ufs/host/ufs-renesas.c        |  4 +---
 drivers/ufs/host/ufs-sprd.c           |  5 +----
 drivers/ufs/host/ufshcd-pltfrm.c      | 16 ++++++++++++++++
 drivers/ufs/host/ufshcd-pltfrm.h      |  1 +
 11 files changed, 29 insertions(+), 26 deletions(-)
---
base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
change-id: 20241111-ufs_bug_fix-6d17f39afaa4

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>



