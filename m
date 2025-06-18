Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3C2C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 21:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIV2B0fUwqK8CLLa1kWwxVC8BX5dJhCy6gXrqz6FTh0=; b=O4O0IR2XyUHkqhhx9BPOo4TTcq
	KCelvWP+EWUE8ooRD1NMLN9m2f/g+/rxzOrXuIlQeH7BVFq/K6kVHLh4zQKm/YV/ZhepPkvM01LgR
	qWuJ68j+Bk+/yDqplibut5CPsIXw27s/Xqn8YfUGEi3t/A9wWaMpC5KUQr4gmZnqI9d2jdi6i5m8q
	bWS5ODXgpSkU2KONMdxZM3kFBdNsDLl5tnAp/HdtYCdusJKkzEWrBQER8veqmQUOqxr20Y9V3fwL/
	5Cf4eOGGhYzkMhkgTdobHKcjWOTGS7xCuW5uFZ/rY+0R5cCEjJSxZD2ur01QGOwsQLVGPgsk+cKgu
	QXYO1Q2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS07r-0000000BPlb-1E7K;
	Wed, 18 Jun 2025 21:15:19 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS01k-0000000BP4n-1Jfz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 21:09:01 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31215090074so55218a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280939; x=1750885739; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIV2B0fUwqK8CLLa1kWwxVC8BX5dJhCy6gXrqz6FTh0=;
        b=iolKs4lCV/Yasl8k8Y4cHzx77E0Oa/ViC0WISGzCHQdeVmmPw1DBHAdw7Rx1CYTdjL
         o8GianOKjesmevqNYgKhmxPWC1o9OLTMMIDWj1UcCTSwWb5T1WW9cCNSWEp0BkWgSkb0
         hMBsk5sEplITv48SaG6/TlAIZdTN+iGZwjXds6n9pApjFlUqfzHzhMRJdu/YROQ9GdlH
         GZXmOJi/WdFzZC2gxHhbYCumQHtfSzDIcuOYLZO7YeGFnCwRP6uELD2hDPPN5yKiVOjD
         CDwazovE4OnIg95WAi41CkFymwpsIG3Y4WM56f7HcgstKd4jg8OpeQg39jntYNNAyLvQ
         VNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280939; x=1750885739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VIV2B0fUwqK8CLLa1kWwxVC8BX5dJhCy6gXrqz6FTh0=;
        b=sTp90s85+StBYYAtx0gInFEap/wNEsrZ3RCJGFOIp62Y93hkJM90kUFBtAxl5EUTcQ
         VWbzrsucmjOWhHTWfJtHcpdMZakL6JHPVtpIZ6+D1AAU+7jTlan03DmvkOWiNQ2jGDVi
         TacEJUladOQGsKwHJe0Q5zoUzd0TyhkgtkVNNXAM8E6+/3X+c59ctvVE9uc7j3PXN2DI
         I5oE1MuK2k3G3sLx0taZrW0Gh0ChOHxQC9ntfW8MsBJtpdp8+ydwjfHALLqvmYzoXXa8
         o7I7XDYAMztAgYynXlFraIXmee7W0lqq/n3UBSsDf89WROHmk7spvwR8NV0LzSO35d70
         1CoA==
X-Forwarded-Encrypted: i=1; AJvYcCVyjGKHmPgZ5j3xuTlyvui0/2OwG1Gzu5HC8KvfV0fbLmWX8zja62FQ5UkVu+/W4CdDWRQpqKHeJOqVhuLZu4p8@lists.infradead.org
X-Gm-Message-State: AOJu0YyCODyUjrUi7W0X7yoBSgLvQzDHf80A7auUZCXP0gdvXugFKXaV
	9njwIb9EpboblEgW1vreWUSuKj/7CHfcF/5F8HfzUNRoeTmiVnGRQWVTXKBBQwi+NM+mJGeImyK
	OaA/jgrBgkrAfpP8MZrdb0JfoxZYjCg==
X-Google-Smtp-Source: AGHT+IGiJGT1YFIh+v5uqzvDM53cRKs7EFb+HuttlM33+6jHCYkauA26YJBxlkdTenXVFE1UD+DGINSTOc28e+IdqI4=
X-Received: from pgbq16.prod.google.com ([2002:a63:5c10:0:b0:b2f:6290:cd48])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:eccc:b0:235:f18f:2924 with SMTP id d9443c01a7336-2366b32a043mr308396435ad.15.1750280939235;
 Wed, 18 Jun 2025 14:08:59 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:38 -0700
In-Reply-To: <20250618210851.661527-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250618210851.661527-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-2-willmcvicker@google.com>
Subject: [PATCH 1/6] of/irq: Export of_irq_count for modules
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_140900_353973_6585DE78 
X-CRM114-Status: GOOD (  10.25  )
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
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
2.50.0.rc2.761.g2dc52ea45b-goog


