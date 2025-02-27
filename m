Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70607C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 23:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frw/Kxp/v2+PP+mGe/xu93cFHbH9YYmz+7s+Ghe+Vqk=; b=jntPX8UAe2r/BYHrIGsfUNdEpz
	XqF7mVwwrT2GL9hrqiKdAIUMfx17uz9R18ps77Lq01+ieauUdcwbcjWIz8eK+hGY9crtBqlQL5iCp
	PfjXsVeXmoJ+Kkb9mzNst1JUuDdPGrk7Tw3lvTebrjmnAg27DoRYYq8OUkkqitnjz/rCFbzptZrxb
	k+rqaJ6mHZVXd+ijM8YCSYxe3+OPXk4syTdHmYDjSrQJdbASY46skFz8uWSYya64YPqn4rFowMUOH
	v4l8q1pZdgt8h12QNNq7wiHizafH1ZIk0Ms9PdbZhhIQErPRwZNHd07hh0DOKMyee98ObswS1HRn+
	RWzM/4hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmzy-000000097gF-1iub;
	Thu, 27 Feb 2025 23:08:58 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmyO-000000097QD-3YXg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 23:07:23 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30b8cbbac91so5745601fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 15:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740697639; x=1741302439; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frw/Kxp/v2+PP+mGe/xu93cFHbH9YYmz+7s+Ghe+Vqk=;
        b=cQutJJx0t/CKjGHEGBApDcCNak8ggrM4JETKZACyZA7iygT8G/X6Oj7huDoGH53EIa
         4FfVbm/NWma6OEFrhTyGBOnUmP1+v97MZv0nqrYSyt3rf7FqK15dkyRVdcE/G7DgvfTA
         DosA453jAoxNxPB76CFfXv7lZFketiEud/XGquxLRy8c2MxLmZ3Ii0cpj2kP7E76szWy
         B2mDKvVGY/AXERXJIYVQcPX+ShHSRHNcRY0Q6QMZg5mdYZmlkIgHOAz6uDGOdB+7CAmK
         QRuPaP5MAcAUPtKEKt/7leRMk5XfjgnhrFUqNh+7HyT1OREA2HHDTTiTFkGS1UtKVOo9
         8Xyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740697639; x=1741302439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frw/Kxp/v2+PP+mGe/xu93cFHbH9YYmz+7s+Ghe+Vqk=;
        b=jGZ4X3TSznx92kBbm4+ihZehrhIfRJ8TwfJUUim3x7t0TsGOhAIPgB8QMwZDIYqzIF
         V+pOLi6tmuxY76KrTkPaBGYQ3WmC4lj7eZtPloua/Cz8X2Ml1D13yGDoD1PdI8HGxYTN
         AOQbvybveV3OFmK4HKo7Z5dpvVHlo3c6ZD7sWigVbzBrMDN1WrrmBRA9G9uo1eAMQVFq
         +Q4q0YPg/AQDASpf1u7mRyS4l4CBknVznE26cfL5SMk82uAFf4pI1/iAMcoHmrKLMxeN
         bxYUKh3OYOc0ny2cpNeMAsc24M7dbpn5xABjBODa8o6fC37HPhWVBYDKZp5oNxrCsc62
         UQ9g==
X-Forwarded-Encrypted: i=1; AJvYcCVCD+HNNS7KuI2JobLBphkZz73KnRdn1tnWKYvVDAIaPNxaGRWBDLpL3nXh1Yozq1PacU8fACfnmBnU5x2gTzab@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Lm6A9GeuDsfND1Y8II6cGhKqQX+znOSDAa+rWIBifKLhmtMW
	aB1d1Fq94l32QuBFLNwL9KwvupWVW1jpTq9h0p97+0bIYFMBsnUKuEqdNS4FOwR0o1oQkTHaWwk
	ytdZFSfnsCk/cYncQHLDHMh9pxoaJ75wbYIe4pQ==
X-Gm-Gg: ASbGncvy7cA55FEzjcYFsbIr1ZpMl8gBLKILsCmAOxb0z9SDHrujWX+Hz1fyTY7GT5Y
	nrW9Ahu2KolndtfoD0mm6odXKpyYO4tEsIEDrCC0vaUxTjeoOuFse3KzvQhZqOCQbiAh2jyRg0i
	igsBPHHAU=
X-Google-Smtp-Source: AGHT+IFufz181XNYlSjaAjssVbP9sbOQz0B9cNRA45vok7xAon3DLgbajO4WEtqa7uIwsizRpA7u/lhxgF69lTQZ82w=
X-Received: by 2002:a05:651c:2105:b0:30a:2a8a:e4d0 with SMTP id
 38308e7fff4ca-30b90a8247cmr3926491fa.17.1740697639007; Thu, 27 Feb 2025
 15:07:19 -0800 (PST)
MIME-Version: 1.0
References: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
In-Reply-To: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:07:07 +0100
X-Gm-Features: AQ5f1JqjsVFh7X8JQClBDzM8iluOtRQbPulUgXhGdh38CQTozMVRauwBZfmmZkc
Message-ID: <CACRpkdZg-9Zr3f7zG36x7jGvT46FRfRJ40khNZDdYb01-BGigw@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Pinctrl: Add Amlogic pinctrl driver
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_150720_883176_A91021EE 
X-CRM114-Status: UNSURE (   8.50  )
X-CRM114-Notice: Please train this message.
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

Hi Xianwei,

I applied patches 1, 2, 3 and 5 to the pinctrl tree on this
immutable branch:
https://web.git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t/log/?h=3Dib-amlogic-a4

On Wed, Feb 12, 2025 at 6:24=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

>       arm64: dts: amlogic: a4: add pinctrl node

Please funnel this patch through the SoC tree.

If there are dependencies, they can be pulled in from the immutable
branch.

Yours,
Linus Walleij

