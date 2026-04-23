Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A351FDEE2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3cS6NH9E8iMTfroFqTmMb96mOe5Oq4jySf9tVkSpS0E=; b=Fit9M92qWiQ+cye7LI4EY4aKHE
	VlJphO5E39sxy9npDkSXf5/OWKlEAMxcThuG1O0IK+/CWjW+st9piYBHAsy0T2Bzs2XdXrSmkdq5Y
	5eu2lrSSzw68zLSVhBAnubCm4OXFgWxc2f28pDHRPPVWn6dqy/9bxD6ushxd0r0ncp137iywtt0QA
	5Cnx1IHfOs9FWtQKwE2Wsw1sed7xLEGi9pIuk2o8GnxexCMd1+1V1vVm5NJuQ4VKBtdDECmVbRQzK
	67Y2EVDomFKJlsyPwAh4RgFUd6a4DzTokDkj6Ac12Pb3svOqZVWwE3xYujCj2C25WnlILnxOP8MkD
	Qnwpr/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxZo-0000000C0s2-3RYx;
	Thu, 23 Apr 2026 17:10:56 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxZk-0000000C0oP-3kiP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:10:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776964229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3cS6NH9E8iMTfroFqTmMb96mOe5Oq4jySf9tVkSpS0E=;
	b=XuBoKW+xP6iSvg7To16oj7kI2BMDc2k+kahcJxzfuUNCudZzYkzfMBZtk3hk82hybl5+bU
	VRwtheiO87Wxii5zFqSt2FjxCYdTh2DU01XMufFTXghpOYW93mfLzMyjXOxoQM6LfTbfDW
	OIS52TtFOpJgdQyGVSnAUk5hNUZHMWk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ARM: OMAP2: use snprintf() in multiple check revision functions
Date: Thu, 23 Apr 2026 19:10:17 +0200
Message-ID: <20260423171016.275157-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520; i=thorsten.blum@linux.dev; h=from:subject; bh=D28Kj9u8DhpEqyh/jTasmroDlK45kJPAKG9CzxmRkbg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmvgirYdn8N+V3opn1HR1c0UNHFRSxsjr7gK4+m1KSb+ wUvSZ3sKGVhEONikBVTZHkw68cM39Kayk0mETth5rAygQxh4OIUgImIMTEyrKrdsanQaolZo+Jj 3cXtHa8d4vxj3X/NP7jdsLexILltPcP/vNC25ddKPKdstTqQHZjIuNlmKXP+Gfmn/213XhY6/SK SGQA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_101053_085960_F2DFF39C 
X-CRM114-Status: UNSURE (   7.88  )
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

Replace unbounded sprintf() calls with the safer snprintf() in multiple
*_check_revision() functions.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm/mach-omap2/id.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-omap2/id.c b/arch/arm/mach-omap2/id.c
index cf2bfb447ee2..44d7471666a8 100644
--- a/arch/arm/mach-omap2/id.c
+++ b/arch/arm/mach-omap2/id.c
@@ -192,8 +192,8 @@ void __init omap2xxx_check_revision(void)
 		j = i;
 	}
 
-	sprintf(soc_name, "OMAP%04x", omap_rev() >> 16);
-	sprintf(soc_rev, "ES%x", (omap_rev() >> 12) & 0xf);
+	snprintf(soc_name, sizeof(soc_name), "OMAP%04x", omap_rev() >> 16);
+	snprintf(soc_rev, sizeof(soc_rev), "ES%x", (omap_rev() >> 12) & 0xf);
 
 	pr_info("%s", soc_name);
 	if ((omap_rev() >> 8) & 0x0f)
@@ -519,7 +519,7 @@ void __init omap3xxx_check_revision(void)
 		pr_warn("Warning: unknown chip type: hawkeye %04x, assuming OMAP3630ES1.2\n",
 			hawkeye);
 	}
-	sprintf(soc_rev, "ES%s", cpu_rev);
+	snprintf(soc_rev, sizeof(soc_rev), "ES%s", cpu_rev);
 }
 
 void __init omap4xxx_check_revision(void)
@@ -594,9 +594,9 @@ void __init omap4xxx_check_revision(void)
 		omap_revision = OMAP4430_REV_ES2_3;
 	}
 
-	sprintf(soc_name, "OMAP%04x", omap_rev() >> 16);
-	sprintf(soc_rev, "ES%d.%d", (omap_rev() >> 12) & 0xf,
-						(omap_rev() >> 8) & 0xf);
+	snprintf(soc_name, sizeof(soc_name), "OMAP%04x", omap_rev() >> 16);
+	snprintf(soc_rev, sizeof(soc_rev), "ES%d.%d", (omap_rev() >> 12) & 0xf,
+		 (omap_rev() >> 8) & 0xf);
 	pr_info("%s %s\n", soc_name, soc_rev);
 }
 
@@ -637,8 +637,8 @@ void __init omap5xxx_check_revision(void)
 		omap_revision = OMAP5430_REV_ES2_0;
 	}
 
-	sprintf(soc_name, "OMAP%04x", omap_rev() >> 16);
-	sprintf(soc_rev, "ES%d.0", (omap_rev() >> 12) & 0xf);
+	snprintf(soc_name, sizeof(soc_name), "OMAP%04x", omap_rev() >> 16);
+	snprintf(soc_rev, sizeof(soc_rev), "ES%d.0", (omap_rev() >> 12) & 0xf);
 
 	pr_info("%s %s\n", soc_name, soc_rev);
 }
@@ -712,9 +712,9 @@ void __init dra7xxx_check_revision(void)
 		omap_revision = DRA752_REV_ES2_0;
 	}
 
-	sprintf(soc_name, "DRA%03x", omap_rev() >> 16);
-	sprintf(soc_rev, "ES%d.%d", (omap_rev() >> 12) & 0xf,
-		(omap_rev() >> 8) & 0xf);
+	snprintf(soc_name, sizeof(soc_name), "DRA%03x", omap_rev() >> 16);
+	snprintf(soc_rev, sizeof(soc_rev), "ES%d.%d", (omap_rev() >> 12) & 0xf,
+		 (omap_rev() >> 8) & 0xf);
 
 	pr_info("%s %s\n", soc_name, soc_rev);
 }

