Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD381CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OsW5XuxVwM9FsQk0onouamkx26JAISpKvkEL/UuxvOw=; b=HGNGkoBbG1AUX+5Sz9bXWGlQr/
	cmWdoQaBKYe1sZ4CR7UrUtjDCSHM9m2VQUkJREcGtyEMpqTrbl/llqApt/gX57nWFuDQNnIeoW9Lw
	kd27a+AFjtFnCVMw4ZAY8imOH9i+UbK41lRi0xtQpdfH+JnR1JTq3uKKhVNf8ENp+xjmZQINbf7Va
	vmC6YvOCc8JZEaNzCVYjzaMb5+Y136ScYfCMBAO7T5Gn0FFddc/4RjfYDogVHOQ/6/03BvMu5JyeE
	Ehs1M6eHbTaCaHlClU+KveckiGwPjXAU0WQyQNzprCmFFuPmxOuxV9sMfPw09lRtks4tZKTmgf75n
	6eF5r0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZCXE-0000000EkZ3-2YgH;
	Mon, 15 Jun 2026 18:59:48 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZCXD-0000000EkYe-0DZb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 18:59:48 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-9157b949fc7so389774485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 11:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781549985; x=1782154785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OsW5XuxVwM9FsQk0onouamkx26JAISpKvkEL/UuxvOw=;
        b=SNuVFQXJjQE692bct8aWIiqRU5gHMkkqTqKAcq+Bz9XuWc5CMo1vYQa8E6OoIVr2By
         NWKV77pJEaP/toKuxVt8qStseyntAKmfY7by49CZMY+KKwIWA3us3H0LjIBsISGochUL
         s6ywfEj9ZQAZQQ52p5N31XGmM+DAz7JlEhqNusxQHaTarberm6dzGDyOtppKkGJStzK0
         XE9OQlrYNQwsQD4aiEfqdQv9h13V4+Y26Ub/Sajy0H9OZz2S1BGps2nCs9WlSToFOmF/
         l+nvR/fF69MzS1fM+pLK3KwJc8Iw0k48Z7fo3FtmAfj6InnEpv/Z+h8ZaMyn1yNWtCRt
         jlMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781549985; x=1782154785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsW5XuxVwM9FsQk0onouamkx26JAISpKvkEL/UuxvOw=;
        b=lq8NWeip6LBCuSm7n+qRNwXktwKBCER3k6xlzED5r+4YLrMqOSNb8ZkjzlW5K8WvCE
         KX7e5tIAEP6leInrMDpFKEQjQb/xSJ4NigvtgpQj4J6mUzByw8N08b7DTbrZz0fqEH92
         BTvrL5S4y8dTD8HmaofDmVU7OQP00m3EixfdOtzHCjFsg/ClyAGOxEoM5LX8N5WCxTMW
         jo0Tf1MrlZBYeTpmtVxfmpVTZF7PTwKO/PIAkpOb0Qj6ybDo9m1MT+GMieQwqmlYc3dv
         Hb3TvJ189lFIrSoxHIoxzPSlgyH31yoUS+Bp50km1vyABIX5pYZBE0pMTVATz53sl6m+
         EWXA==
X-Gm-Message-State: AOJu0Yy7YD0mqDqBZ5d98s3na+R4S6BMOwGfGAOXqA0+cnuyluHM4RQI
	RxoW4d2iEfq+uoulSZaDmeV4B4C2dmZbSd80N2deziN637ux9OrQBgUh/GFSOsR6iJQ=
X-Gm-Gg: Acq92OGF6ebmC3u62J6lidQ07jn8w+eOeTfv07Ip/ZX1uK3gPIf8KQjOP/EBOfMknyP
	C4MbHCScltmD5iHiqdTnKI0pqnFDMuhG6MJJJw4pdRPE4Lfbbk2ffQLeM13IrKAwoF+VyGyto0K
	tDJhZPGkGhcUZtpGecs7UN5CEBP2japdYwWpYWZ9CfMeZOpfLeNOdpx2j3XtRPqvOue5GDR7KGw
	VeTHVpx0cqcNy0N6ngmaZk3tIg862buzBdhcXyyFldx4/j6JrIUSPbr1d25OWuvUPO7B5HcSWu2
	OYSRxrOyV6Cy4gV5VWlAHZyEIaYdYVfBfE7owIWduG7YuwjrtQodX+t+DiP43aR7h70yOpFuyEF
	m8ZPuKLCnU+f5SdAz1YqHB+DRPx7Ua5IeSArI4Ip5YCcR4O3usDhN63MPp2Z8xIAd4QWvJsYV+5
	z6gsXLlI9R6sHxXqxNkZ3vJ9Skrnh729vesuZ/gnJP
X-Received: by 2002:a05:620a:6cce:b0:915:72e0:688b with SMTP id af79cd13be357-91c27000a51mr141341585a.50.1781549985553;
        Mon, 15 Jun 2026 11:59:45 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a03d6fcsm1145507885a.35.2026.06.15.11.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 11:59:44 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: mvebu: Fix CPU node reference leak in get_cpu_clk()
Date: Mon, 15 Jun 2026 14:59:41 -0400
Message-ID: <20260615185941.732764-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_115947_090929_85929BC7 
X-CRM114-Status: GOOD (  10.81  )
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

of_get_cpu_node() returns a reference to the CPU device node.
get_cpu_clk() only needs that node for of_clk_get(), but never drops the
reference after the clock lookup.

Drop the CPU node reference before returning the clock, covering both
the successful lookup and the IS_ERR() path.

Fixes: f6cec7cd0777 ("ARM: mvebu: remove device tree parsing for cpu nodes")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-mvebu/platsmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mvebu/platsmp.c b/arch/arm/mach-mvebu/platsmp.c
index 18384ea6862c..0f14d7376770 100644
--- a/arch/arm/mach-mvebu/platsmp.c
+++ b/arch/arm/mach-mvebu/platsmp.c
@@ -42,6 +42,7 @@ static struct clk *get_cpu_clk(int cpu)
 	if (WARN(!np, "missing cpu node\n"))
 		return NULL;
 	cpu_clk = of_clk_get(np, 0);
+	of_node_put(np);
 	if (WARN_ON(IS_ERR(cpu_clk)))
 		return NULL;
 	return cpu_clk;
-- 
2.43.0


