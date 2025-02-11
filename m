Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C04BC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3wx9zk5qHzdPMIZwl01jPTrtMsd38bzKH0sGNqE64Q=; b=2paSukzoxse9TydTsdbtjhgTiE
	koKr6y9S/UwL9Fjk5WWJtobezdpnA/y77U/L9dD6na8jJm7jESuluz5HCo33QnuHWeJIsgyv4ZXjk
	iHYCpyWFn22QO16dGx/TN31dShKGQ6UhECw1RdptMKjuKb3gjoFtbVbTpIC+cRdFfOWLuBIQRBbcY
	3RpaAIHnHy7foAqLGp5GmYiJMEw9OI6dUzFehoqLWlbcctD0CmW2MugvPB/JD7mXJRSNvvD1IjZ6w
	fKgXGWhYCOZQRhv3ntUUClZHUmrSKCk+h6/VYoJQJLJhVkjtTguvs9W7MLrWq6I1TyL7DTmhhWbS0
	1P9BVuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqFG-00000003w9K-0dyc;
	Tue, 11 Feb 2025 13:24:10 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpvE-00000003sOJ-1TdA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 13:03:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-21f40deb941so116737545ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 05:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20230601.gappssmtp.com; s=20230601; t=1739279007; x=1739883807; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n3wx9zk5qHzdPMIZwl01jPTrtMsd38bzKH0sGNqE64Q=;
        b=28ejQeJRwxCEB6A9hbDVewz/KOi3wlPAXojIjDHkJcGzTyUcxppO0wp5NnrFp1JCVp
         xuxkbFrZjMIeXSeZSrUctERSbYQi2o9UFiRYMgmd9foO3YA9Z78aOEb93jo8yElt+6ui
         60OZKi3rct9YOE3W4UhtuSXDuYRG0ZnGgOd27GHkdcbVXCmvi01hPJbjgMRVyhuLDong
         GFkpwwA7So1eS2yVMJZd7ryxG44kPxWXV7CY8zkpEAx+VHr4QN39uqvm5E12qb8ZVPoU
         VCyFsLsrnhFSuQDC7q+KqQwfHWvPR1jxFeTS9NyhRThS6RqbSdzyXcr5g/MGWV69yMbC
         MBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279007; x=1739883807;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3wx9zk5qHzdPMIZwl01jPTrtMsd38bzKH0sGNqE64Q=;
        b=J+mn6P+Ln/p+YFtXl+8GWVLXmGNU0slld1zUNbH6Me0Ak13P3LYQT4U3uZAhW0k4Aq
         XLeh7YVNilyVURpls2N7pFMEwjJ7cV1tAioMq87UcfnMqiclhI+nxS9KWbBjykjErq5F
         TVLoKSMUI6ytmRbgEF4Uu5/DjNMJb8bretSRWF5ADqK3nwIVlF4OO3Eb4yVZDHGb3Gjq
         5/6U8F3K8P2k8nEv0JpEnZ2pJFT5c3g0PgRv8DnJ0pmpxV2r3OVeMHlT8TB+N2fV2Lrn
         ENcD6iWVRkpjt3SkoGkYmBPcn9P2YLG1BRqDM0kngR2tBmaP90KrObmbgMgzORGyirMX
         q2wA==
X-Forwarded-Encrypted: i=1; AJvYcCUK1DDnoij26fkOQ1ZSl5D7uismTctg+Myw4KUD8Yu5x6RF6msNPNrqhpeQEkOc9jvYl4pA5n94x2fs/9OnsLSl@lists.infradead.org
X-Gm-Message-State: AOJu0YyiK1ro0xh7xw2VgaultKzSM+vIZKWC0c4/Rj46/BuT5t9e3+Tz
	2M1rB/fcNZGiHKsKrO6VFovDDBgUQVeMuylt11Zvcz1Uzib8Tly4YDLDsPl3r9S04dUHBM8bP/k
	5kW1ryhp0Y1V2LKUP1FIPH2otR0wsYPIrONgrGA==
X-Gm-Gg: ASbGncvfQ3CyfG8hXxOldPpi/c8DGbyX06b7ez37IZkR6dr4Kn2zQ26XHky0q8gtbl9
	djlmjCvX1MB4n3cw0jAdpA+krHAKoqBAAa42a0vToEPMYnYzD7m8mSqFj1byMY0/WhHduFFk=
X-Google-Smtp-Source: AGHT+IEMVpkiHNiW0PFSaGrVrINKXb5sxzgwVDUOtgfEWggvvAR0CvuTqqd3P9Mx3MHb8RdrN+UeWxJU5s62w/GAwiQ=
X-Received: by 2002:a17:902:ce90:b0:216:2477:e4d3 with SMTP id
 d9443c01a7336-21f4e7f2c46mr294522695ad.51.1739279006869; Tue, 11 Feb 2025
 05:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de> <CA+VMnFyom=2BmJ_nt-At6hTQP0v+Auaw-DkCVbT9mjndMmLKtQ@mail.gmail.com>
 <8d830c2c-6268-4c70-ae8a-47183b8cbace@cherry.de>
In-Reply-To: <8d830c2c-6268-4c70-ae8a-47183b8cbace@cherry.de>
From: Jagan Teki <jagan@edgeble.ai>
Date: Tue, 11 Feb 2025 18:33:14 +0530
X-Gm-Features: AWEUYZm0htviHKGbBoFA3-kz2TrpIHA0nE9JnkvC09nlcKbz1Z6y2gei6ZbeNLI
Message-ID: <CA+VMnFxJZPD2D3-5t+=BEo2TVWoJFuEtd1Jj-_+2oqVoXonHcg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] arm64: dts: rockchip: add overlay test for Edgeble NCM6A
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Michael Riesch <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>, 
	Dragan Simic <dsimic@manjaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_050328_592213_2CB9BE8E 
X-CRM114-Status: GOOD (  21.51  )
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

Hi Quentin,

On Mon, 10 Feb 2025 at 23:27, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Jagan,
>
> On 2/10/25 3:11 PM, Jagan Teki wrote:
> > On Fri, 7 Feb 2025 at 20:50, Quentin Schulz <foss+kernel@0leil.net> wrote:
> >>
> >> From: Quentin Schulz <quentin.schulz@cherry.de>
> >>
> >> The Edgeble NCM6A can have WiFi modules connected and this is handled
> >> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
> >> NCM6A WiFi6 Overlay")).
> >>
> >> In order to make sure the overlay is still valid in the future, let's
> >> add a validation test by applying the overlay on top of the main base
> >> at build time.
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> >> ---
> >>   arch/arm64/boot/dts/rockchip/Makefile | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> >> index 534e70a649eeada7f9b6f12596b83f5c47b184b4..02f98abe1df10f44f2ac27ea5f6c6e6c6334724e 100644
> >> --- a/arch/arm64/boot/dts/rockchip/Makefile
> >> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> >> @@ -192,3 +192,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-vz-2-uhd.dtb
> >>   rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
> >>          rk3568-wolfvision-pf5-display-vz.dtbo \
> >>          rk3568-wolfvision-pf5-io-expander.dtbo
> >> +
> >> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
> >> +rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
> >> +       rk3588-edgeble-neu6a-wifi.dtbo
> >
> > Please add neu6b-io as well, wifi dtbo is similar for it as well.
> >
>
> Similar or identical :)?
>
> Should the overlay be renamed if it applies to neu6b AND neu6a instead
> of implying it's only for neu6a based on the name of the overlay?

Similar. that overlay is applicable for neu6a-io and neu6b-io both.

Thanks,
Jagan.

