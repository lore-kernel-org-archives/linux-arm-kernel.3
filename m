Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AB6C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 18:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIV2B0fUwqK8CLLa1kWwxVC8BX5dJhCy6gXrqz6FTh0=; b=Mwz+2skRMI+u3d0GvQGDnY1qNN
	8aPkjlnMNXDLwtDIA96XQbExrQSg+49oGmfOQvoF1ai6r0EeTHeP7wLIB55JJjnZ5RlTNc6l3GfBI
	hDrGgbEHDqg30s5yxvCBgEG2QwlESGxPR9c/WAB24JstMy0cxhtk/PRMqE5g680lMY3Kj8LN6+QY2
	/bxT3aY1yldYCVG6xUi1y4B95UuAnTaBj/oMP3EpMzuFvPpKnpSzkJ/GtY2ijS8aaoCJ6USMrpLzr
	b8ePHlfGCZ1gxE2dSxvOnf6T9uHl9yEL9tgEuOGa02xxF1l+Xh3W4IHvgmQeXiGJw8gINRhM/qV+L
	HZiew3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgNS-0000000GLuv-3qz1;
	Fri, 20 Jun 2025 18:22:14 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgJ3-0000000GLKu-0o15
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 18:17:42 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-748f3d4c7e7so1763697b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 11:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443460; x=1751048260; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VIV2B0fUwqK8CLLa1kWwxVC8BX5dJhCy6gXrqz6FTh0=;
        b=fzJ+4YdclbJe3EKJkZCIiWJBDUSApRWgeThHARbzXlLwJlBBYNtz8L3kFjggmAANcs
         bAwlTwuthGfIFvOt+6rbwkM9KIFb/lX1/xqnjAJ9jfnEJ3/rvPAVYtlext5x6mjkZhyy
         grMp/9pof7saKlPgbn7jimKRRcu+WreEm9dqazjNtVwZ3+ILzTfP3Fhc1JoMulkV5VOL
         oHW72I19ulRSyg+Z0hm2EL/q3f2Ux8OM4PO9k9NKdwyfLmF3lYeOjtY1QszZcs4kqYaA
         Jg/qc3IwaFotSGqjPaJ1cRWoSmKHD9HHz7+X3o6pA/00rT4OvbHSJLFbT9g31JYusvVN
         aKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443460; x=1751048260;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VIV2B0fUwqK8CLLa1kWwxVC8BX5dJhCy6gXrqz6FTh0=;
        b=M2BJLo82Du7dfv7NuRMzRQJ6KwHCdMCPyIwCYjgDIV4awFfd9bEAYMc+CjMydiRf5M
         F5HACFa2/nyy5Z9cDxGOZYnJ3TodmRKwVMslHWuX4NwVHtLAfpQcrd/AwyRqFJ9YCAa6
         BhwgJOez4gU4n+zDX5aLrIKLQZ5Y/dLIuk+o3Qy/PjD2rk5o5t3rLrhEdK5zfkGZ9jTN
         l76pTfbN7XEX3NXKIEOWgX8XYCcvdKE6kSUBKqa3jQxtGlPW4FWtlLSOYoAVmBqtiYzs
         oM5kAWn0B5NvDX+Kw5bAQGGuqDmkhe+EBbQHmd3sH/K1Zr0q61LLKGqIiPItQh2XZL38
         Atvg==
X-Forwarded-Encrypted: i=1; AJvYcCXeszeMKyDOXgAiDadUcVTphaIUA7x2IPewskYsSBZeTqVJfdp3KcGlzrdqXIz+UbZT8wVGSdUa9m2J/vNizXWd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw6Per5ZbPdrckmkwg0Mc0VfhZuFsMSv3UY+oHBeBc1YszIHO0
	fTxi9Ka6VoI/MMwuuxJOj2gL9JfPXQr0QP8/jfgAt6a0AhVfRpLjq2GJANdAXb+Z609u0t2JU2S
	qZFDI7F3mvHb5IQngjAvpz+18R47NOg==
X-Google-Smtp-Source: AGHT+IER+5ubUXb+yU0g6Y0g4aUyAkU4ur+g2SnRAtI7gYMUtRakP+WKgzwI5sAh2R7yuuPE5LK9mNIpkJ/4UWR5zIg=
X-Received: from pgww8.prod.google.com ([2002:a05:6a02:2c88:b0:b2c:4548:13d0])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:920e:b0:1f5:591b:4f7a with SMTP id adf61e73a8af0-22026fe7f17mr6330358637.38.1750443460127;
 Fri, 20 Jun 2025 11:17:40 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:04 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-2-willmcvicker@google.com>
Subject: [PATCH v4 1/6] of/irq: Export of_irq_count for modules
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
X-CRM114-CacheID: sfid-20250620_111741_223399_0E5EA910 
X-CRM114-Status: UNSURE (   9.74  )
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


