Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E54D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 09:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loXzTpy4uaY53uDDt2VMesUwjrO1zUQ0ph7MJ5jGnW0=; b=rwJRSOAVGLFKiTvXj32hy/Mce2
	jQLNtJBCckhyQh2VhfNYrk/36SqfKAw2dclWZ3k+8wG0syME/tyoFwxDHbuk0zphX21ajWR2DlB46
	ZJDYYAICmo/Fml4Xx2I6WeKxZngBEuFdhdYnBRF8/6e64GXf9UQ2+DgWmt5AAy8RFmnWkz3HrwcZF
	isysHLNJQDSMhs3peejdnBrSmS6qbl6PU+f5YmsMofR6rXhjZWztvBudtHfP0Fobw6HqXPMWGqCMS
	/2I9mjvj8ogvmx3In3P2REAGBSuzIHyxGTroEJACPchJagfcv2W7Z65bMETH5zXvVyZvTi8L9p/CU
	PkOflYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4S-0000000E2wJ-48Me;
	Tue, 09 Dec 2025 09:31:48 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSu4R-0000000E2ur-1Iow
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 09:31:48 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34372216275so5470708a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 01:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272706; x=1765877506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loXzTpy4uaY53uDDt2VMesUwjrO1zUQ0ph7MJ5jGnW0=;
        b=Cv32hC/2mF26KLGoCvXMt4ROiDYpCPpObhaDGwMAgNUk/6k/5r0giWmAfKtLdzEkwr
         MTrfugbYtNHFBUgt3RqVKQZUGYMVemRY4xGUv9DOsnWQ1Qwa1AKYsAdeurlNbjpISJZR
         Z2Hrq5YtZW4Xet3A7VkXjvJqgBHWG1DAGrO1/3ihwMVW1L9x2JlDrX6zuAqiTVmbhjCN
         AJIo3mviuWHrGsQcLqjCkJbs8OPf8wLFjyhMxxgqmtXCTenEadSgqzFNvoMJNDgEc+Fo
         uhlJEF87STi6sMlQqthNTCwxo0haApIB+bRmRLx1SItS2b7JErowivxVeDjBzFlt7Efa
         UKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272706; x=1765877506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loXzTpy4uaY53uDDt2VMesUwjrO1zUQ0ph7MJ5jGnW0=;
        b=JQ4lcQ5rpo1Wb/Wn1FpIbLdSwbPCgblT59Tan2z9J/EB+xaQFTpBLROxIcfUAs/ZqQ
         ZG22GwN6sI8tp/VJezI+nPvBo4Qp0MekDWT2tBmAGIqSUr97EpISYexds22M2PU+cJ8t
         PM7Va1z1XVJf7bDoSfYrtfuv3OqY0Wbh+B5RVEiU0rIhUOhewYfe5nTYlojfzHR9bR07
         QJi+Cv95mKbsx7Plfw/E6n0cDofDsF2q4OE1bzoPWln654KZYH+bmIUiyyR9eXhQLN3G
         K2wJu4awYRrpLKiFxyZdqd14yrlbBo3wZf+5qMtQgAIbAIZv56XnbAVkc1tm7bMWe5hQ
         Y0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCU/6gl+6ve9KDWhW186xUoBFsmY1Z8NqTldfI7dUQkup9ToFIZ5E6XEkWkyx5wQo0xY5BYoCXLie9niptNnCIue@lists.infradead.org
X-Gm-Message-State: AOJu0YweYJ5pZ8QjnDPH+zVrAK1jU3zals5pN/219fY1edM69MfgXpPn
	sB7PfJElk7+MTNp9knAj2HB6GhZvahdSlV6KPmeSs//bXfGi6lIZc9R1
