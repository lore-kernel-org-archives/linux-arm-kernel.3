Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B0ACF887F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 21:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acngTfTdYoPKs7QTbd+kw/zmLQ6CCjPa+Hcp6y5W2SQ=; b=hpOA5tKvvCVkds+EMmYRTqNvm0
	1FdG0ISMOIBhPoOUH3LckFx7UUbzojGY9AdMWsaTrnc3QKuVhw3HyXUVx7p/AYbKz4rqUsKgxcAWt
	iJJc8BUGho15Fh5LQmtuDHevqv+sDG/D7a45mke1jX+4hjzZ9GrVYsyANqmiWrP9xwLKx8yRvepwW
	MQn1N78MCiZokNG7ldvSKwhIgUFYJqJzgspncJRHLcHNNouJleujbS2EY+g5DkYT+vKEK1+S7MbR0
	k69NTUnStX/pw5wPj0yr7TACYNCzeUKgkZeXshJaD4kIqtX1Hh9C+uXzhi8kQEzVL1xfD1itT6BxE
	1gfEFX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCei-00000007Uwn-0wEh;
	Thu, 20 Nov 2025 21:57:32 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMCee-00000007Uw4-4BU9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 21:57:30 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-63fa19e296eso158891d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 13:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763675847; x=1764280647; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=acngTfTdYoPKs7QTbd+kw/zmLQ6CCjPa+Hcp6y5W2SQ=;
        b=FgcdExgnDAUwXPjs+gOyvfL4HLtN/TD2zCncYzPAR2jwheSPNSqC7NeaEjHRYnw0/o
         5TBPVxhX90NZHTCG5lIgqnTMWL9uxH1OPBnXF9owi62bbAzwTjdkuhRAfY8zPWDZDMCY
         wAF7oT97PXOF0Cxl7sxu1kYb2Fn3F/bBm0kiUbPo5i+navYNwhBJXDlgB1LFlrEB/Ymd
         XDC46iYqbXpMHylQLHeK1Vj3lzlv/afCHeeP0rVTbmLxfJlvSX0xtub/LkcnegVuIO0W
         RS1yRtsFh6liTZ0fh6SdkXy5nuLQpwIVi5x3loBwG85rJhQ5qV7KNqhHir0LJt9idgof
         J9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763675847; x=1764280647;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acngTfTdYoPKs7QTbd+kw/zmLQ6CCjPa+Hcp6y5W2SQ=;
        b=B1qNLVbLqyrrMgH7ubGYoM2DgvsqGYz21p5vYckyei1GWd7YcozZqekE+v2SbclJsD
         WaQRW+KRHOswWBn/g2wDZDtDILHd6iwvije/Zb7jr7Dzg/OHGM8cX7HWTHl5IoHso8WY
         iHnbiU0jlJ5tJqH7uuMglogJtswnwQEIqUuI8Z6y7C5dU2toIerQYm8gnb1GQU4CpABH
         +b8yMoJzk+mR8CoLuQo+ySc6DihWuDE9PRqKvl4bKPMAjw+Pnb4ONwUXoOex168An07C
         E1fu1PdMgR4zXJ6NMJG49pWVTT+TB4tthcRLXZubL6JudRYTEnWEznzEInvn5oZfko8T
         V2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVVYvQI0O+Uq8yxxT/wiG/C7iBGIV6zFzUdc6xMTxZk+gGZP8CMmWGtNG9MDRCSTqJ2DY1u88McJQH3028OifU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjkv0wTG7ggsX07HwgBj0WMURWpAGsTISmJ3Yx5ZA47eHtc3YD
	Gy9BjNpyD0mIckdqO3IazKHHT0NGDp4I3KPnV7YektHqRTFDX7/xVBJ3ZN4vgAAr0UXEsASEy/x
	jlBu471pYOmvV1K3ev9QC18PhDx11OYM=
