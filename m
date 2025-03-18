Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD4CC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 03:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F47c52PAf9a3BOXlj0+UjPTz0WsaFAWcYusLV+A9VBc=; b=wmAFN2Sm6eh3puYYtZDb80KZ1n
	/hLd9LJB5T2fWAsGYbA0zb8ByssZN+m7V3Zzz5EOll+VuEFlpJijzbaYjw5N4Bg3DAORqCwRjpT45
	haEp9IHmCMACvsRRgODrmUVxZM9pepi0lQE+921lqVsb+x2CIBe0MZ/emsMvnj8EOX9nh4fpYBlGC
	wQwbAno9cdRfbAbfv2XPAJlmtS/JNEgP9+YZeg+gS2VFEVZM97ErAuIMfu5znApAw0ZpUAQxmL76Q
	SWFZlrPrwo60DMb9IymjavodgQFAJWrEdzTPYYEoc+YZWXpS3cTQyGeeekkl9J520vEneyjkC097M
	jcx48zxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNKm-00000004TPt-2eQZ;
	Tue, 18 Mar 2025 03:09:40 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNJ3-00000004TAh-339V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 03:07:56 +0000
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowACHjlp449hniT8tFg--.15841S2;
	Tue, 18 Mar 2025 11:07:41 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: ludovic.desroches@microchip.com,
	linus.walleij@linaro.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Cc: claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] pinctrl: at91: Add error handling for pinctrl_utils_add_map_mux()
Date: Tue, 18 Mar 2025 11:07:17 +0800
Message-ID: <20250318030717.781-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACHjlp449hniT8tFg--.15841S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKF4fWrW8uw4xury5tF4kCrg_yoWkArg_Ga
	yjyF97XrWI9ry2vr12qw1avFW0kFW8WryIqr1vqF1aka47X3WxKr95uF1UCw1kCry8Gry5
	J39rZrySqr1xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_Jw0_
	GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQ4EA2fYYxtqtgABsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_200754_148569_D4032494 
X-CRM114-Status: GOOD (  11.24  )
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

In atmel_pctl_dt_subnode_to_map(), the return value of
pinctrl_utils_add_map_mux() needs to be checked, for the function
will fail to associate group when the group map is full. Add error
handling for pinctrl_utils_add_map_mux() to return immediately and
propagate the error code to caller function when the function fails.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/pinctrl/pinctrl-at91-pio4.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 8b01d312305a..4dcaebc20d99 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -609,8 +609,10 @@ static int atmel_pctl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		if (ret)
 			goto exit;
 
-		pinctrl_utils_add_map_mux(pctldev, map, reserved_maps, num_maps,
+		ret = pinctrl_utils_add_map_mux(pctldev, map, reserved_maps, num_maps,
 					  group, func);
+		if (ret)
+			goto exit;
 
 		if (num_configs) {
 			ret = pinctrl_utils_add_map_configs(pctldev, map,
-- 
2.42.0.windows.2


