Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29112C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 08:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5bKkMRbKxlSUJHVqMm4hUmrEWQcNn5FC/pLkQqhEAk=; b=RTE8eaQOvUaDAse5EiQhzZVCe/
	QE+nYvJ+Pw/CgI+LaW19QS043YCIjHA5TNUn7oT9YO5jRL5dI1kvAJV6aU+AKwuG1F1Jqr+ucZ9Jf
	64mJW2hFWkfoMDzrhybkRfy0UVeaEbMKw1UCoYpkxqkD+PJ8gB7YZKJzXsjI3+qJqfAfJzE8S7yBE
	haW8ue/zAUNQ07MU4sBXOWlzFqJCCUzxP7PyAlkrp4haYMWJgTAWNOckv0G07E/SZu9TNKU8H4h7n
	5BsW1MaTyvdOOO0fqRJM9Lmnk6Q2dj8PMqv7hlsQ1QU3Y9i4PEl1hldkTI2E8bzIBi4hSScEnNcKI
	lcV42dTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztFa-00000005V37-1uik;
	Wed, 02 Apr 2025 08:15:06 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztDp-00000005Uie-00vH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 08:13:19 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-30613802a6bso64809911fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1743581595; x=1744186395; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5bKkMRbKxlSUJHVqMm4hUmrEWQcNn5FC/pLkQqhEAk=;
        b=HxiTBykiBzrk6loFUQl7dWHZjpGpZYP2CXbwkEWxQ9Ya1kHMA5b+YzyRQyxi6TaaV3
         erkJU0A/De0VLuxbc0+FTrN/Qk6V35Huw+8jOr66LilpsMKYsrr14Oheu3h/hhlVwV+z
         WljWtvbxWOp5GCP9JJNs4ThDfokuVHQ1GqaWcc2De1F3f8Sa0/8MgpkGvTgOCIJcLrzU
         3SuWK6ShLnCNbB7brzXrqzoa3W9nwo/5n2mRlWGMaJnbUNg00emedUCZOkgLKqnTIhjs
         T4d+Jzal3h5dWlgd3hRwXEJdZZ7B48wIW54FdpNUEI5FMPInF5z9TtQobKDQYdRqbbx3
         IUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743581595; x=1744186395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5bKkMRbKxlSUJHVqMm4hUmrEWQcNn5FC/pLkQqhEAk=;
        b=kKKRPJ4tObmeUUnMayY7ivxbIYpFUNERaDBfTbJ9jrOBkOVuQP8HcNniguClmosOr1
         wV9oF+EPffY4ovCmzOuTgid7GQk+PxHKKatwb/RqQDnm6MYY9a43TprxCCSaf9rth3xM
         agftmQV0S9b0dGpd8Xq+vLhaTzDbqubrWpVlQnpXPsvvOl/zmzGPjjGFg0OaNk4I/TaJ
         QhJCeom62F4KlCbBpnBpfBR5Nf+78hD7QHoI+lBKAlL0G16WLWlOEFUGI+DbO9/0FUiW
         gWEdl1Mv2abU+hpjzcXTduwMojUwAyHS5HXijlsrVovvAtt4O+5nAlc5PwPOILZ9ds5C
         7dPw==
X-Forwarded-Encrypted: i=1; AJvYcCX/pLmSQajvTlGogJAUkwf+RjfBB8ARmWteYRDES4Ao7HZjGpjbv5JKfqHI3cMUEgsYd71eYqXt+NfS4C3kd3gB@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc0LLKQgoFyNCDMM+WBSZF1A5TujpgNe0r1FIhG1peSt+13ABx
	SOw/bzHbFo2zqi7iD+uWu/rbiwbRmvEnJkoUDLcxrlrHornOfXYtmucyljJQqEQkqW4wZ+4OSNi
	NCUqvR15Uw/KLhEkmBRVGDm9/pkSzwUr/x7Kkzg==
X-Gm-Gg: ASbGnctJRK51HORg0nRFk1gghWVllQLzOEjvPouUiB3xcUDSjWdWsYHVAPb/dBpZOxD
	CEfMfvZUP+dhZ/4G2LgqwcAqLYzJ3vP1wcs93PJncyBVudyHfqZqtrp5G53n1AonMxjHDLRXZo2
	70IIxGj2RICEzm5/ILygnBWnYlUcTy+LMvsNenUtCd9uZ9v8/et5LxJWrDhQ==
X-Google-Smtp-Source: AGHT+IFkSOGGYa3V9WycrY+gu8XDZN3eeiEk30gJ0tR1xS7OpisGKyrqxHEtle04WwZppsgW2yf3BQ5HfqnjWB9F/Gs=
X-Received: by 2002:a05:651c:904:b0:30b:ee81:9622 with SMTP id
 38308e7fff4ca-30de035019cmr53207541fa.31.1743581594610; Wed, 02 Apr 2025
 01:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250328143646.27678-1-johan+linaro@kernel.org>
In-Reply-To: <20250328143646.27678-1-johan+linaro@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Apr 2025 10:13:03 +0200
X-Gm-Features: AQ5f1JoGfVJ9ts98vDCtSYScI8e3HIFmZAN4o5AGXV0GNmnQTKivDH_VGXOT9Xk
Message-ID: <CAMRc=McRPmWu4q9EqYC_3wDCKoniu7Rf308SsKrbCk5rbopFwA@mail.gmail.com>
Subject: Re: [PATCH 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig symbols
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_011317_356673_01AB3A66 
X-CRM114-Status: GOOD (  19.52  )
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

On Fri, Mar 28, 2025 at 3:41=E2=80=AFPM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> The PCI pwrctrl framework was renamed after being merged, but the
> Kconfig symbols still reflect the old name ("pwrctl" without an "r").
>
> This leads to people not knowing how to refer to the framework in
> writing, inconsistencies in module naming, etc.
>
> Let's rename also the Kconfig symbols before this gets any worse.
>
> The arm64, ath11k and ath12k changes could go through the corresponding
> subsystem trees once they have the new symbols (e.g. in the next cycle)
> or they could all go in via the PCI tree with an ack from their
> maintainers.
>
> There are some new pwrctrl drivers and an arm64 defconfig change on the
> lists so we may need to keep deprecated symbols for a release or two.
>
> Johan
>
>
> Johan Hovold (4):
>   PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot module
>   arm64: Kconfig: switch to HAVE_PWRCTRL
>   wifi: ath11k: switch to PCI_PWRCTRL_PWRSEQ
>   wifi: ath12k: switch to PCI_PWRCTRL_PWRSEQ
>
>  arch/arm64/Kconfig.platforms            |  2 +-
>  drivers/net/wireless/ath/ath11k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/pci/pwrctrl/Kconfig             | 27 +++++++++++++++++++------
>  drivers/pci/pwrctrl/Makefile            |  8 ++++----
>  5 files changed, 28 insertions(+), 13 deletions(-)
>
> --
> 2.48.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

