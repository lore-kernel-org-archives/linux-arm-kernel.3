Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF748D149D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHIbxCZv7ndlL/NngNJdWVaw8pnmec8lE+r1y4sRvZg=; b=ZSxzR/YXq8qDEXeuDpU0JrJHFc
	hzW6sFRPACqCwKLLjK/9FsCRgGnckhgCzWjN1ScC787RlcnS8XgIhbFP6RXrkQ8E/wt+D/6JJQMqq
	GK6shE/xQYb3GO1gG5ePwE+IELynfrrdbt/D3tPk7chvvQjyJy4pA8lE6gOeVYUI40m4t/l05wLRA
	RfeoM0F+G9nDGdk2OdJQ3I3ADI/YWvRXAqNTW540xBnbF2ahsfViZoLTkoWljwslGVHzxHhxfAyO8
	IVqmxH7hAg7FaVXHZzIkHSrRbyomzhY5KySj+aTwTUfaF81hqdbHqoZnJQWQ1pBRklXD2DrIySMeI
	x3suTrcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4O77-00000004b4b-3Qw5;
	Fri, 25 Oct 2024 17:28:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv5-00000004Xrh-0hFQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GHIbxCZv7ndlL/NngNJdWVaw8pnmec8lE+r1y4sRvZg=; b=eCXMWRU/Pf0gR7ncWIFa8nJe1x
	vKFKnqZHotmXL4nrnQoEJ/wx1G3pUPmm7ExVjkNDDc6kWHtjUnOGa4fA6mqxRKT6vWOsDs9x3CV4k
	FAuIivF+arFbxOFjCy1FGVfCsF8kdHEQ+3fqC4Q1Z4gcSjl+1/62kLaT5b25Wjgt+g1IifvMXF9QV
	dpQ8fpYk2zVtey3EtT2SA+4WWtBqir6k5HEPVNPuJcJt5cGydoMBLPq5z2BQuQ7wmF2zeK94Has16
	vMV2aQlOspGwTVroz+HRwkAqR1nPmIfGYYr69Ldix4SXwLe9e+JpYNVK2oP2iZxL6YyeldFiTHpcH
	6hWgwHIg==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv1-00000008zf3-0NLN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so1467742f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876569; x=1730481369; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHIbxCZv7ndlL/NngNJdWVaw8pnmec8lE+r1y4sRvZg=;
        b=ioaPGANi54i5XQp86DLfBRmpGE8dl9s+jLxclz3U1u5WE877C1EeNdNR0kxkfKc8t7
         gDwxizE/T1ijAzYZVg2g8oL3/EITKXE6zm7QDVMH2IccxAjfZ/rwrhqvM1iVYSRy9qs6
         mQYW9OfJ8uKinHcGftOzBhrEhv2O3n575bCeb8bKUlKUbNmSVXu0uwza6ZdNNhoAY/Is
         HXZT+94Z6i3yXphgULshyryM9Vo4wgHja67svCdAS2D6aDobUV3cP3VXyUvc499JkLPB
         VkvQXUffHaid2T3zWy/rr2xh6MRHrc3TQPy5M3hDjv5arDbYoVKG7CL5ns29jW4IXZlM
         KY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876569; x=1730481369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GHIbxCZv7ndlL/NngNJdWVaw8pnmec8lE+r1y4sRvZg=;
        b=exl70fJ3gWoZN+XGDFV9QptJcJqZV0WghJIdRpEeH2UpAqvk3BDCYDXB3cSyKGGzzt
         N/Q8cvxNQtp00p5S6ylL5ym/8w6RnTLBg39vpNfqS2pTAyXJQ6KnfdisMOByABhScepf
         B6EGH11L1jbBvUdCG/q+EI6Nur+cECiBl/bomjSWWSAP8VegLTtFFGqdvwXPObCzOtfw
         vweVxL99oeeTOM9h3txBh2dnDDtik4A1rm/EL/Hz/B+ct76JzKe942Cjs4RhrJ/H5RNY
         7As8tvAt8mRJkL23DYqwwZykobJ3vL8pSdQo1arNdlIJXam771Y/TWeXrpfhBLUTB7/7
         p9/A==
X-Forwarded-Encrypted: i=1; AJvYcCWwjnSx2WG091sYzORC03mWg+/ZXD6Jq/Z5JQZQEVEHYawLK8dAjzZPLCudzjzNsca0HIUkCiAhXvINZfnYujAc@lists.infradead.org
X-Gm-Message-State: AOJu0YxDvi8IdeaAkCaPnhCJYoa3cJreWijlXYPuOd5qITk/dGdohaLE
	SsedXsSCH8/E4Kh3ySHT7nlCkFuqB8bAo1LiTOs3/t6XxK+iV0h+L0n1xTdA9M8=
X-Google-Smtp-Source: AGHT+IEtkqmEo1cHWR2W1weuYPM4uWgJxftiucw4MZPmb7qQfL+iD3mzdPD9IiAb9rW3E2dTgpbMnA==
X-Received: by 2002:a5d:6082:0:b0:374:baeb:2ec with SMTP id ffacd0b85a97d-38061122a87mr106867f8f.19.1729876568721;
        Fri, 25 Oct 2024 10:16:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:08 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:39 +0100
Subject: [PATCH v2 08/36] dt-bindings: display: Add BCM2712 KMS driver
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-8-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_181611_994441_8B38505D 
X-CRM114-Status: GOOD (  10.94  )
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

From: Maxime Ripard <mripard@kernel.org>

The BCM2712 SoC comes with a new variation of the videocore display
pipeline. Let's create a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
index 49a5e041aa49..2aa9d5d2afff 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - brcm,bcm2711-vc5
+      - brcm,bcm2712-vc6
       - brcm,bcm2835-vc4
       - brcm,cygnus-vc4
 

-- 
2.34.1


