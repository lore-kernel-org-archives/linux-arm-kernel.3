Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9C7C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 10:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrgCaJC0AqPmNl+B205Shvk9FhEbUr/JGHlx7Hy7OPU=; b=rCuW5++uvOVQ6kHeAKOUtjutxi
	n5kUBG7JmAAVf1GjQKtvjbB+elgUhdyCqLmPBCJzOhmPSSZTWtRqjjX2J5Z+wAzL3UzEopnOwGLkI
	UHevfz2ICC/WokjAvTpSngGBKZD2AJ5i9iNAxLGgBhx/AaVh3qcZLRwq5XaOxKEwy6wa6ovrDcaBq
	l2kp9oXofWbL5Loq5cnBI7FP7Gep+suFdjvnXMBlDDY6kCojfDOlhMwREWD9ATU+PzjgDiPgH0EX0
	tYWEfWDzrJT5AY1+fiqb9UZ6B+DhublE6unKOith6L4NlBTB213MOTAhzQI2moMwP5W84kQ+fAao2
	QUogd4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ejh-0000000HFmx-3WVp;
	Sun, 20 Sep 2026 10:25:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8EjM-0000000HFPF-3Lmh;
	Sun, 20 Sep 2026 10:25:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B952160AB1;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 540F8C4AF10;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=98JgfFXc+HkTsNRmHI1xyAm0Rm6gE2mGRox86nLGGNU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=N+A2fMOzXXQfixAEL7x234/IPdydY/ZMcCMQHoJAOpNVcrSpjflWWDkCuAB0cek0r
	 2S8dRkNQxoilf5lnmS48Q/rkgBD5SptGtd6ANa8PJFbLqfSDpbM9gIYFfeilB0maAk
	 vnCoF9fQJjaw9bJs0CWdqtka3ufirOQPZQv6uCKPtV1u+79LjRyYXVsUAKqVuWdLjB
	 NCuPY6oXCgYFF+P086697M4q135bImyKRVRf/dQ3LP1aXgEf1X9nJ8Psn4qP+MtgRL
	 S8Yc6VH6wkBzgoiQECjej3c0wQzHhCgx9Gu1JZYt0w7GJN5s2HGX59z3EMK1MB+Skj
	 nHd+Xq1YUKG9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4248CC982EB;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:08 +0800
Subject: [PATCH v2 06/12] soc: amlogic: clk-measure: Optimize CLK_MSR_ID to
 reduce memory usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-6-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=2725;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=B0BKe3yD0PFCTHPaReABO4rDltehZzDiFxD06D1+ar8=;
 b=Dfmx99M+EjWRv1Vt6KsT+PhVSrdrxSXeHUJnW5ysW1l4grqtSbh60xPNISqMosDftZ88o2kFZ
 IaHADiOJ29IBSQiJVSjOWNDbkD9IPMQdwljQjQ0kcAPqKwotbjfGgwG
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

The original CLK_MSR_ID macro uses __id as the designated array index.
This can waste memory when defining struct meson_msr_id arrays. For
example:

    static const struct meson_msr_id clk_msr_foo[] = {
        CLK_MSR_ID(255, NULL),
    };

Although the array contains only one valid entry, it occupies space for
256 elements because the designated initializer forces the array size to
match the highest index.

The driver does not rely on the array index when accessing measurement
IDs. Instead, the measurement ID is obtained from the id field of struct
meson_msr_id. Therefore, removing the designated array index from
CLK_MSR_ID does not affect the current driver behavior while
significantly reducing unnecessary memory usage.

Compared with before and after modification, the memory size is reduced
by 24.76%:
$ scripts/bloat-o-meter pre_meson-clk-measure.o meson-clk-measure.o
add/remove: 0/0 grow/shrink: 0/15 up/down: 0/-16224 (-16224)
Function                                     old     new   delta
clk_msr_sm1                                 3072    3048     -24
clk_msr_a1                                  1488    1272    -216
clk_msr_g12a                                2952    2712    -240
clk_msr_gx                                  1992    1608    -384
clk_msr_m8                                  1536    1104    -432
clk_msr_a9                                  6120    5544    -576
clk_msr_t7                                  5352    4632    -720
clk_msr_axg                                 2640    1704    -936
clk_msr_s6                                  5064    3672   -1392
clk_msr_c3                                  4896    3264   -1632
clk_msr_s7d                                 4632    2880   -1752
clk_msr_s4                                  5376    3576   -1800
clk_msr_a4                                  4488    2544   -1944
clk_msr_s7                                  4632    2664   -1968
clk_msr_a5                                  4560    2352   -2208
Total: Before=65527, After=49303, chg -24.76%

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 50928ac14f86..33767f0bc67c 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -55,7 +55,7 @@ struct meson_msr {
 };
 
 #define CLK_MSR_ID(__id, __name) \
-	[__id] = {.id = __id, .name = __name,}
+	{.id = __id, .name = __name,}
 
 static const struct meson_msr_id clk_msr_m8[] = {
 	CLK_MSR_ID(0, "ring_osc_out_ee0"),

-- 
2.42.0



