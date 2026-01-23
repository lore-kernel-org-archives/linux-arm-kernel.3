Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9D4D6CFBA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 03:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkiOTGthYXsjkhUeYJrOcXZXnSL0fCmN14NQXn0FZ/8=; b=fpDKjTvBz8QlpZbnxBLB4JeE3S
	wU0ZS11PeFTOrdi/As5oOOP90l2SXh0QkxIkGzCObPBJITa+fAvlYL2OFYDxO7Emokdbl8HeZZPoq
	gVMXycKMqD6qr4MF/5D8SObDdk1ml4Xa8vYDsRFoGKViUjNfixJhNVbBnN7cQ3IOiV90V5PmwD2Y3
	YJferxE21xHTdmXWkJTC7GgAdRyyLlrTLbsSHGuq4XXrsLTBNq4OZYF8U9TFJUpEs7+IJpu+zxVXH
	nBK/srZY+AgVThNqySnB6tQEGSCXAkaINxAQ273P8SEPMg7gOyO4rKAIo3H3oXtJ0nNZaB35eeU5f
	hPA4duqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj83G-000000088zZ-455U;
	Fri, 23 Jan 2026 03:41:38 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj83D-000000088wH-3ifm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 03:41:36 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 11:41:23 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 11:41:23 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 23 Jan 2026 11:41:25 +0800
Subject: [PATCH v2 3/3] pinctrl: single: unify pinconf offset mapping with
 pinmux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_pinctrl_single-v2-3-40f8063cc5a2@aspeedtech.com>
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
In-Reply-To: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrew@codeconstruct.com.au>, <BMC-SW@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769139683; l=1379;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=1vs5PnqoRJopA2dwgDUvGNiB2XTPfNa8BYVIucjFDdw=;
 b=Xp+BDMZ+3vaiU6jyDkaMScaJOdePBtsGF/KOHL1afJ3zopelMclYGGgwILAFD7hAz7G4wP5bN
 7jfPptDOS6oACgRrjZJDyiV6XJuUfdj59sGqewOponSW1LMKzgFcZAw
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_194135_931796_F503FD52 
X-CRM114-Status: UNSURE (   9.50  )
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

Use the same register offset calculation for pinconf as pinmux to
properly handle bit-per-mux configurations. Ensures consistent and
correct offset mapping for pin configuration operations.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/pinctrl-single.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index e65ae737b4c5..aaf830315c5d 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -505,7 +505,8 @@ static int pcs_pinconf_get(struct pinctrl_dev *pctldev,
 			continue;
 		}
 
-		offset = pin * (pcs->width / BITS_PER_BYTE);
+		/* Use the same offset mapping as pinmux (handles bit-per-mux) */
+		offset = pcs_pin_reg_offset_get(pcs, pin);
 		data = pcs->read(pcs->base + offset) & func->conf[i].mask;
 		switch (func->conf[i].param) {
 		/* 4 parameters */
@@ -573,7 +574,8 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
 			if (param != func->conf[i].param)
 				continue;
 
-			offset = pin * (pcs->width / BITS_PER_BYTE);
+			/* Use the same offset mapping as pinmux (handles bit-per-mux) */
+			offset = pcs_pin_reg_offset_get(pcs, pin);
 			data = pcs->read(pcs->base + offset);
 			arg = pinconf_to_config_argument(configs[j]);
 			switch (param) {

-- 
2.34.1


