Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34D1C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 05:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6T/KCHf+Ei6zi7zTvWLwzhq48X8JCTZYV766cOvpN9c=; b=LsjL8m1yA2J9kGJbUx0TIk8Omy
	mlJcCVDvWMcDKwfXewXdBlWwTd+brx65OaXWBIJtVDT3+eaVtZOzEqkgBiRsliogY80pokCdRno6B
	PfCbFfYOo82zYWUMQlzvZ9Lpu9JKy7cqsq/PJGHGopZdO/q9SqNeaj7ICJaelynu/nNmv8DVShmAQ
	wK2OtebEachgpcUGCl19bOaGtPgoRl1plbt9uAGg388pRkzRfhMBqG/aizMEQ1TfGGRCLr6sWu+Es
	bDCtbG5HNUu0zXKvDeuyrdtfaY/xeAI3ky1i3CzPXjnGBU1+G/8yKuoDguygxLUJVIUffk977xsed
	mwpxxkdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlhqI-00000007THK-1N8C;
	Sat, 22 Feb 2025 05:14:22 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlhop-00000007T9G-1fhY;
	Sat, 22 Feb 2025 05:12:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38f325ddbc2so1991300f8f.1;
        Fri, 21 Feb 2025 21:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740201170; x=1740805970; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6T/KCHf+Ei6zi7zTvWLwzhq48X8JCTZYV766cOvpN9c=;
        b=IO2kmdumt2dJN6x/nOwTFKQaUn9wE4ArymIb6WC8iNknTEojsWWoIUrvzXdq0X52ue
         MbNY1UZ5u6CDZUlNkWP0KvfKW0ia/i1XAgiFhXFaH1Zm/6gefcuPg8hhVJkhdfvwuCvU
         nFV+IVr0chJtf/dIerKc2JHtgn7Qwo/hrSl06N7ip69SBMnKsEUdGfHW/ipIInC7HMVn
         zaMN3aMZYxC/mnRTEBx/eH0ZNUo7S5JzGn0Agc55N+3YYQNjF4koyVDZDeTJttnFP8rK
         m7YHXUS0ldgsNWXtS+o6Tur3h++rwQ3+NuNT4WVZdY7Y+d34vjJXfMk5RdC53pspBb6r
         ankA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740201170; x=1740805970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6T/KCHf+Ei6zi7zTvWLwzhq48X8JCTZYV766cOvpN9c=;
        b=Tc4bkLpNwWTIEW1tvnAvlO6gP08YvbYpIHpBJGDJQuTkiLQ/oHQYSoocesIkkugKlT
         aPji57l5YcHFnJfABfwIw+MsFt8rfcXSJ+xAN5lDTWbgAC5SNa8dWswX4uT5LSdjVaZw
         w+RCJN1HiIGJ7hO4rFarZnqfOjBS2I2IWxbFTDrDGu2ALov9jgl/RFSJ53cv2JNGIXtK
         y1Zydca6A5MRlI3TLWD9RnS72YSlq/jjuV8+a3IVCQQB5PYWzG7+8SOJdI8J0ybHl9QP
         YKcLuuCN/7wQMWh39ZN67EBi3IdQIzVXHS9zPl2TE83KoLwV+tymNAfMPTPCM51KpKDb
         WOpA==
X-Forwarded-Encrypted: i=1; AJvYcCVpzlAqLOJH8CIxjBL5+zy4XZpgWkslvwnGJQQkUP1v5jI/OccEgKcG9+lq6uwHZmeO9B1rZPl9EA5m0/P3StE=@lists.infradead.org, AJvYcCX02DyQlgWtGzV6822gTYxDHq6pJHFNZVj6IpF3L47BXVt1NM/ewc+qRmiQ74Qy+OMZ2T5HP2wp9zRqYmCm2Nqv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6BbbSJXzLTUpCpbH+eJoi2ec5LQwl9sZC4xfV8Lm1zP3vGMmR
	m1UiUeEJgtmRXGuGHwtUM/hYngOy8b3zYMBd/T33HyK84IJLDUdH/G7W/G5ZXdjdxESuydjCARf
	prEHLRhl/j2NwZmkyMIzbXGc7iEp9Vn3hdXs=
