Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925A3FDEE2B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkAsnveV0inBO4MynCvtR90bs5VnmNkFUBU/ZEKVlgQ=; b=ejibb2R7FIcSFaC39tgxcj8CsZ
	4hV/BknUT+pS8cPohdPC5CnA4eh/rO1+Kil0O7iic6w82skbRZmpsxUpVtAolAzqHeI1/RiDjbUOC
	hx0itwnFQ4R5x42SvJh/1JUpGXez2QF9dy6tMzLnkGX2/PZbH/S5imTlGQM5MST1ThDXGuWZht0PZ
	GvvmcgPydAgF2IuE0XpodYi7I3945+Aowsj9jHwdTPRuoH5GtT52CyHoQrp8wKphtHf4WB0id8z45
	tEvwK74EMDVheGBPdLW2vFrynKSM1dd3oo46GFwWRcvO+2J4U12aKz3gK8IWxRigWh6FxpcHhY8YB
	y7+3NpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxZn-0000000C0rF-3ft4;
	Thu, 23 Apr 2026 17:10:55 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxZh-0000000C0pG-3INb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:10:51 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776964246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MkAsnveV0inBO4MynCvtR90bs5VnmNkFUBU/ZEKVlgQ=;
	b=N/VtlHkHYcgebUNQw61PobUQEY++oATBjnCvBrmByqyWz1yr9+g/8m0iJZdnAOrZRr5Chu
	GGiDAw9OZ5F3mZJVdG/RPnMsbZsWnA/LebVzRLKv5jRfx9Emb+aisaQWgA94UBxly1HFji
	1t/ZcS/a+xKH4JIu4kck+1UWbxltbYs=
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
Subject: [PATCH 4/4] ARM: OMAP2: zero-initialize local buffer in omap3_cpuinfo
Date: Thu, 23 Apr 2026 19:10:20 +0200
Message-ID: <20260423171016.275157-8-thorsten.blum@linux.dev>
In-Reply-To: <20260423171016.275157-5-thorsten.blum@linux.dev>
References: <20260423171016.275157-5-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=677; i=thorsten.blum@linux.dev; h=from:subject; bh=Tyy74BheUnS6akjxm10ICD3h+JaOsQInqTbh3L5x9oI=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJmvgqresC5k26ke5R7AdT9+2yYzz9mal3Zu+mwzQZdtX cZrv01MHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRt3qMDF/9GTZPUMlaxzYt +9aig373zs/4vuXV+8490tUzOxbKvNVlZHhgLq+29uavqG1Ou79cW2PQzbahtfx1+dbyvf88+jc VSPEAAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_101050_619386_0229DA14 
X-CRM114-Status: UNSURE (   8.88  )
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

Remove memset(0) and zero-initialize the local buffer instead.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/arm/mach-omap2/id.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/id.c b/arch/arm/mach-omap2/id.c
index 126ffd87f572..9a10e96e65e3 100644
--- a/arch/arm/mach-omap2/id.c
+++ b/arch/arm/mach-omap2/id.c
@@ -209,11 +209,9 @@ void __init omap2xxx_check_revision(void)
 static void __init omap3_cpuinfo(void)
 {
 	const char *cpu_name;
-	char buf[64];
+	char buf[64] = { 0 };
 	int n = 0;
 
-	memset(buf, 0, sizeof(buf));
-
 	/*
 	 * OMAP3430 and OMAP3530 are assumed to be same.
 	 *

