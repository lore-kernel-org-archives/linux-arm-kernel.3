Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC68CA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t1E2Q9wm8tL4keR4GwX46jH1gsdyqzINhXfPr7tMnTk=; b=cvB5KK+SjqXl8C0V+lApnn0gm4
	es5HDWoqBrTq4rhZj4sAdvEgTBKbq5DYQ4kENOtt1LpaACyAY2ihZLl1RMc2M7DqfJIMh+5ZpctQr
	3h1EjHuh9w/m3D1keKdcjXZlych8iDxugI1gTa2bE5j3VJWK1ASPcarcy4SHCZbbVww1nRZhKp6Kc
	BLlsnwi8xXvWxWKyx0Mlsqvt7U7YSmsMJw8HFmPrzkfXC+IWb37AxOv7Zv9wDkNW8BRPkIFJqo7E3
	G+qdhL0NGapdd0IHeezKvE4FUptKcEX457CzZg5mouQHZ7NXWjOtd69trW0dutACX/4anYILX2Nin
	Mib/QUmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4fo-00000008Msl-016a;
	Mon, 18 Aug 2025 18:33:36 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2Pb-00000007zpA-3nnp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 16:08:45 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 6FE2CC009BE2;
	Mon, 18 Aug 2025 09:08:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 6FE2CC009BE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1755533320;
	bh=Crynj0KpYqual1/+N1DhoLywG80ccPOdKO1wbUlhKtQ=;
	h=From:To:Cc:Subject:Date:From;
	b=tyklk9LtR8WtVWv5s5RuPNr2iiJYYrEBq6Hn+n8qg7W9Fp50jM+uGLwyzKltuG3Rr
	 su/L2riiDDzlNn1jFzsHq5shbPj26+nKL916s2IjlD2MT4e7CBIPtcg7y8gFF40m36
	 cSGNshL1RjmslXnPNXLYIklrYI4Eq0TeZy5qIALI=
Received: from stbirv-lnx-1.igp.broadcom.net (stbirv-lnx-1.igp.broadcom.net [10.67.48.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id 51D7C4002F44;
	Mon, 18 Aug 2025 12:08:34 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3] cpufreq: scmi: Account for malformed DT in scmi_dev_used_by_cpus()
Date: Mon, 18 Aug 2025 08:50:48 -0700
Message-Id: <20250818155048.551054-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_090843_990146_B8634DEF 
X-CRM114-Status: GOOD (  15.31  )
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

Broadcom STB platforms were early adopters (2017) of the SCMI framework and as
a result, not all deployed systems have a Device Tree entry where SCMI
protocol 0x13 (PERFORMANCE) is declared as a clock provider, nor are the
CPU Device Tree node(s) referencing protocol 0x13 as their clock
provider. This was clarified in commit e11c480b6df1 ("dt-bindings:
firmware: arm,scmi: Extend bindings for protocol@13") in 2023.

For those platforms, we allow the checks done by scmi_dev_used_by_cpus()
to continue, and in the event of not having done an early return, we key
off the documented compatible string and give them a pass to continue to
use scmi-cpufreq.

Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
Changes in v3:

- corrected multi-line comment
- added details about when STB platforms used SCMI and which commit
  clarifid the binding requirements

Changes in v2:

- do not leverage the SCMI quirks framework which in spirit is for
  dealing with SCMI firmware implementations, this right here,
  specifically pertains to an older Device Tree. This also makes it
  easier to backport that change into stable trees where the commit in
  the Fixes tag is already present. There is no dependency upon the
  presence of the SCMI quirks framework

 drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index ef078426bfd5..38c165d526d1 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -15,6 +15,7 @@
 #include <linux/energy_model.h>
 #include <linux/export.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_qos.h>
 #include <linux/slab.h>
@@ -424,6 +425,15 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
 			return true;
 	}
 
+	/*
+	 * Older Broadcom STB chips had a "clocks" property for CPU node(s)
+	 * that did not match the SCMI performance protocol node, if we got
+	 * there, it means we had such an older Device Tree, therefore return
+	 * true to preserve backwards compatibility.
+	 */
+	if (of_machine_is_compatible("brcm,brcmstb"))
+		return true;
+
 	return false;
 }
 
-- 
2.34.1


