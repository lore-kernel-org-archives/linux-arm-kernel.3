Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92F3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 21:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z39MTSWOXNQ5WXDBg0kG4gMl6/FB8k+aGTljZSntLDk=; b=aFklp8+6xVtPdUv5fvCv4Rzp6h
	MAN8XNFWyD3TcPJ9NL4JI42ZI7RWa/bOgCdrFEDpvcPtq1oH5mVpBcR6B3LWIYPN6CICAFCzaNULU
	8veMU/HIHxgeSwfgKc8ogzFnAzDK3y4aiMn+p69z83Oi+ZDiC8om2UKhuZIm8JHUBRLpB6n6GT2zY
	MIs5WWz6bAVE0X/+SqisHBb2lzkThz9/NSIena2W6px0YvrdkYjx8kD2UlITJUWoQqYKu69jjJ0X9
	eBkgKXvDVJaeKfbSFxXJW9b7PwA9z2Gwwrw7QOWYEJ+GDaRj8h2+Wx5jCsNWk1B7FTQ0WKMpdvqnx
	lbcXP/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1Wu-00000003V7q-2pjx;
	Fri, 15 Aug 2025 21:00:04 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un1UH-00000003Uwa-1MXk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 20:57:22 +0000
Received: from mail-acc-it-01.broadcom.com (mail-acc-it-01.acc.broadcom.net [10.35.36.83])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id CC3FDC0081B4;
	Fri, 15 Aug 2025 13:57:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com CC3FDC0081B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1755291439;
	bh=+YZ5RFTx1lTqWs6GzWQCeXFfnC94z2xcTi6xc13mGAY=;
	h=From:To:Cc:Subject:Date:From;
	b=Hbt694ZWJuSS3wkNH5tQSogOI918YB4buaDoRAko5bOwWHJR630m/W+Uflynq2n6P
	 aUvAHSj9/11LKbvqAYh/CMXP+PAb4g+iqM7aW4n5eJg1/DglvGUvxiegj52WeOCq7s
	 kqAVRDJ6yOoUCuUg62tRpS5eb8wn02dhAHLUjsso=
Received: from stbirv-lnx-1.igp.broadcom.net (stbirv-lnx-1.igp.broadcom.net [10.67.48.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-acc-it-01.broadcom.com (Postfix) with ESMTPSA id C46EA4002F44;
	Fri, 15 Aug 2025 16:57:18 -0400 (EDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: james.quinlan@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2] cpufreq: scmi: Account for malformed DT in scmi_dev_used_by_cpus()
Date: Fri, 15 Aug 2025 13:57:14 -0700
Message-Id: <20250815205714.1545571-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_135721_470715_92DCB56C 
X-CRM114-Status: GOOD (  14.28  )
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

Broadcom STB platforms were early adopters of the SCMI framework and as
a result, not all deployed systems have a Device Tree entry where SCMI
protocol 0x13 (PERFORMANCE) is declared as a clock provider, nor are the
CPU Device Tree node(s) referencing protocol 0x13 as their clock
provider.

For those platforms, we allow the checks done by scmi_dev_used_by_cpus()
to continue, and in the event of not having done an early return, we key
off the documented compatible string and give them a pass to continue to
use scmi-cpufreq.

Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
Changes in v2:

- do not leverage the SCMI quirks framework which in spirit is for
  dealing with SCMI firmware implementations, this right here,
  specifically pertains to an older Device Tree. This also makes it
  easier to backport that change into stable trees where the commit in
  the Fixes tag is already present. There is no dependency upon the
  presence of the SCMI quirks framework

 drivers/cpufreq/scmi-cpufreq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index ef078426bfd5..9df4d968fdac 100644
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
@@ -424,6 +425,14 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
 			return true;
 	}
 
+	/* Older Broadcom STB chips had a "clocks" property for CPU node(s)
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


