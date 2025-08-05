Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A864CC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 23:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=++94R41tQyeJMdud8WPd0oi+7jsV3EpN/nsCDMPrqME=; b=vI0EkLD3Uo6IZNjN3ChBCTQ9fs
	Bdxkaj13327r8MJcWWVpy274D0WUyR2pWjqe+Vknfutu8YIcl0YrzGwqB1199KpJSSKAr1uDYgWL2
	fxK0yFJ0ACqnJCtwrciEccxEwJTG0ImHnrujt+Y5TYVQ7p3Mi7+Wg5r/o2w9VbWl96bH/GqIUiVwn
	qYQbSBENTTtd2j81Qhna8SdXLjxaBkzh3waqKcReY/aHKHyv60nt+AxIQYAiy0AaRlmn9tYDqoyrR
	D5USWpwl+lD3bzd8QU0BVANnwLAl5IfeMX6Eq3L2bH+gAqWkDVmeK+aLVydqAy4ucdOKfJNx6YzYf
	X+x3nVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRXY-0000000E1h6-3Mwm;
	Tue, 05 Aug 2025 23:57:56 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujRPw-0000000E13E-0qGN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 23:50:05 +0000
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 575NnpKh4185345;
	Tue, 5 Aug 2025 18:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754437791;
	bh=++94R41tQyeJMdud8WPd0oi+7jsV3EpN/nsCDMPrqME=;
	h=From:To:CC:Subject:Date;
	b=w2Qiwep7h4n2O+tFZMAhFUwlz/41MguqHiKzfPVXbZcznSLPSmM/1qapo2t2ePHRd
	 q2sEw508wmFZD0lmkDHgNuumaqBp0ChVC9QYUn3o4x30f+mL9tmz2y3K6HLs8FMJwi
	 K2hQnxAtXhioMzZMH9bM4wmlOx5Jn+xbGXVNqo/s=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 575NnpPu3796004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 5 Aug 2025 18:49:51 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 5
 Aug 2025 18:49:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 5 Aug 2025 18:49:50 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 575Nno6m2624898;
	Tue, 5 Aug 2025 18:49:50 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Tero Kristo
	<kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
Subject: [PATCH 0/4] Add support for AM62P SR1.2
Date: Tue, 5 Aug 2025 18:49:46 -0500
Message-ID: <20250805234950.3781367-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_165004_284577_2786A402 
X-CRM114-Status: GOOD (  10.79  )
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

This patch series adds support for the AM62P SR1.2 silicon revision by
adding logic in k3-socinfo to detect AM62P variants. Also update binding
doc to account for second register range GP_SW.

This also disables HS400 support for AM62P SR1.0 and SR1.1 in sdhci host
driver and enable by default for AM62P SR1.2.

Tested against AM62P SR1.2, SR1.1, SR1.0 and AM62X SK.
Log for AM62P SR1.2:
https://gist.github.com/jmenti/5d06c60a94104a476eda9371ab6c7f37

Judith Mendez (4):
  dt-bindings: hwinfo: Add second register range for GP_SW
  soc: ti: k3-socinfo: Add support for AM62P variants
  mmc: sdhci_am654: Disable HS400 for AM62P SR1.0 and SR1.1
  arm64: dts: ti: k3-am62p-j722s-common-wakeup: Add GP_SW reg range to
    chipid node

 .../bindings/hwinfo/ti,k3-socinfo.yaml        |  9 +-
 .../dts/ti/k3-am62p-j722s-common-wakeup.dtsi  |  3 +-
 drivers/mmc/host/sdhci_am654.c                | 16 ++++
 drivers/soc/ti/k3-socinfo.c                   | 82 +++++++++++++++++--
 4 files changed, 98 insertions(+), 12 deletions(-)

-- 
2.49.0


