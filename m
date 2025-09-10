Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131F0CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=; b=HgECjLG3X5vDpOz9SPsKYV0mpb
	uj0EJvVcwP/PT5135QQQiVPj9C60NALccHZ1Ls7A6D1nW+qeebVO/NAonB4SkMO/xbeBkkNkCNwkp
	T4NTcTrgCVzk4Rn3FuTgNyN3IN/XZMnTz1TAdUx91pTlpR6eaP6cXKZJ/FL1E1y74Qq+Q+vjYPCOh
	AUQOmUxJamk18yH59hZ8lKfVCBbvniXIjrv7Rdl/kDxEahMvoNlFlNH6iGw2XF/n4Plp7IxRqSLTi
	DoYC3wmbHxEuCklQPmh59gfQUGB2nBOKILdE1XkTEN9uynmbeFMboSseu0U46DWZmAUaDXgBQeBfZ
	jcUFkavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLMA-0000000EWxY-17K4;
	Wed, 10 Sep 2025 13:59:30 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLM3-0000000EWqR-3yAw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 13:59:25 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b046fc9f359so1196795466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 06:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512762; x=1758117562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=;
        b=Qk8zpVF3GGbZRj73bQhEAUbWssKhy8Bew8yASMzmj1bbRM78dSqVPGz97faOtLf30O
         SZw6zpQeID1MPueGSVL75icZuUaLjK8kBPl+t5eLLK6B/Rsoq8x0W+r+kSZCddbu1EVc
         QYyVA01X/ydXb0IBOu7yavwUBI5/0ud36BO80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512762; x=1758117562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=;
        b=MWsdWrB8VGeYrycjoFYzzqY33HbJ0lhnPlDqLuNzTRYaZZbVDdIOv5yUzuFnxkqrzp
         cQ5L+7nmIsAac8X6lZNzMUYaJg6Dp5ssoUDzEtBEm0Zoy38/OZFN3lc875WII2pVi0d8
         HQC6XeY9mJ7I+o3HswOui0V4AZbBBSSJeqeC9L10ELsziLNknWQfRaYN6lhKsLkDBo1W
         3acbvsgO1Ym1x4otNnoimTLPhyCPG7o2w4XIyh2E340BJ+A8X4sJiVPz2obm9ZGnJKGA
         cnTjypDMygZ7x1JBJwiOmUyLi2ZZ1/e5czsc0w7bNZTozlUkkc0oiamP5RoJbOAEJGCq
         ZGbg==
X-Forwarded-Encrypted: i=1; AJvYcCWlXUVhCurJRZ2mIwTfee3tN9poShbXmfyxJJUf/51GZBer1+DR5oPfKUNno4ov0HmJEhc9aFSN4TTQQh057IE0@lists.infradead.org
X-Gm-Message-State: AOJu0YzBpHVBwR8t34inv1A2DmBWk+ojpz53Gi2WQDXoBylPxYWGNvkl
	ScxB7s9xmzJ4cgZ1GofuQnqlDLzUBCJr8XTOR0/WSMUHsSlMVkH5hOD51pFm2ujqPSI=
X-Gm-Gg: ASbGnct0yiZrY5qkk8DQxWMj5hcOGmB9bc4QSA1fb6LuTRJ05tL8nKsGVJ/BF5Ws/GO
	NcexGd/YMy6QpQXtQ8amaYghZknj3k5+hn41BuACYivi0RhufsVB9am11EAVsX14r4fHVTvGoKD
	gCSWDcsagurNpPNNsA4gEANQtg/25lTtaRXAMmRN0JbVqkPLcc/hoi7XQPCg8QNxqa4O7tb6wYE
	DvSf40dQth+coV1VsrdpmYc/iYnvwBiTScwLGY/PQAbY+GNKeSW6j4fvRVi18RYx8SQ5uE/VrmH
	VDg2akq75QaFYkgfbQzvQw/cUkKor9g3bgSDEgQrIV5HTVBu534FHDnN+uJgPvifKrzewBsR0Dq
	bsLdwHNvTe5L/Fb8VneFWUROEplRiasIDok0c8N7WS9CnuE5HQyIrE3TGGWe7l2b750c581vomx
	mOuu56dRpzblt7ZZV8P74X8KMAHCNg42eVezCrqntMUjuLpdyTu1ATyCFrzFtlNo7z
X-Google-Smtp-Source: AGHT+IEwFKbwXQOp9vR5RWBfca+LwdgNqWC2NlCsLiPo9Z3IGD4hXe/SLsqdKeNLsPpGK5bn7AW6lQ==
X-Received: by 2002:a17:907:d91:b0:b04:626e:f43d with SMTP id a640c23a62f3a-b04b167b9f2mr1190384166b.47.1757512761817;
        Wed, 10 Sep 2025 06:59:21 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [RESEND PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
Date: Wed, 10 Sep 2025 15:58:36 +0200
Message-ID: <20250910135916.3939502-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
References: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_065924_011023_D331A8E9 
X-CRM114-Status: GOOD (  10.87  )
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

Add support for glitch threshold configuration. A detected signal is valid
only if it lasts longer than the set threshold; otherwise, it is regarded
as a glitch.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..2fee2940213f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,23 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  fsl,glitch-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    enum: [ 0, 1, 2, 3 ]
+    description: |
+      Indicates the glitch threshold. The threshold is defined by number
+      of clock cycles. A detect signal is only valid if it is exist longer
+      than threshold; otherwise, it is regarded as a glitch.
+      0: Normal function: 8191 clock cycles
+         Low power mode: 9 clock cycles
+      1: Normal function: 4095 clock cycles
+         Low power mode: 7 clock cycles
+      2: Normal function: 2047 clock cycles
+         Low power mode: 5 clock cycles
+      3: Normal function: 1023 clock cycles
+         Low power mode: 3 clock cycles
+
 required:
   - compatible
   - reg
@@ -94,4 +111,5 @@ examples:
         measure-delay-time = <0xfff>;
         pre-charge-time = <0xffff>;
         touchscreen-average-samples = <32>;
+        fsl,glitch-threshold = <2>;
     };
-- 
2.43.0


