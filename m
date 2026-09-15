Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC9EC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 05:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5YuQzKz98ZEKq6ONisyr5Lfxgyd1V4oYgKeonJ3Xe/Y=; b=k1aADHvnxPEJCJBuMdcBbfQl63
	aYZR+TyMXav1WOvoEgpgRjVaS3GuRpsR38q68N6FFZ8u66HdX+XYTaiSc0dUgRpU4j+hakHO0S2PD
	0Vr6FM3CRdNZK3AogvTQGBKQXfzBmrHmHUIj7BwHaTpqV70EaL2LdF35g9yWb+/eALZbhmSYit5gW
	vsmAfTEFoWs/GyP1D3LACjW2gUxrohRMM8k+N2RiJg4cKXiduErAf/8CvA4JulvoTTJaXPrIfD5Ij
	YKUhZz0jyT7a4UvhR51KNeIQVfQDw5+WIQuwbbYVyR1d2Gh1Nkcx4turRGQOFPrFYe9yHy6D0i6pJ
	MhgQLJKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LdS-00000005Eod-2g8m;
	Tue, 15 Sep 2026 05:23:14 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6LdQ-00000005EoA-0732;
	Tue, 15 Sep 2026 05:23:13 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowADnvPA91qhqN60JCA--.52285S2;
	Tue, 15 Sep 2026 13:23:09 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: afaerber@suse.de
Cc: daniel.lezcano@kernel.org,
	linux-actions@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mani@kernel.org,
	tglx@kernel.org,
	lkml@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH 5/6] clocksource/drivers/timer-owl: Fix clock reference leak in owl_timer_init
Date: Tue, 15 Sep 2026 05:22:40 +0000
Message-Id: <20260915052240.1728019-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowADnvPA91qhqN60JCA--.52285S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4rJw1xZw4kArWxZFW8JFb_yoWkCFX_GF
	yIvF9rXrWrWFn3CanrZwnrZ39IkF1kZr18Wa9Fq343Ka4rtFyUua4Yvr15C3WxCa13KFyD
	ArZrC3y3ZwnrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbakFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJb
	IYCTnIWIevJa73UjIFyTuYvjfUrrWFUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwELA2qowpBGEQAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_222312_459236_1D7D6720 
X-CRM114-Status: UNSURE (   9.57  )
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

owl_timer_init() looks up the timer clock with of_clk_get(), which takes
a reference on the clock, and only uses it to read the timer rate. The
pointer is a local variable that is lost on return and clk_put() is
never called, so the reference is leaked on the clocksource_mmio_init()
and request_irq() failure paths as well as on success.

Drop the reference with clk_put() right after the rate has been read,
which covers all the remaining paths since the clock is not used
afterwards.

Fixes: 4be78a86c506 ("clocksource: Add Owl timer")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/clocksource/timer-owl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clocksource/timer-owl.c b/drivers/clocksource/timer-owl.c
index ac97420bfa7c..fa347f430563 100644
--- a/drivers/clocksource/timer-owl.c
+++ b/drivers/clocksource/timer-owl.c
@@ -142,6 +142,7 @@ static int __init owl_timer_init(struct device_node *node)
 	}
 
 	rate = clk_get_rate(clk);
+	clk_put(clk);
 
 	owl_timer_reset(owl_clksrc_base);
 	owl_timer_set_enabled(owl_clksrc_base, true);
-- 
2.34.1


