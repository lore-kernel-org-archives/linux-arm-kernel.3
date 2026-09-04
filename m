Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B078C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=; b=c7PC85dvfnu+I1upBcFiSyBpVX
	tHcDn+bdQseie7Tj9iItxrr1Ee8cHcu+x5R3XyrhKXz3C1kjm8aWn/BtInQCM4RMtFu68h43z9MRd
	q8ZFAKNswE4k5Ywr9GuWt0bUj4ZsyOQinGFLMnj9rHe/rPHkSSo+CBcIxI+eL+6oK7Wx1VQ/Xd6wV
	Swkka9Ik5HyPu5efUNllKVmQ0BjdPyCiQihFl34Uq12pD56a6zswwGGhsPOY8rDW5YPAMbYe/UBU8
	sHJUW3aw4TUhH4K+E0M3I+REi4fvCCPTcnBw8ugf0X0/xTTulaDiyTOYZ+e47//yQwMijW6qLzr+C
	nVPYZ3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P3t-00000001Lcx-3e4o;
	Fri, 04 Sep 2026 08:14:13 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2P3q-00000001LbQ-49Ho
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:14:12 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-66c70f69d3fso613534d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788509649; cv=none;
        d=google.com; s=arc-20260327;
        b=TgbeQzPaGab8gUrld8RK7Y6ZCCo6pm1k9tMor2q0b3YlO4k5NzvKSxBnzP6Wgo3a/L
         bRXn03keeCxQeCSEa8WkAhSDlNnj2CZUhS3CuWDNkpFHwQgR6rqCIalBxtOqREmqxUQF
         ng58nYrCBxjR//cU7if6IuRGTBxwhM7vjZxPtaU3yv9Mc/3tcCjxlM7rGCzUyitkZGjy
         rsgsZ4UC5r1HMJ+znJsvdZgYz1phssc6bmmd+z/RC5IqqLiEm6RSrj4f8SHWfns3mttS
         NjbsJWCT51Qkh5LgMUUQmBnobuVOuSrclu3RJm8LqAJ2Oes7tYHBSY9lkrSz0bxkLtod
         u6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=;
        fh=xcR4g9w2ETKjo+bjTeG/U5fB+8zhJoGxuLxZSnRrndU=;
        b=HpslKDQ8Sbs+ukSR/JNt4hhO26Nug3eGmYxQPFvMS/ync8kfH/H2p0534jKRtd37Q7
         /p50VHrnGGK5gucjkfVqqqnOhfoHUAYHmp2qU4BLPQS+gpyrAdFPJzb3KBhDSTk5xJ+l
         AEIimfdYB6uWTgt0nN4x/rf4zRaMdSIYPf9RFU/W4rhjXBPfI4DLsyaPmtzERElOpWp2
         xk8eUCClHIIHpxBvgiHiGJ2frIaeNM5v4rkRVyHRAfHYWgVPhKSjZOHXSdFfEXIg+G4o
         sFULmnVSZ6zuCTHjDjz5gX/prC6m8iVIqmhgSSi1l1kEZRAjcpGKJPksU3xt0ac4C/9z
         1Aig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788509649; x=1789114449; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=;
        b=APW5BzcJJi2VM/4/K8/IQ60M+u0p/PiW650nx5f0bVl/c/18YGhlWd0Wvp1a3jiDJE
         d8qDPefK9RGNHF3jKEsFefU/bhKEwycE8ZAHdfg9XaemLOzTU8M5imeSlQEtDkbpPi6Z
         GFij8THFkugk1PNlPw9R7z3g8jviqs3rg+5J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509649; x=1789114449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBqFv7ZNVkf8/OWug/8l6emlj27SIx7U4VNemvpWjT4=;
        b=ojwuFYQ0SmULEXhR7n0HsUrzdkLrgNoRxiBouh5Uvlw9VLLemOt1DiUVGwDCBo58S6
         oC9TvGw1zJuUY9owPEREOkXYu6XAt82sNs+pY/dC0rngNgdocTrSiiiezG5ogjHJ+ahn
         rQNW1Q964oghIHy0XYgtCPGcM9tdJeusrUhSBugslgalySSy1T9R+hpmaX93/pfZZsFK
         9Q5YC843xQzNhAPekRSaaOz3zPama2BdO4VPDT308X+ejEz9zQE8lOvL7+pS0/6mS3MT
         +a6JhxN7lIKbBu00JRSaKd7eahepmWAMpTVdBQ+Rr7by4bJOUQq5i/EDQn83EahnuIza
         fgWA==
X-Forwarded-Encrypted: i=1; AKwUvBwdK3XqVJOnkFrPiSFeoK0xK53f3VwdaxW8qTGXk49tCf5vt0cxZpUS7q8SNeXJC3jRpswmQLgN8/f9JTG+bhrL@lists.infradead.org
X-Gm-Message-State: AFuF++m4kL/chApvGzKp9DZtvNLcE+hnPxWytkYPrsenkHA9+ZXObmEi
	3bO8quyGhL/BnJHTgPa/jSipXcoRaJv49quDqmqkZ8K2XlPqxu+JzH/g3Q8mZZghO6EIH4twPUH
	H51zn9u8/kK0N0v+hQmbc/JOy6ZqtSeh0+nuVyvrcaVrwSMl5rT0=
