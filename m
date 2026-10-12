Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FD4CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=; b=yJN/iSmPLqPh1ACBf8VcT+HlFh
	E11Xm1XLkwFilgUGpVwNIo3FT/cfgATwRn6gdQ3r6ZOukYQcZQAJoxDM6wfvaT5L1KSZA7EDHZcYe
	m+Nu1GCwAwMvSLG8uzyQH2TGyY7ySS6ia3o9W15yPrub1qB65+cppHdeBzZ+e5F9edYW9Azh+gLLd
	4NhPgPd5Sk+9oRo3G2vcZowpDs9IYgzi9RUf7QER3DcNHlr8fT/Zr55mu4sAJXBf1rL7PlgZWae9t
	1mPm/T4/i45euxHVfIFuO/wtNYtOuMW38FsaXWoFuq+CmILv7doHdm6kg5zEn8J5lnlDOpv6ZUgPi
	31xyPSAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBqK-0000000A0IP-2C0t;
	Mon, 12 Oct 2026 08:57:12 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBqH-0000000A0H9-12BG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:57:10 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-988ccb8da15so158045241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 01:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791795427; cv=none;
        d=google.com; s=arc-20260327;
        b=o3SJ8J8cFZ1s3beJataM68MPY/x1ba2w3f3UQDoiNVHOBo62wbHn3P34j4xur0VxKh
         qXUGPo6eZKAUbRvkLbAPPSq46b11ANuMllS/ZXbDQiR5ZLhw5FC2+MsCKUmMZ32cpe3U
         NcFFJPJ7/p/WfZlbuPwJu+YTba95hD63FojwEy2LEAnDWPBWFUPqurIpdtXhm06BG2pY
         vncMz7vtonoPrN5eiP7KmCzLTWTE+KQdLBXY+DYBqELrX5ldPSSu/oa3G7rVBvoFrKqJ
         b5EhtcTm3F8Bh9RI5AG2FEtIWC5q4voVDMU+N2VRSsatsrQ/12e8+wcOHQhsh/Hel6vY
         syow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        fh=whOwW4B4qQv8aKCj/ttxPDbpL8KbUTuSFYfZVjwDjMI=;
        b=MvGDu+U97olufqw6nM7dKEfGQ1uIqkk/MtnkZWbb2LX3c8JlHUEPb9eFzHxNbbMECc
         2gHmk3Tbr3FNNdZ3yy6cxPuPJf4PeWbI1ccgrvo6qcORnNmVntk1X/b7JLXIYjnWdL6+
         cCvvL7AsV9hWmIBC9ispJoHSNX0aGrAQq31UFV3wK/KqvmTulxcVotZokgImojytVLRp
         sJKWwD906MlC2gBnys1lLzsaKnFal9zyuDJm1q3nIiwoc9fsmCVB0EhOANXoQdSLV4R3
         P4gbaIWt37xkLijtkdilc2X6p8dFIArZi5dGYDG5szd6Z1xiohqFU/nXFuofrUbwMDId
         qCWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791795427; x=1792400227; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        b=bl6pVwLLnYM0XtxXGUXJZ3Q5R7paZjtrtkMZF1WUJW+KvvpsdHRRICHz3W1Om9whhv
         cxNWrVbgquU6nuYQJdOTn22ZF/+eCOZKVPzCoNoD8TLOw47bvLVPL9Gw520fRwz/hr0C
         zZHsRLGwZcoICUYz0y1F8wAr81i+qzcnt5ijRBo9pCerayOL4Q8qKIpoNriw945S+4/N
         GJqGks/5q+WHyjN1amtVFfF+mlODHc6Qlz76uCUBV3EkMezAIukd13uMjagXTMF0bXPP
         AgNOw0mA9wb8vst/2ReSGtvrObFtnOg5ihKWgf1qX5SZ+n2AgE2Wj57PLTzN2+PbjanO
         y7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795427; x=1792400227;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+hsanqcaRD8wERt3PKwcrFG5KTWWy58uIS8hjI8nI1M=;
        b=bhot3YmTrwQHmLboQCKYjXa6zSktyAjM35HfIm+RK61WC5Lqfi/2cc8qdcd+Es/L1V
         e1/WhEGTiqNKE9eQBf9U2mxxWU3oswzE8K592yXIDTUqC1Pn0b+pHlgjQvw8wk8R8o5h
         w9tYlMKUwryuYTTAXrjFbEIC+19+z27lneRuQ79sOq1SUciiChlMFbEqnHv9PxIA5RO3
         OcsEd/JDNRM699L0nwO8nYFhPLXez3WYo1nkJkHpDJ+f3U73T1DJJN4TUDFnqox7s3ij
         7t0MEL0BKfr8IG5zR/+4I6mJPR7ME8qzkfS5+CgmIer3iEiUJhEb8at6FxKdIxujXDGT
         H/Og==
X-Forwarded-Encrypted: i=1; AKwUvBwZci59jW1bHh/n/PgMyDj+TkOnvOO6DEjjrjIzSei9Ggk1bcx0HnciqtI5gXKpQL27D9QJ2eTnzWJ8zOdmtfbz@lists.infradead.org
X-Gm-Message-State: AFq9FYKeN8Cnuyj0Up9Nckm+SnS3j39oiUP4pvKRDW77pkXqSd6b3nni
	MmCZK4KYNv8sw3W6Os7QhJ7g16NnDr6Xltp84NVkIFsj6sTjYheqi5RlAZKfe66ApzKRpjW1Jof
	bQ+rp2bk+wNk3ufEuN4iCi7mT/PBfbfg=
