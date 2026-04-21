Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7823F94CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 19:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BnyzOjAbGINIFwzFjrQgr+TpUxRpisGZhsHzj0vzqJg=; b=VJj1xd0PTwPacosxaYGqyMwZt7
	sG2uNyhV7S3AdIYU7lgUmjyK7Nju1ptfLoN/0pmpZy1jV/p7dSOwzeoG0TMiwP6rgtwJ1G9v1NTP8
	TuaN3c1BWr7t6THKrEjiaQQQ3eG1tO+GX1dTmzRPdqfo5jbHWwq5hwy2uOjXEnQjxbnD6qtfxKOkr
	PKNN77e+fPk0sk7PUgyvDV5XRNQp038prvlyNYlC44++afbIa/VwuaZMX6g/HoElNHGInQ4aqF7zr
	r6AFU9d5eQ1ijc4PgFYi0PpjI91+wgNwyXjd5rIiVF0SMQAG8WIuUl4e36UaWQXx7pfeUPKixNSQp
	sTXz1ASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFGpD-00000009570-10S5;
	Tue, 21 Apr 2026 19:31:59 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFGp9-0000000956f-0Icl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 19:31:58 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-12db63c6df4so1055381c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 12:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776799913; x=1777404713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BnyzOjAbGINIFwzFjrQgr+TpUxRpisGZhsHzj0vzqJg=;
        b=umdWYZmhn6388igd+be4XeH1Lrx9hqSMJOvBSn3vvxtKqUQdraApbdj3N7ResB5MkZ
         a/QdrmdUay5O+TPPO1SbRek3jUohaWBAE1LJw6IlBHmXFM2Cb9MrMwat9q8xUppm6rMr
         AfPyQAqnrcEUkPDUl34Jkl0i4cegSn6jzQQpAhDB8AW2QOE5jc4itn9NgO5gfO16TkP6
         O+ybZrLywcjZKTjik0yM8OuLiD+lUJddgCZtvkZLHirUh+SiFRJsG1jsw2V0oA5sKz7Q
         5QqgKwnn89le1DRE+wF4/hX9Gy5o/gAQEntgVmWDPVNAaxhfIzBG6t+HFBUJV/W5k++c
         yQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776799913; x=1777404713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnyzOjAbGINIFwzFjrQgr+TpUxRpisGZhsHzj0vzqJg=;
        b=pZ6hRBfk29g0y98kQ+A041vAX7PeZjNugnGnKP2pw4tuOSIWRxzi2Cj7/qi1nv+pV+
         yIAAmxqQu3n7xauya3am7x+Iqw8kRQx8kcfI0OdWS18XFdmzoxprtmkWHwEQX16YjOwu
         4OfRXix3w/4WymfDqaIW1g5cJ9OOlS7s18TLt5QYKx+q8Sit0PxNTiD/wAw6OGQJ/fZD
         eWHdcSuqakQ8+VB6kANp/tefN2MO8tD06mfCk/1+hmQwW6bflnF6+zsbupCm9IR/FwvN
         8x2TLdWmsKVDb/Yukm8VnlsBmJKlGvU+nuSvdc+0tL3H6ybC3gqJ4O9aw/mqp9xvP06R
         f0fw==
X-Forwarded-Encrypted: i=1; AFNElJ+AfHheQcRYjbe8Pectw8ijIGlTIzaNr8CGnEhQBLpd7BzUXltkhv80mfxqFPHHAlWQkYOSoabjM3ON8jPVjj2+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqg+6B55D0r3NzIAXZ3o5XKT5GMo2rirq06YnBY3165AuAOpVJ
	90s0C9DqRfKhdiP/kW94Wxs2o8PK/E4ymVrw0BXqnYut08HEy4SOS/QxAswzJ+PuMik=
X-Gm-Gg: AeBDietFKmrgoX4ODDOwK9eZIMDSkyeAyQyPxgaZ77txuSOBgPSinRgU5z3gaVgZVR8
	vCU7Ibp0R3vW16/BMjLHGCuh9Pdjc+d5cScV/bClV9zHVKxwrOOCEEs07REewnJ+79O/Y3JK3kN
	9uNtowLre7Bq8cUvU6VU1UZrpEr9+Uab2y6MnS8UdVM4Ifn0QOXkO/jeAx+kXyNmYrczt2VcmdI
	ZP3gd8Uj/T0uId+DxCbQwVedYvnXxcc8w/DYJvcJ08xYoWN1m9SOyGOwOo0ln4fxxlPi7IKS/Aw
	93P7UZNPT5u7N2+RDSeXzM6di4+ZiREjUclvJVpfcUV+tAEK4z9gd7jqEEXQol3dLyucifJrLiT
	YVlblbQfmN+SfMXWMhqk5EiYfnb79tS/bvO4wKgfa6gYalO+3bYpTGy78uArFlOTyWj0v0YiRns
	qcIjqeLYIG1+JPmy8ErPCxQJkWxSZvVUXziEF5SLE1lA==
X-Received: by 2002:a05:7022:6627:b0:12c:8b9:7200 with SMTP id a92af1059eb24-12c73f95211mr10548058c88.17.1776799912582;
        Tue, 21 Apr 2026 12:31:52 -0700 (PDT)
