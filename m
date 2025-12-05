Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A8AD2F7C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 09:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hO/xqAkzPPUWlzRQi12ZDhU7gCmxQerFYx/MALbMm8Q=; b=rpr0qr3hXraDNyLawkwMQ1vMzA
	LOA9llgxV+EaxV3cxQVdl+jn8crz2OHZFoNPkn3veXjQ20VkZoEgyCDKYN4upRD7ey9baDgtJ6RQ1
	i4B3Kr0uo8cXD9pMl6XOMWEF86OmOV5DOLp2GuVgBWuLYDn7QvIQ+LSy2Spv+BYZbqS8lc7pWN3RK
	xX1jGdkIPLzIg/KmyFlZhzmjRSiQWYs9Tw8oFX0DRD376qXp+3m7oj0iqVKEHwtXJZqe2G/CH5kBc
	aiEy0oHSL4/HHYX0E+HWIjxZB3Q3SGzdG64iEva0DRpng0zYcRgQrHOrwODX7YQDyzoS7cpAAakq7
	ErEc+jyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSCB-00000009IbD-099a;
	Fri, 05 Dec 2025 09:33:47 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSC6-00000009IaN-49i3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 09:33:45 +0000
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAD3j8_upjJpbgUnAw--.1109S2;
	Fri, 05 Dec 2025 17:33:36 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: linus.walleij@linaro.org
Cc: aisheng.dong@nxp.com,
	festevam@gmail.com,
	shawnguo@kernel.org,
	ping.bai@nxp.com,
	kernel@pengutronix.de,
	s32@nxp.com,
	s.hauer@pengutronix.de,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] pinctrl: imx: handle radix_tree_insert() errors in imx_pinctrl_parse_functions()
Date: Fri,  5 Dec 2025 17:33:08 +0800
Message-ID: <20251205093308.1498-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3j8_upjJpbgUnAw--.1109S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrW7urWkKw4kWrWUKFW7urg_yoW8Gr43pF
	sxGFyYyr15Gr48GrW5Zw4DuF93Ga1Skr48Ga4kK3yavr43Zrn7twn0kF1Ygr1q9FZ3Aw45
	tF45Aa45u3WUAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUqeHgUUUUU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAUHA2kybajZRgAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_013343_449171_5E652C1B 
X-CRM114-Status: UNSURE (   9.87  )
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

imx_pinctrl_parse_functions() doesn't check the result of
radix_tree_insert() which may return a negative error code
if the insertion fails.

Check the return value of radix_tree_insert() and return upon failure.

Fixes: a51c158bf0f7 ("pinctrl: imx: use radix trees for groups and functions")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 731c58ad43ee..c20bba7ea306 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -624,8 +624,14 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		 * FIXME: This should use pinctrl_generic_add_group() and not
 		 * access the private radix tree directly.
 		 */
-		radix_tree_insert(&pctl->pin_group_tree,
-				  ipctl->group_index++, grp);
+		ret = radix_tree_insert(&pctl->pin_group_tree,
+				  ipctl->group_index, grp);
+		if (ret) {
+			mutex_unlock(&ipctl->mutex);
+			dev_err(ipctl->dev, "radix_tree_insert failed\n");
+			return ret;
+		}
+		ipctl->group_index++;
 		mutex_unlock(&ipctl->mutex);
 
 		imx_pinctrl_parse_groups(child, grp, ipctl, i++);
-- 
2.25.1


