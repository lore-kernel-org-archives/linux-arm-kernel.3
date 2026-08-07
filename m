Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908BEC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 03:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Rxym6s8p5fdNkShVSkwaV8afJle+IJgpasiGsN9DyY=; b=b2zG8XalehSlkUZY7uxSe+2Lum
	kKcerig6KX3AcvVHCn2a2doSr1X3f2n5ivTxg//ziiBrrK6BNz7Iiu9HFYV4CWhVyTtEzKhAshwfn
	adS5rrpMD12I5+k5bb+PAzfjMFJuSjjbekvKEZDuuAz3JjDUleC+Ybi3YrsNyptxvjRhJ6LPimW5G
	KkPgCVmHliybwtHwWUgn6QH1u/6Slhr5wIIRGHwGtvlR3lDIjXIGfvnUq9jspdAzu1eC+iUa5maKN
	y1fPV7k5JTozNle1zMVZBubnonz0EYfuohrvhA5L+uhl5kLGRBvFzTr8ucM52kPew0GLD4/Dj5UYT
	oRXs6Vgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBC5-000000071ps-1Uwf;
	Fri, 07 Aug 2026 03:24:25 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsBC2-000000071p2-3iEv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 03:24:24 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-81ed2a00f12so47005747b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 20:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786073061; cv=none;
        d=google.com; s=arc-20260327;
        b=VIKVezJuyOkIiylnUssmDeNeMOWUDhCK10WjKbsFpGuLkmkf1trkieGwkmMpDaQRAU
         xIFFS6255IkuGcI2VdnffWgiAf9razL5oBvuXS2l/mPfaBy+NSe+ZVOzC+ZnaipEPtTI
         p9Px92mqo1Pw5ZxgXByynQQLjFmF1lQPY5Giv5HGJIXeQu8EELLnWc7RhZoC0+U82NHZ
         AvkCILg2gZQEbkC27pkPVkn7fz7NfVh1H0sicLmu98slNQepXqyTZdRPJJsIKQqsd/iI
         8dR8TyOn9eg3eFxw3HeBoynQASDLx8kOLa+Ue9g19vpl3vf4jUfucr2DCrX98gPUsrGg
         oJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Rxym6s8p5fdNkShVSkwaV8afJle+IJgpasiGsN9DyY=;
        fh=acpY5j+Rk1Hy9SNZ7eJGX/A1UJ69T+GWqS+QT2DOSLo=;
        b=R8/Y9k4PeBxXxNK+XGOLvfR2tTbCenNT2iujq9bfwNJ67v0wIWqRkopL0XgCJM7l3/
         v2Z0HXgk1qSq8Y3ADJ8a4y/lJx8qFaxIPPtL4TS17Zsyu2iZmOTjM7MHiqPqjyuyjuar
         9F1yQXWK7zIJZ2AqTHXmyqPzF0tAE4POqD83IfhKxXiL8///QNz691V747sydBXUO4ZL
         OBirtcMqdaJ/om0z6EtaAQ5IXMVPp7f7Cd8kyze/E5PElj1Wcz+NxKe+bXoDUroytAzN
         yr9Q+sExKqfv7DkMrFx4zAFclNb5UfkbiN88uo7FTIOQa6MU5jyYu37hsrP7wzbsDVo9
         WojQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786073061; x=1786677861; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Rxym6s8p5fdNkShVSkwaV8afJle+IJgpasiGsN9DyY=;
        b=Hn3WTJQNuFphWLJxFRnZt/qT8qzTgtEOYOv7PTdyspic7X2RcYIkX1wqbaNDlWyXmx
         Arbe+Be28lasp1aXHESSp8uica12wk2J/p88f76CLQIbdszAu8gCGOUmTRVmBOr7+0if
         f4pSPxGHPg9kE5nvi7Cf1+inqAWgUSdZsTg8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786073061; x=1786677861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Rxym6s8p5fdNkShVSkwaV8afJle+IJgpasiGsN9DyY=;
        b=GuVakv7wyCg4lidsqlEPP2/7hJFRn9e7eMAvr8JVUJ+XsYR+8B69m3VZc5EjgyOBHE
         kshJAWUF1mvlTXI8cZCflWTTOUh6K+NwpbKauTwVigK/bR4hONpIi7FULSXUbqv6gDWD
         uzbkISdcDpg5Tv796NlYD62PQFF4sfDCbVLPJGIEQ6UhansXtMiobKMDSO+BozEF6qbW
         tDeu+fRinJoPT36NXXLIz9Onh53AgLI7t4wModOOYIS+2jJKSiGEiruGnjp1TkJdywr1
         v+yijDXCb2HtEWKQUgtcoqnnWty+gClivPEqZwMXXmPSlaP+nt8yGpnOhFvf/CyBDriE
         8ghA==
