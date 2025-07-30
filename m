Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C66DC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCufAOV94HIMKHfZVdb3wjn9NSi/Vfyn02LpL1/VMoY=; b=R787DKbgHkcK3GY/rhPBoIKt0b
	nbTE+m4RZVFDiIPneDac6InW0K4bvpKgTUtYBpLxOJmGuvh5XMCPs7Bq28aKKjeJ3ajyU5VNFlXtz
	ES7JsqHUhkNTQGefHziBacDxeARRXeJqo/tQxuR+15lymRfV/hroM9kNnY3QjXjMKkR0gc6IN00mE
	Hu15NlGGs4seLEIPBJbUskYWMtgIGYYTPX0optyu5MNiuEtb+1WSjcINlQfSXczlgm3vFBQjh2MK+
	WNIK8AowGd+OkwGZuZUVd1A9k/oHGIpXIcuLcb3ryj/3EW3Qz8nLFrjU2cOD0VRuQoNsHPh0GZCxX
	FsQJ8rqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8GV-00000001nOT-3EYi;
	Wed, 30 Jul 2025 14:58:47 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8C3-00000001n0Q-336X;
	Wed, 30 Jul 2025 14:54:12 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-537a0d384b2so3054615e0c.2;
        Wed, 30 Jul 2025 07:54:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753887250; x=1754492050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCufAOV94HIMKHfZVdb3wjn9NSi/Vfyn02LpL1/VMoY=;
        b=PjJ2V+XUI7uqzAZdd22eDPUEyaYx7yoNJZKvggq5AiFcEUD+Cgc4Fk2TcAxmVs3Wkw
         5DOVlMNP9r/jDKZk9bGyNeizGC6mCRymFl2bqMwssliUueKOsKK0wd3fu5SKz0IAJFQC
         geZBvclLOvK+zghonx7pvZbT5YrAbt6oKt/sPrRxaIkS6gUdTYAndsm8I3P8ljbCQ34S
         SpR5qsp9ex5RBC0Ny2ueHPeDp6/3529CsJQTLTsnrmeobX0kgXhG7bXUPlhcDrmMg2vg
         hh1rslxbKaUttgbWCfX8PuywAYyvseUUWKTjmOow4/cf8Qing1nJqcEQLAnqO8yRm6TS
         R/6A==
X-Forwarded-Encrypted: i=1; AJvYcCUh8mY0FSwOdL1DTkEWTJ8oi5Jn35JOyUYKHmNqCJTny7FenLBIC1Jo2vaWBlf/rUycNaTsv6EqQvsbYGe4PKcP@lists.infradead.org, AJvYcCWzTGBpgZJuQgumR9DGN4c4iS9D1iWyi/KgDSW3TxEDG9oLhJyd7ceG04rGWLBvh7RYLkvK7Az5Axs72vwg2Z0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMARuYlEe8Xr7+MasmvuxhKqJg3p7fCY3E/nYWNB5SM3EvokDr
	NY2xNfGma6VMYSkJN9itYIqq2cL8GnD3BXSusL2R8P+P97cJqskiTQ7wfOq5SxuZ7DQ=
X-Gm-Gg: ASbGncv3NOW4zJqb0XAZHmwSxTRiFMoxGqbUdVwlBy18YIj1SHcWDzj5FJ3bNuQbtOX
	CfjYPDv5Sx7XvrsKS92L/Te64u6RkoxfoEOLzJUCNlNI+IHaC1y/5DQ5YMncaNVgkE+jkFCMKdd
	GVbUyBX3BPbdpYNYRrMSmzxcUJeETke4JjJ3C7lscST7lZaF2mNU3dJa+prqSQNFZwy1qyWn6NF
	Nz0aG68+/baN2iR2DrNvi9BlzINEUS80DLC0uL62+5GsuhtmL7mYcQfmw/CG5jI64PT74Bik1Nx
	29hcdbYP20wDn66rJf3QVVj0xI63b1ZXmYQUtowlK2op3HSy2mXAmHyi51XQPNf5INEWbREoO1E
	On9FSRr6n47txJ9Buyi/NIGBvJh3+8lu3IJPfJ4uq3s/5a80VIjg36PcerKonKBcTP1x0kN0=
X-Google-Smtp-Source: AGHT+IGrDQmib4RErKzmd6wMqGyzciLF/q5Q8t1gLuiowXfPX05tkHAPkJQTXbpMnQJFIdRy9M2/Aw==
X-Received: by 2002:a05:6122:50c:b0:535:b383:c91e with SMTP id 71dfb90a1353d-5391cee0f1cmr2520017e0c.6.1753887250468;
        Wed, 30 Jul 2025 07:54:10 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-538e28ca2f0sm2783905e0c.36.2025.07.30.07.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 07:54:09 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e7f367ea11so2922106137.3;
        Wed, 30 Jul 2025 07:54:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW36xhdUrEJN1Sv5bcelzi+PNGFDsIAzLyyNSxxQqGgbL45pqXUpWtk688dVfjHVHUd1BqOfBk44vLZMG/jo0Of@lists.infradead.org, AJvYcCXWAO+TjBeRTz1UD1EXbIj9IcQ439vMKLBm/XXt9uL76aZZ7NNKNVE9YsOo3DQTOWs7EKVNiN8C3TP2VpkNonw=@lists.infradead.org
X-Received: by 2002:a05:6102:358c:b0:4fa:85f:31c0 with SMTP id
 ada2fe7eead31-4fbe87acbd8mr2306438137.19.1753887248543; Wed, 30 Jul 2025
 07:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-9-af4db9302de4@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 16:53:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+fmSPDZ1q0UeWxYJsrUgHPi2+_HC0Hy6TtC+W=kaULw@mail.gmail.com>
X-Gm-Features: Ac12FXzcRmJnrFvnxFG5jsyy_jc5Ss1VNLUefIVdE-6ssqD0s07eH4xzZW0L3Ow
Message-ID: <CAMuHMdX+fmSPDZ1q0UeWxYJsrUgHPi2+_HC0Hy6TtC+W=kaULw@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] pinctrl: constify pinmux_generic_get_function()
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
	Haojian Zhuang <haojian.zhuang@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_075411_764620_32FC7980 
X-CRM114-Status: GOOD (  18.58  )
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

On Thu, 24 Jul 2025 at 11:24, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> With all users of struct function_desc limited to only accessing it using
> the dedicated function and never modifying it, we can now constify the
> return value of pinmux_generic_get_function() treewide.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

>  drivers/pinctrl/renesas/pinctrl-rza1.c    | 2 +-
>  drivers/pinctrl/renesas/pinctrl-rza2.c    | 2 +-
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c   | 2 +-
>  drivers/pinctrl/renesas/pinctrl-rzv2m.c   | 2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

