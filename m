Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918E5CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 05:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=52rSbGD7/YbNpe2MhAb5r8wssT2bAOg9X9IsJjeZDuQ=; b=w6xy1jKY04sa0Sjv5fmhnR5q1F
	iYLJdvSSt+14xUC5ldoRnB+FMtuJQl13YQ2XNxWw5+FbEDPXJv72hAHkqxoft9tqHXZqoOR1Ac4jA
	VG3F0GtuydgXM0sK9NBsdfMmCaeBEP/xYn1JMCQz+HXxs//nzZcJsm57ms64XgTXPI5IhCaI1jEcP
	oK2VKqw/2000KRx05E+HgtNJVf4I2vYpqquUMyCyeuHaNKBMOvLAy7vYxdPjR3bTjt11Q07ixbFDt
	Yi+O+4lYSzAlYV/9c4eIEVO4iXtqbwQtut8Xbz8IXR+b6u901oJlZ6s2Ce8bc2sL6ETx3cquo4rEv
	eCdQ357w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGcB-00000007CTE-0Iap;
	Wed, 24 Jun 2026 05:57:35 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGc7-00000007CSm-1sGU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 05:57:33 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADXwajIcTtqXSqtFQ--.64136S2;
	Wed, 24 Jun 2026 13:57:28 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH] usb: dwc3: st: Propagate reset deassert failures
Date: Wed, 24 Jun 2026 13:57:28 +0800
Message-ID: <20260624055728.46078-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADXwajIcTtqXSqtFQ--.64136S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ury7tFW5Gr1rAFyxur1fCrg_yoW8ZrWrp3
	y7GrWSyry09rs3Ja1fAF15uFyruFWSqFWUG3y3Kw18Awsaq3yDtryYkFyrJa4DJFWkAryU
	CF4UtF4rua9FvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnGQDUU
	UUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_225732_299883_B4A403BF 
X-CRM114-Status: GOOD (  10.10  )
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

The ST DWC3 glue driver treats the powerdown and softreset reset
controls as required resources, but ignores reset_control_deassert()
failures before populating the child DWC3 device.  Resume ignores the
same failures before returning success.

Check the deassert operations and unwind the already deasserted
powerdown reset if softreset deassertion fails.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/dwc3/dwc3-st.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index 5d513decaacd..bbabfd933798 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -242,7 +242,9 @@ static int st_dwc3_probe(struct platform_device *pdev)
 				     "could not get power controller\n");
 
 	/* Manage PowerDown */
-	reset_control_deassert(dwc3_data->rstc_pwrdn);
+	ret = reset_control_deassert(dwc3_data->rstc_pwrdn);
+	if (ret)
+		return ret;
 
 	dwc3_data->rstc_rst =
 		devm_reset_control_get_shared(dev, "softreset");
@@ -253,7 +255,9 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	}
 
 	/* Manage SoftReset */
-	reset_control_deassert(dwc3_data->rstc_rst);
+	ret = reset_control_deassert(dwc3_data->rstc_rst);
+	if (ret)
+		goto undo_powerdown;
 
 	/* Allocate and initialize the core */
 	ret = of_platform_populate(node, NULL, NULL, dev);
@@ -328,8 +332,15 @@ static int st_dwc3_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 
-	reset_control_deassert(dwc3_data->rstc_pwrdn);
-	reset_control_deassert(dwc3_data->rstc_rst);
+	ret = reset_control_deassert(dwc3_data->rstc_pwrdn);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(dwc3_data->rstc_rst);
+	if (ret) {
+		reset_control_assert(dwc3_data->rstc_pwrdn);
+		return ret;
+	}
 
 	ret = st_dwc3_drd_init(dwc3_data);
 	if (ret) {
-- 
2.50.1 (Apple Git-155)


