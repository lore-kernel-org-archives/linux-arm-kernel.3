Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB5BD11181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKUmPojsBEaS1Fv5ikaphx/1DJX8hiMLHRzmJuvC1HY=; b=kqe8zZw+XZM+JHnA7K99gwmWoN
	GnC6QB1RCEf+48i6+s4M4Woa/T7cpXNbBl/vlaPWDjus5Lac+fTfa6CF1AuYViucnNBUNErTe9y9M
	V2l4tuh/Wn/KzMupfWIEnQC+CTSaLyRfwKwWwGgR/RkFgRFm0YjdDmAnBw9STDoQSEHjaWFNPlMq0
	dsW2TCOGhdpDmSyRdL10NhxK3WjKIU1oi2UiAdQSV1aTIqkJj/ef7AzHw41w8uXavbKDBl2V1noUG
	E/IzlzgE3Sn8JlAXxHMxP104/zQmzxs4tPIAIh2Eo/eIV7MBYAvMqzl5b3TFXn1L3pyamIfNBYFf2
	JGkvzy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHwT-0000000FE30-3sI6;
	Wed, 26 Nov 2025 16:00:29 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHwL-0000000FDvR-0YXY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 16:00:22 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59577c4c7c1so996258e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 08:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764172819; x=1764777619; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKUmPojsBEaS1Fv5ikaphx/1DJX8hiMLHRzmJuvC1HY=;
        b=1jk29wZeZGxjBQYig0v7WyrtS/K+bHZQ7KAtwffky9883YuXHmrc+f5y3qTuxkVjxC
         WIxwLIjh3CiD00W8evW6uHbXk3JhPjCU8sh5PA/KCKYXq2s6lXmDOKViOx3bHSaYD0fs
         syg3onGjYb8C9d8beU/+RskQUgl33SITDZL00KZoW+/I9bn15Nl/Xz8hvtIkrpUaHAvs
         ZKGvgk2o02CBK20BjYzdefF+3UcScQtfrijC0VT3ORI+yi+o3kRg9ULb7CRU31bSGdEj
         u0jiiA8SY6bAPEc4hMHJg9p8qx+I3YLmz5w3c1ovuBXL8+gLG9b107aSBmKSNK4RzJwM
         TrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172819; x=1764777619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CKUmPojsBEaS1Fv5ikaphx/1DJX8hiMLHRzmJuvC1HY=;
        b=u3fhGF32hGTKVDfaI7lQkos2cat6jJkLLxLgvFEcDJjHNeJSA+x6QkEwgPt39FhBTc
         oKY225BjUjI+ax/CCGlFbdKm5Z6hWeq9bnMPglG24nXr2bPixmryz7M9uira+kV1Oyh3
         VTMVRyGTsMNL8k84ibfScusJ330t4cxSh+UampeZ47rG4Rc/2uGVIlvZNO2BS4RRR1ET
         1VcPSJCyYqnaa2todAPn9T6kgThlm4hykh3Pf+/QA3UARfjUeWBaleegqm2pyAfo4m+J
         Z5CRLKy6W3vgG4F3C1n8AeCt4EuLFrujeJ5f0TVoXVoz7wZpUx5wwawjubH37TT0Scq5
         7bYA==
X-Forwarded-Encrypted: i=1; AJvYcCUVViPWW0n7wEfr5PoFAxhdaAg798/mFgKg3gTfQCJljHI+DvDGYSmtzrz4++bj2e4UKRZXwyia5Q/TRBSMofvf@lists.infradead.org
X-Gm-Message-State: AOJu0YyVrrm2p1vpoMPvnZiFfBvnM+QPMkRVNSu4PeEpbbPf/qtCWX6L
	dEdy4H/DBjNOMG2dHU8M0BlggyY16tvTdgnV9kZoZ4d+qxoHctni3HEMUqU+QTTIfHFQUyk+4EN
	ag8jPEHOS+zBupAIwuZX4AQcNN39T+/7MzyNWCFDNGA==
X-Gm-Gg: ASbGnctAo9S+nxfh+xPU5iwljIFC5Pd+wMb1gggMgWLa/vYYqYJ0nAcMTeLIHd4KoHb
	QAOHZv9up1giJHzkYpdWRXRfmKq57luedOha7zbiZp77cFYC/113hdnNkAcu+MVkvBhpxIsKPeV
	J/qrgLhtqsfIGeedgZTyGbBxXfOcPd30EYc25e2Beu5iZUswwkzKUxie1U4vTu4teNAh5E8Cm9W
	WQhe7KwxON4cyLo3UgUNW5s6d/HacOR4+B3h9xY6YSiZSBOU5ppR5tz9HfiVTLwHKcEebWlWHOu
	j74ZOk593WpFL8xKQvHMkuesMUA=
