Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D26C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 12:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJL1/IMECgroxe4ixu4JwJZG4/o4g+ajZJq3/oMKTKk=; b=Xb4yXXnqolrYsIRj8Zm1q7PpwL
	LPSXis0bxzDT5Y9+5rlcglmV0w3VRIzr3uzl4IHRjvq+h3hS3yf4gv7XvJ0yTEk6C16eJ9/uCHMfF
	MbCcT/rJKesij5OFLbQ0CHUxZeTy8UcYOWHucPMYVxUjmSAw22bqC0wKF6l40ilzpgfk+lMZjr+vV
	Na+qM+zw+qrueerr5ugaX+Oo4NnczLYDfM0jpHMc2ARttpBVBubbfRxlZBRklEnhHT/QoGfgqbpVE
	dkIeGJK344iVnUT6pkpdxLKuAL4xwpfQ8Sq8+97E2sWHHb3y5RqSKTpaqLV7uDvg3mKm7HaeCEXtv
	wUyAImfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2UUg-000000078EH-0ZVu;
	Wed, 09 Apr 2025 12:25:26 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2URn-000000077lf-1lzE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 12:22:28 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5259327a93bso2972681e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744201345; x=1744806145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJL1/IMECgroxe4ixu4JwJZG4/o4g+ajZJq3/oMKTKk=;
        b=hHKPfTvLuKxCRCJgOZRhmTEHVy9XKIKrM/do7A5PbKy8kOKEaMk7NY8+UbGPx4Q3pH
         hrJAPF1wDKmSnC9rTM8F45z87PQN6vbMk3jTO5DlCOf2r1rU55XCCc7SVyVYez5PZHfa
         DTBkTDqWYIkeiG8FViaLfPyTSW1lhaT94weveRX/LA0/hZ3QWtBh0RUmuVuc0Gvncf/7
         se3I2YrC9026ZJpL39hc27GZej44eREvTNoz41zCiJ8cA9Lrn6dSBX1bRfWZp/fJYoF6
         cRvJ/Ci8qSeavr6VuqTXIzQAyYCTeentavewKdczeyantzu2HmkdkWzliJvRYkzCKxl3
         C6KA==
X-Forwarded-Encrypted: i=1; AJvYcCUZoanKnQU5kZSbVIuKM8ZLjF3StmjzbYIj2ritF00+uujuTtK/dbeTScfh1Eop9oLH0E29uYyVQqT00Q26jFit@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/pXHvc1CjYlxrBG4u8eVnHoocUh3JZQEnbPSaTkaMvom//RXq
	g4pm1FVioX8tczXsMayu3L/dia4dT492OtgQgqod/3YIr2MIFbVHQROTqjOD5E0=
X-Gm-Gg: ASbGncvPlooW5mbw09THrX/QFDEalbq89ZM391vpY5onGVL7kr5MPiK6+ZYfJsFHOoz
	W4A1kHSiBy3vtCjTxfk1ZKNJzuYV88G3JWKJUpgVKXvCKfSwd2Ocda8HpaHs6I/HUg1sp8+4FXM
	rOlg1deWVWDQozmaEljl/0oDFIO9JgS0bBUwZ7b6wrNakqasfb8f7qOtitrwt/AeDXoZOD7Nuku
	w1cAW08g4yXN6FjFIgtXbm82csRTuIIerjiskk5yRGvwVMyXB4noJHJux/hAyyc+z4ZNVfBBP+J
	HYjLd8evCMhjqeVCoALyAq/JQruPGuYm+1Jh4Z+HU4KaSVN6gsyBoPvEii9fvBmIZoPlszxw/wp
	F5uI=
X-Google-Smtp-Source: AGHT+IHDEI6NFmgUvm44sz7o4JYL1T8HqmJlfmJPJ6d4r4J9cxRBzQN6vZUFiBrVepCnG9Jw/fKamg==
X-Received: by 2002:a05:6122:8c7:b0:520:6416:56f8 with SMTP id 71dfb90a1353d-527a918440dmr1783450e0c.3.1744201344726;
        Wed, 09 Apr 2025 05:22:24 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abe8e6fasm188114e0c.36.2025.04.09.05.22.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:22:24 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86d3907524cso2849298241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 05:22:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWem2RDIckCCL53sDQw+JNu2KSVr3TpYl1A1vyJejwU6wux20s3N8qVVVPDsardC+Vjn/9/HkPs8x1k/UwX4yXM@lists.infradead.org
X-Received: by 2002:a05:6102:f8f:b0:4c1:9cb2:8389 with SMTP id
 ada2fe7eead31-4c9c4160c95mr2421085137.2.1744201344054; Wed, 09 Apr 2025
 05:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250401090133.68146-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250401090133.68146-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Apr 2025 14:22:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxoLOsAi8qtARhq6Z-ju7pytBonAQKC5Q8XKvb_YRPTw@mail.gmail.com>
X-Gm-Features: ATxdqUEiBvOMzWpw7V5yFKH5RLWLxl2HUDIyxt7xDP5_uWVS4Ux4gJsD7QM6m9g
Message-ID: <CAMuHMdXxoLOsAi8qtARhq6Z-ju7pytBonAQKC5Q8XKvb_YRPTw@mail.gmail.com>
Subject: Re: [PATCH 1/4] soc: renesas: Kconfig: Enable SoCs by default when
 ARCH_RENESAS is set
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Magnus Damm <magnus.damm@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_052227_457131_89E106AB 
X-CRM114-Status: GOOD (  17.91  )
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

On Tue, 1 Apr 2025 at 11:02, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable various Renesas SoCs by default when ARCH_RENESAS is selected.
> Adding default y if ARCH_RENESAS to the relevant configurations removes
> the need to manually enable individual SoCs in defconfig files.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

