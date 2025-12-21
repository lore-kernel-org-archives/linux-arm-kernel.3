Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0123EE66886
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 09:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8X+CGg6X2TQewpD16dhdCQA0CgAU6ZNu4lyH/rNjLw=; b=RZ7xvAh4mdD9HAYNuJkOLlNZN3
	dW7NgskqJrBpeTJ3rOHSUoH7H5n6L7SPsZqPM6VfWtrRUvOcu50pr+vOyw0iTNcwFMxXGIva+f5sY
	K74zlpC7xgHbWoiEQp3F0QAwSVCFGHXwr1YIgpBGDBGQycZlWOtVWdjs3hgcLBRtmAFOHpun+6vyU
	eihuD9wLScL8fpxaifR8c4tbS2VMDFm/pvdStXjpfOJP17G7sqzXSjrBJTxU1mta2veecXPRs+u9d
	Um2JN2CFo5A0gZkyC/wiauD322CMjQGrSrLLNdHIqOq550wXU5vN6ZFSVNGsF2n+dfD7a+WQvNCUJ
	cNo5PWhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFrw-0000000CHwP-2z89;
	Sun, 21 Dec 2025 09:36:52 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXFru-0000000CHvb-38PC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 09:36:51 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a12ebe4b74so52726755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 01:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309810; x=1766914610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8X+CGg6X2TQewpD16dhdCQA0CgAU6ZNu4lyH/rNjLw=;
        b=nN79P/+LLr/QtfAg3xckZzwAQ1IOVz3s2UQ7pQjENysWi57G6BFWmAokrDjz1Ugmez
         Xzm1FBdx8q1wqe4jlaA7oxhROFzChboTpK8ms3oBjG5ns21EDL9obT6y7pgHin2A/jkq
         bDSTVKfuBKEsIiJl8sN/fTgoBfnxdjuDg1IcK3iCnZyekxj2lQh5RU7Q6uZYzBsJKbhh
         6IOKWOfGFzdO3dZ5rSwU6rHgdbhVCgcdWY3/iZAe+R/fWbgvk2hL3kDwdz8DElRBRfNz
         Xisy+6HPd8AZ3XEIABTFjEJdrY6Hb/mYOVfNF1LjqjKjPJebeOJP7o86d29LamA/ObFU
         eycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309810; x=1766914610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z8X+CGg6X2TQewpD16dhdCQA0CgAU6ZNu4lyH/rNjLw=;
        b=gwrw3FXIoeG1m4w5qWuDluWKPF2oveIuUp2+BsQLG0ubFwJ2z18uG957qWzM7du10U
         ptiHJTqdLLJ56tZa2hs/YyqRDokFeFcV1uuYgicc0g6F2GRdvqQ0V29Fe5nujRwUT617
         CLg/xmZ6l4+gy/mG2ngF2woXmojD0X4oYDGzN2gdxovUhUbP0FxercCkv62Ac7quwPZg
         v6ZTMDgFu5khgDT+Es02py+YPVX9xbOUVy2elWUgvuTCv0Ffelwi1cw7+K53nF69UACO
         EYRB4u6baYca1HUcbX/11vxppPz50qi18EBmPvs+KgEZ5zG0CV++VURO6qsDTDVdmGO4
         JRoA==
X-Forwarded-Encrypted: i=1; AJvYcCVKylXc5V/dmBtF5XwRlEtNs8Q58Ypskr4Xf7LaIyd41fovCSs24lW950Z3IxhT5Qwt76FkEN8LrTwSr5PxGlVP@lists.infradead.org
X-Gm-Message-State: AOJu0YwHkhCeb8IbpMmwztgifFA/cxqBd7WjyWGcsy2znXDs8p0SOgeU
	gsiYrFLhbKzLnaAs3/xQFWA40SI5COjik4Ak0mkXkbnSsknzgtlv1+eS
