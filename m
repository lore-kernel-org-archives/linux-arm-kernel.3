Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B27E10ED67B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 15:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UuUnWfXD98Pmh9YhxfD0a09sp8HvQrr/ojoD+/kiOvk=; b=Ibqf/IBKloG2WX
	S19ck2mSsW6oPQ62JNFdG9Pq85fjb/n1xLolyZjlJBHm6k+lbXN7SruTTojuv//UPo2qXtJCOievZ
	uWbdmjRGmHIL+tJuOnWCN3Y9qJYlBpHEfZqbqjN2gFATpe/ourfJorGDlesrjOO80ZlDRKX7Pqp5C
	dME7xQzSn+ayQd9zkovQoEdW88RmtOcz+fNOTeWveENHGIpUVnANHKlisGHZ68L3foCi3B1flJITV
	GG8GdL8BUQahrpfIzNaEUblPzezClBnHxMqeo1lAeyJ9YVAAiOuM7QLbYj5IuuVWkoR3qK6fvVgl6
	4zY6mQxMY7wxkfW1oOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6VP6-000000094EF-40rV;
	Sat, 28 Mar 2026 15:16:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6VP4-000000094Dq-15Tq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 15:16:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80536434C4
	for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 15:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D85C4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 15:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774711005;
	bh=BEU9rMTbOAWYA1FwR7F4qwNiCjzAb+HmPpFgx2cS7wE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=JFMyEqw/Nujo2/dhIOTDxkTXzP3k0JYARCsfeqmuwFeu+liRmr3e15jlYcKPq99J1
	 vj99FWukFOdiUJMN7bl34bm8ftMFN1SQPqjvDcqQYNfRhV5V0+6tuccf0/IFrJGLH8
	 ANs395Ogmq6ch0EcYTgN8wrXpp8UEGejuZGlfHhCHPhVkacoy3kyw33+SGlrULOn1P
	 L/irBoeCNX3S+sy/iz+9mJnewCZ+FVHeP2taYzcTf5b3YtLbtf4LnjAyS5/nMHCpiW
	 NtdRasrad0dPnI4+z4uk/sHk8fClOVNvITO1sC1aUVklev22b49/nVs24uUxRbahFG
	 Z5ml/kj8dXykw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b980b35534eso639520966b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 08:16:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmpGQWQXTkxRBIBA9i74vSrOCeErsG5xPCjd0Fc12q6V5ko8jxXaKxWoVG77dFBMV9R1WnFSoZEXaX4DgHqMMO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy38+NvPHozf05AvnpKxW7gsC+OJIX0LghdNrkH0nSRjsHMtXm8
	qyCHf3IY3K91TWTGZmblA0tibrP+JlVzN55nxGv2nXDhw3EzuQ6hqwsqi8ar6NMxPe5nbdEEPOt
	hnC5JRgMWowxYad2+Q2Bsyamg4pldZXY=
X-Received: by 2002:a05:651c:30ec:b0:38c:33d1:dd09 with SMTP id
 38308e7fff4ca-38c653f91c1mr24155731fa.10.1774701616378; Sat, 28 Mar 2026
 05:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech> <20260121-a733-rtc-v1-6-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-6-d359437f23a7@pigmoral.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 28 Mar 2026 20:40:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v66YWa_CnSh1_rM707Lne4MF+imML3B5ad4TQ34hZgQ-tQ@mail.gmail.com>
X-Gm-Features: AQROBzD9uvYPfehFAvfWSqRC7-wZ99UgUGl_PBhFagiwx6384R3sEI_1rOb_K7w
Message-ID: <CAGb2v66YWa_CnSh1_rM707Lne4MF+imML3B5ad4TQ34hZgQ-tQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] rtc: sun6i: Add support for A733 RTC
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_081646_342050_5273C3AD 
X-CRM114-Status: GOOD (  22.22  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Jan 21, 2026 at 7:04=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> The RTC in the Allwinner A733 SoC is compatible with the H616 in terms
> of its time storage and alarm functionality. However, its internal CCU
> is different, with additional DCXO handling logic.
>
> Add new match data to register a new auxiliary device for its CCU part.

This is probably incorrect, since you aren't actually adding auxiliary
devices. It should just say "add a new compatible and matching data for
the new SoC".

>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/rtc/rtc-sun6i.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
> index b4489e0a09ce..a58d9c6b917c 100644
> --- a/drivers/rtc/rtc-sun6i.c
> +++ b/drivers/rtc/rtc-sun6i.c
> @@ -865,6 +865,11 @@ static const struct sun6i_rtc_match_data sun6i_rtc_m=
atch_data =3D {
>         .flags =3D RTC_LINEAR_DAY,
>  };
>
> +static const struct sun6i_rtc_match_data sun60i_rtc_match_data =3D {
> +       .adev_name =3D "sun60i",
> +       .flags =3D RTC_LINEAR_DAY,
> +};
> +
>  /*
>   * As far as RTC functionality goes, all models are the same. The
>   * datasheets claim that different models have different number of
> @@ -883,6 +888,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[] =
=3D {
>                 .data =3D &sun6i_rtc_match_data },
>         { .compatible =3D "allwinner,sun50i-r329-rtc",
>                 .data =3D &sun6i_rtc_match_data },
> +       { .compatible =3D "allwinner,sun60i-a733-rtc",
> +               .data =3D &sun60i_rtc_match_data },
>         { /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);
>
> --
> 2.52.0
>
>

