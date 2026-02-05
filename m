Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32708E91291
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TDDN6nKpWMLgAjYqeQFgOlw2hPu9MgJa6srCHJoSLbw=; b=RLocjdXbG0tzwtHb1/16uhgu44
	cIikHVVKQ8YqD87qJnesWTurqhS9DejG8sQmj5fwV7fGTyfDnMK9rbxyne/+D7iiN59PA9HQKRUMb
	CfhtTC2efdlRnm0QZ2l4PKt8M5YAbNMx8qTuS5ZjcgOnm7BahqCWsOv3xBI33CfPEPNyNJIadKH1C
	1kFS0TtLQiEYKrcOjHFfXlisR/NfTbzeFAji8L38EYi2jXuxLz74H56UV/recqBmLT7mzkwIxEyU1
	uGmSrAZXYXVU50iTB111VzWAAa4B6EGO2MctYeYdtP8Klms73h/mXPTRuje/sDqKNykk26rUG5/Zo
	x4Q3LocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnuwo-00000009chb-3jrI;
	Thu, 05 Feb 2026 08:42:46 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnuwl-00000009chI-2Tv8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 08:42:46 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABXZ879V4Rp4R+7Bw--.41404S2;
	Thu, 05 Feb 2026 16:42:37 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	p.zabel@pengutronix.de,
	mripard@kernel.org,
	mans@mansr.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] clocksource/drivers/sun5i: Handle error returns from devm_reset_control_get_optional_exclusive()
Date: Thu,  5 Feb 2026 16:40:37 +0800
Message-Id: <20260205084037.3661261-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABXZ879V4Rp4R+7Bw--.41404S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw15Cw1kXr1kZry5AF4Dtwb_yoWkCFg_GF
	4Ivry7XrWrKrZxKF1qyw43AFW29as5Zr18WanYgaySka4UGrWUA34q9rZ8ZF18Ar4DKF9x
	CFW3GrW3uw1akjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbDPEDUUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_004244_002552_99A7D813 
X-CRM114-Status: UNSURE (   8.82  )
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

The devm_reset_control_get_optional_exclusive() function may return an
ERR_PTR in case of genuine reset control acquisition errors, not just
NULL which indicates the legitimate absence of an optional reset.

Add an IS_ERR() check after the call in sun5i_timer_probe(). On error,
return the error code to ensure proper failure handling rather than
proceeding with invalid pointers.

Fixes: 7e5bac610d2f ("clocksource/drivers/sun5i: Convert to platform device driver")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/clocksource/timer-sun5i.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/timer-sun5i.c b/drivers/clocksource/timer-sun5i.c
index f827d3f98f60..d7e012992170 100644
--- a/drivers/clocksource/timer-sun5i.c
+++ b/drivers/clocksource/timer-sun5i.c
@@ -286,6 +286,9 @@ static int sun5i_timer_probe(struct platform_device *pdev)
 	}
 
 	rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc),
+				     "failed to get reset\n");
 	if (rstc)
 		reset_control_deassert(rstc);
 
-- 
2.25.1


