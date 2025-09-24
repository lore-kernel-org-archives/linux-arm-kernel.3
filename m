Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF4CCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSTA3g5ank1TH+h8Aobptwj96daqy8jbcBAobAq2Oqo=; b=bijg4fWHV+TP+PrZlYBIbffmDq
	7FbAyVV2eQlBD+aEiM6uG4Inqw0z0dGWEwXST4sdtpUzhJ2dW3xUKIa09oIPIoeXWEqN3IUrGkZDj
	ZP7SRdNvTr9mtEEdVAVcgcUQ/Q4xdl/D1xma8kQG/9fa7Nw0Wr4JuR373KBUwTahlRRUk74IUlC2X
	esLvQmQMs6l52GampzlEKYNgaIsGjj9IP6XdjJN/9NxPsewLvIoMLEI1Qa9gQnAVBMiqHIINUGLVa
	dpGyxvv5pRo6aXnNUCxnspTnt3Cv31Bo+e3gB+y81nGelsAh8GrxnwtRVjplH9K/TAZwjiZFlvWPC
	+lzqbAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqy-00000000tVm-2gM6;
	Wed, 24 Sep 2025 14:52:20 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqp-00000000tHW-3vmb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:52:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so5210605f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725530; x=1759330330; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSTA3g5ank1TH+h8Aobptwj96daqy8jbcBAobAq2Oqo=;
        b=JjD5/OAf07XYtPf+PbNbsi3L0iCvY5EoE7KBHciGIY2nzC4tp/LhLE9yQ+uSGNGfdn
         YIANyST/yVX6kP1wqWShxjpbjECdkFPT7ivnvVa/abCmmAvTfWENYAgiodg0jP/My1O1
         ieWVf1gYEgNkoUdmdSoq9DLIy397nHEYs3se6R7sxu7DJnZG4Zcysoyi32iXPds/8ZtU
         FjBDTGXxkULwbSJ5hIQp7ouJkxJ7GXaraEqJk2NJ33H2645q9CAXZ7ySzg/hCUc781sC
         vPtXsgSLCCeasim3M9bMn7iqdnJd+OYi4Um+l2/7lvOSYdCu5B0V8gx/zY7828vsVFcS
         9siA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725530; x=1759330330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSTA3g5ank1TH+h8Aobptwj96daqy8jbcBAobAq2Oqo=;
        b=etWUeyQ2ibTNx/0BZfiyAPw4PSRSggtKGIEmDCjKRVh0SRAc3mUk/cl06PdPkHWLVb
         IBLkg4reLWEq1y6S0hc21kkzRbgbc5shfHAQ/NCe0+eHFLUss9i18Hp7DfLXW4S95NDU
         YrWIaJNSPdEnJygVMYs2z3X+xuKZAV7XgnF6AoZwVhqywsxO1JypYV26me4KWeHP66/l
         ZlV1ZkTFJvT8M4wfE/wmOqVZOLkkGv2/9rRUbeAQwTvcz8A5gvtFSjyNJCap+8IeiJAY
         osVkOAUJfaiYOHNNhwkElOr3HqN31prSe4GDsjS1wxbojvcrEyiJkSbWEkJJbxR0IkC6
         oBCw==
X-Forwarded-Encrypted: i=1; AJvYcCU60FbYfb4iaaxFkeV2czssMMgAtQ2stKN0Avrba4FSzwpVBtb2T5AjajQFAKdkL9wChmwh223XlsI/csQW6qM0@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwm0KaRaApmHs4RwHSZ6aKxv1n0or6W3Yt+WvMgwlEsE3G45Z4
	DZWdTvKz1JpxcXWykgZA4X1+XJqZHzdD5Rrl3EgcfShc+2leSKgmz5lWau5+N2aN+wE=
