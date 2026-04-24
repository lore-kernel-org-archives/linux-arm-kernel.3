Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4E3FC0379
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPOav/iNJYdLnUqKhckbh7LqMdTVlkBXm9k5KvYujPc=; b=NsKLldqV0yJuKHxIeu5PT7Ettp
	relmE8AKb+NdyZhXqHcGfwTy/ZxW+7r+QjAU9B5NHzoc6mjR73UM7xW6xTt0qsWxLAUN9ytFaxBMq
	s18gLJk2kgRgGgzoIunrt9/USdoxvGlTde/C5iFtBOTs9UO23gtXWKVjlGsRZ5wfv/8DZnlYn/lnl
	tty1WF25z+UEBn7y/dS3XSG3hivW8mYDwiPdhYbjq6WdCqmJL2HELZrihS5JghNp4d4W9xSAzfx2E
	gOwLl1VVhQ5Ly1mJQuqB/qGE7kpL8518yPRVOGBpPRlJ9jWUTmR1gtmDnJoc7ImOKxoxsoOt5YctI
	H4/8lHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFmS-0000000DBuT-2ktT;
	Fri, 24 Apr 2026 12:37:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFmM-0000000DBrp-2xgG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 12:37:08 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86EDD19A8;
	Fri, 24 Apr 2026 14:35:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777034124;
	bh=WNOfl9TMJAgdQRS+Wl9stY3RrXYZyI6/gxecvU1FULI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t/y1yHCBELV34W5QxOrNf+WxZZnZbLlYZrKOZ1YknODDpEpAxEXqKSt98NYNAPY6V
	 PdhF60jzifFQU+6IXfE+gFthQ8dNmdVixKK0W5T/IY1FFA/UO18d0rGnN6rdvT3v+3
	 R1n+YjQ7u96RGL+t/afHfiDTGnKc4a1cjLZaANO8=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Fri, 24 Apr 2026 13:36:47 +0100
Subject: [PATCH v2 2/2] i2c: imx: Retry failed transfers 3 times
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-i2c-imx-fixes-v2-2-34fb9504aaeb@ideasonboard.com>
References: <20260424-i2c-imx-fixes-v2-0-34fb9504aaeb@ideasonboard.com>
In-Reply-To: <20260424-i2c-imx-fixes-v2-0-34fb9504aaeb@ideasonboard.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Gao Pan <b54642@freescale.com>, Fugang Duan <B38611@freescale.com>, 
 Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=941;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=WNOfl9TMJAgdQRS+Wl9stY3RrXYZyI6/gxecvU1FULI=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBp62PtXN02sS6E4D45jdY5YmHKbzszWjA9vdl+1
 JErMzAIA8OJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaetj7QAKCRDISVd6bEV1
 MtNrD/9Lgn0kR7oa/zXMFfKfupm9ABSsN51NPAQpnkTCY2La2De4R7O0JnAAS7lH6R78erTaq6U
 5pfv/DTr+bnBTZp5NxmkhDGWYrq+F+Ri4r2bjsfZZgAadxjfqO+MtK+Y+MAkaKiDsF2M1w/jhPe
 +f9rvykIGB9dBRKvLjYSO0OWnJkZ1SqSrIJPZUiM6grOpIsJvaWEv3UXVG3Dq/DpzWBbG71ey7u
 fgt1rpOR1vRSF94lT07m5gT6BPPz+OBjAV08evmR+lotp8GLVQbDwBZskHC4SkRzocHEULuJ29+
 /EgkQQFSgwL6lGirCb4GBI2e91HiQ6yQ3SnK8P2cGtBjhNkEgbolqP3X22ty+72eV3zOSPQRmeM
 E/MSTXfMcrIIShVRErM962IlJqMaPvV9lDwBPu9vOtEF6ksZtDKgXrKkP/iNdxiSnNFynAfbGmK
 tXJY5IfIrms5qK11OoUHkjTZQKyIxk3T82Xcz5ynfeegOpbAh8sRFowZIoUdCIUMZB/RyCu4ExX
 SJGOcYfW1OTi2FiC+BYONVMcO+xKqlcOef+QXfSamnmBLY913sGGnXLx8F7b4MnivaphOnyTtdu
 XrDvlSZvbKyqhtb1pZj3qPbpKPQvbMxtHQAHrke58VKybqXEqOFPm83MsbRg5vUkBznsrKLF7bJ
 Cvp4jwLqwaq5ntw==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_053706_891911_1E84BA85 
X-CRM114-Status: UNSURE (   8.30  )
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

Set the retries member of the i2c_adapter to 3, which will cause the
i2c-core code to retry transfers that lose arbitration 3 times before
giving up.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index b68a0f7105682006bbcfee52891c9a9c2d8c009e..e70e64cc633ff1e13dc61920c0c7960fb6a02622 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1749,6 +1749,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	i2c_imx->adapter.dev.parent	= &pdev->dev;
 	i2c_imx->adapter.nr		= pdev->id;
 	i2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
+	i2c_imx->adapter.retries	= 3;
 	i2c_imx->base			= base;
 	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
 

-- 
2.43.0


