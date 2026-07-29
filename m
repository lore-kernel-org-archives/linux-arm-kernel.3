Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCF0C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESgTvyFk5x4edZWjL4sPAzl2lLq+eyEVMxFH0mwAGdQ=; b=5GRbWZday20R3Nv3WiZjZ45I/r
	yqgBHDqVPWhjkux+MmxqYB+WkdDuGQpWD1BI1RHhzY9oUxjxU4VWYFcK+rbN8OyAs7zTLgjvzFvEu
	RCAzbk1CMcIrATBSx2EGI4mV9rJ58h68J1zc/pMI4L0y9sZ0eYKNP5B7sU3cGARK5SbFwHlKcrnRf
	JTmx4IoqdX8FaFcLy1vUhN20Njo47jwc9ivgRyvuqjZ7tEy5mfGl8+GejeTU77uD8L6szSS8QFLZn
	EyUeC8fnkcFW3/vGt8COTBYjJ4f5CZQ3MIAXn2B0G47RQPpYM8q9LEHBMx6vGlyTRx+9WPhOcTrKZ
	uWxLKtXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4T0-000000088Aw-1p6f;
	Wed, 29 Jul 2026 13:37:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4Sc-000000087rj-3l0a
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Jul 2026 13:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ESgTvyFk5x4edZWjL4sPAzl2lLq+eyEVMxFH0mwAGdQ=; b=o05uSGGtE3doRYiJOPyI/SOX5Y
	kDsqft84d0RC2ExfVOxRpjtf8oKU/l0iYhJo7HZnkU9gfQ67E2TGRUuwH3KJEd65IJ/WqpgmeT5jC
	1EwkYqgUP3/626vYI7rPfFR5U6OAsFk46ESgtw3FWaAcsNIep/0BP+P4vdWYPjOH9mjOanFcyCkW6
	fuQPSHm26MWd7Ygmsw9rVFT7tnUdckdrH4PRdPew/OPRWGBrCj24/VAQ8/w9VO3xpJOoAL51jk+E5
	kc7HH1ynY/oLtBVBaje9pnT2I5VnSb/2LJs2mArBMLMTrTKxznCaHRyHBwIakWj3eH3aVYBSDbkzn
	pBtGALVw==;
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wp4SZ-00000005r8J-3inL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:36:37 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7eb64085c45so730954a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785332194; x=1785936994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESgTvyFk5x4edZWjL4sPAzl2lLq+eyEVMxFH0mwAGdQ=;
        b=DQtQMjLos6UM8LUqYgh//vurlgjG+8QdnZf3s0gMtsfOnO2EmGYq1LlLBvbU591ZYm
         hQuakOI42uIOYUeepJeO4ITsq5/BWmsW0InFl5vnr956w0qOEoR3JVuH8QagIErVFgwN
         iN7myUh8z3Vvp4DH8X+vk3j54eALDpK3U4mt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332194; x=1785936994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ESgTvyFk5x4edZWjL4sPAzl2lLq+eyEVMxFH0mwAGdQ=;
        b=GBnXrVvRS4rYuDOoLAbswESHc30UZ7SdBvHSGwog/zRy+WJqbS+UBIEYXBR5tmeEel
         +M6sQyEhfuHL+M5aMiuR/8fPsbrz1t+2ZOUz3p5fiQQNX3Hd5zYwwwjf06iV9lTInCCi
         RsES+NgRl8LrQIKqVAC9DKTz4ZiiVAcTemXfxKoyMElTSValm3Mk8buR9b4qHIaQ3j78
         IPmprCseMdGPgligt6d3xbBNFz8/QPxzVztbprGpmB0GvLJqAN/5bcWwKh1mKB5cwUc4
         Cj3gJwzUTq9hES0/8R9IOG1ykeNoTch/kqdPs8HP/9xDONsesGFzILQx3dSFKbBy39Tp
         PWag==
X-Forwarded-Encrypted: i=1; AHgh+RrXmm8U3M6DQ0SaLd0W9ue9r0BQeBLSanGurde/QuyppLQYoEPynnkJ6tkam1q2jXisXhPKB5loBVDfP9eIViAJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxjRAe5ekdYZtC9mkAtdW6XT1ZvmVU9fiBvfCLZsD8mwiAj0VGr
	p/XnE1BNpb2XOv28ERQqITAHi3YNT5ch0zdEgiw4BjAZJbXS24fr/7//yJ+hag7doQ==
X-Gm-Gg: AR+sD13dF6EGHlW1A1XQ50JTh2aNrC/k71DYyQTVY+A3Ia/xzj825Jc9Lw911P6Lrhy
	ZUxg+Xz1QpUQi2zvUD1dBKISRmgpofHrIyPF23dMCL4Wmfxo74z2DED+Iib8S/yHGmT+WxynmP+
	E4VEsRnNOBhUBQO04OlrxjsglG9qDqbt1twUd/77i15PPWBSB2nboyPWe2jAKRntXnWSTbwAYMe
	W9pGjhkauhF3pa7REETeg6rXjUd+bFl29oZJCEM7s8HF8ZXn6DoBEEbxEev0EpfGpVZ+03KDYil
	3rg8lTPK5qSiHm61RkW0pvdx3GO0yr7XgiuIm7Xo0szM6x+a1O2dY/x3NPMGEts5x7vupUhC9Cg
	0+TzwZWjfRTxME9hY2VqFXCuBSQ71d6XgrXiY7BWV6eCdJZm7qiEAfdfFRR/Y+RAvcQDgcVvdsS
	wQE1Ui02tNDCUC6nhB2Yin6ZFmKchnkbENSRDQtb67L0FuEx9PDIRKDqs=
X-Received: by 2002:a05:6820:4c89:b0:6ab:5b3:2fb0 with SMTP id 006d021491bc7-6ac96bdd68emr3516421eaf.42.1785332193876;
        Wed, 29 Jul 2026 06:36:33 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca527fe83sm1956196eaf.6.2026.07.29.06.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:36:33 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
	linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Albert Aribaud <albert.u.boot@aribaud.net>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] dt-bindings: arm: rockchip: Add Luckfox Pico Mini B
Date: Wed, 29 Jul 2026 07:35:52 -0600
Message-ID: <20260729133609.3465563-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729133609.3465563-1-sjg@chromium.org>
References: <20260729133609.3465563-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_143636_194989_DF259644 
X-CRM114-Status: GOOD (  10.92  )
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

Add the compatible for the Luckfox Pico Mini B, a small board using
the Rockchip RV1103 with 64MB of in-package DDR2 and a 128MB SPI NAND.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Place the entry with the other Luckfox boards, in alphabetical order

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..ddce8d1b5a3c 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -791,6 +791,11 @@ properties:
           - const: luckfox,core3576
           - const: rockchip,rk3576
 
+      - description: Luckfox Pico Mini B
+        items:
+          - const: luckfox,pico-mini-b
+          - const: rockchip,rv1103
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.43.0


