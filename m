Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC036CD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqbaIc3KaZCmVuB7kqLuKLKtHplI0gVqS2YvAhrL6C0=; b=xkqbX3pk17He4dkTRCo560psAu
	Ki10b52Qqh06TXqfzjQQsmRlcRtDcGxGOHTHBJ3H9briodpcYyDbFXoHQaUmbO7vFPFnRA+Xto8pD
	B0zGdGZSH8Fnmrg3UkRJ3FeV1deRsLJWjL+XdBvOjgTuU+7S51JQZOsqwtOvWI/r0mU16pYGRdaij
	Doml3qvwUOkL2kdYaB9onEmXR1S9NWkFYbSSmjGpigcxSXIkPXgOsaYOc8FjrTZx3nS2goZiYgwLV
	Zy5992MxBf3ZRcGTG3Vit75UC2SBt8rPzKhDYO84e7aurOVUapQULBroNwhXJGEoitCsMNqKHOkTF
	mAoOD9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKL-00000008sdq-2ku6;
	Wed, 12 Nov 2025 13:56:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBKE-00000008sVx-14io
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:55:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-477770019e4so9779565e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955753; x=1763560553; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqbaIc3KaZCmVuB7kqLuKLKtHplI0gVqS2YvAhrL6C0=;
        b=QtzJHpfjD0w+zn5A9MQEFS0aNxhaLlS8bmgEwR6LbTtCKrjVOiL1W4759vRst12nwK
         +kRwXR8+NQkFmZ5j8O4sBaYuAAicS3KO0uR6pSAd40tSCLyBdGYqcHRR+YEGn7SL0c7L
         jXZlnEe17jqIyT8wzASRZfx3qS3BqD38et3NSXcZTsORJf/j6OB3W+aX2x08Z5GqAwUi
         1yRqdjX6pAouP10xQZ5qgI90f55bWgyF6DYmcPGbd+Bg9msvKUMvlAvafI27wjUkmepj
         DoZ0tER93Cs6IbjtkokPMJYXgBTUxtGFAqVZXU1KvmAml+OlTfqLZoNcnFauWyXf3zQf
         F69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955753; x=1763560553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AqbaIc3KaZCmVuB7kqLuKLKtHplI0gVqS2YvAhrL6C0=;
        b=qtCdwIKD54rKvM/FZ5WVaOCk4GaiB580PFNnl3f1G8qbqzuGwecXAU8m7/awGtlJRy
         Lth22iyM14FgKKmTpXfp77vn0MY96xqYNlCJAvZzDqbUZ4z+Xa/9Hjt7p5B1gbQbkvAV
         pkZVbSFZdgn3jRgQaCX+j5tAe3/8Xsp1/SNRyLAwYZ6E7aRNt/FGFO1ofF3gAQqoCPxU
         pb3fHM+YhVrlNVquGtrugw3dpqxY58zloCE3kpDoFQZk4c+ekeBtWoXuy6Uwni6aGBAu
         wvJdkRJtAIM8NqOf9HHt+0fRb5+du5obsNSSkMw9y1aIfQaOSX8cFJdCrOBSzdW/q5xV
         rLlA==
X-Forwarded-Encrypted: i=1; AJvYcCX3DgFCTPwvTfV0aT1ZZv7Gc3vXQyGQEnzbGU6n4V7yg9d9/BKq7S5SqDkl0sAX0B6/EvFpvBhkGrVQxV1eTuLX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8h2UYQfcYNAIMxUVT6coAcGWX7Xx2Hih8M40CND3aQt4ZMeB+
	rxt7HZO4e+v95XFgN9Onu0ZMekvgabqwKpo2H5Z/XxL7vsJCs004sSAeYv+hswARgws=
X-Gm-Gg: ASbGncuYE9CpnLo6WTEQlC4xF5rxb6E2mTV9xwaFXEQmEWRKQv3F4eCNYi3O8elTKxM
	UNqtwLW5/H7qAdDrapzMTqIp4hUsSMYx49gismGD65STSycd/agtyurqsjNZbLaWMiS2O9niy0r
	YljSVRFHfHcpK5BejL3h/yz3V8LaaSm9KPINMOfqYCf1nVThV8zqMpARZXIHmNFWZEPsV0FE+rE
	Uo+f/M6yOpfmcO2EMsKyv0WWEvv4SLukvtij8/UU72188zFFN6YxgkPfOWuhpgI07tCxxJMCyMM
	AuJadFniJhBi+zcKJ1IV1Z1RZiH3wgVpzHnqbTepqhaVuYwIgE9RVWJau3xoF6ixlMNZfafFORs
	llcPksyGA812UMsyNpHden/QLan53Jh49gOR3eDMC0YV3CnMLPRL7FF89gT2+snMQcdw=
X-Google-Smtp-Source: AGHT+IHJt2UAXPW2MhXPVBBMI+uiCZQQH4pvDWU/Qe5FJx2daMpbRe2y7K/kRKjmxJ4TfWX+tRiFBQ==
X-Received: by 2002:a05:600c:3511:b0:477:54cd:2021 with SMTP id 5b1f17b1804b1-47787041346mr31124405e9.8.1762955752566;
        Wed, 12 Nov 2025 05:55:52 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:51 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:37 +0100
Subject: [PATCH v4 08/10] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-8-b51f97b1abd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1104;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5tWrLPzClpmnMADJpWcVY10mVN9q3Vw/ebyB+WPO3Cw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHXDZMnwTAKRmvdN9vLJzwjFFiSdS3OXohry
 PUdZAt0JWGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1wAKCRAFnS7L/zaE
 wzUMD/wJ3SBi0tLbJfLHaJhap/guD7pReEjnW/JOFDIC2yq5EzUDFEcY2ViZzm0g23lmQuNDYfK
 A9dkc1Mv+1lDHo2WyNnysll2axbhGj5aUrn/CRjyhAP38l+zWwE1lmSO8/4QorZVdOBbmKtqgs2
 cAh4KcGjmE3UCT6hw+o1H2Y9P9CjXJR9elZ1tGxe/rhxV/4AZcVd9Y/ii8edu8RxZ/sRYhEk5WM
 fRMEOqLO2vvrStmWdHmJVvco93x2yBlOM8nGDFyAfbus7MnFkbt3/oM1bGOFNMdljTdqAnmqduW
 9w2n4+muj0DODSDmbhf5LxohVoIe4YjL2osikP+z32QEPd+RH6u1WwW/yNKHWsCbGjxiZYp5ySw
 hukbppWtOdg7agAmIeium9gbFu92bYTi6faAUI6gElRB2ZpQxJX0w0K7vBLYk+yDV+KHtZwzdeA
 dYffKpRViRdgesoFBEq4ngvfCW2BXb6Igh6DGMUY7oMiWxZhzSVXJJoUq+3k3a3ly9r71Fd5t/D
 XwQRIape22DdjWtcBS0I+N3YZ551F3dIYO4wV89vQEqxGyIpGgKO8fTaDdg0vGfaz5fOGjHuyiT
 4vcee5JPb+QUHuN3nlCYmBKHKr73jH+0N+HzpMRJZftovkFJRJqTD/ScNSWk0I/RgCE8u/APQA8
 6yW1XuYbXdH+Qlw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_055554_316847_1161DCD7 
X-CRM114-Status: GOOD (  12.94  )
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

Reviewed-and-tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB3
Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index e249de7f91d91f8c7f1e7020086cc65c71e64c5e..d7aca6567c2de1ec36e9f36aa82463bdbf3be27e 100644
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
2.51.0


