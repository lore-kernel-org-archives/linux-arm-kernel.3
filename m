Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F46F483D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 17:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ea014rg9Id3LjbCkFFKL5NQgh0vM+cp3ePkl8S2utWg=; b=KOn7rvetSFwxqm
	vKyOGSAwcdeIt9ZZE+GM02atuktvPpRoDhz8fGRRKPLFD3WQiF6eSFRcVCqcvoa3piHeqOZmTQ/66
	nillDMte3mWPDV7HatyXbaxEaPGS9X6ZQVye/HQ0IsQlWLAZuO3igJrO3g/LZ1l1lIR3WJjmIuI0z
	k9GVPfGbOFBDXLAwsuMH4CVbiEWLAnCHFMs1jIXUBHIj3ZMb+m20IZcMuzoXEDJ/p57MUnkFzTgPX
	4Ivc3RNyJwbumkDxROKDtZBF4LN4aBtlns97dlsVflUXoQTpX5hhER56g+iMIY2TzW0zDBbfyTKHG
	Y12xycog2WYaTkq1UANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ilo-0000000HCG3-3YXV;
	Mon, 23 Mar 2026 17:08:52 +0000
Received: from mail-lj1-f177.google.com ([209.85.208.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iln-0000000HCFT-0AF3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 17:08:52 +0000
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38704f70ea3so36858211fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285727; x=1774890527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ea014rg9Id3LjbCkFFKL5NQgh0vM+cp3ePkl8S2utWg=;
        b=rR4fG7qxiMtM1o5+a05rFel3CJbNvfKqOAfojzBnZJGaTUcZxnCJsLxSy3E35ahH80
         cbbceNJV6nH3nCZrLjtGkRJYYniZvMnD1caUCvS1ETZjEAmXGgTUTOmGw5fIizfuGgJp
         e4ffyHQiX7mUNKN9EXtGSJwCnxu+ef1cpzaa6R9YRLEpoOdgtrS/gVs6Sf+AFbMhjNPF
         jj1qFxoIEB+aT2ajSWcxn9UXMQkhalgMulMXzv6qq1rlAB63C+uH5pglpASC1XKy9tQl
         Q6cu6nMNH7dg99K/vw5N6aw/TPMRyseFEB/rimSFzETzCsrd/U89JXS04ERuyOUpi9wp
         XrBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGHvfculKf10g0lGJo5dwQ2/n9waICzcfC9lPnAL17ddRvjMJt9/UegAaWEQiUs84LlshW/chMZNBQ69apPtrj@lists.infradead.org
X-Gm-Message-State: AOJu0YyyIuXlDPLiKp9SJR8ZGgaTBXodJZFnI5/dKMfCF/yiWvJyTPtr
	bQghjW5HnwF/PC3+EaXEXsdEfypxWv3siiSWakF4CpP82HZlsANTPM84j504Vkq5
X-Gm-Gg: ATEYQzw+l+qisSyZ4Y/lhKmBqCf+Z3iqx/Y4CJveelgtIELkUvaZI5Si6Js/YEyuMzh
	2xstNKzp0D5mdlwhJpadRnFk+81Yf5s9D9ennYLxdldHvFnwANTIhEqRBYODzPuCDQEVuic+E7Y
	g4BTUT2BqJEQiMmlda4Cgxc0H1mOx55ue7lMMbNxocoehtxOTGx/Q9aHq4kbAsO0KcXHbqZYEU9
	CFK91r3eA2UUx5QDf0VNBHU1//zQAbg4fVStLH35I+jbOikH22aWRbGDxqSJ7oeax7kl2jRIFM4
	0HmdMm0dQmPafX1pb0AuveCW9aurZvIWhj1+6uL0+Sbmb9oBY46UK/GMrbPZyHPL4Kx3aeEiKRK
	bY08locNFMAtJMNUgfuna9pQ2EAHAgsoh4bN+Nm/uDjsuYRT+nypG5Sn5x1nRCHhxRCLL6sMwgD
	xK+KRwQex9AHiPF7wSfr/TLTJvj+UNTgt/14x80r/modeCmKju9p5Iu5Wk1ZRkyQ==
X-Received: by 2002:a05:6512:3f12:b0:5a1:2e0c:86ee with SMTP id 2adb3069b0e04-5a285b5a3c1mr4729923e87.36.1774285726419;
        Mon, 23 Mar 2026 10:08:46 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530bd55sm2659371e87.72.2026.03.23.10.08.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:08:45 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso4274713e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 10:08:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUj503LgikNEkgN5C7ZZ2HnNuLagVFlnOAjIaJNqmkXkLSwwqAWfqqBkPmlmPqCtultZmRMEFIV8TsyXKmD3riF@lists.infradead.org
X-Received: by 2002:a05:6512:3b2a:b0:5a1:3400:f937 with SMTP id
 2adb3069b0e04-5a285af5768mr4364578e87.7.1774285725281; Mon, 23 Mar 2026
 10:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-5-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-5-andre.przywara@arm.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:08:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v64+bQL7a4C=+ja15wN5=JZM9EN6KL3i3zKiSSOH_VjycQ@mail.gmail.com>
X-Gm-Features: AQROBzCe4pxhD7VX5GMz8Rw4tgWfnVyG9ksfoBVa9-SlxUX0n6uC5n3LkQE4wJU
Message-ID: <CAGb2v64+bQL7a4C=+ja15wN5=JZM9EN6KL3i3zKiSSOH_VjycQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a523: Add missing GPIO interrupt
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_100851_083183_C936B345 
X-CRM114-Status: GOOD (  11.78  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Even though the Allwinner A523 SoC implements 10 GPIO banks, it has
> actually registers for 11 IRQ banks, and even an interrupt assigned to
> the first, non-implemented IRQ bank.
> Add that first interrupt to the list of GPIO interrupts, to correct the
> association between IRQs and GPIO banks.
>
> This fixes GPIO IRQ operation on boards with A523 SoCs, as seen by
> broken SD card detect functionality, for instance.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: 35ac96f79664 ("arm64: dts: allwinner: Add Allwinner A523 .dtsi fil=
e")

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

