Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD43D1266C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 03:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SUCSRcAh5wfvR1Ga9HOQmp+DboJkGyQoezHpnT4C/w=; b=aJb78jo9MnF0744EJbBOiLjSfT
	Vm8NozvSppFflfyUuDHNh0EXVEvrhHCHTPHNbnimAmVFqW5kbmkaexuTgzP6TFstNpmHuzKhVf7Lv
	V0Oj+ucP2nu8exa7Ow9u+/JJToTTjX2RxsqiHTklePmtMRqmNkDuAuBSeomKVr2jytj6cuHvJKumR
	OGVL6aqFAcwsZUxLbGMCb9Fw7+6L+Fl3PO/M/o60qkuHP0ttu7d0mSGYZgVLyUhYXjQ2fztV8y9NC
	E8pZpzQQ4Fr6oWjdU5SBYXm176MSEvFrWKjOEDrf6GQGOG6s5VQlgf0wPfG5QXIC9Axc9khTKs+pk
	WL5Wcp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQdBS-000000063cA-1vIc;
	Wed, 03 Dec 2025 03:05:38 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQdBP-000000063bL-0nwb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 03:05:36 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7bb3092e4d7so6371704b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 19:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764731134; x=1765335934; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SUCSRcAh5wfvR1Ga9HOQmp+DboJkGyQoezHpnT4C/w=;
        b=UUoYMeRpXI19q+pMm/wa76FM5P+JPXdpARHTWCtCpO79gRy/hFNwFbFaTW01EyOJOI
         45FNv05KPhs0dqMA25QBH7HccSTl/cb5wMFwTHnmR/KPdwDsvP2Nv+jr5Cxz5kE2uObi
         V9x+WcHUcWRw2+5qB+wA6dUxsMcWTVXheGstYDMICf+XUUtQBROxS4Eg++oJbF3Eq4F5
         LNbYm9QXqF88/eDPIuS4T2zzEW+lf0n90uemPuzQ4pzKjn70wj8J4kVvb8O0097UMh9N
         pXSCKU7BTlkmhP5Pgxm1CZ6OOTq5iEfVUQltfcMOWTj9aUehLsq67B2L3aUXdsl5egl4
         FTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764731134; x=1765335934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SUCSRcAh5wfvR1Ga9HOQmp+DboJkGyQoezHpnT4C/w=;
        b=Ti3or7DOM6xZ/iZ8BAwggwVkKbpTWnd7qF1objnXMGrcvJ/Swme2azk+MEnCcHzTDU
         smxVI8pVzKAr7zPfWP1mBm8XZZkEdhE8ta32zS4kfmC2Fo8fZHPBqu7KnLSCZE49e/+m
         zJu+btA6KlMoylLOXIW53pr5oJ5Ch3mE4Ou/vhPmr/N0EUFMqoE1LzIVdfUxoVlW3rLr
         hJDq79v9lZqUBtzWeOLirdqIOBqgLOsSo2XW0a0YprBLYiJ4tcpUs9La0sYDez7E5/tv
         03halgs6Oi/mmjFym3k/nNa7WQxs/xOgtWmfeKzhZ382jb2B6DS80RHWBl9L24EBHOS2
         uD9A==
X-Forwarded-Encrypted: i=1; AJvYcCVjo/HofiQms0uDDkcRIN2jIt4AqKxxuY6ntDzGu+4swqhHfiuZU+1wv9V01OZMV3XQuQW6q76z5BeWIWtGd+pW@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzx1y3QscWM/nktWkBI1yKF7xRu1/CxH2YX9EhCsBo4oOq+56O
	AQMCg8kOQr2dDBjupq2N43lnH0aOMb+00Nu9yiMo2/lz83VhhAPzz/qnHEaJwVaYUQNXH6OvVfq
	oHEKEXjgSB60Q3kQUqh18uSEnhr7SvQ1LuEIRukmV
X-Gm-Gg: ASbGncspuzkZ45gSQtYnbBVBqIHJg21DwhFXCY6mKC5zQVSECUD2HSgP5hvZh019LyM
	uQKeiUmQUhPlTTtQ34hsVoE4sQ3+2MukGG9CYTi+260EsodpKIXisxPGckyjAt4OAx1lwE0n+Cd
	l1VNQlo5zvOs1LVQt05X/AaRCf3KZvuNE6abM1+fuM570+C0U6UbuPXrR728KatpVB8fyV5o43d
	U+teiEcVIUGMXTLK52OX50b7vuqx5CTIXCC2mocUtYRrK2ZHyWSer/QD2NMOrFtXN5H8+VlJp2H
	cDoDJg==
X-Google-Smtp-Source: AGHT+IEaw/KAaB9NQPn92QcJbyFAkEiHxEvdc+JFEc5o3oBuUZIzccLg55YH3cTE7CxVtrjUj9n7SYHTGXfIZWZDfhI=
X-Received: by 2002:a05:7022:1b0f:b0:119:e569:fba0 with SMTP id
 a92af1059eb24-11df0bee281mr624917c88.15.1764731133682; Tue, 02 Dec 2025
 19:05:33 -0800 (PST)
