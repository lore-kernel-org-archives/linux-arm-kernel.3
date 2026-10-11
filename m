Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADD3CA9EC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 06:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XlPPE6ZZY5T3PHV8A3Y8GqCesIvtKJSCm08ZYgXZh9o=; b=dDIdW7XXjdG6Dn08rBsD03wbVz
	PEEEo7l71c8A6/Rv6VPrsdrmYsgguSdzw0or7X4owkvuFB9OVMUMzl2cLXX0RALBtVpoNpFfa5SKE
	Nt195/FdTfKXsUFpl6IuFYMfjgQvAR3JqHmt0dSslMdW7WK/LVz3YfqhuBQiH3Rsvof5OnVxd4Iz9
	cok/w1/qEVYWuenzZtOEjAAhaGTDC+83KquGrNsTTNInn7gR7y5pcl8/KFmLXRuzjc1/EXffER2jS
	r2nkaEXdW4lAJEtXvuV6QUzo2AA2vEpup/kNp5ZfMkUxEsrhraQxnkn0BoPAfsKYGjwe5JNKLwGV8
	Z4nGtYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFmt1-00000008kxL-1iIl;
	Sun, 11 Oct 2026 06:18:19 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFmsx-00000008kwx-3ZY6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 06:18:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Xl
	PPE6ZZY5T3PHV8A3Y8GqCesIvtKJSCm08ZYgXZh9o=; b=Ip664CDl9k8ge8BOcr
	Bk3pQIeHiS32Bi5f536z8MaYRmAzm9HycFVee37BNUm68+38atxAHIk3lXRY2vZh
	+mRtUi8iYiquxQuJzmgMU5Gzs1uF6c2B64aLBYBFncA784mkx9YZiMGGMgNgMpl7
	KGvxn//yRvb+Jr7pVJbaYU5wY=
Received: from ubuntu.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDHjyr0KctqdBPSDg--.48609S4;
	Sun, 11 Oct 2026 14:17:33 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: antonio.borneo@foss.st.com,
	linusw@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	andriy.shevchenko@linux.intel.com,
	fabien.dessenne@foss.st.com
Cc: linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make_ruc2021@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: stm32: Fix fwnode reference leak in stm32_gpiolib_register_bank()
Date: Sun, 11 Oct 2026 14:17:22 +0800
Message-ID: <20261011061722.3159941-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHjyr0KctqdBPSDg--.48609S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4DXFyDXw4fuF15CF4rZrb_yoW8CryfpF
	W3Kr4YkFs8XrZ0k3yUAw1Y9ryagayxtrZxCF4Iy34fuFn0yay7Xw45uFWSvrs0kFWxXwn8
	tryUJay5ZF1DAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piGjg7UUUUU=
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/xtbC9R0XImrLKf00YAAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_231816_390902_D50738C3 
X-CRM114-Status: GOOD (  11.60  )
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

stm32_gpiolib_register_bank() walks the "gpio-ranges" property with
fwnode_property_get_reference_args().  As documented in
drivers/base/property.c:

 * The caller is responsible for calling fwnode_handle_put() on the
 * returned @args->fwnode pointer.

The returned reference is never put.  The function calls the helper
twice, once directly and then repeatedly in a while loop, and each
call overwrites args, so only the last reference is even reachable
and all the earlier ones are leaked for good.

Put the reference as soon as args.args[] has been consumed, both for
the initial call and for every iteration of the loop.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: bb949ed9b16b ("pinctrl: stm32: Switch to use for_each_gpiochip_node() helper")
Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 6a99708a5a23..93127da05d56 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1666,8 +1666,12 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode
 
 		/* get the last defined gpio line (offset + nb of pins) */
 		npins = args.args[0] + args.args[2];
-		while (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, ++i, &args))
+		fwnode_handle_put(args.fwnode);
+
+		while (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, ++i, &args)) {
 			npins = max(npins, (int)(args.args[0] + args.args[2]));
+			fwnode_handle_put(args.fwnode);
+		}
 	} else {
 		bank_nr = pctl->nbanks;
 		bank->gpio_chip.base = bank_nr * STM32_GPIO_PINS_PER_BANK;
-- 
2.43.0


