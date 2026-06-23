Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8699DCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 10:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U8DX8ABQ7qEn6eMBhQWfrDMVdr4PIabaB9tSDvLMkrc=; b=nRmStzZ9IqHHrv0hUXW+AmTTMG
	SrIIH4d+V3ifD2HCSWXfCUFbNlaSnyQl6NMcBXxrm5AN9+pXzy16/4U2dy2Khb8VXaEeOVcZNO4Xd
	aFHbTX1dxOrHYpcEDuqO43endBp/slmQUvwDYRdYhtYoE/N2VfpzmTfq2yyRtVDsdGxgD+j14P0L5
	3gaRbSzhOGUsbxsNkP9iB4x5BnR49bporoJ9cNFSee3eeREU/8VCx9iGYZhYSKukotJNjxUbwykT3
	GuReWtDz9cohQQW4JKvKQmKDl2Kl2ApOyrM2q/v1vBeB+Ub16Sglf7AmH+EUOEF76ew/XcwKdejiB
	zHAPIF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby1A-000000063cO-1b2i;
	Tue, 23 Jun 2026 10:06:08 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby17-000000063bm-3eQk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 10:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=U8DX8ABQ7qEn6eMBhQWfrDMVdr4PIabaB9tSDvLMkrc=; b=ylsiPimPOwKJiT
	5+gyQXzXVnqJ+2A9S9ECUPFMMs8HKRkw2Duw0HC3kcY5CNFVu5mOzakJ/FQUBN6gZAMPyvASbVqRG
	mSbz/6DPDZgxnTQlKmdu8cQ8m08whyKT7QkI4gMBKHGiPLPU8oZ++jLCuo8CROrwlkRlDMND/0W5g
	uPXhL+BfVAeQM2iILdEFfW/Ekio1hvyXqQdVJ8R6JtIKFObIIOdDTaKIuBMMI1ZQYOIlTbAAiHlo2
	0iJSW2mII1oof7pjYZdxTqMlbYtDA8KeF+i791o5KQcPmS9GSNXCWakw9AZADhArS3z3DWVZlRTTY
	xgZETfszf1ufcqDYmHeg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wby0x-00FsUA-9N; Tue, 23 Jun 2026 11:05:55 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wby0w-000000035EL-47kk;
	Tue, 23 Jun 2026 11:05:54 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and rename to imx8mp
Date: Tue, 23 Jun 2026 11:05:54 +0100
Message-Id: <20260623100554.735080-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_030605_905472_0C224B39 
X-CRM114-Status: GOOD (  13.78  )
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

The dwc3_imx_glue_ops is not used outside this file, and technically this
is the dwc3-imx8mp driver so whilst making this static to avoid the
following warning, rename it dwc3_imx8mp_glue_ops to distinguish it from
the other driver which also has dwc3_imx_glue_ops.

Fixes:
drivers/usb/dwc3/dwc3-imx8mp.c:176:22: warning: symbol 'dwc3_imx_glue_ops' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 1cf96540b66e..bc61a89b66b1 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -173,8 +173,8 @@ static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
 		pm_runtime_use_autosuspend(dwc->dev);
 }
 
-struct dwc3_glue_ops dwc3_imx_glue_ops = {
-	.pre_set_role   = dwc3_imx_pre_set_role,
+statc struct dwc3_glue_ops dwc3_imx8mp_glue_ops = {
+	.pre_set_role   = dwc3_imx8mp_pre_set_role,
 };
 
 static int dwc3_imx8mp_probe(struct platform_device *pdev)
@@ -266,7 +266,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 		goto put_dwc3;
 	}
 
-	dwc3->glue_ops = &dwc3_imx_glue_ops;
+	dwc3->glue_ops = &dwc3_imx8mp_glue_ops;
 
 	if (dwc3->dr_mode == USB_DR_MODE_HOST)
 		pm_runtime_dont_use_autosuspend(dwc3->dev);
-- 
2.37.2.352.g3c44437643


