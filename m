Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530DAC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=; b=EaDqn7tWuBy6WEd0IexGiNnYnl
	+kZVZrcPv/WirT7NvDzPnUwzo9sjWkz8ctCTFA5RoZ/K/s5xkeHQcMl55JB05LzOaR6PaYMLFAskn
	JiK6EYWmMN658gwfqcTQkVfpYGzJFsLspAP/E09MI5E1IPIXMouDWXzZxodrcup98dHQVnZmHxNfw
	P/NVi9RxDYmkHb/2z9rZKA88yqn0o616w9mxH26r6+TDqpHTMDu0+yT+mEhXRH5xV7LNl/SEPQiwW
	ElfUq8KOpx8YafHiGqiZyUu9Rz4vRAYC81/hLHuAcZhlsd7JPBZa/t+CgnzNdsNhigxGN1m4Iligl
	zpgGDVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UQU-0000000704c-1XIy;
	Tue, 15 Sep 2026 14:46:26 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UQP-0000000702e-0w9M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:46:25 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a98dfb8002so4519044a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 07:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789483579; cv=none;
        d=google.com; s=arc-20260327;
        b=mAF7jdHimtjRAR5dzm/0sj1EkQTDfLHOUtWTvn6YiriQTLTpuYbNtHNNhcb6VMyIlM
         AD5kWUVC7VJf3nCVl1lB8avhx7n7BSQnYi6fiz92KO/f17fG48WIRUu+qvzbty05GOHv
         FirwdtvMK3Jh/R+lq3xeFcX3Qe5H98Y7/aIIjsXT1LAm3DQIflXUx9QA8su1QdGY2YvW
         +Cywncpykp9h5nZbOu4/SA0WbdKPLFEMX1CPt3J7PUPRVdygsRUPSTO18F50XNT/Vktn
         mcuoCeJpeXGOX6N6+ahHvG1NpGHTSSwa1Y71OA5QAZHlm/0QF0fFlI7S5FHr0gxs49AP
         4Z6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=;
        fh=iT/58kbs+i07KwHDHGXG0kIZQzt5JPyK/IO14CDBz+c=;
        b=nPXcHZdlbJPcXdq0kYlxSpGDFALcOyGzhkCt1/sCHRgEdLTOt7kl/DIo4x8P+Phgr2
         Xq9Xd8qMxdNix6dUk8w9kSRBl7xMpufXawi9MOV8nMghc6YbgJGFBbwmCJ9tQWl0Yq1D
         K7JcAQtr7HS3VFkMfQtKurKWQfqhcnzkFgQhn6+gz8+Vvucf+NZiikPTbG1Zhxe4exNa
         v8eYH1sNkqP9X3y9+D90TDeere8OoEoIV7sgYH0hc+kHhFYZ2Y23aYA/CMSGBk+u90BZ
         PJRy6q0zdIR/H1nZ1AXxVJA9ng/ddNk6OC5OlJ5USP3bCs0R1+Jgdd/4gyXUj9j3GvAh
         MUXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789483579; x=1790088379; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=;
        b=wYhoQS4iS/YPyX6xNUv43c33VmZF5GD9mW9kBfHVJHhx5pi+wc6E3qJsBoyjGgTIb+
         JtrLVS3PWyxeYz5KLYdOXovWS3KktELQF78DEDVxwHSkgolkaHX/QcH/vGjX5j39hIf1
         5TUXvDhGxa9x8MmZ+qvA+UPqL0xdhEvI/kDvlscl0/Avus7A50ojwOjRPFxJCLChdS2a
         YPGsqMhxt+ZWOyDOqhAhWehiCYw6MGyd25Etco1zl/di19ORKBElK85xoAdMWJ3XDCtw
         iWiWJZS2o17Yr3rbPbFSCtluxyTAk0rzmuUU8gybZy7wIKhIXddoEoeSBf3o1OCMEK7d
         YYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483579; x=1790088379;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UKh8ftla6T0xr8WeFwrWgAx7L88zh6iqtsw9KBnhX0M=;
        b=b9or9sv0xraq1KeKq5k/ObMWbJuiwiLUTESpwum8+OGiNpSAChf9p+UQVrzFZMLhAH
         yOFMcZkxm1stvrixcXxyCX0uUA9/c8opBA3fIy+dQ0FH+NlG6zWCOMR0DSbHQuixEWBs
         CPklukw88BirC1svKXbp6zY4qVLX54Jpzg3i0dmec4AK22edbGqVBRhxFHMmR4+8NjYW
         vDsDNWbRZN/TPRR4TpUmSrSnOBy9zj1QsDKoD3smAsV4gw94cGy9pn2g0nFKFjmvyDeC
         XoBANbuMaLfscQN9HyREqIspPc3RUL+PolK1sLlt6PBhD8GFqZPsVdJpn60vdq2iwmqV
         iRng==
