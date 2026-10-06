Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AED9CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 23:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=; b=WtV4hrjyZ4qAPZSB7TtNFgXFLR
	jSr73NrsMbaP1O567SXecagmCvbc4fYFgBVejqzX4kVFl/l9/S624VcgIXLFNwZ11c1tv31eLqhfm
	NS0Ivb81fR5gt6RUovm+dxZGsGPeQc3bLO+VPhdZhA/skodKM9SM/3pHqZpzvADMjXHJONRMODLwd
	Zf5Y8O4S5gXroexwomhfmeK/y7P8QNsa14jqqzY0RWyGQ5L7q6Zgb5gRTnTe7OJvzvRWHgJnec325
	XWlxbsWGQd98c5DNLn9QzgDjIu4UpRX2LM/h6G573zUOamKivnTeGz9zDtA5RuumlryUFiYjFhPm5
	fihmVEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEsw-00000001Vho-37F5;
	Tue, 06 Oct 2026 23:47:50 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEst-00000001VhQ-3Nfv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 23:47:49 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-8ae8541a2f0so13383447b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 16:47:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791330466; cv=none;
        d=google.com; s=arc-20260327;
        b=eXKj03QYFpdLcgmwypG4Z/uCopIhVgfneCRpiStaOnc8Qfqk/jOfCr/QtgGIePpTyl
         3Xb0VemodDOYuUFXMDsYd+gmJdf4cwZAn+yt9dfh9of31y0WNI4c3sXWH2u1xzyit4do
         oF9X4RTC8dKCh1wmfGeUgc8+Z8T5XwscfBH66Lh37I5GMsi3z7/7bgTJVBXONgkrXoSE
         4bwA4Louk+Ur1Uut9ahvsxRmmdWfW89pE3PuUa9d70+rr3gJD+1ibAdusrgAdSlbN3Xv
         uAHkMXrFrDc8ugLuMxx7e/zAoDHiJUyllNQ7POxMt8RS5U7D8y2JnZnsd9CwX28iLV5L
         x8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=;
        fh=WTY3MfDxSTlESsiVjsDoYidA5zi7LeOo3dY2aqS9T6M=;
        b=AtUY9xFse4gTtq3+/sdxgXvR0Cz5xK06NECI7vzvQ11xMe9UASgublU7rN7Lxl7mes
         usqKClEB+jbA3ZkZf1LwqWu3jHi2PWE3Q1j2bBizchscNe8KtqsZ4i7hWuIK2+UUNcwC
         bbLh/PSc4Yqn2T6KaTp7JcynwKG6wedDCgZUsPuVBbItknB/DnJshX3p7YdUL0dYrVuH
         AfcJ2BYHPOn4BRa4/MAqGWspwLU7BOP6jhOJpPtcfdFXf03qsbgFJGv7pVhI1/yKDB/5
         2Yhedsl+NOpgcFb5G8+ufA5INUxqVS59QxW7bUCuTh3cnTOAJ/gOcobxOw08Ohji+4qy
         Wh/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791330466; x=1791935266; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=;
        b=FYiD82wWjCfk4BrrzDaiHTsFkfR9MMMtLd3bYb1sW0zJji8hYdinS+/omRGDr6p7Td
         jYIpO61bKKMCThhEoAZH+NfMujACbtVglkCUpDsAdjmMTYAigUrg7NoPYrg4mfRNA1NG
         Oqlgp460vp8/KHWyHagsSDKLoDtGBYiEyt6qVgLVPTnT7EdsTsakJSLiJ534tjUyQRzV
         CkIBo+lWpHsWW+HCPJQGmoriUSgb7Tqb5ojNs3lyDgBy1B2h+5t0fAXH1lJJWAdmJXvX
         6AQWnDOz+33ESHrXvD/fB5wgivjuUQg4bCb4MPVCGcYGb4j9ZeZ74GSL+Q99wy2SLodQ
         D3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330466; x=1791935266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AACY6eEKMK9EhfCO/Rpu9ez/h9G33RdZtnEBeVV09lI=;
        b=16CSIb7YDRd1s87DEpnZueuaSIE35si/H1SWR/Akzux4BUgx/fjZWZikKjLPZagDeZ
         nEgoCWX5ESDe2n6uvjZ83Hq5Z4AlV4rLnj19pFEfg3eqxkoo2f9S6jgtjZrLjQK7WX4c
         3emh3f83tVoi+a/aCWul6BPkvJ1HP5fVQLlkOF04OcKBLRTFe/wwRU3P1FsK3I/DCoUH
         KkVr71YrluqXL7efh9LdYOkUVtPqiyG36q50xlv6tPHPjmK3Z/KwKJN8YvuGNg519nyh
         20FAQI4fhyajCyhtthnQh4OrZX2T1na0ETBHVsn/5w6jQ084RsJNVcFMLGDWpXGOG35X
         +Lyg==
