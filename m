Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFAFCD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hgFs5jtdGYJBZ1LEdVbgHUHnMs4CKKuQJyrqRFEph4=; b=OP3XRrsLAT/yNhsivuJ5q5bOrV
	/G2ykO0+Py+0EmEXK8eP/+Q94YM+8eXH03VBhSKegylU3//ItuJWqfoJ9CgENWg8t1gCPqRsvmpvI
	2YPICEjNtmhWhW+xfsgNaUaUVZHzMcU1/nk7hiamwRgWIpRFs1VzZ9PsiAOV5z+av5+S9t0qc4t5K
	gRZ/6kRwgK2g0iygGTWj9Hf4XrDaEi4dLa6hoI2UQJoCukQ9DKMDqWRi/5dda+hXAGImjIA+4nKID
	SjkPFA4DcQGuwV7J9MVseoqP0XjEamXJqxw2YwK04v94udnIA4H8zIElUzq4qZnqESJqAz8N5TIZp
	AndbmQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBK6-00000008sR0-20CU;
	Wed, 12 Nov 2025 13:55:46 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJBK4-00000008sPB-0cnP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:55:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47778b23f64so6237185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 05:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762955742; x=1763560542; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hgFs5jtdGYJBZ1LEdVbgHUHnMs4CKKuQJyrqRFEph4=;
        b=CtjY56VjALLkmYfRxnTRoo62YOhpUi7aY7koIWUEJTm5lsag8Jcyaq1MjXhkpt8hZV
         b8RZY+hCGjm2TDUTpNkEvqtpesthm76YCluvBCaXA197NXFn9jeTFYXda25cJxAFD4xi
         iqHMECy3Zw4IkdbvuwBPC5+EDgwGH2VyHUDBqFwaIGQ2bigztO9aXGnDkJvaIyptpf2i
         CFkIc3r2GJr1lsSAEpsSzSDETjRTdTnRa09v+PUi8/FgE7aDMenwyEX5JUOUv3PG4Xg8
         14YckMx61z/yFi9kTMMJHqDubuEtv0plxyYRCc1FhQPhR5tf+V2s8H9fPLWwoIe/KmOy
         k9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955742; x=1763560542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hgFs5jtdGYJBZ1LEdVbgHUHnMs4CKKuQJyrqRFEph4=;
        b=KJbjYTFb5NskSGvcSKN4pia++Cxhj0XW0aZ7z9PMzdFV9o+trQPQAp3+o3BwQyRx4I
         ZPwEwho4IatwxETcLKi85xEIKiQ1p5rKT+7z4wgpPk2czi2hV+Y0UgeQhjA8tnbyKgFD
         lcfnsnQSa6PI+sv01eIum9XxCE7OgDgMM28nLMgeAl9xsgtewSsHbQQBbG1kF5samvpB
         u8z5sRjvmxabCshBre/jnwMd8bWNxA3IiqO6aMOA1FwpWlXg1TWwyN1mBLTQuVZKd5hy
         gGQ8rqz0fZvjTcJ2UjLuZZO+mx02K/DkVjsiu6NPSdkWzuc/95m0P9QGDVcQ3iiGKNFW
         6oZA==
X-Forwarded-Encrypted: i=1; AJvYcCVdKi+my/weMUgJGyktHJDNAjvYPx/Uq4g61TWQ4cX78rWgvFQ1jNp/2vvLcondZN7AcGQCfY8EdIsK0AMmubAR@lists.infradead.org
X-Gm-Message-State: AOJu0YycNGUHqteI23IY0m6AWJo08DJ18pCfYP9+1OZF8G6WUc19xl1J
	wcsDjfq21StkQIpqfRXshSEBqsUfm6C40DXJWlveI/xAzT0wHoPiaIokDQRzQHwwBoo=
