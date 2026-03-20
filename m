Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87AED108B8EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWUs24f4YfJBpA8kqLFbnD7g02+y5LbUXPOXVNIvPYM=; b=maLj16Nl01BRZVgm5D23dmXfRi
	c+LgTgL+Ycjepa2Z/pU6YyaCdr9Ef2LH4lugUVlEnlGJVIxzwN+CfrPyONLa1X/xx1TiRYA4ALY9B
	oqm68cg+icsM63XKHADgUQ7LTjonfAiJYjuBtDUNOhMNQSTHTkCZFthIhPHEFvVdx7XpVs6s2jzi2
	5QXsRZDbbAadpieEvLrMZnzlFk/npwmQvPgKd8+jDYwIRntW6EWi6a9eVE8YZONdlQusbTuAY+7z+
	ZfBExpK3tla7wV4pI6R5cBmPenSMdIbfQNgE+vkM2FWpmA1jcNxau5iyBZUscEykDbUV6L6k0HnZs
	Wu7YObBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WsE-0000000CYyj-1vFs;
	Fri, 20 Mar 2026 10:14:34 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WsC-0000000CYwV-14B5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:14:33 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-64ea73e7b60so1210946d50.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 03:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774001671; cv=none;
        d=google.com; s=arc-20240605;
        b=Fwrd+0f9YpHvXZJal425b5euIJreVGrbZI/VPijXjYtVOkQFeAFLNVEp2bhAkVGhHZ
         r0hOruDkmeFViD7bKEnvCqpoDrr3PMJQ33i2qoJcixwMX2Fi2qgzZs26qH0pbKfnD9/h
         Q1fgD4oawU4lPLBRGWbBY+oPEpZhg16bUZHDDmuIGhhTI9uXhvL7Xqh0SoFqPgId8XTV
         xvdt4ZLATvhRQ2KPsOvVBFpO5Ajjya7fN2B4hmSR7eQukmib/wMrDQuLLxY48lu7jMi+
         Z4tJj3GLQ0qPKlSiAAHKZGiLYMlQ1pE8lfWYpom0G9pCEMVUJ0V/NrYqKP1RuBAOHoWr
         1YWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uWUs24f4YfJBpA8kqLFbnD7g02+y5LbUXPOXVNIvPYM=;
        fh=RTt0o534KA8TKUn1YMjGxhinHLM7Dqvt3ns2HMnKMHE=;
        b=fgTuqLHHOqhwHsW7KM9Wr1Sw809712lAlU5fc9dv11kkiZ3UpCrYkIpSFsZk7owpqg
         8f9B9QYgGR2MZYbGv6Z8A9Y2a0WO/F/OtMeWJiBwF2ZE0gf5aEQWuf1IK9r4JxeJ96cS
         hzPGp5w5e5NnBqgXSM1vgTa9Eu8ELB/kzumTtBqHWS35Ihx5AvN3jlxEyOGRTk+PYoX2
         Cj6QdF3ng2tWJ0WkP21gEmq6V0kdwXfvB5uG5ttq+BiQ0NSVQiL6Kg//ehWY5/rx5j84
         ByK73FIbatAASJ0peXrqIXCbkklBVkEAOprkoQChQcCEEdWoNcdnyn5ItFK1HD2m/Pkq
         gDeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774001671; x=1774606471; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uWUs24f4YfJBpA8kqLFbnD7g02+y5LbUXPOXVNIvPYM=;
        b=FFfUCcdpYsqPb5fn8z+YBiVn8G63tcGAWjUh9z0/DlJUIitfKlf4xgcTjo+bjXqSPE
         kRKUBBDhwgvbF2AQP7a8+xE010UHZBnTaPtdB59xiHtPa4BMQDzZP5RX22sUQRYrJB6r
         btYUI1ObN2yAJRK4gsopof9Hyo8NEGMxBZaX8e2AnBANJj0OfAj0TFYyj567Yb0iZszu
         VqV5CeqCx3FrLGHTMVLh3EUBaNl77YWmVDfv/PnaFA3GFc32lfx70uVdreKVFjCg3OT1
         naIuHgOiBctUh5wgO4Lw7c5zn2CfxpGaTDbqrNDYH9n7tLdXz7NESM805j5lsQdjXLJC
         OAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774001671; x=1774606471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWUs24f4YfJBpA8kqLFbnD7g02+y5LbUXPOXVNIvPYM=;
        b=R3XWD3e4VB7LFB8KIUrTRM/pGioBkPH2wq+8JPsWIcujfwbyWw/gxm3Og7VWh9w/RA
         ikNgM7cLOh2s5rPvH9MYYg/yu9Pyc7XHhQBucLbM6GuvCQ9vNBrTaz7IH08VBGi/XuB3
         Gte61q9iZjbokOB8TBvKkv4MAE5NJAHxusv5nSUjmhDbiF3IrwTWBYj/0eFXl7tgihJu
         e7lC32ZbL+TGiwxc5JAHHm+bR2z6CvZBLC67+OxJ5IYB6dGEMIrnoG8lHNfBdt7Ztuz4
         FfF68S5l4gKhpxSi2vG4TXN+Dil+FZl2BR3X553Ws3eCAki0pS2dgglSFk8uaWrRExON
         wntQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWhMohXg4+dkHZN4+m/zTmRXBwyKmJcgYThw3OXFnoYbmeoXENF4qVxaX/KLhrZzwVZOW7ZACr93TPK6rQCY7Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0gQmc3EVyzrG9JFd25Tfntj63yjcOIdYyd2+0W+Q7CgG0VqQ/
	NPpunvE+DNcUaJ1TOwGtz65ANYEUwbcn41IGg0aAMKivcaggvbFBDU4+QmhRw7zLHDKCoNxllFK
	PdHpZJRQmXVmSAE+84INLdu7r6b9zzS+7hW51RtHmbw==
