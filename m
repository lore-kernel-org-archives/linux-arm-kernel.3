Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A157ECED63B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hf2Cxv40+7yq8V71h6ANiFD+N1Zr8f5Q883U3V106Ak=; b=dAOXwNWbLXKgP08MOZLYmto7Q7
	PV3Ze6kz6MPoiGd0peeNQT6WTfo6hf5HhtBOG8xitDcDE/2XrKflOFLkc1bkTZMGnlap+/noYNkHR
	vmal9f63qo6qHM/vzdVCitYCiaBPTk97hqZFncH3VyWBWDmEJLpVeUiq7VxZj0WVMaDlBQSYEgj6X
	RZ3u8P/jjUY9v7/FOanG4aWpdaWBV7iSn4iLouD7J1ZHyKWUH85ar43Q2NduHTXdk8ifnqWxYLUcm
	RNEahhtOZCFu8xr06XUPYD/5xarrYKWvV2nfSDA6dfgUexMWQJrTr8FSaHxW8kVm58j4fosVLtTdE
	+cQavffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMg7-00000000YhH-230K;
	Tue, 18 Nov 2025 14:27:31 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMg4-00000000Ygd-0toN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 14:27:30 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-37a33b06028so50106551fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 06:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763476046; x=1764080846; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hf2Cxv40+7yq8V71h6ANiFD+N1Zr8f5Q883U3V106Ak=;
        b=MJznohvyVSJBeEwXh3meiw1lJVoXFasqUAW+Cp3CZDa/3Jb88y21S43ZNmCCH1EuWq
         ne3oRQ6V+l6GlRN4NbYy0gRDqIjtKbNaPJbp+N1h/mYYjV0nLnnWKuN5ZxPxxImmKqNv
         IvnUhl/sKBXwzuSV+o9X9w0Bdmt7tVensenTSdppWI8TMWvhKR4vdNNf1KqNzaLMy9CO
         QWwxuTykQ4nGPW8oNs/aP/E9ogqeGieDNxMSRFfLEqgqG7u2pp5+vKjokHf+Ug39i/Zr
         lR6jnEGd94tHusoCt2U7Y4WvvgClfdBhVOdNY3aBWQkxwMZYQx+XZLxtgXEtRhuzUv6J
         drsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476046; x=1764080846;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hf2Cxv40+7yq8V71h6ANiFD+N1Zr8f5Q883U3V106Ak=;
        b=CsyY0fe+lJFjNRpj4hd8diWvaeedjbeIW6RXyqoFoeD6uoPZRruSvZMxotgThSYGHo
         hBkCxKjbwQJ7nOoUFaIInjFv/8sDJ17vw+hhQDG+wGM6vZace2dRPaB66Ytc7Bl9WHiW
         4GsmNUnVjaj4VbFK6tUn7RnFFaVz+1Ov8zzSyymse8MwwSRPREG5jI8Ve4TZyiaeMmqT
         M8y5ivKSqMvi2kKfy1TVI3lo3Gi2uUWs140RX2WQNIa2meTY4dFx03/ZB2uoqiGAhaQA
         wZrQNimMY/ZbwlUYkGy93niKpq95vs4aAulMdqYDwaddH2KPVg8EXPZvV33fYRwGDSn3
         0RIg==
X-Forwarded-Encrypted: i=1; AJvYcCUUVibiH1VGWsGzlxsD/Xh1CBJtbcMYvX0emgxz7ryBuNJVRbjTYBSxh7Tgui4CRKCCsxaMaj6K3haE5p8g2iVF@lists.infradead.org
X-Gm-Message-State: AOJu0YyRG53iXsegeVYqTcIQkgYYmUMol+qnKt3vidyOJQ1sc+c8Qy8k
	LX/JsRi+Mpv9BB7AEvaPgn1v/cLqigrEH+8b7WjBZirsDPo2NnQSTuyyuHPlOYkN6lzxscaT2og
	6niByXuUiBmEfNHRqIBHTRdM45nXD6/84W2V+SI8F+Q==
X-Gm-Gg: ASbGncspapf+ksN0UrrNlBgffojb7InNoYbt1/jioYBnhtgQtx7OEDEfFeCeYWsKZ6a
	HVwSRIwa9z2z0uEZeLesKCgaS6EF/hOe07bqhSoiT/yQzDPfaThA66ZXa6bV7v49iR5oTx/Ml/q
	nJiJyIpGFAPf/aF8Y0hyORD1118L5uY/j2ZkdY9G7jw0l75rj4MAaBRcLqcsFaqUxrz5MKEMfOC
	zTmdCX8wzu0/4aBGae81JMSJXJLBAlLAh1wlVexwXfvOqglOQBOS2/I00y6ShGBTqp46y09HyrZ
	YWEoW9lS5Ny6EftrsJj0KcV9b/jJnf07VSTv
X-Google-Smtp-Source: AGHT+IGoA5UBOXsJ5cVSmQ6gsh1S9Dtt4hgxp5RrgYNaDgN6xDaSj9cgZ5HgZ64YpoGqqFZp56SXUGYxduiY1NHaHGU=
X-Received: by 2002:a2e:a00a:0:b0:37b:aaf7:f007 with SMTP id
 38308e7fff4ca-37babd6ddb6mr36053731fa.31.1763476045857; Tue, 18 Nov 2025
 06:27:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Nov 2025 06:27:23 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 18 Nov 2025 06:27:23 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <ab0b2e6b-7d2a-43e6-b8e7-c97cb9763798@sirena.org.uk>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
 <CAMRc=MesD5HchG_hfvN3H5ayu8gX_OvSsZQ4UO4f27gx1rRzSA@mail.gmail.com> <ab0b2e6b-7d2a-43e6-b8e7-c97cb9763798@sirena.org.uk>
Date: Tue, 18 Nov 2025 06:27:23 -0800
X-Gm-Features: AWmQ_bmvuv0kqhmAyv1afKHnQoK_7YeLlaSbUZcYwoK2sDVs4c1RAgiSNxeeuyE
Message-ID: <CAMRc=Mcafi6+kRX+9sVOLHCegdU33+omLg+aW4RqeiokymxPNQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Aishwarya.TCV@arm.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_062728_275956_A188BE4B 
X-CRM114-Status: GOOD (  16.11  )
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

On Tue, 18 Nov 2025 15:20:47 +0100, Mark Brown <broonie@kernel.org> said:
> On Tue, Nov 18, 2025 at 03:13:49PM +0100, Bartosz Golaszewski wrote:
>
>> Thanks for the heads-up. I'll try to fix it ASAP to avoid a revert.
>
>> I can't open the link:
>
>> 500 Internal Server Error
>
>> FATAL: remaining connection slots are reserved for non-replication
>> superuser connections
>
>> Oops, something has gone wrong!
>
> Retry, it's AI scrapers so those 500 responses are just glitches.
>
>> Any chance you could get the offending line out of this stack trace?
>
>    https://builds.sirena.org.uk/187dac290bfd0741b9d7d5490af825c33fd9baa4/arm64/defconfig/vmlinux.xz
>
> /build/stage/linux/drivers/gpio/gpiolib-shared.c:87
>

Oh, of_root may be NULL...

Could you try the following change please?

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index c22eaf05eef23..4ce574a21850b 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -205,7 +205,10 @@ static int gpio_shared_of_traverse(struct
device_node *curr)

 static int gpio_shared_of_scan(void)
 {
-	return gpio_shared_of_traverse(of_root);
+	if (of_root)
+		return gpio_shared_of_traverse(of_root);
+
+	return 0;
 }
 #else
 static int gpio_shared_of_scan(void)

Bart

