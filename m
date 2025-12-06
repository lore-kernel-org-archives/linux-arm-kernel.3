Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E0BD3ABF6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 07:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6O9y5Z+AdkoL+Tm0wkCr7cebT9+l7JoZ+wcqNIg4NU=; b=gaOMeIRIdpOEVR6s5zr8xhjiCb
	tf2fsy55uDVraMUkYp7aca1gVZNx7hQdVJ9BiDlb8U9BOTCjhP4f10gulaiXW+tV2hko8YuwlNIk5
	jhdEobLcuJNgP46d5E11hkzUzzbGLFvdtZNItTFEXYEXSVu7s78x/gQZwHGa+gIgjveaw0WiaYrF2
	wa9QY9rsLIS775kXmjsXHXzlAFkNKVv4IKoCvr/a5iLE5jyjM1XSNJQ3aoeBJ1c1dyQ8d+U9LURPE
	V6yLO/xsdt9PRNjvf+t8Kl4cLs4GyOENb/CzEhqshKaRHumX+wHx0+VarYVnz6mWeVHxddoLb2XYm
	DOzJLLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRmTt-0000000Ahwr-13LN;
	Sat, 06 Dec 2025 07:13:25 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRmTq-0000000AhwB-0yOh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 07:13:23 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso5775465a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 23:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765005200; x=1765610000; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F6O9y5Z+AdkoL+Tm0wkCr7cebT9+l7JoZ+wcqNIg4NU=;
        b=Iwp5fEu4MGdQDhn3Gofbzmge6A2h6HtcdIv07NPHn7sunri/G/+muzE1sbadSfK9oZ
         umoVC6yiuKKQZtFglKhzv+jJXeYzuC+FFAakrsDtD/qfV4LDsvSiSSlBZKdMbWfVoxfT
         myQBv9sAIK0LVA8zKExDwUeJc7DRH8L5wyYMrt9o30a7PJ8hupPQviKcOgsihcc+sNjk
         ze4jnPtgkUktzU6lkHj2QBqYfguM9Xp8VqZPjZ6UL5qgesmXOhD9WR+IsZE3BlmqdSyM
         fA+TZeRxMCtTN1MpIccoAnU6FNi75tD5QJJn0Jo8abBDwJj/txGnbiPnVenHg+YjTxj5
         E0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765005200; x=1765610000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F6O9y5Z+AdkoL+Tm0wkCr7cebT9+l7JoZ+wcqNIg4NU=;
        b=jZ6ZFjCVNshK1SXL8EhyyZ/bmbhcXVQAPF+rI/CwtRvmYFhTV10VFZ0hzRYGe9EPU4
         ninMbmsUM04JrmryPWCzEqmX1W28o2Z/JIdaGxUAW5HxmYAPFEKLMnsKBtJBt9wR4/z9
         zycNogI2oEc/HOyOks/OJ6skknUfv8vQOVQKZRwavFxtHe6eg+Dm85wuJA7dNVB6ytDA
         dJTqfOyd3u5Mee8ccvA12moQIzyCJRqe8X/CEGhZH+HuLzo5vo+kgulBKGuN3YFyTx2L
         7yGX0OyW3ey8lAaavYthezYyTJKasfB1xL7xAsLIjcfPMsAfGO6yG8ybEznH+Rn/csST
         pVWA==
X-Forwarded-Encrypted: i=1; AJvYcCVDpF9WBT5qcNRIaivNQZ4zhDjFZHyzONCX5+R0x37cHe92OG2g/OCLbRi20kn4zfDLqdhAnAV4GGiRoLBY2VYi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5PvzWIYa15eePdbPPhb+IlPPOI7zE8HHkvFWnvsr6OlD88VXo
	K6JON/arKhzfYkGX51dZWpxqzPZwRaRfHc1DaPxbhkYyf3JE4penUAz8sBLfq9yGrtEkeLvBKmE
	QEdLZ8EKVSB18MBb9AW6f8kis1XHNdjw=
X-Gm-Gg: ASbGncu/Nq2XlcL5pLyC7VAKfoZTwKGsxyQx4WE0nQqaxymDZ5LKeCjxLpHcNBbz2yh
	f7XrNqd2ABlwJasnA5t2EdRGw1lrwxFVbCHqzPp9V7hbugkrpR4wFruPkizR5p2T8IJcEKj3D79
	EwKkgr+JzGVh4aZZM37ncaCgT724VfA7aBqWlDAzzjtzL83s6LpbYvcuOAbMx+rE4pKU/kaZrQo
	cMLfuiXHWDTyEDquTaMq6PQi5Jz2G0aviUuGldvOKKxyzW/omqW/AHzJFb7Hltg9HQrew==
X-Google-Smtp-Source: AGHT+IGwqPkGdPum0faeStLtu2ktwCeeXpdd/Gr8bwvAvPpRB4dJntX84+9feZ0xNyk77ATtUZIZiKkj4xtUXhaRTNE=
X-Received: by 2002:a05:6402:26c8:b0:649:19bf:bba2 with SMTP id
 4fb4d7f45d1cf-64919bfc0d5mr1360036a12.17.1765005199541; Fri, 05 Dec 2025
 23:13:19 -0800 (PST)
MIME-Version: 1.0
References: <20251123-fixkhadas-v1-1-045348f0a4c2@baylibre.com>
In-Reply-To: <20251123-fixkhadas-v1-1-045348f0a4c2@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 6 Dec 2025 12:43:03 +0530
X-Gm-Features: AQt7F2p5UjYlgHBMh4GKU7Y8S9VjvIpYJkR0ez5ZYJAnsWIvHhN0798bvgLMxKg
Message-ID: <CANAwSgSqHR1kYxo8SaHcBfq=eij_YmVAidy8M+h1dFeK2nz1ug@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-g12b: Fix L2 cache reference
 for S922X CPUs
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_231322_311865_D5DB68D1 
X-CRM114-Status: GOOD (  17.90  )
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

Hi Guillaume,

On Sun, 23 Nov 2025 at 22:44, Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> The original addition of cache information for the Amlogic S922X SoC
> used the wrong next-level cache node for CPU cores 100 and 101,
> incorrectly referencing `l2_cache_l`. These cores actually belong to
> the big cluster and should reference `l2_cache_b`. Update the device
> tree accordingly.
>
> Fixes: e7f85e6c155a ("arm64: dts: amlogic: Add cache information to the Amlogic S922X SoC")
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>

Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> index f04efa828256..23358d94844c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b.dtsi
> @@ -87,7 +87,7 @@ cpu100: cpu@100 {
>                         i-cache-line-size = <32>;
>                         i-cache-size = <0x8000>;
>                         i-cache-sets = <32>;
> -                       next-level-cache = <&l2_cache_l>;
> +                       next-level-cache = <&l2_cache_b>;
>                         #cooling-cells = <2>;
>                 };
>
> @@ -103,7 +103,7 @@ cpu101: cpu@101 {
>                         i-cache-line-size = <32>;
>                         i-cache-size = <0x8000>;
>                         i-cache-sets = <32>;
> -                       next-level-cache = <&l2_cache_l>;
> +                       next-level-cache = <&l2_cache_b>;
>                         #cooling-cells = <2>;
>                 };
>
>
> ---
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
> change-id: 20251123-fixkhadas-c84da7d7c47c
>
> Best regards,
> --
> Guillaume La Roque <glaroque@baylibre.com>
>

