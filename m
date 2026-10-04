Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A1ECA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 04:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TLz4nHVaS7y0EmUWAv+zVMASjUD+Cyg6g4C6h0mdgTk=; b=qBUYZu3DpGflD7OFWoIImr+8/P
	94u70AEKGTkiAboJCf1k8m/7I84ehs/gq0FQSRCOrjQWRgnu5cHHNrFuVV+KIw/IYZbn+oLHufrR6
	cjLgo2mm0aGFkPu9LJVwcRQoKIFQm1dhpmaSJcZH2QzfmWi7X3ohbEk2xlCpCAo3W9KA2K7NODZ6Y
	aqTdBGlA2cPQ2jW/N+dPYwLhNcAUM8lkRh0fVwbhkUI2wspgVJBHsn37rVrAULv4mwrN0dEdDU62d
	5pr3I2pzOpsVPDiFT4WgVceHtpsMNP+LmJKqIfFDWYQIX8KYOiImv22y7wTUYf58W6HSP5pG4cWrD
	fy+yBZbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDDwB-0000000EKuf-0MT8;
	Sun, 04 Oct 2026 04:34:59 +0000
Received: from mail-qk2-x0d.google.com ([2607:f8b0:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDDw8-0000000EKuG-22jv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 04:34:57 +0000
Received: by mail-qk2-x0d.google.com with SMTP id af79cd13be357-93c57d36d37so78379885a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 21:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791088494; x=1791693294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TLz4nHVaS7y0EmUWAv+zVMASjUD+Cyg6g4C6h0mdgTk=;
        b=eGQGvnURB9pNs8WfL/k18R7Yi/NudUX0QIkkMh3OMfm8LPYTLYfN8+CyauMhjSUN1J
         jgL+qKNDo/pj3Ps3Py9LW//+/FBu5/hWTvwOQxTQx4uZfTX7x/S4+cd5zz0pMHckQYDb
         FPBnLJmh5Ixx4rT/KwRS9AoTf0OK9XOJShP9djAq+7p+qqz7MKtraXuI3GzzK12XBnJv
         hn+x7O46q/pR/WHkaIFlcNtoiuD//a1nFZ2bwNr3t3QybnNQ1LhRS0A3kWN8rc/vzusr
         JdQPPHdBFUZhGNHvxnVX3kLEqFQZs8SuAyeL21Rpe4jfehl4SlDea2SxIx3SlFgzx8zL
         dtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791088494; x=1791693294;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TLz4nHVaS7y0EmUWAv+zVMASjUD+Cyg6g4C6h0mdgTk=;
        b=rJ/+SwSzfS35ASn7OmrGy39lJmJnqiASg9dT+ngk1oeQ3NkUOmUTokTyQA4gypBlm6
         4dFlLMudskQvgOHONvxUZr0lxf/g1VW3Wq+/N+TIMSlwvvA2LDpYuCtUP6TGxjIOndeS
         pPN8Vtefu6ScJwqadx0OOeUWYIn/RIhNl9Fms+ivWN7fa3D+nnP8jXBB+3gGh88q0HhG
         igqv+orfFNR5ke88BSHG/VO5FSCh7x+R+o18A6Lwp2TPGMp4sIPUW6bQQDpv8XQgJUV2
         9efVvFnpHvwoG4M5gkjLU4Tm7ACnybsreLGUrS2EJ1loEdN+sE0W+/LD47ozVDgpot0a
         YR8g==
X-Forwarded-Encrypted: i=1; AKwUvBwGTynDnbfuN8+ry8LZM0vxwHcgYGXIKWlLZ6xCXSahFHZ6hcZEStgFehwtN9wztYy2189Mk/QY2zjA994vZb4j@lists.infradead.org
X-Gm-Message-State: AFuF++netZ6ZirzTeYsthNRmQvDQtkVIKKtpHw5hluEk88RIEm5oYc+4
	nmeyuyoSVc3k9dH8VjUfi85nPYOri2XJnlsoYxsvqKuM1+NY4OFwhwU=
X-Gm-Gg: AYBFou2pH8wFv9fOYUlHbcxWHVSnWlf+DxEqyZS0C1zp5tePMs21hoDqXBqQvIaqGjC
	BEMaBp2W0rEDvDzJzs00NR0LPR10Ht1c5jGokrkr/fXnD5psd2GNoT7EL99G5LdpLJOHnralKa3
	jStdwuFYkGhIk5hWQdb5Yw/Vow4BSbcS4PgvF8k7TfCeYrre/wEPjd4YdBVKzFtmA1I/SjjAPZV
	mF+dGnbM4OxHMVfIeVA+55AccuITCA0ajPHqFi82+QuhBGorLcj9YjalTz9Fevf8Y9469CQy1Bu
	Ygm5ctNop+y4UKCX3Bqc74LOz841wdomMidnKWwqg+uxThTr0SDKKtFCznlAStjBTwSXm2ioTyX
	gyAp6s0m3eMTGjMjnAaO4s08EI7U+5zMzefuVSJX7euwlmzHwof06T6kC6aKBoXAHS1i6nzd5z6
	pjRGF/AODKtOoVtqmjNTYh5AVCG0JjuCX9NykNZ6Q5y4fr3FfTnkTCCxkwgyGMvlZFebgFS63vJ
	RbogQFAyy+zurTxA29u5K3pJNETS57fExhhRj6iHqLMMFe8DRH1BiNBbxQaajDbIWWpkKxGv9vP
	8hjjbfcuAS2rUibBZQaEZh4ILGvg
X-Received: by 2002:a05:620a:4113:b0:93c:80d8:57ec with SMTP id af79cd13be357-93cf1a611b4mr1231450885a.64.1791088494588;
        Sat, 03 Oct 2026 21:34:54 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca21d8fcsm596671585a.26.2026.10.03.21.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 21:34:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] ASoC: stm: stm32_i2s: request IRQ after regmap initialization
Date: Sun,  4 Oct 2026 00:34:51 -0400
Message-ID: <20261004043451.1138613-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_213456_538995_43A2CF2E 
X-CRM114-Status: GOOD (  13.82  )
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

The ISR accesses the managed regmap, but probe requests the IRQ before
creating it. An early interrupt can reach an uninitialized regmap.
Reverse-order cleanup can free the regmap while the IRQ remains active.

Request the IRQ after regmap initialization so probe unwind and
removal free and synchronize it before releasing the regmap.

The teardown ordering issue was found by static analysis.

Fixes: e4e6ec7b127c ("ASoC: stm32: Add I2S driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 sound/soc/stm/stm32_i2s.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 83b51893b37c..7fcf23bd0aff 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1185,7 +1185,7 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 	struct device_node *np = pdev->dev.of_node;
 	struct reset_control *rst;
 	struct resource *res;
-	int irq, ret;
+	int ret;
 
 	if (!np)
 		return -ENODEV;
@@ -1231,16 +1231,6 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 			return ret;
 	}
 
-	/* Get irqs */
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	ret = devm_request_irq(&pdev->dev, irq, stm32_i2s_isr, 0,
-			       dev_name(&pdev->dev), i2s);
-	if (ret)
-		return ret;
-
 	/* Reset */
 	rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rst))
@@ -1265,7 +1255,7 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 {
 	struct stm32_i2s_data *i2s;
 	u32 val;
-	int ret;
+	int irq, ret;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
 	if (!i2s)
@@ -1291,6 +1281,15 @@ static int stm32_i2s_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap),
 				     "Regmap init error\n");
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(&pdev->dev, irq, stm32_i2s_isr, 0,
+			       dev_name(&pdev->dev), i2s);
+	if (ret)
+		return ret;
+
 	ret = snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
 	if (ret)
 		return ret;

