Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAFA1D6ACFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 18:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jcpw02mhb64jdwB+dNNvFHOzRMCWmmfGsK3Mw00EgFs=; b=3/mg5xLx1LgC7Ga8V4WB9dqc9s
	CTvHU377bxYH+qc5otGD/l0Vf5AJrMFvyrEnhkHa4NekI4JbUEw4olGjdmzsK+CyFgzMeOhksP8/E
	i10qL5c68cfDiC+XBd0zF19E2QlxkgGpGb4iilpWdr5YiPQc1lrDKu6X/Xzr84PCNbyMFNXUUi/5v
	HJ8cy5d4Ecs9G2pwye2DHPHcIZw/d/WUgdgSuaRoqdoMXNefciXoPPeVS2BDBRHlxy8HiRiaQXCEz
	zsZEMECLmnmbGao/6j3bReyQLy7Gp9RmULiJve16HRk5KHbEQTH7qcQV8+YawBk0z6+n+xcqLrVr5
	Xl9fBSTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGN62-0000000Drkw-25pq;
	Wed, 27 Nov 2024 18:49:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGN50-0000000Drdv-2MMA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 18:48:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-434a1639637so28027945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 10:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732733280; x=1733338080; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jcpw02mhb64jdwB+dNNvFHOzRMCWmmfGsK3Mw00EgFs=;
        b=Ig2tuhVUACbC4igURDGObdJJZU4REr6AvJhMRN7uzsS0ArD8gOCaY3/XaUK10CZvrJ
         Z4aQhHrrgZSO7cZFdscdVMG3X4mSLnV8ekODq9PI88FTcpvIAu558FKXvATc5kmh6V+3
         3EdsAdFHgXZZcz8Nq1Z+RrTVFuwvYeyeR9+8HlMwkfQBzrNyzQhbLZhd9BAGmmwDx6DY
         VZ+jTrbF+k2ew9GMWq4UO60u+dk+dMs/0nY3hwkS3i2RZlLlq013iQ5ChdR/V/gpamuJ
         dmfVwUGW4QepNBGFpFRDP/MQ4Bo0td1spHz2H18eglX4+FrdlpA37Z4RQcHQs5Ri259M
         I3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733280; x=1733338080;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jcpw02mhb64jdwB+dNNvFHOzRMCWmmfGsK3Mw00EgFs=;
        b=NzzIZW1+/zE3ep4ki4EBM6Jz3fKRE+v+QPftsMFyTE40sKIRmFnnQ5/9hA5aDNuSa7
         m7Jo3WZlmJ9s3M4WwR09USPxlGhnqpwaBYGiESJLTIYOGDZtIT22zAjfiL/I3zV1LjIn
         iDiT7FcGMM0AY1F3ZTXSQ08vCpfAFUme1lwp8pfPkppMa+QrwypB18sajUnA0zMVKDVg
         AypEYTzIvjUP3iOWLCX6qUCkDoyWtqUYnPK1EMpqE+iziyf/nCYCFCXFejlp4IhaP/du
         D5AXUouHzelgjNVpYOZ1DekQEYPIuV4fvaK2CqL7TDHFNMEBss863VLrB9lUYe3fw+FT
         3BIg==
X-Forwarded-Encrypted: i=1; AJvYcCW2q7HJFrpPTmtdLQGJQQj2dePNkMOo/5uM3zObcURTZdS1HH6CusisVb3b9eNB//i3IU0CWhhEYnc4nw88+yr2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2KDrGEqvF/bzeE+JD8XMPl43JLrkAQ1NOQsJVSUvotc15G2av
	lpq4fatZ9kE1ytZrU06hRvJCKJ08739DfTVH5IPB1vyoJDofJyLrbFZFCLvo7VQ=
X-Gm-Gg: ASbGncvUrRi3e/C7Jlly77gIlQhrp2HTWfkCUVhfObBSKoo3jLSoCUexfhuZz0vOqme
	NKUXSRF4WesXcwaG+XCHzW6tt2w2vmGBKgeL8XA5yY2lYM04QVYLgj6M0mJRtuNT5ELK07uAqPq
	c/KkFFtnyfXcQIX6QC9UuDD1f5XJn9+rRHGoq135/G8c1UZCOMvUqP8ramWq/R7OmZJHTqmF9pm
	DyY4iVgIzJxJQNvk1anZ/+FpbW6ex/sIMmchecLxI0MtZdoVYMTUlvmvtUY9G3U
