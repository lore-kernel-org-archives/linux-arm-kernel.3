Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C60BCC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 02:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=; b=FrVXlRuhKTN/avUzbpKy83fYX/
	Q0MM/j01FAB56HbST034kRFNI/7SvDGLXFo9+JOaYst/lH5/B29/thuqioKXYwr5Zqiz1G2hhGjIJ
	i930Ji9P2yrCRHj/yc0IYj7ezaeGJoZe9Z1zfLuFJUQ2BR1lMl/kmGCVMakKUS1rY2NUmdecHaKm/
	ZdZfb3CzIScDhdC1PgyCeNHsmhSoeDqHKs+zp6MPHT654FwAo1jEE7cuhALNEGCb38y4FBCtlfoPF
	3U0eYFw1TjD5UF9NFw0I/FRWV6omrXCfQINuD52XuPrv/jceDHsN8qnJRi2znt4lf4F9kqW62yy9a
	AP8ZO4qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBV1-0000000Ggzl-0hPm;
	Thu, 15 Oct 2026 02:47:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBV0-0000000GgzU-0lMG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 02:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=; b=nABdBhuaHXEmocJ5We4tVIaENb
	EZjT+gpUbCWwWQBzVUR3urdLu9PZqITxQ2NTdC8xu56E926+PWBuziTIx6BX+Fay9tUvA1lTJZ7kv
	b7wqQ/SN+8U76dzFESIs11wcBU4ckjUo1YPpsNKccCuzmjlGuB/mlvaR4YuNaJXRCQt2YuD/TuqMy
	+RVIN8CJNU3TisHMuq/ZBe24lO9aCVSN49rupKHN1B9q5L49lXHMvnK2vR0DVqo2C7XZg2t8T1D0D
	CebLT4Rj+k5OAQUGHXeCOo27kYisTY29w61CfZyZIZnKYBszLroLTT8Xmh979pnQYY6Lv2wqQFDT1
	vRQz9gWw==;
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHBUw-0000000HOhK-2fKJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 02:47:17 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-98c6e050c5dso542411241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 19:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792032432; cv=none;
        d=google.com; s=arc-20260327;
        b=VwgUfnry4jo+IHc5kqvHyfke+xm3S6bSSeHc7zQ00XRNryFmEEINFP+cirzv4BdjKI
         bCk+IjZgUezqyIaa3Itie1jgxlXMgbzT8+zxzbTNrVlPS1verwdqE4EGltXMzI2RC9Bw
         cUyzdrf8yllr2OD9Pw2zz7NK/+Ns63YUqvRKIr1PqSFygfcqtuXE+ay87RdNIYZwQA+g
         fTDm5GHjr/eailAnzigh8h47eMGpK9SYcxVXRJZ1JA2XbrafxJ5+90Cx9lUb4NxUy3I1
         UnLpKN26cG7JB6IU9SRPI2eAjO8Qd08INp7LxqN4Uhs0kEB+borRuT1SCTzwQM6x91DB
         AU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        fh=dsZQBLEDOyRzZq+MQt2jICQiDx5RmXbI/PKgwmN1iRE=;
        b=JdXfid6i6bGzwmy4XPCFyHw56xcUArWybe1INVWmfxIa02WEeKZ8UmViqUf7gH7Qpm
         Dl2AyrFz94nSQr27Prx0ITmhqBcy/O+sVPvj27Uc1bvlyrytsEr4E3DaGoOtIlYMcSX4
         f5BKaZ4JMAnrtRKUfm9bYh1h56J2d23/nNa8r9q8lb1Yf/RouCNvaPaDYaC0XQvcWwmU
         yZBbnnmx/+esDa/14xbbxKENR9g48TZoOCA+ls4ECWkc60BmnisFCUTwNVvRr+zGmIbC
         zhBR/65+j6P3w/a/iC/KDs5otWUqGyed+yMgLbSfJcygPUS+bBhaY0n3wKjK8Fyw/jIE
         EVFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032432; x=1792637232; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        b=hdMYd7mlYHyPPPWMRLfbFKuqbNW5x9GKp+d+0uYnEs5Hjj8RyvsEvnneO2i0y/FzTd
         RRlEniwdq6gv+CGdBIEK2gxeH2qBEu2lJbNGezouwOK8lSc/Y8H/lZWJ4YPrT+G4uB6r
         WGkPAvuYxHAG6vs4jRdQPEMt6w7Ns7p8Y/FMSR1dfobFulubuzBLA8wGkKbWg2Jp1CAl
         kjXQv92B/3c9DT5pxs7KleaSZQsjbQNZKTco1dbzW1J9jMHhrxhRK6VlFj0zGBHxLXhc
         fdMfHUkE5d+wyGxgYBQbTdxbyqh7S5cqLIR6FOszHpOBAYcyI0GnXkU8OupoJpE4qUJa
         LB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032432; x=1792637232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        b=zbazqJdOGLUz9UnppkE9gERRHzLrWbMQWUg+Z9m8NQ3mQSDPAhqjx/xBCXPfTShyQT
         /8l7XTR1hBjuTTK1w6btWUE7P1je8RzCXmSFB0tXLCYoN7IIuMAz/cc6SWRXsA1zkpBc
         1mWPO9LdRnNBwBDR3jCTAP8baarHArj32h99BfVHh7PDql22ElEsZGrfbXGsEAUrfAZK
         8w6H/PB4P+2w7r4LPg3ylcQdEzorPZNO7rficbxQ9mp9u0UP5hMthAO9o3DyBtlw+ddN
         BJtXImUkDoPk3n30Nc2zFhjLSJTMFLIcAXDV+LVr2EJR02I6lNpRt6wg3vW8FRAk9GxM
         GUUg==
