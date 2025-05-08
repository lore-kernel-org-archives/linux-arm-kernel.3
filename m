Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966B4C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZ5dCEOEywOXExzoNtHF395pMJNUPTYfr0213Oivri8=; b=seaRXpc0QrIHnlsK8UZwLmNGUE
	PW/a5e9qhB/EhGjS/YjoucgOL05u/oowyNQVLMDRxS0gBM+xKc+f7iRNy1QfrVtRxYRUAC/qTCojf
	PoPVq5NksBsEri1x0YCFANyZXwgdqtLl+fO4xdPsGrdKaW83MYMOxbaAcEJqNbmteZGzTjZhfA4+g
	EFoUfqxjY7+dnZaXb7/rDh0WrgrD3ballqVWYmjDSNZEA94TP4wjBwEegwHe4qUQAFT8RH0AALmiX
	h6rsmT8BOAcm5DPpoVmZOmJPma2c4KKpk9Ebz4HWSvPfTbpX3sjkMJXqcHgYvUgn12S9wmLCZJnD0
	SzeHmCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyHG-00000000M1v-3VYJ;
	Thu, 08 May 2025 10:14:54 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyE9-00000000LlO-2F9T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:11:42 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2d5e5e21b92so615966fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 03:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746699100; x=1747303900; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ5dCEOEywOXExzoNtHF395pMJNUPTYfr0213Oivri8=;
        b=zT74N3LjgLE0URUZ+ovBf8BNdq3ydKABPiJDoeKl1o+hW0RvWX7pZ30cy6tBZQanB+
         Eqa8mEJVO6SDyz3MOs2TJfnM1KLiVvhRdQHcXy6HfL+0b4+bzj1/UfZpV4ZFz8ohz9+j
         3aQxpDaXGy/7qLgNvOfqQzWhmCgbtgD4biujHWzc0sLpLTWy29rsrlrR7RrlLKBPDwfy
         2p3ffznUQCSSs0ppCif5TrzGn9bgTfk7ZTwj8yFAjudON7oKf+KHdim+t8ZuTfIsQOk8
         YgDCzguZkDNO9yz/HXugLii2fdbK6Rxg04QK3X94+pbpkPh+T9eN/UKcBFtuLH2epvyy
         m58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746699100; x=1747303900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UZ5dCEOEywOXExzoNtHF395pMJNUPTYfr0213Oivri8=;
        b=qThRHKDk8IR++7A3dpXg8cct0INiCX2+RSlJk4N72Q7TGe3TFJfa2NZGRUo16FRU0u
         CU3RXELdkeMEQVlQ8ghC42Fbp6X97Azt8iun56rayqN+VmAT7Cb9qhWLI+JfTs8coQEq
         TmUOX5VD9nJfBOdeFALT6GI8WzIA4bv2pAptvGFhQwFwQvNJgv+QF1ZVqcOZk6EmfoF/
         oMabK9yqlI+mM4u/kxT7IzuJSvVa5JJrUm8lADTvs+w7Pbm4D2SpzBHVN1jVhSEXGssk
         c0t5C67/mGutXagteV7LivF4Ctd1KX6urE8DddbZxETAcFyjSofMZd5E2Clj/GS7ZmOI
         m+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbgJq6T2k/G/jRguLs7xI31tENYxQeBSaX4s4ep0g3LEZal/JBVQB5qn0+VvlDV/nhD1O5LALOSrhAtVeaIo4+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb3cDxCwkYVUV82ikoU1npQzf4cbYXJAzY6Kagv0ggXV6Zcszs
	4HlVSWRSCz82gzAfRgY+wJ3Rhy1g9z1U/BSgynQmG1/y7wSSdX/DUhB3owoPGfokX2xi5jT1Cqd
	7mWF0MnK/J9DuTB9F5ehaZBSpLwaYEvb5abeI4w==
X-Gm-Gg: ASbGnctgW8CW6qL8hCchff70RPvgXAtxA7zeKqeipSw4ncvyiZUDCfOfLlY7TCk3ZqR
	Bk0YyRp+l4oSIz6Akyb/UX5LpSMS7ty83HCJjnulv5eDR0dhDhI18L6tdFlxLHtNeHxKnnHx6Ae
	n0ynZI1rj+sNs5lzFqrpjBOWQ=
X-Google-Smtp-Source: AGHT+IHHXXnIYY/blUtMMSgG++YLeS7dxymAnQLTsOYoZnzz6dKtVl2gZBaYez1Lnzo1dTAwj6L+w9Z+nAfO1s/JwvQ=
X-Received: by 2002:a05:6870:7007:b0:2bc:69d8:a39e with SMTP id
 586e51a60fabf-2db819c5ab1mr1885103fac.33.1746699100067; Thu, 08 May 2025
 03:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com> <20250402233407.2452429-5-willmcvicker@google.com>
In-Reply-To: <20250402233407.2452429-5-willmcvicker@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 8 May 2025 11:11:29 +0100
X-Gm-Features: ATxdqUH6wo2bEt1fpwg-JytKDz-8k2kgNoYHvmdBlsX3gPg4fgC2u7MgLMrGOfA
Message-ID: <CADrjBPpDy0itLoxTif=iYYOQspStjsHFza6bn1wDTmWs7em44Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] arm64: dts: exynos: gs101: Add 'local-timer-stop'
 to cpuidle nodes
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Will Deacon <willdeacon@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_031141_574873_A82BB695 
X-CRM114-Status: GOOD (  16.63  )
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

Hi Will,

On Thu, 3 Apr 2025 at 00:34, Will McVicker <willmcvicker@google.com> wrote:
>
> From: Will Deacon <willdeacon@google.com>
>
> In preparation for switching to the architected timer as the primary
> clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> property to indicate that an alternative clockevents device must be
> used for waking up from the "c2" idle state.
>
> Signed-off-by: Will Deacon <willdeacon@google.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>

Tested using gs101-oriole with linux-next plus this series. With these
MCT timer changes and another series I will send shortly for
exynos-pmu to program the correct hint to ACPM wakeup from c2 idle
state is then functional.


>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index 3de3a758f113..fd0badf24e6f 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
>                                 idle-state-name = "c2";
>                                 compatible = "arm,idle-state";
>                                 arm,psci-suspend-param = <0x0010000>;
> +                               local-timer-stop;
>                                 entry-latency-us = <70>;
>                                 exit-latency-us = <160>;
>                                 min-residency-us = <2000>;
> @@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
>                                 idle-state-name = "c2";
>                                 compatible = "arm,idle-state";
>                                 arm,psci-suspend-param = <0x0010000>;
> +                               local-timer-stop;
>                                 entry-latency-us = <150>;
>                                 exit-latency-us = <190>;
>                                 min-residency-us = <2500>;
> @@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
>                                 idle-state-name = "c2";
>                                 compatible = "arm,idle-state";
>                                 arm,psci-suspend-param = <0x0010000>;
> +                               local-timer-stop;
>                                 entry-latency-us = <235>;
>                                 exit-latency-us = <220>;
>                                 min-residency-us = <3500>;
> --
> 2.49.0.472.ge94155a9ec-goog
>

