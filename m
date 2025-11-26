Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A506ED10F5F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 14:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5e6BAzVHQo/JQ0cSQqz1ZzKrk4PTlqrgNjLAIGVOFo=; b=36SGzrJypHfhgHMYOvUCh4v/dG
	ujhCudFZgH01EG0ORT5qBJfwZawMTBtgu2z4fUjLPUgtC8sf1Vl6JL0Q/Erru3YuSX+ZHBFUu29d7
	iwJQ2cJS33FWkKampjfXmj9+VcQFblWuFsgcUD/kbvfl3EcwI+htXATvil7VP3Itfo/BBwec84I7r
	onrIGXxxDua76Ow+QbkW6vqdFZh4ACvMqIx1tajZRzvaXqtxGphHZFpzXQrXiOf5/XY64k6ZQ4sYW
	WdLgo47kvwpWiDrYt0CTtr+jXI1anesr8h4UHo1N3QjgZ8on9GNk/hcM+3KYSj77+pyiKrIIc5x4K
	hAfybKoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGuZ-0000000F8yk-3Qmk;
	Wed, 26 Nov 2025 14:54:28 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGuX-0000000F8y7-3X0z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 14:54:27 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5957e017378so7100143e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 06:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764168864; x=1764773664; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5e6BAzVHQo/JQ0cSQqz1ZzKrk4PTlqrgNjLAIGVOFo=;
        b=cyYZ6z1S+7f4re8GJGjHjGQ68MHjdP9Wxqdy4srf792Rnrad1kMbUR6BJ2o5uBacdF
         ns+1fMbd9nBmT5Kn/Jtn70bVYQmXjWhLW7njdg+rEtEZEkL3LcMO53FBFuGUXECIJ7Nk
         6yRtm+l6ctysnhRWlHiN1uYy9y9zbA9sKN3vLWgHDo4HfdUark3Nl6tRp1/wbx6R4yoj
         bovFY5qx7GvUroLsDZw2vhgQu4hJ6tyXR7SIu+VTmnAVduqZmCRVuv+jAAuxOuwU4YAs
         CI/nsC/ma+zaUNt4Z5QINqIEhtsmdTWET+lo8pa6YB8cXQCXtiVxpRDowO/hwGfDF0Qn
         FGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764168864; x=1764773664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j5e6BAzVHQo/JQ0cSQqz1ZzKrk4PTlqrgNjLAIGVOFo=;
        b=NskzTfEpmy4LFab/wOGSt7u4cupGmWyFhFlBwmURX7c/OsUrh4fdISuGB/p1N9wqPc
         zDQN4A3rZGcacXwJXWqD7Y2q+ePbgCQWZ6QcdUxRRN0ulAXEMLISHMRc3n+DuY+8Zxdd
         uFTg5926t3h+7cOuyf+1Xpjw8jtNO6zfQbocee8SGw5xPFfhNL+fk7NmCR4jmfoKqpBN
         +HCeY9dz+S2KQAifE720MTuYRjFwJde3us49nekpxrvo80pcbwCxzUNbC5n6pJKB1sT5
         OcuiVg1/xlv4uXwsZJDsd7UY0Sl0bUixYjtryApBwcCJmcit9x8Z30Eapw2UgGGuo59T
         LUbw==
X-Forwarded-Encrypted: i=1; AJvYcCX7TI56D0Sj4ktYHKcvuBCGpehrRa4vWN0riMzHeaFzVpz9IIdjo2z/Hdtjp8gQ/h4emfbjJ6T7HS3cUlj7i9iy@lists.infradead.org
X-Gm-Message-State: AOJu0YzVWs+UVilZuxZFL8EsSINru1GrJ/6OxESBkIn9HM0luxwhjkHo
	zNtpeju1CZymxf7X6kGXDm1ZUooGK2iRWl9u+43IMO6/hkWztG5EhN53Tf8l+XUgAVsH1qjEZT+
	5b6Jf9c/pTAJlft8f5kAFGnaB0jQ5eHlOxq2FzfeFlQ==
X-Gm-Gg: ASbGnctHs3r6Kaw9QqKSfsoDMnv3EOnRI1sLP/LqJK4EreQ0+0emRLJlfY24hmJqyjO
	9wkzYN48M8b/PDwgp18alh5tsM3NW8iebLbuy/PkQ9imqwZuDvmR0/Lc6yhbQ+GMXMIYg0VrPS5
	ICRNSoCKcI43P1syt77Xk6WtotGOLz6vGluc/Dj7fkgMD49uTzKftkjvzuJJoy/cV2mnz1Xx3TP
	uMxqM+vz09bQg1WGbI9eOrWp36zy2f5jwggstJB0vl5SIY9tfHMWhzTVfOR02e2P3OxV24yEYex
	kSaZ3QkhzRkrXYqjr/bd9oeF42C0IgqRa8WiFQ==
