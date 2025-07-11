Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F56C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 04:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAyGyV/ROok4pI9Bzo4icqARtJ1bPtyu3l7jtXPJYx0=; b=eFzlXETx4b+1w7VujpqdPJ1g6e
	k1glR/Z7PuRhfwNkWDOUS4X0CSV/8or3tnJTdsNB//xX05JlGCkr/no9nRaGfOOeXV9iGipgOcqYZ
	SHfchPKAvnHZkmAqDzkqCFv11ScAgm1YsyCm9urNOgI2p+leMLA53gVrnf13TXq1CjUuYrqOCxAQq
	fUtU6ftQz94hMm16jcExCUc1FHA9p+IifCrd/y/5TG3wZKVcLXn6qD2QULVQxk779jsasTSdMWZzT
	aBsRJyM5pqVBvenK0OwY5vOh1xThap6v2MqOm/h0IwI1TTbcik0rjQtyoqRCqr6a9jG4Uo5GYuezx
	tkOk76kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua4yf-0000000Dcpl-1JIg;
	Fri, 11 Jul 2025 04:03:13 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua4uG-0000000DcNO-0eit
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 03:58:41 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-32f2947ab0bso11932591fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 20:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752206318; x=1752811118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAyGyV/ROok4pI9Bzo4icqARtJ1bPtyu3l7jtXPJYx0=;
        b=L7oc8T7q2VyK3TFwpnbKL0RtxLe4d0ZwacGnfw0A8CzyZmyin5Z6wnLHkWjK6a0jj0
         IoXubAkQ5V1GPNYSp7RHQ+v6QlyRVwDy5BtLCwqou+5F9yaXstTCACMD0KabeXWpv69x
         nvEPNy2yG/jdRzXl+uAThCsHprPooL4nt8IZCLJkvKU1t+WwdUpZI41enQPqdXZ4L1F8
         FYSopjsPGrbJEP87SWVqjR2qWruDHFfDoUUCCw2UxpdZGx6KxQsM3cRINQdNqxiiM4YZ
         ZH8OKsJZm2Qm4Bv/xWL2RRgRV+DyoHa+p0Ew+awzObSQqlYdWTJIFVUFkk7tQeb/YAO6
         DdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752206318; x=1752811118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAyGyV/ROok4pI9Bzo4icqARtJ1bPtyu3l7jtXPJYx0=;
        b=WCOPzuxEreqLcOv/70+K/8dEwMjlK5Lcwmnoawndhf6UPBAKqH3B0afNqJb68ayT/7
         Xmkui/1no+TFcDkIsM9NxSDNjatecNncZgHOytIFnLwAAVlYQ2h+/wKbXGsn70vD0Jk3
         Kr+ANxdr7h1SbdAGEWk/Q+5XTU4YerU1jwdXZ/toFwgceAMkJW9sZXDOfb8sB+8O0fu3
         AwQLmoUAp6mM5Emkj05yI48sqgpQWGmMAGWHJZmqAmFAt4GL9yXDlXasHUabTtN//cFO
         Ckzf5xQygKfUETULSJLq/9asfgNGBVNewWwzS2JRBNkwxV++80ZEE6sRO5ZO5/CHtF1R
         34Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWlJUklzgjkPGAf2qxglcjoqjSYk5nLe9ufn4BPub8NRRZX9Wop/bnqQ55PgWtM2V0k5RtSkK/7xCQlVACHTaN1@lists.infradead.org
X-Gm-Message-State: AOJu0YzW7NY86/60gvUxIhy+ZrMEdY4fS6dR5NAjU08fQ5kcKPg7Kv4r
	Rizv0CCT/wybfTLrniXXEfAULLfT1OXltQtD26lwr7wYrao961GlZNg62zB4o7T2UVFcrg==
X-Gm-Gg: ASbGnctpPrr2JQ7DlkzbZ8C1slCY0EmKFtJ13jOu5NEtlbVAXR47MBmX/3MQ0lBi5JT
	/LwTgxuNJ6/eSgcfdU7FuwnOgGuTJAw6bQGSXI8F5QMonPS7HDacico1BX9rkCRZq+ugexqPxJM
	uR31OWDtO1fbRhuAasyNQ9draujGRHFbxPnp0feHk66HYlwNoWMd9w9ShTGcDg5LNETeSgcU6oP
	li+ibu/hlrfNOUX2mk9UHABbziuqa4OImuiy1w7DJOrwHkzl3UqN5loRsqAmlNItwOzVY7bmU2O
	/fYcaO/7VhZ9Pr3fWFwAwFgCUPE9kvIaDB0U4/mX/QgE9N4GOIYHqqif65NTIGA/X4OMtq/DBEy
	9Dw2+3hW/+JI=
X-Google-Smtp-Source: AGHT+IFtt4gy09VuR+9hOE1KziZmPtb3mGCWJrKa92kTcM9xUQYQNVoHoopk6977gNAOL2psPZEM7g==
X-Received: by 2002:a2e:a594:0:b0:32b:7284:7b with SMTP id 38308e7fff4ca-3305329b33emr5078191fa.6.1752206318153;
        Thu, 10 Jul 2025 20:58:38 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa2943d46sm4971191fa.40.2025.07.10.20.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 20:58:37 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.or>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 1/3] dt-bindings: gpu: mali-bifrost: Add Allwinner A523 compatible
Date: Fri, 11 Jul 2025 11:57:27 +0800
Message-ID: <20250711035730.17507-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711035730.17507-1-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_205840_192486_E4FEBF5D 
X-CRM114-Status: GOOD (  10.61  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Add a compatible for the Allwinner A523 SoC, with an integrated
ARM Mali G57 MC1 (Valhall-JM) GPU.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index b8d659d27..aa19f8819 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -40,6 +40,7 @@ properties:
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
       - items:
           - enum:
+              - allwinner,sun55i-a523-mali
               - mediatek,mt8188-mali
               - mediatek,mt8192-mali
           - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
-- 
2.50.0


