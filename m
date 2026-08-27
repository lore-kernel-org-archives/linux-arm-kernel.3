Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BB3C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 07:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yGEffIVb2AqJDTiWtumihhK8BhOW3hi4oRosz9adas=; b=flt63L+ajWWvA93i8d/IDfEwe7
	rVImeLk0WPer0UnzI2bllzlwVndG+dKUWcFF4Vm0j2poHpN/36ijPn+JYLDYC+NpH8COuLS4ISGzI
	/1cKtOLyR1hIavVmzATobnxeuqPNr0/0ddwJRILX/sifd9DuivGpE9jy8Ndo/XnCzJyqE1i5DxA7s
	LsQIdDSm/U+a48MmI2yj2vYJoejNS5O3V5DzyzxZZaF1zE+hpgEtYfzxpuBH/3t9n2P0hrXIqsVKN
	WJyQq1iqxwxvcRZZAX0sRK+cOSpKnDdCGzzNAloX1bvLGeZb55unGTJcqoZhc8nsKsvoVawAYJwVc
	P8wDE5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUt0-00000003aA5-3y4u;
	Thu, 27 Aug 2026 07:50:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzUt0-00000003a9x-02Po
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 07:50:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BDEC4401F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 07:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381CD1F000E9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 07:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787817057;
	bh=/yGEffIVb2AqJDTiWtumihhK8BhOW3hi4oRosz9adas=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=d9ydyh6Z1Oo0JNZR6mfaIDqz/kOMSVllcGNpB6gKew1vcgYf8e5ECRsHviAI9DSzn
	 TuwFocCEJsRuSVIE5wGjIe8YRuYlX8GqQ8R4XwYzZATEzG8DJlj9pD3KFAIAvt+loU
	 praeYlVJ4bgkVKrYArYdv3yG+pkaAKL8zbqxh8fsgNvULo91AdpyipG2tW7H2+Atnn
	 Ub4w4ylfpKzndHWsVshhnZo3JyfmPhUMu12gsBr/1eFU1uKe5oMWJYeBXmRDkEsR5K
	 AKTl4bXaIVUdxul48cDrn/ALtRWakpmuNI2aJuRIFX1Aupjyy1XeMr7Rk3Wh+usk4W
	 9j2h0K7k68qLw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so2056629e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 00:50:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr+sVDoBpnjSLv4dOu4hc4mqdrr1d8RCwzIEGKDeNRD4HB+kRyo9dxrGJx7Jv0ewKqwTqe0V0R+yfROihLuMprc@lists.infradead.org
X-Gm-Message-State: AFuF++lvRerp5voH1hVac0XuIBAl4ZISUt3C/1TvVKvn/XIBNwP3N++8
	6k/t2/A4WJ97YfeWmhLB0ON2EdSQ4CHcAEOOtperBqkvI5qK60/894u/nw3pAhhwaoKca7W5Sxb
	sf+zxUhoYudxwcgV7xuttoou9kknuGmilmSJo71rzWQ==
X-Received: by 2002:ac2:42d1:0:b0:5b4:73f6:1d9f with SMTP id
 2adb3069b0e04-5b4a90bb4a8mr3488516e87.22.1787817055812; Thu, 27 Aug 2026
 00:50:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 00:50:52 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Aug 2026 00:50:52 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260821-kuno-soc-support-v3-14-196e2b306368@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com> <20260821-kuno-soc-support-v3-14-196e2b306368@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 00:50:52 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfumxz2iEZ=vYiGvCoe5+sU2Fdt+2N_77ZgQvJuLADejw@mail.gmail.com>
X-Gm-Features: AcwNN1UU6-WnRzQUnew7Tb3gj-2qznjwfQi-BvrVCswjSCg6fe3o3ZW4Upxhu10
Message-ID: <CAMRc=Mfumxz2iEZ=vYiGvCoe5+sU2Fdt+2N_77ZgQvJuLADejw@mail.gmail.com>
Subject: Re: [PATCH v3 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Georgi Djakov <djakov@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 21 Aug 2026 18:09:07 +0200, Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> said:
> Document the Qualcomm Kuno IDP board and register the "kuno"
> codename in the SoC naming convention schema.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