X-Forwarded-Encrypted: i=1; AKwUvBxeoG1ChGunJgCDjCGX3kFlm0pw21CjEBFP39nyjUV6B0YyLUrs36WZO0S5oniCrMHSNlfU+EHe5rAHGfICZaie@lists.infradead.org
X-Gm-Message-State: AFuF++lxdVvWgxN+h4YvIbQHX/iKXZs/zNK5sOM1GOoCF7WxkSdBeilF
	O/zSJHer0RuRDJou7mni+9xPg+PbBRfkUz33VOtlRvTIwTqIfWc3bMAd5gBTZv81FzZG8OcBCFh
	8g77jQ9GxQJbY4ql5zCsulwx6SqkhA3UD5m0UTKUDyQ==
X-Gm-Gg: AYBFou0HQLGWdQUgrdjmpx1aEun8w179G5XFgj6a7mH2SFq1q6IF7kFL6pUMSMSKG0q
	ninXoMQIAYI8Ggt/CRL3cd8YuJFCdtIFkgrHvTFmmEbgLAZD/xnifuSVhER2TIXJyII99gCVSmd
	NRyGaQtk2SeIyVAiGPuDHl9y0jjcTws254/J54muOlTRh+zgZMF82Vuf12T5SduwGSkkJHYXM6i
	zNz0pHjpNrnhCOWQMIjCID16VtETNggrlU9UpeUKuuYr9hSfivVYtgj96GhB1drRTfOxmMZzP1+
	uTUKVWJiXtl7WeMxZQFsnWSySMdi8yKALG7mBGFZ94sbCj4NHCcEHkARc3l7d0xCDPZ7IZYvR+t
	Gh7H/kkfXf8aDEw==
X-Received: by 2002:a05:6402:541a:b0:6a9:acbb:437a with SMTP id
 4fb4d7f45d1cf-6a9f6264d4amr4709617a12.19.1789483579261; Tue, 15 Sep 2026
 07:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
In-Reply-To: <20260911-b4-dts-samsung-cleanup-strict-continued-v1-0-9aa55051c42b@oss.qualcomm.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 15 Sep 2026 15:46:08 +0100
X-Gm-Features: AcwNN1Wim9K-brFBMXY9henHTcNARzZEbkYderuFVS29rKbsh07RWtUUnTNerSs
Message-ID: <CADrjBPpMdKVmPq2Dzbdt_kPHxX1m6nDczefHNRY6ZCPx3DyCTw@mail.gmail.com>
Subject: Re: [PATCH 00/10] arm64: dts: exynos: Few strict dt-style-check cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_074623_846136_9ABD972D 
X-CRM114-Status: GOOD (  12.92  )
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

On Fri, 11 Sept 2026 at 11:19, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Not yet complete, more files will follow. I probably won't re-order all
> Exynos5433 soc nodes by unit address because it is way too disruptive.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (10):
>       arm64: dts: exynos: axis: Re-order nodes to match coding style
>       arm64: dts: exynos: axis: Re-order properties to match coding style
>       arm64: dts: exynos: gs101: Re-order properties to match coding style
>       arm64: dts: exynos: gs101: Re-order nodes to match coding style
>       [RFT] arm64: dts: exynos2200-g0s: Drop chosen address/size cells
>       arm64: dts: exynos2200-g0s: Re-order properties to match coding style
>       arm64: dts: exynos2200: Drop redundant blank lines
>       arm64: dts: exynos5433: Re-order nodes to match coding style
>       arm64: dts: exynos5433: Re-order properties to match coding style
>       arm64: dts: exynos7870: Re-order properties to match coding style
>
>  arch/arm64/boot/dts/exynos/axis/artpec8.dtsi       |  36 ++--
>  arch/arm64/boot/dts/exynos/axis/artpec9.dtsi       |  36 ++--
>  arch/arm64/boot/dts/exynos/exynos2200-g0s.dts      |   8 +-
>  arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi |   2 -
>  arch/arm64/boot/dts/exynos/exynos2200.dtsi         |   1 -
>  .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  93 +++++----
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 232 ++++++++++-----------
>  .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  39 ++--
>  arch/arm64/boot/dts/exynos/exynos7870-j5y17lte.dts |  34 +--
>  arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  34 +--
>  arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  |  35 ++--
>  arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  39 ++--
>  arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 108 +++++-----
>  .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  40 ++--
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  96 ++++-----
>  15 files changed, 421 insertions(+), 412 deletions(-)
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

