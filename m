Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9916AD13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgC/yWGHmE4AGKMxUzujN8ihPZGQwuq5HhMl1Sf1wCU=; b=sPcj3VqVN0+k3ENoeAikLr28yv
	gly+1Wfht3bL37CQs3hX7aP78tWQ65nv/8n3/XF2ocZsiP744pu1mu4tT+UGd7+7njVnECqAJwQEx
	BSzeth4b23zFffqLUDibawkGY2j7i9cVHzO4kav5EhlihhWIyV7oR4NdPh6mFivblpdMXtw/SM6m7
	6Z+tY3QDeXfUkXNLZh55zZt8wRHCv+ZstPtAmpUVREOEUZwORLoSnQrh3n0ylrUeV/jRv1ueHiXv+
	RRsZOyjYtzXn1IoRXERHFWBcpNjEGNXbeHiWpVZuCCszMOKzGsgOA4dE0HOccJmi88GvePyJRUVwM
	JJP5iHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5MK0-0000000AHYz-0Cct;
	Mon, 28 Oct 2024 09:46:00 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lxf-0000000ADdM-2vNy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:22:57 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539e690479cso3852527e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730107373; x=1730712173; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgC/yWGHmE4AGKMxUzujN8ihPZGQwuq5HhMl1Sf1wCU=;
        b=XxC84fTPmmNpLTORrTGafM3hnvyxnxB3ee4djVeQKdSBHmsf0nqr21oPdrVeWSdC0j
         BHmFiyDVoJ4REP3sx4XUk7rMhRLFXEfMZzzxdNuE975ywGjaIdZoAYDoZfJNj5dO2w0/
         fWJXWkwjNXzGUxqrBV8/98/dfVnZHiqwfokz64H0hPNdY1h88QJe7i3JVUy3Ziw/9z44
         Oh5i7h0L3Odm1B/fEOReZJ0rHOPm90xG0NYNAzkJYPdrP02MbeW+QWJtyTLVQgoeBnVa
         acsa7Gs2R3ACPuig+5xs2HO2aB7+I7Oww8zUYVa214f0PA8+UwUS+oBPxlVClscvZZnc
         hWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107373; x=1730712173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgC/yWGHmE4AGKMxUzujN8ihPZGQwuq5HhMl1Sf1wCU=;
        b=eyp6A2/B/ZI3U04ty/9y519ZdrpN9e73SKiuC9DjObJmrpnY89ww6GGimgRRghb6gG
         E0bxK8y4UUTSlRdLf/BqnZurJZgwI/rFWLNSLTFWmYKarN2I4+58Z1sWDWVjGAxjFQNh
         1SGnQjVlYRp2sbK10xxmiDc/Q8+asNLnwfjKc/tYEDkxYvL2uQlvh2Ws1oAzfOUibI9n
         v5zg3yeG3h62hWukJC/ZYO5QhnUSTWhX8L6HnUysXlgsbHNPeALCbBuow1+4nTbJSvhJ
         xNTnkqfp66FBsKWKzjtLRKm8v7DYPVEDBoqrElTp7u+rW7ie6WxdGkyEgMzTSGzQKjyu
         0e2A==
X-Forwarded-Encrypted: i=1; AJvYcCUfyX5XKwBeb5Ke6lYhD3/GHJRZ4hpwFKCTeGQhPTC61seWcmVfrl4E8sMxDEvdpMXIwvckF9BfocM9ED4zRStJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ8xbD1GMpOExqnsscKfzDsApMJnrLzn1/L2e5VXa6G3+/+Qc4
	rkwS1neQaLgVwTbIT/46mpy4vk+MnqkjafLs7LHZL/MFEUahGkjR
X-Google-Smtp-Source: AGHT+IE+Ev9N1xNlkGTKVpoO2qeGQ9vWoj/Z7Tf2T0auYtqb7BI0SMITAYGyR+Qtz9DG724XXJZWJA==
X-Received: by 2002:a05:6512:318c:b0:539:918c:5124 with SMTP id 2adb3069b0e04-53b348df188mr2752749e87.31.1730107372891;
        Mon, 28 Oct 2024 02:22:52 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af331sm1043785e87.152.2024.10.28.02.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:22:52 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Mon, 28 Oct 2024 11:22:29 +0200
Subject: [PATCH v4 01/10] dt-bindings: arm: cpus: Add Samsung Mongoose M3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-exynos9810-v4-1-6191f9d0c0f1@gmail.com>
References: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
In-Reply-To: <20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730107370; l=977;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=UwXq8/s+/ZWgzHv8GxfRHapMvLu4ujsMuyVEiwqZOGw=;
 b=UEC62CDHdhTaw/gc44/m2/6av2OQGEdphnBwv4+sZ2AFqTkHx3KbF0dwtXTALXrc0rbPEIvPc
 dltazm5zyzQD/XEstuSvL2pbQ2hyrGcl3pK+ymHuyUP2zlh11igxW3O
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_022255_767511_3D6A599B 
X-CRM114-Status: GOOD (  10.16  )
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

Add the compatible for Samsung Mongoose M3 CPU core to the schema.
Mongoose M3 (codenamed Meerkat) is the big core in Exynos9810 SoC,
designed by Samsung. It implements ARMv8.2-A ISA.

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c54d20dd9d7efcbbfe73e5a63fd2f61d1e010d29..2fa7d3513da839ddfb2844628b1249567226a025 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -207,6 +207,7 @@ properties:
       - qcom,oryon
       - qcom,scorpion
       - samsung,mongoose-m2
+      - samsung,mongoose-m3
       - samsung,mongoose-m5
 
   enable-method:

-- 
2.46.2


