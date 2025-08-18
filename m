Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41DBCA0EF2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpHXmYx68i0rBEZSPh5Z9xmDRv11T/PfxoDuADg+r/U=; b=QbhZIAk1c/zNQRR7wWwykxLbPP
	AycOBi9ZDvyA6s1dJiV0WQzUEltY3074BOFMzC8aRX/XUlpCj0Eo8iwtAY13EzUrcBG+Z1enkRouH
	4dN/uyVP8kVHPM13FLZygpQl051iDMhDnWwDSOMgYHkJQyJPmqN4e8+SDnVE0vgBJu7+Zk0sVLHoE
	RgsJg3O30qRcbn27+Ok20XpEKzx3TKcd4AK/ZGag6Mm23NEkxyY6ZKV09KGweS0jGveN8RgSaODfX
	WI4LSll3vgBmXsxxx80OmzMIFwEHIicyEC/9qJQ6y3IlPl99h0I6Z1Y4qigUx2i/XQpD+4anR7fFs
	gNm6N1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Nz-00000008i7o-1emc;
	Mon, 18 Aug 2025 21:27:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5VR-00000008Vou-0XEO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 19:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VpHXmYx68i0rBEZSPh5Z9xmDRv11T/PfxoDuADg+r/U=; b=ZEt19w017P6DkkokbZ2iqF+PMY
	PUKoTljuR0nqXdgeclsU9S/vM89d/pxeQI1KBTrTVZJ6D9rB3yHke1HXq1HqycnIkyzl7b91V0ncT
	GHYL+qfJ+rAv5eERZ34Ug7R/gbsmaY6JJhMCMEPeeoYh3XfYPblihKTx7aGWDbUrZtHNGysuhJ9iN
	hdmqwFrqrx1xdi6GMw7cYdk9pjysf5OGHzzEnEMbOX2gsFkC+lyxdnz4JUspbeCyDSMWtyovpOxBL
	N1BcmPIDasK946SxNEaIfune5K0GvU956lpNY6exzcfg+CqR3pcdXVkhuaoRCvHOSEngD7I56/g6g
	qh0GYr4Q==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5VG-0000000HUAF-2jX9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 19:26:51 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57IJQXvn3147286;
	Mon, 18 Aug 2025 14:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755545193;
	bh=VpHXmYx68i0rBEZSPh5Z9xmDRv11T/PfxoDuADg+r/U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Zb4RTiFB6SD/V954Oonj/k+ByfKZ2/FbvAjQNBQOPqXRi4AVJfMtcQ+n8K5snxWr+
	 LwxPJfbzXgQM0sp8+a7NUJsimp3U3IXYL90syqBXc6AI3p+o/Ft+CNrgir8j8SOsRz
	 Vr1PZuiZaw9udI3pG0E1wxwOI/oqfTgFRD0nnZJU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57IJQXmW039961
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 14:26:33 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 14:26:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 14:26:33 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57IJQWxX1525949;
	Mon, 18 Aug 2025 14:26:32 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Bryan
 Brattlof <bb@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: [PATCH 2/3] cpufreq: ti: Allow all silicon revisions to support OPPs
Date: Mon, 18 Aug 2025 14:26:31 -0500
Message-ID: <20250818192632.2982223-3-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250818192632.2982223-1-jm@ti.com>
References: <20250818192632.2982223-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_202649_839154_13999085 
X-CRM114-Status: GOOD (  11.64  )
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

More silicon revisions are being defined for AM62x, AM62Px, and AM62ax
SoCs. These silicon may also support currently establishes OPPs, so remove
the revision limitation in ti-cpufreq and thus determine if an OPP applies
with speed grade efuse parsing.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/cpufreq/ti-cpufreq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
index f7be09dc63e3..90c896d02649 100644
--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -311,9 +311,9 @@ static struct ti_cpufreq_soc_data am3517_soc_data = {
 };
 
 static const struct soc_device_attribute k3_cpufreq_soc[] = {
-	{ .family = "AM62X", .revision = "SR1.0" },
-	{ .family = "AM62AX", .revision = "SR1.0" },
-	{ .family = "AM62PX", .revision = "SR1.0" },
+	{ .family = "AM62X", },
+	{ .family = "AM62AX", },
+	{ .family = "AM62PX", },
 	{ /* sentinel */ }
 };
 
-- 
2.49.0