MIME-Version: 1.0
References: <20251122-controller-v8-0-e7562e0df658@google.com>
 <20251122-controller-v8-2-e7562e0df658@google.com> <2025112226-heave-refrain-53e6@gregkh>
 <CA+zupgwzQ5r=-_L79D74=9VRqRO94N0yTApHChM+Nu0cn1ss3w@mail.gmail.com>
 <2025120209-unstylish-john-2a6c@gregkh> <00d75fd3-a796-402a-a1a3-2172862fcf91@kernel.org>
 <CAD=FV=VLOLiGDfQOWXOL0H+M4EnSj1kouYK37WHV=8OVEwt+qg@mail.gmail.com>
In-Reply-To: <CAD=FV=VLOLiGDfQOWXOL0H+M4EnSj1kouYK37WHV=8OVEwt+qg@mail.gmail.com>
From: Roy Luo <royluo@google.com>
Date: Wed, 3 Dec 2025 11:04:56 +0800
X-Gm-Features: AWmQ_bnH8zw5DfDwDs1QuKD2A0QWVUVTK2D542APdmuEtTsd_99YivSDqmKY8X8
Message-ID: <CA+zupgwiJmS9+MFt8F02HrPkRYPDidjg9dxNUJxd8d_0RM6cww@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] usb: dwc3: Add Google Tensor SoC DWC3 glue driver
To: Doug Anderson <dianders@google.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_190535_258498_ECDCA601 
X-CRM114-Status: GOOD (  41.51  )
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

On Wed, Dec 3, 2025 at 12:25=E2=80=AFAM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Tue, Dec 2, 2025 at 1:42=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> > >> I plan to add ARCH_GOOGLE as a dependency in the next
> > >> version per [1], so the "depends on" would probably look like
> > >> the following per your suggestion:
> > >
> > > But "Google" is not an arch :(
> > >
> > > And really, the whole "only have a sub-arch symbol" is something that
> > > personally, I think is totally wrong and prevents kernel images from
> > > being built for more than one "arch".  As an example, the Android GKI
> >
> > Probably you think ARCH_FOO as arch/FOO/ directory, but this is not the
> > case. ARCH_FOO in this context is SoC platform, so e.g.
> > arch/arm64/boot/dts/FOO/.
> >
> > All of ARCH_FOO build into one image and that's recommended way to limi=
t
> > unnecessary drivers.
> >
> > It's just confusing naming for whatever reason.
> >
> > > kernel has to support more than one of these, so what does putting th=
is
> > > behind a symbol that no one will actually use mean anything?  Android
> > > will never be only building a ARCH_GOOGLE kernel.
> >
> > But distros will be, people will be. OK, maybe not for ARCH_GOOGLE, but
> > ARCH_QCOM we do for Qualcomm-based laptops and embedded folks even more=
.
> >
> > We had this talk in the past. The point is that these drivers here are
> > unusable outside of that hardware platform, so only when you choose
> > hardware platform (ARCH_EXYNOS, ARCH_GOOGLE, ARCH_QCOM) you will be abl=
e
> > to choose these drivers.
> >
> > You can also look at ARCH_FOO a bit orthogonal to actual kernel
> > architecture, because ARCH_EXYNOS is for both arm (arm32) and arm64. Th=
e
> > drivers should be available for all Exynos-platforms, regardless whethe=
r
> > this is arm32 or arm64.
>
> FWIW I don't feel strongly about the ARCH_XYZ Kconfig settings, but
> I'd tend to agree with Krzysztof that I personally find them useful.
> Sure, it's fine to just turn all of the ARCH_XYZ values on and they
> shouldn't conflict with each other, but it provides an easy way for
> someone to know that certain drivers are only useful if the kernel
> you're building supports a given arch. If I'm building a kernel that
> doesn't need to support any Qualcomm boards, for instance, I can just
> turn that arch off and I don't even need to think about all of the
> Qualcomm-related config options.
>
> FWIW, if you do add a "depend" on ARCH_GOOGLE you should mention
> somewhere (maybe "after the cut" in your patch) that ARCH_GOOGLE
> doesn't exist yet. It should eventually exist when some version of
> this patch lands:
>
> https://lore.kernel.org/r/20251111112158.3.I35b9e835ac49ab408e5ca3e098393=
0a1f1395814@changeid/
>
> ...but it's not there yet. ;-)
>
> -Doug

Hi all,

I appreciate the detailed discussion regarding Kconfig dependencies.
Based on all the feedback, I'll make the following adjustments:
- I will update the Kconfig dependency to depends on
  ARCH_GOOGLE || COMPILE_TEST and drop the other
  dependencies on OF && COMMON_CLK && RESET_CONTROLLER
  as suggested by Krzysztof. This should also address the build
  coverage concern from Greg.
- As Doug pointed out, the ARCH_GOOGLE Kconfig option does
  not exist... yet. I will add a note about this in the next version.

Thank you all again for helping me improve this patch.
I will send out a new version with these changes soon.

Regards,
Roy Luo

