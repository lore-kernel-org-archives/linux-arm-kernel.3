Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EEBD12676
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CE0Tb9n5WshMYKxUeEYg0eYGZtGLhkXKf12cUjTZC80=; b=wMqpUgxvCFJnNFg54GWVYsWuBY
	b9eIdflMuIphZHa/5BiZxshbC/HJpZZMRn/JKFRYWUg0CZ1OxUvTB2OIwS2aSiYCMEaDpfvHky0o0
	eVCJ/7Lhz42yD4f4kkE+ARi9GVYkDRQMS5srx+1uKxXD206zQRtQM1IOVFofypmVwcsNbe1gxnEBp
	9y3jerA84Rk2bmpskdLve97LXcY9LHSriVsSWVhtts/Y72GM95fHZ9+d0zse4HTajMkKW6e0sGliO
	ASMXLmAqWJ/WHkXeH36G2GLOCbepLJiOVrM1ZIivsT9UV+EKfyJQINFHCcpc6zTFOV1q34ygnmwN+
	AH+cbdoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYT3-00000005sDO-2E6c;
	Tue, 02 Dec 2025 22:03:31 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYT0-00000005sCk-3CMe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:03:27 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b725ead5800so807185266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764713000; x=1765317800; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CE0Tb9n5WshMYKxUeEYg0eYGZtGLhkXKf12cUjTZC80=;
        b=mGaWyv1Q86fFp7iFj47YdZEB1seQat+bV2J95/VXQPc8Ru6ByDoe8DvKyj4xRLU7wW
         tmyQRUym+FfkGS/7nuOZGMTdxP9LeT66iWF97tN/kmwkJQ1xAKqC5XivC3ilefaauZVQ
         ZABZyhU/VJZys6TEx57S89wltd/eYbAjIctsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713000; x=1765317800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CE0Tb9n5WshMYKxUeEYg0eYGZtGLhkXKf12cUjTZC80=;
        b=D9Ds4mNAcMjToHWHPxZDi/LjK5qd14NvmTBg2uxUUlnca1fMGxxTAgYdWPkPJlapGW
         iB4Rz/cPvdeapFUvOMp50cPTRgmjV3gqf3FR2nNUEhepSP7082cOZPI5+Vy3mKtW+Lx4
         VYEUH/3Vo1ZU4c70axtuztjI+113HNxXq0E0A3ISSnao+pbEHptU8u8O7o4V9PBQXwHS
         e50Cj2Ejl6qE6MUqadOF4ZUO/xN3LU78gsYu8TsCCgqNSlWogGV0Kh2TEtr3+gqp90iH
         2cZbIH2K/vE4oi05Shj5t7zg0VXjTxdxKy6OMW5kUU+NaDd6fnY1EGWLFVYN5Ge9S0F8
         aoNw==
X-Forwarded-Encrypted: i=1; AJvYcCW2AuNrGKsseJEAAEEjCxkYf+X0fAHGigfLN+Nt5yljnPpv6HzeHHBChAjD3qrr40KlHutzp9Um/Kn2TeQk1Bru@lists.infradead.org
X-Gm-Message-State: AOJu0YxsmbxHvtcJx4OQibByXeboS5jyOq9w6RlEv6wYZNmXWseTu9N2
	3RW/OFsiSzDN/8HGoVrjqY+Xp5TjE6D+hrmAqsdW7lkbR8MHRL/S+Z2/HR3lp2FeAxfAuYWQjdi
	nWVecS4Uo
X-Gm-Gg: ASbGncubqoxPDdLex3YzsArepMBL5+Lmg1zmzDEDOnoYHQ0t7nJ+Hk+fwT7iXhXDTrt
	wboim5ZizPMEQObn542Wkw8++gl5M0j3ACNow9nl4LJqrx91SpzeKt++k0+b3pogwRvw+xfQXBT
	Izn2Cm79uGP9MpCVPI37yV0kh1MHTuKflt03iyYIqF+BsdtaRkl8aiiFNQtSSkrK3hhbegAPQ2l
	O2M6G6SS21HFBZTrWLjQFYbyzOqhEm/mpQJ+3fQDdVBbcua/LmcQFfK9JQMktuT11RP4MFSKXJw
	N/uL8BrO1TtywEHX5wFOWYzJHifbDsyGw7AzdFRj57KcOsCnGJGUwVq9eQ9x8yn75nB3twop0Yd
	Jy8aCsBa7aA4kjdA3HJ29vEvyTLBvW2MAk6SwCsALzIvjUnZtHl1yH3DfsrfPrFTIzf+2v0Arsn
	2ypVLUzTu3dQE8kjN4+t6kf0p3VkocZy+mn7nMSkhly1e8U7+jSA==