X-Gm-Gg: ASbGncvR+G8onQlNNPxik70BnfmeHyo3YvSF7JWKVpTZhyJL4FC/qU4RzTyLhj6dwe9
	E6iN8Yh0ZGPHcGQsxwOfwDWyz+unxvvmqmCgT5WBrwh565BbQWoei1CL4WMN7HUzNvVL62ptdbX
	k+rciTS9wYnysU6QBXCAcsPWCFBRvq5pNnIAADaaIcg3t5KR7wkPQzG4hTxRqBm7x9u/pePWI06
	LY9umip2918v7U7U+lpAiSU3D51nMmfeACSCvQC+fp+nCW8Oy4hbsfZmUvfDs/Gd1crMp9HDbra
	P1oqm/Mu/HEj3Q7JA4eCKl4/u9aG05KzmNz7cr3AceK0ZCXu9N4+2TshHOtDVwsB6ZkIO2rPkT2
	wiokx4S5TcnoX9fWGajzS5Ep3w+FISMwz58f0gLsM64YxUcprvtPY3SlG+Df7vpJG9vBdS8kQgr
	efsJWTBbdC6HY6oEgQcz2Z1P/1otJUEEgrzeth3huBgEUSOz8JBMMrzyRv9otneIfEPMm4N7+tD
	JTxpSTgeCopf8IAhFb4XH/8Vf2KXQ4cTJWKbXxup6PZ06FLR8g86gox/eYTBxoLdJk6ErMvjiDY
	eG7g/fkVTUhkb9zRQO4iqO3AWekCj1Ci+WAs67ZwEpVfZRYXekA=
X-Google-Smtp-Source: AGHT+IG5TjEW4C4GY4b2FxVYjWX8+gLJQmB4u4hl40+y/p7T7camtMTaOvWcdzyFLSuameifxgFCOA==
X-Received: by 2002:a17:90b:388b:b0:349:30b4:6367 with SMTP id 98e67ed59e1d1-349a25e5544mr9400724a91.30.1765272706467;
        Tue, 09 Dec 2025 01:31:46 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:31:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:15 +1000
Subject: [PATCH 2/7] ASoC: dt-bindings: update tdm-slot.txt references to
 tdm-slot.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-2-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=T8nQRaJTMEOE7oGRiZt2UVDQ6WuLodWd+RVxZirYEM4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7KkF/kxcld/Mi+rkN61eYvaC++1gp6Kd3f2PDkmc
 6ji2/yEjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWyISAMDELAw8OUm5pUa6RjpmWob6hka
 6hjrGDFwcQrAVG+9xPA/+vQ6/Zbm4286L67/xNKmU71vGRvHo9mqE/+6CX5UYWVawvDPuH3N2nN
 P3PacjbolrHEocOXlE+EuDzMXHzh9YKHFp9kz2AE=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_013147_356175_5F15DC68 
X-CRM114-Status: GOOD (  11.06  )
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

Ensure that all references to tdm-slot.txt have been updated to
tdm-slot.yaml.

Achieved by running "sed -i 's/tdm-slot.txt/tdm-slot.yaml/g' *"
against the bindings/sound. No other references to the file
were found in the tree.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/imx-audio-card.yaml   | 4 ++--
 .../bindings/sound/simple-card.yaml      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 3c75c8c78987..1df29a556120 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -39,11 +39,11 @@ patternProperties:
             - dsp_b
 
       dai-tdm-slot-num:
-        description: see tdm-slot.txt.
+        description: see tdm-slot.yaml.
         $ref: /schemas/types.yaml#/definitions/uint32
 
       dai-tdm-slot-width:
-        description: see tdm-slot.txt.
+        description: see tdm-slot.yaml.
         $ref: /schemas/types.yaml#/definitions/uint32
 
       playback-only:
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 533d0a1da56e..2e1a5b3216c5 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -28,11 +28,11 @@ definitions:
     $ref: /schemas/types.yaml#/definitions/flag
 
   dai-tdm-slot-num:
-    description: see tdm-slot.txt.
+    description: see tdm-slot.yaml.
     $ref: /schemas/types.yaml#/definitions/uint32
 
   dai-tdm-slot-width:
-    description: see tdm-slot.txt.
+    description: see tdm-slot.yaml.
     $ref: /schemas/types.yaml#/definitions/uint32
 
   system-clock-frequency:

-- 
2.52.0


