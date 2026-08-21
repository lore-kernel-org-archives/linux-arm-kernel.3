Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB26DC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4REjDq3qQ541r3i4ayJG3CleHwU/s8ILvHOWp0kZT8=; b=M/3WLsa1sJrUUl27KoVEMG+v2M
	/+akueugqJsl3ZWKxhZnosvDFo9EgV5KzS+sqUKjPWWDnS2o3VPY9Um2CMNBaMNEma8rS2O2KIZG+
	Fu/so8+D4fUrP5tksl05yRYR4N6AnQ5aNKcGD99n4KR5qdSnhrQrloecthVXTTYRO4BoS43ex1rLf
	ajIrMFgwBAgGonmys69roY+XDYFki+KEwVwBeiCciNJqYNaNwSApGo7CvDNrQiExyrEa9bdsqcLNy
	A6gZpgQZX4oSPUgLxxAA3qZdDEGjD5qZaRsC3CM6q2ziPtcbzrE8cb5Xzj4X5S2g0fVBfXP41Z87U
	eMo/Ma8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxON5-0000000DJ8J-2Rmr;
	Fri, 21 Aug 2026 12:29:19 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOMu-0000000DJ2w-40k8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:29:15 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2d5335cf904so6841785ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315348; x=1787920148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4REjDq3qQ541r3i4ayJG3CleHwU/s8ILvHOWp0kZT8=;
        b=Qd7L8QRcZSR7nY7C8NXICHOxtK/dSKW/kARoTkj4A+EwzSc3XUNdOqkf0LpIIbVKJa
         S/gC2VF1ZYUBvhXdVCyjhD25C6mcxIBz3ymfLMJZJdKv0H0zrHMwz6qYDGUkHLUZ0Zos
         jmfSbKhbrVa1MwP4SsMgCspg4bMKZGnq8zNCu2bTs5psR+fjvRoHXe3Crh/hWGH3W7QJ
         P48fEh5kBZ9K8YbqAWErUspk4gE6oHuryFFZNPPuWMNI0hZpan8GjvScGCAP7i5o0WbP
         xHCPszYow9I0l+BzTNPzeJxeyyTDtFKgSkBTPenaaIbfyR4uQsAxLdcu6z++dcJQPMwB
         dmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315348; x=1787920148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4REjDq3qQ541r3i4ayJG3CleHwU/s8ILvHOWp0kZT8=;
        b=Ffj4sKnzpEZIplnKav7p/5kc8kdSBrbiXZm0o3h0dSq3t2H+a3bVI8HC1lOuYCP7sY
         JM3p5oTGb+UxDFEuqMQpw/tmAfUGs9MALfMD5jfzIf78dLRwOgHO8uVLb+JFPcZ8yzyC
         3qH5Gc3iJEau+PAVFPoxerFUdkYefnPPvmFCauqJ243sgKi7I8HSk6pH57VpztZE/qpc
         aeJTxT9K/cPGjpaTkfMUJ8OXG49t4TOheXXEiXWDhbyfE/vs8+TmB64KlPtaQjIvfzWw
         9mZBnxdULrRjbaHvFBHV+dFcOOrZJU7QbPbDd9EOrSGvO6gwmgXwYHhSrBbWr+63n4Jk
         +eYg==
X-Forwarded-Encrypted: i=1; AHgh+RqmS9yoHu5vb8boK+P14tPU2pm6TypghKYU6+q1ZdJm6Do9qBrPERvL1DATxFCslFMrTfGELaF0XPfiMpEA/edL@lists.infradead.org
X-Gm-Message-State: AOJu0YzOi6jTlh5/msDT/2GgGBtuHau9Y8nSHIwwpdeJGQDjPf4DXedi
	LlnAePifdnG6VKDb6LW2tUlYN2cr/oyFSZviztE6UTlYp4vMn0jOLftf
X-Gm-Gg: AR+sD11Pdidc0zKnR1qgSI4oB6Nrwp+bAfqYx6OV1Pan9B56F9fq2/kh8I2co/do6/z
	dDquYS3OeYFYrQNAOMW3GCAX6gx3WICqm2+33J3E2zojnKwKNbo+GZ01Vgu/q9ytLOjchk0o7jo
	Jyc25+yuTvKZ/3tigwo01vk3Sx0XyanDdgcucFcMLv52OwLHOFGPPzK1+VfnCEEX0vWxsVPvAOS
	ECf4C/bAOuu15G+eXyDmdo+PWk9BwyKcuz1A+kccaWX82P10j0W7Tz82xToZJQn3hCdV+DOWwjH
	fmxuR3ckHvyZs06vBwnQY9SKAH84potGZY16JkA0b6LfPrT6ba+U15OkbGI39vMiTO3Mqb8MPfp
	/1PyI39h/02lLv5vFHffTwD5o10fM9hK68VeHbtGL750fTsFDgXHt7PffIqlnUXi+w1iNRmGNlI
	pl28z8DMNAuptIe5IW/QA5+gimQf1ExQnETIejnrfiYZ36STIhQSvtbaG/nzH74KKqfQZQBxVQZ
	tr+eJDbwxAeJAISLiZz/Jz3tFfDEetI/PmXiZwixkcOclM4EFO1psIH4n9GcfDR6cGNsfiprPXC
	jCnr
X-Received: by 2002:a17:903:2b03:b0:2c7:f4bd:91b5 with SMTP id d9443c01a7336-2d64a9b349bmr122049005ad.0.1787315348266;
        Fri, 21 Aug 2026 05:29:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554450sm18134515ad.2.2026.08.21.05.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 3/3] ASoC: mediatek: mt6797: Drop redundant probe error messages
Date: Fri, 21 Aug 2026 19:28:40 +0700
Message-ID: <20260821122840.41266-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122840.41266-1-phucduc.bui@gmail.com>
References: <20260821122840.41266-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052909_020861_BF97886B 
X-CRM114-Status: GOOD (  13.57  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v2:
 - Update the subject prefix from ASoC: mt6797: to ASoC: mediatek: mt6797:.
Changes in v3:
 - Add Reviewed-by tags.

 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index f62a32f2f2b6..dfe67727fe47 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -754,10 +754,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt6797_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* regmap init */
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
@@ -800,10 +798,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt6797_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		return ret;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


