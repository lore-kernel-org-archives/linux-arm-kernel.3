Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AE9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qkCj0ssMPm11qG6AeK/H9md/QP+Ow5ktlfNd4bttAYU=; b=m3ZTvwwzMfPziH
	Zj7QrMTBM64yTaANI9YGxsap3spVNGD53SPNp8Bu67wDuMrVMC3s+ynIDSmts/NfpTfuwSe5SlrzE
	vJ+OXSL2ZD/KM61//qqHXVb2IqoU0PDD49UNzqicBNmgZ33cKRC8YRv3bEohUdiaL8rilER1ZVwiM
	chcbf+sLut3BzX9hpGwxILjt/ShqNlo5nOXz4nQMLDhxinjYjdrpxBsXhgFFATqdcfPytkfksB63V
	8Vixi+pWuF45Rv0G0sPE+I5YAQN3LRQ5T3Eu5fZm5IBIEFKcR3QppMMJw0yMT6acvFzSfzoY1VjR2
	9MhvCssIQBYy8WFBLqrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFI-00000002dTG-0xWq;
	Wed, 01 Jul 2026 16:57:08 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyFF-00000002dR9-3d9T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:57:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 58AB84E40BFA
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 16:57:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B09B5FD9D;
	Wed,  1 Jul 2026 16:57:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98BE6104C948E;
	Wed,  1 Jul 2026 18:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925021; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qkCj0ssMPm11qG6AeK/H9md/QP+Ow5ktlfNd4bttAYU=;
	b=MPWi01YJ/a2z7k+SKa73J1razqKGCbFJjgW9wCVhWIoEpcZ1ohbb3OWPoms4pVfqMVxDAi
	h8Fc8spvRXuo9t00jWjYILUK7QMp2zlOe9AxtsFS1o+FFUe+OK2eM2/Uys5THU1C01JuRb
	fPdmys2wKVNo+uV8owlZu8nKEUdabBRvoy0LP6Vk+BXWniOc2pbffA8i/ltS1ebUrRz5gx
	zJCguZnHBNb6yveL8ABGuJqpUnVNxSilfFtoR7orrVEC247AEUo7B+Qy4OZfIiHOjH7wNJ
	nvqTQVn/JVU25Qk5TieiY1gwVTl+sdoPinwAulFpE/8DsQmoRAClamHIJpQxWw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: [PATCH 0/5] gpio: nomadik: silence boot log
Date: Wed, 01 Jul 2026 18:56:57 +0200
Message-Id: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrB1ILGjpVcRF1F87rSaS0VIQ7
 95ol9/ivZ0UUaD0yHaK+IhK8Ak2z6h7Oj+CpU+mwhSlqYzlcZHAPsyulzerTPArl9XdtQ6wuIF
 SuUQM8r2udfO3bu0L3Xqu6Dh+LRDl7HcAAAA=
X-Change-ID: 20260701-gpio-nomadik-silent-678abaee1e3e
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_095706_050958_708DEBDF 
X-CRM114-Status: UNSURE (   5.49  )
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

Currently, on EyeQ5, we might get those error logs:

[    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -EPROBE_DEFER
[    0.544274] nomadik-gpio 1400000.gpio: could not populate nmk chip struct

Then on successful probe we get:

[    0.976838] nomadik-gpio 1400000.gpio: chip registered

First line is because we don't use the appropriate dev_err_probe()
helper. Second line is redundant to populate chip dev_err() calls and
shall be dropped. Third line should be dropped.

That's done in patches 3+4+5. Patches 1+2 prepare the terrain.

Have a nice day,
Théo

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
Théo Lebrun (5):
      gpio: nomadik: convert nmk_gpio_populate_chip() to goto cleanup
      gpio: nomadik: add missing dev_err() call on chip populate failure
      gpio: nomadik: drop duplicate probe error line
      gpio: nomadik: use dev_err_probe()
      gpio: nomadik: drop "chip registered" log on probe success

 drivers/gpio/gpio-nomadik.c | 64 ++++++++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 32 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-gpio-nomadik-silent-678abaee1e3e

Best regards,
--  
Théo Lebrun <theo.lebrun@bootlin.com>


