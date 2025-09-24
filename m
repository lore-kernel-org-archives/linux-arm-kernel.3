Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6D5CAC5B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=; b=cFexGapn0J6Q3EohW+v4lhwjTZ
	Y0uinXLhYBXXVul9y6nLlfrNQhfCTPNynQeoQzWhKRUdsm/yVSaBAphcOytd6y/8WFHUTAf+WULU+
	ND2xaocnYZ6QdnTemMLpTRUZgLD3EnwPiYLHqw74wcBHGQh4sY9cFxA94zZ7EMUDr3UZOP9HAmWIZ
	c5P/UM0CyKqzsZJ7YNpExadB6PxndpjEFLAHoEWBVWNbborqrIzdnroiTDM1/3bWlrNGCKugvuYsX
	1ulB77v5ltjCAA7GG+r62x7gwgbsV0o916OyQHFK+Fpmb0Tx/LlAAEsShX8nqLj1Fjc/Erc5OJKPy
	K2s85F2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqy-00000000tUR-0GQ5;
	Wed, 24 Sep 2025 14:52:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqn-00000000tFW-3z8X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:52:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46cb53c5900so42286735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725528; x=1759330328; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=;
        b=OYmvyVzo4VWm53gmhbWzX0HO0+sB3YR26UF0RuTO7tzalu4ntG3/fya9pGo8qrdA9V
         2/Ea8UPWaxdm9D7mb4D8jlvWMqbi2JNKJs/1HFcmqNRzBXupbkspth4Li7pHXSL1V6iY
         HFXYT64YFLujndXr7zmB/EANY1RHb876hyev4vU1SFUNSGIJ0HbymrzpMrh0PMZd3ND2
         8UmxQs5KCFm+Y6BSjP7mKtSwNstdccFoYUN4yFAnlF0t5u8mZtUY8ACKGWp/ZkGzrnaj
         1VI7zXGc34Q1HOzMn8fQATI4HVHuusGDNQYa8Qd4FaB+Ua6i+zVnTX1vhzn2lBZxTKhS
         /jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725528; x=1759330328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=;
        b=UKikHXXGUcw7LLQkdsQIqoMOD+QYAPgX+llJUdpwNB39D1YoLxRsjEiCztYr5fiX3L
         EgsxgTJAuYqGL69qLdVA4m6l9JUwF7w1QLikl8uVbLISukqMJaQkravCYkdSuG9dXshX
         JAG1h/sT7RU1iEqyEZg7YtsDoo9FSdNKlx+oIfozCz8usqreEmLxpkluiaK8xBx8iGQH
         IzELhUE+OwG1Mdqlyl6RFN/JxBMXPawQnZR7MgsETYgbYJnioNwtxrV7bfo1DhUAMbw3
         jWVxLdsfm8NHLcwI6+iBW9F93ZoC7/1QIRLGXs2QDe42BZmO1JrrOdQZ5sRQnyIvVQ2z
         jwWw==
X-Forwarded-Encrypted: i=1; AJvYcCWeCkvGxsyd7AJaWaV24DEY/gz27uGQokSIHdJAzygtZx+cyzifhpBGH5gM8wwwGLBVE67QY3+d1NlJzM5iRvR5@lists.infradead.org
X-Gm-Message-State: AOJu0YxNm6ISKZx8bfstG3SVrMlUn2tfGf9EpDO2WTzkf9a4qxRCC0kr
	rHwyL8upgQgJz5ONQeU/ZHbNYYzUEJ8DXzB2QEzIBWOOblljs71LXkxUeCatZTcLxVg=
X-Gm-Gg: ASbGncuFhaG0qiRoZPMf+HSMKrQiF2sik287XrmJl1uuwPj7sRaLyRPHTk9xonrenfF
	0Y3kc+jygwZvoVAcMrpeHIDEiupNNO2Wq2wuaN7jwlLimXEhL1148vuenMke+Uxm+fJ904Xa6g8
	YAT2PLKc3dgUX2hdaHUXr5bJQVFEKaepP9Cnl5KCO6Ooza5uAlK9/32cTSYOFQrvhCTlbZPRT8C
	pHrepHSal8s3utk4qcUR60lz8o/UzU08Q+oxEmJ+dsk/eYNFGEgBdHqY4puOMKXlCPUROcNCCSx
	czCeQ4lxV1pACCjEoJlb5MU/9CvVZRyeJ71qVEf4VN5K8MU8MlU4gIKn1Kfv8C/6Gw9Tr0nIlXa
	BRLGflF+Br/a9Hgvmsg==
X-Google-Smtp-Source: AGHT+IH2UM0b2DoB2jVzXodkJqn7cNt+S1+id56qPKU1HujmDmjEKCztQlK5G0qjmChMEW9QPceS2w==
X-Received: by 2002:a05:600c:4b19:b0:46d:b665:1d95 with SMTP id 5b1f17b1804b1-46e32a23f8dmr637135e9.32.1758725527921;
        Wed, 24 Sep 2025 07:52:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:52:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:35 +0200
Subject: [PATCH RFC 7/9] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-7-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
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
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=735;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LQ6GmHpD/iWFySPYiWNs4nA4WFevXV0FDAv5KxrY5e0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWGfry/qkeWFwp5USy/SVwuycKAk3dAKJzbt
 0gOWPScWyyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhgAKCRARpy6gFHHX
 cqo4D/0R7BakY98Bieuwd9AXA5Zz3ZPzUXUHxuC407kcVrlX4alt2GtuQcMPCAS4/e6+vlNQRNO
 gDZhb71YkyFGZxgwFPPt1MxOMN/buFbmL3CTvTWwOOPx8TaKDO/whWvLq8R+u16ltl2k4g2zBzP
 gfrA9rXzjl/jkf4hjCnRDeXFDTKKg7X4eKOOX/UTX8mTSKBwbCRXQMza5ygAvvl0YGoFM2ZgE4l
 J/cWLJSWqJU/9P12SYQPt+bsmOhXSvp5FYJ6QBv8+6fdDWD54kBEktJRBdShjrK1pVoiiCRd01F
 2S2IRfykO5jZiju4Bvo37TSestnnupumzoC3I+FzdsoSC9qpOprXBct1IPk7kJk+ndtID3zOioY
 sFR2bORVE+q0qo4jHu9ETc1ffR0uGNl0hFjEoClR2HwlLr3YIaLbHR5FtLXB3erXC5GyPr7JfTN
 dusEehQcGYYM4r37bWusqOhdg+aqvCdwn+i9UXVYwnXKR2mE1+VeRB74CDxm7MqqU5VO8AJxMoQ
 jFIen2jZnt4Ch30oPMyaSA/TcR659d9+U9+0c6GzqkiGwufduZoayKA9Odsny/iIfr/bzGYLrJb
 l0hjNAXa8pv4FcvrvTkFXt9nGiemMn/I6g9khHxqM7bvzGsmU+v3ojYDcKsNw21/T0dEgFXkSUF
 OM8RQivtzHHfEkw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_075210_029085_DE59F8B9 
X-CRM114-Status: GOOD (  11.61  )
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
2.48.1


