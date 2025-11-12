Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A03CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79Q7HabNP3kse4nLU/vAYoWcwWnuSm1uGzBIAnSPTng=; b=wg6dnbhhyYMJ/I5ehh43nbTeOx
	ReBGlNozzNxXRppDVwEQMsWpDCaqem/k94rrgHVzat4T7kavoWrUJNMIjT2xkOBPLa1WuCc+GYVn9
	zc3Q3FD72X1kzg38MSEL451P4rYllh7v1OCtWAwpRO8PjthOs0hDjB84HSm5L93/TBuWMQsU6aGUn
	sXqkXF0T1ftysRXjCGLXVipeSPbu0ZITYBRdri5Qr2M4GtiFclFbaQyP2LBST0wYPdaPa6FSvskqx
	OrueZrW1bRADZ3E/2FqDRWji9Jhavmga9eYG4mh3/5QLh3XgA+wqph0PJjcxuGfuO6UXDNDsLWHk/
	kPJqtaKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKH-00000008sZI-1Cz8;
	Wed, 12 Nov 2025 13:55:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKC-00000008sUs-3uMc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:55:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47721743fd0so4933375e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955751; x=1763560551; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79Q7HabNP3kse4nLU/vAYoWcwWnuSm1uGzBIAnSPTng=;
        b=RLMyvSKwEzibdKm+pG3E7Omo8nHfEIoqYTEjEOj7Dnm6bx62pDF/SLK5YITMIdmj+J
         OQktD3XCwlHXWH0eDoRgft4QIrJir5ugmRjjcPW3jPqnoP0f7dSfyeNXs/h3QsSeufhp
         8rYwz2BnZ7j2GGctu6B+HjFiOyRwVq/NR9LdcUhyZRFpbJTxF9P1JD+27aEwmADRbCL0
         OX011vT1t1TtQaojXfQ1amQKryZvi92NU0GeVCs8h1BpYhcA+UWQRFxat61A9Y1BbScc
         JSkBTfAYDi5CGOTV6aahxdOiHsjqtGQxySXelHrMZFZdV05+EpFmtTkZdBL8t6mzF07I
         HOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955751; x=1763560551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=79Q7HabNP3kse4nLU/vAYoWcwWnuSm1uGzBIAnSPTng=;
        b=h3uzzvKwdp15iXLgOqrHUau2tjBplqc42CjS8nne6BT7TomYtyoqyj+XiNt7Z6e57J
         WZ+6/b9UoA6C+JtaZMn4BQ3hbMtgp2zN/WT+g/GenZJXROlK8+6zeeA5DWnvlX16kSwG
         AZdOk3HZY2J1onpJpCGTuvtw3JEnEY4nFybaY5FKAIR7WcKxfKJWod4JgrvAcRbRjwVg
         9aMBd+I0tou3htI0ZMNkmp+4JmYOrauuWs3mRHOIDlYcw5MXUQ90vX0AN2EREzLWuxO0
         zhxXyk93H55GMRFemN+/Tv9tz8BPyoZ6WZecbE0iq3sIaP3FFV0Rvn4bzS9NW7+K+iQM
         dsHA==
X-Forwarded-Encrypted: i=1; AJvYcCUugotEoCEoP8I9mJaSF7tYgyJdlOUXMHKH+Fha9p4R24TkY6cdLeN/E0Nhev16akS/pUSrEzadlLqsuJssuko8@lists.infradead.org
X-Gm-Message-State: AOJu0YwpcA1NjsAhvLU4SQskUcuzPbLQNGtmuV1lgYPAITH3KjSz2f2c
	cm81uVFz8nDcXay2/B2eDA2rqaxvJH33wumAvjqswevUafvbnSX+/MwO8ezuAfHsVoA=
X-Gm-Gg: ASbGncsufDMXekdW024bGaXwUxX2UYn2sWpyXY+d4JryiFze2c1y9ZgdrYk9+jM0QII
	8wRVPaAFYVNEA2ErKl00SU5sLFdGianTIlnAjwbXnmz1TsEkfshuRLG7n7DolipG7tC7d/QV4dx
	XDa3JimkNyM7iO+lpChMm0dk5OXyKaAy/0LEZN1mwl8EiUUOU4zMCWxt+zPNWYYnSZgPaGS8m6I
	PRQfH/PLQozUIDaxWa6vytDd3xkHBL521GHPk1l+szyLGww7eYIllkPp914b24djkt8JvDaTZmo
	S7MmC2PoiU/QY0S1yGhYvNXAWC296Ajp84S/O+S0ADYfNtHR031m89FHIrrZINC+HtL91SenzwS
	Ys4qiWYPIichpcBeR5x3fJct4Em2/0uPsjUK6qmXl2SZ7fHnnudKTD6qjXMwVbhBQWsw=
X-Google-Smtp-Source: AGHT+IH/gUeUf4a+LjvPsAKw42U6Jw2pmBzvctQUKX6vryQGuNHC73dD3y2nVLgM1qQW+g7uw5YxOg==
X-Received: by 2002:a05:600c:1c02:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47787085b43mr32791955e9.15.1762955751026;
        Wed, 12 Nov 2025 05:55:51 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:50 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:36 +0100
Subject: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org>
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=787;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=90mV0HhkOk2X6mMXJGqXC5YmpVRGBZfIYfoK677b6nQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHWKXa26OvbXIS4uHVQend8AfFjaKwOvW6+K
 RoSgKje/vqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1gAKCRAFnS7L/zaE
 w8FED/9S0v4o+f9rGc1s0XjtxWxXWXuNhwckzJpl54CVdCRP15Zt9niJgx99JnLVX1N+zdXNb2r
 bcQUImzoeX4vFqcEQmDElGa0VPK/jtIt692Iif0FFmMDx9gCqIQP6mQBUYAg5A2KRlHdJrCEBg/
 jbA0PjfGTb44eHjdclModiPVQszACjKZ/ZXeLEt9tkRtbxMDw7ejcyi8cEb582U+DxuKTIOVfox
 J9A541EE3wpE2mKBEvafm6T9EGQPzPKPAnO3h38+47EokVn/GMgcDB954UlKsfB4e9P/8g/c/KP
 Hd61CiZku177YQDBAUPoTJyxh4k6YnSgrlbHP+m3Rd6vvx8q/T1jkX19j3tC75jJVcJyeU3sZGa
 1J7xaTyvI50YiNZIcuzhIekT7k6h73SXyGHlr2nFXvrxHVMmfxIumWEsIAZjZfjB6tSpT5MB5ZN
 FeeVzl2+rKUM7sxp+Ar+gUGoeIzWaehG4UlbAhpCjNzHpjqeXXoHiZba+jpr4u8X/Qo7DmVUwhw
 Ja+LNPcgi2ikEL8fqramAAzy9xN87Ug6cX/EkhTCeJqmMMBaF01/U/Ig2piBAxtlXiEtmIRImIA
 qcOBn+9X6Iz611rrgSjwYrRQGCAOnAnvY0KNXrKWlSBudjWzAl4SlV+EzfCuQEvo9vxDTetF8Lq
 RSondTaSYnSH9qA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_055552_993361_7DF18C47 
X-CRM114-Status: GOOD (  11.45  )
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

Some qualcomm platforms use shared GPIOs. Enable support for them by
selecting the Kconfig switch provided by GPIOLIB.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8cb3fd0f29e277af94f20 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -316,6 +316,7 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTRL if PCI
+	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 

-- 
2.51.0


