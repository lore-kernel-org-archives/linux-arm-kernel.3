Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF14F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kPHUPF/7;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=yiWoD3RV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FnY35YNWnpPA4T/VaWdk7Fmbza5uMATO+i3TxNWIYUA=; b=kPHUPF/7OWruiOI0cTs1v1PDRA
	6R4cZIuNs7RBEMwpnEf/SNpn0UTgxR+TcE2HbmF8HtOdolsu1u4wOlHfyrqFweZYPp0WtHd7+DCkd
	0U+oZTKylCrhS551MmfJRktmayqPmGseMEUrpCLtR0n73oCqhDWTg6brudnsPb3HgUpgkVdJihNnU
	0LpsUcZFA7Zk+isbIMO9oOwhScISrupAARKwyeJQxDC3tKmGe6TlTVKo5JIMiM+xVNRfqpaBpg4JT
	eCdXOg551gvpaJKnsEiYwHvAwF1jwYUNR/vE1gLU/UOgRDpLXFRIilTCAGQdhMENaA7AJA+2nka+Z
	QPnHbvrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7qL-0000000DHXk-2xA4;
	Sat, 31 Oct 2026 12:05:53 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN7qI-0000000DHXG-22IB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 12:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=FnY35YNWnpPA4T/VaWdk7Fmbza5uMATO+i3TxNWIYUA=; t=1793448350; x=1794657950; 
	b=yiWoD3RV6vhCSwwCo7KRTxBwmWSVrhjRx59Si1ECKj7tZgro39wbZtQuemV5vf84cfakQROBSGs
	aVh0XOSKsDCDefvd/iDg/Hj5JXjmeeozJsLr+0q8SelRfHRGoS9lK2Ycrg4nv/WJluPnNZDPt2eNd
	VNgUTeTd7EITorRioeF8GMSnM2mkMzYhNlWWNO2ynLyeOEHKgUk4uyXrdarl3B6NUlK6DbOexfP9g
	gNnz41H/8gaU4A7H1nbh+li9XG3fCO7mLY8bvxXowh+K1kcIkPaiV3q8Nk8pLj4/rAfuBYRytT6YI
	D4fYl6M8L6vxkfDTqbB+CPHG463hMPViTUYA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: paul@pwsan.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: omap: omap_hwmod: do not WARN() on missing nodes for hwmods
Date: Sat, 31 Oct 2026 13:05:19 +0100
Message-ID: <20261031120519.655248-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_050550_529930_3890F615 
X-CRM114-Status: GOOD (  12.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If devices are converted from hwmod to ti-sysc, there might be an interim
state with the hwmod data still present but the devicetree not referencing
the hwmod. In such cases, the hwmod device data is still there,
the hwmod infrastructure does ignore that device but prints out a big
alarming WARN().
Be more silent in that case to avoid needing putting devicetree and
code changes into one patch but into one series, only require the
hwmod cleanup to come after the devicetree conversion.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/mach-omap2/omap_hwmod.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 03cd523dff87..a67442a6a2c6 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -2329,8 +2329,10 @@ static int __init _init(struct omap_hwmod *oh, void *data)
 
 	r = _init_mpu_rt_base(oh, NULL, index, np);
 	if (r < 0) {
-		WARN(1, "omap_hwmod: %s: doesn't have mpu register target base\n",
-		     oh->name);
+		/* there might be a transition ongoing from hwmod to ti-sys */
+		if (np)
+			WARN(1, "omap_hwmod: %s: doesn't have mpu register target base\n",
+			     oh->name);
 		r = 0;
 		goto out_put_node;
 	}
-- 
2.47.3


