Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA28C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 03:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bn7FZwwf19c3h9u4aABxH+CJMemOfFxO0YWc91hO9HA=; b=zbU+QwoNXVxwVrZC7gXy/8SwR+
	s7VtkpctscuQoNapTxlCe5Botni799xTZE9Q/1o4JjpCLVRlZQaFbAIAadAXPO+68Dv3aU33tIHhr
	N5ZYVMzbU/RrBpGFxq2dPFLUtbdq9YrATqZsgDP3PKIqTazmLHFh5lCYKcETpt2CKHb+defsRI+55
	1GDYo+7oQnSmoHP3QJVnLG7Zg1/v+4l0RU7LDMzIb8gDME9rkMsdgoRB0wNUiWhmzUDSsQoi/UC6r
	lqYDncLUu1MfZ+DCokBp6ze1EG53ivOXPy3SGqo+odSNvbCSQAOMFxOyzynxzmpJLymkqrNRkrFfY
	012YgISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33i2-00000004dcc-1IpI;
	Sun, 06 Sep 2026 03:38:22 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x33i0-00000004dcA-04bP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 03:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Bn
	7FZwwf19c3h9u4aABxH+CJMemOfFxO0YWc91hO9HA=; b=igWyWEeG3ZP1kr3m3c
	HBFlmj5kRfWW8+D43PbIkRWsXc+8yFyi5I4GNSAMb2I0vqpZ6DgpYH9owzRWgqL/
	FWASWjIGYbV24glq9IqasWm60fSYoVIY3+MdDR8pnC8DaJ1NEtmt/gt8Q0JJcGmI
	+84xv2O1uMYbF33glmYlMLnQE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3T5Yg4Jxql1DaAw--.30101S2;
	Sun, 06 Sep 2026 11:38:09 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	"A.s. Dong" <aisheng.dong@nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: imx: Propagate SCU provider registration failures
Date: Sun,  6 Sep 2026 11:38:06 +0800
Message-ID: <20260906033806.84671-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3T5Yg4Jxql1DaAw--.30101S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WryftF4rKF47Kr4kuFy8Krg_yoW8XF45pF
	Wktayavrs7Jr4fG3WUGF1DZryay34Fyry7Kay5Ga4xZF45JFnxWa4Fqa4jkFnFyry8tF42
	yr429FW5CF1FyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRNeOZUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QECymqc4CGhRwAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_203820_440371_6C61A1DE 
X-CRM114-Status: GOOD (  10.71  )
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

imx_scu_init_pm_domains() ignores of_genpd_add_provider_onecell() and
returns success even when none of the initialized domains are published to
DT consumers.

Return the provider error and remove the initialized domains in reverse
order before devm releases their backing storage on probe failure.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: c800cd7824bd ("firmware: imx: add SCU power domain driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 drivers/pmdomain/imx/scu-pd.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
index e3f9e741daf7..05d4364f34be 100644
--- a/drivers/pmdomain/imx/scu-pd.c
+++ b/drivers/pmdomain/imx/scu-pd.c
@@ -474,7 +474,7 @@ static int imx_scu_init_pm_domains(struct device *dev,
 	struct genpd_onecell_data *pd_data;
 	struct imx_sc_pm_domain *sc_pd;
 	u32 count = 0;
-	int i, j;
+	int i, j, ret;
 
 	for (i = 0; i < pd_soc->num_ranges; i++)
 		count += pd_ranges[i].num;
@@ -503,7 +503,13 @@ static int imx_scu_init_pm_domains(struct device *dev,
 	pd_data->num_domains = count;
 	pd_data->xlate = imx_scu_pd_xlate;
 
-	of_genpd_add_provider_onecell(dev->of_node, pd_data);
+	ret = of_genpd_add_provider_onecell(dev->of_node, pd_data);
+	if (ret) {
+		while (count)
+			pm_genpd_remove(domains[--count]);
+
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.50.1 (Apple Git-155)