X-Google-Smtp-Source: AGHT+IF0JiO7GQXB9qXZpUozt7u03ojtBM+djaB11YSFT3+/gHuHy37f3M5rbkuYk1f9o3WEBthBOg==
X-Received: by 2002:a17:907:94d0:b0:b76:3476:a83c with SMTP id a640c23a62f3a-b76c55550e7mr3474174066b.40.1764712999880;
        Tue, 02 Dec 2025 14:03:19 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79cbc1f1d5sm137673966b.63.2025.12.02.14.03.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 14:03:19 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so3967391f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 14:03:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUg/1H7ccEsBllA0XFRFT3dzj85Zoiw6PMg1qU1bjk+C4wn9ICudUq54fZpjakcKdsJ1a13c7plDDKpVXTKNQyS@lists.infradead.org
X-Received: by 2002:a05:6000:401f:b0:429:bca4:6b44 with SMTP id
 ffacd0b85a97d-42e0f203446mr32556688f8f.13.1764712997701; Tue, 02 Dec 2025
 14:03:17 -0800 (PST)
MIME-Version: 1.0
References: <CAD=FV=Ux7nGFnYEyX0cUL-9__BKnTYc+kAJjkF458ZnFS7zoJA@mail.gmail.com>
 <CAD++jLkuRQKoiEN928GtAj7wUts5PxH905bLp6ZhKsJ3NnenEA@mail.gmail.com>
 <CAD=FV=X5=AK4XMANv+fatn3d9Y5vo9AXsHWb_47HmNaMWUtMwA@mail.gmail.com> <CAGXv+5HyMYgKmLc+jmkj-gytm9SNVg9dS7Vn3dQ-dsH8Wo+4sg@mail.gmail.com>
In-Reply-To: <CAGXv+5HyMYgKmLc+jmkj-gytm9SNVg9dS7Vn3dQ-dsH8Wo+4sg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 2 Dec 2025 14:03:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uq9yfUkLUgg116G+2AvEKkEPmdRgUJ5f1bj229j=LxUg@mail.gmail.com>
X-Gm-Features: AWmQ_bkxt4Z1y_xk0xRlx44cYkgtJzKDF-PUNGwdWpfvpJRWrhovgdQ52I-giJI
Message-ID: <CAD=FV=Uq9yfUkLUgg116G+2AvEKkEPmdRgUJ5f1bj229j=LxUg@mail.gmail.com>
Subject: Re: Proposal: Officially allow "incomplete" trees as a base
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Linus Walleij <linusw@kernel.org>, devicetree-spec@vger.kernel.org, 
	boot-architecture@lists.linaro.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	William McVicker <willmcvicker@google.com>, Julius Werner <jwerner@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, Yu-Ping Wu <yupingso@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140326_826837_C333D292 
X-CRM114-Status: GOOD (  24.70  )
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

On Mon, Dec 1, 2025 at 7:31=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> > Separately, it can be noted that we always _wanted_ a similar solution
> > for ChromeOS, but we never quite got there... ;-)
>
> FTR ChromeOS is moving in that direction: splitting SKU differences
> based on components into overlays that get applied to the base by the
> bootloader.
>
> In the simplest example we could have one base dts and two overlays
> for two different DSI panel models:
>
>   - base.dtb
>     - panel-model-a.dtbo
>     - panel-model-b.dtbo
>
> The problem we then run into is that the base.dtb will only have the
> generic model compatible "google,foo", not the sku and revision
> specific ones like "google,foo-sku1-rev2".
>
> And we'd really like to avoid having _more_ overlays just to add the
> final specific compatible string, as that kind of defeats the purpose
> of using overlays to reduce the number of dts files.

I think you may have simplified the above a little too much to the
point where it's confusing. At least I'm a bit confused. I _think_ the
problems you're talking about are the kinds of things we run into when
we take overlays above just two levels. I'm imagining:

- base.dtb
- board1-rev1.dtbo
- board2-rev1.dtbo
- board1-rev2.dtbo
- board2-rev2.dtbo
- panel-a.dtbo
- panel-b.dtbo

So I think you're saying that you'd start with the "base.dtb" and then
extend it with exactly one of the "board" overlays and then exactly
one of the "panel" overlays. Is that right?

So I'd imagine that each of the "board" overlays could have "full"
compatible strings. For instance, I'd imagine "board2-rev2" could
have:

compatible =3D "google,booard2-rev2", "socVendor,soc"


The problem you're struggling with (I think) is that the panel
overlays won't be represented in the compatible string (and "model")
even though (historically) we always did in ChromeOS (they were
included in the "sku" part of the compatible string).

Did I get that right?


> I proposed internally maybe having the bootloader fix up the final
> compatible string, but I think we need some rough consensus upstream
> whether this is acceptable or not.

Maybe we need to come to some agreement about when the top-level
compatible string needs to be changed. In the above, I'd perhaps argue
that the panel isn't a major enough change that it needs to change the
top-level compatible string. That would solve the problem, right? What
do others think? Certainly for "probe-able" components we don't change
the top-level compatible string. Can anyone point to any official
documentation about the top-level compatible string?


-Doug

