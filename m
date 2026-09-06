Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF33C79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 03:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h5UtvNOj7koMAg3tl5lCsazgNOBs9X9XUd+uAthO1zE=; b=nYGpQI3tfHCTKJtOVf0u3hmIw0
	wRaOH7WZGD1Y7mCTOoy/j8tCmvjahlPhPWzfb8a01iO3tVG4QRt5SWV65xgyaXZG3DsHEuyV6x7/M
	NeZqbb/t+6ZmVBiFbWUIaqrH5Q46Q7HNNTcf4G/tG4C4XjuHjqh6EAmCKNgMAs29WhDUK2vzdLXVu
	zq3eDgJaN4J5DwFxOCfs7+0SQKvYjPw5qDKR6aDmkWvqTAxKp/8hP9k29K4l2CWaWtOcMuP2ExQp3
	vMCvnKzv3p4zzYo+B7m+iEgAqqSc6MjAnDAbZjf8tFNUfA88Vj0tAmjo+m7YVtmpnBEgGywNBd+zz
	0CHNS1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33jN-00000004dnU-2Sxr;
	Sun, 06 Sep 2026 03:39:45 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33jK-00000004dmX-1sit
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 03:39:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=h5
	UtvNOj7koMAg3tl5lCsazgNOBs9X9XUd+uAthO1zE=; b=ZzL7WsKZfbSSZziDgt
	4R46THA1km+q4DtKteyjxEQnCqf7N/2Ln1UDrYJkSz70/KMZ7GbY11YM1z7rLgIU
	MeQ8/ml1qB7BJXHR7cp8zMwmjwDJ5fHrhjrGIEaLNnYTqx6qM3nqLC1pjAk+wqAi
	lrFZv3O6VG4qPOptpVBs8LoRU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3X2lu4Jxqh6TERA--.30651S2;
	Sun, 06 Sep 2026 11:39:27 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: milbeaut: Return divider update timeouts
Date: Sun,  6 Sep 2026 11:39:24 +0800
Message-ID: <20260906033924.84982-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgC3X2lu4Jxqh6TERA--.30651S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFWrGw15uFyxXFW5AFyDAwb_yoW8Zr18pr
	WS9398tFWjqw4UG3ZxtF42gF95Gasrta43GrZrK348uF15Xay5tF1Sv3s29a1UtFyxWF4f
	J3yIvr48AF48tFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UDEfOUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7Q8V3Wqc4G+l-AAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_203942_827044_76AF4CC2 
X-CRM114-Status: GOOD (  11.58  )
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

m10v_clk_divider_set_rate() logs when the hardware does not clear its
write-valid request, but still returns success to the clock framework. It
also uses the sleeping poll helper while holding the divider spinlock.

Use the atomic poll helper under the lock and return its timeout so the
rate change is not reported as successful before the hardware accepts it.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 6a6ba5b55a72 ("clock: milbeaut: Add Milbeaut M10V clock controller")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 drivers/clk/clk-milbeaut.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-milbeaut.c b/drivers/clk/clk-milbeaut.c
index 4265bc442dfd..b3bf569ef747 100644
--- a/drivers/clk/clk-milbeaut.c
+++ b/drivers/clk/clk-milbeaut.c
@@ -410,8 +410,8 @@ static int m10v_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 				unsigned long parent_rate)
 {
 	struct m10v_clk_divider *divider = to_m10v_div(hw);
-	int value;
 	unsigned long flags = 0;
+	int value, ret = 0;
 	u32 val;
 	u32 write_en = BIT(divider->width - 1);
 
@@ -433,8 +433,10 @@ static int m10v_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (divider->write_valid_reg) {
 		writel(M10V_DCHREQ, divider->write_valid_reg);
-		if (readl_poll_timeout(divider->write_valid_reg, val,
-			!val, M10V_UPOLL_RATE, M10V_UTIMEOUT))
+		ret = readl_poll_timeout_atomic(divider->write_valid_reg, val,
+						!val, M10V_UPOLL_RATE,
+						M10V_UTIMEOUT);
+		if (ret)
 			pr_err("%s:%s couldn't stabilize\n",
 				__func__, clk_hw_get_name(hw));
 	}
@@ -444,7 +446,7 @@ static int m10v_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		__release(divider->lock);
 
-	return 0;
+	return ret;
 }
 
 static const struct clk_ops m10v_clk_divider_ops = {
-- 
2.50.1 (Apple Git-155)


