Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079E7D49771
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 16:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TDeoespPvIrlTOx8hDFrx88LNZsHxk3XgRr9sFcF/k=; b=Fy0vLYfVmzJQrEM7XUvjVx8acU
	VMDehL1Ww6Cx05YR/lkdi15+R2UI0T7iRCKb3EptUjD7om+ktw7MHfngMdAEwxHOa3SsinatTwNar
	5E5GCQRqMgxV1roHvlLY1chSR4ny2fYgzEZaMp2DWzfK2qffe+J0kMpXheMpjtNXmiKQOTqxxWW65
	hJATmeJVFIlyYLEtRIggGgj0lXL0iLSokbsmgSbAAMDEJBrVkNCWSrXtNw5hx/LVGdP6QFoITiZK8
	HF8TYr4mXrryxmkF36JzDitcnyO3SwRcGxvAiuvQ9HrEk56POctfrl0a1APUQaOvkK4tBcgHFRzc9
	wcx58yCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmQD-000000041SQ-39sD;
	Sun, 01 Dec 2024 16:03:45 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHmNM-000000040kD-2N6P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 16:00:49 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7fc22a88bcbso2229408a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 08:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733068847; x=1733673647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TDeoespPvIrlTOx8hDFrx88LNZsHxk3XgRr9sFcF/k=;
        b=B11AohkFAqfR1u+oiVKte14RiWkk/KLfX6D3A90wsJSx1ZML6JZBYXBOJmiPj1bqZ8
         CuU+QlvlDSHyB+6MFsdLYgp/zZea4OWo33qIHxqfrjJBM/SoGWxKXkxgQ4E4loo3D0Zo
         eggEbWXyabINzvZDFODTAeLnxI9F29xhgYazC/c+Pzs0qK0Cws9dFpLOaaEyPLHFOpHl
         FgskP2gQ699Y+oYP39O2yNnBC5WUqxl9EdK0/39wudb4uqazKt9uuCqv/o6Ic7WPTZe4
         PFyJiJCCx8oux5Vf2cnh1uhytmQhi4aqjv3lRryfNWMPz2J5pfa1V4o16Gbc/F7rWcN+
         HLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733068847; x=1733673647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TDeoespPvIrlTOx8hDFrx88LNZsHxk3XgRr9sFcF/k=;
        b=A76bqPmiQk30WCeR7Jn8GaHZODRnyrGsC/DTF14/6lyIBjF2mNlaOY0KNdZ3zSaZaS
         2FheHgXXt+gg6PiWUPeRAMBAhzoE2eYoRa4FYuUmLS/Y8LtG7dUFk92lx5m5GTUnAGX3
         eMqruF03wdD8pLFhHZqUIfDl6/GszbCJccRv/4mGRpDAeeKMdaCIdvg8SlLj4tisbJrm
         KF22DvZLbrg9bh5UORPAUpXV9DQzIkzCs29DlW+r1h9SD7cnpw1NlEvdGRxJokJxzVIL
         RqxveybOJLseWa+GCLRc01AZx0eJ4ndrWcEo3Kzt95u7oCziA1fJuz5x3dOESh7IVacX
         GxdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT5Mq4wdFmSdxYrulTwS15VdS6MIckRJ9z0NureCW4Sl7Mg0Ow5wwraPt/NbVpGH6TSTO8PIL4kDnTOsERNT7A@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3CO8uGZ8OLTRTwlqA9LpXGVSuackewuS2M1OqqjZ8t+SS61Cp
	vdHQyjseApoyB5meth2xaaXjTlFL76/Tq9gFhlJoIMNC1Ix8Smij
X-Gm-Gg: ASbGnctnV03VSDE75n9wir8o3+/lJDUmpC048DagYXypniuWPvtsVzSVqAwNUnbb8Wc
	dep40NpKxr+y7v+b8AXVa4ze3A8qR1Iho+FeAjlROOkkGINHNX2Gua24aYCrbisUyvih8sZ6oYa
	jH2Hx7FfMXMoDW2apBQZnxBd4RTknOL0u8tvdm6ZAohb7mdPYAZuQ2TLCFLH99XkGVS7fh3MzWH
	5DunkgVi47+ZOeWrz1oFrlYtC+/6jf/ip6M6PqNsiWXhwcEdLDEPBWRYIDP8tC/Og==
X-Google-Smtp-Source: AGHT+IGrv3hVqmAY6jnCNt/owtSORP/V6bWy622k5imkOMd+IKJHnRO+Fqx1Qyrr4NmirwD+yWdaMA==
X-Received: by 2002:a17:90b:2252:b0:2ea:8b06:ffcb with SMTP id 98e67ed59e1d1-2ee08eb2b91mr24578454a91.14.1733068847505;
        Sun, 01 Dec 2024 08:00:47 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2ee6ebc4a73sm2395173a91.0.2024.12.01.08.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 08:00:46 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 02/10] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
Date: Sun,  1 Dec 2024 23:56:39 +0800
Message-ID: <20241201155820.29259-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241201155820.29259-1-towinchenmi@gmail.com>
References: <20241201155820.29259-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_080048_601918_5199EFAC 
X-CRM114-Status: UNSURE (   9.47  )
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

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.1


