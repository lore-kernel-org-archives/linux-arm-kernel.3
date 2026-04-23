Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55357FDEE2B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gorBLGcbnPFGAH2/4QFeUbs8gefs1DDJEPZAI4a0IPk=; b=3itqF2GLEFwF8QJl65t0N3JPcW
	z0+vf/GtTHDy+3cH8YXwi1UstChc8kznnhwhnPQM2M57oV2bdEcJdqC96PpKrGwnlz4NQ+pGyv05K
	Bgj0ichINRb7xEikUDRtwArDRznC0F2w+yPVdYyJFrVjM8RkRqskpJMdahMoCPwai+C2vBIsXlXHn
	FBI7nQ49Vv+yNOdFZ8BdyS4ZmnM9g4SmYMCY5sXHtyLS9sDaFehXVSxdPklmxXgurNm64XrI4RXmZ
	RI0eTdFGxzs2pWimrg7m2eY5nQWa79fQ5WqkagXym04NfYEyJgElwZs8s83gFuEMts5yM2pkKk28S
	f0zZKvRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxZh-0000000C0pa-2yB2;
	Thu, 23 Apr 2026 17:10:50 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxZf-0000000C0oW-2Ikt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:10:48 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776964236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gorBLGcbnPFGAH2/4QFeUbs8gefs1DDJEPZAI4a0IPk=;
	b=Jzwwo855EWXzIkAdC0rmcC5XJUNQQfSQ3Scfp2ZY/LrMrBGvXOkAsuZjcAN1u6r7TrFl4U
	veoTq+/k9xUFArkEbQullUQz4Hv+eqcHHj26tKvLXBhusfvECfsbH/41CJc7NjxCP3DdVc
	Zcc5/kz52Lfmj/QWIKSVfloDnOV+BE8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ARM: OMAP2: use sysfs_emit() in type_show
Date: Thu, 23 Apr 2026 19:10:18 +0200
Message-ID: <20260423171016.275157-6-thorsten.blum@linux.dev>
In-Reply-To: <20260423171016.275157-5-thorsten.blum@linux.dev>
References: <20260423171016.275157-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=887; i=thorsten.blum@linux.dev; h=from:subject; bh=nFVfTyUGFt9QPrEWkty5n0OMahBfbSbjW1nFukqLbgc=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmvgiq/s71a+cn07zfhLlkly2/fxNSDUpMkUyp//5ByO ZjF8+dxRykLgxgXg6yYIsuDWT9m+JbWVG4yidgJM4eVCWQIAxenAEzE7z0jw4Xq8gP7JH+JrbtT xfPop9FSmfDljapb720+KjVfNN08NZmR4YSU9zQlF+0Xp5O2ugncVtV/da9EUzj65I8Dgpm5wTN Z+AE=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_101047_755438_297A8D70 
X-CRM114-Status: UNSURE (   8.46  )
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

Replace unbounded sprintf() with sysfs_emit() in type_show().

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm/mach-omap2/id.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/id.c b/arch/arm/mach-omap2/id.c
index 44d7471666a8..25ded74e4b01 100644
--- a/arch/arm/mach-omap2/id.c
+++ b/arch/arm/mach-omap2/id.c
@@ -18,6 +18,7 @@
 #include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/sysfs.h>
 
 #ifdef CONFIG_SOC_BUS
 #include <linux/sys_soc.h>
@@ -771,7 +772,7 @@ static const char * __init omap_get_family(void)
 static ssize_t
 type_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%s\n", omap_types[omap_type()]);
+	return sysfs_emit(buf, "%s\n", omap_types[omap_type()]);
 }
 
 static DEVICE_ATTR_RO(type);

