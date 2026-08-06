Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC9BC55838
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 05:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oWKqgV2uBxAga3aUXb6pt+JmIGNx/LBE5DxnCPtLR8=; b=dZEM0C6IIYGb4TmBTLKaSqVYmA
	CO0NgdtCoUmmZLBso9PWvZbtm7Pyxf2Ce5PylK6L8cfIKykSoNY8//XoEXJebZjKGSA2JbZgGdp8x
	HkIz07brJp0E4gsYH2J+bRK5g1qYtIigvmEqX+Df/pjHjQ1ZU+GCKu14rzgw6LGeRqSEqYgw3EPIA
	dJXuA48gWYzNBjm27lyKsP8PE3At7GXAOPX89NalkHf+5W1HnGa9U9SM+Bzv7Y2cJvdDqWpH5ZZ/D
	vehMem3TS1eR2giA31aCb+tnu848/fdNyi7yguotmJA3g8K0O2NrDx5tmTbyvS4eQjhEMKVUW9JSH
	r7HpoF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqLw-00000004vyR-3g6L;
	Thu, 06 Aug 2026 05:09:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrqLu-00000004vy1-0ULX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 05:09:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f6609c657so840664f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 22:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785992948; x=1786597748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+oWKqgV2uBxAga3aUXb6pt+JmIGNx/LBE5DxnCPtLR8=;
        b=RfAbOhVrNeQ/O4e4HfVTz0m+iJJj2G1t9yj0WDVOPsvGF6BpAbQxsZf91/cdBMYJ9Y
         RWDBqDWCmHzcq3uq6+BZJOfZHpfdy0CTUtOtotiHgC0L9Vuw5X4zJlCq8bOy+NAA9d+z
         42a33QC56GOHe3Dy/kh6Jgz3BFyshoctrAUDOxpMt1iOzeN/fTjfNsq1yXYc+s0AAqOf
         3BksIIz9T3hXWiCzVSutZmq1yEmv+7RnMwMZWj5cvzYzyjfpIJftRMW02HcO43d8YAHg
         VWEYXTZE72jrdGbPJ71mq1L6MOZ+nns1WBkD+u3gJhi7RJ1DoMFihi9mwS+YHzYUtyba
         GaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785992948; x=1786597748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+oWKqgV2uBxAga3aUXb6pt+JmIGNx/LBE5DxnCPtLR8=;
        b=bkN8YTfMDhakLjzDuvrrPvF3JuYgzikNtKngi805THKQMFbak9+Km/DbBgrZFooS1J
         42lpkKiwD/j8HaR5aGqsK6+5+4dHdqxpyU5LgDxScZZC2FtSBCWoNz4HQ8/+l5wZgV7f
         MXPDPRltkq63G1x010n1yAYOXPKQ9v9iVBXUkeIdVx3nLb2YP0eSrFZ2w1/BThlBGnYl
         HNbrBDPGtbM4YXP9b84oauv/hgwkjcMW/lANnN8ScAW3yAs3ZzTON6rcVHEFK4k1Nbel
         U4iINv9osH97IukcL7wgxoWL/YgnZidwms+I2jvfDWAZseBfPO4TGLwqsZAUSVmxZDJ0
         W4kg==
X-Forwarded-Encrypted: i=1; AHgh+RqfzhBO0WJimi/fEe9gSy5ZUFtbffDX2MWkBR812meX4GNiohf/ouvgahd/jizHOpBO1tg5WTgLjdGAQqtJ6Gcd@lists.infradead.org
X-Gm-Message-State: AOJu0YxMUc79845wB3Hxhrph2cUNQQ1NUn7xdC/1N3IS1uo9QurjC3eu
	Z1XrtROr+5QFRz9hffNKn6yu/ZXPpq3kHcm/iSnh3Vm8NROuxNA0mEGy
