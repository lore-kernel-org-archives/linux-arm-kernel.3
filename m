Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEBAC54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 04:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=; b=HhnfdlbwDwblxmXDpl5XL8NIsv
	XkPOcUAEj9LC0Ag+Sg0YRoIQlql1Z/w4ymK6EnuXatMrNbN95ttoVHVSukX9fDZe1sSsw3BCvmvbO
	fJ3QMqH8hymdZSk0rJuXtfdhKx1R5matj5G6MdCRq5TpCaAb9mtI6VmjMhegh1g3oR1wu+yju7FS2
	0TS8CRGR3T07yys47SkDEddn47Yirwf64uhv7rISAa/wavZjUTNw83Wkls0nyj92B3UYeCwk+5sp4
	DvMTAhqK4Wow2E5K7NUUKRqI6IQQR5K7DBnLzkp8NZ2iKKiKq+Kxd8H79reEjnRHriwK/amzARCLi
	bl4t4XXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIk5-00000009VXf-3Iem;
	Thu, 30 Jul 2026 04:51:37 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpIk2-00000009VWU-1T1x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 04:51:35 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-81062fdeaf5so6517657b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 21:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785387093; cv=none;
        d=google.com; s=arc-20260327;
        b=dxQa+kE3Aju6oALpCg3DycUG6FLHNCXpbO4jNCj2UlPfBf+DrsFJ/66ZCLvS56xWEe
         nRu8FYATVr3JqBHw2n96Nz7BZV1Xogo9NnLRfg5zAEqILcUcxMgfAGnmkhd2Af+6LJ2a
         H3H0fSn6cdskSoJKWuEjZHt84yazniV53eGdv96ao2nf7pLdf1j4ep6fBf6J9jHQiJmd
         MVhfh1dYK5d06Lk/Sty0UTbadb988uydnD6ZH+aT9TzzFteL0ak6C2WhxgBIviyJK3v8
         /ywvHafvhB8CLc/gm5G7r0dSxTzMfUZBR4LgyMH7xEzOqcGCfvgA/3Qb3AlACpQzhPeS
         Dz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=;
        fh=8tIz0isL2qPVY4TN+9QjHZoqfOBEviQ1gCEuix7D35c=;
        b=mK/TauwtBLJSvul9NdRAKCoAVk80Q/nTyam2+6IO6/yyDdZLavuo9jSbdKq1uPXUmE
         MeMSerEWzdS7lzzuyO2tUnJbKH4pTkn2AAZrMC6WNY/xd72ntyVbv8dAAVz0lO7mKxk5
         046fSF0BJJuErM+vuhe5P9MLmwWTZYr3BCmr8SIP8L6VhLNWWKN45CrUBaf3DoaSuYvU
         I7q40YPtV5AwkWe0WE+N8SQV2dW8/7mxfuL2OKKqzgnNvTgotNurIOuBFbdkItIS5xQR
         36aaLSSrLyHu+3Ud0I1aw7XqrEVUAcQCMECjH/TVW/GGZ2ar4mr17h7IbT3bzUBLoLQV
         XokQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785387093; x=1785991893; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=;
        b=KW44Ew9lnL9QiBesEKNNqfVNcG+nvCV0ve9cMIuAkg4LkqJ7Arrk68RJZwx2Ti0cEr
         r7b535jmigc7xdvDDnF2qq+srnJb8hnQB95UDktHeu1nLFEMh+GksdN0nn14zH4+xp6E
         ThHsMN0+pmKA4bQSR2z+ZMWIFUFUPvarVB8n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387093; x=1785991893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayTdrhGTmTRlS5yubk7pA+8kF1TugqiIc+iTJFgG25U=;
        b=cFd16aThcCvCF34rrYGesA4UgzE/TyIOGRvOMZtRrzNP6MU8BKoCK45NHse9NRpw3W
         9fCKUs7svBiDi1/uThJ6dsEeqVvwbI3uJEksyFtSbthp9kipU3jIhXpCGVT0+o/LjNUp
         pObdsb+/Sggq9YBXzwVSAy8VJwYwbYozUoxryxnf6NKVdi6hO5eM+atngJgcbARrIxGt
         cIXM9qlm5qzXaVCzIy9Q2twtDXYhiX/a/otpa2c7XhTQJuHiyOhPAfhY4w1bociI5y9V
         xyHTRcdQCuDuVop8tF9Hx/nGt4YNBqgzTe2ntv9p/by1O8nZqAQ4VW/xPr4unssAaGSR
         JTjA==
