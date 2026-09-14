Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDEBC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6EWldjLUV164UHYmg9SwSNk9vpahiavUGimVKHnqTs=; b=w7qlEFxztcqawCnzI4+JBelmu8
	izsG0zIGU5XP/brCtLR5V9rZb55MMSsxBfLI3akKt5U8atJfCrp5on4/iWU6dp/VTKU5+MvkoshA8
	IPmuyNOpXk8R++JIxmLD9ZDybTHQY0HLv7XsRBa2DoVGkmFd7IB4LqHApfXMpvKgkkqXXpA/8emsb
	L/VbkWzP4SKheVXV6uAWEYiSd/a63TGbw/Cb0GYVM2jdY7/bYM3yZYjuFjtUN+7S7nFBBENFO2vbc
	W/hukr1e0mG4c6EpNp59lW9alYoE2Cj3Zfhh6VK86HvsTv6mGoSBQguShus7kVK2qucCy7iAQBWFm
	elaX2Yfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x621a-00000002jdy-07UY;
	Mon, 14 Sep 2026 08:26:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x621Y-00000002jdc-09rC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:26:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B27C743762
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5B71F008A2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374407;
	bh=e6EWldjLUV164UHYmg9SwSNk9vpahiavUGimVKHnqTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=S7rZ64Er9f2J3r71j+Ra/t2dR0m3MCQd2lZWyIajqu/P1gyoxwditamSmJAhvxfLO
	 oPuqEeUZCXSPfct5Y87skLbFYzdxrBs7ygzvAI1ulhvODDeH36Yy4wapVKHZPMta6V
	 qIosKNt2T6yX/nNiiwHxrqRS5JDVDo+RH2e7LJLdLwtV5R1W0nJdzhIK2Vzu5m+ATB
	 rfIubf7stDTGlVK6riX994NejNaH1p6zZQ7VN41kJTqT93rPJIumty0w/xQRmcW+dk
	 /+zwsJ/MZoiBqKepzlCCkPLfbDXMjS0GneU9PtrZOkKHWMV7u/AmzKmfTX45sGS/ID
	 DxVr/E2qiV97g==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b79784a6edso1606205e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 01:26:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjc7KiwoB0HqBJ9yjRAxRHxVAQPfVxkikXdcALS751/bNDM+FlMXYYYuD8EpnGQZPqoYhI1ZwC4Fv2+CAfURQd@lists.infradead.org
X-Gm-Message-State: AFuF++loigNBv0IaazMOUrbnvMcbveAgjwhWpedSCoIcV1eTQCYjcGUh
	1e6zNOJKTFoh7SvSes7QH8v30Tue7m7k3g+oPy0/YiZrJku4ksZ17xuECpAnz/O713p3/edVly4
	JpdjJYM/cePeVGzojIRNPvfZSbToh5/0=
X-Received: by 2002:a05:6512:239f:b0:5b6:184c:7da3 with SMTP id
 2adb3069b0e04-5b8ae6afb21mr372849e87.44.1789374406193; Mon, 14 Sep 2026
 01:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com> <ac236a52-1293-4a70-b5ea-ec6118cb02e1@oss.qualcomm.com>
In-Reply-To: <ac236a52-1293-4a70-b5ea-ec6118cb02e1@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:26:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLnmH31iNsOeB7CWWpxkav6qxRgU6-tp=gxZxwWz3KUupA@mail.gmail.com>
X-Gm-Features: AcwNN1UxxQOsVcBHVbSaj8l-dq0hp_W-v71JNdK8T8AJOQnCtU1FStuksPYcjMI
Message-ID: <CAD++jLnmH31iNsOeB7CWWpxkav6qxRgU6-tp=gxZxwWz3KUupA@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>, Georgi Djakov <djakov@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
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

On Wed, Sep 9, 2026 at 8:43=E2=80=AFAM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:

> Several patches from the series have already been picked up and applied
> through their respective subsystem trees.
>
> The remaining patches listed below are ready to be picked up as well:
>
>   [PATCH v5 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
>   [PATCH v5 07/15] interconnect: qcom: Add Kuno interconnect provider dri=
ver
>   [PATCH v5 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
>
> Since the majority of the series has already been applied, I would
> appreciate it if the remaining patches could also be considered for
> inclusion.
>
> Please let me know if there are any outstanding concerns or additional
> changes required from my side.

6+7 looks like stuff Georgi should pick up, patch 14 looks like something
Bjorn should apply to the Qcom SoC tree.

Yours,
Linus Walleij