X-Gm-Gg: AR+sD10BPsU7vk4bBQcco5bKQLYwJi9RyxLkhlUp2DzSonaLa9yL6ysTuA6H6vMUpM6
	T6VRM1uEX0uLXsK27cQB4wAxS/0YnsZrlP0c4OK6EO3qoqPxBdPFSVfVXi32rqD25Nyd9Gt3TXK
	cklpgRXrhr30oOUAP8sE7N3O7MbC1YEYZHqaL3vmZiQBL9qnMoBto1HJfGRYbJGIPrr+EP4LwJ7
	ixr2DVQCU8G868tC+CIHLVFVOxKcV+KQEe99uSik2ufrMu7niAoOR6pCcbDT8jx+IuYVrlH96Q6
	OzqOtEyyMTI5A9rShsS6OKZifD0G9GvUDMnwwgw/VaRepbx2LcKzmUxUPEutLfJ6Axoyzxr/7Ir
	O5fWN0cwvEKjeiO7vm0lYlvKnyb9p4OjY1kQJLDdqh8BAtQKK5ZLmsgbnO7sFAo33B3sTk67XUO
	NoBY3KLqxwYV22cWlB3zgJ5SZPV6rpXN47tvTrKvUBvgavVa9cF4HflqUywWhFPuUx4sZrO18DS
	ZOLvyUCvw94bHE2ocZUPWGRhiQhP2fFn5ffffaMs/6SGAGjGgTtnPrdr2eMLBR5c1adSXuhbkbr
	PRUQlbxcQjZkCzV5NYPry3XJU3z+7v3Brl8qVOGOnM7lplPG6gAs0NKiup2r7liaObrH+tERAAv
	Lr+gTQaFN
X-Received: by 2002:a05:6000:40da:b0:47f:93b6:8d06 with SMTP id ffacd0b85a97d-47fec482347mr19399636f8f.0.1785992947779;
        Wed, 05 Aug 2026 22:09:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-adf9-2301-8c14-6be6-a9e6-a2d4.310.pool.telefonica.de. [2a02:3100:adf9:2301:8c14:6be6:a9e6:a2d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b183b2sm3315505f8f.24.2026.08.05.22.09.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Aug 2026 22:09:07 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawn.guo@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Anson Huang <b20788@freescale.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: imx6q: fix devres accumulation across driver rebind
Date: Thu,  6 Aug 2026 07:09:02 +0200
Message-Id: <20260806050902.90550-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_220910_194637_F2F1F5C2 
X-CRM114-Status: GOOD (  16.25  )
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

imx6_soc_volt is allocated with devm_kcalloc(cpu_dev, ...), where cpu_dev
is the CPU device from get_cpu_device(0). That device is never unbound, so
its devres list is never released, and imx6q_cpufreq_remove() does not free
the array either. Every probe therefore adds an allocation that stays for
the lifetime of the system.

Allocate against the platform device instead. Its devres is released when
the driver is unbound, which is exactly the lifetime the array wants:
imx6q_set_target() reads it, and nothing may reach that after
cpufreq_unregister_driver().

That makes the array actually go away on unbind, so also clear the
file-scope pointer in remove and on the failed-probe path, rather than
leave it pointing at memory devres is about to release.

Tested by rebinding the driver on qemu's mcimx6ul-evk.

Fixes: b4573d1d657a ("cpufreq: imx6q: correct VDDSOC/PU voltage scaling when cpufreq is changed")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/cpufreq/imx6q-cpufreq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index e93697d3edfd9..8110c95059e0e 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -400,7 +400,7 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 	}
 
 	/* Make imx6_soc_volt array's size same as arm opp number */
-	imx6_soc_volt = devm_kcalloc(cpu_dev, num, sizeof(*imx6_soc_volt),
+	imx6_soc_volt = devm_kcalloc(&pdev->dev, num, sizeof(*imx6_soc_volt),
 				     GFP_KERNEL);
 	if (imx6_soc_volt == NULL) {
 		ret = -ENOMEM;
@@ -485,6 +485,7 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 	return 0;
 
 free_freq_table:
+	imx6_soc_volt = NULL;
 	dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
 out_free_opp:
 	dev_pm_opp_of_remove_table(cpu_dev);
@@ -506,6 +507,7 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 static void imx6q_cpufreq_remove(struct platform_device *pdev)
 {
 	cpufreq_unregister_driver(&imx6q_cpufreq_driver);
+	imx6_soc_volt = NULL;
 	dev_pm_opp_free_cpufreq_table(cpu_dev, &freq_table);
 	dev_pm_opp_of_remove_table(cpu_dev);
 	regulator_put(arm_reg);
-- 
2.53.0