X-Google-Smtp-Source: AGHT+IEuBoP7FLJ7RKfybPU4wnzQPfOfSBPELfecZJf498k1Kqq4aLbclQ82Xa0VbYulJKemI9mt9GiaCUGy6s0Qdlc=
X-Received: by 2002:a05:6512:3188:b0:595:9d90:5dc6 with SMTP id
 2adb3069b0e04-596a3ecd4d0mr7181931e87.19.1764168863690; Wed, 26 Nov 2025
 06:54:23 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <0829a21c-f97d-41b6-90bc-2acaec42caab@nvidia.com>
 <CAMRc=MdPvF+okfnRuwvAFG9UfyZ-araDsaaKMxKASEbc3rhyjQ@mail.gmail.com> <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com>
In-Reply-To: <705186a9-a9db-46f0-bf2b-b499def050dd@nvidia.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 15:54:12 +0100
X-Gm-Features: AWmQ_bntaAt919-HW3rKjIZ6zdRdh3lB3VLls8nYAX3XHQRBb1qUUSQSnMgYz4w
Message-ID: <CAMRc=MdQ8QgbdAd2sudZLgcDZu9DxBRJh5sfLeXwcTDEE0F7Uw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251126_065425_917037_B0F8AA65 
X-CRM114-Status: GOOD (  24.19  )
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

On Wed, Nov 26, 2025 at 3:51=E2=80=AFPM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 26/11/2025 14:28, Bartosz Golaszewski wrote:
> > On Wed, Nov 26, 2025 at 3:24=E2=80=AFPM Jon Hunter <jonathanh@nvidia.co=
m> wrote:
> >>
> >> Hi Bartosz,
> >>
> >> On 12/11/2025 13:55, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> Some qualcomm platforms use shared GPIOs. Enable support for them by
> >>> selecting the Kconfig switch provided by GPIOLIB.
> >>>
> >>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>> ---
> >>>    arch/arm64/Kconfig.platforms | 1 +
> >>>    1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platfo=
rms
> >>> index 13173795c43d4f28e2d47acc700f80a165d44671..3dbff0261f0add0516d8c=
b3fd0f29e277af94f20 100644
> >>> --- a/arch/arm64/Kconfig.platforms
> >>> +++ b/arch/arm64/Kconfig.platforms
> >>> @@ -316,6 +316,7 @@ config ARCH_QCOM
> >>>        select GPIOLIB
> >>>        select PINCTRL
> >>>        select HAVE_PWRCTRL if PCI
> >>> +     select HAVE_SHARED_GPIOS
> >>>        help
> >>>          This enables support for the ARMv8 based Qualcomm chipsets.
> >>>
> >>
> >> I have noticed the following kernel warning on our Tegra platforms ...
> >>
> >>    ERR KERN OF: /__symbols__: could not find phandle 794981747
> >>
> >> Bisect is pointing to this commit and reverting this does prevent it. =
I
> >> am not sure if anyone else has seen this?
> >>
> >
> > I assume it comes from drivers/of/base.c:1295 - could you please post
> > a stack trace of how you're getting there?
>
> Yes looks like it does and I see ...
>
> [    0.123356] OF: /__symbols__: could not find phandle 794981747
> [    0.123401] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc=
7-next-20251126-00002-g1cd98992c487-dirty #19 PREEMPT
> [    0.123418] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
> [    0.123447] Call trace:
> [    0.123453]  show_stack+0x18/0x24 (C)
> [    0.123472]  dump_stack_lvl+0x74/0x8c
> [    0.123487]  dump_stack+0x18/0x24
> [    0.123518]  of_phandle_iterator_next+0x18c/0x1c4
> [    0.123536]  of_count_phandle_with_args+0xa0/0xc8
> [    0.123551]  gpio_shared_of_traverse+0xb8/0x47c
> [    0.123566]  gpio_shared_of_traverse+0x158/0x47c
> [    0.123578]  gpio_shared_init+0x110/0x1f0
> [    0.123595]  do_one_initcall+0x7c/0x1c0
> [    0.123607]  kernel_init_freeable+0x204/0x2e0
> [    0.123622]  kernel_init+0x20/0x1d8
> [    0.123637]  ret_from_fork+0x10/0x20
>

Is the device-tree used here upstream? Can you enable DEBUG_GPIO in
Kconfig and post the entire kernel log on pastebin?

Bartosz

