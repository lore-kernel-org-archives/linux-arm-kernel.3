Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372A4C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 21:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=; b=DRgrs2aP3gAcELtKwV+NaY6YYv
	OXL6CQnLM6U93QNd1fN+nl7rPqcCGlP5mJfT4QB+dqK6ELRRsysVT6x7qRubMD9s7sBX+jP1kgR+a
	TDfAdT7KMLoV0Jx3zJSl0ZCoD6r+DnmC7qbmrhKrN0C5FhZfB9FmBLT9/0ELB1Rfx5JfRinSXN6an
	qidS1PesqGgQPVyOHuQdA6qEUherPwj6+vArFUzShF/kNpIoNPy3vpeTAa9qL1O/OMSVpwA4KHW7l
	9dq65Gm0L45ChSNQB6bDhamfmn8MkkEv7qJXZm55bYSXXykR1vZB/eiDr9u3R+E+RBlRMErzbBhNj
	ipnnRebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRUP-00000008ge8-3IBD;
	Tue, 18 Aug 2026 21:36:57 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwRUN-00000008gdZ-0cvZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 21:36:56 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-74d55dac06dso134999137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 14:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787089013; cv=none;
        d=google.com; s=arc-20260327;
        b=ZG6qURB5yvG9OUXO9NZtwBcEEBTpmnqK86iXyUEKzks4Oxlawvduxfqe1+xCSzWL2D
         czQ4qUqbflulcC4RZQznm35A1CPQA0u1VGKRnY3fQ2VLoKBrQzO+6e9p24duIPPTlP1D
         /g/3jNuL1/ifzmW04Fn4p71aiPNK61uNVZO6wAmZ8l+fn5TQ4kRfRBIf7HlKFSsomUqW
         ITNybiJhvI86M269gVTveqlkgPylwFozvCyK9MN3Ztzbsit+YSSFFbOee6u/oMCbwMHf
         5ryTtwEcWIuYB43Wtda8pCrQjitPCkoMUI0Ky4qN2GrUSGgHbuBiOTnHel/SjFYEyYwa
         /EJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
        fh=dmVaSSZPBp0HjYEFpHDlmn+Xecr3NglXCNSDf3WAe8Y=;
        b=Lsp9UDtJjTWam8uNjug4otWbh+AoKDeAtPNXR7WzNNc6nVj8IeT5QShhsN+Pfmaf5+
         3T9trkZE5Q7mWaexYYOv08A3D/hzbZC1tX5GjW+BN2i2jw4diLxYh6s+gjyrljRnb3pK
         r6D/6S9ApXk7yFUmgfyoxIPGCEPRWpR6uPfddcqpXuLxoBXtPAp7CzGuwlUXCBJ9bUcn
         /zsbn7Da5chxvmwgQTqAL8Gzq3meCBkLSaM0e0dSVQXeH7us8M4VzmPJWD3urXwAYWTg
         pzkdKhvUVGCRhnjY7PVfTQHYOWziBcuWwm8CgrufKQA0tIA4JbkWWwKrITCipbD1EeSK
         3WZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787089013; x=1787693813; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
        b=lJnRqNg3HYX/hWkUfMTclJ0RGO67eVCtCEjX4mSzUXTwbgqHVrsdHw3QLQ0YzqBGN+
         LeQuCdewFoQSHcA8q9hstNjJoxljKMwPUZHAUg+ua4/dgEowht2thXWpTkMiL6wTiaoG
         SAfUCIV0PDdTxN3PQ8R0C9SmA/MiW6SQEMbHmN9PZc6xkS8GR2IZxle+1MAsdmaApFnr
         74NPdtQwSPELwpmgh59e8UO0x1IjRi1YRZdXCSAWzq2kH3XwPh4xvszcoRw4LyhVUSIC
         Rb24BurM0Dg5xs2OnY/hrG0JssFz7T27Cmi5lAAXAWau31dLqsBeLUKnAtwaLwjZZOKe
         SewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787089013; x=1787693813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
        b=PjXNoWjdb0tJlbRaw8qMyAJpSRGVxqZmSyrcZijUYT1IL/unumNvFSoLf0TyAqqb5J
         qZ88xg+rNdUDCX9sR3KfivhyfuTxPxpHw8K74jKnpYVuc4c6vci7zf479nGEinJpD9tD
         UcJG8Hso1AGYXABA88Mkk2L9RRxIAm+sCbnDDhNwcgCiLzFaSRUYJig3ZNiAaYg56KF5
         NgwO43rdBTPTaI0qzcx7WB6VnDs6C+lET2ZF8ALJcJ/x9LYl3FO7JR9a/4spjJt85hCd
         hJfu/lRpsE7ODxyB7Kzu9mKZ0odCUMz5GSABjQ+VC5m7LUvkp7eTMDy8cMyOJ+Laovx6
         x5PQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAfDeNI96pr8UwNwWrSCUHuXY6eXxqHqJUGwwJqeFVmz8UiXDA/OjW4r4DhElvK+inqyaajpV1egSL9bxae9WS@lists.infradead.org