X-Gm-Gg: AYBFou1CphztOHHIGJQElc5rminYwgtPc+Cr5Cc507q2wpuLwwe+AsB3fVDmOccpA8A
	DRFVSs3qzimNZmkzlUs4nOwTQjNAHjP8iNBVlLETb3p+8Lu5oGbCDAxoe1hy+Hwcc0+0oLO5G0K
	JAPEhZQrF/4q7bIPGBYg84c9UCXfaYI4AzkIrqxkEHlgF0mHfeJGje1TV8BqGDjoxJmE4PlitCr
	HHJoyRos+rgTKasl2R7NvTM5C4ALJogY3RcMgBURlJSSc9qRbpWBat4GRxniBe6B23gJHa0mAda
	9uJ10JSCXq5hE34tXac6fqxpEw6vsbzorNLb++5emcx6d9legF80ThaWJYRmPDBMejs4nTB99DD
	KB08P7U4iTB9NDXcQyllvZPQ2YQoyMcGN8XhPwE6EeaVCT8MMuuwNNAHF92Ycj8xZXsJChyJITv
	J/RmlJejX9Mfdl+HpSCciaZSsxZnoDxB+yvYOxUt6O4pPK
X-Received: by 2002:a05:6102:80a3:b0:7af:4843:5ec9 with SMTP id
 ada2fe7eead31-7cb3728268emr2044842137.8.1791795427219; Mon, 12 Oct 2026
 01:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <871p9v4a1x.fsf@bootlin.com>
In-Reply-To: <871p9v4a1x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 02:56:55 -0600
X-Gm-Features: AclHuK9PgSRU-9yDfcYymMtt4yQDEEGqg1HXAOlwk0cudjnkkhK9ivdvdn9hMz0
Message-ID: <CADvTj4pZEH2wj2aHSL+S+jO-MeFjRx+XMqhv+XGLiiukvf28vQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_015709_295212_F3A3C580 
X-CRM114-Status: GOOD (  33.63  )
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

On Mon, Oct 12, 2026 at 2:06=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi James,
>
> On 14/09/2026 at 15:09:46 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > Allwinner NAND firmware leaves the bad-block marker in the randomizer
> > data stream. On H6/H616 it also places all protected user data before t=
he
> > first ECC step. These choices differ from the mainline format, which
> > keeps the physical marker plain and maximizes the H6/H616 user-data are=
a.
>
> [...]
>
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> I am sorry but I do not want to proceed further with this series.
>
> Even though I am not capable of finger pointing what is wrong in the
> diffs nor in the commit logs, I do not understand most of it. I cannot
> clearly explain why, but I have had a hard time trying to understand
> what the commits were doing. The risk is that nobody would then be able
> to further maintain this driver and I am not willing to take that
> option. The kernel policy so far has been to ensure readability and
> maintainability, and my gut feeling is that this series is going
> sideways wrt this major constraint.

Just to clarify all known real world usage of these devices requires
the vendor layout due to BBM's themselves being randomized.

From a practical point of view I'm not aware of any way to avoid
this constraint for any existing hardware.

I mean, without the vendor OOB being in mainline it's likely maintenance
will just be abandoned due to the mainline driver being incompatible with
real hardware so that doesn't seem like a very good tradeoff. As-is the
existing code has received very little maintenance overall likely due to
this issue.

Is it better to have a more readable driver that's effectively non-function=
al
since it's incompatible with the hardware or a less readable one that can
actually be used in the real world?

Keep in mind the patch adding the actual vendor oob format support is
only 270 additions and 10 deletions and is fairly cleanly separated from
the other format handling via the sunxi_nand->randomized_oob flag so
I'm not sure it's really as bad as you are making it out to be in terms of
maintenance burden:
https://lore.kernel.org/all/20260914-submit-sunxi-nand-vendor-oob-layout-v1=
-v6-13-2fb084fe0751@gmail.com/

This code may not be the easiest to understand without LLM assistance
since the vendor logic is somewhat complex but since those tools are
only going to get better as time goes on it seems unlikely to me that this
would end up being unmaintainable and regardless most of this series
is unrelated to the vendor oob format and is just bug fixes or optimization=
s.

> Also, from a Linux kernel point of view, we generally just do not
> support vendor specific layouts. I already told so Richard Genoud back
> when he was working on H616.

Hmm, I'm seeing plenty of mainline drivers with vendor specific layouts:
https://github.com/torvalds/linux/blob/v7.2/drivers/mtd/nand/raw/rockchip-n=
and-controller.c
https://github.com/torvalds/linux/blob/v7.2/drivers/mtd/nand/spi/gigadevice=
.c

> With this added to the pile, I prefer not to merge the entire series. I
> can still take some of the fixes if you feel like they would be relevant
> anyway. In which case I invite you to send a v7 with just the few fixes
> you think are actually relevant outside of the randomized layout
> support.

Patches from [PATCH v6 11/18] and earlier are unrelated to the vendor
layout change so you should be able to take those as-is. I deliberately
structured the series to put all the bug fixes ahead of the vendor format
changes. The ones after are mostly just optimizations that didn't make
sense to implement before adding vendor oob support but for the most
part probably still make sense to add either way to some degree. All
changes

