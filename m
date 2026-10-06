Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3769CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SS1ERV4sWn7hoBzl0f2aOYvZXShJQi98daPhEwG/R1I=; b=yoRABil9D0PCHJ3YkjHd60ERmz
	rrnHRso933TCekQ01haZ6X5rnYH+bv4t1t8U1E58Q2LzDrrSBmpCKPBmJAy5Jq0+l88GhD92/WlrM
	Jz+20u41j3/AA7k3O2MbbJb27BU9N4dn1Uj6gc/bxztYOUL0wvaEX6GZv32su6oIAfPhHezPl2Euv
	2yojbs0JiihJYJgJ+mPHGOGUTNCmsS0l9JjxHm0OKk8ql+HdF2Al1zwFtmTnfotokHehhDhE/2609
	BaXH/77aOAmk4r052P+j0tCMvBqvacfvngH6tiBnZ8AtkAokAf8psz4as8CoaC6OiFD0CObeD80zn
	fhAH+4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyFC-000000005wG-3Umh;
	Tue, 06 Oct 2026 06:01:42 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyFA-000000005vi-16LE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:01:41 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-15ea896ddc8so279030c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 23:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266499; x=1791871299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SS1ERV4sWn7hoBzl0f2aOYvZXShJQi98daPhEwG/R1I=;
        b=WpHJuDo4GDiR/TVdq3R6sh8EY7bDLcbtOTnIs3LAdEcJGypyiHVfseKUwh3XvxB+3m
         cUlZRSBJPTBHxlhH9fg8bI4tFVv9V5lDgVnm1LXfTE7Yp/EClNjLd2FYQyiTwEvnSZOc
         gHK8t1meS6NsUqcyzcfZrsxIM9ZV3Ez3DSVaqZDn1fI81EgsCmdhbvMrqqoAetJzmkp6
         uinTFxJ+0Vu7/QcgW/hhdyEgjODRKt3ntvkYq5JKfXV8O1ENI566PrknGf57UkOdHZ9A
         fb4g9RqzRJsfKOd7F47fGJpoZog9ukmOwKrrfbrK0xu4E2IB/t7TULFgNFQgFDaPRqyN
         DYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266499; x=1791871299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SS1ERV4sWn7hoBzl0f2aOYvZXShJQi98daPhEwG/R1I=;
        b=hk5cx2Uq5yATJwmiCarDw3w8wOoLRqYo/NV04Kz6eqseF7nW1tRQD/bgsBtb9DMmzH
         gG8XRqNqQfAvbMRH41Yl5zKVvIajcJRrfxZPzG590nLtcN/bxhbbOA25FahToriA0RSd
         8MTXG2e3oSR9Dbr5uJAVEm5CNG+bhIqVJnnHxQZRJx/PoUXfBnau4yvwjl+6IwgrB5S+
         ls2eeaIYPCZihuYuQinqDATucqlFFttL6MDNunCmY1zgJwaSNy7aEUJh5t3OjQyvy7ce
         B8ZPcpgn0WIevbcNOze0KPIgXQbTV2zV7th9hXkA9QUWr1iovtJTKwQ8ws7OinOtYQs8
         9lCg==
X-Forwarded-Encrypted: i=1; AKwUvBzeIcTx3BM1pzfEVcaaJqxkgr3GVEyd9Da3d9tuNa+8CF474/i0nWqQ6VQhYMYf90pzKBLwNj0rkq1o1rHdtK/r@lists.infradead.org
X-Gm-Message-State: AFuF++k3IEC1jPEoYwMjmIlNmFHLPyNQvckfoFPd+t5e42kBJoDurchP
	T4//nQ8l7/8XeDkPK/s7JJNBsm5rbknP6DwJRYgMSE8DZKrlmMYl5Ir+
X-Gm-Gg: AYBFou36UKKXfjYyLwF/F7auwAF/I+6VqoRK9Do8heYoNhzZ5yHwEnLLD6zmk1J9ltc
	yYJylvJzdimbqz5ZONafYlQkhSBHDjLyxiBF7n4riIi3V7T2lW8H57RuNbOE+7pddoA51PasClm
	Nvaip6xUypL7rYNMEKHC2XDBFofgiLGd2l6aAygqYtGumsjQcgXqbw8oPkK8xfiuX8OkFMT06V7
	2xLy4J3/4YDTlwWlREyWM4B6Mrn9FbrlzHW0WAcGFwZK4UVGK4w6VtsTcfT28Y+MkUwEOrXe1Lv
	EH5V9nJesV5W6zKWaqQaNrWAhfkM+pM1qrY8JR6Ut0W10J8mR/p9LCkacbvKjfETaZjPriFDMfr
	pp8cedYvY8vYa66v3gnzrENOd25kXIFoitsLigNVb9EOPjp+wvTc8AKK3+lOpxo7hFIA1N7uRvZ
	nUnSNEsD50oy4c64vTuydA9tqXxv/SNDx93QwAQ0gB48D7rkFE1V1+JEfqtvQPk5I4xL9OAYzTR
	Yu2YAiX3XC6G4WZqMXacQMTJswk00Ggmw==
X-Received: by 2002:a05:7022:f512:b0:143:8865:cca with SMTP id a92af1059eb24-15eca63fcd0mr601967c88.22.1791266498776;
        Mon, 05 Oct 2026 23:01:38 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d819cbed6sm7682867c88.4.2026.10.05.23.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:01:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: imx: fix typo "interupt" in comment
Date: Tue,  6 Oct 2026 11:31:31 +0530
Message-ID: <20261006060133.43320-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_230140_304793_0D9CD097 
X-CRM114-Status: GOOD (  13.36  )
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

Fix a typo in a comment, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only a comment is touched,
there is no code change.

Assisted-by: LLM
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes (v2):
    v2:
     - Split the single "ARM: fix typos in comments" patch up per platform,
       so that each one can be picked up by its own maintainer.
    
    v1: https://lore.kernel.org/all/20260907064849.23086-1-hemanth.selam@gmail.com/

 arch/arm/mach-imx/suspend-imx6.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/suspend-imx6.S b/arch/arm/mach-imx/suspend-imx6.S
index 63ccc2d0e920..3f8670296358 100644
--- a/arch/arm/mach-imx/suspend-imx6.S
+++ b/arch/arm/mach-imx/suspend-imx6.S
@@ -234,7 +234,7 @@ set_mmdc_io_lpm_done:
 	 * mask all GPC interrupts before
 	 * enabling the RBC counters to
 	 * avoid the counter starting too
-	 * early if an interupt is already
+	 * early if an interrupt is already
 	 * pending.
 	 */
 	ldr	r11, [r0, #PM_INFO_MX6Q_GPC_V_OFFSET]
-- 
2.47.3