X-Forwarded-Encrypted: i=1; AKwUvBzfyuJ9XcGX4GAtV3DftRfKVNL4AleGDEg8nP8uNQQSMHfPApOyN5JGTtNQ3ee9f3kFMlH1pXX4L1Gr4fyDuFSU@lists.infradead.org
X-Gm-Message-State: AFq9FYKMRi3IvI1jIfDLsDjNNxKfVF6kBYZmdfJB1F3wtJiAsK2nUlVt
	Wk+8skftl2YAf5DWrMIyqJftXRAd3+C0uqYVeZJR+M9JnasSXxoSDOxqePyE9PS9lmFxQ1CkZji
	BGKRy/TDyfkeMAwsBY+mI0r7d6ljAtjq2J+hTXe1WWw==
X-Gm-Gg: AYBFou2tMRtWisqDzgxgb5zs1uwPSXIOFXwPVce+2tujO/NXS3v5RzVPFbzx9+3EV/y
	b/lKU/MyGiM1z7uu1c/6twIVponzFX5eAsw36sDrp61SHFeNouT4dmtwZWb+T5s2CtbFmi0M43D
	jSI2kPnU1roDWUsQjOmTecRg1OLpHk7l3GDuhkntP1mOFW0YTXLX399VtFmKEuCicHwaS1bAJXE
	Aup61LiBPCaP6ZftDz5vUzpVdxDssd3YLAW1jtQMBF/Yrx1c1PmTIl1MhDKh/dfTqrtOCFA7i84
	tjQMBpxl82KVa69bO0P46DwasJqXNkT7vmWRCXDecSW8VGGLI8B+S5fsDjJ/rGhouiEE5pwEd9s
	ML2KKB96Dz0k7ag==
X-Received: by 2002:a05:690c:47c9:b0:8ae:91b3:f0a2 with SMTP id
 00721157ae682-8b05b01c13dmr5311187b3.20.1791330465608; Tue, 06 Oct 2026
 16:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-exynos850-acpm-firmware-support-v3-0-473a69fc8a3d@linaro.org>
 <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org>
In-Reply-To: <20260929-exynos850-acpm-firmware-support-v3-1-473a69fc8a3d@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Oct 2026 18:47:33 -0500
X-Gm-Features: AclHuK8biRi6brKVjnQsgRrEOJZ8txDP9zLFZXlunl0eP3sSkOkiUAUTUCWs2z8
Message-ID: <CAPLW+4m57BbhsuVaJb382af6b9Ek-raHoftEO9m8z62Z=DEzkQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: firmware: google,gs101-acpm-ipc:
 document Exynos850 compatible
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_164747_882428_F0F7BD8E 
X-CRM114-Status: GOOD (  25.74  )
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

