Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E13ECA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0QfRj9jvOthmyPm6ramOPb3vkM0waaC133mmZ4sCqQ=; b=HLvtyaBWrgZsXJVvBDWJzZd/Xy
	LeG59JSjiL80NdhEvQcuqHSK/wZoSrsmFAAh6iTm0Hcg1sAFm6J7iQMDOI9SFd+00RczzlD6JA42o
	shFXOGI9FajgkthyJ7DVTEBMpl8EkzZ+ZT3KdGj24HwIlKQ+GZdK2CwO69SmFa+ugj57brYFRnpFw
	S95Gh0/jmrKeemauXpivTkPN4B5H8z1WGzM6YanR4MO4/9/m6dyWkdnuL/fwzL5hjVLXB3v4l2G7+
	85EZnxCePewT4VkhztYoRpXA930w84hElT2K+LuKCL2ODAKWw7BdOwUfHmgenV1N2Wmcn5OQTR9Qh
	AOn2Lhog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTUi-00000000zaz-2an7;
	Fri, 05 Sep 2025 10:16:36 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRuQ-00000000PCc-02Uu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:35:03 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b0431c12df3so323761866b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Sep 2025 01:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757061300; x=1757666100; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I0QfRj9jvOthmyPm6ramOPb3vkM0waaC133mmZ4sCqQ=;
        b=N8aI6JzysbtGgfFJEtIwNgp4vO798KDABAJZYGUhUM6VIL6R3D7G6m6mHVS5aXxpU0
         +vczGeaHaC4PK2k4RVE7bBP99KEOghptsSv00dNDgvfft9i2QlLMHVkvWp1LtfMCThE/
         9XeB3xVsa1YUOwz7mvXLA/VRXUft0xCNTc4uF+O8RlAF1+c+877CisVzP4vprIxIuWHs
         d7ZCLzPjsNMjt/zU/xiDemNsxwAZSxorFt+Ikqtk2NJsTeXrgMmJKbcF/9Qm2/stmjeS
         p6luwEVuOIqtjt9v8uO1LfCp1KjwbE/tJb/pjYUsP8GxyqVWr0WNxBBAIN8khRLHjKwl
         SJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757061300; x=1757666100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0QfRj9jvOthmyPm6ramOPb3vkM0waaC133mmZ4sCqQ=;
        b=OppXraCxGEujZAwcj2NWt7I2tXkOJC/KjPYBH4q6bbk3E3IprTDVHpgmucD6ZRAGZn
         JcUZCDc0tR9WZ++sl9WINqA0PmgE2seChltbA5nVNTUnvHajmy4G5BFFaBTXcUuppjyZ
         BTJngbAszn4MDqJXQ9SuDMzQm8prB6rvxP/AYaMU2QbY6Uv9J9ngikMkXKVkPxOxgwiB
         Ft4UJHARaeghBaPJ7A/GsCTGKPHYWWGmsvmTML5mRaKPz2FI7Hvnaq4llzG7zydO4jXH
         xPGgxb7shdDnJrk64pkYEioPA/puCTRKWY2pN/FVr7MSXi7zFXixHFVh98GM9/Pg6PBE
         rJYA==
X-Forwarded-Encrypted: i=1; AJvYcCWTuKO4h5o14m3Fuil7oWUFUkw6Ce4t79jtaxFHnhAoboaqsHcnfi7/YqOAUeVSaFZX+HzB6m9AxGe+p5G6q5M5@lists.infradead.org
X-Gm-Message-State: AOJu0YxBIu/KkbTfcw8m86uBXCVZDEaHb38RO4OuAdcuyp94/99NmrR6
	UN10DhbGwr8R3bjyqOk3vqw15AMRQUx+qaS/W/1qFx6i+MWAf9NeFcyV3hFsRQOtuuA=
X-Gm-Gg: ASbGncuNc82uY/+T5zTzmzyE/10SDKziYxdZHMt9WlWOci5G4sFCXmCFg0RzyE/vfga
	XPWjl9DEndRvg4WFbWvpnnZtdyGx19gcOQcyO9VpLDW3v55tqRJXPHxWKtsupc7qozr+jXcual/
	e2aaCk62UjpumtlCaspTDYaoebVxakgR7lyAxhYY4hb3eUzoMTndeyq6aET9eJwKxkhKAwVKzfo
	TbJqRITLVglkWWm6/rcuFUrgn4WXt5xAsGZ+CvvuRhO2xCI/7nfRtpKEVXoFwwYraFVkrB9w4Q+
	plipph97iP+FxpadRaH2y14Rt7S8itZtMdLuQ6Zh+IB8wGslauSUgBMxUd9td7Xo6Bmbkl+qxEQ
	awE16hrIq1ERYCmlsjgEcgUVGDHZDRzZ/aJ/LOzssUbz4yqq0Z3MxulE1u25JhlgwW/LWpXStoE
	E9qRlYfAD3OkJFDQAtDirI+mI4sqECzOLE2LAsBijnvQs=
X-Google-Smtp-Source: AGHT+IGMvV568alFhaO1aRFyGGr0BaG+pxGIbUoe47SM2b+PJhzJ5Zs/nWs2YwiwF5F4lh/jU0qAbQ==
X-Received: by 2002:a17:907:9410:b0:b04:7708:ee36 with SMTP id a640c23a62f3a-b047708f30bmr745911066b.9.1757061300349;
        Fri, 05 Sep 2025 01:35:00 -0700 (PDT)
Received: from localhost (host-79-31-194-29.retail.telecomitalia.it. [79.31.194.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046f2dda22sm541367466b.40.2025.09.05.01.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 01:35:00 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 5 Sep 2025 10:36:57 +0200
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	florian.fainelli@broadcom.com, wahrenst@gmx.net,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, iivanov@suse.de, svarbanov@suse.de,
	mbrugger@suse.com, Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: Add support for Broadcom
 STB pin controller
Message-ID: <aLqhKcsJPB5ymEPF@apocalypse>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <7ed0f2779829f4e63b69d8cf5cedda9f849996bc.1756372805.git.andrea.porta@suse.com>
 <CACRpkdZAROUdz1SJY=h_dcUiojazO1fYxGJ8X2KEE6ow7oFZaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZAROUdz1SJY=h_dcUiojazO1fYxGJ8X2KEE6ow7oFZaA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_013502_052492_777C1E17 
X-CRM114-Status: GOOD (  15.25  )
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

Hi Linus,

On 20:58 Thu 04 Sep     , Linus Walleij wrote:
> On Thu, Aug 28, 2025 at 2:45 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
> > From: "Ivan T. Ivanov" <iivanov@suse.de>
> >
> > The STB pin controller represents a family whose silicon instances
> > are found e.g. on BCM2712 SoC.
> >
> > In particular, on RaspberryPi 5, there are two separate instantiations
> > of the same IP block which differ in the number of pins that are
> > associated and the pinmux functions for each of those pins. The
> > -aon- variant stands for 'Always On'.
> >
> > Depending on the revision of the BCM2712 (CO or D0), the pin
> > controller instance has slight differences in the register layout.
> >
> > Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> Fixed up the extraneous label and whitespace error
> and applied this patch!

Thanks for fixing that up!

Regards,
Andrea

> 
> Yours,
> Linus Walleij

