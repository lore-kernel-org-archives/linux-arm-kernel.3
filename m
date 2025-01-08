Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1BFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4NAkYOwXTO9Vbz5ywBO5Myw4esqfkb6xj3656tlG2o=; b=KEWP5o4dI+s0bq5P84+8CAYrEV
	XTxJ+nMS3oC3b5lx9w/Q6H7AjEkz8cDHHN8LWwXJ/ij+eM8N3/nM33GzIYxjxX9q1qjduzRsIQsn2
	htDZ3lA5tkPBMN/5Vszws3OUHgEJpAQID0DLaRVM98F5s8tHx+dlB3n3qgdnzN7dSeD0onk4DujGq
	S2OpD2gc4Z6cHWc4hkw9YLrCXa+XZCDQXUMKZ9sy6D1NYFHUx00S/nOv3dpD4pjQZQ7gl+1ekL1SO
	QX+rkSth0BVTAHpVbtZqHfgfLcG2AKDENgFrUQx3vQI3n/mDkxiKW1bKn39bw9kTnhdC2FbuygHGw
	SgS2ZA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVvX-00000008Zcx-3aXA;
	Wed, 08 Jan 2025 13:16:51 +0000
Received: from mail-vs1-f44.google.com ([209.85.217.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVWM-00000008UuM-0sMc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 12:50:51 +0000
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4b2c0a7ef74so9411330137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 04:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340647; x=1736945447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4NAkYOwXTO9Vbz5ywBO5Myw4esqfkb6xj3656tlG2o=;
        b=UTNkkyhtMf+sLwa9VHXnBhqv4EZonJQCyS4G/69iseqb/tf/rDxB793oevOryFWs6p
         nZpgxOS/oIfISFKjpFt6Sybcx1eT7VfyYt18cZ5VLctsXElpJgq/e6sdynpr5KmqQKJf
         DvmATmO0g+tLAT7pM+yZVRTakrrRhMFgaT/NfVc4bswjSyfK6Al0V52Q6wsXRqFXzJuA
         hAVj3wpHBunTYFy4VrEpy8Gl/p9M5pUa9uLmCvEWLB5pFLGWq9fjwekx3i9RXd7NHlsI
         h8Cd6gE0tF7noWo1DdgaCroatYNjUvYzi4R0XWdDKbuTXdPa/aVTc/5sL5EuWJMBNivB
         qBDw==
X-Forwarded-Encrypted: i=1; AJvYcCVlrsiJqd8Gzfbc/wiDjAnB0vXCBrUv56PhQFkQN4M10EnTwCE726tMCzSMiAviTrrSMU1DJIJaxZF4j/GF9F08@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7gNETjG+HgRqB4+dVCEdbUtjR3xx/2/iC6dZ35uCJoQ/4fZ6s
	564OAXXWJltCDC8AqEX9c7Wsw1ankEbraKb4+oVi8WzrpcZrtg4Gk5/QPiDw
X-Gm-Gg: ASbGnculp2PpswHkWr8V/1XqFEGxWSY13BodQEnlG3ZWsBXjucj52plG8tmFlv5FWr0
	2FLcDWAQeph6VI4wSalbJOoTjXiiIokYdRGQDq43IxHbf98eUqj/An3/gzcXAedOrlDTqDBEJTu
	7KTNjPaDxJtvcYaAzd2pbgWURAvlZAJtP1DLN13+7K5DQFcoDYj06/N/z1Mid8RTajpU1prC5/U
	U+8WAcN/oQJcXhCK7Hkqisrcy/5xf7KHf3JhguomyWxrhIDJ0+24kH9AGO2L9FiUuA3Ij90E6C0
	9FDA7NHs4sAtTRLu+Go=
X-Google-Smtp-Source: AGHT+IG136iNffRm2lE8fjnidwHUR+jzKOc9MQbv06awoZXQKfHAmqzRkTlM8Xo8wR+uoWU8XZTFpg==
X-Received: by 2002:a05:6102:2b8c:b0:4af:de39:8daa with SMTP id ada2fe7eead31-4b3d0da4b52mr1654670137.4.1736340647001;
        Wed, 08 Jan 2025 04:50:47 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad57d27sm8440096241.31.2025.01.08.04.50.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:50:46 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85bad7be09dso8652820241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 04:50:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFewH7se9zx7BcruPjLCcCc9Se/VvY4bSVCujU6giIdo/Om0hEH/z39WvOANyJhImzZiog6xGj+zrnfOdVwoz3@lists.infradead.org
X-Received: by 2002:a05:6102:b02:b0:4af:56a8:737c with SMTP id
 ada2fe7eead31-4b3d0dd199cmr1696534137.12.1736340645758; Wed, 08 Jan 2025
 04:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20250107131019.246517-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107131019.246517-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jan 2025 13:50:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWQ8NmJbswGMCrMu3sgPtCLLSvdGONg_Ux_cNsvk7MLWA@mail.gmail.com>
X-Gm-Features: AbW1kvaf0_q9bTRRhsbwHxe9_rKnHnPxiUDNiKQ4wgA4C6jlHeSLeR_KGT4kkIw
Message-ID: <CAMuHMdWQ8NmJbswGMCrMu3sgPtCLLSvdGONg_Ux_cNsvk7MLWA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: ufs: Correct indentation and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-scsi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_045050_252579_27D70297 
X-CRM114-Status: GOOD (  17.53  )
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

On Tue, Jan 7, 2025 at 2:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../devicetree/bindings/ufs/renesas,ufs.yaml  | 16 +++++------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

