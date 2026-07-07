Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E48C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 10:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mv6MwfHraXLOpOPByrf7lVV2PXLTdbCYScwhyOPZLII=; b=Iu4tPMnd24mgJFgbVkmXyU+na3
	0E+KtmZYbOTHbHIuA9CXfGMcH7rxaQxVXI5A6hDITYny4nKS1nirsrlFCf2JGYtQJxmHoy7iSn7HV
	7LeWL0EOwYF2nvC+JQtfthg3qG0kg3SXlXLTICRI4sDi5zImYBFoKTd+Sc8D8JiXqj9vPrzZLRKWz
	9SFis3AiEerVI8f+jHRvwtck0VezYwbJ25Efh9b1VQ74ES9wITHsDQ01x997puesb7DPr+jahcHhr
	ibQEzlpFbiMZEZhiej1OJaMZxZ5t4eXGgy2WqVJo3xny0+4BrPfWd5tsIzS63we+C4PzJPvNJ2Fj3
	LDHPENBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2nN-0000000Ei2G-0ZCa;
	Tue, 07 Jul 2026 10:12:53 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2nK-0000000Ei1D-2Fqd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 10:12:52 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so2118810a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 03:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783419169; cv=none;
        d=google.com; s=arc-20260327;
        b=nzWgvQPthT81Sxs83OstT5XFZauZl3FN+rihb2nBCg3TNrCifDtHG2yBceSpnKsI/o
         8mxGv14e68BM1JMwJ6uvxyOL1bZRb1OoH2A9wImI47C4YCv9ZbwEVe8lJzjew/bv9SKD
         9fmREoNAtIOdOIOF0BCSl2rRaZ7/w92Mkg6KUAywXMU0+JHxONfgDfn0SA9qR/W08+ix
         BhqzXVD9EeAlcntP3doxYTOEG0IYeLSYiZzpDQAzp0U8EdWfOP5foIicCW0Jpb5zDvMJ
         gm2j1e5z/0UgSJ6ZccmugThe4kaliQu+rcCC0FGYBiL/n5nBiMWwo1MffP2DF1qaNrkd
         MkFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mv6MwfHraXLOpOPByrf7lVV2PXLTdbCYScwhyOPZLII=;
        fh=1T32monFHXaVHTi2FUAsC8mz8PUXYdXzDkxF+PO2wp4=;
        b=b2irQhs+788C0+//3Grt0RHZ6LrnYtFd0eNiIiv1QKastmjunbyfI/R7wf5WIZRuqn
         PDJKrXzKQRWPG1oskJB9wP8uhcJNBhkI6ttv7eISEcsSjAPc4h5wGBeWGz1VVB7BYyU7
         vwTys+y46Ry+qIRCKSrk0CfJNGfh1ylxzJzC8qu7Q5kLoLkdwOG9qCaW73RV+fDcZyR5
         6YUsx/AygVavxmWleZ7Pavy3cTKe/XHHa36zOiRI1AlECJ+Mzb4pdL/9NO3/4hWNWgxn
         i8cuKiasY6IjZnqqFtkv/nxCvqt2NmYFfW/I5ngk18CZqsGbFJ4YV8ZFLbs3sotJXcdL
         Mr8A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783419169; x=1784023969; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mv6MwfHraXLOpOPByrf7lVV2PXLTdbCYScwhyOPZLII=;
        b=UXQM+RVvJIhmagGdrz/dquv3zQwnLkNevcWv2eouYlPC8NZXXHk83pnPvhNaDSb9ZP
         Gh+32JZuc1m0wJf6JmHUjszSPKVZyT+B6xW0W848O0k8rGRCm6foCmr4spdjXvM4tC0G
         i+LHfcsIT2j4fv+Pi97wMcKf9uEXmb7KAAA+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419169; x=1784023969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mv6MwfHraXLOpOPByrf7lVV2PXLTdbCYScwhyOPZLII=;
        b=fk109aYBFL/23yVce54/u3UaTGfcPBElgwlE2o5o8kYtTjmoF8pprqNJKi6MWNQZ6L
         qWI6gKTcziz5rFiKNxCjYWdG7tFR6Nz/aE9JiM4QVEYXmlrbv3kqzkQ4wYL60acdQh4T
         HALhKZTa/SdCMO8yhDTx5R/YGRcUamk5vynr5bfuyIQNeFBiMXfnG2oQUz0LmQyI4e4F
         yNj/64hJBFKeKow/lUWm7B9onHGj3DWSnKn5PhxBlcJSTgN6wetXXc4QvvKeKK2r/GQF
         qU4RsS13T7EGkLmaaRQIywXM1b/vH9HNxlzOJ/vBF4rilLAk47v79ad/nhuChIrBwI4O
         L10Q==
