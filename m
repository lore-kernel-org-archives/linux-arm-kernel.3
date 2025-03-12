Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59751C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OnDqzR6YtSLwONQoTdDT31SC3+7fyj7xPsRU2pi+G4=; b=IA/6rwgJjueZX/f8CfapVf5ys3
	gj6dL59iqcJT90qtcTLYtWRyEQ6wz1VoF4aCaMJfohij7Wlqbg4sM9wOObcR6Bkq3enCrPjB5AjFm
	pqOO69IlqLyM26SxO+hRTJ02whBrsCoIvYMriOToiBI1F5yXwVZfKpkPkmfu8B1qjLIb12Vnzj74q
	hSqKuufDRvELovt4zoX2IaaO7v0Bk6IhK2HnsS53mlE7Xo/VGnK+aW7dXyxnJyIxPX9QaQiChXNvI
	gDuc3OmIombgWYkoqki1SpUoez456uuHC/Rd4Lx0cFntXOUc+tiexaKyEEkLwhXndYBPQJwUSL7fC
	DaWh01FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKvw-00000008Mxz-3Jht;
	Wed, 12 Mar 2025 12:11:36 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKCk-00000008FCM-3YyU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:24:56 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-6f6c90b51c3so64435367b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778693; x=1742383493; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7OnDqzR6YtSLwONQoTdDT31SC3+7fyj7xPsRU2pi+G4=;
        b=s+XCBcYHNVGyJEDx7lx92QGPJGdCzEOflg2WAxRyLECtiK6+Cr+8Yi2Xfr4Req2ebn
         hwkpOCItH9RdnTegoBx9aHwKI6Dk3f4B5r3UdIEF1rvkYWIU5iw19puhWZgCk/KCi8CP
         PsX0F36qwjiRfi/GQjy9OvQwE4Vxkn/y1ntKGEGX78Zq/Bfl5ym50jZIaFAJYXGJ4KzK
         XLY+XhbelCixdwqTB5QrRlpmLaYEIn61da+uXpbNUQfDNNUuB6SMSkSfaYj7fzGFAjlE
         PhNrJNcroFlzPcNe/R10p++++v7DZjY4MuMp4NwkATOca4Y1mS/6gEDpvw8frM1yg8td
         zF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778693; x=1742383493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7OnDqzR6YtSLwONQoTdDT31SC3+7fyj7xPsRU2pi+G4=;
        b=EGkesjHdA4ymAViBb8XbddyZDUBQUM7sXNWlSBxYG+vNi/l8kp1kALkmD4HWiwOyNr
         YtJKxfZhObh9jCujvQaYgjJA8UOb6eRVebbPx40mFP3lMoNCdgdey5rKOebL5rfyQyYd
         ZT8aqilmLAO8eLj8a1UOdviM9wSZEZN4KOaf6mJnB/QYtdMWbp2SCO4Tw1jVgZdgrlyA
         +y323WZE8ahuYC/Qsl3bQwZuL0PbjNw7VnD/sON+iW3oxOqM5xwY8h3Al3Tz7Jjn3I5D
         YbQolzwSPer1M+mvc+0/BJ/U73NTH1EC94Npbfn2uxkS7R686b14Sy03PWCDz5gXPSgB
         CXew==
X-Forwarded-Encrypted: i=1; AJvYcCXQznRT230YdJ5Dn4m8SBhtsg7Q9EESEUl6OG3LGl4RUudLMB8yR61zskOqVNAVeIV9ZPh1Ua/ZT+wgKgm0BwAG@lists.infradead.org
X-Gm-Message-State: AOJu0Yw62C6MBAWi7sNZe1MkAN/VYlVgxdH8nRRcb824xGGxDVsbwU1K
	7eg9ZJ0WV9eeJlN3KCpOk3DuTBlP8MEKSkszi8rMViiAi1KwBj4zzjMdoaVS5FQ2GzE2iKS/EqG
	enHBiVpaJfuZGFA9AaLE+1jv9GujRV29dQIViXA==
X-Gm-Gg: ASbGncvYzTvn7BRMySdhLLCni8pYN/5gzJGWI+t92cbFcpAG6PcAe6aNirivMMh7P8b
	PO2hGE5e2xknGmo7Z29WVzY7rMt52hhv3BAcxAVBZ9AxW4j7oS6X24GGMHSpk7fXjqAyEQI0jXF
	J752havem4gIReuXi6C3CoOfNQedQ=
X-Google-Smtp-Source: AGHT+IHIrYfmo2j3yVIIaYFZE5oDvK+hQZ8/RGWocwnTto9a3k4qtBGozDsAeCNABMZLWFLC8+SYFjOJXfUQHYTuZMU=
X-Received: by 2002:a05:690c:3612:b0:6ee:8363:96d3 with SMTP id
 00721157ae682-6febf3ade28mr290798997b3.27.1741778692704; Wed, 12 Mar 2025
 04:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org>
In-Reply-To: <20250219-exynos7870-mmc-v2-0-b4255a3e39ed@disroot.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:16 +0100
X-Gm-Features: AQ5f1JruelnoNSp1FLqFV_ATP8uAM2_7A2P1q-OWLObav93kN6mUQJG3IRna_fc
Message-ID: <CAPDyKFrmn21xksS6Co9AjLQbtq_EWC8WF=r3RSAc6nfWTT9-zA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Introduce DW MMC support for Exynos7870
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_042454_890869_E40CA780 
X-CRM114-Status: GOOD (  17.49  )
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

On Tue, 18 Feb 2025 at 19:48, Kaustabh Chakraborty
<kauschluss@disroot.org> wrote:
>
> This series adds support for SMU and non-SMU variants of Exynos7870 DW
> MMC controllers.
>
> Some DW MMC controllers require two 32-bit r/w from a 64-bit FIFO,
> the series implements that feature as well.
>
> This patch series is a part of Exynos7870 upstreaming.
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>

The series applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
> - Take over ownership of patches by the co-author, upon their request.
> - Link to v1: https://lore.kernel.org/r/20250204-exynos7870-mmc-v1-0-c87cfc72be4a@disroot.org
>
> ---
> Kaustabh Chakraborty (3):
>       dt-bindings: mmc: samsung,exynos-dw-mshc: add exynos7870 support
>       mmc: dw_mmc: add a quirk for accessing 64-bit FIFOs in two halves
>       mmc: dw_mmc: add exynos7870 DW MMC support
>
>  .../bindings/mmc/samsung,exynos-dw-mshc.yaml       |  2 +
>  drivers/mmc/host/dw_mmc-exynos.c                   | 41 +++++++++-
>  drivers/mmc/host/dw_mmc.c                          | 94 +++++++++++++++++++++-
>  drivers/mmc/host/dw_mmc.h                          | 27 +++++++
>  4 files changed, 161 insertions(+), 3 deletions(-)
> ---
> base-commit: e5d3fd687aac5eceb1721fa92b9f49afcf4c3717
> change-id: 20250203-exynos7870-mmc-75bac583c864
>
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
>

