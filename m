Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64421E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndFsPUok2e6IM1F1xIPQZx34YG4RnmjyvdGunxhL89E=; b=o6Qy3dUglSwvvN1qE2FzvGRQub
	Cr9yaCrT9MgCO7qHXgz2UzLcrn6udVHbDcONLqdGYSW1g+vfterYD6c4NzJEaVMzHP9TvlD6fkCn0
	7l893ux35ifLeC6gb6sPgjSQyxMMO7Sbq55gGpp1PauPALz2nrK+da4p9T4ClmIIUcJ7Rwvr2Neyo
	lY0Yl7Yf2Z9+gBdJHfkEPtBwQLWsurhSoQZ4gYEtXq5RgB/uZNcczSiq8OPhoAHBUxyeb8cdgnnKl
	0rNzg9i4GQM8Wqjy6+HyMPetKCy8Mzd5SBZMdYy0wV7GvBJLQsU26ox/5EJ33/dyjmNOarwqh2lZf
	hVyyy1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrbx-0000000GJwy-39Mf;
	Wed, 18 Dec 2024 10:49:01 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrXl-0000000GJ4b-0yFu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:44:42 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BIAiVJX3616695
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 18 Dec 2024 04:44:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734518671;
	bh=ndFsPUok2e6IM1F1xIPQZx34YG4RnmjyvdGunxhL89E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iePIxWxq6TbdGGqXS8WxB3KaPTUS0SHeDDe1mJqywHa2Gsx7EaMob2q2z7KYlKhHa
	 5b+uFv5RdLFaAhOWnYFt/cm2pxH5GyCZGjN+z1tzm1BIZaDax9BMrtq2TdjjcF68TD
	 Pv9x53uKpJRvN4nmAQ59p7joaRSSI8a+7OyNzXD8=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BIAiVlE111307;
	Wed, 18 Dec 2024 04:44:31 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Dec 2024 04:44:30 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Dec 2024 04:44:30 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BIAiUnw089746;
	Wed, 18 Dec 2024 04:44:30 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4BIAiTKi026900;
	Wed, 18 Dec 2024 04:44:30 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <tony@atomide.com>, <mathieu.poirier@linaro.org>,
        <grzegorz.jaszczyk@linaro.org>, <s-anna@ti.com>, <ssantosh@kernel.org>,
        <nm@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH 2/2] MAINTAINERS: Add entry for linux/pruss_driver.h
Date: Wed, 18 Dec 2024 16:14:24 +0530
Message-ID: <20241218104424.1257880-3-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218104424.1257880-1-danishanwar@ti.com>
References: <20241218104424.1257880-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_024441_313314_8A43CDD6 
X-CRM114-Status: UNSURE (   9.88  )
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

include/linux/pruss_driver.h is an orphan file. Add entry for this in
the MAINATAINERS file.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bc992f10a2f6..069817391e9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23638,6 +23638,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
 F:	Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
 F:	drivers/pmdomain/ti/omap_prm.c
 F:	drivers/soc/ti/*
+F:	include/linux/pruss_driver.h
 
 TI LM49xxx FAMILY ASoC CODEC DRIVERS
 M:	M R Swami Reddy <mr.swami.reddy@ti.com>
-- 
2.34.1


