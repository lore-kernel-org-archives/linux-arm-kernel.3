Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD037C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0BoI1B2SW1Gn2SrMpAVpRAmC4OHC4tZa8DJdUfqO2A=; b=BvVpUv1qHn0qiYuBRSFOzRlnFo
	DsikIwu7+aRdXoXbSkPD8EMecRr6S8tWB5/qvQnE210Kb2ppB1trXzVrK8YCmTcjRKWz313XSO26T
	YG644ux+KeEeAH82Nbn80sjzagZe18ERefu1qs92nF7LgF7VW+lvFHClZuQP6fmZNWWZAlTZf1RSi
	zVBNY6miJSS15wytYdxaHSCPmWPqepMqJl58MXFyG1YBpQ9NLGgS2+4aQYOa/hOC2P9UeaLc2yzIm
	Hj/qm5ehbWP3ZtEISrJpWMuyGT3AdBctOJbFzCtwL/t86pasFCISqx+qO/dZy+Ozj04ZwgEOdF/wd
	mTldeeuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwYd-000000068F3-0YaE;
	Mon, 17 Aug 2026 12:35:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvwYb-000000068Ef-3glx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 12:35:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FA754400A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 12:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B8D1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 12:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786970113;
	bh=F0BoI1B2SW1Gn2SrMpAVpRAmC4OHC4tZa8DJdUfqO2A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=csseRKHQX5NyNSjcQKvlDmFWeo5PfxggOGtuQpn/ZKn3CT0o/BTbkT/jpLdYDFc6g
	 6m+X6vBujvUDQ/iAfwKZ3btQYHMDBk12RR4oCjjdYhEbCUy+3GUxjIfsI9Bg/gyL+4
	 T4jLVMBE+OiddY33VJ3RFdjS777uavuRurNh1j299B5DSr3W4gxhrwFMvKKUySeebG
	 H6TobWVt/hJgNN+zPs3GGzbHMN0Cec7n4IdOfMDJ4wmewDkHwhx0qX3YKwM/DYm7/X
	 dMmMMN2CDqwGdl90e3IIkL3pYpPEUaHUsph2c72yd4FLhNjV82JToznER+tsEqGE2I
	 qZTh4BSHHlaaA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so2696756e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 05:35:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrS5GIQw4W31GVkDpmQsyiDAtjCQacXw5j/spTrq+atW5dq733dMYH4JZRT+AqUnFY6inqUQf7E5FsVVM3xnuPI@lists.infradead.org
X-Gm-Message-State: AOJu0YxqfsKcFDZ+t1gF0PmJ/XErk+KCxJOsfVVEldPiTjh4msagAKlT
	zbA2IiDNYdYp9VwyKnccAAYt27ecen7/xjhHTZMQfu+HWq7WccPtTuZOf9aRo9dVZCU/wUkWzqH
	Ws0vX/mOYqBwQE/rX/3Vu+8y3kT3ndk0=
X-Received: by 2002:a05:6512:66cf:b0:5b2:e956:b459 with SMTP id
 2adb3069b0e04-5b45915e1e5mr2876859e87.12.1786970111723; Mon, 17 Aug 2026
 05:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 17 Aug 2026 14:34:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLkjDSQMBZGmDwhqzsvF-vds8ynxDgAwNe4QTtpf2mUuvA@mail.gmail.com>
X-Gm-Features: AcwNN1VfwHAQiclbXAp71Kv0t_X4ZrB4Vq7QuyBm6v6ehpWFekFj-AwEo8Rc4XI
Message-ID: <CAD++jLkjDSQMBZGmDwhqzsvF-vds8ynxDgAwNe4QTtpf2mUuvA@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] Add initial support for Qualcomm Kuno SoC
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
	Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

On Fri, Aug 14, 2026 at 9:32=E2=80=AFAM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:

> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
>
>   - Global Clock Controller (GCC) and RPMh clock controller
>   - RPMh power domains
>   - Interconnect (NoC) provider
>   - TLMM pin controller
>   - PDC interrupt controller and SCM firmware interface
>   - Devicetree for the SoC and the Kuno IDP board
>
> The soc: qcom: geni-se patch allows the GENI serial engine driver to be
> selected on 32-bit ARM Qualcomm SoCs, which the debug UART console
> depends on.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

I understand if you wanna be a bit Greta Garbo mysterious about this
SoC but patch 10 gives the hardware away:

/* GCC clocks */
+#define GCC_EMAC0_AXI_CLK                                      7

Aha it has an ethernet interface.

+#define GCC_PCIE_0_CLKREF_EN                                   22

Aha it has PCI.

+#define GCC_SDCC4_AHB_CLK                                      53

Aha it has SD/MMC cards.

+#define GCC_USB20_MASTER_CLK                                   58

Aha it has USB2.

+#define GCC_USB3_PRIM_CLKREF_EN                                        65

And USB 3.

Other files give away that it also has a modem.

Etc.

So what about writing a bit more about the platform in the commit message?
For a surprising brand new ARM32 platform we (the SoC maintainers) are goin=
g to
be curious to know why this is happening in 2026.

Yours,
Linus Walleij

