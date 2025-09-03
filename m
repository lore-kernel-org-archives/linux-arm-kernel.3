Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D156DCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fWc7bzaE61Z8/ywQrMGqQ4349t+JxTuForfkmFTiNA=; b=aPjVDkJrpqoL93TWaXuxrmfdW9
	oStncjfN1cM7DFgM3l1fbfNbofNuVt8CrQrCG1AOAdb4ldlUG62Ub+yazTrD8/50GkXsJ+P8bFoiK
	rSs1OkURVUJl4mmHeo613THSXrnC6el4cxwj1VEb3tBOXjovRRXALULL++BgOMWqzDldYu1SdLIfs
	qNjKwK3+bYvy9B7vbx/px+KgGTJRqPHK/5MAMRqLE9i/GWKgawAmJGKxdNK6WRBslYhuCzN6jyQxC
	KmUwhP5sAOZp72tgRORzXp3778tmfVHoOzWWQ2L+RAvTC9+PDa0e74utxOy+RmLqszxKNaSYfL3bj
	AL/8nDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsOk-00000007KHC-3Ykc;
	Wed, 03 Sep 2025 18:39:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uto2s-00000006fyD-0XJW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 14:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7fWc7bzaE61Z8/ywQrMGqQ4349t+JxTuForfkmFTiNA=; b=oM9HZmfOA3mMTO7LpPvPNh6Cwv
	2KEgKZsSbbdUJCXNXJUr0n//qU1si2xaKv9J6iMmU2OiPRa27fGEeHSHbENfDDiFB1z/MUd3OxbYB
	ssR+R5DcOO7TeasiCVP+Wl8eLzmoeTO5LWZacW6VCSpVPU9s2QE8kY/hCeAc++t19q6kMsmEf6axS
	tfKJ07+6SaHkxt31iSMwfeIChFYCl8bipyQvfii7P9FmKhtA//1ysV0eOJaMAFdJoKxlssVCqQlZT
	aOC5Yw0Ds7eQ83WQbldPEPsye0OYH3KZeotznJQUX/2LDAADVwT76MTytuoABGg7dZAHUecybTc11
	OytQxCvw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52700 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uto2i-000000000c8-3ssX;
	Wed, 03 Sep 2025 15:00:56 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uto2i-00000001seA-0lxv;
	Wed, 03 Sep 2025 15:00:56 +0100
In-Reply-To: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
References: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/2] net: stmmac: intel: only populate
 plat->crosststamp when supported
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uto2i-00000001seA-0lxv@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 15:00:56 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_070106_171948_73D6CF4D 
X-CRM114-Status: GOOD (  12.22  )
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

To allow the ptp_chardev code to correctly detect whether crosststamps
are supported, we need to conditionally populate the .getcrosststamp()
method. As the previous patch implements that functionality by
detecting whether the platform glue provides a crosststamp() method,
arrange for the dwmac-intel code to only populate this if the X86
ART feature is present, rather than testing for it at runtime in
intel_crosststamp().

This reflects what other x86 PTP clock drivers do, e.g.
ice_ptp_set_funcs_e830(), e1000e_ptp_init(), idpf_ptp_set_caps() etc.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index d900b93f46ce..e74d00984b88 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -371,9 +371,6 @@ static int intel_crosststamp(ktime_t *device,
 	u32 acr_value;
 	int i;
 
-	if (!boot_cpu_has(X86_FEATURE_ART))
-		return -EOPNOTSUPP;
-
 	intel_priv = priv->plat->bsp_priv;
 
 	/* Both internal crosstimestamping and external triggered event
@@ -756,7 +753,9 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 
 	plat->int_snapshot_num = AUX_SNAPSHOT1;
 
-	plat->crosststamp = intel_crosststamp;
+	if (boot_cpu_has(X86_FEATURE_ART))
+		plat->crosststamp = intel_crosststamp;
+
 	plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 
 	/* Setup MSI vector offset specific to Intel mGbE controller */
-- 
2.47.2


