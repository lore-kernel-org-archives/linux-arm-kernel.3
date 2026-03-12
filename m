Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05BB106ACCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqSuO3F12+BG9vDtSc8L1vzzspX/dhmwJJslZsHS+5w=; b=Lww+xidODc4B5yxw4mWTZeF/Ds
	gRU3Sq5SQ4yjJGm6HjFk46pAPyots5zs11sJZzM92xtPUBOWae3dfmg1/u15a4So/TYtHgy8PBdk0
	GAa7Ln8C7WiNgdjxDE4wteD+d08XOp2Y/uF9riHDU8yqJnpLLPKEiS/IGosTi00t/OQQlRrXPvT4t
	90L8E+NHqRdF8Qe+AKlcOX1ig1Jkc48j4DGcItQXTvfl00U8/lfgNso07BTNlsOWm6aqPShxXkuur
	zwyKHqkiUg1YTQzOXs+pDw89RujsJkWeeNY45s8GNsuCaLkUZVA1BxZ4QcSQ0PeobIlNGVI0BzQ2j
	EdB8EpGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3L-0000000EaRp-1BB5;
	Thu, 12 Mar 2026 16:38:27 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3C-0000000EaGw-1vCY;
	Thu, 12 Mar 2026 16:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=jq
	SuO3F12+BG9vDtSc8L1vzzspX/dhmwJJslZsHS+5w=; b=X2NtGY0w8SBaIDWXj5
	Il37UHQvb343cKnDnms4MUpmABVPpI9rNone/r00hKvAMwWSH449oZcM9PLYLNel
	49+SQmv2PRoO2drBhMBpbnm10yvwzTJ9xAxa+DnrjZLU3nJ7BJehmDf1FWJIgOvF
	L74Z2m3KlLuP6+Y6PtqCHbIz4=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDnN1Gl67JpMC_OAQ--.12929S5;
	Fri, 13 Mar 2026 00:37:01 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: lpieralisi@kernel.org,
	jingoohan1@gmail.com,
	mani@kernel.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	helgaas@kernel.org,
	florian.fainelli@broadcom.com,
	jim2101024@gmail.com
Cc: robh@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v8 3/5] PCI: j721e: Validate max-link-speed from DT
Date: Fri, 13 Mar 2026 00:36:50 +0800
Message-Id: <20260312163652.113228-4-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312163652.113228-1-18255117159@163.com>
References: <20260312163652.113228-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnN1Gl67JpMC_OAQ--.12929S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4rZw1ftr4xWFyxGF1DGFg_yoWDXFXE9F
	1UXFWrAr4Uuryakr1YyryayF95A34Uuw18Wa4rtF4fAFyxWay5ZrnxAFWUWa97u3W7JF17
	JFyDKFn5J3ZFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMjjg7UUUUU==
X-Originating-IP: [240e:b8f:927e:1000:1caf:6d92:f4ee:5e02]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxA0t0Gmy661RhQAA39
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_093818_907173_67AA5116 
X-CRM114-Status: GOOD (  10.94  )
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

Use the new pcie_get_link_speed() helper to validate the value read from
the "max-link-speed" DT property.  If the value is missing or invalid,
fall back to Gen2 (speed = 2).  This prepares for the removal of the
range check in of_pci_get_max_link_speed().

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/cadence/pci-j721e.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 6f2501479c70..bfdfe98d5aba 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -202,7 +202,8 @@ static int j721e_pcie_set_link_speed(struct j721e_pcie *pcie,
 	int ret;
 
 	link_speed = of_pci_get_max_link_speed(np);
-	if (link_speed < 2)
+	if ((link_speed < 2) ||
+	    (pcie_get_link_speed(link_speed) == PCI_SPEED_UNKNOWN))
 		link_speed = 2;
 
 	val = link_speed - 1;
-- 
2.34.1


