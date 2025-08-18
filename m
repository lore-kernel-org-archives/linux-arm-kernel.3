Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B184CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=12kQz3A/BbG6iESz2wksdkCzEHrQ+r7GsI58CIwRvvU=; b=vkTgabaU/7g3dqy3GwqSXKEtYF
	x4CrapEGHQaSwoChTRprGlWF+UHA5KDrjnLIdcIZTbQpwVEO6VTudzrP9myCNWzqFA0uFU9rH8JHS
	PYsq1sY96frSZVBaEbIG/HiXuGZavtA3GxQsT0pySP+HPK1p+bsz9rG2NI7jsRnKE/mSvExLHvKV1
	VyEDJqdcJzMiIiNweCK2RHM+2XL0oErwqFABrdyT3n+TZxuAYXK7J/hWalRamnuRrMUIcxpGmz0yH
	UScx60id22WLL29FcQn9eBAfvVh7QiEcPjYgRjsE03HouVLbczm1Oj3u4+kLg+P0QiXwaEwVrqCdM
	PFfET6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7Nx-00000008i6Q-2foK;
	Mon, 18 Aug 2025 21:27:21 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5V9-00000008Vl9-3uQx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 19:26:41 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57IJQXg62726732;
	Mon, 18 Aug 2025 14:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755545193;
	bh=12kQz3A/BbG6iESz2wksdkCzEHrQ+r7GsI58CIwRvvU=;
	h=From:To:CC:Subject:Date;
	b=AxC/k8EnDW38UPgNRBxMexkzSRy4FoqluD99EWO9qYKn70eTni64xHlnjhxwLJzCN
	 iCuLhFwbuq4GbV447F+HWbgWILh66zISTGFSEduGK/k8kIMTIGMDNj36Nzpe9eqNsc
	 vS45SGEcPerFb4HFvJsQPszNy80ERG3zjlBeKpew=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57IJQXnt039958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 14:26:33 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 14:26:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 14:26:32 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57IJQWxV1525949;
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
Subject: [PATCH 0/3] OPP: Support more speed grades and silicon revisions
Date: Mon, 18 Aug 2025 14:26:29 -0500
Message-ID: <20250818192632.2982223-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_122640_063874_7CBFF39E 
X-CRM114-Status: UNSURE (   8.97  )
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

As the AM62x, AM62ax, and AM62px SoC families mature, more speed
grades are established and more silicon revisions are released. This
patch series adds support for more speed grades on AM62Px SoCs in
ti-cpufreq. Also allow all silicon revisions across AM62x, AM62Px,
and AM62Ax SoCs to use the already established OPPs and instead determine
approprate OPP application with speed grade efuse parsing.

Also fix 1GHz OPP which according to device datasheet [0], also supports
speed grade "O".

[0] https://www.ti.com/lit/gpn/am62p

Judith Mendez (3):
  cpufreq: ti: Support more speed grades on AM62Px SoC
  cpufreq: ti: Allow all silicon revisions to support OPPs
  arm64: dts: ti: k3-am62p: Fix supported hardware for 1GHz OPP

 arch/arm64/boot/dts/ti/k3-am62p5.dtsi |  2 +-
 drivers/cpufreq/ti-cpufreq.c          | 10 +++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.49.0