X-Gm-Message-State: AOJu0YyuNHRUxdqQb8kAxy40YeJVhsZMzXJje6oPWLho9q72/PBJdXp9
	BVUIllVlD56lMeozJ+MLQ3H+2dpo+mK7V/IPnJgjn4cb/RpiI8HRTYi7X1JojNsxp3eGfZsgPBV
	LD2G8xLZrTYsLgSGwCmLsXOdtLK1lxpo=
X-Gm-Gg: AR+sD138d/bFHSG3PfA90+1L0x3xPP/RyVJZKC9QDEXB28sVkzhE0e/9ZlKcXKqnOf8
	IWioGwuaFh3btk8FCcZr4Wdrt+yh5Qa4aNpGgnodq1MhtfZy0Y5T/ECkY/XuiV7BG9MTHp72tP4
	jqZxWP7UnVWOJL8B2ZiQBoH0hxjhiIOx60Z+E+TFxEBxx8gf3sz7A8WLB+wb8EHeWnIdtJiE10W
	Ve66wR/3+Veiy1MVPucxn3FPEzXTI02I+b9Sa+9H5/8/M1QyAq+Np5Ai0RyrYxZ8J5AIRg93urB
	yNKu0VFArL02DNNv77keTFX+e3fGC2B1lElXIAz9QD1RYpUfjwANt7fS3DXA6lrkttbzQgxN2x1
	YHXZs+xwPX/XFrYO1NUh7g5pxiRDzDtzKBqL1aBV9TB7I1/jVBHulHRFySF8jVG3Jkv7kytpf8/
	rjzqQlaik4Q6L0phEHNSNmTJxQJHpbBiPWTfFu
X-Received: by 2002:a05:6102:3fa6:b0:6cb:d562:b96a with SMTP id
 ada2fe7eead31-777b89f4818mr417941137.14.1787089013591; Tue, 18 Aug 2026
 14:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260703152215.192859-1-richard.genoud@bootlin.com>
 <20260703152215.192859-3-richard.genoud@bootlin.com> <aoQibj7sCd6o8W6h@monoceros>
 <CADvTj4r=uBJyJdmK3T+jD_Nitg2NBs7fZgtE5p6wt9zwWgj6DQ@mail.gmail.com> <aoTMMAGbWelnjJTo@monoceros>
In-Reply-To: <aoTMMAGbWelnjJTo@monoceros>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 18 Aug 2026 15:36:42 -0600
X-Gm-Features: AcwNN1WNCOQhs7S_JPB6wAilK0gfWlIi5mTrdxNK2MAHoPVv5VHOpQRIxBhuAGs
Message-ID: <CADvTj4ovVmY-TN7u_yj6me88qNEzr_0xbuC9DerPguFGdgOEBA@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] pwm: sun8i: Add H616 PWM support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, bigunclemax@gmail.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_143655_567733_54F2B909 
X-CRM114-Status: GOOD (  18.80  )
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

On Tue, Aug 18, 2026 at 3:26=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> On Tue, Aug 18, 2026 at 08:12:43AM -0600, James Hilliard wrote:
> > On Tue, Aug 18, 2026 at 5:00=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek=
@kernel.org> wrote:
> > > I didn't look at Sashiko's feedback
> > > (https://lore.kernel.org/all/20260703153337.B5AFF1F000E9@smtp.kernel.=
org)
> > > but I would expect that not all 9 high-severity issues identified are
> > > slop. Please look through these for the next revision.
> >
> > I sent a v8 that should have fixed all the sashiko issues along with a
> > bunch of other issues:
> > https://lore.kernel.org/all/20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmai=
l.com/T/
>
> Damn, I missed that because my usual check for newer revisions is using
> the sender as key (because subjects occasionally change). You didn't
> write about your patch series being coordinated with Richard, I hope it
> is.

Richard was working on this for the same project/board.

> Just looking at your changelog I think most of my manual feedback still
> needs addressing. Can you (or Richard?) please go through my feedback
> and address the things still relevant for your v8 please?

From what I could tell most of the v7 review is either already fixed or
inapplicable to the v8. Probably it needs to be reviewed separately.

