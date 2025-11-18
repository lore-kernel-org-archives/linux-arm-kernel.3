Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6001CEDD93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 14:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/hsRoPuxK0ArN7QijjTpiqRdVM4dQQwSNJXwTgxb/s=; b=Rg8nr+hr/TG13flPZtZJunMYIw
	TjR0VKJPrYM4Hz4HuLiaExnoXd3avAqwCvH/G32Ror4685q/jUS3vY3hdqpR3bL//gzypT20H9Egr
	qE9FCPgU3FuBhUPpB/qkiTCMDOsc8IWx45fDNCnXGlwLKfmpSvyfvUvolA8TYaSmqqKSD2BXO8sGt
	xCNshIEHu2ZfYEOy6dF49bC4cYTPmc/8iWlAuuvTDxnnGGujmiKzbPUNMRee73I6hjwYbhirDpbI2
	13JNUWtswtHhIoQp7bUQyxds1u9zNcRpIgXJp+0iOr3TkIYHGoFZykIg9tHKBXYnuDOD0ChUhoQdj
	9Cxofkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMTA-00000000Xnk-1PdO;
	Tue, 18 Nov 2025 14:14:08 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMT7-00000000Xn3-1bSd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 14:14:06 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5957e017378so6387811e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 06:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763475243; x=1764080043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/hsRoPuxK0ArN7QijjTpiqRdVM4dQQwSNJXwTgxb/s=;
        b=qiuTxJgZksNVuvEKpoqiQtAYR0wFS2fm171uZFoPXsCLN3fYQ0AiOJAiwFg7dig0Ot
         P/Z+oUmASHriz3SDiBN8wssvPvHo7Gi6kuO65PeJ+giBT1oOHQntROcH44WOSy3F1xiW
         YW80a7FXJyTwUqfXbIgk4OowtgKUM7pDnhXHR/VWfJ06DxAqqXaniTpeUhBVNZg2HCum
         yoxBaJrTy+Gl1+ZSUgZ4pPKLKKoZxTFWSqS4S/fJtboJJrBtcPB9AyWp4dy2uw2MFSjm
         O2hlERFYqkZorogr4FjOG5BpSXoNyerByrzuooh19znXfhTfUKVMT4i2qoPAnSqRa90w
         5oLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475243; x=1764080043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y/hsRoPuxK0ArN7QijjTpiqRdVM4dQQwSNJXwTgxb/s=;
        b=RRoTY7JTHCsB2JzJHjnf0Hn17QKM84eNAPgUdndKb90SehadHT9A6zecLaGhJCij3j
         jAOAJ8dLGmaA+uCfY/opHjr1h+cSPy0/Rq/eKwL0xQrSdWIzmws5ZWHEJCpmlopMVH8l
         WbKC7Tym63IijYODYoqLOWjIA7MI9SgjYEy2ETYO7bHOp/8exaBCjY+QceePGI7IeiaP
         KzNoNR/rFzf8MxsjCcvEY/8E7MIgOCAzeNwUM7IAmMH15AyYrZLPQV0noIB3Hkv0XBsL
         QQTd+t9wJHmCXT3TdmOK25NYfMp+i4TTLkTE2ee/mFMCSlyQj/TvMVFWKjz8UZ1BJ0no
         AiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL8WnrFQUMdk6SiUa7bN6ldiSLEGkZpVNfUEkLdjo0nrt8ukmLlwHWdi2GY5q7EpGgWyseXeEbVmrus8lrkHg1@lists.infradead.org
X-Gm-Message-State: AOJu0YwgZvhdyNaz5AXdTgpE3sImuJv5LQw/IIYVxvslm3BSzfZp0GTv
	a1hUWKm0VlUk3yZVPRxdueIo9yOQycLexexYy8/yJ5NAo/8X+jaJfI/WZaQjMeTwim748zW9EYs
	ku0k9WnVCYRfYD7d1k91F7sRgl5kHsc/KzGiBM3GJYQ==
X-Gm-Gg: ASbGncsB4/w1ObFLmYofWNrT2694lAsEu8rPeCxP3HvTSkiFCYT1aaMiO3zzx9c68KE
	AwLU1R4/7HilzbjVWLkC1cCAn+3/dcQWCGIBBLmamFH5pyEiuBioKjRtAywEmPV8iyvTQ8z1Bob
	u6tI5vDZZeKMR3Mn3i4JFqpXPcmMbxwFPqPqArLzvFDpAhD/4UBYgWDiTDip7zGjtl3x6gwVH8l
	r+6woS2S9tp71qZmLCh0dIAcA2LTDj89GRZ7PNz+SWLgzC0galhrPgxsK/A9QQETjy/DxeOewdZ
	N9fEofSXfV3MLBbNjWyh7MdEyx5ZcyFqHkjs
X-Google-Smtp-Source: AGHT+IGJQ03bHhvSLT/Jw/p5/ciRMIhXOi1kKvgTg/A2ei7jw24+PyQrUs9nkeMJrkLlGxvJrjx4mWLznFJMN8Rsc34=
X-Received: by 2002:a05:6512:3d21:b0:591:c346:1106 with SMTP id
 2adb3069b0e04-595841984b9mr4734076e87.9.1763475243255; Tue, 18 Nov 2025
 06:14:03 -0800 (PST)
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
 <20251112-gpio-shared-v4-7-b51f97b1abd8@linaro.org> <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
In-Reply-To: <dbe20642-9662-40af-a593-c1263baea73b@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 18 Nov 2025 15:13:49 +0100
X-Gm-Features: AWmQ_bm5Da4wHKOxjtJ__aJHgfbf47KWT_x6OWvp3Fig-m3IkJbVSEO16RWkPHU
Message-ID: <CAMRc=MesD5HchG_hfvN3H5ayu8gX_OvSsZQ4UO4f27gx1rRzSA@mail.gmail.com>
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Aishwarya.TCV@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_061405_611795_321E4BFC 
X-CRM114-Status: GOOD (  15.70  )
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

On Tue, Nov 18, 2025 at 3:06=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Nov 12, 2025 at 02:55:36PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Some qualcomm platforms use shared GPIOs. Enable support for them by
> > selecting the Kconfig switch provided by GPIOLIB.
>
> This is causing boot failures for me in -next on the ARM FVP with
> defconfig, the select affects all platforms not just the Qualcomm ones.
> We get:
>
> [    0.137360] Unable to handle kernel NULL pointer dereference at virtua=
l address 0000000000000058
>
> ...
>
> [    0.140979] Call trace:
> [    0.141037]  gpio_shared_of_traverse+0x48/0x480 (P)
> [    0.141187]  gpio_shared_init+0x28/0x14c
> [    0.141314]  do_one_initcall+0x60/0x1d4
> [    0.141446]  kernel_init_freeable+0x24c/0x2c8
> [    0.141607]  kernel_init+0x20/0x140
>
> Full log:
>
>    https://lava.sirena.org.uk/scheduler/job/2101484#L692
>

Hi Mark!

Thanks for the heads-up. I'll try to fix it ASAP to avoid a revert.

I can't open the link:

500 Internal Server Error

FATAL: remaining connection slots are reserved for non-replication
superuser connections

Oops, something has gone wrong!

Any chance you could get the offending line out of this stack trace?

Bartosz

