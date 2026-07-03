Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8014EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=; b=NebRhEX5+lAWeF9l9qOcdAg+ez
	HwSuWzN2EBoplOSk/TnqG9WeNSQMzIP/5GWVyxKHSjS0rCTscpc8BNsmM49qIfW6OyWCcCDYUBl00
	fwbJ9nhWsjT2QY5VCTMFsWFKshQ4d3pbCZtfKNHjL9aq1aaff92Ifw0JjEZDyhCZt58lgzOp9J3kq
	gPx5vucFUq8M1S02cf3r5X32q8bIWICw4wIH8uDQ3pMejNYUuDjQRGSFn9bZU2orzzCbY6G39hKn2
	Cn/5NRPJvTN7l/8qi7EH6UsCzLpZQSs1bV3CCngDKyQVqLfKMgyb1deLa4Xdz2fB+XQkdYzgoiEvD
	wV5/PYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcpq-00000006v6u-2zqF;
	Fri, 03 Jul 2026 12:17:34 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcpo-00000006v5R-0XMs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:17:33 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-664cb440f9eso588905d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 05:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783081051; cv=none;
        d=google.com; s=arc-20260327;
        b=asqeFwGN3SjCUkvqQByNIjLnWX2VsZV3LVgvmKIkofoRraxtodJT6vm6bR1PdD624q
         IfepeIbNkcGH+dWD9oRZh/8yk+doDG8SmlR6ag7CdneHf+GOR2t/OqFIXCnOFB5FPsQ+
         TihbHIvioCJMrKKZEhMVhlOuDiFLiXV11LthFXly/A2x0liLPWz89S1sx7hqmhYDS9g+
         y1FHth86xI3+hXJmDTvTz8mJZRoWD894iXVoRWqfFmh7GOXExQ/6RRAzf9QyM/EkTy2C
         rxdOTSbr3Dv8NeBD6tdS9hOi+FvBbSBZvCZGDe+pjeoVKch5LEVwLSyYy879DyipBBdB
         t0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
        fh=4A4K/aii08hAu4aw8gvGnzAckchduXc3ySfSGXSqt6o=;
        b=lXWJIn9y+vcBWfsyMhp2/WJgJrLcV7Jsxz1ky2scmEQDx0KdCEpgp4F1qb3e1M9WFI
         FETsEJ5BziCQ72f+KB3WBKf5D7RqwFxqPw3L6dn1VDHovEkKjb4nFcMVCGCbsMEY/HZK
         zoVSCLHLqYOqKW4DYsEYDz4Z/narnUWjMSa3mKMRuLKJG6kJBb8+m1/L+QI2y1IeWjHs
         pCZGTn10bWv7x0JGM+ThjbMLm8gqU9LKKs2nq1yi67wFNg9gRGyh2wFpGKjOM7PPAYeH
         h1pb6P7imf+pNY39CiU48V7kIICFgy5RGMuDT23SsBk1nBB8GeJEfFN28pcc+5vBcxmr
         M+UQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783081051; x=1783685851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
        b=GGLF3Ff826WuhnvJq7HyvDodoPomrcCUjQ9cUhIQlD7OjDl7gjO4oWYc6zlB+Qd9MU
         9J2tlrZaQ+RnU6YtPDdiqY08Aev/Cr7wSIfUzwQ9/zArb3b0BqCdRtScmLDhFWbPOtlM
         fuuRPWtkgACNX14sVo4A4q6IwGUFyrF7WFivI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081051; x=1783685851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKIP/2g7MTxmMgVnWjjRdFjs9hik6bQNvbKXHobNWdc=;
        b=CwCVk067X4GtJ15ZRYhukP0Vm06zVRSi4juhgTYdhK0zSs1jIIFhVlI/FZyB12zpfC
         Mg9R13Vy1TLGokdfdJjSd8JbTooB9VbcEdRn30AjKCLBAzjxgdGwCWccvcfpRh2LCwtF
         XA8Wak/Xg7sg2ur8/rd6KuzTwng5MwDc0kL7D4YRxPWnfEakHIzpdkfLOuqn7+Sw64yS
         lJPtN4JnXFzCgWRUk9IJTM0DsOnTPxaK4tqurWxlYCCDn8BTzbdHAy1UYsu5FJ/CUrg6
         CfoeEQpScfSWDKpKiOI4M7lfI+y75uj+XeYyHTak8WsmzbASFcMmrq0h/prlc4gzo6ZE
         ppqg==
