Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E8BCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OureVILWpP4ne74s+qkDG78LQ2vzxqV0IWTp5a8RhAs=; b=Gfj2Bz2HJYU0e6VN+cN1bKX+rJ
	/uNYGxijNSI60hnSRgl7sfmqHkm+s7Pwo+bbAp8QLtIRuRsxYKylC0UCkmfqMOBETUjF5YkBeh8qv
	5nTVC7MEtMAMbws5V9MNSywStI+enEwf24kU6VFcYAiJFZdvRE9bcJ/fjWnyJne4RIRIdPSdGwRVi
	qwbdZJTpushOSP89ukWDudVz3/W8PXLxCadDQ2n0neUz4zsohSyQrCrMpEjSQt0SMeq0tVbxdWXe8
	pI6vQQf0tM7lLztMWNZEDDbIqhZyDEnfhA0L3DJTeNdTKlmLLrc5hkXuRZsqdcqMRHFMbrkNFNdsH
	13/FygFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkIL-00000003LHJ-14Oi;
	Fri, 16 Oct 2026 15:56:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkIJ-00000003LFH-0YBb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 15:56:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4F4D43A7B;
	Fri, 16 Oct 2026 15:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9750B1F000C9;
	Fri, 16 Oct 2026 15:56:25 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clegoffic@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
Date: Fri, 16 Oct 2026 17:55:44 +0200
Message-ID: <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792163045.git.geert+renesas@glider.be>
References: <cover.1792163045.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Unlike provider-based look-up functions in other subsystems[1],
genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
the provider is not found, thus not supporting probe deferral.
Currently this is worked around in of_genpd_add_subdomain() by remapping
-ENOENT[2].

Fix this for all current and future callers by returning -EPROBE_DEFER
instead, and drop the no longer needed remapping code.

[1] of_clk_get_hw_from_clkspec(), __fwnode_reset_control_get()),
[2] Commit 18027d6f392ee8d8 ("PM: domains: Make of_genpd_add_subdomain()
    return -EPROBE_DEFER").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - New.
---
 drivers/pmdomain/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 964e44c2f78f1d55..88c886814a5b9da3 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3021,7 +3021,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
 static struct generic_pm_domain *genpd_get_from_provider(
 					const struct of_phandle_args *genpdspec)
 {
-	struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
+	struct generic_pm_domain *genpd = ERR_PTR(-EPROBE_DEFER);
 	struct of_genpd_provider *provider;
 
 	if (!genpdspec)
@@ -3276,7 +3276,7 @@ int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
 out:
 	mutex_unlock(&gpd_list_lock);
 
-	return ret == -ENOENT ? -EPROBE_DEFER : ret;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(of_genpd_add_subdomain);
 
-- 
2.43.0


