Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F53C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1M55MjNHLP2A27D0IMUuTEokYqJMg2OTuUCTRKpy8Hg=; b=FRqnethPketGnuORgBycDrKBPJ
	72pcrLQQrrmQ37AaYb7bIxqVYZrSz3aKgXIEd/8K9u7Y0Mrm6T4avGhNVQtiIYWukOqdoI60NF+Ph
	DoLmClejtGL9caEJr+C389WNf58ZPlbgR2Ezn5YOvIP0Kuhr6Innk41GOBRqoweEWuUwnMkyPd4ed
	LGepyYdlzX2aaW7cG9H382/QpsZjt/MxoMKZ5gk7djbw1Yx1LS9S86TQR7323zMfJs9bxpgjqBuWv
	lsukcbRuZls6VOo+8ReQoJpuCPJFNTnbBefeRwCNIhNAOuSINU6c2j/c3WIOh4A6dCgXuF3tC494A
	wT2My0vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewNu-00000007ag0-3qmA;
	Thu, 24 Jul 2025 13:53:22 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetrT-00000007J6H-0xfx;
	Thu, 24 Jul 2025 11:11:44 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-60c93c23b08so1735859a12.3;
        Thu, 24 Jul 2025 04:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753355502; x=1753960302; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1M55MjNHLP2A27D0IMUuTEokYqJMg2OTuUCTRKpy8Hg=;
        b=NZm7270j/VC1QhC4nVdI+k2tJPP1vjbmROeYgxhQsRuMZC5UKqE7ejsBZNF7bpyW1k
         FActOYW/H1Sv6NzHYUPM7CdWAmJ1Zo1g8zvIRBRt7/wFB8CTBZhi10q75Udwp9P5SKh2
         Qx8BboOqJzfQT4MskdVtIASzOBofi/3smjYKoDviQ7hXP9DPp2OZQA0gancAsStVl7nR
         UgCVhMA72hJ+tbElW/nCpXKIYLz+pl92qn83/Fvp1FOQD/xWoX4VogRZMJhg9MDBxPEb
         ZXtgo7m0GWCDajbVqCmiZQlKgVzhLaIXqKR+kCM/DqBL5C0kQ930gyATM4W6em0HFqzf
         IrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355502; x=1753960302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1M55MjNHLP2A27D0IMUuTEokYqJMg2OTuUCTRKpy8Hg=;
        b=NIcmCevrz1yO/jJRIgud5jrdI/IbELErRSPg9PfN8vCAcmZRLyDLTZlYk9F7nSG52S
         jgawiElIkMoGqYH0VfQBkHu6ubcSXdnbWZLeTqdnJYTJDsNyv/kd/dinxQomHJ+XrKC2
         O3VtSn1isQQS3OMMSSd7SJOCeXd2QLzO2Uch8b3uv8fUP3vk0LmDYUFzHw9JLm0royAu
         TBjpAuToSQ3ezJMSP84ri8Kp4YE3FvRlICR7tzidEpx3TbLzgt971F8ckxKJFMkCIeAi
         0uNL/NpS9SOjUehkVzRLDfdc6Zi4ixq9dE7ZEQgkkjrw3aJMEzXmwAvwYSzV5a2Vo11L
         fR2A==
X-Forwarded-Encrypted: i=1; AJvYcCU12VUAvIG/5PccvaQyYY8v++HJ1cLu6sX+EG5+dBuQ4kN4zrcQrZsNVVZcfUjnKp99p7SZUU6wX2/8Ux0d7qj+@lists.infradead.org, AJvYcCU5Y2BiWf4xbeN4PcEscIbrg4ylupvOWiCE5/nz2KGQ2Tjo1IK0qXc1dlkdW8EKVOg7fjkiLFs0ZpUVYCcMIeg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0cV04gx6JO8iJgXo/Rl5zMYkbn+bZIndJQg/yjmI99cGdlymt
	61CkH8vdkl13D9PLfo9wyRAWZCsUeS+L0zCB0HDyfE+tOMMcFbH/mc7uKWAqjAazlo5bK+UTtB3
	G02wQa6BzvZqQoqKejwjO8sFLTZqnDwQ=
X-Gm-Gg: ASbGnctWzTc8b/lRJF+WxG2mi/zpdqxFziVxmUDbsLAfk/eQCJrUzfS2ghJWFAV5FTe
	8x/Cq07OMvXMLQesM2P5ea/9KTzNcqMBtnSnENBs8ChHqP2w+/hT8Yxk84YxuKY4FF8aSJghifu
	bv4xHWYAprS8GV89HYSHTx7cG7gNNTuSaJqONe2m5DKck05q2rfWEaiygOnIZvntQvn/z0ubjDN
	+siuQlIBg==
X-Google-Smtp-Source: AGHT+IGQZoX+LT1IzNpJkxMjSxSTE0HFrqyLNxJY+NiaWstSlkBVLBDC3jnocxQOgR/J/b6wSO0Ggtf4mqZ5QLUuoio=
X-Received: by 2002:a17:907:724a:b0:ae3:6068:235f with SMTP id
 a640c23a62f3a-af2f8d4a15amr677213666b.48.1753355501419; Thu, 24 Jul 2025
 04:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-8-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-8-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 13:11:04 +0200
X-Gm-Features: Ac12FXzgEQ0Ku4jr2sgSveo2Ph25gzNpv1tdxFI9mpW2KmHkqCwhSh2Uki2L2dY
Message-ID: <CAHp75VdMmfV=z75K9AmB7GsWV8C1bZPLGi33duTCt+CM79spJg@mail.gmail.com>
Subject: Re: [PATCH v3 08/15] pinctrl: keembay: use a dedicated structure for
 the pinfunction description
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_041143_266574_FC4035CF 
X-CRM114-Status: GOOD (  13.39  )
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

On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> struct function_desc is a wrapper around struct pinfunction with an
> additional void *data pointer. We're working towards reducing the usage
> of struct function_desc in pinctrl drivers - they should only be created
> by pinmux core and accessed by drivers using
> pinmux_generic_get_function().

Any link to the discussion and perhaps an updated in-kernel
documentation and/or TODO?

> This driver uses the data pointer so in
> order to stop using struct function_desc, we need to provide an
> alternative that also wraps the mux mode which is passed to pinctrl core
> as user data.

...

> +struct keembay_pinfunction {
> +       struct pinfunction func;
> +       u8 mux_mode;
> +};

My gut's feeling that this type of construction will be in tons of the
drivers, perhaps better to provide an alternative like
struct pinfunction_with_mode {
  ...
};

Or even with variadic arguments... (just saying)

--=20
With Best Regards,
Andy Shevchenko

