Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE105107636E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 05:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TqXeE1rQlqr6QcqYfefYS/LC345SjKPUh5iAhbHfsGk=; b=ydAhseA8e8ZVqQOX3rAa0EUyoI
	XFtJm7zJerrl1TdxoB6odp7v3ffLqWvbndR9t+afZ/B9BM+VQ14MYLVA/kNwDiN0cnJtJDCv896UE
	aCeaortg4pz8LgDRbN41TTiWa2PxqAfN7oj7fZG2JIx3JK0aBwLzzrCEfKqE1Vtm9LWpNCF/Qyj5I
	/i+ZG9Wiotvwgixr12Qlr8CsJi3SV+NJqkWnqDp068d6tPQtBhT0VqiZogHfl6xnSriA6CivW+Umg
	FLVsA6hUzoyVrFNQ5ruzS9MIXrnBRYK8dA5jJux+ACIUQbIKEopi9rZv78B72gWDmwzfxFHAsGYS3
	DDznCzsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7oAQ-0000000E01m-2sOd;
	Wed, 01 Apr 2026 05:31:02 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7oAN-0000000E01C-29Jp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 05:31:02 +0000
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-01 (Coremail) with SMTP id qwCowAA34m2LrcxpWi7UCw--.2635S2;
	Wed, 01 Apr 2026 13:30:53 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH] ASoC: mxs-sgtl5000: disable MCLK on error paths of mxs_sgtl5000_probe()
Date: Wed,  1 Apr 2026 13:30:51 +0800
Message-Id: <20260401053051.586290-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAA34m2LrcxpWi7UCw--.2635S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZw4xGrWDtFW7uF1xCryDWrg_yoWfXrgEya
	yxu34DXry5KryfCr9rurWYvFy8Wws2ya1xGr1ftr4UJ3sxJa98XayDJrs8ury8Zw4vga4x
	Zr1UuFs2grWSgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwoEE2nMj+FgJAAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_223059_939095_683873D1 
X-CRM114-Status: GOOD (  10.32  )
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

Call mxs_saif_put_mclk() to disable MCLK on error
paths of mxs_sgtl5000_probe().

Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 sound/soc/mxs/mxs-sgtl5000.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index 245f17411638..f1c0e612313d 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -157,13 +157,16 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(&pdev->dev, "failed to parse audio-routing (%d)\n",
 				ret);
+			mxs_saif_put_mclk(0);
 			return ret;
 		}
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
+	if (ret) {
+		mxs_saif_put_mclk(0);
 		return dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
+	}
 
 	return 0;
 }
-- 
2.25.1


