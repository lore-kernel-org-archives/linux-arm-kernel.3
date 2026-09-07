Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4996FC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0KJSFaY8RpRUnGL7KM81yLVk3CH1pm35hqoFS3pUZkc=; b=X6QbKjIATL6gRU+84FzYaA/7DW
	5wUiZLXPBB7ZawqSdEHEYPTlFm5tbZzXfGrJ+DkIiV2Rr3wHx5lTY+UdSjxNfKMHBlecKG4IihkY7
	4uIEh9W8LuFWcHc5zZvwbGpHwwnLrD6b7cFMONoEIZAYAHn6NeCZqPG32auJ5hX6laXb1+vVzMBMG
	NCGMNehm+c/+/R2rPHAfOSAGY+A0KQ2zxQYw5WJ3lE+Kh6jRmr1WJXD0p5PFtP3MJK0LbrlcxIUra
	f3APui75njfrtmJYLGgAYrmZwgnoAuzEF7e4SqA/UUhPPiH3qkBP4Z75U6Jc7FTPAFEW3/QOTNf1B
	RTTsiHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cyQ-00000007SfR-0G5r;
	Mon, 07 Sep 2026 17:17:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cyN-00000007SfC-2D8J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 17:17:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A158D601FB;
	Mon,  7 Sep 2026 17:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BB31F00A3A;
	Mon,  7 Sep 2026 17:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788801454;
	bh=0KJSFaY8RpRUnGL7KM81yLVk3CH1pm35hqoFS3pUZkc=;
	h=From:To:Cc:Subject:Date;
	b=gTijYtAeZBeBB8iMo5FW02jkmvq2daebNWPf4uDIwRda/4XIRibxQA9spqKe7j4G9
	 N8+/eCCPZlOFJMakM1rQcY8sGbuG6EUo1PkG28IbD12JReDi6EMqFUnEi7xfwOOUvA
	 x3XQmQ8uzCUP73OsdpBdxXvFze6XPh+2+LTxYHoaif7PRKK5ElTHWkIGv622CszizN
	 kKJXlM6ymj68SmOXhTkDKpA+WXmNCJ3Yeq9QkMbZRu3GE+dIoMCmEGeTwqoAkyGx+X
	 bYrV7YzPKtgck6wRg32MYlymFqE0+tk9zll+2E+hjpyQnRDAQb1fp+Zu8vGpCXXv1e
	 SiFNHJya9lb7Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1x3cyK-00000005sy6-1G9c;
	Mon, 07 Sep 2026 17:17:32 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH] interconnect: qcom: icc-rpmh: Add opt-out parameter for QoS settings
Date: Mon,  7 Sep 2026 18:17:29 +0100
Message-ID: <20260907171729.1735641-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, raviteja.laggyshetty@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org, andersson@kernel.org, smostafa@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Recent addition of QoS configuration to the X1 variants resulted in
systems that spontaneously reset at boot time or under load.

Given that this is both very unpleasant and hard to debug, give the
affected user the option to survive such event with a module parameter.

Passing "icc_rpmh.enable_qos=0" to the kernel command-line will skip the
offending QoS setup.

Link: https://lore.kernel.org/all/apgeBNSiP01YfNcs@google.com
Link: https://lore.kernel.org/all/86ld9d4h4n.wl-maz@kernel.org
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>
---
 drivers/interconnect/qcom/icc-rpmh.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpmh.c b/drivers/interconnect/qcom/icc-rpmh.c
index 3b445acefece7..3a4743c364dac 100644
--- a/drivers/interconnect/qcom/icc-rpmh.c
+++ b/drivers/interconnect/qcom/icc-rpmh.c
@@ -224,6 +224,9 @@ static int qcom_icc_rpmh_configure_qos(struct qcom_icc_provider *qp)
 	return ret;
 }
 
+static bool enable_qos = true;
+module_param(enable_qos, bool, 0660);
+
 int qcom_icc_rpmh_probe(struct platform_device *pdev)
 {
 	const struct qcom_icc_desc *desc;
@@ -308,6 +311,11 @@ int qcom_icc_rpmh_probe(struct platform_device *pdev)
 		struct resource *res;
 		void __iomem *base;
 
+		if (!enable_qos) {
+			dev_info(dev, "Skipping QoS (command line)\n");
+			goto skip_qos_config;
+		}
+
 		/* Try parent's regmap first */
 		qp->regmap = dev_get_regmap(dev->parent, NULL);
 		if (!qp->regmap) {
-- 
2.47.3


