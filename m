Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA82CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=; b=CMHfor7X7yIutDYsE26xG6ybhS
	/wLmHX2H9cJP/RIqi5j9yA81Ac726S4ATGVgGc60KKbSUHjj1OPxhV3O5jVwH5Y6sLZNidSl10jTN
	mr1nsxykZgfgGWLrvrMLteLPrEsrOZbtufAh35ERqK1p1lqH6jBORBcifXaTQgh+v17I6xkA7R4KC
	qlYe31hDoqOIc7BUygWJNq870bzhNi9d3NKvqIrI/dhTZRLnZJ0I64bj28OXlpFRYNEEucSo7XMfs
	BQzDiFTkySTHcb2tWxRkS7MlAj0DcNuvvYaSR7XTrckWOiqtBmCHxLGxbeglkkkoEjwfleeO7urB5
	WKT4p3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYco-00000002wLI-1TQO;
	Wed, 22 Oct 2025 13:11:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcX-00000002wCB-1d4W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:11:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so23526555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138676; x=1761743476; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=;
        b=hyh3kGdpJnQc5lEhL7RWUNBVTc+xso9DK9/HCzKUianYoXvP0n5/qGPFZbcXT5AKvN
         QOKBFEADpyLBu9SODPPRZ52U3wZGKUMJCOpXOiwbwzor6yDd5LRwLQ1pLIONBU1+Rmyc
         cWQwdY6oFPzTh7DZ0Smvqaz6+hZ4JGEDYISqkq+FLqhjNPUCn4oK40FpGFNX0uE68FE6
         8FuYeB6QXjZxQaZRjIy8znIIQnYmMa1sKdYBPRcgOifXvHaGrR0ZhUQCltfVuvUSc+Sg
         YiOsjh1sUefh1PE8BhdyD+7HWiqjr5YwNTwxMuLOTL6H2B6s0KKiLpz1lzmP0GZEzxQi
         pIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138676; x=1761743476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibo0NSWbl5C+bQQFmoxlAmjW8oHbuGgT0ysyiGqJH04=;
        b=sh6Lr5Go4ZDBYPxI/TgBMMnXwVlW2JaThwdUIYx4H1BthsVSUs094f73tp+MfwfIZd
         EMmSTCgU4jpy/Aj+n9XQ3RZ8VtMiGH/5rC52wJ8Xuy/C58DsF9B/SoJigOrbQoRSAxGO
         Ll5eclOgnXthOlZ+t4tVyJDWdv421oUSzcYPeY9QO4Kkzm9ctxipsXtvilaKNvGcDEMa
         VLW85Ezx65fQvmWK4PicxyyXWtN+LjZFqUvrLY6k7mfrnUCMu60dnEm2qJoOTVHm19MC
         Ryx/5c9zuLJ2cIWweFguzSjXYbrdAqXZeBIlV24qhw3RfAG3VPbsWEEakCMMe/cYwEu+
         MFUA==
X-Forwarded-Encrypted: i=1; AJvYcCWDp+dYIUdgz9oL0tJBbvubf0f/UOo2agwxloW12GeDJJgQncM98IWmZz3EeG1s6yGa3mvOaXq/kNExruoBHQGa@lists.infradead.org
X-Gm-Message-State: AOJu0YyzEF0g7+BgllamN4so6ra80Nh6LIW3/cEtx+DKp8EBfLYmdGRS
	5n5ztlbGJLfzRKlzlaNB5oLjGh1FwD84k3xAIBlKzxoVy3akLGuKUKWBf9TgdC/SNLM=
X-Gm-Gg: ASbGncti3aGrlQYH/do5GwOJvwjcu9oaXqlMLAVCG3B2FLn6F2ghqhOoXL6gXWZZcty
	qygpcHQ6emrP+0slkMH6Lt2pYiY1JCzwiG7Y/3x+ioChO4qh799rWhGTWzS1rerzpNPNcGLIoz4
	CaPUaA/cWUf53McPjKt2OLPza3V9s8Z1jmL3TE7n887GWOHGjEmE2E8Z+dL6w3wYhru+AbkQ3ZY
	2MHcUZbtXhS3bULQegoW3mOCgIwpykBX9pXVFOxoKkFpxgWb/97MRUEk7KdsbKkEvWgAkIV2W8R
	4CqacV5IQFDnynvlvMW/iLH/564Mbnx6d0lB3gBlAZjBp14QkksKjDslqIEAw4YASdqqetLG9QM
	WSkJXTxhd3uVC7O+PFocBoqL5AdWQsXVbYEOD7KN88u3SN2jV5eirh3cB2IBUnJ7H+bP0PqE=
X-Google-Smtp-Source: AGHT+IF0wOtT5w+tdQQmrXZnXXSDYjp97opprFhrYP7Wm2xrNoUtmZ/FuBkt9NLdeFl+hYiIXGovig==
X-Received: by 2002:a05:600c:6085:b0:471:133c:4b9a with SMTP id 5b1f17b1804b1-4711786c79emr179394635e9.6.1761138675738;
        Wed, 22 Oct 2025 06:11:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:46 +0200
Subject: [PATCH v2 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-7-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfekSMiWGzrKtKuLqKr9X/aFL7erEPkinVg0
 Ya0yCZDb8qJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3gAKCRARpy6gFHHX
 cgEvD/sF0UNAC5n2ObDj20Wt2u2qe866svdBJRyT7vFi324TFqRE3bSjbOk9y/3g6LFT/ehBXIn
 g5lxm2qJ147ZK9Sm3UfKI3Kvwqq1sBLnhdGtoihARXjAn+De38GcqhOl24nvHJlvM9tGkHnnxNN
 YGp6a8Meo66SYHnbicVDA6n3CuHl85/Jpr9pIgpE1xll9bGifkT1okSqdNiE99fbZMpvt6LRnxK
 xuKuyzK3N5G9ZKUB/l1WzvlsTJNqCtn98hSufn9wJ1C/kQjZGVjh05hyf/Ww5pY5Ko8ntxmwMVu
 XT0raHo2LULYRMGPBYbXxASf1rtF31mIDi3XbCa4Aqq1sfdZmyhuiu7ikz/4peZ4Ls3MctkBan1
 PoFpHPK+X63q/Hui+iiIi7tiOrrLqQZmxyLyjCvlo04Z9IEUpp/ud5HmrpJEuc644DxLiknre+L
 C8/oJIZXPrMTpOvenMbanP06CADPW96Q4Xm6+eeL9j8/RvPVpkgwOi3LFJLfVUl5rswQjX2ODUV
 A+VhtQakOsX5i8Y/AU89XVDQExM28exRzPlc7qjo3j7O5s4cy3ZbzdlWBi68i1D5qmEJqXnC2WH
 bcq/Tv7Ul5b4jALao342Nt1r5rbCVZWQMqMTT8gaLmNjlS2rVvnKrWUfri+/WeiJhW1/rTAvX3V
 liFuFefP2GjBr9Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_061121_159326_AF4ABF49 
X-CRM114-Status: GOOD (  11.71  )
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