Received: from localhost.localdomain ([191.181.59.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa3ce1sm19288921eec.4.2026.04.21.12.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 12:31:52 -0700 (PDT)
From: Gabriel Jacob Perin <gabrieljp@usp.br>
To: claudiu.beznea@tuxon.dev,
	andrei.simion@microchip.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com
Cc: carlos.albmr@usp.br,
	Gabriel Jacob Perin <gabrieljp@usp.br>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] Change manual bitfield manipulation to use FIELD_PREP()
Date: Tue, 21 Apr 2026 16:31:13 -0300
Message-Id: <20260421193113.1060213-1-gabrieljp@usp.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_123155_637281_6DB583E8 
X-CRM114-Status: GOOD (  10.80  )
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

Co-developed-by: Carlos Alberto Marques Rabelo <carlos.albmr@usp.br>
Signed-off-by: Carlos Alberto Marques Rabelo <carlos.albmr@usp.br>
Signed-off-by: Gabriel Jacob Perin <gabrieljp@usp.br>
---
 sound/soc/atmel/atmel-classd.c | 41 ++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 1f8c60d2d..6693bdcbb 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/bitfield.h>
 #include <linux/string_choices.h>
 #include <sound/core.h>
 #include <sound/dmaengine_pcm.h>
@@ -236,34 +237,34 @@ static int atmel_classd_component_probe(struct snd_soc_component *component)
 	u32 mask, val;
 
 	mask = CLASSD_MR_PWMTYP_MASK;
-	val = pdata->pwm_type << CLASSD_MR_PWMTYP_SHIFT;
+	val = FIELD_PREP(CLASSD_MR_PWMTYP_MASK, pdata->pwm_type);
 
 	mask |= CLASSD_MR_NON_OVERLAP_MASK;
 	if (pdata->non_overlap_enable) {
-		val |= (CLASSD_MR_NON_OVERLAP_EN
-			<< CLASSD_MR_NON_OVERLAP_SHIFT);
+		val |= FIELD_PREP(CLASSD_MR_NON_OVERLAP_MASK,
+				CLASSD_MR_NON_OVERLAP_EN);
 
 		mask |= CLASSD_MR_NOVR_VAL_MASK;
 		switch (pdata->non_overlap_time) {
 		case 5:
-			val |= (CLASSD_MR_NOVR_VAL_5NS
-				<< CLASSD_MR_NOVR_VAL_SHIFT);
+			val |= FIELD_PREP(CLASSD_MR_NOVR_VAL_MASK,
+					CLASSD_MR_NOVR_VAL_5NS);
 			break;
 		case 10:
-			val |= (CLASSD_MR_NOVR_VAL_10NS
-				<< CLASSD_MR_NOVR_VAL_SHIFT);
+			val |= FIELD_PREP(CLASSD_MR_NOVR_VAL_MASK,
+					CLASSD_MR_NOVR_VAL_10NS);
 			break;
 		case 15:
-			val |= (CLASSD_MR_NOVR_VAL_15NS
-				<< CLASSD_MR_NOVR_VAL_SHIFT);
+			val |= FIELD_PREP(CLASSD_MR_NOVR_VAL_MASK,
+					CLASSD_MR_NOVR_VAL_15NS);
 			break;
 		case 20:
-			val |= (CLASSD_MR_NOVR_VAL_20NS
-				<< CLASSD_MR_NOVR_VAL_SHIFT);
+			val |= FIELD_PREP(CLASSD_MR_NOVR_VAL_MASK,
+					CLASSD_MR_NOVR_VAL_20NS);
 			break;
 		default:
-			val |= (CLASSD_MR_NOVR_VAL_10NS
-				<< CLASSD_MR_NOVR_VAL_SHIFT);
+			val |= FIELD_PREP(CLASSD_MR_NOVR_VAL_MASK,
+					CLASSD_MR_NOVR_VAL_10NS);
 			dev_warn(component->dev,
 				"non-overlapping value %d is invalid, the default value 10 is specified\n",
 				pdata->non_overlap_time);
@@ -370,8 +371,10 @@ atmel_classd_cpu_dai_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	mask = CLASSD_INTPMR_DSP_CLK_FREQ_MASK | CLASSD_INTPMR_FRAME_MASK;
-	val = (sample_rates[best].dsp_clk << CLASSD_INTPMR_DSP_CLK_FREQ_SHIFT)
-	| (sample_rates[best].sample_rate << CLASSD_INTPMR_FRAME_SHIFT);
+	val = FIELD_PREP(CLASSD_INTPMR_DSP_CLK_FREQ_MASK,
+			sample_rates[best].dsp_clk) |
+		FIELD_PREP(CLASSD_INTPMR_FRAME_MASK,
+			sample_rates[best].sample_rate);
 
 	snd_soc_component_update_bits(component, CLASSD_INTPMR, mask, val);
 
@@ -395,8 +398,8 @@ static int atmel_classd_cpu_dai_prepare(struct snd_pcm_substream *substream,
 
 	snd_soc_component_update_bits(component, CLASSD_MR,
 				CLASSD_MR_LEN_MASK | CLASSD_MR_REN_MASK,
-				(CLASSD_MR_LEN_DIS << CLASSD_MR_LEN_SHIFT)
-				|(CLASSD_MR_REN_DIS << CLASSD_MR_REN_SHIFT));
+				FIELD_PREP(CLASSD_MR_LEN_MASK, CLASSD_MR_LEN_DIS) |
+				FIELD_PREP(CLASSD_MR_REN_MASK, CLASSD_MR_REN_DIS));
 
 	return 0;
 }
@@ -418,8 +421,8 @@ static int atmel_classd_cpu_dai_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		val = (CLASSD_MR_LEN_DIS << CLASSD_MR_LEN_SHIFT)
-			| (CLASSD_MR_REN_DIS << CLASSD_MR_REN_SHIFT);
+		val = FIELD_PREP(CLASSD_MR_LEN_MASK, CLASSD_MR_LEN_DIS) |
+			FIELD_PREP(CLASSD_MR_REN_MASK, CLASSD_MR_REN_DIS);
 		break;
 	default:
 		return -EINVAL;
-- 
2.25.1


