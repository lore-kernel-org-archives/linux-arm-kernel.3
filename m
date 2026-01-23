Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822EFD77880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWpBVKhs64hdXbfbQvbbrmkGoSjCE3s0LdT6gotQVaY=; b=mVaj2sfH2h8OeX9XIpB/FbbRcv
	jTCCDjchYl2B5qgGMD5fOnVamKB56zHfS/t8OS6Nyq+GM3h/Su7eL1eBsLLLuwMaEFi8miZJPZsQz
	YDeYRP2OyqaRDDHMjkNUry2Ihi9E5rPcT4YPOSrR579e87OQgJUXNyC1AjIq93wHKXMTBMV2MiOpO
	QBibp+tV7cXd1uM4aMQf0nSTFQ9iSFXHe3v63vwMWqJXn9zdTOnhFvUhjhZ5JXiL7x+zjazQOHV6n
	zE6w/qS48FO1iKNmXWdUapE1ibbJLOoKXYGRg/h6hspMLwvPmhLUvKGqJVKSmP75ncYuRbgbXP4+7
	T5xCT64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK7D-00000009Cxy-3jIV;
	Fri, 23 Jan 2026 16:34:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK70-00000009CrY-1Pf2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1899F40968;
	Fri, 23 Jan 2026 16:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E110DC19421;
	Fri, 23 Jan 2026 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769186057;
	bh=0j9fka9qYEljxA2gF2TFcdOGxmcCOdV/rmK49EHEP+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I7zBMseFop7gn5wUH3Gy2Z+oom+2FKUWp1yajwGARs3SqTDXcgRq9LfpTYaqlq73B
	 E19os8fjCaySlALvD8m3eoTxbSK8tGOpG0TT/PnYU//UH1qjjGDjNQv6N374q2DIk6
	 90a1p+dZOncsl32kQV91sS5UTXqDAeO2xl5LQVQE2CSohDjaUm6scUxiR8TLdEgpuv
	 GPOezWseLPhlfI9aCmBoeYFccxRmnX84hCqk67/7HSFYbqGfKsLB1oJR86vJE5LJB+
	 p9dhJLFtgoufvlVSj4/uaycvbujs+E7nUOM7wfKSfOFn/TTMVweDe+MntMi7rmPRi0
	 SrHE3iMMoxq7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3962D6CFD7;
	Fri, 23 Jan 2026 16:34:16 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 23 Jan 2026 16:34:15 +0000
Subject: [PATCH v4 2/5] i2c: xiic: make the clock optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-i2c-xiic-v4-2-4a3eba3510ce@nexthop.ai>
References: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
In-Reply-To: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769186056; l=1147;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=epD2VW7nyikMBdytoxP7e2Rce+7IIwA5ENNJm0jD8gY=;
 b=D9uydca7fy2OIAMy8n1HUFnVYz4YxJwcME46moeenGRF3EONXGqNcmYgkvV5+CtF0DohQcWRv
 XMv8nFAHL5sDzRkNr8AWxvqu7jJNbOr/IPTQ/XAgLhDipB2EtSVoSLQ
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_083418_417267_D2D29E28 
X-CRM114-Status: GOOD (  11.13  )
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

The xiic driver is designed to operate without explicit clock configuration
when clocks are not specified in the firmware. This functionality is
already implemented in xiic_setclk(), which performs an early return when
either i2c_clk or input_clk are zero:

This condition is satisfied when clocks are missing, as clk_get_rate(NULL)
returns zero, allowing the driver to rely on hardware-configured timing.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 12321654055f..2da7e9d1d5ca 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1465,7 +1465,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	mutex_init(&i2c->lock);
 	spin_lock_init(&i2c->atomic_lock);
 
-	i2c->clk = devm_clk_get_enabled(dev, NULL);
+	i2c->clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(i2c->clk))
 		return dev_err_probe(dev, PTR_ERR(i2c->clk),
 				     "failed to enable input clock.\n");

-- 
2.52.0