X-Gm-Gg: ASbGncvMhpJ57hS3OwwtvEcN2JdWvW0tj+zPXJDl7ezIW36B2zwog+yQ407CUObduqV
	7r5ns9/gpU9auNgWPadhOcd182uK2TyQeFaNsSTd7gmJPlmMHMHcG0g4SFmZ4WCA7W1+ATQWdjM
	acU/hPYB0GomoZQMmCuUCaN++wy5V/BdJsFjx7fDWsKXQ9ogNGbUeeKdOYFAAfmezMnCqaF6f7/
	7Ywv9PkEeLazpHg6Or07BsWcrnCnkYO/Cxk3rtBiGt8fT4q08uSAa92YGZRcPB2P8xstzUU+/CE
	8h4PntgcSo1kHm9RUOnPEvF8FZDd1yCOu4qrk/E=
X-Google-Smtp-Source: AGHT+IFH278gd7LaywHnjKGV7yj58tOA/DWTSt1RwuOIc/Q06gl3Klfp6Ih7scebqFhpQ8DaqwGihTulQXH48vN/uNw=
X-Received: by 2002:a05:690c:95:b0:788:16d7:6ebb with SMTP id
 00721157ae682-78a795ed423mr35045787b3.5.1763675847167; Thu, 20 Nov 2025
 13:57:27 -0800 (PST)
MIME-Version: 1.0
References: <20251120213805.4135-1-ptpt52@gmail.com> <20251120213805.4135-2-ptpt52@gmail.com>
In-Reply-To: <20251120213805.4135-2-ptpt52@gmail.com>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Thu, 20 Nov 2025 23:57:15 +0200
X-Gm-Features: AWmQ_bnv4TbUctX3C0M8ZCciFb5_1SLblT9d2oxVI4WCyhhk5TijuqMkKDB1Ffg
Message-ID: <CA+h21hoW3v_hL+woeQRwpxVCQ00ywWhJ0H+DfhaRqpMWB2ZSng@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] net: dsa: mt7530: fix active-low reset sequence
To: Chen Minqiang <ptpt52@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_135729_067082_C0877379 
X-CRM114-Status: GOOD (  22.58  )
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

Hi Chen,

On Thu, 20 Nov 2025 at 23:40, Chen Minqiang <ptpt52@gmail.com> wrote:
>
> With GPIO_ACTIVE_LOW configured in DTS, gpiod_set_value(1) asserts reset
> (drives the line low), and gpiod_set_value(0) deasserts reset (drives high).
>
> Update the reset sequence so that the driver:
>  - asserts reset by driving the GPIO low first
>  - waits for the required reset interval
>  - deasserts reset by driving it high
>
> This ensures MT7531 receives a correct low-to-high reset pulse.
>
> Compatibility notes:
>
> The previous implementation contained a polarity mismatch: the DTS
> described the reset line as active-high, while the driver asserted reset
> by driving the GPIO low. The two mistakes matched each other, so the
> reset sequence accidentally worked.
>
> This patch fixes both sides: the DTS is corrected to use
> GPIO_ACTIVE_LOW, and the driver now asserts reset by driving the line
> low (value = 1 for active-low) and then deasserts it by driving it high
> (value = 0).
>
> Because the old behaviour relied on a matched pair of bugs, this change
> is not compatible with mixed combinations of old DTS and new kernel, or
> new DTS and old kernel. Both sides must be updated together.
>
> Upstream DTS and upstream kernels will remain fully compatible after
> this patch. Out-of-tree DT blobs must update their reset-gpios flags to
> match the correct hardware polarity, or the switch may remain stuck in
> reset or fail to reset properly.
>
> There is no practical way to maintain compatibility with the previous
> incorrect behaviour without adding non-detectable heuristics, so fixing
> the binding and the driver together is the correct approach.
>
> Signed-off-by: Chen Minqiang <ptpt52@gmail.com>
> ---

If the switch reset is active low and that is a known invariant fact about this
hardware IP, why not use gpiod_is_active_low() in the driver to decide whether
to call the old reset sequence of the new one?

Then you can fix device trees without regressing the kernel. You'll still
regress old kernels which boot on updated (fixed) device trees, but for the
latter, you can request a backport of the DSA driver patch to stable kernels.

In networking process terms (be sure to read
Documentation/process/maintainer-netdev.rst)
it means you'll send one patch to the 'net' tree with a Fixes: tag like this:
Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
(when unsure, use "git log" and watch https://lore.kernel.org/netdev/ to see
how others do things), and separate patch sets to the respective SoC maintainers
for updating device trees.

BTW, didn't ./scripts/get_maintainer.pl also suggest my name in the CC
list for this email?

