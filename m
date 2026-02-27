Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A399FEFB51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 20:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gXLCANg6njddTkD65Y8LPp8nmq4Oz5R7vZE4qyKRxoo=; b=LxiTXIYOEF+OFP5NBgI91g0s5X
	+s5N7Ij+aG5oOVV5G56duKCNpQLAwPzUvdnTItfBVBIWNtKw3EP5OQC+ycAkhn5De1b/gK6YjlPY6
	FExMwCaJWi74E1uS+P3+Yc8eF3jsSiBRHWODs+J8mvNbbPy2TdkFNX84CI6uVn1GIp4Wmlo6VcWuC
	VytaJMHaRRfFbyCeeIdK5qKDAMa0KrUyMz0i9JjNDMWHAOAnE0Klvepr3jx2rV49OELS+d22Q/XrI
	2GAOsV5390BgRWYI+3kvKIhAICDUSs34G0R4HtUg1NPvjdvC3AQIuXZr6sEPQp00XHcjoyd6gcjtI
	iGRmZCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw4Fu-000000095nS-3OVa;
	Fri, 27 Feb 2026 20:16:10 +0000
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw4Fr-000000095mF-16hV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 20:16:09 +0000
Received: from wasted (213.87.156.129) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Fri, 27 Feb
 2026 23:15:47 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>,
	<linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] pinctrl: single: drop useless assignment in pcs_irq_set()
Date: Fri, 27 Feb 2026 23:15:14 +0300
Message-ID: <20260227201515.22577-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [213.87.156.129]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_121607_556011_463ADD49 
X-CRM114-Status: UNSURE (   9.85  )
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

In pcs_irq_set(), the 2nd pcs->read() call is only done to flush a posted
write -- the actually read value is ignored.  Drop the useless assignment.

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
The patch is against the for-next branch of Linus W.'s linux-pinctrl.git repo.

 drivers/pinctrl/pinctrl-single.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 288c9c9bce9a..d50122c694b9 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1423,7 +1423,7 @@ static inline void pcs_irq_set(struct pcs_soc_data *pcs_soc,
 		pcs->write(mask, pcswi->reg);
 
 		/* flush posted write */
-		mask = pcs->read(pcswi->reg);
+		pcs->read(pcswi->reg);
 		raw_spin_unlock(&pcs->lock);
 	}
 
-- 
2.53.0