X-Forwarded-Encrypted: i=1; AHgh+RqgTl7tzv8yqVh2fNk5XM9WWDA9JYLtr1vRGR33eb3w14q4jWFMX+e9mTPz9euAH0DovYiIFgjPdn4NAgLN18Dx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsh1ObsyIIvyqeevyMrj6TeDwPymzCEXo6EMJagn5HKZpdxDfc
	dHNvGK1P8W82cehHL7fsy29edw3kratX3ydi84EEqX8O4j6JAh3oir/YFtWQ9ie6dR4kZIR4b3i
	mnNTM1WSIWycCQhsognjVpVfzidjOLtlZVzFeCsC9
X-Gm-Gg: AR+sD13eV0K/g/3HLwoy454VLY2OVBnW1BzOg8juzZhYHW8t747wlykmWI8yR8mIUPx
	8Umha2+GCpL6RsIMjz7l3+xSYBC5JLs95MPY1C1+EsS1bWjFR4OeqmSr4nEIYwBuFoSIQzAVm4v
	1gF0hA1qJES3WYllEm6oXxJHJbC/EKolBQT1OUM4HcqAJIlpFFWTDNlW4T22lOA27VsxCftLuPs
	vCj76eLU4J3hoyjnbvz4uFNwgkCDhkWR7tXzP/f6F9IcLqCrWek9zXejZk5ghSflRCV7PYo90zh
	ho/LJZoVw0Oi0FHQXkFa4q9Rwhqgox1ZEh3UC3TkqBjzDYoT84nog2FLskq/BKMPftrXGktukZj
	LaJT6HYuadg==
X-Received: by 2002:a05:690c:288:b0:81e:ba92:b253 with SMTP id
 00721157ae682-81fb964be1amr5292937b3.4.1785387092765; Wed, 29 Jul 2026
 21:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
 <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com> <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
In-Reply-To: <c1048eae-72c5-4e2e-ac49-25e2c4297018@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 30 Jul 2026 12:51:21 +0800
X-Gm-Features: AUfX_mxnxexVKpsRakYQvwrmIlkydC8kB3j1QZQvD5J6WTjr-o8egQw_wYmWxF8
Message-ID: <CAGXv+5EgGYFVt4TJCysQgRqA1J5=Qz9c0oWY5YTxgc5PnNC_AQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
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
X-CRM114-CacheID: sfid-20260729_215134_449365_3A43BDAA 
X-CRM114-Status: GOOD (  24.66  )
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

On Tue, Jul 28, 2026 at 10:33=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/28/26 15:13, Chen-Yu Tsai wrote:
> > On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.co=
m> wrote:
> >>
> >> Hi Chen-Yu,
> >>
> >> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> >>> Hi everyone,
> >>>
> >>> This is v4 of my MT8173 PowerVR GPU support series.
> >>>
> >>> This time around Mesa was ready for basic testing, using both vulkanm=
ark
> >>> and glmark2-es2-drm (with Zink). Details below.
> >>>
> >>> Changes since v3 (all in the clk driver patch):
> >>> - Changed pm_runtime_put() to pm_runtime_put_sync()
> >>> - Added missing of_node_put() in remove function
> >>>
> >>> Changes since v2 (all in the clk driver patch):
> >>> - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >>>    - Needed since the driver implements PM domains using the generic =
PM
> >>>      domain library, which also depends on PM
> >>>    - Fixes build breakage (kernel test robot)
> >>> - Fixed "RST_DELAY_CNT" name (Brian)
> >>> - Dropped unused mfg_desc (Brian)
> >>> - Added check of clk_prepare_enable()'s return value in
> >>>    clk_mt8173_mfgtop_power_on() (Brian)
> >>> - Saved error value for return in IS_ERR(data->clk_26m) branch
> >>>    (Dan Carpenter / kernel test robot w/ smatch)
> >>>
> >>> Changes since v1:
> >>> - Adapted to changed DT bindings
> >>> - Dropped driver change
> >>> - Use same power domain for "a" and "b" GPU power domains
> >>>
> >>>
> >>> This series enables the PowerVR GPU found in the MT8173 SoC, found in
> >>> some Chromebooks.
> >>
> >> I'm making a pull for Stephen for the clk changes. Should patches 1,2,=
4
> >> go through the clk tree? Patches 3,5 go through the DRM tree?
> >
> > Only patches 1 and 2 should go through the clock tree.
> >
> > Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick u=
p
> > DT binding patches. Otherwise I can push patch 3 through drm-misc.
> >
>
> Not sure if I can really take the DRM bindings patch through soc.
>
> I will take the devicetree ones exactly right now, even though it's going=
 to
> give warnings.

Apologies for missing this, but the first DT patch depends on the clk DT
bindings patch for the clk ID macros. This is causing build errors in
linux-next right now.

Not sure how we can fix this right now.

Brian, would it be possible for you to split out that patch into a
separate immutable branch for Angelo to merge?

Otherwise Angelo might need to drop the DT patches until the next cycle.


Thanks
ChenYu