X-Gm-Gg: ASbGncvnxfW/LE3+VAv4kFU3wcHAvCJTb2a5Qqz84jnZDUxla6Pjw5LapiCJ6LcQZar
	WxsT+uKoH22outQabZ4qQ55ErdmXREJ+czrqDWbyB6FmhVmrt5da6VBlxYT1HdRgp8NdVOu7Kpk
	0tB0NAeU6TDObBh0zHlUeG/95ekbGAfMRe0r1/GvaVI78DSnMcvIGINFKuBZMhpe/6PuRAPNG1n
	60M3Rka8XvU0kTvCVARIKHXpmz+vr3UR4ZcyE1M0De787A1htMXMeMNo0qLtcK2xCn64AgZL5re
	h5+zlFG9CtUs1LLJlS41NRmjJ5c/GqDNRVEORnfed402kfsRgVgKRHqpEjuTPOcHllzRg6lQSz7
	8hCzW6uJlqwDYL3R4ytbI6Yac6zhF
X-Google-Smtp-Source: AGHT+IHo7hPpbL4ZM5xq7bjjRM9vk1iuX0jyZL5Qov4depu+7BABKiS+a1RzqJgCrKv8lOkO/9BmkA==
X-Received: by 2002:a05:6000:26ce:b0:3ee:15b4:8470 with SMTP id ffacd0b85a97d-40e4be0c962mr219796f8f.45.1758725530045;
        Wed, 24 Sep 2025 07:52:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:52:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:36 +0200
Subject: [PATCH RFC 8/9] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-8-775e7efeb1a3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vspstOLquen8UYYEalfT4SF6xCukX3qfgdJchdoYapg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWGMBU259VWbLUFQV6SPSQ1mCX0iBW23guMa
 VXKoI+zVNmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhgAKCRARpy6gFHHX
 cvj7EADf10cfXI03PODvy6iln82xUiPu89UJlugKSbbUiWCkjYBUDIBAkVerwrnChTfbjHklBlo
 QUwiI+HkzY/nBc0LJyuNwptKpjTuk0LrX+T08cIKUntvoXc9WetrGMPVFQ321J1SApioK1TqDtN
 eoGSM3XqRfRMsDAVYZlSCbq80fpyJMFlhljP/c8+obGy4YZwce6bthnE3ybROshaTXJcP3gTINk
 95vvtfxAr+pRCqipNgqPcbeX3oLJbZ/MVQZC5mEj+2xSCwkYJKXrkXHB2aae20UeTJZHfYaqSvC
 H2DOs/6NLW6ml/KfZjRvfjfaA+VTqD7cn4iV7/PtDDLkCvcamm/OA+lQ07D61TF1I8M9bUVbn5u
 A21uSs++ScVL6XfDunZtHE75ylZXpRIp6VZ866ltMYEjWd1FKnxDdDeTvZE1/CiZYywppWzayxV
 fHPPn8s+btRwJ/0TUj+czn2GFqIOzixzbELM9gw8Z+ULFwWN4LOOcwj2ZykbMa9VzR1DgAGnpw1
 Aq9Cni1x/fjU2gmiHPy4LNG6375hP+wT8EIGg6URIzJkQ6ljy/t2wMCfVww9AGfhEDzGonwAvxC
 Zo9kN9wOH6p0IRXa5eL/6tmPExvW+oMuBd9LOPTJFzWwtCL40ZujGTgOzuq5S20xvsaPQlcBnrW
 Z6DRjLjjbDf35Uw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_075212_020014_9D11B9CC 
X-CRM114-Status: GOOD (  13.09  )
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

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 636e59abc3772fc0b333873a329b65f4213c3ef3..92a1e3bb8371e178571a6c1ed6f1185fe6c2e757 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1112,8 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	if (!wsa881x)
 		return -ENOMEM;
 
-	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", 0);
 	if (IS_ERR(wsa881x->sd_n))
 		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
 				     "Shutdown Control GPIO not found\n");

-- 
2.48.1


