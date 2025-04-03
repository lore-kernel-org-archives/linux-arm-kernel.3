Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5ACDC3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 07:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJ0Do/5yInpJts5TcS9oFarGP2cYAYOdQDj3i6kaNC8=; b=HqEY/W78Palp/9dgzNQ2zCkXyE
	1nmC9l7K5WG/UpzZ8zDHV/YasjQ0YMm32p1wrupXXAO26KC77bp25529n98ShsZMyuYDTARa3kNsT
	XP93rLYA1SzQiPt6GbA8Lw6CvfAZD0X39SaRjQRT0YtlD0/m0LjHlhvs9dgLjMvasSCHZjlCC6DCg
	8ndnyO2von5Cf5ifci4tpQ7GTBBImQLo0ZrVEO9sr8p5aBZzstKCqrQMd1qZ6KNRLh6dYRU/ZxLnn
	gALntKwsuDPB6cx4eR+pXKYg1L2CMpbMzJzKdSzxrL87IzvJecrE9nqjNdy5IXEnRqV8GOh6AMzs7
	lcOBmlug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Emy-000000084EN-0HT4;
	Thu, 03 Apr 2025 07:15:00 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EjQ-000000083f5-1S01
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 07:11:22 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30de488cf81so5891771fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 00:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743664278; x=1744269078; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJ0Do/5yInpJts5TcS9oFarGP2cYAYOdQDj3i6kaNC8=;
        b=F8Nn1t0kI4zdrHM4jYrcKA1qHWs88R99fkqW6VWB9ZwOgktg3D5fn+wHPNnmsCpT7C
         /Mh1Fmkq2hQTZ0IS1+cXbGuPrDVsfVBqdGcA3UxqVnxjPOg3fl/DB8os0NGdKwcdDu5Z
         Nwdj3NalLFHPaD9B31D7lSJO1moAWCeeDq+lec6ccuenqRhedRYn2JfniUvAGNSeiKfJ
         kQtmUIwITnxYi+0dun/IDkQPqmPdJfIUaNolMQlaBKlxOSSCCjyWMTJrSQSpWTZFRsk0
         yM8yjfczof+ui8hWQ4LG5Prf18NG2Eel3vPUpBcBGWBfLLvZklqerSU8whG4JD6+SJZm
         063g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743664278; x=1744269078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJ0Do/5yInpJts5TcS9oFarGP2cYAYOdQDj3i6kaNC8=;
        b=LXg6IH5xoxCWBReMAL7PlAUeDkMNaNy7tBSfX0/jibli0iVJL2+VGjMOQ7UrToyeQ/
         2AodpJ5Cd5y08wKZ84jBlin4wVl72m3TE1R66d0pzZLnsBvSWQ+4sIFKOFk1o0oRS7va
         0irluElDszk5mi2QLi3PjPu7O+pv9xUzfjGpk19yqdB5ruQE3YXAi8F/fSyWIyszHK2h
         5f1e137NCb8af6hzEFspWxON6cvrC4UIneadqARDpraZxbiV/T4AjVlbEeLlzS0/U5kt
         yBrkzwCVxsyJK21qLoAEg3xtmpPOmT4eOvEuxNGKghmGyjCMOMeP7dl5PTp6uOj9QtEX
         CoSA==
X-Forwarded-Encrypted: i=1; AJvYcCVT/WjMSdSwlhjfzSwr1l6cgxaUASpvDPA+JyLFu8UZVHN6SAJHNKqu/Pw6rPsPjrI4U3uD2Qn4BExumEEkVqXr@lists.infradead.org
X-Gm-Message-State: AOJu0YzNRpiDuiVmPMzF27sHQRRtwFGvpvwBmUkx5J2Lef2/KyNt7ler
	m0FgKMVToi5uAThtmQAHco8SpL97cXoPj/Dk19pVEz3MBcVRIzFtxLJELvRabTAvehX/6Vvtgpz
	+ljIm+C6R23LNG8Ckisj+KLzctflsGIiyJ+RERg==
X-Gm-Gg: ASbGncuw8ciD6TK4pINGgfeIKIHiNrqQ81N+pjdYb8+5tErUvQmtEr14u5JEiN6/lih
	BFliDDKM20/ycuZ+cZY8CZzYJrfntEP/gF1OVO7HMMONNS6cRshhU09DVrA4quA0D4dDCIqol9p
	52U6CM62UpRpIqkDuYkQAr2z1Lx8vGEO/Wpbv4eOmkEkIXeRrxETn4d+S2
X-Google-Smtp-Source: AGHT+IFkpl28huUxLnkOG8+JoZRPAuyoYj8fAmCyXd4tv38/gNFXW7fiJiUp5ulgWcmnVTNmKGEylZ2WlPrLdyIQcMA=
X-Received: by 2002:a05:651c:1475:b0:30c:7a7:e87c with SMTP id
 38308e7fff4ca-30ef91e9c23mr19952681fa.35.1743664277849; Thu, 03 Apr 2025
 00:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250402132634.18065-1-johan+linaro@kernel.org>
In-Reply-To: <20250402132634.18065-1-johan+linaro@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 3 Apr 2025 09:11:07 +0200
X-Gm-Features: AQ5f1JoNoWRTnOEMbH9dyhhofmJuk8_vYCLRQWl_3nQ0kPEBcd2NI2XoNIkV_Zo
Message-ID: <CAMRc=Mfpm8=q1mkfNfjPtogbh1S9PKU+w_2yMP+oE_Gj7-qemQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig symbols
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_001120_419262_87150DE7 
X-CRM114-Status: GOOD (  11.08  )
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

On Wed, Apr 2, 2025 at 3:27=E2=80=AFPM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> The PCI pwrctrl framework was renamed after being merged, but the
> Kconfig symbols still reflect the old name ("pwrctl" without an "r").
>
> This leads to people not knowing how to refer to the framework in
> writing, inconsistencies in module naming, etc.
>
> Let's rename also the Kconfig symbols before this gets any worse.
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I'm re-adding the tag here as otherwise b4 will only pick it up for
patch 4/4 on v2 of the series.

Bartosz

