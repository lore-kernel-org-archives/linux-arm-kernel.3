Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B51CCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcYie2cAKkOnUbqZ9iZ6V6CL9Gzada5AicC5iMnOBfQ=; b=PTJbuqNKfTUt+7z79Om85YtP/T
	kq9KgaFZhMns2GCiaF1nRavuezaO6wN0twnVBVRHd9cKBCTJzNubifkXeWQu//IJQ2mVACeVa4pgr
	ijtPPKmtJkrXT66hekYDt3/PBQTfuaDPxapvqnt4c1jUJffbp5jWsb28/Q6vijO/5TL9sG8byoh6v
	Z+T/eT73YbFg613AGasbrNFNh2D0oYSuZaNZX/4YLsT/5rVOSCSZjXT2O/hyRO+6MlhqAOekm53Sx
	ASLIHc9wXstOiRpF1sli1LQIGrtIeWniLnC7EjGun8irdqdqoftwrgeqWAQtMydeuXf+EAfioDf4l
	NJb5tjew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14YM-0000000DzK2-2E4j;
	Tue, 23 Sep 2025 15:03:38 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v14YJ-0000000DzJa-1wq4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 15:03:36 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-74109e2ed70so26476137b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758639814; x=1759244614; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YcYie2cAKkOnUbqZ9iZ6V6CL9Gzada5AicC5iMnOBfQ=;
        b=dnJPAauDBZ3xl3ZWS8Fjc2wD1Q04Gem5xCEmneMMHKPmo2sWyvZJCB2BJ+P9mq3prg
         ps3gTemxLD9DFQznPpt94aUgCw0emugYkBq8EHo8dD9gI1H9ljxBrzzzc2ZZ+AWDYQ+6
         pih64n7fNzy0IXU5EnQ+irztRYhz8NAb5rwNhdOgTK6arpIkzynIbAoSaFBYLI6x5JbL
         YFewBeVw9t27UfF+AvEHIAtXu1PKStg0g6lzNaGRgLMiIHQVQD/z/hhCmHmhcUozpQ76
         X73UkJ9AeBpl75t8+5urh55kieMHe8Al+uCCyQX5q8gVoHf3VSyHOhIHaOQSKd+bbt94
         6t2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758639814; x=1759244614;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YcYie2cAKkOnUbqZ9iZ6V6CL9Gzada5AicC5iMnOBfQ=;
        b=jpwupIm3Iqj8CZcjhVF7wgsAcIXB3BiRsMx8uEvopQih9HQknLMNhZ5FbwGMkx3iMI
         Gu+y0JdF89/xEuz37mYsy7+4KE7Sp8ftS3K2GKVg5VOSR1UtXERmpiso+dwKOW9tWGRF
         fLSXAl2hnLgBstByJGgebRzmwKonOHitqSKCZCd9HEG+65nOhN+cxsuanbPgf7PVUX+e
         wuvnEcCfoFBbFhlEbG61/i68cZdwsQ7jDt/K7HHBqC3b4j6idpn18yLMf2Oiv4sCmV4O
         taDAFZKTSNSYO43gV4gs2xTpSQxicNNdal5sPOLNPLuIU4RTpTazVEIkWTaJIJGYaJiX
         iSMg==
X-Forwarded-Encrypted: i=1; AJvYcCVIiGIDhP7IbuA1mQciGWnI3f5kwhUKSbxB5NULzGHGWwle0zkjDhiTeMhVkgRIbMAtWluFNEVjqILwLRWdDMnk@lists.infradead.org
X-Gm-Message-State: AOJu0YxIzTuXZiEeRcmgQyhHxZfLO8r2ah+G0OOaCfllMrvJzVf9eBZh
	itl4CNH75KOgul/YOhS205IrZncUSxF2W0B8ZcDzkKAFCjnkGnJmhrHclgW+FHxwuKJBoio4+by
	hZSQrecH9DcQ4EMoGd1dKEh7hOr5AaGPj0ZYv8dmQiA==
X-Gm-Gg: ASbGncv/BMZPlcNMG2W2gxEXUH3hN60Wy1Uy+V13syn09ZXPIXqYFDQmAKJQOy14dh0
	vnrneN+C0EaaOtQhET97BkJcxVKcamTNDyPfph0SxVq9TzArwi4Wqp0F3xNkWx1MrHcmzQZyt7F
	TVunXuNBDpQT/zP02PX7G1i73+AEOg+OBeNdwhqWVT5AMbwL8NLFCXBUKdoB3KTZoP/E6Ue3jjc
	ov9ddyG77PMKRf+7LLyivtkmx8=
X-Google-Smtp-Source: AGHT+IFHn90x28JHbA7vjSDiwfdoTTPXMbOARP3I17KAJBJ/rJ5XITQcCBtsYmuIRAiIfgX1fgiiGgjUyy0jEa80iZ4=
X-Received: by 2002:a05:690c:6c91:b0:725:1bc6:7cae with SMTP id
 00721157ae682-758a43264a8mr27454997b3.41.1758639813938; Tue, 23 Sep 2025
 08:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250914131848.2622817-1-ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20250914131848.2622817-1-ivo.ivanov.ivanov1@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 23 Sep 2025 17:02:58 +0200
X-Gm-Features: AS18NWARyvKgXOeXvo9XZeI4u88VSQ5LHm-6zhc4kVML80ebLhJCorioq3hgWH0
Message-ID: <CAPDyKFq9F6u5+aT_CkRG7rcOLrRWv-9wfw8tcT+w72kB8QVwAw@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: mmc: samsung,exynos-dw-mshc: add specific
 compatible for exynos8890
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley <conor+dt@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_080335_743009_9C1EB29B 
X-CRM114-Status: GOOD (  15.24  )
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

On Sun, 14 Sept 2025 at 15:18, Ivaylo Ivanov
<ivo.ivanov.ivanov1@gmail.com> wrote:
>
> Add samsung,exynos8890-dw-mshc-smu specific compatible to the bindings
> documentation. Since Samsung, as usual, likes reusing devices from older
> designs, use the samsung,exynos7-dw-mshc-smu compatible.
>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> index e8bd49d46..27c4060f2 100644
> --- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> @@ -31,6 +31,7 @@ properties:
>                - samsung,exynos5433-dw-mshc-smu
>                - samsung,exynos7885-dw-mshc-smu
>                - samsung,exynos850-dw-mshc-smu
> +              - samsung,exynos8890-dw-mshc-smu
>                - samsung,exynos8895-dw-mshc-smu
>            - const: samsung,exynos7-dw-mshc-smu
>
> --
> 2.43.0
>