X-Google-Smtp-Source: AGHT+IG/dq5r5WmQcoWn78HBF8tifFKLQkNqXoHsJ8uu05KTdYoqo/JzkNcCqS3q8x6xdOxAcwscTDG+CXZmPir3agk=
X-Received: by 2002:a05:6512:33cc:b0:595:9929:c8a4 with SMTP id
 2adb3069b0e04-5969ea35615mr7886071e87.22.1764172818843; Wed, 26 Nov 2025
 08:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
 <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com>
 <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com> <CAMRc=MdQ8QgbdAd2sudZLgcDZu9DxBRJh5sfLeXwcTDEE0F7Uw@mail.gmail.com>
 <c4081961-0875-4a2d-ac84-40df128534e7@nvidia.com> <CAMRc=McSrKgL=q8xfH_Vndg7rCfy1TVgRh+dFRqFCiBwT_J2yw@mail.gmail.com>
 <b166f160-e4e2-43a2-866a-3341cc91a13e@nvidia.com>
In-Reply-To: <b166f160-e4e2-43a2-866a-3341cc91a13e@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 17:00:05 +0100
X-Gm-Features: AWmQ_blfhwNoOC_5q4Y6Ua8mUZE4gIa1ItGMpnk3IeLNBCFsJ0ovvbGWZGIVjOo
Message-ID: <CAMRc=MfWi=cU1tK_AXW18A0X7K2TGp_u9Dwg4uSfW7Te83HvqQ@mail.gmail.com>
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
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_080021_209548_B8977D0D 
X-CRM114-Status: GOOD (  19.23  )
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

On Wed, Nov 26, 2025 at 4:47=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
>
> On 26/11/2025 15:33, Bartosz Golaszewski wrote:
> > On Wed, Nov 26, 2025 at 4:29=E2=80=AFPM Jon Hunter <jonathanh@nvidia.co=
m> wrote:
> >>
> >>>>
> >>>
> >>> Is the device-tree used here upstream? Can you enable DEBUG_GPIO in
> >>> Kconfig and post the entire kernel log on pastebin?
> >>
> >> The kernel log is here: https://pastebin.com/7rBh3T3T
> >
> > This is not telling me much, can you try again with the printk() I
> > posted earlier, please?
>
> Yes, sorry I missed that before kicking off the last test. With
> this print I see ...
>
> [    0.120432] gpio_shared_of_traverse: /bus@0/ethernet@2490000 phy-reset=
-gpios
> [    0.121407] gpio_shared_of_traverse: /bus@0/mmc@3400000 cd-gpios
> [    0.121891] gpio_shared_of_traverse: /bus@0/host1x@13e00000/sor@15b800=
00 nvidia,hpd-gpio
> [    0.122035] gpio_shared_of_traverse: /bus@0/pcie-ep@141a0000 reset-gpi=
os
> [    0.122075] gpio_shared_of_traverse: /bus@0/pcie-ep@141a0000 nvidia,re=
fclk-select-gpios
> [    0.122342] gpio_shared_of_traverse: /regulator-vdd-hdmi gpio
> [    0.122381] gpio_shared_of_traverse: /regulator-vdd-3v3-pcie gpio
> [    0.122420] gpio_shared_of_traverse: /regulator-vdd-12v-pcie gpio
> [    0.122453] gpio_shared_of_traverse: /regulator-vdd-5v0-sata gpio
> [    0.122486] gpio_shared_of_traverse: /gpio-keys/key-force-recovery gpi=
os
> [    0.122551] gpio_shared_of_traverse: /gpio-keys/key-power gpios
> [    0.122615] gpio_shared_of_traverse: /__symbols__ gpio

So I have no idea why the special __symbols__ node has a "gpio"
property but as this is a special case, I think we should just
explicitly ignore it.

Let me send a patch.

Bart

> [    0.122672] OF: /__symbols__: could not find phandle 794981747
> [    0.122701] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc=
7-next-20251126-00002-g1cd98992c487-dirty #21 PREEMPT
> [    0.122739] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
> [    0.122747] Call trace:
> [    0.122753]  show_stack+0x18/0x24 (C)
> [    0.122772]  dump_stack_lvl+0x74/0x8c
> [    0.122788]  dump_stack+0x18/0x24
> [    0.122801]  of_phandle_iterator_next+0x18c/0x1c4
> [    0.122819]  of_count_phandle_with_args+0xa0/0xc8
> [    0.122832]  gpio_shared_of_traverse+0xd4/0x4c8
> [    0.122848]  gpio_shared_of_traverse+0x178/0x4c8
> [    0.122860]  gpio_shared_init+0x11c/0x1f8
> [    0.122878]  do_one_initcall+0x7c/0x1c0
> [    0.122892]  kernel_init_freeable+0x204/0x2e0
> [    0.122908]  kernel_init+0x20/0x1d8
> [    0.122923]  ret_from_fork+0x10/0x20
> [    0.123055] gpiolib_shared: Finished scanning firmware nodes for share=
d GPIOs
>

