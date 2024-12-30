Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3AEE77196
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 10:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oDYwfmWwrntu/5R7qEyL0UfVIX5O+dFzo5oPSRGiUQ=; b=Q4WKDNLzTduFos/hhusBih9kY2
	8FMTysDgUeaBTTwgiTsdJSdNpmabMXe5uvF05fmbBY++/R5Fax1H3XlWrKDfqpOFPDpCmR2gtUM2I
	l+Lpp6vNVJkDff1/ICCVR6p2uJF6wqDSOrLDfBbkZKTcxyZLtCnH2LCncjapNJor6HbRVDJXcr2kh
	QBmwSOVr444cGy9GBRPfeOJmEc+E7eqCtSDfg1LgVCQYh8Xwo9cBcsjP8Gu8PPlloi81jTf+fpeVO
	L/TId2LdqM/81mSVRCZij64yB5HmyMMVTVjv8Khg1X8/2RvfnKmd6WLbGx1cQsevN3CD5W4zF2ZMU
	4EKL4pWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCyH-0000000520N-2y1c;
	Mon, 30 Dec 2024 10:26:01 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBnC-00000004sfB-3woB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 09:10:32 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5f304ac59b9so3987671eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 01:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735549829; x=1736154629; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4oDYwfmWwrntu/5R7qEyL0UfVIX5O+dFzo5oPSRGiUQ=;
        b=fDvt8ou9R9yipFDZB1bxEG0iO4NuyJNYyp3465Zh+ZzNLiLN0pPhHvWWHk+93eIyam
         5bg1zh0UW3NWtX060SU1aAhF9/VqV28P4eMubZNFNlXuubmZLYUnIlaBdQl6Jk73bRhq
         /rPPuvjoniBypJtyB0aWKpFA7xSYqTpby0Qc31ahGmTu3hwMsKEI17rB2e1ZQYe+IEIa
         k45lLc47iGEhmER/su3lnOK7OOsNn3F1AxQzZSGXgZyaO62RnSafmd8GN3T3BTLbNVpJ
         iCqoqMkBPymiWUfx0s/pam5K/WVZdEcIGMVtOMP2WYFGRJ4Pqu+6aP12O68hUOocIOjk
         1zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549829; x=1736154629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oDYwfmWwrntu/5R7qEyL0UfVIX5O+dFzo5oPSRGiUQ=;
        b=RgiwbYuxUQA0881aXGD0rXO4LPeYBgnOgYTo21KdZ2hA1jOSWew0qNHlr1qg7yW94K
         j/xuKBC4KyWPn5IkFwcP+ZsLSzu+/L5jy1qVkQWlJjGo4mcESe31Hzx7sFyrAGCYbWUv
         TFJPua+F8yIGvBwm81dGBoQ4dB4bQQX+7+K5TFbROi+kmtFsRY+LxdKBKWo7lfUvnqen
         0Ev+imPg9DKFaX9zoxGc9B5f2QDKUFgs9dG/k22H6lKa+Az3ymhHobdlm5x9EvgGkiJy
         GpczlDH215dIRDCbEleO2WQlCZavk2AB09uWLJjDp7Yen0nIFDheS3AUv7tpE3NKQyX/
         hTzA==
X-Forwarded-Encrypted: i=1; AJvYcCWiIYuCR33UCbLDxYIfnUR/IpyntvmPPjBsNFQxma+2xFpeurgauo3ewapR238gXy/Ub3apB48v7m7bddJhSj1z@lists.infradead.org
X-Gm-Message-State: AOJu0YwfcOThDz7ODL0R6mEQOdV0VvKQjNkAQJYXr+VmAZ+MJvPje0AG
	YhLAT4UMKDqtUBHLtSiDx/M3QgFCPycVcrLl3Jn4SVLr2VqFatoSdKOgWbSt74GfYsvLl/otltJ
	Jhfc8B2RChrbpPlPQYf3aA7uNaOtATkznRzldJA==
