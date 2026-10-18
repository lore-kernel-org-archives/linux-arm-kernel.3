Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACCFCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 05:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cHPjo/FatMXlsf97zuv28872kDRqNq1vxWPR3qNxVw=; b=OY/JehWTFchnqQWec33XMo+s+c
	J8R1GDipYjZ19R/czLy+raBx4nKhsxLWYX8dCVFqoizmuq/H+RmTheVE6SAVdSYUalQj0zsgFQzwG
	Y2ME75jaS0Mo45gF197qmtIg+3Wyggmrp3Reo9VK1S42LBzJvn5u/m1jp2JdUAZUdSLNYzxNz5vHt
	crvudMug9Vjy7IjcsrNsWqyiYit6zlSBL3W6JfyOWliGf5y947a4H3NY2sIwLGKtB3XF5HKNC4MoY
	t1c3ewHBEAB4QZbzd6r411wOypFl09xnLZc6O/cNhKP+yDXy68H4zJrqFpzmM4ktDLleFoAqjG9id
	ad2Wa8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrH-00000005Za2-3GVQ;
	Sun, 18 Oct 2026 05:54:59 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrA-00000005ZVP-1Vvv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 05:54:53 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so709014a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302891; x=1792907691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cHPjo/FatMXlsf97zuv28872kDRqNq1vxWPR3qNxVw=;
        b=DSVg4WIIEEgr7K1f/xCV6wRMX5x7I5IJWu91Gmcl4cxgtTfUlEi7+qMeeBWQN9yfki
         AvHmwrPAyh+nBzTivKn8o/MK5MffCDWt8Lsnx96ZSEhaq5tA/AOH1uRb1B9VPuPIwxVl
         Ga1NNP53Vae77/PDP9IZSGm0zzNPVtONNUyHbx697NzmXoNA8hL890QVSQ2s3FcRP7uT
         VRqzNZF3YuS5ilUIAzKXXmMLFNwsHs+sSnutFRofURrDw4R3fLrSfMLUkpv2vg4fXzM9
         MstivmYC+esEpHMdXMC4aU+0OJbDQosZM3JGGRXtDoQuVI/HwMgXO0ZAVirjQH9aup8W
         C6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302891; x=1792907691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cHPjo/FatMXlsf97zuv28872kDRqNq1vxWPR3qNxVw=;
        b=FxZT9/vBuSnZX3bpEdv5vxnudYRRrTUflQDyVS9K7OKgwSHXDdlz3p4IePziaU5crx
         04UAJBM/eiLCO/PHJ7cvP7KGmJXlvtVND0IkuUPoSrzeBApz0JdyyVFZg+NucBYo6OVo
         koSV13Mqj8hRVRW9KH2cE+zquD84hKnBUaWrh1CFTlUixgGcCGDmiSsUnh3kgkGmnEj2
         /r7CUN2OlxJnxORUo0GeTItdU1h7cjsDCe0eDH8wZsd8+lKwk3Z4Omlgoj753YM3dW47
         Nr1rGJ5ZR54J9LqSCENtgRrTuT/QXZeIMe5pps98VSMN0NUCQI7svgBN74dDwLS8nt4P
         bsKg==
X-Forwarded-Encrypted: i=1; AKwUvBxeQYrtq2d6y2EW1xi7M6DYLiA2imEBugCbhGv17iukCwe6snBW1Dz0W160qgUY00+nDQhYt1Y+D/+ypIpMvxTD@lists.infradead.org
X-Gm-Message-State: AFq9FYKRcnxaf8ghvQly3vIb3gcM4/bI+4d7M2+HsG6saVVuSx1t7moJ
	HOG23mfV3hY9QjERSKeQEDdz7AFA9CpxqfgO7Ux3nQqcZxI+IYgsB286
X-Gm-Gg: AYBFou3Lm2ejkrYFQcEdvVzkjKd0Cg2QteWrpJ99pE3T8WgAx/aLwKLZYgjJpaiXHeP
	V5Dj0zNfcvbsq+U+ghAyV9AkU0idCXBNz+SR0bT7eBOtreUlRDGyyJTz0BqeTavw62s9OmuXMSZ
	LYLkbBeipTOYf7PmK263N5JKBJnmY+oUMNuk032mHe8GkEJouth1gId09Q1ldIP93VaytqqL82F
	ZDYOZg0t0MPNX+Gl05VX/4mzTRTOJMaHK+yHdXs0s8g/EU1xkDfhRSjp6KiCSXizQ/B7TqlDBc6
	wBDSjCFdgoEt+q3DYp/2TCcdo0dT2te7W5ilxV5QautA6FwYdGJxCl8feiepLBlE/gwmhQ9cetc
	rUZSRjjM7230qMe6rsVbAFcKPaL7AhCscdCtvN7tUlFVDthHwa2r1iu0uM9gxM/Pob4/9unQT+c
	ubc73xxrgxpLSLQuaCXKwcY7/zReGoUGJlBujCwjyxOlvFWiqwNX7HJbm3Bt7xoHYvbX/+B1rMk
	mK0gOC/QpNcKF6MlbYmXOKfuqZ9hAgL0w15OZyAFyUa+u+6XyD2F86J4Ggc0aDFw6yiQifbcG2W
	cmVdXeb/l6njKddaDCDt944AEDR9TnGbBvV6RBftRk3a8A==
X-Received: by 2002:a17:90b:58d0:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3acef4fecf6mr3732599a91.44.1792302891525;
        Sat, 17 Oct 2026 22:54:51 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:54:51 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:56 +1000
Subject: [PATCH v3 02/21] ASoC: dt-bindings: cs42l42: Document additional
 dai-common properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-2-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5IK2m6ZAqwOkwCJ6kC825xvIJPDhLKuUDHcpYolWipk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rlTeKpVfv6wUL6uLDBT3M/t/rxVmzZdc+bY0etwM
 WGyWP2BjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTvjGFkOC4T3xDivMi+Xp+N9cutX7f53geaWFz59lmMK0t9j0zUWoZ/Ju+z2xn
 DitQ87ulqlx/71RBsrtutrMOfZxNj/tP5rzQHAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225452_478051_D99ADF9B 
X-CRM114-Status: GOOD (  10.06  )
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

We may need to define both #sound-dai-cells and sound-name-prefix on some
machines where this codec is part of a simple DAI. Document them with
reference to dai-common to keep the style checker happy.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..aba2121ac64a 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description:
   The CS42L42 is a low-power audio codec designed for portable applications.
   It provides a high-dynamic range, stereo DAC for audio playback and a mono
@@ -26,6 +29,10 @@ properties:
       The I2C address of the CS42L42.
     maxItems: 1
 
+  '#sound-dai-cells': true
+
+  sound-name-prefix: true
+
   VP-supply:
     description:
       VP power supply.

-- 
2.56.0


