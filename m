Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D2ACDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zOV3EIEbUv2wKwHT0vmcNIiUJ7ImPmUSNiXHIKwPiIg=; b=hU8kRoBESdUlRNXktJLj0wnLc7
	ZCL97+w+wkfSpNiYQ2Vz2sewbCBX6uytJog0X9m0yLYOL3bDhrG8q+fKxUNnEpnGwwqlKjALxveaL
	B8BbNPRtazOuiIJqRhoF0jau4Owo/V+Cj/pp2kN9WKUDGyqW98x1n2TU7ZNLx8EXIM1e6jKxD5C/Z
	1ptk4F4Ilyl0e1VKuLwHXflD5tmwmDPU+wAnzZHu/Qe3YYbQW0tm9AB8Se8LSNG+c91/rNxwFe5mP
	H6Pr0M1hmw9OHIL4EaqQG2QjPjXA8bxQsiqR0sImea/IEvlCkTZCJIokbrgxWHF2+3QNwrbGL+/+0
	nXE2vJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby5q-000000064GG-00y3;
	Tue, 23 Jun 2026 10:10:58 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wby5m-000000064E4-3gL2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 10:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=zOV3EIEbUv2wKwHT0vmcNIiUJ7ImPmUSNiXHIKwPiIg=; b=pq+Qf6d/YRl/Lg
	vkzL7k5Z5iP7T4Dvw5CAZCJPEHzoXgAljXh6DkuG5m8TwTT13ZnMvYUIBAcVoBloUJP5cfNMthw6+
	6IV9wFbLdxX6p5qMMIdIiC5ShpcSaMHZnVjhbEe10S04rIlLmKdaV4h6c9o4qxcwj7BhtkB4+0hCE
	PRk2XQHfq0kOienM6/JqkJZasfDt82aFmvq0yv43qmP9XDVxqk69xaHX5GmYSzaU0cGp2uz2i9RQd
	XbsjIBt/12Kf6TxQdL395FFUSP5YLyjDHh9gB+6sLtwQ2WBsM93Jiooq1Kbbyv+zGF+YpKFlohLSv
	BBXUtADRzSRBrhnSJo2g==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wby5c-006mWx-9g; Tue, 23 Jun 2026 11:10:44 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wby5c-000000038gW-0Esy;
	Tue, 23 Jun 2026 11:10:44 +0100
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
Subject: [PATCH v2] usb: dwc3: imx8mp: make dwc3_imx_glue_ops static and rename to imx8mp
Date: Tue, 23 Jun 2026 11:10:43 +0100
Message-Id: <20260623101043.748359-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_031054_913612_88B5365A 
X-CRM114-Status: GOOD (  14.46  )
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
 drivers/usb/dwc3/dwc3-imx8mp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 1cf96540b66e..de8c17bc940d 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -158,7 +158,7 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
 	return IRQ_HANDLED;
 }
 
-static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
+static void dwc3_imx8mp_pre_set_role(struct dwc3 *dwc, enum usb_role role)
 {
 	if (role == USB_ROLE_HOST)
 		/*
@@ -173,8 +173,8 @@ static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
 		pm_runtime_use_autosuspend(dwc->dev);
 }
 
-struct dwc3_glue_ops dwc3_imx_glue_ops = {
-	.pre_set_role   = dwc3_imx_pre_set_role,
+static struct dwc3_glue_ops dwc3_imx8mp_glue_ops = {
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