X-Gm-Gg: ASbGncun0cd4P/JCA/cNYyJfc8dliqd8GcA5SvdBMpvtzLoa5eEm70qnNXIYTLMEO2M
	eH8qQOQw3MT0gZkeq+9LyAJdYDqNk7YKYqC6yRpegV8DHGCMoJTY26uqp+HTbe4BmYSFJmqsdcf
	83JsTNaxxf/dnoxqGip49GxMVPhPjgd4gPnQNSVfE=
X-Google-Smtp-Source: AGHT+IEW6AS6PpfMRepDRzL9ExNcBTNuvf/NS8ymolr77jne2YAUCpK0x5UZBFn7h33SprUxjhKLmpAbB1mx2B78zlE=
X-Received: by 2002:a05:6000:1a86:b0:38a:8906:6b66 with SMTP id
 ffacd0b85a97d-38f708267ffmr5716008f8f.38.1740201169476; Fri, 21 Feb 2025
 21:12:49 -0800 (PST)
MIME-Version: 1.0
References: <20250220041010.3801-1-honyuenkwun@gmail.com> <20250221231340.GS16911@sventech.com>
 <CALWfF7KW8_vAx49nNygKpLHNJQVpjvVdVpzYiTAWgQvSopHikw@mail.gmail.com> <20250222043632.GU16911@sventech.com>
In-Reply-To: <20250222043632.GU16911@sventech.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Fri, 21 Feb 2025 23:12:38 -0600
X-Gm-Features: AWEUYZmOz5ZgFaqw7x29fs1q8XxuuW6_nHq5zINvZiHD-ka87Z3BCTFNSH7lH2Q
Message-ID: <CALWfF7JWiZnqJCAqCK4-TjVuUTqv96+=u2pC2iNvTbCBOCLuqw@mail.gmail.com>
Subject: Re: [PATCH UNTESTED v5 0/4] Orange Pi 5 Ultra
To: Johannes Erdfelt <johannes@erdfelt.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_211251_440185_5FE9862D 
X-CRM114-Status: GOOD (  14.60  )
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

On Fri, Feb 21, 2025 at 10:36=E2=80=AFPM Johannes Erdfelt <johannes@erdfelt=
.com> wrote:
>
> On Fri, Feb 21, 2025, Jimmy Hon <honyuenkwun@gmail.com> wrote:
> > On Fri, Feb 21, 2025 at 5:13=E2=80=AFPM Johannes Erdfelt <johannes@erdf=
elt.com> wrote:
> > > I'll also see if I can give HDMI a test.
> >
> > Please report your results when you do. This is one of the differences
> > from the Orange Pi 5 Max. The HDMI1 pinctrls does not use the default
> > pinctrls like other RK3588 boards (including the Orange Pi 5 Plus).
>
> No luck yet. I do see this message in the kernel logs 8 times at boot:
>
> [   41.552751] rockchip-drm display-subsystem: [drm] *ERROR* failed to
> get pll_hdmiphy0
Oh, I believe you're hitting this.
https://lore.kernel.org/linux-rockchip/0dd48599-448f-4472-9a8a-54b7f0379c13=
@collabora.com/T/#ma4eb427de77b5a4806a2c2b5bef2fc8d4003f801

I included that patchset in the integrate-6.15 branch. I don't have
the problem on the Max because it has both the HDMI0 and HDMI1
enabled. However, with only HDMI1 on the Ultra, it's not handling the
disabled hdptxphy0. A quick hack is to also enable hdptxphy0 also in
the Ultra dts.

>
> I'll confirm with the vendor image that my HDMI setup is correct.
>
> JE
>
Jimmy

