Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FF6CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=; b=Gi95YqODqbf2h+XoX8wRSafgBP
	FgD4YSEUsL9ZJtIv78YUJCGznswhezEVuBLArA4S0JAmAxtCcnrz1+xijt7KueCc/LVQX6BFoGltC
	AeawCTCiPu04r/OMUrmcHPTSTpA1sIsYGcj1NGsP6LbOj9CSouz2Z2CKGJtEqvwZSI7f/5oAEedkD
	U7L+BtA261GXcwDBUp9482AcaI50afbwirP6Kj9IPHRwwb/mkiNXrbqS3ppQFrZAOvzUhB/KPLVJG
	lup43JW0jyg0Ty0nZjQ+uJY6jbqiBgrxzdYRKPG+POsdHTd8saclrOSwBWluCZuAw8AN1m/zb2S7P
	PzUp6HEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5gA-00000001rvI-0HtT;
	Wed, 13 May 2026 09:14:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g3-00000001roe-3Kov
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 09:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=; b=QyUrOmZAp7vvoZnolKdKKHnUW3
	KqgzrFdbv3ltlAYt82SmRC4e13lYZMc1v9d7VWXMqZAdV3AEl5wXOUkrA8B/74HrF1oRIx4+VAbqV
	bN/LoGN4UnV4aNhsn9eyUSp9YugCrRDQhCqIzWZS4VGeap93yHUJKrU/cqaBqTfO5pxUf8bpe7WfH
	5IR0GUGYz3KgHl4t3PkG1eaeKLm8fQ0fQWzgiClE7cuQiz8mG4VFQMZlUqP+X80shAIHexds3oec7
	hloE/IS0XR3Q9RKD45Di/VwiCEtsaxojXpH9km37qTGalQSLI9Si/owDXy8HYq3kCsPFQaezH9NFQ
	RyhpWPEQ==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5g0-0000000BNn1-0LIM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:14:50 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43fe608cb92so4107354f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 02:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778663686; x=1779268486; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=KAZGGuxnRWQdjxcGouTq4BQtqhqB6jZMRvH+xOdbt510snLOIG8ugsPBkhs6FB4HcM
         tyRjg58CA9YUPu5Kqjy+1DjI9vLTdyhGQA+UYeqYoMpOZOTn/Wwl4KsZC7u+76aCY7aq
         IQme/8VvFsdNyiLEphDqDj/bvUONopti/vHn/twpJ4dkxEHs9Igr2GiG2vqv5tI+VSIK
         6xAgTVOBAnMVs7UMJbjjxojlTiJStNZh+6yN2KnfQoU3ewHY2JSUH6G/nu/y1+W+Mm6I
         oWVdFf8h2ChO5rfAitNtv1dS85I0UQ2kHOLvuQU26N3m/y1D0acXW43X0KuH68w8dVKK
         BFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778663686; x=1779268486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66sbIWl/UECZcngzqfN9gySpU5b7WSWy5FgqX8acPdE=;
        b=Bb3v1rrPB25gRF4J49kV4vp+SrhIPQYWreoQ3sR/j9V0h0TJsiQOsAUzG7wSwT/N3M
         p8Y5+sDbK+23MpJzAgf2RD5OgLnwk9jYBNbnJbsbkLLkvCVw09tkDXRc40SXK7nDDCo8
         m72xszmQAlVJIWBuq/JcEwbsP3slIocwcZ8/Y0Z6CUg/5GP/5BtF1MBqTaVEI3jsXUyz
         23aOpei2qle0HYZtB7LSs5zH5axUakbFGqZUdRRSBSTjqnrDS4rEu5F65MatNdvuW3KJ
         Oqfx65uFno+Q5vI83JQ2hcdJF7BMLbx6WSmnI/UCS+pW7W7KymOGFWZO2R69/xYBHc+U
         dvEQ==
X-Forwarded-Encrypted: i=1; AFNElJ9H7PpYpTLhSUDeYfBwEN3wJnJiCWJ/Qc4xBRaFHZhmnv0vszfkprYH1ADcXft2W52SThHMdtZVbhgsG4NCHdm9@lists.infradead.org
X-Gm-Message-State: AOJu0YyaAKj7xZDcMYQG5cq+h1uzclcl9uPNgWkSq6Vrl1+lWroTWjHO
	TsWU+NH1fKjKrsHC0xtaKULt6MRBvg727fQ6GYzGZt4JXmkUpcqjeNX2hGqeDZs3kr8=
X-Gm-Gg: Acq92OHbHGr1eQaeQfRzYa6H0DceL0hv1A/mhyHPKXjSE2D2UIkXc4GlDM1+V1fd4z7
	unSgFo/82ztoJG1cR1H408cnGK8XwS9eL6MytfQTS98J3Ja1Z1vquEp1dLXuw5ckG/HPMTZZEmg
	E56ThL+olfYzH+n3ZtKxwz4zIRIqAbe04ey7eoXCGwB+jqAXEU68EmuKY3dW8odI27px/2wtoMf
	W84BTGjUEo7IPTN3uCVDxRFf0hBOGL9w/2Q97txx61jQ5yWlXmGdJsn7YKCZAzW+/7pe8rKdnsK
	KY6e1nj0uNU1rO6g2EvhXhYFuvxadHoiiu5K2prAzv/Z0296nz0dZmTX7GjuVhp0CQMMVRpebHU
	zbmrfet8F+dFj6gBjCu2vv6v9qsCdi9xiOvZ6vDSZfqr8gbfq9gaCfGx+oO40Iv/MGc/QTHJkiy
	H3TtWAgCoYLHvCZkSnJUnd9DPfmWhguq8=
X-Received: by 2002:a05:6000:26c2:b0:43c:fdd:ea96 with SMTP id ffacd0b85a97d-45c59cd1579mr3756642f8f.26.1778663685719;
        Wed, 13 May 2026 02:14:45 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:62cf:84ff:feee:627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm34590821f8f.4.2026.05.13.02.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:14:45 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 13 May 2026 11:14:29 +0200
Subject: [PATCH v2 05/11] m68k: add DAC modules base addresses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-wip-stmark2-dac-v2-5-fcdae50cf51a@baylibre.com>
References: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
In-Reply-To: <20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com>
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_101448_251344_E86281D7 
X-CRM114-Status: GOOD (  10.17  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Add DAC controller 0 and 1 base addresses.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 arch/m68k/include/asm/m5441xsim.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index f48cf63bd782..f5acc962bb95 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -191,6 +191,11 @@
 #define MCFEPORT_EPPAR		0xfc090000
 #define MCFEPORT_EPIER		0xfc090003
 #define MCFEPORT_EPFR		0xfc090006
+/*
+ * DAC Modules.
+ */
+#define MCFDAC_BASE0		0xfc098000
+#define MCFDAC_BASE1		0xfc09c000
 /*
  *  RTC Module.
  */

-- 
2.54.0


