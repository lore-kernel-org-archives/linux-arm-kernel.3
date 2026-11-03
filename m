Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772DE60822B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x4D1LyPZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+zlqU5HK4GJzXTnocF1qUvTVp5xgIdL568uCk9xt6J8=; b=x4D1LyPZYC5WajySjc4le5gs5r
	OvXjQKWC9P9c7lAl5VIdqlhe8p0Z2liBDFAIj/mxNeF/mNtMoEQf2L5dUYm62Q2y97c0RzEz7SrPq
	ucR3qKoQCqCOa1oUGrVoejj9sGbCFSNRyf8A3qzzn3A7YeEg/GKRshK0ARDQrYPVzGEYBrJdas6J2
	94bd7s070FO0YwAKi+mfkF3MhfDqGZzixaLJa6U55yUNFi/er953gfr2IYNThg1m8P701c8WDpiqM
	cGdXKSG8nxtqoxuIJDgf8eJwd9ue2I7ZLm5AUWtV5wUvRVFQd/juk4145D8TAruhXXWw5LaUmZIQ2
	ojpRl/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOByR-000000023El-2J4c;
	Tue, 03 Nov 2026 10:42:39 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOByO-000000023C7-0zbV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:42:38 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAHF5iZuulqvcg7AA--.3211S2;
	Tue, 03 Nov 2026 18:42:34 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: bcm: release the NS2 pinmux controller on detach
Date: Tue,  3 Nov 2026 10:42:42 +0000
Message-Id: <20261103104242.1373883-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAHF5iZuulqvcg7AA--.3211S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFWxArWDury7uFy5Kr1rJFb_yoW8XFy7pF
	43XFy5Krn8tF45ZFW5J3WrWFy3Can7Jry8C3yDK343XF45JrykJFyYgFWrJF4kGr40kr4Y
	yr15J3y7urn8AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9mb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_Cr1j6r
	xdMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VAI37AI020EjII2
	zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	yj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8Jr0_Cr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdYxBIdaVFxhVjvjDU0xZFpf9x07bOAw3UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAQAA2rpnOF67gAAsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_024236_728839_7ED76802 
X-CRM114-Status: GOOD (  12.52  )
X-Spam-Score: -0.9 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ns2_pinmux_probe() registers the pin controller with pinctrl_register()
and stores the returned pinctrl_dev in the driver data, but the driver
has no remove callback and never calls pinctrl_unregister().  The
controller is therefore never unregistered and its memory is leaked
when the platform device is unbound.

Use devm_pinctrl_register() instead so that the controller is released
automatically when the device is detached.

Fixes: b5aa1006e4a9 ("pinctrl: ns2: add pinmux driver support for Broadcom NS2 SoC")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 23ab3ab064b6..a1480641ee0b 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -1077,8 +1077,8 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 	pinctrl->num_functions = ARRAY_SIZE(ns2_pin_functions);
 	ns2_pinctrl_desc.pins = pins;
 
-	pinctrl->pctl = pinctrl_register(&ns2_pinctrl_desc, &pdev->dev,
-			pinctrl);
+	pinctrl->pctl = devm_pinctrl_register(&pdev->dev, &ns2_pinctrl_desc,
+					      pinctrl);
 	if (IS_ERR(pinctrl->pctl)) {
 		dev_err(&pdev->dev, "unable to register IOMUX pinctrl\n");
 		return PTR_ERR(pinctrl->pctl);
-- 
2.34.1


