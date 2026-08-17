Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C07C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 12:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idn/pWXHIgw56/aGT8BcsjeFenZq81CxiFxEILonPKU=; b=cdWxu0nnLMqQN6MYvt/wTXqT5v
	lmOoPq0hUf9xv1iq+qU2xk4x/ecy49EQSznMv+gkOc/bfdW0LraoskakDz9ps8gbBwZb74wCYLs8j
	59nVB9jig9mRIDd8eAvzn9pQ46tAZNtV4COisPNG5UGsRvTmOPyT1Nl3rvjpKHUV3zswZon7KVwwZ
	4c64Tn7EZqsnCDa0IeFqWxljBha3o+ushJ959xXde24wQDJt8jdgxXqNemopxhz8VJs5zJta0zwEU
	W7ELXfG8itsP6SoIo6cOMsmNYeiGqZGkgRBpQ+QGfVYyy8MiysaWZyv1uNrWMyCaf9s+ni26KKx7V
	9wMilLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwck-000000068b6-2vA3;
	Mon, 17 Aug 2026 12:39:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwcj-000000068ay-1H3v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 12:39:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EAFE60A84
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 12:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72351F0155D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786970367;
	bh=idn/pWXHIgw56/aGT8BcsjeFenZq81CxiFxEILonPKU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nPLW+2FO2l8magX9nb0VKajLqiCqJsoYKA94q1CksO426LzonHJ2LrF05RKAXrg0F
	 vZShumVsmRGsTcDHJGZSfuwiRkJGF4eXkAQ3W5VMDzKTecjDFpqW7oyRxKwjm+HfuN
	 X894mdGDED43sPHabIrGSAf9brQLkrC8jhk1f/b86k/XP0HEekmRiRySk58J2yUjzd
	 gwgDsRpA4splgCn5Q0rXpFirj6gf2VK/Vt5Hwjaevgt87CH5dlTQGTs9Bgl5r1S2oI
	 v/ze5RzdIaoMYcgYwViyIt18xMOhGyvdRJdwSypAWXPRGjwVOv9GYxRPMbxl8PcHt9
	 U3uBrC/A+qenw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so3615744e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 05:39:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqBQ086KLK0zAeNKrBV1U1YWJ702ybWHo5ksrck4GrdJ7cxqXICWa22ZmTNzDL+znPPr92TaTJScXqUD27UANg5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy38uK45bh51T2HmaNZ6lj1ujzDWesPTdLt9OT1A/TY+HFPkz2s
	fb/yKbjRyDY+Zgr5RQWr/U/368I/tcFgdDQX2cg1qB0kDxLJExXG1jDbn6VCundoqiS9JQmWZky
	K6lUBTwiGrp+EGkKt4SrlM+9pupenqic=
X-Received: by 2002:a05:6512:251f:b0:5b0:82d:e90e with SMTP id
 2adb3069b0e04-5b459166e3emr4172357e87.19.1786970366630; Mon, 17 Aug 2026
 05:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com> <20260814-kuno-soc-support-v2-15-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-15-3079794f0f73@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 17 Aug 2026 14:39:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLnkhsz8Uhm5UBMhXiAwBp8dnNkh8A_fFL-dnSZQ_CT91w@mail.gmail.com>
X-Gm-Features: AcwNN1Xpg_Z0StBfw_5gikXV84b0FzBwXnDsTOtTS7PYbUy9Cd-ZSMo_wHGUYfc
Message-ID: <CAD++jLnkhsz8Uhm5UBMhXiAwBp8dnNkh8A_fFL-dnSZQ_CT91w@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] ARM: dts: qcom: Add initial device tree for Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Aug 14, 2026 at 9:34=E2=80=AFAM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:

> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

My comment is addressed so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