X-Gm-Gg: AYBFou0DSGtO2XXTThjeHmrs3NsFRwYuxm+LJ20kD3ZF12WA310NBipBcETMIoQ2JkA
	rB/0SQfjCBcu+cbz7SwMpRDW6F1JZFyzMqB/2CtI+ezgTuKuk4CHLOfuijkNF1CVwpsgjxrQXtN
	27u1ngJre+6dwIqHSbrzJGuefc4p5LbasEgx+L7Z9+teJ5dW4KO5EWV2yv0Nj+AuTHVeNU2dGQM
	44LZ3N0Xn7W09zhlIa/tvvO1PrluZt1dcjFf5eKHa0uOw3TnnYRkYPxpswSvFUztOxszFpLvO6s
	U0WNoFXLTqhtmzO/4YfgPDhXrjyiHvU84FZeKj1jpk3ggO6Xsr8OT7WqdlJlWFg9dB4WNnoes8T
	zztpCg927
X-Received: by 2002:a05:690e:168d:b0:667:770c:f88e with SMTP id
 956f58d0204a3-66fb5aeafe7mr1463610d50.45.1788509649151; Fri, 04 Sep 2026
 01:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
 <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com> <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
 <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
In-Reply-To: <36f2775a-d332-4913-8e9e-ca0429c3f713@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 4 Sep 2026 16:13:58 +0800
X-Gm-Features: AcwNN1XC4LXAm1BwVIM4UDg-tlD1lttg9AE64QKW3tHBF46eVGyIPLVMv5NqRcM
Message-ID: <CAGXv+5FEx=H9r5MGequDpH3i62FAWbXdwkk66eBj8+ziT1fhMA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	YoungJoon Lee <getfeus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_011411_105784_FFB9ABA9 
X-CRM114-Status: GOOD (  31.43  )
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

Hi,

On Thu, Jul 30, 2026 at 4:23=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/30/26 06:51, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> >>> On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.=
com> wrote:
> >>>>
> >>>> Hi Chen-Yu,
> >>>>
> >>>> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> >>>>> Hi everyone,
> >>>>>
> >>>>> This is v4 of my MT8173 PowerVR GPU support series.
> >>>>>
> >>>>> This time around Mesa was ready for basic testing, using both vulka=
nmark
> >>>>> and glmark2-es2-drm (with Zink). Details below.
> >>>>>
> >>>>> Changes since v3 (all in the clk driver patch):
> >>>>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> >>>>> - Added missing of_node_put() in remove function
> >>>>>
> >>>>> Changes since v2 (all in the clk driver patch):
> >>>>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >>>>>     - Needed since the driver implements PM domains using the gener=
ic PM
> >>>>>       domain library, which also depends on PM
> >>>>>     - Fixes build breakage (kernel test robot)
> >>>>> - Fixed "RST_DELAY_CNT" name (Brian)
> >>>>> - Dropped unused mfg_desc (Brian)
> >>>>> - Added check of clk_prepare_enable()'s return value in
> >>>>>     clk_mt8173_mfgtop_power_on() (Brian)
> >>>>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> >>>>>     (Dan Carpenter / kernel test robot w/ smatch)
> >>>>>
> >>>>> Changes since v1:
> >>>>> - Adapted to changed DT bindings
> >>>>> - Dropped driver change
> >>>>> - Use same power domain for "a" and "b" GPU power domains
> >>>>>
> >>>>>
> >>>>> This series enables the PowerVR GPU found in the MT8173 SoC, found =
in
> >>>>> some Chromebooks.
> >>>>
> >>>> I'm making a pull for Stephen for the clk changes. Should patches 1,=
2,4
> >>>> go through the clk tree? Patches 3,5 go through the DRM tree?
> >>>
> >>> Only patches 1 and 2 should go through the clock tree.
> >>>
> >>> Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick=
 up
> >>> DT binding patches. Otherwise I can push patch 3 through drm-misc.
> >>>
> >>
> >> Not sure if I can really take the DRM bindings patch through soc.
> >>
> >> I will take the devicetree ones exactly right now, even though it's go=
ing to
> >> give warnings.
> >
> > Apologies for missing this, but the first DT patch depends on the clk D=
T
> > bindings patch for the clk ID macros. This is causing build errors in
> > linux-next right now.
> >
> > Not sure how we can fix this right now.
> >
> > Brian, would it be possible for you to split out that patch into a
> > separate immutable branch for Angelo to merge?
> >
> > Otherwise Angelo might need to drop the DT patches until the next cycle=
.
> >
> >
> Yeah, that's so bad.
> I'd be happy to be able to resolve this, but it's too late on my side.
>
> I should've checked the DT patches more carefully, my bad: I got a bit to=
o excited
> to finally see this PowerVR stuff working on MT8173 and going upstream.
>
> Sadly, I have to drop the devicetree patches :-(

This is a reminder to re-apply the device tree patches from this series.


ChenYu

