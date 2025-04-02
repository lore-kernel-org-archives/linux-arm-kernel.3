Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94BFC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 23:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xi5mLFbZUHgD9CBrYI3yiaxvs0vxI4kX9JEPJJ2pFk=; b=jBgIijGFrhWAWJOiLU4ijjqIna
	AZ3ZVPqg+JTGEMmumx6JM7hFRcn8vNs8cDY403oYeoOutBvJvOtoUtu4Vu+8Ve55adSEdMXKCgFer
	6+ZZZJyLOlgIw1XM7hUMOl4w3r+L2JexTtXV4xuX3MHTpcIGJH+Ex8Lv+EOuG/Y+DQhbKrAlK6btO
	Tnn/UAIFWQHJhTsDju5rtvvifuIlXsRc6n3xeSjtjO1lKy8G/D6j/NeQfYpcsEWef5MvBev4AFTqs
	T7pJK9uWQng+QuYNV2i2mkLs4TOaHMkx2/UBYUkx0ScJ6ODnTq2eBkeXs455P0Wtcv4PsVXhGitzN
	/dvybmiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07xp-00000007STt-2x2D;
	Wed, 02 Apr 2025 23:57:45 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07bX-00000007QAS-1KjJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:34:44 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7395095a505so231184b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 16:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636881; x=1744241681; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5xi5mLFbZUHgD9CBrYI3yiaxvs0vxI4kX9JEPJJ2pFk=;
        b=3fAajivOsXoPEBFoK+V8E3GCARWN2fS3siT2HBA/siRx8NXZjQoDI7NH5vSV5gEoai
         6iiv6Ms0BEwRhnc8BUvQm+YK3edBbnIDptSCF8CM3+C0fAKLqaA8ibVqlCBybyvUCWzP
         iB2HrXUR3xUq8I0nIL7mh+oL4mbX5Rnl5UfHd87Bovxz+Ca6wY3G9N8ABU5aJgY6WoIA
         VuGseS0+WQgNhWr+Tzm4YRmdwAFcXhCjDdPZRtOqAb6aHB6MYD1qU967rAD6u5qxdY63
         Bw+C9X/sLiUosWE8maaAAOLaNpAcwElpWCtABiymqubo8E/+ZTPP8OGgys5zAcTGQHUz
         Sw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636881; x=1744241681;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xi5mLFbZUHgD9CBrYI3yiaxvs0vxI4kX9JEPJJ2pFk=;
        b=pfbXmCH2GYSfyapcuvOgldjwYyV5zFkxJcOQTTSGSYMVAOF4pIlrrB0gW5xKxSAQq/
         ksPniJ6Phs52DjEQg5DXPdTA6znEnVd3TGl2COvoP+aN3TxIbhJXaEq+/Wq4EhsxaK+j
         44D+CAnyTCA5C/krEe+rq1cB/JEixFbjy7nIF8BH5NHTQrfNHSrrp2xctCsyh21XmFSZ
         u0TJaVgq1+hs62X/JNx2haPkFsPLFKzCEWNW6zLIbAUOKMtnyIqL7WU79R4O/ycNZsRt
         XDdGg5QYZqbfvKMhcNDN/Cvq5ErFW7TRX49L6K3MggO2bqSEJPkb8EIP9YlqBgNWq1eE
         dr5A==
X-Forwarded-Encrypted: i=1; AJvYcCUKrE/9CzBRhSAVsfb3NLengxkik7Aw1c07v17TNG5bToDyPVCrCOAZ1qsSYIH5+3mkMe6m4aA2pJ1s7C4KIDyT@lists.infradead.org
X-Gm-Message-State: AOJu0YxwzYZRWTZu4F8aVO97KKt4efsyQjIRtKbjcH8ctK4jLPfttLcH
	hlP3dZEc5x/+Yt3GrX7aJSQOzcTo9F/lRS0iNs+TRKxgOajUYBO+UuWbx4NOeSpaiOBt6btKydf
	oMeSYL4dxTpgoRj+yHq5FWkHphA==
X-Google-Smtp-Source: AGHT+IGTNM1wxMMNBBsjkTvh/Xn764ju971ydcAgLFhQFJR70t7PGAxvgV/oZ/gvmmS2Z14LxOex+r7v9TwTloj7VDM=
X-Received: from pfbfa18.prod.google.com ([2002:a05:6a00:2d12:b0:736:aaee:120e])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:a02:b0:736:62a8:e52d with SMTP id d2e1a72fcca58-739d85573d8mr639945b3a.12.1743636881683;
 Wed, 02 Apr 2025 16:34:41 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:52 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-2-willmcvicker@google.com>
Subject: [PATCH v2 1/7] of/irq: Export of_irq_count for modules
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_163443_356650_59189114 
X-CRM114-Status: GOOD (  10.30  )
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

Need to export `of_irq_count` in preparation for modularizing the Exynos
MCT driver which uses this API for setting up the timer IRQs.

Signed-off-by: Will McVicker <willmcvicker@google.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index f8ad79b9b1c9..5adda1dac3cf 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -519,6 +519,7 @@ int of_irq_count(struct device_node *dev)
 
 	return nr;
 }
+EXPORT_SYMBOL_GPL(of_irq_count);
 
 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
-- 
2.49.0.472.ge94155a9ec-goog