X-Forwarded-Encrypted: i=1; AKwUvBy3O1W7YbxcgACrc2oByg6ouBAZe+nPZTKGzYpL8uOEzOUFtivrWBFwjo7eccsdO4vhAvu96Sv0qaSZGa6BbK4P@lists.infradead.org
X-Gm-Message-State: AFq9FYLXMBBc1QEUFsbd5k6ZRAResIDCaFBui9oBWOd0cfq71JXRvLpt
	tmh/b+QpGWwbCm1kurRzdLfZb1qY1rxB/m9G9hSKef8K54uu1WDwHVbD+IxLcbGEb1CI+a2WPha
	iCcPuG9eFJM6tojxJXpxeq34Y65LMfhw=
X-Gm-Gg: AYBFou0FRH/WQFY+lAOEUQ/2HJ3vle9MuKBt2jGMzTqYBKIutwgY5nzfBDYLnXsBzkF
	ZiMFiN8ObKur5VHwgEpdvaszbXxTk2x2j8KgLPra+nm4cHkr/ANZLSwIcInMWOchr/Ys9jr2YwH
	hfR9HCB4u/zytTSjXBo8eqQBMJRipCmFeNFLXpzZ3WtHvB6SaeG8LKG6hl5QRrgZBBF7EfwX/yA
	AeHx8uXhs8gqdrnlXPaATEKJf9udOlwFxjoM2kpDfF7pTJbfQwlblNbvCE274V3TzcF0IwuAhnl
	UnUSkp2uACmE487h4FdiBQAFg3Us9M1xueJSvO5GElspqrXqpwjY+PAJcgbA11iTuiQrXGpL6TQ
	N+N9lCL4JdBY1ZHFlsRAQhUFIgrWpxeZcSGV+vmtbNeoY2R8jlJ6UjNMQiojFxnqnnJ/5Irrxl4
	y9j8AFpk/VxQB40m7zPNbDybPyDHFPTNMm3J0wBBjhh+3Z
X-Received: by 2002:a05:6102:418b:b0:7c3:2f13:d905 with SMTP id
 ada2fe7eead31-7cb3668b831mr6416805137.3.1792032432146; Wed, 14 Oct 2026
 19:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <871p9v4a1x.fsf@bootlin.com>
In-Reply-To: <871p9v4a1x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 20:47:00 -0600
X-Gm-Features: AclHuK8WjfPBl-snALh8yjK0sT9hEMdsL68lGw63Y8O6sDBZaP8Ds_BfAoAdcJg
Message-ID: <CADvTj4oCVOBiY-55OJt3xFaOiBrFVixmK=AmTRt40iEisDSO2g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261015_034714_891022_606E387A 
X-CRM114-Status: GOOD (  28.77  )
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
> what the commits were doing.

I think I may have identified a substantial part of what made v6
difficult to follow. Format-specific handling was interspersed with the
PIO and DMA transfer paths, which also implemented similar ECC-result,
OOB retrieval and erased-chunk handling separately. Reviewing a change
required following those interactions across several functions.

v7 01/16, "mtd: rawnand: sunxi: centralize OOB handling" [0], separates
those responsibilities without changing behavior. The transfer functions
retain command sequencing, DMA ownership and randomizer control.
Per-chip OOB operations handle layout setup, marker transformation and
interpretation of completed reads. The existing formats share their
read-interpretation logic.

The Allwinner addition in v7 16/16, "mtd: rawnand: sunxi: support the
Allwinner randomized OOB format" [1], now has a clear boundary: its
layout and page-classification rules live in dedicated callbacks,
selected through the opt-in attach path. Its erased-page and bad-page
policy is separate from the existing formats' interpretation.

Common hardware helpers remain shared, but adding this format no longer
requires scattering format-specific branches through the PIO and DMA
sequencing. That should make both its behavior and the preservation of
existing behavior easier to review.

[0] https://lore.kernel.org/r/20261014-submit-sunxi-nand-vendor-oob-layout-=
v1-v7-1-5d3fc6ad2da1@gmail.com/
[1] https://lore.kernel.org/r/20261014-submit-sunxi-nand-vendor-oob-layout-=
v1-v7-16-5d3fc6ad2da1@gmail.com/

> The risk is that nobody would then be able
> to further maintain this driver and I am not willing to take that
> option. The kernel policy so far has been to ensure readability and
> maintainability, and my gut feeling is that this series is going
> sideways wrt this major constraint.
>
> Also, from a Linux kernel point of view, we generally just do not
> support vendor specific layouts. I already told so Richard Genoud back
> when he was working on H616.
>
> With this added to the pile, I prefer not to merge the entire series. I
> can still take some of the fixes if you feel like they would be relevant
> anyway. In which case I invite you to send a v7 with just the few fixes
> you think are actually relevant outside of the randomized layout
> support.

In v7 the behavior-preserving refactor comes first, followed by separate fi=
xes
and optimizations. Patches 1-14 do not depend on the binding and Allwinner
format in patches 15-16, so they can be considered independently.

>
> Thank you for your understanding,
> Miqu=C3=A8l

