Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C764107BCCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqSuO3F12+BG9vDtSc8L1vzzspX/dhmwJJslZsHS+5w=; b=Tj82RsbNeEEge7wARtQnxqNiUf
	xuRIxNowazBC4WJpEUiu4aN+ewM8p2Ph891UOro5CjkmN/u9vgl6dylY/ztzNbfec08i9ebk7TQf5
	a9lEjoDdR6FD22ZLAYQZNik0YEDUOIf9K4G0r1uHMi+fIH7P05HTheR/FvANkZ20YmrTHDsARZLjI
	Cdlry479Z7aYeTbvSLfpJ9QLUBwV9GintkhTvrIvhlsZT6NXuiGtoywpFMnB+tTV4EBXl8NEKNQA8
	AuKnyGxOhMrEQB50DIo36sUjad5kptBEcro72n9WGpRP7AOIbT/dnJNDNj0VTqRCIrCXR6Z4/mtrv
	S1VTcsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15oh-00000000hia-357h;
	Fri, 13 Mar 2026 16:56:51 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15oO-00000000hT5-1Xml;
	Fri, 13 Mar 2026 16:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=jq
	SuO3F12+BG9vDtSc8L1vzzspX/dhmwJJslZsHS+5w=; b=n0zuwsdNS0gS17QGuF
	pXTmwopfCpJ8kBSb5N88HeJgmtmFZvZAnII+cqt0DOza14sHfaLdvpzkHzRkQo2T
	XJHHJeWpoCPt9gFP3ON1hFls3+xe0tbEdUBgiI5oYe+sdRNKkwY2IWJ5GWVk2THK
	IhNHb25YDUWgP+ZvqO5ewpr2Q=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wAX2JV7QbRpTApJAw--.54345S5;
	Sat, 14 Mar 2026 00:55:28 +0800 (CST)
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
	shawn.lin@rock-chips.com,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v9 3/5] PCI: j721e: Validate max-link-speed from DT
Date: Sat, 14 Mar 2026 00:55:20 +0800
Message-Id: <20260313165522.123518-4-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313165522.123518-1-18255117159@163.com>
References: <20260313165522.123518-1-18255117159@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAX2JV7QbRpTApJAw--.54345S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4rZw1ftr4xWFyxGF1DGFg_yoWDXFXE9F
	1UXFWrAr4Uuryakr1YyryayF95A34Uuw18Wa4rtF4fAFyxWay5ZrnxAFWUWa97u3W7JF17
	JFyDKFn5J3ZFkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRNDGYtUUUUU==
X-Originating-IP: [240e:b8f:927e:1000:ce47:698d:adec:5bb5]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAD3m2m0QYDJ6wAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095634_429118_14E95E98 
X-CRM114-Status: GOOD (  10.11  )
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


