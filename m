Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A67DD10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 15:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdozIWg11HXn8YrxuTHyeRPHWCFIep7IAFKsHH2Slm4=; b=oW9YPJ0e4H22dEEPHAmon8H89+
	RqeFuqlYm01gA8hh3gtpaGhfcOq/PmwtVZyzTZcQDgZbTDGxzlH5y9JT/daakuO506hI74V+hocfd
	pNBtqlfGUfBDXS8JmkZ1JfXkD0aFz5ioWmbX/LBYe+zGMOkA99EO8OaMkpEc5QZql5TMJIpPvskLw
	m7YBhJSlylw1paAf++1x/sRFp43C3Sqlylt7jU61dEi6vuYaA0w1yVbtGXPyYrGr/M6m4EywP/C2a
	vMPpJCYg9ajJU/9lljdfo4e4V+G7n75YCvxSnRpAWRMUmLXYD6Ou1CR2lamwpEMaZpWiGGFCAsQGI
	q/SpUWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOH5L-0000000F9jM-1Ago;
	Wed, 26 Nov 2025 15:05:35 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOH5I-0000000F9j2-0lZX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 15:05:33 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso65704851fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 07:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764169530; x=1764774330; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdozIWg11HXn8YrxuTHyeRPHWCFIep7IAFKsHH2Slm4=;
        b=0ojjP55C0Yy6dmvzhsJknZ2LUuuLvV3izvD2EpRCdAuhtWit7/pg/HvxW9X3INJPYs
         bcYHBq1FO6qcWXPW194faC3ZGe/KliZeXOgUqmz0J++BRifowYKEM6iltDxIQfTy2eHh
         He4vuQrOcsz3rAHdmVPjK8JOdj3IZ/n84983vmyGTjHRwjlWlOzf5HbtRMJvTKLcF24n
         Vn/Uyt85OkH0uq+TB4s3wIc6abxSTXZYnLLzHk05QGSNqcMmKmEh44HBTQysrVtIavhd
         wKyVBotoalypyLapBOgffa1v87v35tWBDiJjCSeqlQ6MnzhXJPdRKVT4bZfS7SUXIeHd
         kyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764169530; x=1764774330;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdozIWg11HXn8YrxuTHyeRPHWCFIep7IAFKsHH2Slm4=;
        b=Hqe5Um52I8mViwiOx1Ttboc1vDTpgR/iRIDJOZIMHfN/34pzw8aVRjF9fbaDttB/dh
         CpdDrvQJhG7kVIiTQM8lspfcV0fzwELHqPdEl21hilspOpwNF24pN89efHEuJpdHhZ1b
         tj2RJLfPJ7LH35FBIBfag8sIhl6wSeuzG9mbXm75DzXb1K/0Dloi6/EKUocPDgzLmaj3
         cPRc1VXVR5/c1iRUIVFwDnFXgQTGJLc+cZ4nJNd0WaAGEXhAq3iO4KAmkOzmH/cNOyJR
         8MTNEOmr3GQjY4rm0IZ1BuLEr88I1jS2LrF5MwSEkVHG0hSwn8b2YniKNCGBPCjvqhQM
         G29Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtFMMBdjhH1X/f6dNqGxzY/+LB02ebPVUr4dsgPbDjQCgaMczADsZpbq/z8M73+0Uhy6bHcsF4HsSLPDEon/9n@lists.infradead.org
X-Gm-Message-State: AOJu0YwACILwHBo1rT3sO7uAlJuaVq8zyVVEwh6PI3n1XGivEyiZ71Jm
	KYN6+yWbveb73hQEnZp16mzkynOgZUJ7PPZI9pQZbB+ONDs4eMo0Pl1ILimaLkNErEWSequrZRS
	L+nUy8tz7f6Ff8FGzv/TRfhiu734rL4DF8qKyxFBbrQ==
X-Gm-Gg: ASbGncvWtGaFDV7W61U3VJCVjNC3cllKImyGmARmPN7izI6btb8dTEoeJaM+nLnVNOh
	OyvjC7YFVRt+ODm4Hdop0xgRPEvxsZ+EzQUCqI1qfCeHbwtbYKbYcdrD00EfddUABeZB2oR6NLq
	fbZFrpviyznil4kIsXZQTCf2nSDf6bVMiKd30QnZmX8v1MmPdxXmLfEyp/n+82XnwFn9tYyEorY
	uzBunE9KpZklDrxN6+kgSnOzXTRcouxslQrtzGBJfhypGp+Z7KKTKkhD/6wboxJoC8L9Hsr5alg
	7jR7WBKh9koFbu/NlmITwwrceUI=
X-Google-Smtp-Source: AGHT+IFW4CVHKhpnJ+JDeABCBeOEaqoUOa+vDI4F3g0UIFLPs7i4zmAKKWQz/RrJb85q7OyTg13Elak/IxVETnc6Fz0=
X-Received: by 2002:a2e:9f4b:0:b0:36a:925e:cf3c with SMTP id
 38308e7fff4ca-37d07952b19mr17246381fa.31.1764169529898; Wed, 26 Nov 2025
 07:05:29 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Nov 2025 07:05:27 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 26 Nov 2025 07:05:27 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <d56ac97f-24bb-4ea5-a46c-a07dfd0c9e62@nvidia.com>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
 <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
 <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com> <CAMRc=MdQ8QgbdAd2sudZLgcDZu9DxBRJh5sfLeXwcTDEE0F7Uw@mail.gmail.com>
 <d56ac97f-24bb-4ea5-a46c-a07dfd0c9e62@nvidia.com>
Date: Wed, 26 Nov 2025 07:05:27 -0800
X-Gm-Features: AWmQ_blhTm345iaYZ4rHG9m3t_z_cQOEDjbyggM_ksomZgdEfdTrTBoPz53r_Yc
Message-ID: <CAMRc=MerzKQTSj6PXeiWDA4qfNou8ApKYLgJhUGLP0QBatqtVQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] arm64: select HAVE_SHARED_GPIOS for ARCH_QCOM
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_070532_257097_4F16D4C4 
X-CRM114-Status: GOOD (  12.87  )
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

On Wed, 26 Nov 2025 15:55:54 +0100, Jon Hunter <jonathanh@nvidia.com> said:
>
>> Is the device-tree used here upstream? Can you enable DEBUG_GPIO in
>> Kconfig and post the entire kernel log on pastebin?
>
> Yes this is the upstream device-tree in
> arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts. OK I will get the
> entire log for review.
>

If you could also add the following:

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 3803b5c938f99..51af7886d9f2d 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -101,6 +101,8 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 		    strcmp(prop->name, "gpio") != 0)
 			continue;

+		printk("%s: %pOF %s\n", __func__, curr, prop->name);
+
 		count = of_count_phandle_with_args(curr, prop->name,
 						   "#gpio-cells");
 		if (count <= 0)

That would help me.

Bart

