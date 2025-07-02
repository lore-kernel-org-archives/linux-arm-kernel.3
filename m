Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE22C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 13:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woN3IMIK0eyXUy8BqjMpuHpqxM7ZtBG0o8DuW1QypD8=; b=hIdrqMnliN/m0FpD7/pH/Bigab
	aLViAg/7ctyp2o8kBLvcVfsgI4idZigmbESqIMjF4HXfwqK07oJJbxC6BiNyhH0PI2G81YcquRh4q
	+dT+543Yik/HNuqYdU58y4Mb160S85pWGHnBjeFr5ob0cKlY5nFe9LeX/FVVHTqig/eFFAqeoihRL
	0ByIBjDv64LoUluSb3NLNJAIaKo6VXBNwlYslE3hjSkSbtUJji7qoBjfOoutZVc1i0zoOJnZm+22z
	J7O2Eis9HePShD8OG66BUneEqiSSJQOZ6Agql7gYV8EY7PZ/NTGXGN/5nMew2OGkY16EwctQLyogQ
	MbB06UCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxuW-00000008Xnw-0wIO;
	Wed, 02 Jul 2025 13:54:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxP4-00000008Quk-453Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:21:36 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so1250519666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751462493; x=1752067293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woN3IMIK0eyXUy8BqjMpuHpqxM7ZtBG0o8DuW1QypD8=;
        b=dNx/s38CmQEslXei9Nufl3E08N3hovBmteFmuz71m9GikMcVbClZQ2ysENlOnMm0/G
         X/vtMgZNK66vPWPFSCdagVQ8YKMC3rKf8C54wkb+0ZJNRYltO06wDhgZSRulFc2x8LR1
         4WgisLiWEsOF4ShiFzlMLwQ85Vw+TCLDTJNScQQw2vqz22Jntf/Vj4zWCvR7mh462RhM
         xpJ8HDjYy+1yv89jdnKQQwx6+BBES3rHN+2KZqQAUc4QeHHKYWwL8/fAKZBetgpTliUd
         ORXcEX5ywWCmClo34RL7svnZG7Ks8CJSbM9HcQTRDEjNkuY1ybtaGXJEGKcceFlFE2Cl
         eYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751462493; x=1752067293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woN3IMIK0eyXUy8BqjMpuHpqxM7ZtBG0o8DuW1QypD8=;
        b=MTEztQj1jyy06YY5J5O7nZ9sENqbes+NGrIQrmaDIihfwRmW05qPS4eFguBVP5Ryuk
         uVbXqHijIk2VnDdgoCJMCtwREVgIzbZ0rbr/s8e5tTW8mWskpb55733E1sPSAtHc3mdQ
         a4NcyIa9v1D/0GaNngct7DsevxKymN7GsDXUM9A3cRnBm0x1YpRr8J4VvqWrq62v99gE
         rdavwwTqJ0Awz9esk6CmFLnbndg09DIyDwrdI91CmtesiNKwesxGawOgPJoYWlWxA2b4
         WnKTf7Te3CAvEM64U/rr9iYh1KAZnf/sYbzz38SHHTJ/avsbrwHGb0BsnKwDoIs+sUM+
         oCVw==
X-Forwarded-Encrypted: i=1; AJvYcCVTClY+h1E401Qiyw+Z0VelgEUD5kj+kzc1YROoNz6LmqknNRv52HAAW18F4kWXPPVIvVWZMn/EQNTGgIq1UaBl@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg0FYYZdoeiS+xBRPeSwl1xRxl5qjPcAbb+wKOxAVkdMeQd9xH
	znJ5eTo/NW74Uw2GRrQpw9l37YA98ZP/kqNYYyp7lT9g3CHubpF1Htl5
X-Gm-Gg: ASbGnctTRvYFQlSAqn+gW7qi7etOhxBN/dZRZ4QWHyrMg7d2ttKEQ33l6zHjKARiOwt
	rx7WIGP+kkZ6LGEUNARoO0oQ5glOsVOxluEbIiweWgCBnhw5ZLG9t6zEhIhR8ubppslrMrfp74x
	XQPyZH1CVGDPTZ2XrJzsiLuekLD25p+O1DvaEDoRYvLi0p+xX5KTbytggWMTQ4Y+QQB5RLWyYcl
	WPwHF/IPazPO0yv52+3eepo9MgTJ5nnO07157mgzAOaBhZqfd8LWraVNFPHYOT/JzBzxLOVkSBX
	kvi3Sz7+DQj5LogvDJj8l2O3ugP6HRh98vJ6c2NY1a+c8pI51TIuTuODarCjQP1WXQo5WGsWI1I
	=
X-Google-Smtp-Source: AGHT+IGlHDeC2VpgxzSynRb5GjQ581DXed8/GXSRXFEwPtFkw5Rr8/fs8tBrPXGwcvbY6SDwagW99g==
X-Received: by 2002:a17:907:1c1f:b0:ad5:4806:4f07 with SMTP id a640c23a62f3a-ae3c2b10b5amr283503466b.2.1751462493272;
        Wed, 02 Jul 2025 06:21:33 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b094sm1063800966b.22.2025.07.02.06.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:21:32 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v5 10/24] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Wed,  2 Jul 2025 16:20:36 +0300
Message-ID: <20250702132104.1537926-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702132104.1537926-1-demonsingur@gmail.com>
References: <20250702132104.1537926-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_062135_010877_127C2B75 
X-CRM114-Status: GOOD (  11.46  )
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d..b345305acc4c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.50.0


