Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E14BCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 08:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rt1zvt28at9xm8W3hs03xIo0raGpVE0ymzecLcbUr+c=; b=SkQTyrHsTzsRD9oNNtzcFqRsrH
	UomYw1Ziwn/aD6Og5HXgIuWq+G9K3VPvDU8ymTVm2kNdB13oER9Ar1NFZgtQMFkwRioRT7Obj/Yn1
	KzQLkrH57ODavWvQqSig/PadnOGfjpq0g/TpeICsOqJfbEkx/ZRGLO/Bu7uPtka8nnGxRjFoevJxN
	gQbQQROd/CdzvAQGkF0ZTigtHnqMZiV28B+qhgmr6S26mW3RMRdqyRElfWxmqv/7hgH0xzpSgxKIe
	9gtC9tlbEzXei2jbCsXIxsV8esSo677W5pUOX/NsN2XYLM5N35gELqqxOL8iWfCWfkbaAK3uxwAbW
	MdLSxUlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCZml-0000000B7oc-2cpQ;
	Sat, 25 Oct 2025 08:38:03 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCZmi-0000000B7oB-2KXt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 08:38:01 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso618913766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 01:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761381479; x=1761986279; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rt1zvt28at9xm8W3hs03xIo0raGpVE0ymzecLcbUr+c=;
        b=cqWdRaWZN2xalR5EEFoSmdxhJqybNmBZm0qbjc3hx8ensKGy2J6jjP8nGFH5dX0Ezy
         W+Vx82/HleGQMwVm/EoUbI3Gra6w+8r2+HMWjVBPJxpypp413wnANiksYzhpb/og79gl
         LYfpLDuQXuytVNgeIQrFydLzACZ4OQ3Z7aZXy79HBdbvANwLDBZt6t4xEbyoy4ETyP43
         MU/xebTRCsASdKnYMRguzboUNYu9oBwi4wJkna9ZQCnEHhV1UkK5Iqr4bjlk7Qq7yiHG
         BhLJe7RvmliKnJeA1ZsBguslcWYuLYhKxXh7/Ol0rZX6pnN7FBuULeHFFzQsxLBu6edh
         H29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761381479; x=1761986279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rt1zvt28at9xm8W3hs03xIo0raGpVE0ymzecLcbUr+c=;
        b=DNEGfu89iT1KikAFC+j7/sd6OV/SjrUPTLwLxLrlfiVKms2QBXsN4K9683mnHk+lyA
         +XoITKO/+mLDQx0eBAude/2VmbSW5gaht3bo4beUNag0TrZD2mDcg/OZvHpu/IGwhIfJ
         /Zzx59bY90jOxYBgg2sQ36bukg5zvsQnptiy/H+XVKcOy/4VKe088rSzluCLeUM1MuQA
         /bChRsfqk5eNXCu5yQNQq7qtBGyzeucw1TjE+NYgXPgav2HoGvVvWJxvBFvlKLZYDF7K
         cHd8UWj1GAvzsDVdFuI80ULFeyS1wmXRhNjz2konnvcfVyUo1scpibJQjATOfPCQ6V6B
         fTYA==
X-Forwarded-Encrypted: i=1; AJvYcCXdS2mWA0jW7erEiZN1db/NzblfI9HqdqNIMZ2VjpFkaocJPbglEJ9YRrTtGceVNwC6XmAHi23NBk+DvBXfvRaQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0mwqjOtFcw/NdvtcLPShvDwilagK5yNfBVjydlTF5uXYdFLJ9
	0X7IyKJr07vvhlxw5A9okPdgoTP6rCmMpa7zI5OUBZGqw7BEWasaiNq/X4ZI+dslIfhql5X6tgO
	BVONS7zCoPKogqVOJHPdXz97kin4cRZM=
