Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803F6E93808
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 01:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkQ6RBTZ5z5vPmik3lad4IDd4nljLh9X4eyQBenQOSc=; b=Cg5m3YEqozstXue+giydDbE0db
	28A9i9PVA8gWnuM0U9AhiHKnwgzl2NllsAWq4+iZSLGqKhgQszWB+AN5s3xe6ylOFejVVbrjKNVjS
	yjNWWZTTq3OWUG5j26aDD7rpXj4mfuNIqJyHLwuR2dLSFauFqq/lDcBvBb81MIwh6fTp5diUVIkKh
	F4a1DVMelvz06zmoNpNabvymEF4VyqWc6Z3Hkk5dZ0UBCWWVW7CleUcFTwDnK97hUqH5rt6ufj6r6
	5USFanSUGOO2na7j1Y97RtTK3cT7sWIxIcRnxffJG8MzEUCizBIMLWEJh2/CSdZtfwk44XkMtV1sl
	oJ89zztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC6Jg-0000000EqYM-1cRt;
	Mon, 13 Apr 2026 01:42:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC6Je-0000000EqY1-1AlS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 01:42:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43cfbd17589so2571087f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 18:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776044536; cv=none;
        d=google.com; s=arc-20240605;
        b=C5gbxfkHQAVahqSECCERf5r1p6SouT8jrVrmOzaTjalIda8upfYcZxvCppTb7/Yi5f
         VEDqLB1HjjOXJucmDMLQYmJd2VmlL9dB42RFuthcw69x0HxFJGQ3qCFbU3ll7lyPLOnR
         hK8eusPLcjbBBA443zZHz0gS3DwTzfMqmfGqohYH6YKXbk8Ie1R6hwJyZn3ubIAvZnUn
         deYHwAYLJRhSp0qBOpGn9ACc9EEeHJjlYDYS65WWR5Xk4hkZfuX1UQuWIaDb++RYNTDS
         psmkeoekD7gFjxDKHWRqNR89h630zO/f3Ipd8z4jNqaSJ7ssBzofPWMW+CXubMA5dlJO
         SjTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mkQ6RBTZ5z5vPmik3lad4IDd4nljLh9X4eyQBenQOSc=;
        fh=5t0IZI5QlS2rlfT7hZ+3JhJcdewZm4ZkzZGIlvJPZpM=;
        b=O/oIsZhwdCLkKB8jXVXoVP2+EWuCpNCnfCSSK3ewvTi956P5i98DvRNvrNCdrzRaV8
         ELCsFj3SBPZdDamgLegus92+F0DQf7ulG29cPX35CbkBOU6ZUHS+ovK5ePUXAVlJi4AF
         s8+XZ0nk9JczNpRt0RazAqHxcwmmbHJRCXCKheJCy3PZv/CaDDA83R757uSo2bSB8zPn
         M07ayZ8X/8iK4STHA11RdsAzRgAaY0ZFWmHotpeEtRwgSPSC1Wj/fWDWlMfuO4QcDR3l
         MXiDUSgg+8mLMxm0LYRkTXgKIRVlIJsHZwbj3yGnrt2LelBIaCmw3xjziiTL1rGQxHIz
         39VQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776044536; x=1776649336; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkQ6RBTZ5z5vPmik3lad4IDd4nljLh9X4eyQBenQOSc=;
        b=CwZs7fpRprbZNiMUmu/PiItI88TLvuxhbkkViVzYbbfj7NvAz3dVLNwHf4OagVa7uI
         HpLXd1Yaof9IYa1yQ9HqPotRR6bsrUx9xKyE3rdCwVruwcyt3VbqZJuemUMjJFhdVJnc
         qBNJhzw6n7yaujLqZHTpd5uD9YF7LBhKVJii6q5Ik/rB243rVP6+snop9OKF+B3gMOst
         68yIdtnFgQHZWzcRlAAx2MrYr0TM6rSwQxUaQCGhzG67MlwgrbLybXWeyL6ZPF0rVkdB
         9kud9Z43JZ4DcaWGBs8ZGb7mzsfRilRu6jLLv+BK40UqB71iWBXUYPzyUrJ+hWHLbSda
         dNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776044536; x=1776649336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mkQ6RBTZ5z5vPmik3lad4IDd4nljLh9X4eyQBenQOSc=;
        b=l166NnnSErDWcVSLp/bQ3yMg0CTSWxLUmh/lkhDJNTx4xqOkA8MgoQWOAR1AMNR83S
         W3OZDjg+4M5+OgVp/tB+aTDvsuNv6KQ2jEvtgGvZJ4wvhDdwQzYSKz0Q5zsrbBwAlmKi
         ZN6xuO/raYyuQ/6SVmHWVvKdFimS2UBnk0WMtc0W9Gra+hiLosDcnFN0JaRCs4avU9JU
         XpPLgVNePfh47RO2tHNGBQCTIrrUPbJZecpyXkLpS4E2wSYPH++xLEUso/pJOLdB+hHQ
         ILvFHZ/9N5jUnnlyPbQkat4h4Sh8EWygwClqktktepsd0aAdh4myypVpVEiEM+g1yEgO
         VzrA==