X-Forwarded-Encrypted: i=1; AHgh+RpunGOvju5epUQz3eUeesGoO5n0yV77dgua01kqt9KtDICVMm4Vjtd3FfQA0Cq+sFkFlogF0cXzNeszgiLM8sSd@lists.infradead.org
X-Gm-Message-State: AOJu0YyhYfNdtgo+4GkTmgB4GC9Ez9JT02+PrSGQ+FHtKbqXZcbFHcWb
	BfYwWX4scbuhY/lGFEyJ//1hlwHhhG712d9hhkHbGtaT8zy2lSxtAjXuTelfbiYsokoEeX7LFWB
	0MuAJGSVczWK+GZj6lYeAUl1CNYSBlDH0VJMUhFQy
X-Gm-Gg: AR+sD13q1GfKTtsgGMDHmTIe93IMvdgWfhIw2Ht2Zta6+W2qJbtHN88ZloQ3rke242B
	PhxeW2vvm9opNrKPjx8BqhMIw+XWxIg7LGa5huyFAAAHMDaaubaKnvcYnGgLzHAI1B+8G/jUEF4
	PCVXREVjAYqG6vf7eeepNWpfyr/yO5wueGvjkMIvCip6uQ/8wyUxRFH8+tqyRhM3HvpJog7jfZe
	KtgAaHhFWtDX8tSfWc3KPYBhvy/8yxnjIHrzGok5Ig4X8vkHKoAQX/bwr+IOuyiLcAD+qvobMZR
	i0HnBB6vPPS+5Nw0oXrqvrQ3kJ65PPFIq9XMRPz1+p/lMDq9AEUPHKaXJw0MKG6JOSD6nHw8KML
	ZHkvSZfkQwg==
X-Received: by 2002:a05:690c:3192:b0:821:1013:b420 with SMTP id
 00721157ae682-8211013b613mr61043287b3.2.1786073060720; Thu, 06 Aug 2026
 20:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260806165334.7328-1-ansuelsmth@gmail.com>
In-Reply-To: <20260806165334.7328-1-ansuelsmth@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 7 Aug 2026 11:24:09 +0800
X-Gm-Features: AUfX_mzUdOGgxWn32vBMs4t6vRLtbHLODUQScOwpqh6tGHGYlgOK1wG3cJKPIgA
Message-ID: <CAGXv+5HrDw8GWb9zp1AaQU9UW+0FGcr7jOV2jt_zi_2KgfgBqA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] PCI: mediatek-gen3: Add 2-lanes mode support + clock
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_202422_964043_137E70EA 
X-CRM114-Status: GOOD (  24.28  )
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

On Fri, Aug 7, 2026 at 12:53=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
> This small series introduce support for 2-lanes mode for Airoha AN7581

Just a nitpick, but I would probably name this something else, like
"cross-controller lane-bonding mode" or "lane stealing"? PCIe already
has 2x lanes as a standard feature, so this naming is a bit confusing.
It's not like dual-LVDS display in which LVDS is only a single lane.


ChenYu

> SoC. This is needed for correctly functionality of Eagle WiFi Card
> normally attached to this SoC that require a 2-line PCIe card to
> correctly work (and give the proper performance)
>
> The first 2 patch address a limitation of the PCIe implementation
> where the PERSTOUT reset were indirectly asserted and deasserted
> all at the same time (for all the 3 PCIe card) with PCIe
> enable and disable.
> The 2 patch address this and introduce correct reset to control
> reset line for the relevant PCIe line.
>
> The last 2 patch add additional logic and support to assert
> and deassert the PERSTOUT and also apply the required configuration
> for 2-lanes mode.
>
> 2-lanes mode is implemented in DT by adding the required property
> and by defining the "num-lanes" to 2.
>
> Changes v5:
> - Address formal comments from Bjorn
> - Drop clk patch (handled in separate series)
> - Add reference to clk changes
> Changes v4:
> - Improve DT split patch (drop unneeded property)
> - Handle power_down PERSTOUT
> Changes v3:
> - Add Ack from Krzysztof
> - Improve commit description of PCIe patch
> - Use pcie->num_lanes instead of possible uninit variable num_lanes
> Changes v2:
> - Address typo regs -> reg in Documentation
> - Address typo lan -> lane in Documentation
> - Apply a suggested fix from Airoha for PCIe MUX configuration
>   before PHY init
> - Parse secondary reg in probe
> - Add missing reset_status handling for inverted bits
> - Move SCU to local handling in power_up
> - Add check for max num-lanes for EN7581
>
> Christian Marangi (2):
>   dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
>     2-lanes
>   PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581
>
>  .../bindings/pci/airoha,en7581-pcie.yaml      | 244 ++++++++++++++++++
>  .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
>  drivers/pci/controller/pcie-mediatek-gen3.c   | 106 ++++++--
>  3 files changed, 338 insertions(+), 89 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-p=
cie.yaml
>
> --
> 2.53.0
>
>

