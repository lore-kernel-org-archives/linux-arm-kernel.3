Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16B4C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 07:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mx7CPK7BOBe9sQD6ZJnFhOEvIKgp+dnRmWH5RBbug7U=; b=Za8WyE8D30fnng+qyQBO7skvhl
	hrKzb74KhwKh4YkUFmH4MIeh5osKcWebQRtleOlXvG+OaMDBZ4hdY08Pdmg1WzjwGTMXfVqBRYjEC
	OOzrgaDl1kRAyUd5/zrYKqug7Jx6ZRSVXxdQG4XjQ+ke4/CmYvqkfSQ54CjzCENdZ3Fk2rs/qkEut
	97ePKYQM5AC4fUWC8zEZEAM7YDVcAhCKOLrqncbtmGUI4D7PgZQKIPnbQlTRqsmCbZzPOKuSnv0B8
	ZwaL4sfCbVoQBFcGfsOWANr5DsU1A7bJziHriLb8xZF43sQFpwo+DMQeVN9x+eFTaW18MI6DTTUp5
	O7b0KM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taVd1-00000009eet-0ou1;
	Wed, 22 Jan 2025 07:58:23 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taVbj-00000009eXN-17rR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 07:57:05 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5400:5628:9df0:d4b4])
	by michel.telenet-ops.be with cmsmtp
	id 47ws2E0013QiWAT067wsGt; Wed, 22 Jan 2025 08:56:52 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1taVbP-0000000E09l-2zFC;
	Wed, 22 Jan 2025 08:56:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1taVbX-00000005Dfc-3Rxq;
	Wed, 22 Jan 2025 08:56:51 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pmdomain: ti: Use of_property_present() for non-boolean properties
Date: Wed, 22 Jan 2025 08:56:50 +0100
Message-ID: <accb12bd6d048d95bd1feea07dd1a799ad3f8b31.1737532423.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_235703_450856_C355A96C 
X-CRM114-Status: GOOD (  12.39  )
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

On BeagleBone Black:

    OF: /ocp: Read of boolean property 'clocks' with a value.
    OF: /ocp/interconnect@44c00000: Read of boolean property 'clocks' with a value.
    OF: /ocp/interconnect@48000000: Read of boolean property 'clocks' with a value.
    OF: /ocp/interconnect@4a000000: Read of boolean property 'clocks' with a value.

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Seen since commit c141ecc3cecd7647 ("of: Warn when
of_property_read_bool() is used on non-boolean properties") in
dt-rh/for-next.
---
 drivers/pmdomain/ti/omap_prm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
index b8ceb3c2b81c2510..79d165331d8c6379 100644
--- a/drivers/pmdomain/ti/omap_prm.c
+++ b/drivers/pmdomain/ti/omap_prm.c
@@ -613,7 +613,7 @@ static int omap_prm_domain_attach_clock(struct device *dev,
 	if (!of_device_is_compatible(np, "simple-pm-bus"))
 		return 0;
 
-	if (!of_property_read_bool(np, "clocks"))
+	if (!of_property_present(np, "clocks"))
 		return 0;
 
 	error = pm_clk_create(dev);
-- 
2.43.0


