Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD50E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 03:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1k1WfYR2gjydU449wpk5rhPTUc08x8Av6VdOn6ZQfI8=; b=kr5kzyrVVVbkVl
	CNEEDTsf5ZU1OWxnoUPPeU+92gxKCmum1LlcOz+38CZNgyVGi3OP7mAFKj4A3z9dx9DuMcG1YfVoW
	Rx1vAXlbQnKlTM/n6NLMiS/mTvJVfXvBzeo3uE/bvu6XYbjIy5r4m7uGOegos7kst0jPulMcJkdoz
	ZwHfMc+I5eZx4Xx0fKOVjkWXFgTFMrqaKJfa4Y7xsJXPc/vL5N/IMY13Wm908yOSpVhIjwwarsbhh
	3hIcVamI3nO7jlMoZpEO6qT+MHO3ZeFxnkFY3OYLAhZi+QsFTeB3hgTrCQlaudumAyCBCHVwdTnFQ
	1zRKcsQFF2YVuO6TYHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ2Zb-0000000Eelw-1T7H;
	Thu, 05 Dec 2024 03:30:39 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ2Ya-0000000EecQ-2aKQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 03:29:37 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53df119675dso621510e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 19:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733369373; x=1733974173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1k1WfYR2gjydU449wpk5rhPTUc08x8Av6VdOn6ZQfI8=;
        b=mc8a9mjFO2uYKaPcGk6w/gQYtFzumKOBRrNUZvQWSVfgiWNb0oCT/fEsEEAfsx/+uw
         1/btJD7wx0fVSXASWsSfsCUpp+uC7mgYsgxaP777dzsyOLUl4VaTzZeuJlEzgxLWU4XD
         3tTydFuua9zP0MTRjPeb/7ypKA86NizLmTRJTXLtj1uvyijWmkFpoDLJ0wP86jAvdwZC
         QEUx5925jxOr0NCmX5eb6i98dzQq8UommQHZOjFRowSAm7Mkn5jmM+4/yCkASWsLDsPj
         4D75IktoKh7KgTA8PHr2bBOOMXwb/974goNLnUWwUtxFJtz7GGLaaSxmA3Uqv9Csphx8
         bObQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtCfokclD/YTPTVniXeJhcb1XwsvBMy1TDrXmL4nfMaEYjjo/J086kj1gSaN5G2ccIsIn2eRqmZZtavJGldkTD@lists.infradead.org
X-Gm-Message-State: AOJu0YzM+9DOJQMuUxEqF0Vlo1DmggN633UhpJf5lBTMSGu5fuZhbW+x
	acrVb9IOXlTZkGevwEeKkbsaE09D5wchIlFMbKhf+855UcCkT4mbxAPod2Ny
X-Gm-Gg: ASbGncsZGWgkfwynCKwKCEvked0gjB8h6y5pyrgCsvhOSyCQRVdQyaSsFHR9M8aA0XR
	CeLZpYV8NmJiRI4zVyGHq8o0AKpo+ObK1s8bOfhrTS8zQyvrJjv+eMgI1MSWmR4txGNMpMZMxzt
	mk5RECpgTiu0H+5tJYU1ITH+Q2B3eNC8kmhnHErJsrY1uEwzXf+Yz14rhfVx/UQSTpxRH7n6HZo
	00sWSKQ0BJhvTq1TuaNJX6+k4hozhvYyrK4DDvvh4aSK6qRvpcq8BcNQSRyKOx66yhNRP1ZBLHK
	btCEUVs=
X-Google-Smtp-Source: AGHT+IGc74YdovcOfkMsBq+niUyD0WJodYMrDEMly/9kjxEKoDJ5HeyOxG7DhoyLEkx/bamPgqnOmg==
X-Received: by 2002:a05:6512:158f:b0:53e:1bf0:9a8 with SMTP id 2adb3069b0e04-53e1bf00bc4mr3659697e87.6.1733369373036;
        Wed, 04 Dec 2024 19:29:33 -0800 (PST)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22974fccsm90023e87.69.2024.12.04.19.29.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 19:29:32 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffb3cbcbe4so3973971fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 19:29:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMf7Rgp13zgQzB9hqZtwj/0lhuJnIunls9182koCQFmM5SU45IAOYETXDtGrL8yUMYxQBU37zmsCG92+6e1Psb@lists.infradead.org
X-Received: by 2002:a2e:a907:0:b0:300:8ff:d93f with SMTP id
 38308e7fff4ca-30009c50cb0mr52396671fa.22.1733369372603; Wed, 04 Dec 2024
 19:29:32 -0800 (PST)
MIME-Version: 1.0
References: <20241205000137.187450-1-csokas.bence@prolan.hu>
In-Reply-To: <20241205000137.187450-1-csokas.bence@prolan.hu>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 5 Dec 2024 11:29:20 +0800
X-Gmail-Original-Message-ID: <CAGb2v674BnpmyP6zC85zbCuKVN-gb3MQA=CiQoe7-eV8qqyM+Q@mail.gmail.com>
Message-ID: <CAGb2v674BnpmyP6zC85zbCuKVN-gb3MQA=CiQoe7-eV8qqyM+Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add F1C100s audio support
To: =?UTF-8?B?Q3PDs2vDoXMsIEJlbmNl?= <csokas.bence@prolan.hu>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Mesih Kilinc <mesihkilinc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_192936_656203_D0B5E0BD 
X-CRM114-Status: GOOD (  17.55  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Dec 5, 2024 at 8:03=E2=80=AFAM Cs=C3=B3k=C3=A1s, Bence <csokas.benc=
e@prolan.hu> wrote:
>
> Support for Allwinner F1C100s/200s series audio was
> merged in the for-next branches of the DMA and ALSA
> trees, the last step is to add the codec to DT.
> This series was forward-ported/rebased to the best of
> my abilities, on top of Linus' tree as of now:
> commit feffde684ac2 ("Merge tag 'for-6.13-rc1-tag' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/kdave/linux")

There's no real need to resend just the DTS bits, though I appreciate
the effort of making it easier to pick. There should be no difference
due to rebasing, since we didn't have many F1C100s changes.

The DTS bits can only be merged after driver bits have been accepted,
otherwise we would get DT validation errors in -next. After the
notifications yesterday, I started to pick the patches, but it got
late so I hadn't pushed them out yet. Just want you to know that they
haven't been forgotten. :)

BTW, if you merge different patch series and resending, please keep
the highest version number, like you would when resending a single
patch series, and also provide reference links to the originals.
That way we know where it came from and which version it was from.
There have been cases where the latest version was rejected and
an older version was resent.


Thanks
ChenYu

> Mesih Kilinc (3):
>   ARM: dts: suniv: f1c100s: Add support for DMA
>   ARM: dts: suniv: f1c100s: Add support for Audio Codec
>   ARM: dts: suniv: f1c100s: Activate Audio Codec for Lichee Pi Nano
>
>  .../allwinner/suniv-f1c100s-licheepi-nano.dts |  8 +++++++
>  .../arm/boot/dts/allwinner/suniv-f1c100s.dtsi | 24 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> --
> 2.34.1
>
>

