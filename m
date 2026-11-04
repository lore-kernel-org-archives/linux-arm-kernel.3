Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0BE606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 02:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DLMeptVC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zoUNnayjtOPtesxZ8Rfcihs6HYJ3wIxzbIkFPcUKSGg=; b=DLMeptVCZIbiau5CX0oVnZDz8u
	iO0a8P2zliUzLXaXepubhdfVQZI373JD+ffWJQVtyTqYW8tNoEJxlraEZTW+VD+mrJeEOV1W4SN50
	xJybcxGVV9UaNoYA5VhGbTW9MpkJyeda7yEtzOJ64ib2kIlc2wR/Zz91dMilagqBZpv6Nt1vaAELz
	RZPlmCS78pHJzZL/9NmA8eQeqjoDbE3OdIcbsEDtifheIqqt2Tsd1s2d4joKVfPB9HkpSYSdvyWHD
	144LL+A6EU7t4ERUPO/4oa1CJQznNPGLbrO0JNxdpiLnG6nes/7yXUU+IhjisgnNyKrjPDZtnYORs
	fIKbxD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQWC-000000047yT-3rfV;
	Wed, 04 Nov 2026 02:14:28 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQWA-000000047wK-1Gbf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 02:14:27 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACHsvz_lOpqDnU+AA--.5027S2;
	Wed, 04 Nov 2026 10:14:23 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: imx8m: unregister the soc and cpufreq devices if action setup fails
Date: Wed,  4 Nov 2026 02:14:32 +0000
Message-Id: <20261104021432.1468280-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHsvz_lOpqDnU+AA--.5027S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1DAr1kWry5KF4rJry8AFb_yoW8Ww4UpF
	1vgay5Gry0yr4DWw45Ja1UGFy5G3ZxCw48Cr18J3savw13JFWFq3WIqa4Ut3W5tFykur4a
	vr1jg3y7uayYyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2
	AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v2
	6r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14
	v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0E
	wIxGrwCF04k20xvE74AGY7Cv6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI
	8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
	xVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU5gZ2DUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRQBA2rqY-m34AAAsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_181426_731933_8AC6A3C2 
X-CRM114-Status: GOOD (  11.82  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

imx8m_soc_probe() registers the soc device and the imx-cpufreq-dt
platform device and then installs a devm action to unregister each of
them.  With plain devm_add_action() a failure to install the action
returns the error without unregistering the device that was just
registered, so the device is leaked and its sysfs name stays occupied.

Use devm_add_action_or_reset(), which runs the unregister callback when
the action cannot be added.

Fixes: cf7139aac463 ("soc: imx8m: Unregister cpufreq and soc dev in cleanup path")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/soc/imx/soc-imx8m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 70b281927c4b..ffca59c3b6c8 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -290,7 +290,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	ret = devm_add_action(dev, imx8m_unregister_soc, soc_dev);
+	ret = devm_add_action_or_reset(dev, imx8m_unregister_soc, soc_dev);
 	if (ret)
 		return ret;
 
@@ -302,7 +302,7 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 		if (IS_ERR(cpufreq_dev))
 			return dev_err_probe(dev, PTR_ERR(cpufreq_dev),
 					     "Failed to register imx-cpufreq-dev device\n");
-		ret = devm_add_action(dev, imx8m_unregister_cpufreq, cpufreq_dev);
+		ret = devm_add_action_or_reset(dev, imx8m_unregister_cpufreq, cpufreq_dev);
 		if (ret)
 			return ret;
 	}
-- 
2.34.1


