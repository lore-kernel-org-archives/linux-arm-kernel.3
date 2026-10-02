Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A988CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=; b=YSA2hI98Y0qXaPpQH59dr+vhZ3
	twJRasJRETwD8b7vuijWB6Y32qLDZeZZyaZJ7YtOfx6O0rgXRQ4xFj9fYy9pLbDAdUQfNf1ZzIQj0
	PQ4663Ga7CLz14gAJPBQZtP3HBp+k51lc0Ku6WAw5au77rN9ULUxFejiKGRGnttMnQuJ9za/5bVZX
	fKNTvCtYeDI7ZYZtDfnudomp0BvT0nOON6mYBhUKmzKeRPOB/mLa6StAWAstJJHwcxzJKjKbCYQRM
	ZCc+hJiUzU68WoBdIWY6d4uh63Bn3Qf66D/cfpoxfzd74WhwFMnJkK/0hbPRXw/6WxIeDfhu2LhtW
	YPfPzwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeUE-0000000Bo3A-0xRo;
	Fri, 02 Oct 2026 14:43:46 +0000
Received: from mail-vs2-x2a.google.com ([2a00:1450:4864:3a::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeUB-0000000Bo2Q-2BEn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:43:44 +0000
Received: by mail-vs2-x2a.google.com with SMTP id ada2fe7eead31-7b314b72db8so2397901137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 07:43:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790952222; cv=none;
        d=google.com; s=arc-20260327;
        b=W2zfSLPptB7/kRLKdGKkdd7Lziwuq+6chUlkSUF3RRSn/9WKgEajzEw+dAqmekB1jc
         4DrFt11jLiPchRqXh4X6li9IoZF3mAiqSM+sZGvKWo2K5QgxNHBcJ+2iHqHHT/gWFXF8
         WHh7kSBOA/Yr2BHRX5aFoxGmUNN6DGKbYBY+q0BE+sAu2S5HROiYKRCmLok44mUFBwok
         pBgrRXBUvtlehwpARmU/CMAdg7NWrshhqIuFbQ5szI10JcpzeWXJzeekgvFh9adFnECI
         QfOA787QpiSNU3lZG3RuKLw9oLsj9+Qpby5VLJoXM8NQI5+xfiemtGwGbl+RHkyQi1Ta
         7V1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        fh=f6JITNC97IOR75qL2td3R4az4kVGK2447QirsU/YoJs=;
        b=OkMa16gfYisGpm82ozBWBoIvl1D/yxFv/7LmaBzkL+KyxXX85yDRLGbVIkACso2/0X
         iyvzSzkHW4t7icTZFYl0DrBv7GZbwJ+mwIHQOfdAk4JuUKu3z9Cf4/HOHx1x23EpIg2z
         IEvLZ1eyg/UWP831W4LX9sm0G8I6Q1qrJ5NChGr2IUR7EmjB5za1qlzFyjsp0sKqeWy6
         4tCP3MczXG2grGAkWOv6hTSm9BrUrsk/kVgFiwja3AtoRn4ucU9keyavBSg+wvEVWe0a
         qvfmkKvf/P0rwgAmgzBwcqI133tcekEDjeZHS5XzOVbHnXQl2Qr8lYWynAnh/6UpWzTv
         cMPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790952222; x=1791557022; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        b=i/d8MsQD5V0+uq49kOVSViwYCG4kHwDASz6vg1ob1q0Rt5Xq/MAVkDISBqYNopS3L5
         euKMxIZXDIgJ3eGtHubD/Gm8NTYsSNzEUpxd68CjLNBRdxyobnRT1jm3O/+79gqJ8HYU
         B088Vlh9zOz2tj884VLRgXlcNYgByIsKqyf6nZb9fdydEkuQLcB4TcR1+x7kUxTUKQYF
         unmi7QXAtkFaRv7lF4Gj86HVIiKQKDbGKo287PdsjsuNm3ILRMUY43pf+eM4TknmRurw
         IDtioi8+Zzp8wgXzFxd9Ip2SSH9zoGaLC+mhfKwWo6sWcCEv45lZ9A0Z3ICkzBq/ecns
         xefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952222; x=1791557022;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Abb/w7OCqOgoDbYsM1LhnQzjs8VHQVCJFeoLP4m09ag=;
        b=c7jppxnJ5kM7Wl/NGq49YNxzAw/WUry4ad49j+xRMUoSWfxKQpj+yvMHCdBMFFMeZU
         AW5ApxH03m+xUO3XmtIUFlaR7OSg0yD+e8aXgaxslkk0VRjbBXVCQUMRPzQtKUHmnYVd
         sxajJH68Zh9Gkw9P5GjKN68BUazto+qc8zi4CtqIWbPp5bw02Tp4/RWF5xfWRYDCnGKO
         4clCGvdjM8vOOe2cqvhG9KAORHB2oS9/Z3Yg+G3loF7sM732CrhMKNil1bR6h8vKkifp
         J10/heYsYTnNGeT7hZhgh5w+zrM+3i57vPr1n4Px3WZH0GWLLj1t289HWeZbNElG1CHX
         uvOw==
X-Forwarded-Encrypted: i=1; AKwUvBz5iDF/FsNxz1YPRro41ioyyaDZE01d4Qy8EcGLEVl8zoNMWeylLhYHOHOAPIki+8Qpj1+tAdbRWPwfpgEO2bMC@lists.infradead.org
X-Gm-Message-State: AFq9FYJKg1AqdYrtLHZnzOQGoDU6HAu3pi8Rys8kN/9WxY/CIUSZ9xn0
	x5aO0q9EUZywqnNdVRh059Tte81C4VzD7Fxvz6xbEUl2FXxab6QX1Na6gL9Z57q4o4tMlsfTpa9
	NwwXBU9gWxQFgeXcDVtOw5ccojkVFI5ySmT2wYeTeyA==
X-Gm-Gg: AYBFou0x9zTVSBa00Mh0TxZfuwngOOApw5EXtiBPMaWe9iMAiM1YsVzOY6jSbxQtsyY
	TWN9zHHortVLYQVjjDmIWqxl+NK2ymSbzR/TglnxDG0tfSj6zxNC2x+Lg2rG6OqPVvv6lr2NoSX
	wraLXRoMK6eiDb57CiyRiNK6rBAOMZmejEA5uvBxpj4GJQAcH44B9khogrZFyxMhRa63Jpa4zD2
	93kwzMD/iB/uJ/3Iw3U7D2SeBh7QV6KOZsxg4lfKb6jRwqtOZnzARp+Kt3GB5JWTrz/zs4+wWcq
	y9l1XhLTrmagdxzdBdzgwWT7LQGktE4ic2sXj1y6sB1KQJwxjWf+k4OY6QFUd0ccHFnS9lAPyM0
	3Ew0nRWdGw/iHg+RluJHEgFgZ
X-Received: by 2002:a05:6102:f9b:b0:7a1:f980:e936 with SMTP id
 ada2fe7eead31-7c0f51a9b92mr610476137.18.1790952222091; Fri, 02 Oct 2026
 07:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-2-473a69fc8a3d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:43:29 +0100
X-Gm-Features: AclHuK-HUUsrOdFljkk42xven02N-tiuZrJ__yBG6xUzcagLPJ7c3UWcflomjnQ
Message-ID: <CADrjBPqi3RWdUy-S2Vn2-E6h0OGhrFPWEcKcarswivOdPzFTKQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] firmware: samsung: acpm: add Exynos850 support
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_074343_575679_91514791 
X-CRM114-Status: GOOD (  19.05  )
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

On Tue, 29 Sept 2026 at 03:11, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The Exynos850 SoC contains an APM co-processor. Communication
> with this hardware block is established using the ACPM protocol,
> which handles IPC messages for clocks, power, thermal management,
> and PMIC control.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string along with
> its associated match data. This includes the specific initialisation
> data base offset (which differs from the GS101 offset) and the
> "exynos850-acpm-clk" device name required to properly instantiate
> the clock provider.
>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/firmware/samsung/exynos-acpm.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 942a2e9f02f5..5a16665e941b 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -39,6 +39,7 @@
>  #define ACPM_POLL_TIMEOUT_US           (100 * USEC_PER_MSEC)
>  #define ACPM_TX_TIMEOUT_US             500000
>
> +#define ACPM_EXYNOS850_INITDATA_BASE   0x7000
>  #define ACPM_GS101_INITDATA_BASE       0xa000
>
>  /**
> @@ -876,6 +877,11 @@ struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
>
> +static const struct acpm_match_data acpm_exynos850 = {
> +       .initdata_base = ACPM_EXYNOS850_INITDATA_BASE,
> +       .acpm_clk_dev_name = "exynos850-acpm-clk",
> +};
> +
>  static const struct acpm_match_data acpm_gs101 = {
>         .initdata_base = ACPM_GS101_INITDATA_BASE,
>         .acpm_clk_dev_name = "gs101-acpm-clk",
> @@ -886,6 +892,10 @@ static const struct of_device_id acpm_match[] = {
>                 .compatible = "google,gs101-acpm-ipc",
>                 .data = &acpm_gs101,
>         },
> +       {
> +               .compatible = "samsung,exynos850-acpm-ipc",
> +               .data = &acpm_exynos850,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, acpm_match);
>
> --
> 2.51.0
>

