Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8671CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 18:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tvms9S2u+WWs1aqmeVPw1ZH+QcXa67JBCDgXQqcL1Nc=; b=g2VWKDy/HPE4O1Exv3K6io/JPJ
	BMOsJlSAT0adxE9RdoN70420HG+6K5lCiXqPcCi0WQWUNWbtfhecTAG+LMOLcj5xuU1I2iRsndz6p
	1JoPxAkOXPF06OzAptTbgU+odjTVbua8BZBbipv5NP3nzpLZQDoYq3Uy20h+onSMUK/rjJWfP9F4I
	kFYjwCQ3sdctp6NEG2I78eUJpLYv8gnpUv5cKXA4W7/laurstk1QcszWpds2fSgIqkhyrPkOAESo9
	EoPmB+MdBOZJYzIpve0FQOE6bOzRilvJdcED4hG9mCeLwnskscvW9Vh1TREeE5sVm4WyytoeqlW4+
	mlG7jgGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1UhE-00000002qLq-0ozF;
	Wed, 24 Sep 2025 18:58:32 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1UhB-00000002qJY-01X0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 18:58:30 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso94450e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758740307; x=1759345107; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tvms9S2u+WWs1aqmeVPw1ZH+QcXa67JBCDgXQqcL1Nc=;
        b=h2+J8d3r+fZaGqRVm2cBT1ZHjoSkO9cpvQHhP2nymIOXZA/PkwB5+sNl73kACNhNTS
         SuNuFToq6T09C90/l+5u2Rcwx7nCJXTjlH21y4gJbzcc1qYz6xvQLCtST2tRtsDBiNaI
         iy9SRWKDUOBHFr/mv0zQ/foYcV+zOqWufMRNuPwSlAeukEYv+YgAeCZzFAnuH1j61Dke
         No99h0cNCRf+wOanQ7/tUlDJaGNovxcTirFxkg8KZm4NSsWmL2BtBLOmPNAQkDwZrBAQ
         kybkhlREQxcZIYw3i2mN/7E2PWaVL/EHhQvSSUdCQOk14vJw9Ot2upJZPGjZr+4BFc4w
         hYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758740307; x=1759345107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvms9S2u+WWs1aqmeVPw1ZH+QcXa67JBCDgXQqcL1Nc=;
        b=jAg6n693sviLbFDnc9lTAEuhql/ajJhmiiJQSrcfajGCj5+iVIgUvZGM7u50+PFihv
         LCyLABvnFxu7o/bCUs9mA3oDkgjWqYKWh/TxGcAOKQJKycCIo3le3nXeChxSazuaI8+I
         btziJWfDcdVZcixbJ+USdYbPy1Omz0KIHbBItevHBak6RC6Dt3uFKt4AkZ8q9hexBKnf
         dwYqDiDZCE3lNvbQFH63qDvMlqZvyn0yd/BHTdZG5a/Dkp9cPh3LjpsBiXetL+Yxst/b
         99IomZJhAsWc+Ep8DPcfvOhRyVYdPgnoI5+CeOUVBDNHPgvX9l8ne9g9msrBOd0NlSqo
         Tvkg==
X-Forwarded-Encrypted: i=1; AJvYcCWoVl4EtaWLB3OzO6RqQwOgqL2i8466XaLcpVjp0oc94sGvlL3X6HTN9gvJ2HYiXQ6i92E2EiFWy+ovat2EereO@lists.infradead.org
X-Gm-Message-State: AOJu0YwVkYHFaubzVf6cYFJ9RbVIXeFGfSlcliOJL1L7jpbt6gj8+wzD
	Y3pun4dfH/AetwBZhrrLArM+RadrepYJpvVGuRg9285fiigU5an5ggbmtQxe+4FAHmLE1LLa4UL
	vPTovHBg58HQl5sJd5nDkspyv5ZRrgi9mTUmrn41UIQ==
X-Gm-Gg: ASbGnctVEOXVS26Xh8fnwk2y9Qwp/BHA0XFBtxXQty5ev01YJagslGWl3dS3zzx/xjY
	pWd/3Mq8e6Syu2fdV4lyrBuGkou/Doh2udusmGusfR3K0xizqrFZkLGq230/Jb76p6tncYgLOq0
	MidjGXH1E8FHKjZoPaXuWfdpSvR4tn/EFJ/+Vhp4KDsKFbZNzsjd+6eh8+HEJkdhZ4rkM63T1hb
	/eN7O7ZJdiqkUNUFCSvFxnccFbfe7CrNii0nBY=
X-Google-Smtp-Source: AGHT+IG80v30cYAxmqw0nWtuIX67T8j0+pyB3RqSVPJrA4Q3f2yx4NJvYOML7KmCJ9NDodn7hTwpeLEpVOpaBNNnZoU=
X-Received: by 2002:a05:6512:1389:b0:55f:572e:2417 with SMTP id
 2adb3069b0e04-582d4442054mr147305e87.56.1758740306748; Wed, 24 Sep 2025
 11:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org> <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
In-Reply-To: <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 20:58:14 +0200
X-Gm-Features: AS18NWB3RTCRDB9znJ75efLzXjjUdrkYJL4LszylIzL1olaMxdJPlHwCWt0jx1k
Message-ID: <CAMRc=McVc2aYFX-DKjtNNNs0eZLcq_jahR+_q3EP1T352XhP+Q@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_115829_300339_61264268 
X-CRM114-Status: GOOD (  20.64  )
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

On Wed, Sep 24, 2025 at 8:25=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Bartosz,
>
> On Wed, Sep 24, 2025 at 04:51:28PM +0200, Bartosz Golaszewski wrote:
> > Here's a functional RFC for improving the handling of shared GPIOs in
> > linux.
> >

[snip]

> >
> > The practical use-case for this are the powerdown GPIOs shared by
> > speakers on Qualcomm db845c platform, however I have also extensively
> > tested it using gpio-virtuser on arm64 qemu with various DT
> > configurations.
>
> How is this different from the existing gpio-backed regulator/supply?
> IMO GPIOs are naturally exclusive-use resources (in cases when you need
> to control them, not simply read their state), and when there is a need
> to share them there are more appropriate abstractions that are built on
> top of GPIOs...
>

I think you have never been on the receiving end of Krzysztof's wrath
when trying to model a simple shared pin as a nonexistent reset
provider or a fixed regulator in device-tree. :)

Unless you mean some other abstractions I am missing.

Bartosz

