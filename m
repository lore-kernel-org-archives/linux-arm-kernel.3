Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049EA108B8E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAm2bmEp+JAg2qfDtNL07kuDx1TZE+b0/OOYKhnw49U=; b=IGVMfihg+cmt9F8IVR5uKI0S8a
	J83ZE5fip+QEErAUrWJKCzi1VjLXeGCMgpgLnwvDQ2jSt9pYfayGYpvSE0ufCJ+Yop/25AyJg4WZ6
	d3E3/R3tefYBmY4QoxxRJ7ye86vlc78F8nYzOjmwRcgL6za/fD8jfWTKnoYiO3On8kOKw7UnnRI2J
	MHjEXDqf1kQWOGRvJYKVRzIbBFzPBpyLWdQKB7QBZV2GS4bo2iuMIf70sgnIG/aoaaWRqVr8de2dM
	gCj50AzKEaVs9nf+5cMgaubfltF315Nyo8KWB5d25cEJMFKma/iABuR9vIs5Uf5w8H1MRSkyoedcy
	sP76kG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WK9-0000000CUlt-3wJS;
	Fri, 20 Mar 2026 09:39:21 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WK6-0000000CUkT-3zcM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:39:21 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56739adfa1aso1153244e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773999557; x=1774604357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAm2bmEp+JAg2qfDtNL07kuDx1TZE+b0/OOYKhnw49U=;
        b=aw7T8tilKnOP65Acxd3syQSwJbkR8QMuhEOGUgrz4tlK+T+9RpfgVgfANKlCnzJEnv
         bNBRo2iXTTY2Xq1HTZFaOnOnRM01kr/d65jvuU51MMmIE2BO0G1nVv27Qb/+n4kqyyzH
         DHU0qW+FojIIW6n3QmNPwa5/xORzDZic9cky5cQJ70tI+/MINN5bgmtiRhPOQUctd1cF
         JmiMPXyk0fk+1AZ7R3K6PK+KXdFgczsl23alYCLUUVwkahPi6tZwtULVmwiDHh7qMOMa
         ZiAe7DBDoIu1HMjatKLMNyx4+g2nf77A0MZycK8qfbYeoqtcGMJfEPBcVjjNNbOBgqcZ
         YdMA==
X-Forwarded-Encrypted: i=1; AJvYcCVkmmElrnKkjgPv46AUZnz7HQfMzZBcKAtxvoEt7iHeAEHzjmxoOz+qIxG3Br2iFIDhFAsMrpDt0+baYtt3fXgR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9y0eIHHA5LQvTyhrwqDk9rNCt3XezNP0UYdivaUBjr71uPnn1
	OXISbX7tslNNoHtN753mt7JA6E+huuxEa4GGi5cqb8vouIkjyAWyZJD5KC6K4cbVwdk=
X-Gm-Gg: ATEYQzxvrXPtosim7Z1oUQDymXUk1jmKGismX0utUXm70oSh50pifAlaVQNeyCaShZx
	elRmvoGrjphCQLQCiV+09VdoZ8N1JDesq5q7mQZDEGooBkp7MU0n0vaByMofyUfv+nXfZQGGXxP
	NcuuTXnTB7jN4qkz8OEX6mGZ75gyj5h52hWHyP5S3tCbQJ/Gdqha53uH75Ag6st8kjr8d3f69DR
	vzoEjaXSZbF6/qwaipYVLIF6Ik4aUvFMdh8UsNvzMgUICcMyDG9EhqsjqPji3biYY+1GXpfCFO2
	sditcQ+mn0Z0GuHDv/qHYptmRxtzSar5RGnNL5FOezxn/ozCuYGog3G/EYPBiGHej/EABLvNYlr
	b9tnZyW4wg6cXV1cv1lX+YjKiEgN6lpPdmIjJGGHdqOUsm+mczLf+MxdZG7DiSLz1zk4mrOaev9
	7WUP8k+eFyOfCfBARcGg/mdGibV0ZphfFgGAKOimgyZid4uf3ihz9Ypaq71ITG
X-Received: by 2002:a05:6122:65a0:b0:56b:815c:961d with SMTP id 71dfb90a1353d-56cde34bd05mr1204470e0c.5.1773999557526;
        Fri, 20 Mar 2026 02:39:17 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddb94eaasm1289207e0c.8.2026.03.20.02.39.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:39:16 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94dd7178d63so854840241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 02:39:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3+VQm+Iwh9jocXRbE0j5q+SzXeVDjesUlzzLuEF+b6JCFn/cSAAIe6tQSQrlo7LiIbz/D1Ke1EpnPDIo/Eu0K@lists.infradead.org
X-Received: by 2002:a05:6102:508d:b0:5fe:af0c:79f5 with SMTP id
 ada2fe7eead31-602aea8c68dmr1453044137.5.1773999556502; Fri, 20 Mar 2026
 02:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
In-Reply-To: <20260303132305.438657-1-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Mar 2026 10:39:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJEHU9aBO-b7LAPbpiQA01uqj1s_cqTD8WVg+n+tWQJg@mail.gmail.com>
X-Gm-Features: AaiRm51rurRvs8htKwZeARKRHyof35mEZc1epCRF91aoxz-Fdur6_Mz5Vy-LZAw
Message-ID: <CAMuHMdXJEHU9aBO-b7LAPbpiQA01uqj1s_cqTD8WVg+n+tWQJg@mail.gmail.com>
Subject: Re: [PATCH 0/9] driver core / pmdomain: Add support for fined grained sync_state
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_023920_235594_9CC9326D 
X-CRM114-Status: GOOD (  22.87  )
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

Hi Ulf,

On Tue, 3 Mar 2026 at 14:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> Since the introduction [1] of the common sync_state support for pmdomains
> (genpd), we have encountered a lot of various interesting problems. In most
> cases the new behaviour of genpd triggered some weird platform specific bugs.
>
> That said, in LPC in Tokyo me and Saravana hosted a session to walk through the
> remaining limitations that we have found for genpd's sync state support. In
> particular, we discussed the problems we have for the so-called onecell power
> domain providers, where a single provider typically provides multiple
> independent power domains, all with their own set of consumers.
>
> In these cases, the generic sync_state mechanism with fw_devlink isn't fine
> grained enough, as we end up waiting for all consumers for all power domains
> before the ->sync_callback gets called for the supplier/provider. In other
> words, we may end up keeping unused power domains powered-on, for no good
> reasons.
>
> The series intends to fix this problem. Please have a look at the commit
> messages for more details.

Thanks for your series!

I gave it a try on various R-Car and R/SH-Mobile platforms, and all
PM Domains are handled fine.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