On Mon, Sep 28, 2026 at 9:11=E2=80=AFPM Alexey Klimov <alexey.klimov@linaro=
.org> wrote:
>
> The Exynos850 SoC incorporates an APM co-processor. Communication with th=
is
> hardware block is done using the ACPM protocol, which handles IPC message=
s
> for clocks, power, thermal management and PMIC control. In this
> architecture, the ACPM firmware running on the APM acts as the central
> supervisor or arbiter for shared system resources, handling requests from
> clients or agents such as an OSPM. In this design, the OSPM is one of
> several clients or agents communicating with APM.
>
> Dedicated compatible string is required for the Exynos850 because
> its firmware utilizes a different initialisation data base offset
> (0x7000) compared to the existing GS101 implementation (0xa000).
>
> Additionally, the ACPM firmware implementation on Exynos850 does not cove=
r
> all clock management operations (such as clock rate reads over ACPM IPC).
> To allow the OSPM to resolve rates for these ACPM clock IDs or sometimes
> called domains, add 'clocks' and 'clock-names' properties to reference th=
e
> underlying physical clocks.
>
> Add the "samsung,exynos850-acpm-ipc" compatible string, binding defines f=
or
> Exynos850 ACPM clock IDs, clock property constraints, and disallow GS101-
> specific PMIC child nodes for Exynos850.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 56 ++++++++++++++++=
+++++-
>  include/dt-bindings/clock/samsung,exynos850-acpm.h | 21 ++++++++
>  2 files changed, 76 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm=
-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ip=
c.yaml
> index e68f9c3ca5e2..0eaa9c881f6f 100644
> --- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> +++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.ya=
ml
> @@ -22,7 +22,9 @@ description: |
>
>  properties:
>    compatible:
> -    const: google,gs101-acpm-ipc
> +    enum:
> +      - google,gs101-acpm-ipc
> +      - samsung,exynos850-acpm-ipc
>
>    "#clock-cells":
>      const: 1
> @@ -33,6 +35,20 @@ properties:
>        appropriately with the clock scaling. The argument is the ID of th=
e
>        clock contained by the firmware messages.
>
> +  clocks:
> +    minItems: 1
> +    maxItems: 9
> +    description:
> +      List of the underlying clocks associated with each ACPM clock doma=
in.
> +      This property relates to ACPM firmware variants where not all cloc=
k
> +      operations are implemented.
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 9
> +    description:
> +      Names of the ACPM clock domains corresponding to entries in 'clock=
s'.
> +
>    mboxes:
>      maxItems: 1
>
> @@ -77,6 +93,44 @@ required:
>    - mboxes
>    - shmem
>
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: google,gs101-acpm-ipc
> +    then:
> +      properties:
> +        clocks: false
> +        clock-names: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos850-acpm-ipc
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            enum:
> +              - mif
> +              - int
> +              - cpucl0
> +              - cpucl1
> +              - g3d
> +              - aud
> +              - cam
> +              - disp
> +              - cp
> +          uniqueItems: true
> +        pmic: false
> +        pmic-1: false
> +        pmic-2: false
> +      required:
> +        - clocks
> +        - clock-names
> +
>  additionalProperties: false
>
>  examples:
> diff --git a/include/dt-bindings/clock/samsung,exynos850-acpm.h b/include=
/dt-bindings/clock/samsung,exynos850-acpm.h
> new file mode 100644
> index 000000000000..87fc6ccc1d99
> --- /dev/null
> +++ b/include/dt-bindings/clock/samsung,exynos850-acpm.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright 2026 Linaro Ltd.
> + *
> + * Device Tree binding constants for Exynos850 ACPM clock controller.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> +#define _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H
> +
> +#define EXYNOS850_CLK_ACPM_DVFS_MIF                    0
> +#define EXYNOS850_CLK_ACPM_DVFS_INT                    1
> +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL0                 2
> +#define EXYNOS850_CLK_ACPM_DVFS_CPUCL1                 3
> +#define EXYNOS850_CLK_ACPM_DVFS_G3D                    4
> +#define EXYNOS850_CLK_ACPM_DVFS_AUD                    5
> +#define EXYNOS850_CLK_ACPM_DVFS_CAM                    6
> +#define EXYNOS850_CLK_ACPM_DVFS_DISP                   7
> +#define EXYNOS850_CLK_ACPM_DVFS_CP                     8
> +
> +#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_EXYNOS850_ACPM_H */
>
> --
> 2.51.0
>