X-Gm-Gg: ASbGnct+gpTcaHvcEjpCtR5AwbBclpG5sULxbQ8yb0vsAwORDf/fk50HgwxVwebd1YA
	ru+1LY6rTLhj4qkBbXz28U1R89i5PIrnVIZmOdg==
X-Google-Smtp-Source: AGHT+IG00P+bZtTAkQqWziOeW79L1OrLv1yTEyciewwrT3FRO22FXOr3Xvn5NA3178HyMuWVeJiRoWS8XUOV0qbPyE8=
X-Received: by 2002:a05:6820:1905:b0:5f6:aa5c:8cb9 with SMTP id
 006d021491bc7-5f6aa5c8d96mr3825959eaf.1.1735549829414; Mon, 30 Dec 2024
 01:10:29 -0800 (PST)
MIME-Version: 1.0
References: <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-0-c72978f63713@linaro.org>
 <20241213-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v1-2-c72978f63713@linaro.org>
 <1408dcd1-9a46-4cb9-8443-5aa51d61ed56@kernel.org>
In-Reply-To: <1408dcd1-9a46-4cb9-8443-5aa51d61ed56@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 30 Dec 2024 09:10:18 +0000
Message-ID: <CADrjBPre_zjh+i=_YKYiptiMWT74eWC6LDCveA=dJaQQVwkS0g@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: mfd: syscon: allow two reg regions for gs101-pmu
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_011030_991840_E7A58904 
X-CRM114-Status: GOOD (  23.81  )
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

Hi Krzysztof,

Thanks for your review feedback, it is much appreciated!

On Sun, 22 Dec 2024 at 14:24, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 13/12/2024 17:44, Peter Griffin wrote:
> > To avoid dtschema warnings allow google,gs101-pmu to have
> > two reg regions.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> > I don't really like this patch, but also didn't want to submit the series
> > with a dtschema warning ;-)
> >
> > Possibly a better solution is when Robs patch
> > `mfd: syscon: Allow syscon nodes without a "syscon" compatible` [1]
>
> PMU which spans over two blocks is not a simple syscon. These would be
> two syscon devices.
>
> If you request regmap from such syscon, which regmap you get?

That is a good point, if other drivers in the future need access to
the pmu-intr-gen registers then it would be good if this was modelled
as its own syscon device.

Another point to note is that only the PMU registers need the custom
regmap registered in exynos-pmu, the PMU_INTR_GEN register region
works with normal syscon / mmio accesses, so it would be a different
regmap.

>
> I am not sure whether the PMU is really split here. Usually the main PMU
> was only one and additional blocks called PMU were somehow specialized
> per each IP block.

PMU_INTR_GEN has its own entry in the memory map, so in that respect
it's a "device" (it has its own 65k SFR region).

PMU: Base Address 0x1746_0000
PMU_INTR_GEN: Base Address 0x1747_0000

The documentation isn't particularly detailed on PMU_INTR_GEN. In one
place it says "One PMU interrupt generator for handshaking between PMU
through interrupts". In another, "PMU and PMU_INTR_GEN are for Power
management." and then we have the register names where the description
it really an expanded version of the register name

e.g.
Register: GRP#_INTR_BID_ENABLE
Description: Interrupt Bid Enable
Reset Value: 0x0

Things might be a bit clearer if I had access to the firmware code on
the other side of this PMU handshaking which I believe is the APM, but
sadly I don't.

>
> Maybe you have here two devices, maybe only one. If it is only one, then
> it is not a syscon anymore, IMO.

I was going to suggest modelling PMU_INTR_GEN as its own sycon node,
and then either: -

1) Updating exynos-pmu driver to additionally take a phandle to
pmu-intr-gen syscon, and register the hotplug callbacks.

or

2) Create a new driver named something like exynos-pm or exynos-cpupm
which obtains the PMU regmap and also a phandle to PMU_INTR_GEN
syscon, and register the call backs.

Is there any preference from your side over approach 1 or 2, or maybe
something else entirely?

Thanks,

Peter

