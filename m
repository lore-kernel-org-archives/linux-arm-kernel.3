Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B77FD0058
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGlR6YzXE5keZeD5R4R4wdzj80ZRJofyKqhSLLbK2aA=; b=QRQZ5BtDMk7gcGdZagpT3GEsU9
	TSZ8xtcHXhA/M2CJVwJQ37aIDz+pGyem4j0l3va2jRhztLZYfgRxclPS/n9ECbIDsu8VajZa0G4wL
	1CVt2lIQ9EgrVRXYDLi2vARzQrpFuyMlAM5/yD6IV7nUh74kODgpMa5AvDx5cFut6CAAV54TixLR9
	epuU8XFxIy4cZiV2r+ova2o4I/kA8uL8Un3tDXTN7VAmuJNqahuYyxt6nrxTpyYLYlx+Ca+qTq4G3
	l/tIsJjTIIELUkCv0wI44GgMt3EV62HsN7Al6t6YW4w+Rv3eeq5s23Mhfb17kKJ6h6FlQAjqIc/Qr
	G6xxXb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbp1-0000000AwKp-0nBL;
	Sun, 01 Mar 2026 08:06:39 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbou-0000000AwJC-2lH8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 08:06:38 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so2137225a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 00:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352392; x=1772957192; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGlR6YzXE5keZeD5R4R4wdzj80ZRJofyKqhSLLbK2aA=;
        b=mo+Jb+Gk7X/DGZ31pHKh6Zw39YizpM+qJ5oOc7c06sQYPmSd0TdmUCs6YBOnolJcqD
         joU0GnRkYf+n4kilEXKj14YTXd1JSZh12x+Ubs6icn6Q/ADCIe6f7eT0/4aR6iIjX8hD
         68/sgAzOrxjd/3eDsYod8IcLRmbPZTybcO1AOn7rAcVg1J4shMCcCUfUV58UN0Yhz0cM
         RqrS/IxrXjVmx/qEUB9ye8JNM+kv5m68JwGaumBh9WNb+gucb2ZLxP1PucUAljT0PIat
         pUPP9bYImdXmIo4py/Vk2vFUfSuz/6PvAgtK65bS6IOI9dlOSwpr6re8bOMfr+IgyDgE
         3Ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352392; x=1772957192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fGlR6YzXE5keZeD5R4R4wdzj80ZRJofyKqhSLLbK2aA=;
        b=XqNenB16y2j4Tu8mFGP27cbrFHOLGAExBivOH3bp6pqlCP9HBE9bivhtcR5mPeTFTw
         rLQ4bf8aE3ChGNf3ceybuh4qRndrsK0ziUAZN9d737daT5ngbIkvwwmBuji9w+xLqeXK
         IeQKjmy+av0APgQrYDLBHOR2KwUwJtORcdo266KusLUqhE0DaiuMIIM8ad3YC1ryVMct
         7ZzHYw0sU7uCRbfOYQqvWrhrLE88BfWtm0RUcodBMMX7gA9MbjJq+ci5pMhB3Oe8tFmb
         ughnXfFzrJ3nkpvNhIR89w6QprMzzXCPoyocwX8AhaJ0W5Fos1T+2c1GIH/6UNcLi91O
         lhzw==
X-Forwarded-Encrypted: i=1; AJvYcCX2JR/jYdkugA0FcTtTBPhsmnA3QXG8cV63S9BIwS5ngGcU1221c/RwpAhTUxFO+guqUVU2ziUwfiK4QO7kyY4C@lists.infradead.org
X-Gm-Message-State: AOJu0Yw55RjzhB6wClKch7AjVM3j3tCaA+UZslKa4VFSjDeJ1M85XNWc
	XLfPl5SrPPZY/6IpWvLSc+D9/9Cv8i6cvIou/JNsGloGUGxwNNFdUwU5
X-Gm-Gg: ATEYQzx6+g0RUVQldvxBH1RqgepWeHTnMaiNr4GSfoGTsJs0ZlnIZSvt56+blffcNkN
	yBbeBzN8CeQbXi90UXHyrqPNsl3j7dDjwO8nSHKht+X9XeUMSS8UYBRd2lOzFIisqcUmIGr84vY
	FsnUdwp/lv6LkYzNAl4uKwnPj6apHR/k7V1JCfpYWvO8ZIem6yP22EjR7ojHJDwrnG3HCNexb8B
	BeTByUGBlRGDy4mKg6W5vPKix7yYt7i/gpZJDNuOtMaHu9Dc6gYPI0o5RXkOdsYS2qHmapYfoni
	qbqEVJIm+ycq/1vZlXQMpbH1SQ+dzDuFVl5Ttr+76yRcO/9CkoqhOUstARIwp1zBNqNb5+bCzMX
	G9DGMfKD+qBgZH7NMBiQiRe4QcUSQDZBo9H8HIaQnf2TVL2ga6QlmowzG2pw/tNrk2Ui5KymfMc
	uHoOLvaOYQjraroFU55N4Y15JLRGyA40I4qrwkenl+199/MK1gtZ52GSCYsxaZT6sPpjOaig7yU
	ICh3MG/rYnhhkYYsojjaIPEXCjfYBq2n0/Cjb60biBDz4TpwBbnW4ibFgRSK6IUYYifH5TvfVGR
X-Received: by 2002:a17:90b:578e:b0:34c:2db6:578f with SMTP id 98e67ed59e1d1-35965cccb83mr6714723a91.19.1772352392000;
        Sun, 01 Mar 2026 00:06:32 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:31 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:22 +1000
Subject: [PATCH v3 3/7] ASoC: dt-bindings: add TDM slot idle mode
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-3-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2001;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=115g/WH2mtui7fHuZcwchXsAefVgpriJAftdKhU/VY4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fH1CYvWfDi6+VdS/ptHsxy/zZ9/q/rWu7bdB9du
 c1wrz6BrWMiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV96cxMvRPZA5hNnB6kNker/euf6nWnZJG5XMz9l95IXBFaqHH4QUM/13ivlz
 XP+vO+XRlp0D1vO8fDn37U1wXWD5Z6kr+pOTQSCYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_000637_346600_45C98427 
X-CRM114-Status: GOOD (  12.10  )
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

Add properties to describe TDM slot idle behaviour. These properties can
be used to describe how a DAI is supposed to behave when not active.

For example, Apple Silicon laptops split a single I2S bus between two
physical lines which are combined at an OR gate in front of the
receiving port. One codec on each line is expected to transmit zeroes
during the active TDM slots of the opposite line, or we will have corrupted
data at the receiver.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.yaml         | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
index ca71e3660f62..457a899e8872 100644
--- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -20,6 +20,20 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Width, in bits, of each slot
 
+  dai-tdm-idle-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - none
+      - off
+      - zero
+      - pulldown
+      - hiz
+      - pullup
+      - drivehigh
+    description: Drive mode for inactive/idle TDM slots. For hardware that
+      implements .set_tdm_idle(). Optional. "None" represents undefined
+      behaviour and is the same as not setting this property.
+
 patternProperties:
   '^dai-tdm-slot-[rt]x-mask$':
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -30,4 +44,9 @@ patternProperties:
       a mask. The first element of the array is slot 0 (LSB). Any nonzero
       value will be treated as 1.
 
+  '^dai-tdm-slot-[rt]x-idle-mask$':
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Idle slot mask. Optional. A bit being set to 1 indicates
+      that the corresponding TDM slot is inactive/idle.
+
 additionalProperties: true

-- 
2.53.0


