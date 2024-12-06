Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4779EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOOMHpFA7ul1mhFH+l4yk5OCK3gZSUbfgc+7Njpqkds=; b=syCf7rq0wwpP3uS4PkDZAfnV6c
	THPAL3IWwhW9f8epu0s4/K2ytF7Dn3uc+g43Yh9aqA1XVTabiN1iNMgL49RZ+rZuTYlC7cgK0Gy0M
	vRHotDFb7JRfuw4cXz/QZlKox70zC7tMfCXyk/OVywIYsvVeRQzTTTsnfB6GOMc3JWqsfaUSCnaUu
	qtWdPefpC5yHc+p/wuFLDfrin0gKR8KQBkQlFt3Q58obX/qsg3hG3dvXVABcGEg3Kg/00HTszql0U
	g+V0CRl3HVscWIfjdqhIbo6/83DuzlrUgFiy98hbjg6UxRxBhIIWIjMUTn3dNNK9/ia2Huhe+VDqd
	5bczn2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYvq-00000001okl-3Akf;
	Fri, 06 Dec 2024 14:03:46 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYru-00000001o3B-19PP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 13:59:43 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4af5ed9c8b4so564421137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 05:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733493578; x=1734098378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOOMHpFA7ul1mhFH+l4yk5OCK3gZSUbfgc+7Njpqkds=;
        b=W89oorKQh0xQ3PBepAjLC1uzyV8RYA7w/jV4SI1NVTIQ4UMZjg8CbLh9bL7qrJ20jO
         x4yj2spxfHWdKsMiEfI4VMsGewGXgx1AJv9NQY/UPnm9le7oVro5nAufzoG4/oYFhGdg
         99Dtz1zrgVWC28NcJLud+o0EEScGOlqPD39nFJ92TSh3mh0AC3Shyxrn79bWTMc6TC30
         78zbp4GrM3TDIbUNH//hq4eyqV3tKh1HLvyXhAVYrglm0JLYtTQxmrWSxux0qfOAgVCG
         OJc1pUK+uTWkxWfSxhBk4PLS1ZsdiYmvfXtwSxOfRMSHa3bFKkuDYzRv4sGZY6sahlHQ
         k16Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9BdoxEz4YGmAvDT2IlrDumxP0NeR6kXk5HPRCpnbpZmq7DWx5uleb23nrLorvd3y0Rzvkd0YxVb4/0Jwy3Tq4@lists.infradead.org
X-Gm-Message-State: AOJu0YyjYWr9gRH691wtVwcdZOcc6vcOAACfegnmK1YmvhDW46nsiFbX
	mz81kgo2gZ1+XmUhr9M9E6IAb99CPm1i+4mqLhH1t07hlMtv58bt2elunk9H
X-Gm-Gg: ASbGncvq8AuU/4WcdRLIz66AdrK9qGOeWHA1f7YnmMHyMVCuySX59+a3CAxYpd6Eyzq
	srW2buVBvoaNX9Ai0LajZMgH3Z/LL0ATY3Mqa6c86eOdr9NUDLd5Y4YodLQtVTKvRYyazfEc5ba
	JoEoqlw12zYEqKxodb9FCy8KypubC93FweMw6Tlpr+GJJWase+ClRjo3sYIi65gV+YpermXMBhY
	LypilExxVcIVhCjzL0SDZoHgBDA+FHAYe4r6r2gwfD3FafOH/63Mo3dqaEDYPFk/Hqh5kQ/I8ni
	tEyQlXt0Qhd4
X-Google-Smtp-Source: AGHT+IFCysuTykyNFxfcK/yF9Hgw7Ye93qQqyjB+Z6WNUYR/VKWcSWY183o5HNcv/LyePpZ4m5lXNQ==
X-Received: by 2002:a05:6102:5128:b0:4af:597b:f6 with SMTP id ada2fe7eead31-4afcaa10028mr3501434137.4.1733493578469;
        Fri, 06 Dec 2024 05:59:38 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c49d69449sm132443241.12.2024.12.06.05.59.37
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 05:59:37 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afb53a03b2so638955137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 05:59:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrIWRMjVixSKPNvqkIxpKGpBbedEJQSJPD/taLN1aadmhNcPSBe2lcvJdj44jKuSfw48jCHwLA78brUadtRr8E@lists.infradead.org
X-Received: by 2002:a05:6102:316e:b0:4af:4902:1599 with SMTP id
 ada2fe7eead31-4afcaaecf40mr3428766137.21.1733493577403; Fri, 06 Dec 2024
 05:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20241112093412.20093-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241112093412.20093-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Dec 2024 14:59:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXa9e9NAsb=bWuSicCsF2_qM_fW7_+3AKHgaTgsPCX0og@mail.gmail.com>
Message-ID: <CAMuHMdXa9e9NAsb=bWuSicCsF2_qM_fW7_+3AKHgaTgsPCX0og@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Renesas RZ/V2H(P) Watchdog driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_055942_313293_C17AF529 
X-CRM114-Status: GOOD (  15.09  )
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

On Tue, Nov 12, 2024 at 10:34=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the watchdog driver for the Renesas RZ/V2H(P) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

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

