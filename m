Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1D4C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNonWCq6tQmbQ5Q8JG6wz2OIxHKwlgX2o++VTeBoqTY=; b=ZVphG+aStlbbSYzaTSTTx6YEcD
	VHZZ1rwi5nKFGRm4OJNwK/SamoiwVq8J4YtJ7kbmtlyX7xytPYyD0BJbzCRrYAVnC+A0yt9TJAjoz
	TOsMQ5knnQkyWpIUDKdqWQj1730gBlFC8/Mqufwyjaa2N17WQcTzTwyWQ+LibETVaMch/Upu9IDlx
	yEb9NRNY6Rw0vyH1gEth67YJk88Ty4upc3iT0g4xJffLK7W65uQCn1oUFUJsOynvL2XlPnpUwNP48
	EUU5/CUXBEuL/z5grSkZwi/u0dha2BSlko7SGCzYAJqpV7Z4X/Hx4+icTud22vqtV0flVDfwLX0Uf
	RDMlnLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnng-0000000EEkW-1Nbd;
	Thu, 12 Jun 2025 19:41:24 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhni-0000000DM0a-19pq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:17:03 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2ea83f382c3so511488fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:17:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734220; x=1750339020;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNonWCq6tQmbQ5Q8JG6wz2OIxHKwlgX2o++VTeBoqTY=;
        b=wLwKyixV7mDe6MfntgxwMObbtxPQIDF0PnM2/e778DJZJSsxyCgWriWP3Sq+nNkENU
         IbrajE8AdkNIHVuWCux18GsCX2Z457E1ITU4WX7r/PNdaETHc9aSB3muRZEih65KUTFR
         tIdrPvzdkoSRfjZOP+U2fYESDbsm8Kvkaafq5+vihUySKcm0uwJS6dFSyAf3UqLkwGzo
         Ec/IJF3QgSkcQo/7HPcC3TvyXrbSeaQj3i8tqy0zW+yPbh9aVeDtsehn781ofb/fEGpL
         6eDsS7Bm2xKuP3PWJcAxhC4zGp6JXEPZlNm2uQ/QzMcvOyxbbhwCBqRKIuQwwkVwjmh+
         4LLg==
X-Gm-Message-State: AOJu0Yx+IlEDZJA6E9/NkfqFSCpyzOJu1r30byY4/PdGFXZ3nTqQMeP5
	md/PCTH06SAyuJ9ORfUtKqV7FfvJ9XWpVKlXzWHkr0YbInYYkAoR5txYXrzrZVi8
X-Gm-Gg: ASbGncsLdXLplI7IxfIwgG3981Bjx/r2apfjSHJvfAHglj6toKKM5MZ00il0ldBWvzI
	j9IhsOE80mxQok1qRQU67jO/8oi/SYw+Aiy0bKmUwqtBSh1nREAlYD+FCjyKYT4dXQzuOuC+LRK
	36vKqnKfGSZmsIDDm2tGuAigRIc4x53WW/QZAQ2JC8HkLb3RZ36cED0yTi4UJIsUo7lqsylfo2/
	Vj5r/1oMGeCxlyD7Yf3Juyq9vGYIwCNDciDii8kCF+a0Jv39gDagd2RbduIbFKMYANIeJ9DTlLI
	iaCpwVEV0kO1Uut7jAJJcqWg9bFsaPy1Q/tyhhcobhc0a+ngqdcgDwbfzuPn14/pkxJ3PJjZVEp
	GsCfrkVn1/XnDlSlI833JkBecxconhuMneTW77EU=
X-Google-Smtp-Source: AGHT+IFk8ArhyOImHfyffgXEWrPyrHHNKcBKKLUpYZJHH4LGggFr1FjPOf8jZ9rhzbOtX3mXoO2LrQ==
X-Received: by 2002:a05:6871:80f:b0:2e9:d485:5ad4 with SMTP id 586e51a60fabf-2ea96eff091mr4780801fac.33.1749734219697;
        Thu, 12 Jun 2025 06:16:59 -0700 (PDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com. [209.85.167.180])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eab8e6cdbasm290999fac.38.2025.06.12.06.16.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:16:59 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-407a3913049so481144b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:16:58 -0700 (PDT)
X-Received: by 2002:a05:6808:1794:b0:406:6e31:18a1 with SMTP id
 5614622812f47-40a5d05f586mr5488096b6e.2.1749734218150; Thu, 12 Jun 2025
 06:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250607194541.79176-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250607194541.79176-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 15:16:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_89naftFMo881zp=7QGJDznFzzqLQ-kLEuyJ=KJWQnA@mail.gmail.com>
X-Gm-Features: AX0GCFuXLlnarexsZjEK1q0rakNUWi7gsoLxdkLO2FqaNoBwunA3MuELiFSEafs
Message-ID: <CAMuHMdW_89naftFMo881zp=7QGJDznFzzqLQ-kLEuyJ=KJWQnA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl
 driver for PCI slots
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Anand Moon <linux.amoon@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_061702_314030_94693B81 
X-CRM114-Status: GOOD (  23.27  )
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

On Sat, 7 Jun 2025 at 21:46, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add the ability to enable optional slot clock into the pwrctrl driver.
> This is used to enable slot clock in split-clock topologies, where the
> PCIe host/controller supply and PCIe slot supply are not provided by
> the same clock. The PCIe host/controller clock should be described in
> the controller node as the controller clock, while the slot clock should
> be described in controller bridge/slot subnode.
>
> Example DT snippet:
> &pcicontroller {
>     clocks = <&clk_dif 0>;             /* PCIe controller clock */
>
>     pci@0,0 {
>         #address-cells = <3>;
>         #size-cells = <2>;
>         reg = <0x0 0x0 0x0 0x0 0x0>;
>         compatible = "pciclass,0604";
>         device_type = "pci";
>         clocks = <&clk_dif 1>;         /* PCIe slot clock */
>         vpcie3v3-supply = <&reg_3p3v>;
>         ranges;
>     };
> };
>
> Example clock topology:
>  ____________                    ____________
> |  PCIe host |                  | PCIe slot  |
> |            |                  |            |
> |    PCIe RX<|==================|>PCIe TX    |
> |    PCIe TX<|==================|>PCIe RX    |
> |            |                  |            |
> |   PCIe CLK<|======..  ..======|>PCIe CLK   |
> '------------'      ||  ||      '------------'
>                     ||  ||
>  ____________       ||  ||
> |  9FGV0441  |      ||  ||
> |            |      ||  ||
> |   CLK DIF0<|======''  ||
> |   CLK DIF1<|==========''
> |   CLK DIF2<|
> |   CLK DIF3<|
> '------------'
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Reviewed-by: Anand Moon <linux.amoon@gmail.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Bartosz: Any chance you can apply this patch to an immutable branch,
so I can merge that before taking the other two patches?
The alternative is to postpone the DTS patches for one cycle.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

