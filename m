Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA0CD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6Kh/S4AuBYubzHpa9fGV98tRXc6USzdHeQlW2hl8J8=; b=mlXmvWptHLAr/GTG5fMNpM1MK7
	mLMaPYjXPRJS76jmJSoT2+f2sjEF+uvu3TWYQEaHzbCoF7TL70vpjZVydoh0E8ldW4fOxfvo08DJM
	/XvQIVcwLQGc27Pe5Xz3hPsZZ+MplsI5Er5FKOoDVi91qLa0d6RVVO+O/SsCmMoIxinsi7Roh2g0A
	5am0SOtlittUi1Zjichutm4lwSIiC0c+q8gpLmNiYk5YSW1XadP3wgC3/8kHRMrWQyFk3D3HDZLmB
	+vF6mMbiK2WCLXteZoyYGkHsb6d7DsDpj55SeDXwcptboKeq6Y9gcGZU+H8RAqK7xOK8nm7pCm/mv
	EvSGpnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4a-0000000E2zr-3fre;
	Tue, 09 Dec 2025 09:31:56 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4Z-0000000E2yw-097Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 09:31:56 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2984dfae043so55845955ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 01:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272714; x=1765877514; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6Kh/S4AuBYubzHpa9fGV98tRXc6USzdHeQlW2hl8J8=;
        b=mtSotBZHd5nXsFE4B8/TETgoCDVzLjWSXZjeXqahTQll3OGy0h2L/1z+A9lk7+LfHD
         4SIUkrCDGqXU2flxrD6TFBcqW3QqKkWFGV8Y4g9ZbMSAmawBIVSQqRJnpFS1KdSB+KPt
         IQtG5f7WZZ3oQPFy3yPW6H+tITPjKR4Xz+mRJmboUo9f5VQWhDuzX4YQ5Qe2Njz20+y0
         F4ya01Dz7vA/INbOMz2G4mqUQ41OZsEpdpp2615klYTJuiheN/NvnIbXSompaNbY7jJ+
         NjlAoeEw1a6nZ8IrPGiqJcZtHiDnJGXPw1pNOCJZXYlAsOSqbd30qVC2VF6mr0qKlpWb
         RmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272714; x=1765877514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S6Kh/S4AuBYubzHpa9fGV98tRXc6USzdHeQlW2hl8J8=;
        b=Nm6Wy8izGt+6Ur8sS1i9891/7d9+gn221z9QcLRpXlfxuB+55IRuhrFEgt/LTLPSsq
         sp+ODMCnml07k+eZVzdQRttjwXtfgRYnimdR+p/d+Y3cSoAZkTrtf4fIWCl3H3TYHR8L
         H23DxWj1mWdx5NQUgPr7qBPJquZ/ia6rjWBohNfIA5PgpASwFdTZpzNOmDQOaYmAN8lJ
         0akTkFxCkYuL3T1zAfA2w2zNA21FKxw3Yb19r4fn3O3wAao/kga7+AstcQOrlXtn1CyN
         f8BhmphBsyA67jXfTfEPu0i0s//8YKdnhhMGIWx2LC3WgXC47CbZ7/yiGlR21whYIwDi
         V5UA==
X-Forwarded-Encrypted: i=1; AJvYcCVoGggIkLzNkpdn48lc3qt7CLPCxvjDjv6gkU8paT6RhgRvizNcR4qwJzeo5hZTKrCZMqRs0cVRATv8UDTvb/yz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsb+uZisu54fiMQjSPT4MPS8oclX1+3l1EP3EGCNuqPI6Pbswu
	NYQdLitsmyRvNtrTY9NwK54GWCYsI++Z7V1TtOxKBqiqNXoC3Uv4Wiwmc4W6qQFN
X-Gm-Gg: ASbGncuhIdhKd5PCpDrwqI1RQJrBMCUvDOfPQJA1zWjxYQl2SrnC/uRAlBBwoxNRGSe
	VrsI3ho0UCDmPBbLRtszC1mS3TaM5YStYpQtpXSGRX/8tcle4xEL412e1ctmQSSipcrcjY1sSmA
	mc1hs2lidj19DosdtcXdGXgY9q7pFD0B9xJhAc+sHTbou6TqnCUxW5YIgDoMBUlyqYwMV1iSjlk
	y9fqbamfOZeUYO+Gvka1aJV+E356LyVz6xolkFIMoX/V1ui4pdnCIYT6+1dV1dofMn10CZEtKEF
	23cRUFZbAEpFhWmzFw6fOEflVSLsvPNackQmJ+NoVk18qLkcFpgeO0p9KPSnZwE6TurliqZP9eI
	LMR8WXcN3tGv1c5+zK7s0NTc9HFJWz3VhzvF5DpuTeH/T7lxTerd6AjQyUrvh+F5bj9UJySZlXc
	V3jik31TqyU8HPu3WZ1BcaQ1SBqOQpseZ1vjEz5uevTeIYzVyk9ZKs/40Yl5JCwEydTkGgt1Sqe
	WqPgnwqQX72CESz1SmtBe7WLCnnTvFoICutse0pHdm9MvDO5vzGvpHR1EdxPskUpSPcZ5ULk8GS
	rBazOWJUmShsGtrvBrBkr0xuxS3SgkY+p2ECiKZdXEq//8Qla10=
X-Google-Smtp-Source: AGHT+IHjkhG5ILuMnz9u+P9xFQUrtxtM7YAmHub3kulzNeg1dJ/92cTnLqbWYakB7BqZN9JLGA4WKQ==
X-Received: by 2002:a17:90b:38d0:b0:349:8116:a2e1 with SMTP id 98e67ed59e1d1-349a25fe29fmr9166033a91.20.1765272714091;
        Tue, 09 Dec 2025 01:31:54 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:31:53 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:16 +1000
Subject: [PATCH 3/7] ASoC: dt-bindings: add TDM slot idle mode properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-3-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1930;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7Jl02U1GOnxsVCRYbpxJ0xeuR6SSn1DPWvASGvNoLSk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7ITGfs3K75KfJAWs1t16sON9i82Vgrez5qqKhy6M
 OTWwe/8HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNQx1jFi4OIUgKleu46RoXeHgN9hvsPSjVOkY//fejuX6+yjePlisc/6klmqz57MVmZk6D/3No9
 j5pItzfNllOe8PL6pPuGw7t/mXsHPnMdlOsztmAE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_013155_083003_0230C6D3 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Add properties to describe TDM slot idle behaviour.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.yaml         | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
index b67844e1dfd5..b247b315d7f4 100644
--- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -11,6 +11,16 @@ maintainers:
 
 select: false
 
+$defs:
+  dai-tdm-idle-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - none
+      - off
+      - zero
+      - pulldown
+      - hiz
+
 definitions:
   dai-tdm-slot-num:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -32,3 +42,25 @@ definitions:
   dai-tdm-slot-rx-mask:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     description: Receive direction slot mask. Optional. Identical to TX mask.
+
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

-- 
2.52.0


