Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E51C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 17:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=; b=f1Yhru1TziBxb6Khte+s3n20Cc
	YEMK9KFybAt2H7DhqT7cjQW4Al88GOuREmsIGyoLdq419MJSr6JCc0ij48m1zQzegjREYkkV2dtok
	kywBrup+/WrrR88oOIVhl6LC46RiFcAimqxbhY6/m5Tleky0fPYv4F5Wjq1mhAba68eOQiTq0yFlj
	PEPBBv6q6cDEsBmauPn16zJ+E+tNjAQ9LA0CFarHuc4bWczACGxUbqbjb8T9Exw6AdkIjUPmG/XWs
	uB0QnYuFMCO0Ve/PLUgXAqRpGnI2/OvH4++Bkqc+pdl7n5PFhUntUsYfdqljZ7LZYb2OtlSSyLDBG
	TjEX01Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulsq3-0000000BZNS-2SwI;
	Tue, 12 Aug 2025 17:31:07 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulns5-0000000Aey3-3aag
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:12:55 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b78294a233so4585493f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755000772; x=1755605572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=gCWKTGfWmIf0oTMA+hsJufsGcmhQn/99SH0BBsVz5jcLZyfO0fsfeXFa6ORQP1WDxW
         x+qkfl1jIuIL7SdlS26QQGqxQQjJQTLUizjK7+dAiZkdgXzzkKTZYgFyL/KjqbX//Ugo
         9+Or9UIhe5rURXTgSo4VhMwapxsPSpsRRpMAd/RnFhSE83fNZ+M9g3oyOtVFZeCws5sV
         QkQu3xVjl9XSvaDkJoMPkSkX76rms7g/Lclr8IhB7m+QvqWO6rOsaxLlj+m6zYzgx8U7
         AY5ja40A8IfMXnztv24v7QXq+lpo1Ev0GxccPmrLRz08UHNAxSQey6R3AmeLjdwq/m3m
         B0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000772; x=1755605572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpowzIaT1cDZkW3EQqK0abqv+liy/Ny1FTTw1g5xEZ4=;
        b=EvMoTLkkkDXCZQlCC9ozYFvMbMUsczwuATgrB/kQTJjEkPzAVinhie0bjUgXfsF2nF
         XadTiFlT79pV2y/hetjD2nxL1kDXb9TJNgczohEOobXM51vLrxN8JXu6QVFb2B5XU5Y0
         Z6qgfUc7zhboGKePxI5PrqjtXDh7gcHnaq9Yd1G6GXmzXctsCD69xKfOhRXSdXE+4qp7
         g+wMgkwZPnd3Uv74whxsgBc+bnNsGnDQQ3dCA96XnysZibWFQnguBIFdrRi2gej0RSPI
         MtrZI21M8A9Tvfy7DdEIxkLjHMoJa3wORvrAgfrBTWHkwehQ/Lw+qQXzLb5UK/ZGHami
         7Vog==
X-Forwarded-Encrypted: i=1; AJvYcCXtgpVC0s9HrHSx3DRLR3OKgf6UXrZPGwBuplJyG7zpyth5iZ0hQxs2tUWFY74LWk3AYHvXI4PrD8iNZF2xb7im@lists.infradead.org
X-Gm-Message-State: AOJu0YwOgAnSPd/P1vGPxRHGvgh8zEDyLlQK3+pIqCGQsJHbVKwF87vd
	UCc77c8SFKgEW4WPiXZwxxP1fdVMFbenWP9v4nz1q4rFHu/765+afZH3FvGcIWOvVnQ=
X-Gm-Gg: ASbGncs+sClLE1RDHgubtifqGlKD/KVaEIf9yU9l6sqliKG+0DfHpwfjN1Iabk/SgCG
	mJbPaHyexP1GoS8YjVdKBpIky0b2Hblo9DvDQBNu4JEFnELqI84cUVpahnkMnJd2c+X8U19wkOO
	wj1UpDnQR7+6cq9q57cQYKXWZ6X+C0hQem/Wtv5Z7IrqGVQC6BVpF20uVO6EnndI3hrkmQzQxdY
	TTIoY+rz1SvEaHt4kjB6ns5GCSXXLLZ4mMEAGZMIBvdxkuTimy4Ov+c0z64nkNvGqipLGAugqvt
	/hfjLgdesOx/f5EB+d/Qj4Ezgp+WejrNCXCRD2p1R7S4Y0S/Otr2ZAo67D6Y+5D/FZ+2srN8EBP
	p8+uy/2TcM3uTBDY=
