Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79AACAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 06:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYAAtZ89VwWeBi+kjfwnK16pwE+noFoHa8r+fgNX1Uc=; b=iCZROc3L+gI6DmOWadklwuR4rQ
	XgQ4EVXZMIE1oai8LThXZbsDpKh1eWkFi/BF56j5mkM4OnurDiAnWJeWcOk3Aoi2GaRuWRYNn9Qs4
	Vw6EkE+Vl/2Z12Y+wxN6pfL8Yk/xoz7ilNiT+qcdFM8fj2LfO4ydA/CGKlqcRNQv/YxY4eS/XfApP
	O644MOV37XfQVnr6mUGIYU3jhIbYusd6V8fPVUOvVorr7q6eltSbinW5p16ydvJJyNHu9JSVAR2pa
	q7abMaPknaogbLRtMy8k0+s9oLT+oIG+ds/NOSgCwS1HEF0ncRy84WG73FaR0a33SZWEG7E79m3Mw
	IA14r5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TRS-00000004LWy-0dUb;
	Tue, 30 Sep 2025 06:02:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TRQ-00000004LWp-2qob
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 06:02:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03F1262767
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 06:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9233C116C6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 06:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759212113;
	bh=tZFFRFKg0PUHDS6qSpNivs8Es7wMQjxESPTNTDMPml0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XLxhi1CvzOKNDGiOPSiJnKK0WeN6K0SSaPz1FVlANT+wEp0VU5yXdizG65L3VNObk
	 8lbHU0vEXEjlJykluoK3Y2eWmxkO3keifks3tg6+iQustVWM2sgySl3y4YnwrEZajz
	 KxNNn19DFc/RfVgL9shJsK6MpsDGZLt7KJgJtuRqVObY9d/yIQ4z0BMtdv2Aozi0B1
	 2Y8S6HMkqLJXyi8ENAICuobWEUv6TYvLiWtszTCA09VtWNgAX1sgejIjsQ8hKvyYWh
	 +Z2+AEq1TTwSyyAnwIoIdepLBVKVLZSLORs8z1vnOBZ1X/6z9bHTUaUo+vq4wlubyx
	 PMr+luFX95Wbw==
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-279e2554b5fso45911275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 23:01:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUllI6/eB2TvNeBjAQ0GrAtujKPJwLmlgWVBBm749L1Gvq5SrUoGVkJTakPcBEuCEmRtc0mwZlTfG7kv5i24an1@lists.infradead.org
X-Gm-Message-State: AOJu0YwXnrapUyDjlDBXmL1O62cYcqWo1Ey1Ioa2m1gJLA70i95hv9/B
	cG2qCQhAeU3VNYenI/bCQ4M572CjBCxidqkLB7Q4YSvFaHdQ8flE1HVASxPTtGlXQWkkvrcLhX2
	mSiq4d2yjaW0WGn+ONXCub18miIGt+tM=
X-Google-Smtp-Source: AGHT+IErIwwKQvXadjo8YStieZUDut9jWiBGKRpZXkgYC3IZFhh1kNcaf5JtiD61ISPp+z4nkDRXWDsI/3DHVQYxgZE=
X-Received: by 2002:a17:902:f647:b0:269:aba9:ffd7 with SMTP id
 d9443c01a7336-28d1713873fmr34808755ad.25.1759212113208; Mon, 29 Sep 2025
 23:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250930035521epcas5p428367b20b9498eb8862d17f4bb75f663@epcas5p4.samsung.com>
 <20250930040348.3702923-1-h.dewangan@samsung.com> <20250930040348.3702923-2-h.dewangan@samsung.com>
In-Reply-To: <20250930040348.3702923-2-h.dewangan@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 30 Sep 2025 15:01:41 +0900
X-Gmail-Original-Message-ID: <CAJKOXPcpybYa4hvVohkRVv5WaRv3ydK-BY4i3i5WA5fD07osoA@mail.gmail.com>
X-Gm-Features: AS18NWDDL4MOuOFlHqi4tRhQ26U6NLLMNyO6K7Q2H3O7rRfBNx3jEQQzLl1jkIs
Message-ID: <CAJKOXPcpybYa4hvVohkRVv5WaRv3ydK-BY4i3i5WA5fD07osoA@mail.gmail.com>
Subject: Re: [PATCH 01/29] dt-bindings: media: mfc: Add Exynos MFC devicetree binding
To: Himanshu Dewangan <h.dewangan@samsung.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com, 
	alim.akhtar@samsung.com, manjun@samsung.com, nagaraju.s@samsung.com, 
	ih0206.lee@samsung.com, jehyung.lee@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org
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

On Tue, 30 Sept 2025 at 12:55, Himanshu Dewangan <h.dewangan@samsung.com> w=
rote:
>
> From: Nagaraju Siddineni <nagaraju.s@samsung.com>
>
> Introduce a new DT binding file for exynos-mfc
>
> Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
> which describes the Exynos Multi=E2=80=91Format Codec (MFC) IP.  The sche=
ma
> covers the core node properties, required fields, and provides an
> example snippet.
>
> Signed-off-by: Himanshu Dewangan <h.dewangan@samsung.com>
> Signed-off-by: Nagaraju Siddineni <nagaraju.s@samsung.com>
> ---
>  .../bindings/media/samsung,exynos-mfc.yaml    | 77 +++++++++++++++++++
>  MAINTAINERS                                   | 10 +++
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/samsung,exyno=
s-mfc.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/samsung,exynos-mfc.y=
aml b/Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
> new file mode 100644
> index 000000000000..fbed987fb9cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/samsung,exynos-mfc.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/samsung,exynos-mfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos Multi Format Codec (MFC)
> +
> +maintainers:
> +  - Nagaraju Siddineni <nagaraju.s@samsung.com>
> +  - Himanshu Dewangan <h.dewangan@samsung.com>
> +
> +description:
> +  Multi Format Codec (MFC) is the IP present in Samsung SoCs which
> +  supports high resolution decoding and encoding functionalities.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - samsung,exynos-mfc            # Exynos920
> +          - samsung,mfc_core0_mem         # Reserved Memory
> +          - samsung,mfc_core1_mem         # Reserved Memory


NAK

These bindings duplicate existing ones, do not follow any existing
standards (wrong compatible) and are written completely different than
any other binding, which means you probably created big AI slop.

I'm not going to review this, it's quality is just beyond basic
standards. Sending something like this from Samsung means you do not
respect our time. You need to stay from scratch and read existing
documentation and existing bindings

I'll be organizing a mini meeting with Samsung on 13th Oct in Seoul,
feel free to join if you are around. I can explain then more why
wasting our time is making me very grumpy.

Best regards,
Krzysztof

