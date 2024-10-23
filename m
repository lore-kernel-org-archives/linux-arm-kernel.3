Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED94AD0BB46
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbIIsZZ9TdX0oWXf8pQROsVaLwB4+pSHbj6T28fJF/8=; b=jquw9zyiROQSC6h+QLT8rkTdcb
	IMWZk9ushpW151zlqnBSqAT3mGSbc0Po9K/MO73F7TnBvjaea/8JPpJLwbHh9cnCVFvMh32oFJG75
	FaiCqHt+W9khOIZv8KLXL+Z7oiblU/rIwG8NZuHOgOfrbHVPTOoHG+A1Qo4PERFW88xn56CWi3eE4
	pZ5iB99r1Ozr0dD91LTYiURyChcLGDqEbTfcI320J6M918OvX4oInHJfWBz525QyKQMwdiYoge8nh
	k2tNeJIChztSePz1S3ifweI0DNp/fVJqtHY6NO0a/96rUO7TjMcpxNTg8dudviLVy8iH1FTJktbTY
	Jw+1dI8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3k40-0000000G8Fd-3cuV;
	Wed, 23 Oct 2024 22:42:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jyf-0000000G6wB-2er7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:37:18 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5c937b5169cso474831a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 15:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723036; x=1730327836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbIIsZZ9TdX0oWXf8pQROsVaLwB4+pSHbj6T28fJF/8=;
        b=SDQKYAPOU9JY+fziL3e4ximgQkm6Cmg1Mpk0MJ6FkOC94lVdksceGBUDAudQtyfpkN
         ff3WEcHCz+bSKJEIieIXDcMUKl9AVFvTxoGG7arg4EtNB7Csr7d3h0/Q2dFGataNwZYS
         MT3jEwe64xKL9qDjA+9rGHWtXvK1BzvDTCN8yGCqVcnlg87ijw9s5ye8a9zPaacm+T7O
         85VQsnHdl9Bo/4+6wxKCjHSMP8G9kR9VB8qnoafxt2vGLVq3Uqb5TkiovyJ37D/vz9eq
         VF5yFTO5L9L0l2ldOhPOMMjngB1IeBgKC2NXh6zMOIwMcRQYZWZOrjxWyN71Qwia0LQW
         tx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723036; x=1730327836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbIIsZZ9TdX0oWXf8pQROsVaLwB4+pSHbj6T28fJF/8=;
        b=Y2y426c2+SRpbqu6zSehyrRlFiVbpSzTz2LwmGJawj9GMYW3ertQ0Y+nt7A9xZKhwc
         1X/RnLseArMBnRHMSaK7A1yJAEEJ3E/pR6YKm164yzIiJytDCLu8Vi/XaM9KqMZar3C/
         jW5/mf2JXibcZeY8e8wK59D+dQMnIhIpFUAuqZiZwy8kJLvmmHOZnT5e8qw4HVTuoUdE
         DP/J6YbIwvXR38r7lH/YgExyfRqSm8NnZft/TsAR3sPIUqTZGNTyi3kPBaZqFfopDWpG
         NUkLYFjg0YeGgM1ET9ng38Ei16IsQCgr2Csp9SQyvOuHKoPN3NMaKkj1pYbV+eNmZiF0
         KhkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5Xp5Xh/GACyLJPM5X9FZ+CE4EDDSr53jJXOMRpGR4accX3fa3ueRC/I3lCUcJIdcGWTp/IBAO/sWUHCsSNi5Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxKFLu2HtFmqAsGvdp1EJDSJ+LAUoaBRhX8lkSPKbaijjzJzWWn
	RZ5Mx64Ad0JJtOpPOQGY/6P6rFEwRGzcV6OF3KcZl5kPB4EzEXWW
X-Google-Smtp-Source: AGHT+IE4iE8RupOHGaicMpOPwSO0o90dUKkcJw+YgGb1yq5Z1RRoBU8m3VeF2FnJvx5BDI6kySbmzw==
X-Received: by 2002:a05:6402:378e:b0:5cb:83c0:dd69 with SMTP id 4fb4d7f45d1cf-5cba204f9a1mr25409a12.12.1729723035695;
        Wed, 23 Oct 2024 15:37:15 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:15 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:33 +0300
Subject: [PATCH 02/12] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 Samsung exynos9810 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-2-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=1025;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=eegFh3p7v2cDf+inlqxOGvk4hoeYKqgh34JbZw/w8nI=;
 b=xZPPKOrxbtOyuJz/f7kwAfQvm5ahcxHo46m8pMr1CGweVvc1+tFT56z8xFY4ARW40FQxh/pGm
 7bzG9rdzGZbBitxltfJL1lqhlydx7uiHJhw7tiN1n/ooUpjiZO/478B
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153717_707633_61D7AF19 
X-CRM114-Status: UNSURE (   9.54  )
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

Add the compatible for Samsung Exynos9810 chipid to schema.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 47a8d98346ebb83a7ea4d11e2fc7fc87df6bc5ad..385aac7161a0db9334a92d78a57a125f23ca1920 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
+              - samsung,exynos9810-chipid
               - samsung,exynos990-chipid
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid

-- 
2.46.2