X-Forwarded-Encrypted: i=1; AHgh+RrUb+yUcA43oWx8RIFYBR6sk0UzbwHG3T1SncNlcNf67UDNU8o+azkiqTyFW4xaPEv6Ba+SxvovF3PG0ovnml45@lists.infradead.org
X-Gm-Message-State: AOJu0YxEgX1cRZwy/ynx8rEDQ/Kam5y0ScZ9VxRYS6FUDJuMOFMFhhFg
	/bg15WdtfUEytVxfkfPOZScpmKKbUOI2RA/Y9keGO+YnoBhknAKY/JRacvnClP9yJSRypiGWU5N
	yNXk7BSyxJu1tVBMZnyK3CjUJU0yEPk5JSm0fnrGqsg==
X-Gm-Gg: AfdE7cnH6cSe0YI+xt41SyoTzeBaozp8gAATSPvBxyk02UeEl5snQDvmKozYyDDugEH
	JMnOuhD6O7Ux2tv6Kw6jsf7Bjj1yU/AMuyKQAosJ4bsvbIbXIFwzYBvmDmfnghlKr0ScNroAtgy
	kVFvoXJF1JFmB6pf3qdYEXYwEGj0ADkwd5m9R8cXhwxNftqowIlxsYQ0E6q/RczmTCCRWBl1mmh
	AeblkeZfoLXvJZ0uvHktHZZ/5/6BoXapJxWRl0rsLLbTqBo9chxj9qjP3jFC7u0kb0y3wwj+gQN
	ejPCEK0vGLey0GlvDf6Krdg4WdR6Y4A=
X-Received: by 2002:a05:6a21:3a45:b0:3b4:6026:6c5d with SMTP id
 adf61e73a8af0-3c08ec75571mr5952541637.5.1783419168806; Tue, 07 Jul 2026
 03:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260706180404.648545-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706180404.648545-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Daniel Palmer <daniel@thingy.jp>
Date: Tue, 7 Jul 2026 19:12:34 +0900
X-Gm-Features: AVVi8Cf_5970hyt1ZG5xAv0cNZTBqqHYxE2V7YDsUBypVXjTuHCC-S79emDaMzY
Message-ID: <CAFr9PXnosZdL+DA2K9_jOj2QvrgmTL++44UorwZ--BuKOFNsGQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: sigmastar: Correct indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Romain Perier <romain.perier@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_031250_798021_34D2A986 
X-CRM114-Status: GOOD (  18.33  )
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

Hi,

On Tue, 7 Jul 2026 at 03:04, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Correct indentation to one tab.  No functional impact (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../boot/dts/sigmastar/mstar-infinity2m.dtsi  | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi b/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi
> index 1b485efd7156..437329fb912a 100644
> --- a/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi
> +++ b/arch/arm/boot/dts/sigmastar/mstar-infinity2m.dtsi
> @@ -7,17 +7,17 @@
>  #include "mstar-infinity.dtsi"
>
>  &cpu0_opp_table {
> -               opp-1000000000 {
> -                       opp-hz = /bits/ 64 <1000000000>;
> -                       opp-microvolt = <1000000>;
> -                       clock-latency-ns = <300000>;
> -               };
> +       opp-1000000000 {
> +               opp-hz = /bits/ 64 <1000000000>;
> +               opp-microvolt = <1000000>;
> +               clock-latency-ns = <300000>;
> +       };
>
> -               opp-1200000000 {
> -                       opp-hz = /bits/ 64 <1200000000>;
> -                       opp-microvolt = <1000000>;
> -                       clock-latency-ns = <300000>;
> -               };
> +       opp-1200000000 {
> +               opp-hz = /bits/ 64 <1200000000>;
> +               opp-microvolt = <1000000>;
> +               clock-latency-ns = <300000>;
> +       };
>  };
>
>  &cpus {
> --
> 2.53.0
>

Thanks for this. Looks fine so:

Acked-by: Daniel Palmer <daniel@thingy.jp>

I intend to fix up and resend the patches to fix the other outstanding
warnings in this stuff but I need to find time to get around to it.
If this patch could be added to arm-soc or similar without me sending
a pull request for one patch that'd be great.

Thanks,

Daniel

