Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15115C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=; b=Y3Vj/pbS784JqbZNicUHYQf4qo
	8L8WI6UVx/+mLUWPrBsjqtIYmuJI2PhvCQAIS9aRzQxOMGdFy19B6NMXmtt1QWcZEklJw6rsiRCw3
	e1CgxcGuttJDSRnE6YYSswYtjLNyR/WqKctyLRpt/3E3zjZnpTuDum3rq2ulLQE+9VztZxt/AyTXN
	n4tvPXGMHNXAi8QaIjxgvyR62RuSilEvqtXVx0CrNVG0DMFfW8UXWJqnmhlw3VJmRXiByon7RDCqY
	gjvv7vK8B2Yh/fx09iENm3jOuazSnGpSIGxa4CRz43heQcvBVZa+fxWKqk69xV1DcDFbQRe++Of07
	3dtDHFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMt-0000000EPGw-2M1e;
	Thu, 10 Sep 2026 12:59:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eMs-0000000EPE4-0J3n
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=; b=eMpyTJubvdvRwMAvBxhK6wQ4YW
	t+XEbyzGpGySbAIs1RvZTs/ZrOwxxMmprGqbrG47b87Qc5EXGwb3dZ3a2o4XS2oDoS7VlEaPMXWNp
	G6SRvTeLjYF0VcxERr2MZXRCPiukgeV9loJmTUVxC4gchkoLTpD5E6XTqHfWOMzgsuEwXpBerZhKG
	3w0HdlelpYV9ASc0o4unpFVdyswtEki3tmszukGyHiMKb3rxQh4mwWlQH9eWlU1UST4+6oGwyha/V
	0TFWX2WiHed/t7cxVZ7fNJLkJqz1iwH824Gd4tcerMcdc0HkNrIQ2bSjtpW6y44fU1XVOCawHLIjP
	V6lx5cnw==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4eMp-00000002V7z-16pY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:59:04 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so5899700a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045141; x=1789649941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=XTyopBkuGV7LEOWTfsXjQFOGCsVAXHNb8fXx4Zg4h5jxhJ/n2DAaJsi7i6KA1W3kbl
         aZlnoIMNcfWc4CLtKTd9wWPWVbqoHRg0kFbcE5ftdRrb7USmE5b5zdKeFMuH9c3/4/yM
         /jW0nmIF7vsACLVUOVEoQxTX+nT+asW7JsEZt+kyiuE8aSwDW1Cw8eXYKeNDWFHsYbh1
         vVDQJ4wV9RoFSwCJ6LjoZomwBEb33EDqbhLMGr82HNo/Dd33YSkwMnc+3yCYOtfMeowr
         b45oTashKIWTCdKhE57Q1ouqHjJFyDzsgumRZKNj1G3pe3q7Y1/RuCGdHDcArIFbntKg
         o23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045141; x=1789649941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=IPKg44guRbWc8lDSSl9UeyDt69oLxzvhJIGdMRJYfcFFis6tMGgj1i6waoW8GpgMiT
         4TXGv1pbAgn4Q7bIAkf2YS88Knqyzhg0he1iFFC/d+qmcTYKoEzvVAHKs2JPDYlHsMec
         FxrwGivXCs3GrpenUvBsQswLQw9vAnF37o92vJ0BdCZApst1yuWcBl6XNMFS8KDF/jNa
         JRS65lV3j36wLbN/iJY6fGvd/YEZ3sd26aL09tCZvTwZBQ/tzSWghlhppQquer20uGAg
         ErlGE8p4xgjuv813+ymSC3k0+7FyDrUUf740sVfDMUAr4igALmPsESap7FdFNsYHEY1x
         KRqw==
X-Forwarded-Encrypted: i=1; AKwUvBykY07NkJhan9jJ6HD1dX7v6+8Rt7TCvNQXmr6mbqIpabIUgOEu0f1MvOE58hSC88THxqOBggfFGAAVc1Kvw3Pr@lists.infradead.org
X-Gm-Message-State: AFuF++lcr4aUeNi22qvkZytLmuyfbcspyfw5UDbAraCYDRGJLr8PYt8S
	O1rOVrkXdwnZv5K+yWDaMKsL/nyBSlBkdxPC18CxUP1cTyrSAVY9iGfy
X-Gm-Gg: AYBFou3518avfMOmxiWO3kPUT4gB5WtRr6MOuwF1g7ta/Bla8q8N8dbGBQcX4rX0LVO
	jKcJBrGz3/GGEdHn/wnuSwVC8Hrk5/FOFvEkauw4sYeAt6j22mzAzeGjLzyy6o9M0O5Af7U7iao
	d0qFLPQ8zx51vOzLePIeocHbscUcSaw2VIVmngswtfA5DtGRv4+612ZNaLXWSKiI0ROGy6OnzRs
	JCAX1nXzCl0V7KpPOcjqSH+lpCiL7X9tYgjB76k+VIUxFsyNHFG3I2ejwHGSFppIMdAfINig1ji
	gVwfSoFsa110JKIe864hF3MgFjg5L4XakcKF2eroc1Harpv4B2rGTmQcOqGPQxSDZRmZyFFbAXv
	CrA3VoQrdcEn89R/3nIIogZqpdiX52Fl9kxcdHZ9ysdRXyFiautaIHujJXlwKcX0VzqSBCfRbES
	l4A20Ext3W1Gitf9nDN4M4kc1VyTA2+SlCjkj9FTtqRRZ/yObZtfZ6xOkyIinCFAzQAwBNKJboz
	0Ms2UNjr5cUO/bk8WC8sC9Q0JSJSwNxg2MW+QDFmkKw0vOQOy0nvnHNp5ae8qRXpO/1vnkKH88r
	/j+XYIloDT7WuQ0=
X-Received: by 2002:a17:90b:3a81:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39b2612eaa4mr58543997a91.10.1789045140953;
        Thu, 10 Sep 2026 05:59:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:59:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 13/13] ASoC: mediatek: mt8189: Validate TDM MCLK frequency
Date: Thu, 10 Sep 2026 19:57:42 +0700
Message-ID: <20260910125742.150902-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_135903_380670_0708F44F 
X-CRM114-Status: GOOD (  10.65  )
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

mtk_dai_tdm_cal_mclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the TDM clock.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 1b51027c6cf4..7748b4ff2c72 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -381,6 +381,9 @@ static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
 	int apll;
 	int apll_rate;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	apll = mt8189_get_apll_by_rate(afe, freq);
 	apll_rate = mt8189_get_apll_rate(afe, apll);
 
-- 
2.43.0


