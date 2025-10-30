Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCD6CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 05:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tq0yxGv6yRvwde5HLaH1HkY7PXCLMaOxQayqcCSGMU=; b=xWKOQBD6s2JlOhkYMX7k2fENOW
	3briUHHygrHtR3X1X85g20hWCmSIlrijZKxnpS0Cq57pmrNXeTWtBmvxXdUNLRxnCB21VSvR1nLnE
	Y8fZ/o0MRaXoFQDXcW8ls0yVvPpkR4GK/0/0cnX7V8PnvDkZKUVQTi4C2x1Mn2P088Uvdc97EhC5f
	NeFcwG/jybXlRki0Lgz2i4LKrTaMutdqV0FUts5z/1Vxjy7NQc4j11LFXf6OfHMt9+qJEIKDX4Soc
	Dr18uXFYC/9jmHm0jsNa4FgYNVaCHUYvYVwmGvttC7Jk5CeeUHjFazCs3aTimzFP/Soi0lMJbXRcX
	C9mAKUAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEKzK-00000003UX3-1ECy;
	Thu, 30 Oct 2025 05:14:18 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEKzI-00000003UWY-3GYr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 05:14:17 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-63bad3cd668so1083047a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 22:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761801254; x=1762406054; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tq0yxGv6yRvwde5HLaH1HkY7PXCLMaOxQayqcCSGMU=;
        b=baAL80u28zeiAkchcb5kO6fS4SJOtRfuRccfTz5cTLuOHamt0qVT2QkuX7IzNO+VtG
         eQ2ARgf9muuOhJoFYclxF+4GfZxhNffBV+NTwsMTvHfADvLqGkM7y2d4tU/+5TP0C1yL
         K3Zu6YwjCnBFOtKkCokwb3aMR8wOydW6K76RqLuGDaTWZiNdlQnVnazT3w0MyDvskCxm
         hEwz6LslpzPFny0FMPpM6twe0hs8TJEOTnSnd+arkW16zrDXgySfhFnYKNVqylmhXKJo
         ISbFkxaceVXm3dk0krSMkeE9sobE2P5rDm7z4lcs4gGsyM5xZZ83rue4MwvvITDmNOcD
         huYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761801254; x=1762406054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tq0yxGv6yRvwde5HLaH1HkY7PXCLMaOxQayqcCSGMU=;
        b=j8D9yF55nGwDAx8K2evVZceGuhUjRDTMLE/JIM4LjAtH0m8iSgwXNlyyGd15XfTwV6
         HWRnC7OhkCGmBJ13XanUC0v/k4tpF7M7Zdq+ewYm/mouVc742op6HDoCBe60tQeC9aJW
         GcI2cZyg9vsOmtIcqr2DW204d2JUpim5ypVsYMqPjtoLv3Ak3JUfLMQBmfUF2qyoeGAI
         aPCSPa0x7wVH71nDw5iOvJfycY88fvd2MgAQogv3gSvlIGIvEGnKGqjuzqJX77b60PVn
         WXAhnmG2j+/jwD9gbWy7Gpy9hF1o313fyWe+vIRaOpd2Cy8tuGcesXmC6JLjXCWbqFPg
         BUbw==
X-Forwarded-Encrypted: i=1; AJvYcCUpa707NsvcGWiXjYL8O0hGESV32YOYCHXhvytVVbOfyQBg/ggSg23oj3B9+/LKgUf+OY1pFWMfb78ET9wJHD7s@lists.infradead.org
X-Gm-Message-State: AOJu0Yzldb+Eyy+885R3QaUknKhPXlI+E9u7rAWtmx0to7uhqhyeADwR
	oHlA2Bwaml4jNpFcRJv0XW7jlv+30VirfnAJuWCCCeCpaZSuMRP1G3H9x9rF3ticFP4MuIfbGl0
	p+0IUMHAFBf65k3bzCY3g9x03PoFdec8=
X-Gm-Gg: ASbGncv8DzFhyu5H8MQtPgl+En428WazUu1zsq2yKVcNBWNDKIBUI6/JSlDMp7jY+bM
	d1Z6kysbV0yB1GNZfrGIB7uGf5sBTSt6zIM/2yyaIEI05bCWyojh8lqTxOB1+L+oDQOwzKEfX9X
	IyPQNprUmd8N2roKTGU399qNIkjGm3K6tiracJtaZ+yK2dJKXpZ39FPO3XfSCM/qZ3VbbV/3aRf
	62DQpvuMwco6zJ/5MvV/Amltor81P24kDaVt3I1J/ookL1L3iChCPqs+hY=
X-Google-Smtp-Source: AGHT+IFDCMfSXrIL3bjIKZw2IhpHFG1U5RsQXDbZl1lPFfpuAvA594DxUOaln1JvXCqNQSfMK0dolS63NIEWPJif8rE=
X-Received: by 2002:a05:6402:50c8:b0:63b:f3a9:f5f1 with SMTP id
 4fb4d7f45d1cf-640441c2092mr4444447a12.14.1761801254315; Wed, 29 Oct 2025
 22:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251028154229.6774-1-linux.amoon@gmail.com> <24319a9a-ccf8-48a9-8b5d-3a846976afcd@web.de>
In-Reply-To: <24319a9a-ccf8-48a9-8b5d-3a846976afcd@web.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 30 Oct 2025 10:43:56 +0530
X-Gm-Features: AWmQ_bl9cBL27Bidm95xNfiwXFieCJ3byhHw0tTbL2X_4Wmj8VImOI2xhqIIeMc
Message-ID: <CANAwSgTO2s8LA=e5CVYnpJ95_DLdkiot5Zbz1hFaejV=kTK2_w@mail.gmail.com>
Subject: Re: [PATCH v? 0/2] PCI: j721e: A couple of cleanups
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_221416_845275_87C3C05F 
X-CRM114-Status: GOOD (  12.21  )
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

Hi Markus,


On Wed, 29 Oct 2025 at 01:21, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> =E2=80=A6> Changes
> > v4  : Improve the commit message.
>
> Would an other version number be more appropriate for the subject prefixe=
s
> of this patch series?
>
Yes, if there are some more review comments on these patches,
Or they get lost in emails.
>
> =E2=80=A6> v1:
> =E2=80=A6>    dropped unsesary clk_disable_unprepare as its handle by
> =E2=80=A6
>
>              unnecessary?
>
> Regards,
> Markus
>
Thanks
-Anand

