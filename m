Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B06C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 00:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=; b=MmrUv4f+OrFCEhYnOPX2f32hD8
	Qdn9v8bmTRVMPnYFybHwV3nipxqol/F2w0+u2yHgXEJTwOPUlSJIz0XQ4UWjAiIFibtaO9xKXeQpJ
	7CstMMkvseqZbXm2e4VQVC42MbKf+7lOqNyEKlHikSlI5o5udYVJ96+aNp0AP/u6bqNsdELInD0Yr
	jFD2ap9syOI/GOkcddm+Ze1Gk9VfNh6hC/YHrsmRGF5Ck4poUZcXiYkxKSnN+j02e11F5aI+H8Wld
	M/owg107uaNFPVOV915iWN2oOnCYBnt7PqOwNHDYyfHReYC7fzx9Rt3/b/GDnQs98xO55euj8Z9Pw
	bf+sxszA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4pLz-0000000FdXj-2Vm7;
	Fri, 11 Sep 2026 00:42:55 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4pLw-0000000FdX6-29g3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 00:42:53 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-878ed0f17bfso2809247b3.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 17:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789087371; cv=none;
        d=google.com; s=arc-20260327;
        b=iq6XuKJ1kvh05OuwxgQ7M9xGElvXBVjaQ+ejpBk+a60poM3Zr3oFJyYeOUufAzzXIY
         YSBtdEMvQaYi2BKdOXeOejoe6BuUc4rpZl6c2gcoM326hh5f++3nwB9cbIHvuZ23rf4q
         Wl3ToOq8Dw5QJ5MjHVc8X9Exj28JNy3SsKeB02YUsPJ5T0/cXmxEDhO+cV5M16pzApHJ
         57BbVwx0KdfeJGg54hH+dNcT4ozEck/2j1QM4QdOxppTQ2JoHP1T4e/DR/kknS4z6X8j
         OOjcXkxCPvg2Zq9vFe5W/7rZ0r9mIvSWKjAqvC1lNZ82MaQ86orxZiUiQiOGoP9kisTH
         AeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=;
        fh=qKkCBxy7S0dAwj+p5wpNcNYZGn73uhmZoRxQw3j9F5M=;
        b=Q9Ka8yU+/LxCA+KWh9qJ+9Yn94vECcGJamunnJZLM1w/2cvSHJLqUzQoUCxCfZeQ0A
         dyNFDo8MfrcjZzQwE1hDRkoX03hOa9Hmm/SI5dIEEY3R1yHle+w5CkbdWawMwOI+jRuR
         Nl6ouFA/v/ka28u+2weElq5ctjiw0By+yRSq9fWXvGIDeBd9db8jFjQbFZCyWxy1aKXo
         u64lECSgV1WWZECgqIiCKGQBj+t17UuoFUfrRGMRGreei8WEW4Q0i05HX3DIZrGZm+qb
         f1x1Gc6uxYfdAiIGAH0XKtS5p9H3Cg2Pk6O+q4p8ctp5kk+oIFiqzE++rLVNkqQUSolx
         8q/w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789087371; x=1789692171; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=;
        b=LhY9Q3k3lkXdMfNDd24Knz+bi1Y6co/g0Sh+EYlopf97sAfcy8cWD///qrKj7Fk+ov
         StB9NI3caKKqLocXlugmM6cLXw6565OaEWovngopbl3G7V0yMQU4woK3sQXASkrBd0L3
         GmJBpwCIv1qckEOIiJlAQWpH3NpefluaKg3xTfwKrygpQ65dO+miT1nMWGkyi2Z8M7vo
         /EXDMNaYyJVewvMiFNazT2DsGP23dnRl5wTXmh64TRGKBXT4tnJpab4ZV0P1mdGJZpxm
         eproU/v69DE/BZdmeKiOaYyaPD76jbzR63f85ivc+iGACSXkfkM8odgxynNVjVhU6WZH
         hjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789087371; x=1789692171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3WVT2KPS4E/U4EB6j60mzQ6ExLGgX3JVRLYkcMa7dk=;
        b=gEGbuyRbaUs3o+EV+h8XNZ7eO8+3Bls8PGkegNPmaNvS9SzkeGGe+xqUXgfU548hg6
         ScEOY+vJIgNi8kKYpJkeEfmeYxVyMW88HgNvJ7DwJo2XFME805lY4voCMwLl2GnziecG
         M7gYLo27bIvuWe4yWjKQgkM+RDcLBKxcl7KlaVahKK6SNcreZZaI/GBBOdjm1ew63Y2N
         Pbwfm7/ogvoSS6COxxswwX0nBmQRcEoEkdWTU49TmoZydEnX5bfzp3TX/o3sAa0VUEs9
         dbUZPvQqVcKdZycUrU6lMjSFznEvVEj11F6psCk399iN2c9iz4V9Z8dxTCGlnNBqhLzt
         1ZBg==