X-Gm-Gg: ATEYQzx5m0ZztPXC/1N4W0+PTaIALoHSEp9qQE+XxMf5lOHZ21XYsAeyYuG0bOa9t02
	rUbt9nDUOWnvCU2hMcvnb060Ia33jLFm+LMkBhslyvlX5qOnfSXctuaIBXGYDcsx7eiDuNWRsFT
	iT0+3TisjY+nPioYDhn2d6uffte4ICQNwHiq2B0hgK9a7bRtuEjyy0qk93qlNyMvLyIKm1gLFi2
	goOZvLBGSUkzF3oN2eKNW0EnaO+Xun1JK9mO6pVFmlM/8KbzYsOhUI0jq0SPPkJb9bWdZeKSumA
	WLSz+CaX
X-Received: by 2002:a53:e194:0:b0:64e:a737:e1a5 with SMTP id
 956f58d0204a3-64eaa797212mr1811888d50.42.1774001670649; Fri, 20 Mar 2026
 03:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
 <20260303132305.438657-10-ulf.hansson@linaro.org> <CAMuHMdUK+xePxZc-OXRfDmvQ1v4q5d=HQ9c9aNqUg7gPAMxUAA@mail.gmail.com>
In-Reply-To: <CAMuHMdUK+xePxZc-OXRfDmvQ1v4q5d=HQ9c9aNqUg7gPAMxUAA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Mar 2026 11:13:52 +0100
X-Gm-Features: AQROBzDEPtBNxBgLrC26LFH5ugvz8cl4PrBkxdBc0GOrtjibvOSI_WOUepnh6GQ
Message-ID: <CAPDyKFoYhvTrSXZqrcsbgNTAMZsnwy8WHr=5=n58fNLrEUxdfQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-CRM114-CacheID: sfid-20260320_031432_307596_236EA3DD 
X-CRM114-Status: GOOD (  13.29  )
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

On Fri, 20 Mar 2026 at 10:37, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> Thanks for your patch!
>
> On Tue, 3 Mar 2026 at 14:23, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > Due to the new fine grained sync_state support for onecell genpd provider
> > drivers, we should no longer need use the legacy behaviour. Therefore,
> > let's drop GENPD_FLAG_NO_STAY_ON.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> Rmobile-sysc is not a onecell provider, and thus never needed this flag.

I see, thanks for clarifying. I will update the commit message to
reflect this properly.

> Regardless:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Thanks!

Kind regards
Uffe

