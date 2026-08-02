Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1D3C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 01:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MgCfIvqyg6mlNj5eX8RGEdTT5G8l3x5wlXd1wjha+lI=; b=M003b5/BA3yaBDKEZMNX1hCGKw
	+iYJ/9p3eCuyyDeXezlMX2FPMjiJz3Z30r7gfgiVQSAYJDEWQH5qUrLfkhnJMMP2aimG6jWB/WsEi
	BJH8uB5pU/SKVVyi4Bav2RL0lg4cwExelQrQy3Ngtalti/XBL27PFrld7L6Cw0zyGL6Slfc5qBVSz
	WVExPamzRV+KAHHDKcWdUbyEwAx3frHiO1VcQb7S5y5l2AaOg3oUUGI8TfMtZl2qPhMrU8D/LF6n1
	Hj8za6PfiVvq/QO15lrgTGJMZFuCGhRCVRlT4mh4IdNhc+87gqaYOAQrx5QTpFdX3fjGfxHqPVQ3Y
	FVbDPjcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqL4T-0000000FFgd-2Z0F;
	Sun, 02 Aug 2026 01:32:57 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqL4Q-0000000FFgC-2gh6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 01:32:55 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-382ef647e20so2427214a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 18:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785634373; x=1786239173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MgCfIvqyg6mlNj5eX8RGEdTT5G8l3x5wlXd1wjha+lI=;
        b=NZnlSKFYtaHc5dTTC0qAZetL22bzXP761d8xcLSlIokeSB+mzcfavnbr8MpwKHi/ep
         4ZEs+R9Wlzgeqt+p5Ewv0Zv0cTVP2tCImssk4dq4FDWWXXwoI6umSALkrW66/sFL6prX
         3YRY/xwg9yF8sAyBZMb4SJFeK6F5repS+XpKFHpemQ+68LFF7abYM5dKsoyRSWCfSjTQ
         670QgVjoLxueDIszuGq7d8ZIXvh6RFkQRLGEKyQ3Imewkez7g6nbMmtinSDNxx9z5eDV
         dUh3YZz+Du22GRpMNFNsMqzBLP52VpKaFf8xQf4jMYNv2I+Bube3yR/V6+hnvDTDQONB
         PQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785634373; x=1786239173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MgCfIvqyg6mlNj5eX8RGEdTT5G8l3x5wlXd1wjha+lI=;
        b=PdOi0R0J1fxb54a5FnFncqbUTVlOXEA8m/jYzTjjWwOX/7PTzOcFZssi4nhvMHDWY3
         DM70JRAYd34ExVJaap6dlExQEbCNR0tChhB8sxJrSuIcufhP9jiaREKTNRosDrrGGUel
         1KOdSJoeCpCoYXeX/elESjpDxFOp3AFl45y3DUK5soi0+7nJuuZxrMhHfLXrKa81s2+u
         aILgvfnARRv3ptjtSIEnKLIdoS7nOwfhS0XIsu5FchrJ6EoXOTxz/Du2izwE7IAoA7Bm
         GemnRivv+qBM6odQ/668fQA+R9PsG628qLAEinSatXTnVqfUBOnipiZcLe8Muztefj3Y
         TClw==
X-Forwarded-Encrypted: i=1; AHgh+RpSrL0cX2+9skrrpZSMkMVDxWBTOR9aLhEjXcKHREu8R0edPSl0jViFKXHL9BiEYuMYCs4/XgWsqg1vsI7rUPLW@lists.infradead.org
X-Gm-Message-State: AOJu0YzrhXP8TNQ8/q5sgeR+RRiN4QDOy63OOJVtSjbPYbcK0kxYjc6u
	2dA8rLoLmdztCTZ3dWZDYuu+T6UuLmN8t+5m2tlts21Glai7EO7rd4JG
X-Gm-Gg: AR+sD123WW1FEr1bDqtSL1ihidUIEfezsIfFbclUe6zpkOVxptm8exDytgOkokmrwLE
	FEsUo90wymi1fhvvviSRivd7NuObff/BjmUXfPZgW6Cg3XkrbIUMVjOVV6/WoRE+L2zNRBm34Id
	5yvFim1Gm5Hw/9peJUixEexAB5LB0VE9RwqlLRKoc6p6CZdqptChig6basCAK9LtAlsqADUPmA9
	+YhfeSlEtff5Ztqh/oVVFCGxgWczwt7cx/0o/2VXExgFopzu6FREbMVntgx6Ihj+UjDnL2Q5x7V
	FOO339lOvh6y+SHjdhrA8cJ6mZDrIPY6k8Ni4+gENAdXL3Rnsgn7UiPcFNWSx+3K/XEa2k2JJtb
	JbLm05zge70cbMFzVwNrL5UK4r+3SCKBa6fmJy8ZWjVlCghH/WK+zBQTtPJpyS9gitAVJ26rWky
	fk8VY1YpIdgBpx6NAOTSIMMAtaQOHiTDfGrpZzWi+DFpp3nG2B9lviQdqlnRWj
X-Received: by 2002:a17:90b:5824:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38fbc43a847mr4897647a91.14.1785634373423;
        Sat, 01 Aug 2026 18:32:53 -0700 (PDT)
Received: from kdev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2afa8f3sm1662312a91.2.2026.08.01.18.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 18:32:53 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] clk: zynq: pll: Fix kernel-doc after determine_rate() conversion
Date: Sun,  2 Aug 2026 01:32:52 +0000
Message-ID: <20260802013252.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_183254_706026_3A1BC054 
X-CRM114-Status: GOOD (  12.11  )
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

Commit 1547747b55d5 ("clk: zynq: pll: convert from round_rate() to
determine_rate()") replaced zynq_pll_round_rate() with
zynq_pll_determine_rate() but left its kernel-doc block behind, so the
block still names the old function and documents the removed @rate and
@prate parameters instead of @req.

Retitle the block and describe @req. The Return: line is updated as
well: it described a frequency and referenced the removed @rate, while
the function now returns 0 and reports the rounded rate in @req.

No functional changes.

Assisted-by: Claude:claude-opus-5 [kernel-doc]
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 drivers/clk/zynq/pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/zynq/pll.c b/drivers/clk/zynq/pll.c
index 44c6093783641..500586f50d7c1 100644
--- a/drivers/clk/zynq/pll.c
+++ b/drivers/clk/zynq/pll.c
@@ -42,11 +42,11 @@ struct zynq_pll {
 #define PLL_FBDIV_MAX	66
 
 /**
- * zynq_pll_round_rate() - Round a clock frequency
+ * zynq_pll_determine_rate() - Round a clock frequency
  * @hw:		Handle between common and hardware-specific interfaces
- * @rate:	Desired clock frequency
- * @prate:	Clock frequency of parent clock
- * Return:	frequency closest to @rate the hardware can generate.
+ * @req:	Clock rate request, updated with the frequency closest to the
+ *		requested one that the hardware can generate
+ * Return:	0 on success.
  */
 static int zynq_pll_determine_rate(struct clk_hw *hw,
 				   struct clk_rate_request *req)
-- 
2.43.0


