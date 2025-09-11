Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13134CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xClIjfrvAbF1xtvQXj+QQGe/hhZ9PeRp4erbvUtEvwI=; b=RWKjYX+s2kD2UoGZQVz4FMDwy6
	RR6bHGUvJ/Nz98lAygt2LHukS5tPWR1a+fvj9IiML1rRfnmbtvyKUkNVgonHAbY+IXgbjA8dQBR1X
	MWU73P47PZzinb9HPbOv6WxgME1iKumsfywkc47xkDL0L3TOrh/ChylhYM4jOhcRFJviTVi6d83b+
	yh3pHS8qxXcHLpaUTJOBF4BWQF1roUJnjkHJyyWyyvWi+DdjNQ8pkdHAqlc/xRD33v/2+12Aq1mh0
	NiqD0O98NAAiI3RfsjTrw/GrD1YxjhgL4BNC1MjxsFmvtMcZk7eP6FxJkbTn4QmPoBbb2Dbe6p94u
	9+aJaheQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdW2-0000000265L-3eQ1;
	Thu, 11 Sep 2025 09:22:54 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdW0-0000000263E-0skE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:22:53 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5608bfae95eso564662e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757582570; x=1758187370; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xClIjfrvAbF1xtvQXj+QQGe/hhZ9PeRp4erbvUtEvwI=;
        b=f0/m2u4+xftmV+SfnY2wB/GTTDrmyNypZW/sn2ie9PyS1wz0ItX3i2hdWfZKAhSZne
         wkpCzrUzGrtNst/WiSGcJSc46MyNn0CGBiSVBebLNzxPoLklAXp4G5E1q8qc6SymX+mK
         HCcXvSjzlTIwXhhJL2XSmSj8WSoL7feR16c48/oUqLlqdRgiQ2krMA/FoUP8EDKjtJ+v
         6LAxDFioZ6HDwomxkmj6g7i+qs7R38Ppd16EtXWO0W53IIIroLJRGPts4jVyBVAUUHE2
         SR0lOZpLDOJpHO1lrZZto1OScJLtpDn2K46V33U6CEVk8dMaBrxBlb/EKCkl4V1ZJ3PU
         LyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757582570; x=1758187370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xClIjfrvAbF1xtvQXj+QQGe/hhZ9PeRp4erbvUtEvwI=;
        b=Jx8RfS8b4Ag/g5fa86Az/DbqiWYe2vFo6mutNlMitdLDLtZsk0Ni58DrK9Xg+U8IJ4
         avzvwJc9BQAFnuUER+Z59DC/ZFLngT1Oua6XgK94LHG4tEgc0wG9FUXvwl0SqeyxLk/i
         wgmx84Nmas4lQUcaneyU8h5k6Lg+AkysyNBMA/JT37en6ikVFb761q2tm/a5Fr6AtrNF
         PN03BSJRGmW3H/9bgdmswh+3ADjfUY7Ym0j5gh9Mn+IG7p+HKaHi5JesAk3mYFby3DYx
         Y2CqcCRwqf2yZ9fBumWWVUjo9sfXVDQxUjMLRulnbyuWp6QMAXc6aHVVkrIZMliBABw0
         ES0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk3SUisaQIRrJzgtyYNxlPiVK6/mcU1KHTs09BYVwKRVfrQB0gZiEWekrgrK85nCs8jsfrwIz1wdPmgAhX9hA1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6ruVdnOpVhbL0uBnBriqUYHWjVUs8eHN7n/LVcg/cZuioLdcO
	3FP/ms7WUOX1iO/K5Lrl7baWGnhJ/Sn4A9XAaV5yQLHrac1ySg6tVC4O7KRj6HLVqGQjKxjj4DZ
	b3jpD2MMvf+U6WFdmJBfZTGKwPlhl5qOy8ua7+w/bog==
X-Gm-Gg: ASbGncvFMpHONItEEfFQoUNaDWvrrrfunEUZt6gYYRzygObkj0t8gjMquIIo4CJIWSM
	/act+Ct68Ug2RGcdXR8Cdnn74u3IF0bSctqYHWRrKxkE3GMSPLu2s7xq13neVKJmGZLPdWKU+UM
	Tirffhn34c7IjpUcKfXhjJU/9rcA9jBvJiQVawMeXnjZ+Q08QUMO2FmPLwYtHEtYAZJFjcT/3YO
	IziQbWNBXn2QywZvNooVlkQ9iJ12NtDQfh+iy0=
X-Google-Smtp-Source: AGHT+IFsnkGxYpIZ2no6WEiKw7trlyFszU8hXSZ7C1IoobeXgikTcX6nfxEwSn+eF6XIvxGU/64B9GjviqVf+lb37jo=
X-Received: by 2002:a05:6512:145b:10b0:562:d04d:fa0f with SMTP id
 2adb3069b0e04-562d04dfb5emr4915461e87.57.1757582570041; Thu, 11 Sep 2025
 02:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org> <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
 <20250910143618.GA4072335-robh@kernel.org> <CAMRc=McKF1O4KmB=LVX=gTvAmKjBC3oAM3BhTkk77U_MXuMJAA@mail.gmail.com>
 <b83a59f9-16ae-4835-b185-d5209d70a0f6@oss.qualcomm.com>
In-Reply-To: <b83a59f9-16ae-4835-b185-d5209d70a0f6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 Sep 2025 11:22:38 +0200
X-Gm-Features: Ac12FXx_Hui0lKjh3pL6K30JyaITyJ2wgwj7xLN_jTKFVW2DjCpTudv5l9sTHKE
Message-ID: <CAMRc=Md83STGFYya5eu4j33=SQ+D6upcP-7fnBwKo2dPdTtX+g@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_022252_500270_5BA79C92 
X-CRM114-Status: GOOD (  14.70  )
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

On Thu, Sep 11, 2025 at 10:53=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/10/25 4:42 PM, Bartosz Golaszewski wrote:
> > On Wed, Sep 10, 2025 at 4:36=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> >>
> >> On Wed, Sep 10, 2025 at 03:43:38PM +0200, Bartosz Golaszewski wrote:
> >>> On Wed, Sep 10, 2025 at 3:38=E2=80=AFPM Rob Herring (Arm) <robh@kerne=
l.org> wrote:
> >>>>
> >>>>
> >>>> On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
> >>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>>
> >>>>> Describe the firmware-managed variant of the QCom DesignWare MAC. A=
s the
> >>>>> properties here differ a lot from the HLOS-managed variant, lets pu=
t it
> >>>>> in a separate file.
> >>>>>
> >>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>>> ---
>
> [...]
>
> >>> These seem to be a false-positives triggered by modifying the
> >>> high-level snps.dwmac.yaml file?
> >>
> >> No. You just made 3 power-domains required for everyone.
> >>
> >
> > With a maxItems: 3?
>
> In the common definition:
>
> minItems: n
> maxItems: 3
>

Just to make it clear: if I have a maxItems but no minItems, does this
make maxItems effectively work as a strict-number-of-items?

Bartosz

> In your new file that includes the main one:
>
> properties:
>         power-domains:
>                 minItems: 3
>
> Konrad