X-Gm-Gg: ASbGncuFgfCt0agn4z854t1kfU8U4OBZY0enMv+CbPEpOeWFglBykcDMrDhcjO9u8Tx
	VbkiQleRp+f0stq3RDHqP9vHBSRUZyUcJNv3dUfht/ZuNAWzcLcmRgzBV4fsQqlwuCXFkkNAZho
	JdTIn0mqo4m4oRZ/0DKUdSo+JvsagP9sbnWwnL2UQG2yOXRqOmgssk1kr8vp1LMfA1aYvWOAYc+
	9+F4YL0nmmR1E1TerWDmXnCShL6TCPaIIH5aq3xmAUKwtMfp9ez0U3Gl99GNYSDN2zyCyscGMh6
	AIGjrJM7aOtNx3SiDqwa519yEPB1kWRz+CyHyu9duStcjvjVHdFkjI8Gd93PTc82RCXyTpTUSnr
	xBf4CH+QUnp2jeToRXU95cWZ8XGyVQqKpWrgKjDBpuoe7AE6F1o35rdv9ln+hHAd5JQA=
X-Google-Smtp-Source: AGHT+IGpKMpu73nkeB94rPHaIZutixTAdFFPa6qysCajDttSQ0OQGd/OBq10tj2PVKg3TstrN7uRIQ==
X-Received: by 2002:a05:600c:4f91:b0:46e:4704:b01e with SMTP id 5b1f17b1804b1-477870708e1mr27099245e9.8.1762955742150;
        Wed, 12 Nov 2025 05:55:42 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2a6:e453:42d3:11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2b835sm37711685e9.2.2025.11.12.05.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:55:41 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 12 Nov 2025 14:55:31 +0100
Subject: [PATCH v4 02/10] gpiolib: define GPIOD_FLAG_SHARED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-gpio-shared-v4-2-b51f97b1abd8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fe01g4C6qCSbAEu6zmke8JCgZ5Eo9dDIwKAhmTSay1w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpFJHVBTDDrvJHZ80xPG9a4F7QqcyJzJgbcSXHa
 oo9SZzZ15CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaRSR1QAKCRAFnS7L/zaE
 w91FEACnpe+vPiO9uBC+BsokWIYfbDME+aBKEozY7SwP0GRthdoEWwpZO7sgtgsDqvbBiW27PQj
 u3dNIE3sC+Xq4qVOYGD1CwpgZRYk+nWkm0G/rdY9Cdt3WkjzDjmRKQ6nfYxQ8QCUe3oWOHRD2aD
 FIGPCTly2E8ANXYEWTCdTDIlSifKrLDkfDYoiYC4zvzVFh7yfTrfN3OorFzIpqoBDiFUdOF5v4R
 kZXRmcAik8hp+cSw2IqltJYa0IpkM3fi35svUUVAiaLFemUnTXLwinqOdZXoAR3NUUIkg+yfyGT
 Ng+kpi792Y0jFdeMbPRqb7Brix32Pi7kA6zS6AWsT36I9rQzC1uWHWh10ar6IO4g/0eihjuFPkq
 lIUPxsIpKrOIaKFX5oLZFonmQNcTu/QgsBF3WvKDnb+soIUb4YRd94DdPk93QpQ+YX0A+xvfNvf
 WxDOUFlr8mhOjvU+AbCZTnisyN6TBs1WfXYv2BMxjlOki2kzA6/hsumjEZ41oXWs/fNBeAOSZiV
 uAFemOSTTwgXTlYdblMtR4YBxsA+hUnf62j8isuIFTVeDl04b/T9Q6CDK87kqWqQNOrJgJL27OE
 djN1+y17ilgzoN87pxNZICYpjc2tighS0XY2870Hyn8BpJTZ2mwyf627na0bY0v18oddUykWYfU
 xrHzssrVMLnGRhg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_055544_209565_5A610948 
X-CRM114-Status: GOOD (  13.52  )
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

Define a new GPIO descriptor flag for marking pins that are shared by
multiple consumer. This flag will be used in several places so we need
to do it in advance and separately from other changes.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 14e6a9807a89da6d7c6594a0a2de5f5032c49e0d..c9de4bb10584206f4888c0f28468762a3680aae6 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -204,6 +204,7 @@ struct gpio_desc {
 #define GPIOD_FLAG_EDGE_FALLING		17 /* GPIO CDEV detects falling edge events */
 #define GPIOD_FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
 #define GPIOD_FLAG_EVENT_CLOCK_HTE	19 /* GPIO CDEV reports hardware timestamps in events */
+#define GPIOD_FLAG_SHARED		20 /* GPIO is shared by multiple consumers */
 
 	/* Connection label */
 	struct gpio_desc_label __rcu *label;

-- 
2.51.0