X-Forwarded-Encrypted: i=1; AHgh+Ror2rMKL8Kfgd3t1oeF5fxCw0jjwC8WL9FNFmVXOVqRmkY0pALJOSw2PI8NyPnK3XgOeLL9J5i8TcAqfIVLtGOM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5f4c4q6Q5xqY8fZ9SY4s4wQ5Vb6/ZWFaGCB3Bgcn1u6L2U03y
	VqOceVDyBPiCZaBUOVeyx+fxey52xI/IV7S3rnpDDISCsm2wGa1c0Uta7kK9GfTZwX6zuYysJyU
	bC//sR61MTqx5Th/GgXVk5RK+BNkFS+MatiVTti/y
X-Gm-Gg: AfdE7cnE0tKyHWTiP7KMWYIIjmetj1XrXBOKsg+7/mLq/DC/gNrNDxqKf0lE5mw2sft
	bwrmYs1YqMnUSbKly9jfHJUEuZaUXZ9r0A+4zFCXxun6TCqcg6u/kq6VXHn2P2WPXfNGz3L1z1W
	N8NxmXlNfa4Ggd1BPofRt47Jm5FwEjPdsMSBg2sBaCuJhly/UE1z55HA7txwL+CtDPaGqBz07zD
	4J5Xh3g4r3CeFfsxp2cG4Sh7b3F2W0PyS0L/AbhN/J5rwIZe5jpZGkDYYG5aryu6M0BJPgh2tDc
	hGxeNjAEN/0SeROVp3pQje2RkIw=
X-Received: by 2002:a05:690e:bcd:b0:664:ae03:524e with SMTP id
 956f58d0204a3-6652195244emr9486423d50.6.1783081050982; Fri, 03 Jul 2026
 05:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-4-wenst@chromium.org>
 <CAMRc=MfPC=Jm6RFkCYG6vsYQiWHxBeNq0L59rwahF_6Fu2Ledw@mail.gmail.com>
In-Reply-To: <CAMRc=MfPC=Jm6RFkCYG6vsYQiWHxBeNq0L59rwahF_6Fu2Ledw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 20:17:19 +0800
X-Gm-Features: AVVi8CdRG77FVnl6YqrCOnoh5pU554e35My8Xh7iayyOJ32J-OMwjYcWxPxxPu4
Message-ID: <CAGXv+5HMVaERvte8YJDJ0fq0zoMvO7-7caAGQhsAB-9sUHoGtQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_051732_223208_ED80860F 
X-CRM114-Status: GOOD (  13.20  )
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

On Fri, Jul 3, 2026 at 8:07=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, 3 Jul 2026 13:03:04 +0200, Chen-Yu Tsai <wenst@chromium.org> said=
:
> > The power sequencing consumer API already does power on state tracking
> > internally. Expose the state to consumers through pwrseq_power_is_on()
> > so that they don't have to reimplement it locally.
> >
>
> They wouldn't be able to do it as the field is private to pwrseq core any=
way.

Which is why a helper is added? Note this is returning the requested state
on the consumer side, not the actual state.

> In what situation would consumers need this? Typically you know what stat=
e the
> handle is in if you control it.

Mostly just to avoid extra tracking in the USB port device. For the hub's
port power feature flag, the hub driver actually queries the hub for the
current state; no in-kernel tracking is involved, i.e. the consumer doesn't
actually know what state it is currently in.


ChenYu