X-Forwarded-Encrypted: i=1; AFNElJ/P5hS2RfARIIVU9iGCqyZYoVjcghLhyI9K+T4rw9hSyBsUTsl/vbjgfyuSYnERCR5fKlLCaOIc6Wc05zRMCZ4f@lists.infradead.org
X-Gm-Message-State: AOJu0YyuI/gulDOVOGpuAIWx8NF4nWT8ipWLjvjd8hw96e0/ryx46MF8
	qnDAOT3OvQxOTjS/u3K8HN37sDYH/466DYTiEjcpqtoM305djlb0RGbHKr4YlX+xqadf9Vx7rcU
	xlmS52KnFlyyR4HgfEV5c+xE0zJvCPd4=
X-Gm-Gg: AeBDievBzQf2peYV9on09OY7PNaStgFZ/tATCy+cBeDYb7Vokl/JYyvT5TGU2aymLqF
	VNsQOTc4Szf+1QW6oHqa+aPK/H7ZWyKHipbJndvKsx2OFOUtYdE/ZhMicPoLC0ePdRN8/6on8z5
	/i//5FtnVpsUtiRUeYCLR4Hr5px2opYKmyWTcbP7XG7pVJY+tUoje+z+aOeSD3xSnOIDIk+dTKD
	1jWmB1LJSyPfdRutgqfjIzeDnHQPbWUKVXaJu6mhe5+YWrFD3yKJl+NATZC66Vrx9dceEDUl0fF
	mbrbuOfFG3HE4rYxMhwWw6pFMMDjsKPa9mdMOMp2
X-Received: by 2002:a05:6000:4026:b0:43b:50d6:4f04 with SMTP id
 ffacd0b85a97d-43d642b5f41mr15811417f8f.38.1776044535544; Sun, 12 Apr 2026
 18:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <266998d8-7e38-4bae-a4df-2f889538fe88@bootlin.com> <aduq7Lvkfrz971Rb@shell.armlinux.org.uk>
In-Reply-To: <aduq7Lvkfrz971Rb@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Sun, 12 Apr 2026 18:42:04 -0700
X-Gm-Features: AQROBzC8C6b8uovPJvoH5TRYEOGsdMo85w4vcpDsb0ECyjaa-7k3CW1WkTIND9g
Message-ID: <CAH5Ym4hEX15dmJhGBqhhk--_PoFRKRSyE1AomY4D3ipwAz+pKg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_184218_338468_E1D3DAB6 
X-CRM114-Status: GOOD (  16.79  )
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

On Sun, Apr 12, 2026 at 7:23=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> As the dwmac 5.0 core receive path seems to lock up after the first
> RBU, I never see more than one of those at a time.
>
> Right now, I consider this pretty much unsolvable - I've spent quite
> some time looking at it and trying various approaches, nothing seems
> to fix it. However, adding dma_rmb() in the descriptor cleanup/refill
> paths does seem to improve the situation a little with the 480Mbps
> case, because I think it means that we're reading the descriptors in
> a more timely manner after the hardware has updated them.

Hey Russell,

I'd like to repro this but I currently can't boot net-next. My issue
is the same as [1], and the patch to fix it [2] isn't yet committed
anywhere apparently.

This prevents my Jetson Xavier NX from starting at all (and after
enough attempts, corrupts eMMC); I'm surprised you're not suffering
the same effects. But because this bug lives in the IOMMU subsystem
(and it has somewhat inconsistent effects), perhaps this is just a
different way it manifests? Could you confirm whether your dwmac hang
happens with IOMMU disabled, and/or with [1] reverted or [2] applied?

I'm using a defconfig build and a fairly minimal cmdline (just
console=3D, root=3D, and rootwait).

Cheers,
Sam

[1] https://lore.kernel.org/all/8800a38b-8515-4bbe-af15-0dae81274bf7@nvidia=
.com/
[2] https://lore.kernel.org/all/0-v1-664d3acaabb9+78b-iommu_gather_always_j=
gg@nvidia.com/