X-Gm-Gg: ASbGncsFqFQ1IvDFFl8t1dWb1OE6dWqDAnb5yF13+6N0NQOheXCZDVxGuvRh6pYwd9G
	95lxcRDFeYcAzacTSEH/MIs9ME4TKvwH15kIvXACNBYwukqvFyG7HR2yVk1usDJS0Wv7Xe1Kf4a
	zijg4dbme2RHx5jNjPrvnOgrqtVZ9ytU2V345j3clvI5kJU0C7Po3oQ3BMJTTW739Lqag5/4zLM
	Gr9smSB2UNEVmPE++OUc3BWDH+xfCwA7vtgiJERbIVW/tczvJZbCVKQS/m+qMnmtcq71g==
X-Google-Smtp-Source: AGHT+IFuGX6oiN+VZCvXlLc+k6tnFhyAvGLZQt/w/4MWDH5uLaa7YRkpj3wZ7I30zF9rslJZeftdwUUg96dShS04FjM=
X-Received: by 2002:a17:906:c10a:b0:b57:2c75:cc8d with SMTP id
 a640c23a62f3a-b6d6bb109d8mr624666366b.14.1761381478518; Sat, 25 Oct 2025
 01:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251025074336.26743-1-linux.amoon@gmail.com> <20251025074336.26743-2-linux.amoon@gmail.com>
 <e6f4f3c93cfc2f18c36da10d3f86c1a50ab2bbf5.camel@ti.com>
In-Reply-To: <e6f4f3c93cfc2f18c36da10d3f86c1a50ab2bbf5.camel@ti.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 25 Oct 2025 14:07:42 +0530
X-Gm-Features: AWmQ_bmQGviTXIcOd0mClyWfGzAI1T_FFNMyLfzBY5L8A_7DMNQFG7wRa3DtwXw
Message-ID: <CANAwSgQ2PH1TJLEBVPFJ-RdaNFxn=eTzRYfEmbjx=EYq_YOeQw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PCI: j721e: Use devm_clk_get_optional_enabled() to
 get the clock
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, Markus Elfring <Markus.Elfring@web.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_013800_614882_74EBE80C 
X-CRM114-Status: GOOD (  24.43  )
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

Hi Siddharth,

Thanks for your review comments,

On Sat, 25 Oct 2025 at 13:20, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
>
> On Sat, 2025-10-25 at 13:13 +0530, Anand Moon wrote:
> > Use devm_clk_get_optional_enabled() helper instead of calling
> > devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
> > the clk_prepare_enable() and clk_disable_unprepare() with proper error
> > handling and makes the code more compact.
> > The result of devm_clk_get_optional_enabled() is now assigned directly
> > to pcie->refclk. This removes a superfluous local clk variable,
> > improving code readability and compactness. The functionality
> > remains unchanged, but the code is now more streamlined.
> >
> > Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v2: Rephase the commit message and use proper error pointer
> >     PTR_ERR(pcie->refclk) to return error.
> > v1: Drop explicit clk_disable_unprepare as it handled by
> >     devm_clk_get_optional_enabled, Since devm_clk_get_optional_enabled
> >     internally manages clk_prepare_enable and clk_disable_unprepare
> >     as part of its lifecycle, the explicit call to clk_disable_unprepare
> >     is redundant and can be safely removed.
> > ---
> >  drivers/pci/controller/cadence/pci-j721e.c | 21 +++++----------------
> >  1 file changed, 5 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> > index 5bc5ab20aa6d..b678f7d48206 100644
> > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > +++ b/drivers/pci/controller/cadence/pci-j721e.c
>
> [TRIMMED]
>
> > @@ -692,7 +682,6 @@ static int j721e_pcie_suspend_noirq(struct device *dev)
> >
> >       if (pcie->mode == PCI_MODE_RC) {
> >               gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> > -             clk_disable_unprepare(pcie->refclk);
>
> j721e_pcie_resume_noirq() contains clk_enable_prepare().
Ok I will drop the clk_prepare_enable and clk_disable_unprepare in
this function?
>
> >       }
> >
> >       cdns_pcie_disable_phy(pcie->cdns_pcie);
>
> Regards,
> Siddharth.

Thanks
-Anand