X-Forwarded-Encrypted: i=1; AKwUvByEfs1row3MdzmzFGT4MhSBSSsJORW/PyFFFzlNztfSxscxCJct4N+v3IjTznTdOvYD0W9O9ujFnyPWZ77oWwlp@lists.infradead.org
X-Gm-Message-State: AFuF++lrTuhicFe0Wo2W0tlkb5LhZSECFbq9/CN1phPFnHor9Rg6/YqG
	fH7QZxoysfRlLG6h+FIQFoX2/U9mSx1Y2GjQ21o7vkriF/Q/bpeXJBSPQn/uvtlftekoNxGT8vD
	5MZI1UQC7zoEuX2u8KvIcltn+hYA0XHSxq4ZUk3nv/w==
X-Gm-Gg: AYBFou3V2GyhigCdW3VtpGiQdsHwzhcsZ1Var1cDVXM7XyYa7VuisO52ejO52mTLafS
	bcZ56S5uA1/WvOZQ0PvLkd2qioT94A3MVcccF9R0sINsZRMeAXy1KgF9158+dRS2gFwOWCuuiow
	BpOuezT6/oEESZ9o5cxopNPHPuq+eSOqRSAxLjXXY17wmw5VgGG7Kn1MyhZdp1s+aGxJokCNs+N
	t0tU1nrmn7NolEuX1PmWkasNUIcGD5oEImd5Xby4QLMmeGHEcsAfPtTWWL0ePHHuAqrZ/dlpt78
	WXbMkYkZlfaPxzjvdrZ+0800SIZPE+Dh8mMkDSAMO3cXLGjPYrtMNzdWylP8XtMtVO2QrMcE1Xa
	LbSN5v9+lL+ve1A==
X-Received: by 2002:a05:690c:660a:b0:873:5ddf:d862 with SMTP id
 00721157ae682-884b3873114mr9013287b3.45.1789087371068; Thu, 10 Sep 2026
 17:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-exynos850_sram-v3-0-8627a49188ec@linaro.org> <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
In-Reply-To: <20260727-exynos850_sram-v3-1-8627a49188ec@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 10 Sep 2026 19:42:38 -0500
X-Gm-Features: AcwNN1WDjFTgB-aBDySNIcrpUgOjcJa8lLtJJ127JD23ekWYTtDiP3LdRVUZsB0
Message-ID: <CAPLW+4ntx8qLy9jAYYdT+XwxwKHjvisutqEi04oPEQny8auD-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: sram: Document samsung,exynos850-acpm-sram
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_174252_589225_AD53D973 
X-CRM114-Status: GOOD (  20.01  )
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

On Mon, Jul 27, 2026 at 8:23=E2=80=AFAM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> Document "samsung,exynos850-acpm-sram" which represents an SRAM region us=
ed
> for ACPM communication on Samsung-based SoCs.
>
> The SRAM is consumed as a whole, is not split up using child nodes and
> properties related to this are not required.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documenta=
tion/devicetree/bindings/sram/sram.yaml
> index b83fc6831947..b9c4d4f3199b 100644
> --- a/Documentation/devicetree/bindings/sram/sram.yaml
> +++ b/Documentation/devicetree/bindings/sram/sram.yaml
> @@ -43,6 +43,7 @@ properties:
>          - qcom,rpm-msg-ram
>          - qcom,shikra-imem
>          - rockchip,rk3288-pmu-sram
> +        - samsung,exynos850-acpm-sram

Is there a reason we can't just use "mmio-sram" for Exynos850 ACPM
needs? I can see it's used in the gs101 device tree like this. If
there is a reason for this, I think it might be a good idea to
document it in the commit message (probably in both patches). Also,
should "mmio-sram" be added as a backup option (after comma) in your
[PATCH 2/2]?

>
>    reg:
>      maxItems: 1
> @@ -159,6 +160,7 @@ if:
>            enum:
>              - qcom,rpm-msg-ram
>              - rockchip,rk3288-pmu-sram
> +            - samsung,exynos850-acpm-sram
>  then:
>    required:
>      - "#address-cells"
>
> --
> 2.51.0
>

