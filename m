Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E79C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 13:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQ+K7YM9+7vb1XXWZkvn/CJUu3nmvB88QVFZm2AQkeg=; b=xVbkGAH9ut41K23ke46HuxK2gV
	jlm5DmupQwW7eWEV/m33+ZjodsLeIkHtkfmITe0vLhOSIc7cdD+VkGHg9qGuzyo1mqX53G6wP6TjI
	ND+izkpXulfLDqgp7kdV656E+Y8Fdtn/ZTFtB/YFhKBstCD6L1QK+Sa+FPhvtRheC/spALFOUxKFM
	NqPGj/KMX93swJjzOWeYuJ7vhnPkwzfH8iq/LEVZDIA8GMlXKK1dpu0VsZFZtMHVm10xfo87Md4Lt
	POlbkDQ+MlVvVPt4DF3D6RFGeEj4/EEYN0BtutCoCIZn2CUiiPXgpN8GRZHvEa7ad2ZGxuv3P2W2n
	kkqCbNvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twhsW-00000003FsX-2kqX;
	Mon, 24 Mar 2025 13:30:08 +0000
Received: from mail-vk1-f195.google.com ([209.85.221.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twhq8-00000003FP0-1Kuo;
	Mon, 24 Mar 2025 13:27:41 +0000
Received: by mail-vk1-f195.google.com with SMTP id 71dfb90a1353d-5242f137a1eso1867842e0c.1;
        Mon, 24 Mar 2025 06:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742822859; x=1743427659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQ+K7YM9+7vb1XXWZkvn/CJUu3nmvB88QVFZm2AQkeg=;
        b=C5FnE1fVLPC7Ce491GaXQq+9J+xqqLw+VvzTe+n0BBP9NfTWJeAjlUxAytW3VIgeF4
         OE1XyjAyQ8t+3lI4LLYh/RhAeylIXPx82hzetIRKYDbx+mtGFhMBOSSPm1fC7hLfvjig
         27viPXtCCHT6I80VHPg6uCP8kdITjVSeN/nPWIGaB40utmZn8uq9LAE7o9LydaawlVnR
         ipJTwhm/IQK03uVG2PfrhsqVHU6bP4rALHR8QVxVd0hEjjOVkSDCNewgXylvfH/YgqSE
         NvSmx+9gzO6yIHj/qoEQGfgbeBErPx14A+nDgyldfDapvbxYtLYA8qeduCOVuydXSM1v
         sihQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMdwP1zWo2Obw3yBrfRxyCr+OSjJ0XpbdvsQrWsjCD4h7Ypyl7tYKtrjqycCly6BOjdl3GDiCMkaLiGnXb7i6Z@lists.infradead.org, AJvYcCUoCMh4inCpyWw7Y9Kodk+Jv8i99mTTf3a7h7+Nv2lpEgJ7T7ghLpGONN33pV3ZD1VwkpLlK9M1EHrk3HUvulb+Ig==@lists.infradead.org, AJvYcCXM8Hr2kxC4rEjPcPghh9VQTGfFZNCMmFz0Td5vbevKEnbQJYlN9L9nptJRDVKvrrc/GzvRHTzeECApVaM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPIPZdf4kpq+5tQNnOvmFWXU3rTsjGnjk3jGtLg/uLJyFSlcYP
	GMga1BbMjDlvfqfSUTriyWZUdgCrwnyyK/fS9acuXoY4gibRCXnwnEKATpKszLc=
X-Gm-Gg: ASbGncvhGvydi+u4DeXDT5TJMg7lnqNZexlBBRh+XjofRVNyaTSTf+sP9bF1HL5dfbV
	qHQARqj1LT6EPUWn4GVkJbPaeKCX0U978qwYjmFhP2CzzwlRFncrcy/2sQrzJdkHe2/a/8uqV57
	eRUvSyIa0u7EDB2tUqs5SvYFfPPd81y6D0N5O6SY88VKECIsqTDqhNZ6tjCJfJ/+LYsV7iyIhHm
	EA+8PFRvydGT80voMXaVP99l7uAV2StaC+cEfCgeASQN62J+uRwegDd9148VnkBSMVNtf0FoSCR
	sOFiNFkcIpil0FTZNTcvolnERe50YnIVDtNjIYwGvy1TtQDN3QtamcOSjCni7K8zkBR+5467G/A
	DW1Z2BPI4aAg=
X-Google-Smtp-Source: AGHT+IHXO00gll+Oku7ZuA9r5mInvs4X6hXzQbJKgl2WimdDaBB24gVtdAEP1KIB+VJptqivhL8CMg==
X-Received: by 2002:a05:6122:8c04:b0:520:4d95:1319 with SMTP id 71dfb90a1353d-525a833b9cdmr9249980e0c.4.1742822858938;
        Mon, 24 Mar 2025 06:27:38 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-525a7362f71sm1400256e0c.7.2025.03.24.06.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:27:38 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5242f137a1eso1867838e0c.1;
        Mon, 24 Mar 2025 06:27:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjglXYyn6QFoyvDylLv/bToQEVdMxbFF6FPp60LulyPAzIM3rhvC9OYCN6KW35Wh90YML1r71TOihbj9VeKMKWAg==@lists.infradead.org, AJvYcCVwuDAEp8d8IfY6YA1JaF56XEOWbAGwHPHyAiyAiu6eGpJrMMuC3xrUjBFQcRrJ6lOlYZDmr0DLuVoH4AcqTYeG@lists.infradead.org, AJvYcCX1U6RMXH3r8nediNGsc48RDR8oLm9S+aPRi+yctQPGiEQXA3eH7Bfiucw9GXwURJHZPur6BLjBXZZmAEI=@lists.infradead.org
X-Received: by 2002:a05:6122:210e:b0:517:4e40:6838 with SMTP id
 71dfb90a1353d-525a8519f0amr8262190e0c.6.1742822858639; Mon, 24 Mar 2025
 06:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250324125202.81986-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Mar 2025 14:27:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOND_TJqGckmGVB2jda=xxZmY8C5q-QAzvztcW0yPuMg@mail.gmail.com>
X-Gm-Features: AQ5f1Jqy03btuV5Gp3EW0QPI3_1fSYM7sA6rvEy343cRRLCgBG9ZP_0N-abJFTU
Message-ID: <CAMuHMdXOND_TJqGckmGVB2jda=xxZmY8C5q-QAzvztcW0yPuMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Tom Joseph <tjoseph@cadence.com>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_062740_356200_0A555A3D 
X-CRM114-Status: GOOD (  18.04  )
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

Hi Krzysztof,

Thanks for your patch!

On Mon, 24 Mar 2025 at 13:52, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.

+ While re-indenting, drop unused labels.

> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

