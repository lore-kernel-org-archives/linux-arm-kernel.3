Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31762C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=; b=aEIjEBZMrsxwHpX0CwTZD/SpVJ
	gCPZHpTejwbqip9mErlgYBvJHhurpr+T8oPQwiagB8j3Ede7H8J8/DGKgKDdvHfwKqdYS4E5Nj/n1
	Mw0okfQCCCKE2MOW9q3sNQnwWAog1AKAa94bppD9HrUjCl7Nn0+JRKRNFsZ3W+oK80I9LjpnkQAzo
	7rW+hmzOEX4spelPMkll0I23k7TjCuB/WyxxJ3cdM3bkh27T/SWbuyuRW3julqVdAZdROpgtoLQd0
	9RzEFMlgGJlEhlcIuWxCtJJ2tCrfGfsJ/ZEQLJy0N5fkLibtC6xi4NyWhptl5lduXbNm4UaDCy7BI
	jPq8SlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HJ1-00000008T30-0bWI;
	Thu, 03 Apr 2025 09:56:15 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GPw-00000008JrU-37up
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:59:21 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso1220918a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670759; x=1744275559; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=M9KYG2nWVyqGaPbzezBg24thpY7c3hABEzC3FFYW+ka9t4x62VDv0u8avrPP++k+Ui
         nex3uD2ZuALDNVV8NtazNifQpBSX9QHE/rVo3IOe23ib35hGCZP+Idl+SvoY1lVhM1ye
         AdARABfmLnBfqAJ6xNuJWzbC3534+78Yfobv1frOg9Ou2Z5778UwYwE73LhcpOnviydy
         bjlwy4D3eCS5ijv4/wmbdI9IcJ4q/rHCe+i8CRG+Ql3ugHsvoGCBWwCh3za9lOTtOBSB
         aDkOWd6/LpXOZ185mO8k2vz4C1brB3xKtqblE/PvP0skCjM4DAFe5B390xyFKjZYd4oy
         g7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670759; x=1744275559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=TTOwyOTYqJoWEmU+WQUo9CUwuovasoTa27MclDJ7nmgBaXY9GfjL5gT7Mqss7enB2x
         ysIV/LfpITDL1QCR1S2NU61npfl362fnGlquhKHpdcYntxuiyJBCtLCeOm+2kw98qNwT
         lp4XdZLUC39rW211ejP7aSB+wBOmgnHGFk2zJA7SzcZE87JAiW7tIhko0U8GzTfs6w3H
         FZMxKYug4HXsz0VvFGmfL1i5qhglnJTlRKtBXkjr1fi10pZ0Qcxq4Jk79733jXTrIie6
         3H6jG7V5xhpea8UTe55kCQLnggUeIAXAD+2NQymKrmUlddHoCa9YgbJY0q+bKm/3zsyM
         9gjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKnPA85kBw1MhSw6MUg/4+3XqAX1KS8LVnqcuF6Wz8Y+RC024YXXDLAj2LxMx7MXj6HURuUq3FK6tIWIpQnRQX@lists.infradead.org
X-Gm-Message-State: AOJu0YzBBDizTMRAkMF8Zerl79HokKkNJdj8ihT4FP5dUvVMs+ipLmlT
	oc66DYpf+Use/AavXFWPWtWXG2FJsdmdepjMsmF3UhK0edXpypcDP7Nv+WGhJMY=
X-Gm-Gg: ASbGncv1GnB+B4x5OSBJgLHphzJqf8RUQq3JvPrLLTl5JDlGWXVEnK0JVGJu6p5TFJt
	Wq1U5m0hxe9MnfyoOHdpZbqzeOYtsTSgGMQUb6f1XRGothb31TTpvLHAfkgYnuPym1wOvDTwzza
	vyeqLl+fo0yvNzgWVSX/g11ol6K9XV8yGmk6//f9+Howdonxqrd3+GV9CXD3BV3GFYaE6PTxI0k
	vIhDGpIhBVgWMUTIednkkqdpPx1W4STaGWtglojg+sjnFBz3FBxP5m81pdG3z7+NPBJPNDkZs8F
	D0ZXJtJpRDskUDwaGqprCtG/Egm0AQoOf3QCbAXm8GWHHk+z8tg05dP5XHOxk3iaOS7EQhtglaI
	PVF1zoBOXRnReRTrjQj8D56sWC3X4DrpC1ROZWO4=
X-Google-Smtp-Source: AGHT+IFW856PFsje+adb2s76FgPUdBl97yj4uiiEZ9rOztAG85/+V2CgHnNshHz2zvEqYifTEoo+Rw==
X-Received: by 2002:a05:6402:1d55:b0:5ed:5cf6:e168 with SMTP id 4fb4d7f45d1cf-5f084177cb9mr2170046a12.9.1743670759408;
        Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:24 +0100
Subject: [PATCH v3 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-32-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015920_796831_12F64FB4 
X-CRM114-Status: GOOD (  10.63  )
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

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4d577b54d798938b7a8ff0c2bdbd0b61f87650f..9f05af52b062d8cab0f8b48b2625432108604c3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.472.ge94155a9ec-goog