X-Gm-Gg: AY/fxX47GX/VRvW+4y9Ke1WhAzjLvTmhh9rW5jIcelNHKgLUWlC3rDMv1TbIlImEYHG
	n4/1hINOzcE6AqzFst5PauhsFQgKR7cb3dva4KsIJxg/X3ybtTSaGWIH0hYCt5jHtzfUayzKD0E
	kXgK4aKEhb5InHNFCavFhj+BIRFuoA52avPNhGaqbIrZE9+ht78eusFuyepg79s8JfMQ02LvzlY
	3nfdhJp4yLRhjfzKhWKOdqTDW9MAQ+mcCSbmxX6MquaD0ihxyb6ZCkuGyMmvHB5nYqLj+v8NkbE
	gxvhViCe4Ssa74tRBsbkTCKd0wmUfQfQjoMDwOaq3T0FtHz6/I7ZKNfFyAp67kIPPdqnKiVRMWm
	ZFQGCozhfsCFgf5Qfft8BhNjnj0RtW1Nl69dObsNCSlSuhUShd71N6Ti+rd39pd+Od7tEnIu6KS
	+n+cDVTCpFDMoqNuThQlhl+QAp4iUQ225IRACHX6O4gEMY5VNfKue645/qgH4zKgpf8rPwXS7Cx
	Zm/Z6L5lTFsWgpoPh4AnGy2wH3re5LUtwZNh5jsxaGKTP5+PHNxEscEidko2sO1LUeI0rYygmqj
	Jy6U+Oe4UeLIkPVpxVwR91ttCs+vpW9P1c6Q1gmL2J0hkYRE5WU=
X-Google-Smtp-Source: AGHT+IE8jH5CF7+AN79OkklOKmx/JMvaSoEQ+RMtmm98sJVMFFzecpBHy1QLye0QOgZLDfrXbuUvuA==
X-Received: by 2002:a17:903:ac4:b0:298:2afa:796d with SMTP id d9443c01a7336-2a2f2a56707mr72049865ad.61.1766309810032;
        Sun, 21 Dec 2025 01:36:50 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:36:49 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:35:59 +1000
Subject: [PATCH v2 3/7] ASoC: dt-bindings: add TDM slot idle mode
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-3-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2393;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=WG5E/HC2YxDy3oxNYC3bZbjudxqByJP3FjNkgk9QQKc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yfrGR48+UOQteLYKruZFvVKuT2pb3sY230nqCaUG
 UpI7DvQMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Qx1jHSMGLk4BmOqzCowMPecqt8ecjPT+cT8yyy9z9/n5x3WvxfH3eX5gLJd9p/PlIyNDu2reTcm
 pK7IkV3w9ln6vMD8xT/VD8t/FQl+vqLe6M5owAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_013650_795951_A8B65C49 
X-CRM114-Status: GOOD (  10.99  )
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
 .../bindings/sound/tdm-slot.yaml         | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
index 5bc46048d689..e8b2d35a7c37 100644
--- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -33,6 +33,17 @@ $defs:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: Receive direction slot mask. Optional. Identical to TX mask.
 
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
+
 properties:
   dai-tdm-slot-num:
     $ref: "#/$defs/dai-tdm-slot-num"
@@ -46,4 +57,26 @@ properties:
   dai-tdm-slot-rx-mask:
     $ref: "#/$defs/dai-tdm-slot-rx-mask"
 
+  dai-tdm-slot-tx-idle-mode:
+    $ref: "#/$defs/dai-tdm-idle-mode"
+    description: Transmit direction idle slot mode. Optional. For hardware
+      that can configure its behaviour during idle TDM slots via
+      .set_tdm_idle(). "None" represents UB/unspecified behaviour and is the
+      same as not setting this property.
+
+  dai-tdm-slot-rx-idle-mode:
+    $ref: "#/$defs/dai-tdm-idle-mode"
+    description: Receive direction idle slot mode. Optional. Identical to TX
+      idle slot mode.
+
+  dai-tdm-slot-tx-idle-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Transmit direction idle slot mask. Optional. 1 represents
+      an idle slot.
+
+  dai-tdm-slot-rx-idle-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Receive direction idle slot mask. Optional. Identical to
+      TX mask.
+
 additionalProperties: true

-- 
2.52.0