X-Google-Smtp-Source: AGHT+IGr99n2pgmmmlqNTfnISk2hQpeyV5JpHyTyMj3WvVC6iQOTmJfEucqeLNOUYv2B6leOlv1B8A==
X-Received: by 2002:a05:600c:3b88:b0:434:a765:7f9c with SMTP id 5b1f17b1804b1-434a9db839emr37961625e9.6.1732733280392;
        Wed, 27 Nov 2024 10:48:00 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:e571:5afe:4e1b:8936])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-434aa7cd343sm28854325e9.22.2024.11.27.10.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:47:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 27 Nov 2024 19:47:46 +0100
Subject: [PATCH] clk: amlogic: axg-audio: select RESET_MESON_AUX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-clk-audio-fix-rst-missing-v1-1-9f9d0ab98fce@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAFFpR2cC/x2MWw5AMBAAryL7bZO2xOsq4gNdbFDSRSTi7hqfk
 8zMA0KeSaCKHvB0sfDmAug4gn5q3UjINjAYZVKtTY79MmN7Wt5w4Bu9HLiyCLsRVVeozBS2TNI
 OQr97Csr/rpv3/QB9Wvy8awAAAA==
X-Change-ID: 20241127-clk-audio-fix-rst-missing-0b80628d934b
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1632; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=NRkynitJcItte924uDQklomHInx09SX2d6xRgfzqXGA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnR2ldNqnF+hCENTkKMXcIyoeqe6vo64sANMP3G
 v8+TpjiOVeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ0dpXQAKCRDm/A8cN/La
 hSHeD/wMqPZGojSkTOSnh93vp6D1DDTdHNlEehKY7SxVGlFjp1RIE64G28ltFd5voZCdRTuaaRG
 E7Log9CTOmBf0nReg2WINO1FfRKR0AC929HkeUFdKngXVIBSieROtVjvz2cRJJ5AAVFs67a3g22
 cFaPyFy1rdmlP+rqcA2RyfjXtFohm2WsSKtUrColYXMr1FLcCwvjWrX/KFUQTeol+pAwtk0YjMr
 MGn6ucKC8BmGeLn/AIsUjy9JJJSAt8EcB8X0q0+6lgIpOIjm0R8Lcc9RnFdBbHVb/Sx87xHWoNV
 chtT31Nt7LScLqDuUJOOyZCUPhFQ1WuF/SzPK/l9AjXBW9S0s2tPEsG7AMV5Jl6rlEdKRTuhT+S
 MYRfsbw7uLbydPEDIY9g+NjUBdnpPOYqFqrcwb/pJKqAq4vu7bKaYrvZoeew/YFho1WMB9gZMCu
 DObmWT5CLGisIXCmqTfsI7oJM3n8RwRHjxXrkYGl3M/IMiItcT3pi4o7jEzko+wlO1MqplRrrPS
 NN64QqczvMiS90HpiHmFxyTEJshpkD3x2l0HXE5dmwkcRN/A8xczzcuTU54dL66wNZFXhwcJ5hI
 GkGP98Y/CD4Mb/BTFu/UZrpZ12QdJTqzWMaXWCjtE1BYTnHwGK/SarH7xJJht27F/rdqDsSY/Sg
 i5TH5EzTDzIOlWA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_104802_860153_EE67392A 
X-CRM114-Status: GOOD (  15.54  )
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

Depending on RESET_MESON_AUX result in axg-audio support being turned
off by default for the users of arm64 defconfig, which is kind of a
regression for them.

RESET_MESON_AUX is not in directly the defconfig, so depending on it turn
COMMON_CLK_AXG_AUDIO off. The clock provided by this module are
necessary for every axg audio devices. Those are now deferring.

Select RESET_MESON_AUX rather than just depending on it.
With this, the audio subsystem of the affected platform should probe
correctly again

Cc: Mark Brown <broonie@kernel.org>
Fixes: 681ed497d676 ("clk: amlogic: axg-audio: fix Kconfig dependency on RESET_MESON_AUX")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Hello Stephen,
This fixes a problem introduced in this merge window.
Could you please take it directly ?

Thanks
---
 drivers/clk/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index febb5d7348ff07c2da0cb5fd41d2ad2607e5bd5d..ea16bfde0df2d7bfebb041161f6b96bbb35003ed 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
-	depends on RESET_MESON_AUX
+	select RESET_MESON_AUX
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.

---
base-commit: 6f3d2b5299b0a8bcb8a9405a8d3fceb24f79c4f0
change-id: 20241127-clk-audio-fix-rst-missing-0b80628d934b

Best regards,
-- 
Jerome


