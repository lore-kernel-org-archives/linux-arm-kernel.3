Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7C2CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krtDUBIIbBhf5txhvHZ8ViDPiZJA8hj1zGguCfZUNVQ=; b=sj4FoRH5qneLCX1q8CGA1BCgEV
	tCABBfkQCok4jcFSOlSiry5vUC4zvTsmRZSZo+A3UhKiqUs8xDmg9aHxGmYRNy4FiN5j70tIkBqWL
	1HI9H/v6+l6IGJnpcpthMAVQLW39Tq78N/TQ4b4oWRPl2RMfQ6VWpWgU6txpemAqr/s1c5Kyw4pj8
	QdI/zCJQJb8kMNrrkiTS3cA1FJA6aOVLEGLbslwyoKdV4Ker9JuJLYAdkWMI/PFlQoZ/SpqMwAADz
	BSudhyVd/BhzXaJH9FS62flYnfl6MeEkPkErayNP+m0POpZ5T4rvyfLIKBRUjsp4rhxawMqeN/6d4
	elPvX7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAl7d-0000000CKzq-0iV1;
	Mon, 20 Oct 2025 08:20:05 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAl7a-0000000CKyG-16oA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 08:20:03 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-7ea50f94045so77255596d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 01:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760948400; x=1761553200; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krtDUBIIbBhf5txhvHZ8ViDPiZJA8hj1zGguCfZUNVQ=;
        b=WgXYjiuMqZq0mWphobYIT/PCVgW9eMRa5WaQAwHGPQBFQiVDCw5JPBcZG51cIY5c1Z
         ikMYdxmcmz3YwpjgM9T9jhsGxQ6Lzrf3perBgc/NFKHqr1II8a6ZgSDc7VbSv8BzO0aV
         Gapm01BGxaS4mo3bLw79lWp7ZZfl3OgjWoqx2Dr5yerWE78RvUoBFA+/kwiG5Mx4Q6Tz
         kaDGap1BSMbC+2PnuzC59WW7ApdXKvfH+ccubSEOjSKVfpqlhVJ7PTu/56zOJOBr0yMs
         KPJkWdrJcxWsUAeqtm3zQGvdLEN9bouC8gVh72Hpxmlqn+sL0dwqhm5u+iUgO74rtGIb
         /KfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760948400; x=1761553200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krtDUBIIbBhf5txhvHZ8ViDPiZJA8hj1zGguCfZUNVQ=;
        b=S0c/4zZ81gMf/9CsYrpZOxygUJpWublKh2Gi7Synesx+vQptZpM+nQoaEwV9QkCIGX
         giU+cHj68I93vnzIvZvilTbEWUSpOExxmidDX0mYK+GWsp9e/3t7xDV2wMBy9RRXSWp3
         okl5uq0etIrZ88kV4alneqF5ipmezVrTTmz2Smg46/fbMpnWllpOg6hGRfIpHNDyLyQ0
         OwlKjWfgCCI+FJUqPpo0J6zeq2HgpXYN7f8Ig8Re8cRUOJ9V1kieHJF8b+sxsQrT3wg4
         mrZFje2YWGgYuE7WYttTJfqvPUXll5KjigU+TZN8WnqAyX1OJ4JYaiSgYerghEQy8zPH
         EZ6w==
X-Forwarded-Encrypted: i=1; AJvYcCXKX3Wcjq3CyemSMG/Ds2gBshwithixRpM7SxNK35aKh7ppLWbWa6hOQ/CxAtzSREpYnJkTMbGLvpycgedG9I+M@lists.infradead.org
X-Gm-Message-State: AOJu0YyV4AM739aDWq8Dh/bvFt/QlxR+HGvs6h0gr5JgoyafgCofJrSP
	5K5wZ4bxprEm3iB81eIbQAZ6xdfn5TuLu/6BNHc9DjSzvcHYXEK6ak2o628iQ5tFR+6O8klE4nz
	liM8AHhszGozEUKJ1KL3hxcWYZAC8l8c=
X-Gm-Gg: ASbGncurK04a6a74wEvspQyXK8i3Qr5ZY8GeGkCpvxqJov7JRqpeXdk5RafUGtni/bK
	OFPypiceN1pdUblF633nlA2ibIAKjgjavdg4+uwefAw9JDc/OsPiv43o6Do/5rrGB5XLOuqWdeR
	3GyulnrPh/zm1wlRsViJykvVSpx12J1wVTuabOThiggcw81Y7mP8HdK+cBRtsXvofmnUbDZv7i0
	mOIkEvkQoqQk9FShPiwdAhx5HAX/aAGWn0RkOoBd9HE2LeYOYXKuC5dWDfz/33tOkoKWZvKPEcJ
	NggLLfD6Xo/MDiaDWg==
X-Google-Smtp-Source: AGHT+IH00fZSiLlpv5/iK2nqClbPVqEOFs6NjYUaaUpZZ81WenopkIUOdg2ZPbRIOvaCbrU3WZ4RbOVGHG7Hebvs9Kw=
X-Received: by 2002:a05:622a:55:b0:4b3:4fa9:4cd2 with SMTP id
 d75a77b69052e-4e89cfb2443mr191567221cf.33.1760948400448; Mon, 20 Oct 2025
 01:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-rk3576-evb1-dsi-v1-1-c76fc3740abc@gmail.com>
In-Reply-To: <20250925-rk3576-evb1-dsi-v1-1-c76fc3740abc@gmail.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 20 Oct 2025 12:19:51 +0400
X-Gm-Features: AS18NWCBDCEZzvVwJX4XETqmgmCCBqTdNAVD0aLBXbcVgyOY6pJqe52HL1dPqJA
Message-ID: <CABjd4YwVfrzxYKM4cAG=-fMbw9OcQGZD20CVCG8FvC8phDsw+Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add DSI LCD display on rk3576-evb1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_012002_301650_2077BE83 
X-CRM114-Status: GOOD (  16.82  )
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

On Thu, Sep 25, 2025 at 12:38=E2=80=AFAM Alexey Charkov <alchark@gmail.com>=
 wrote:
>
> Add support for the Rockchip W552793DBA-V10 LCD+touchscreen assembly whic=
h
> comes physically attached to Rockchip RK3576 EVB1 boards.
>
> The display part is driven by the on-chip MIPI DSI controller, and the
> touchscreen is connected over I2C.
>
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Note that backlight support is left out for now, as it depends on PWM
> support [0] which has not yet been merged.
>
> A workaround is simply `gpioset -c 0 13=3D1` to set the respective GPIO
> pin high and thus to light up the display unconditionally.
>
> [0] https://lore.kernel.org/lkml/20250602-rk3576-pwm-v2-0-a6434b0ce60c@co=
llabora.com/
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 89 ++++++++++++++++++=
++++++
>  1 file changed, 89 insertions(+)

Hi Heiko,

Any thoughts about this one? Can we perhaps get it merged for -next?

Thanks a lot,
Alexey

