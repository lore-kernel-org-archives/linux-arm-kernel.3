Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF53EC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=69HT4BOxmlmQatwTKNlKG6p4loRaonB+Mgy4MynpgW4=; b=sb0gMGsRx5wnbn1FKKA1XrMaGg
	jSeCgutLe0jRMcv3GLp4OKnQGg9golTXB26TdLnB7w2ZBePlvMyIc2sVoYZUAB9ndND6sFXupIBFc
	kLxw3kPEmCUrrJDkpWLaDCH6IHe9vFAFimcE+zBl/tguTlEtuRvwxBxqTMi14FLu8Ljys1eWq/564
	mHUEfgSeANOC/fiddMVhpbo0AFPlrV/aAOoq7YGBHhFl9MmIof9IBNvIFmM8xpWq8RCmeEcwMtPMl
	Q3xqWcNp8NX0uVV4IE95c4YeNJaZMBPj/hVdTAacfO6Jznx4F5KyQCwJ77YvPmPJ2Nj3u3WsdK7c+
	8o6rw9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Lq0-00000000Cgn-2IB8;
	Sun, 20 Sep 2026 18:00:28 +0000
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Lpx-00000000CgA-17aa;
	Sun, 20 Sep 2026 18:00:27 +0000
Received: from wasted (91.78.36.208) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Sun, 20 Sep
 2026 21:00:07 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	<linux-pm@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>, Caesar Wang
	<wxt@rock-chips.com>, Kevin Hilman <khilman@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] pmdomain: rockchip: fix domain check in rockchip_pm_add_one_domain()
Date: Sun, 20 Sep 2026 20:59:27 +0300
Message-ID: <20260920175928.42566-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [91.78.36.208]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_110025_329688_99115EE7 
X-CRM114-Status: GOOD (  12.29  )
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

In rockchip_pm_add_one_domain(), there's the check (most probably for
the case where the "reg" prop has an unexpected value?) which doesn't
make much sense as the variable pd_info will be NULL iff pmu->info->
domain_info is NULL and the variable id is 0.  What does make sense
there is checking pd_info->pwr_mask and pd_info->req_mask which (as
seems to follow from the code) can't both be 0 for a valid domain...

Found by Linux Verification Center (linuxtesting.org) with the Svace
static analysis tool.

Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

---
This patch is against the fixes branch of Ulf Hansson's linux-pm.git repo.

 drivers/pmdomain/rockchip/pm-domains.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index ba66ae719428..69792e2b215b 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -809,7 +809,7 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
 		return 0;
 
 	pd_info = &pmu->info->domain_info[id];
-	if (!pd_info) {
+	if (!pd_info->pwr_mask && !pd_info->req_mask) {
 		dev_err(pmu->dev, "%pOFn: undefined domain id %d\n",
 			node, id);
 		return -EINVAL;
-- 
2.55.0