X-Google-Smtp-Source: AGHT+IGenwtiWKA5m6N8X/17L8Igizzs58tEqhGQ2i43V54n+juzpwGprI0kz/fD8dVQkyyLD0TJFg==
X-Received: by 2002:a05:6000:24c3:b0:3a4:bfda:1e9 with SMTP id ffacd0b85a97d-3b91100cd3cmr2802046f8f.46.1755000772287;
        Tue, 12 Aug 2025 05:12:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm298878535e9.6.2025.08.12.05.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:12:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 14:12:43 +0200
Subject: [PATCH RESEND 01/14] gpio: generic: provide to_gpio_generic_chip()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-1-aac41d656979@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-aac41d656979@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=q7IZHV9NOU3n+seY+p1AeQbkCwKHTjI/3z6Qnen62yA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomy+/aTeDVPsPxVXdZxmvSFa4YrDThEqevhSwe
 PgxEtRX6SmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsvvwAKCRARpy6gFHHX
 cpyZEACY+tGiTQH3CofyMRCLnRX+JHMRcdsWX3t08rZbJGpX+q5SIOH1+vjwwHSzbbRFgNtb6Az
 yS+Q88S1hUF+Zn42rihC14JaL1n8HPjULnJU9+EmpHxNSdphHWoCyaSDY4lDSZrSgwHxeGLwwCa
 zQ0itokAPCVZnoSTc90/PSQ3wz4OQ4yaC15rrBwVJv+0/uNrSedOx7le8Ch+Yerr/7u5hAfqDw2
 Wh54zE77WdXhVGDPBTOy1tkw0XZ6RxtMrZXc+wPBByD9mPQuTTL/P3DWmU60UyjMf8wKxi8SAxf
 5D4z5myqGCbw/ADv0LvErruoYZD4C8f3qcPRCCA5zCxF5lPfTyNfju8gLEybrLstkErCkmGDIqt
 OU/eZQAaqAR1oGPF1UUkbyopU3fFMvWH9i3xqovxOMrYyhemN/uk2hy/Jxc6W9bqAzNQ6deuXBB
 YUIgDP68wx6qnXpSji2UBHXsbKGMH1cILjqHO52qsG2MenCZR8P3lnDRoiaLxAZnWQg53oWicqb
 ZlyhFECViH2I5yNjFkAa0C15bwra8/mZaOAyQi5JkduX5MzK3I8E8YKdgXGXSmXVtujLjmpgJrj
 Tbqt9+l3+QY7igcmOQXGyFKExVahGcfO78xW0TuCLsdk1OVQEsylXtch3WyKNnZfBcOegTHVRJo
 GraLgXcIK7/LeTQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051253_888489_40B59883 
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a helper allowing to convert a struct gpio_chip address to the
struct gpio_generic_chip that wraps it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/gpio/generic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/gpio/generic.h b/include/linux/gpio/generic.h
index f3a8db4598bb59f1dba4fbebace24dc10be44ae4..5a85ecbef8d234d9cf0c2f1db7a97f5f3781b2e4 100644
--- a/include/linux/gpio/generic.h
+++ b/include/linux/gpio/generic.h
@@ -55,6 +55,12 @@ struct gpio_generic_chip {
 	struct gpio_chip gc;
 };
 
+static inline struct gpio_generic_chip *
+to_gpio_generic_chip(struct gpio_chip *gc)
+{
+	return container_of(gc, struct gpio_generic_chip, gc);
+}
+
 /**
  * gpio_generic_chip_init() - Initialize a generic GPIO chip.
  * @chip: Generic GPIO chip to set up.

-- 
2.48.1


