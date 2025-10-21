Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27021CCD1AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 12:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cA++Y4BdYjrrMDCbEY24nDpSsRxi5eGjbT1W1CqHJP4=; b=tfvfnAtr5CtzQ2ODJu8ohkpiOK
	DMg54eUkfgU6M01oAvl0Alvt8mhCEFilfjXfbJ5wmgdsgEGIGC5m0tErp66h+xQpnmIqRKBCcxUEx
	68O/1el8FmWErqHQ0vDDh+F6fVZ98ARWV4kDkKZanRQqPxGuZXYJfCQ8ETHFncXplwy1mIS5PKG3C
	F5vxZtrFdIN1zW9rWTYzNy+gV3+2wYDQnV438XNCdVZGfAFbBvNu/QR7n5sv+K+LcHKQidB/FWnE8
	znn/uRdsLzHi8t2GJouGU5G4gvHVqaACMno0YQKqskRNhsm9Exh007qsLDux7wtIcabH6B7V5Q2rZ
	T1TB0oqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBOJ-0000000Gx5U-0QMx;
	Tue, 21 Oct 2025 12:23:03 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBBOG-0000000Gx4a-3NN4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 12:23:01 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-57b35e176dbso6817459e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 05:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761049379; x=1761654179; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cA++Y4BdYjrrMDCbEY24nDpSsRxi5eGjbT1W1CqHJP4=;
        b=mIXU4XBdfYlHYYElcXe7aEjGbXft1s51/M5jLNDXk5a8aK3RN+jI6C72sjiJkvXNIf
         QIwa6Zc4rr3cszjuYACcJgHlVO4gYoSWJ4TLzDt4G1zKeoQ/sY7ByLfc3/lXztkELBCu
         krabS7FijikydolWdTEEE767R5fUzEf/qhdg1kfS/UaXNqRCnFzgfQyhUcM2Y5YC3qOG
         wlRLXK4S5Z0YUJK7vih8ZQqQ3bO7AZoZmgiYf6/j7Xf5Wg5Vg9aieFgcEz0qpfFFfNvZ
         2FQeSeDTaPb6o4vM7omwy21ElGhJIqZ1qbHHZzAFCPc2npJ67rkv7sZ8f/Cv/dVY5oBb
         j/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761049379; x=1761654179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cA++Y4BdYjrrMDCbEY24nDpSsRxi5eGjbT1W1CqHJP4=;
        b=EhQPs3mMPatTzhhMfCh/zgKrcBsJeHe16djBW2YyyuetgzrFcsKRqNsJgajg9dyW7R
         V9RJYOXIwYapjwildrUIV/56crBZQpK5XQGIStfUWcum8+mAOqI0/CkOuZSqmY7e13k1
         ViBcFOiPlJU+5hH5BbY5NIAej0SvOORY2nd4Wd4K52cO92QHQduB6eOY2Z4lAv7AQxfw
         y/pJLTLCLIJLAWYkbRD+/a8AreH/pJ0hgnXn30ZwuRXwIkbCiNxxSPiMmryofk9lv8P1
         m6/Sn2gTjAg1cakzqGewmrzfNhib1UkyHgO8a3vO/YtAXAPzLqIB1aGJuASawntn9vkZ
         N8jA==
X-Forwarded-Encrypted: i=1; AJvYcCXtk5jPfrwGxFnWhM1qkBFBOgdEiqNqCq2n7umQph3W2yq8Bhogo4k8x1suDaGV9klUY47jFujQ1LBnd0CU8x5D@lists.infradead.org
X-Gm-Message-State: AOJu0YzSNeQ104iMLnN/Q+/ly4cRmMroHW86cDtSAyZEhdgVqaQNy4eV
	lHQY3fjW3x+3ayLYhgDzeynRzkOhfzdKXWW51sbqqkC3Lz8qqfenXTko6YfWNTYHY2/d7iXzCsU
	e/L6+/kCfwFBoviw0sa0ZrHWsnZlc8S3ijJoSA9VgTA==
X-Gm-Gg: ASbGncsL/NCuaKr0sQm8bAbPdDygnQMD+AczK4k+Yq0rXm1C/WJklbfRZB9yQp59TMq
	RPx57dJnnJVbzw9N8eRlkCiepB3LWRGBu59EYadrv69EtWPHv2jLxKXCPp5VPS0wJVJzzVJon6Z
	9icJlePH0+216cV3gjUH721W4y7Uf+VviBB13nvTF4cSGwGryP9SFjiW+UccM84zsKYLewVmbYY
	8GJvKKNROqOQn2M9xskAQrCMEmEcF0TXg715vGm/1TTFe6hf/b34fdf1mlcygRW3S+2tI1xwJ/e
	HpAQIeBskKRCw2r4qI/UzzNoRNg=
X-Google-Smtp-Source: AGHT+IFwqbCzl1LvRrGVBsJkNxyTepKCymSn3z4xLOoxxtlzHnxQDfI8sBh0KLELngrOm4B0AY63u0QkMaZ4C4nL/Tc=
X-Received: by 2002:a05:6512:6d0:b0:585:1ca7:1b7b with SMTP id
 2adb3069b0e04-591d853530amr5944540e87.31.1761049378748; Tue, 21 Oct 2025
 05:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <hyzzrjn7jzo3tt3oyg7azijouawe3zopfjzq6zfhoo6e6z2m4t@ssl5vl4g557e>
 <zk4ea5cibrkp4vttuy4evrqybf76b3nop5lnyck4ws4nyf2yc4@ghj2eyswsoow>
 <CAMRc=MdWmO4wvX6zpzN0-LZF1pF5Y2=sS8fBwr=CKMGWHg+shA@mail.gmail.com>
 <rfr5cou6jr7wmtxixfgjxhnda6yywlsxsei7md7ne3qge7r3gk@xv6n5pvcjzrm>
 <CAMRc=Me9Td5G9qZV8A98XkGROKw1D2UeQHpFzt8uApF8995MZw@mail.gmail.com>
 <rvsyll4u6v4tpaxs4z3k4pbusoktkaocq4o3g6rjt6d2zrzqst@raiuch3hu3ce>
 <CAMRc=Me+4H6G+-Qj_Gz2cv2MgRHOmrjMyNwJr+ardDR1ndYHvQ@mail.gmail.com> <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
In-Reply-To: <fydmplp5z4hjic2wlmvcy6yr3s5t5u4qsgo7yzbqq3xu2g6hdk@v4tzjj3ww4s6>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 21 Oct 2025 14:22:46 +0200
X-Gm-Features: AS18NWBF0GY_y5H5_yrBjx5aMTjq-BCBKISyHH-S44AO8cdbNH0Bf9m_yOfn5F8
Message-ID: <CAMRc=McGuNX42k_HdV20zW+buACBTmTZEHWgS-ddRYsvnfwDSg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
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
X-CRM114-CacheID: sfid-20251021_052300_861109_BF634D2C 
X-CRM114-Status: GOOD (  18.47  )
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

On Tue, Oct 21, 2025 at 2:20=E2=80=AFPM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> >
> > And with the implementation this series proposes it would mean that
> > the perst signal will go high after the first endpoint pwrctl driver
> > sets it to high and only go down once the last driver sets it to low.
> > The only thing I'm not sure about is the synchronization between the
> > endpoints - how do we wait for all of them to be powered-up before
> > calling the last gpiod_set_value()?
> >
>
> That will be handled by the pwrctrl core. Not today, but in the coming da=
ys.
>

But is this the right approach or are you doing it this way *because*
there's no support for enable-counted GPIOs as of yet?

Bart

