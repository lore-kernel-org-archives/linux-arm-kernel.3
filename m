Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0174CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pHN5khf9PTcLvvlmqi0HnLQGpYz3+aDDcbLpDKiJ4k8=; b=YxaaY1zwbuo5HpnXhtkVOIzCcM
	mPjHgqZ8YhkxZrmCqILYwl5vT6oRMxVfzi0KEzfwZfegbFJNgwpI9TREnxL+698hknKA17VbIfhNd
	RGkSQK3YmvrNjAG9G9P3FOX+U6wjd9GuxMFLfZ7hPLMtgz9ErYiCczG7lAdP2WljjlIQd2MlZmsXm
	1lRG1qQgeypykjb31OH2bVstkLqH4VavoPmpCLVtZ3C9bmFNr91P2nM3lbOATyia6NXH5JrNnPEMT
	L4o+lU51lRkEzuik2Oq0seUBaEqUyALtOCn2AZGz5x4iAGUgRKphz4K1Q7w69kRBosOx8LoNUBUnp
	doSdOlJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwia-00000002rhB-3m15;
	Tue, 26 May 2026 18:41:32 +0000
Received: from mta.al2klimov.de ([2a01:4f8:c0c:a5b1::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwiY-00000002rgg-08cr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 18:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=55AiEH6smbbh
	rzZPSFcT6eC86ZdJdIV2C1Qu1GWWdbg=; h=date:subject:cc:to:from;
	d=al2klimov.de; b=TbuVdwr7TWq/iELF75B2oakH/E6Pod6AmbUskma5KFekshjssa2t
	jv2MVmgEkCf6lnV7kFCoPNEV6SnT7L4MuBWY/slvDcc+34fzPqtLNOUc8jIGcDoovGjlcs
	HzoPCbLaG+Q58rzgFtbby7vo+m8Zdow3qPXizhr9xuHFBToHOlLas1N7zg3pkW45SdQ+JG
	XbIeqQgb02K3yV3sqlU4C00oE5xaa/1Eh96Q9XxXpLN2KFdpH6QR4OHGzzLe37Y4cLiRfe
	uQOKp/SrHvCl4egL5iz7KC2juW+KGuCIqF2uEiWXYtPG/eZQuay1DmUQvqxC1ohAnqn8ty
	1kovtsHJug==
Received: from cachy-ak (88.215.123.80.dyn.pyur.net [88.215.123.80])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 17521702 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Tue, 26 May 2026 18:41:27 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] clk: mvebu: ap-cpu-clk: fix refcount leak
Date: Tue, 26 May 2026 20:40:56 +0200
Message-ID: <20260526184105.18962-1-grandmaster@al2klimov.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_114130_394137_DF31D89A 
X-CRM114-Status: UNSURE (   8.67  )
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

Every value returned from of_clk_get() is supposed to be cleaned up
via clk_put() once not needed anymore.

Fixes: f756e362d938 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")
Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 drivers/clk/mvebu/ap-cpu-clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mvebu/ap-cpu-clk.c b/drivers/clk/mvebu/ap-cpu-clk.c
index 1e44ace7d951..7721d5fe50bc 100644
--- a/drivers/clk/mvebu/ap-cpu-clk.c
+++ b/drivers/clk/mvebu/ap-cpu-clk.c
@@ -312,6 +312,7 @@ static int ap_cpu_clock_probe(struct platform_device *pdev)
 		}
 		parent_name =  __clk_get_name(parent);
 		clk_name[12] += cluster_index;
+		clk_put(parent);
 		ap_cpu_clk[cluster_index].clk_name =
 			ap_cp_unique_name(dev, np->parent, clk_name);
 		ap_cpu_clk[cluster_index].cluster = cluster_index;
-- 
2.54.0


