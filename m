Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EC4C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 06:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eB9zD81KQilmhdNesSPvpH9grlYSNJGlKfwnZysMtz4=; b=lBjKe6JOQ6LqqwLh5iWNqSfSwr
	krKZX1bYm8HpJo+6z2yPxXafoKBMUGOs83dz91klXhpAcQq7jKW0ferRteolLwaBJ02FRA016a1Uk
	MqNux24SjiLUaJ5BPF1iV5wigjRtcYUtYyInsamw6blgUXuBwXYXwKKQcmGQl8WCl6pmuQyfuF7jC
	Bqjxzr6JWG73J31lF9iSB3A1YO976VbXE155Pdcw5xaAOoZ6UJJ9bPnpL60pSnj5RtdrtuVB5SOQz
	M8Togb4+d0nRYHnDG5yPHhA0xt6YW23i+9Hyz4ZmCJPoD13F3M2Yv9RXeh/CEoTNwGMb8AoBwLtUx
	RAUg1zlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuNF-0000000HOHo-0OIF;
	Thu, 07 Aug 2025 06:45:13 +0000
Received: from asrmicro.com ([210.13.118.86] helo=spam.asrmicro.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuKi-0000000HOBc-2iHO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 06:42:39 +0000
Received: from exch03.asrmicro.com (exch03.asrmicro.com [10.1.24.118])
	by spam.asrmicro.com with ESMTPS id 5776g0dF041366
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 7 Aug 2025 14:42:00 +0800 (GMT-8)
	(envelope-from chizhang@asrmicro.com)
Received: from localhost (10.26.130.253) by exch03.asrmicro.com (10.1.24.118)
 with Microsoft SMTP Server (TLS) id 15.0.847.32; Thu, 7 Aug 2025 14:42:02
 +0800
From: Chi Zhang <chizhang@asrmicro.com>
To: <tony@atomide.com>
CC: <haojian.zhuang@linaro.org>, <linus.walleij@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Chi Zhang <chizhang@asrmicro.com>
Subject: [PATCH] pinctrl: single: fix bias pull up/down handling in pin_config_set
Date: Thu, 7 Aug 2025 14:20:38 +0800
Message-ID: <20250807062038.13610-1-chizhang@asrmicro.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.26.130.253]
X-ClientProxiedBy: exch02.asrmicro.com (10.1.24.122) To exch03.asrmicro.com
 (10.1.24.118)
X-DNSRBL: 
X-MAIL: spam.asrmicro.com 5776g0dF041366
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_234237_278252_CD572DCE 
X-CRM114-Status: GOOD (  12.70  )
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

In the pin_config_set function, when handling PIN_CONFIG_BIAS_PULL_DOWN or
PIN_CONFIG_BIAS_PULL_UP, the function calls pcs_pinconf_clear_bias()
which writes the register. However, the subsequent operations continue
using the stale 'data' value from before the register write, effectively
causing the bias clear operation to be overwritten and not take effect.

Fix this by reading the 'data' value from the register after calling
pcs_pinconf_clear_bias().

This bug seems to have existed when this code was first merged in commit
9dddb4df90d1 ("pinctrl: single: support generic pinconf").

Signed-off-by: Chi Zhang <chizhang@asrmicro.com>
---
 drivers/pinctrl/pinctrl-single.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 5cda6201b60f..8aedee2720bc 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -589,8 +589,10 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
 			/* 4 parameters */
 			case PIN_CONFIG_BIAS_PULL_DOWN:
 			case PIN_CONFIG_BIAS_PULL_UP:
-				if (arg)
+				if (arg) {
 					pcs_pinconf_clear_bias(pctldev, pin);
+					data = pcs->read(pcs->base + offset);
+				}
 				fallthrough;
 			case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
 				data &= ~func->conf[i].mask;
-- 
2.17.1


