Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2061EC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfTKPxq4bZ4SwTcRdBqaDniN3wi53FAiqmOye0MFIKo=; b=jk5vvVnGP0XUKw/CgmjGqBWMUp
	AyY39n/rIrWD4ll0eLjEgoJD+oLUcs2zG5Tb7LW+nyHA5vNzgXMoIr20Lk8e9h68xaQI/DUwSsDQL
	AtEQxW0fJmgG+oEdfh+gyCPCJbsYzw97+WOY6a1IeUJ+edC2VrbA56D1VOxOPyOpv8yOtgvepGLAJ
	Raj5AhPjeaQCUOm5F5BZPtLzV3WOuQ+0cqXE8sWaZi5spB1cfSUnrKOSUCQ8TPwdSTmjfZoN8OYMe
	Osvl4y8VPJJXCeIoF1pCVZaoo9/lVwWyl0u1uhcIpK+Lp8llXzX6tK2JpBTSv359aMWrFK1tJ1VL/
	uvmTtpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5VH-0000000CfB4-2Dmc;
	Wed, 30 Apr 2025 11:21:27 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4kW-0000000CXjE-0hbQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:33:09 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so11241631a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 03:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009186; x=1746613986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfTKPxq4bZ4SwTcRdBqaDniN3wi53FAiqmOye0MFIKo=;
        b=hlCH1iqx/wXWcTNHhOhSJ8MdISF4KnY0egM2qrkLYdHCyqAmrlI8CY5OJBCK1/qntF
         8BO3kNdAszugFIDivOV+w2aF8ABP+7vUZdNlQIHiCs2d3r3Yo0PPyocr2IUy4E8ivC51
         xF8gHku0ABmB5xTqVszBshhemvL9b/FI417QTd3ZnYBSer0C7Vfpv2a1PYbHTmhKAPnT
         uF+xsPdO7oSLJ+/bvigXOeJifW1kKaJ/q3p+qqCHa+MUlihZNJ0CiSkq4kD6rpEdPbW3
         F6RGupOmjKSMqYPMWzoWoMXzWc70qBYSxhinODaJypVmtX/NQBEy10ApdYIPPUWDuqSy
         kFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009186; x=1746613986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfTKPxq4bZ4SwTcRdBqaDniN3wi53FAiqmOye0MFIKo=;
        b=TEDIG4vhLhKzgqhHCLjHp6fkGH/xIrshWajK6IdATXzBcvfaJ6AWwKrHMebmvxwNpW
         JNfJA1CK3Ko5bAzSlTArdmnziD+aTwavLh7IFd8Jh9a6BIKWf9J3RTq8bXQKjCMMW9AL
         EY0uIbNCO1LIXQeMvxxQVEdQSQ18QBmhAwyZIrWmuBwuUfDXnV5gHRO+H3hrE6hsGPJ9
         VeQSIJXxgMzrP1cI+0gLiyoXDOL0l4JlNDs7nmsew8S1iQouEnEmFZBlIJgvrSKrrQrX
         uZbCCeOTRU/Xa7uIvM1nJfXAG8P5anzjwgd/3t9sb3iTqRjpNwXBb6UHc1NIguSvxh7S
         bG1g==
X-Forwarded-Encrypted: i=1; AJvYcCXwwheBKAE4/7CeJ3yt17zPc2QketIJ4mS0BG5rvF4BChPKFUekopHSygGU2/jDtH6mjdQSWe3Ti2uLDWMM8Lbe@lists.infradead.org
X-Gm-Message-State: AOJu0YxHCDUcholMSPpj4sHHe5wqt4HLHGLT9CDeZ0gnx/UxCewd1Oa4
	WmOHgJr0oiFUNu0chAJsY8LnDAffatdKdbWmSLRqZeXKP9YUuWsSODZlKSqdmLM=
X-Gm-Gg: ASbGncuEPnQzfzXbQyALohY5RIEkAO+znutR/+RZWx+rvKKQYc3gUSaWEexx0c1XCF+
	ivTjZyofNi58wCFsxqwPnp7f385kl80B8qZK/v7Kkk9aiQ4sXJ7I65lwwZ34rBIS8k/pdUwjEhS
	K7NpsJHGg1+SvbgOn6rGANxYz1x8fSVnwvmM+69vePzNo6NlLpuWUl3m0QZYXeMJA/pqV5WLdE7
	K/QaBkYKTdPwhtQqCxsaI7WIyR8ZN+esLJ0EzWknsq2iNztS+WvxwH2GztMSrtiQORV+MjTL08K
	6+JdzprssSH70GBwLui5sfxkUEM5J2UvYEousDpCoq4N/kHBo/qtlJ/Wcxu19IfXp6TccwT8vDN
	2ekv8vw==
X-Google-Smtp-Source: AGHT+IEEfl+k3BC6Us3G4LOLDc9wt5JbZ4OiyNOr1AeXljqq4kLkSZXbAFThitp0f3NmQGw8dzbixw==
X-Received: by 2002:a17:907:1c94:b0:ac7:1600:ea81 with SMTP id a640c23a62f3a-acee2600a17mr193116866b.49.1746009186334;
        Wed, 30 Apr 2025 03:33:06 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:05 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/8] of/irq: Export of_irq_count()
Date: Wed, 30 Apr 2025 13:32:31 +0300
Message-ID: <20250430103236.3511989-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_033308_205072_29DE0B95 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Export of_irq_count() to be able to use it in modules.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
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
2.43.0


