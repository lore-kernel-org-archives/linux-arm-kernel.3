Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378D6E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YeCyqmn+Fnzidtik5ZQwdL7fhvipeWTj4Y1csRd8xgE=; b=XtvsAUI2FYG69za7nQP0JJqH3Y
	rvhxT+dDg5Lxigb23+N4xfcCL7xmf8HJ2YpcuQ+/yLneSoixs7khhX5tLfAjE88rjfFggmL98i5q3
	ytKDwf0WKFmIOS61lwtOKKtslgK6K6HdZz91rdhn75DgUflzyNBnk4JybJBiBiSMvxsePKAF5/N92
	bVQpuvjTVxtA1eogWqCRoYs6V0eR57uKQiBBRvPChSW2wYAptnIHT9OeO8TIcMB5BsX9lfIQ0Ho0e
	YHwtvx5jeVZkmQnJzWaUzsskMxfDHPQ3EhYevRXdWIlEaS7Cp/3xU2PexTBYfIbwC6xOB6uAC9jnq
	EQMeqSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlHr-00000000mjA-0Ifq;
	Thu, 12 Dec 2024 15:39:35 +0000
Received: from mail-qt1-f169.google.com ([209.85.160.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlFO-00000000mFj-3xPW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:37:04 +0000
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-467838e75ffso8452491cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 07:37:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017818; x=1734622618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YeCyqmn+Fnzidtik5ZQwdL7fhvipeWTj4Y1csRd8xgE=;
        b=j2w7Z4PukDJXVMCsXBT5+SFyJ0aT5moz8Hx/H/4/hZlOYbIghjn1y475AKz5SZUN6S
         kaAVyfyyL7y/dfBoAy1iI8mUxzKry5M+XZUfWNIwcYfX0F3t5oTgfhamEmmFaB4mOYtK
         xHFCHf/rZUa/rubvseSMkR6uypmDvv7n6HH+l9O78KUsHgJ9jUhE7Fgbb9T5PjnKr5Qw
         jjW2B7Ag4cARGsF4WQcqHCfqKj/km8ysvfAyTiLqpbw3TkTh0L0dZ9bMRDlHecL9Gnow
         CReLTIsqEW3eIFmxuydxNkRGbagcH4RK3IIFHJ8EpaVQBcJxfmdn64z6w2T0KyrYqBJ9
         g5bw==
X-Forwarded-Encrypted: i=1; AJvYcCV1Owi6c3o9S1iBHY1lG1H1pAOymHWv9FAk5bHMJ7iGFU/F+yqAkfBcrCvWEbXr59uL9nCBsUmGhtAPCW19UEAa@lists.infradead.org
X-Gm-Message-State: AOJu0YwJoFK5+QcTe+Ln+Lrv9KYW/dBdsb9t1rPox+EWc5Im1CrH7Dz+
	RRKEzwom9+zX8xBm/F64Iz6UmAm95LOHc0GM/tuJHCNf+MxFFtFX2sI0qW3hQOw=
X-Gm-Gg: ASbGnctR8OTw/UGFzQ5ty/1ywnZyZpTrnOlpvRrdQ5cjFVm1A3Hq8xbgRmclrE47U5E
	aZSjtExrHZ5GCzcaHFi4v0VF4Y7OZ07RT48JUJt3wWsArF+YMwvPScjcvXoAgS8DfyLMPy4lOVg
	OOfK9Ocze6MOeYmzl+OsdSbCEg+si3xr1AJIJAO/qtO5JRGKtU7mjNazJt+kRYFOIFm+i+G7ygY
	vXEZel/T6n4qPc5Y7YoOpZpWaivfYULhxTUXdjPVDWJHKBTS1GkUok3+VJtM/sVA+nmDKQ5ucB4
	m6UlixPfQzGMp9JW9I2HeMg=
X-Google-Smtp-Source: AGHT+IHoUt79TErgSSsKIcL+unwjz+z7/ib+l16iYHTExCUscqHrcKQ5U7SBQ17h4TbwY51aMWYG1w==
X-Received: by 2002:ac8:5749:0:b0:467:70ce:75f5 with SMTP id d75a77b69052e-467a16c1567mr10601551cf.37.1734017818364;
        Thu, 12 Dec 2024 07:36:58 -0800 (PST)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46787bec063sm22392521cf.50.2024.12.12.07.36.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:36:58 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467838e75ffso8451231cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 07:36:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXveVsL8nrpP0t28S6ZRnsC+UMQmvyKNeRARD4APGb5NzFwZpN+0KM1ekxnB/kFcaapcRkwDrlNf/FfkyN+rjNP@lists.infradead.org
X-Received: by 2002:a05:622a:8f0d:b0:467:53c8:756a with SMTP id
 d75a77b69052e-467a1605bb5mr9849991cf.26.1734017816967; Thu, 12 Dec 2024
 07:36:56 -0800 (PST)
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-14-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-14-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:36:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPXicL1+suMeYrXK7qEmLYE-1uuHpMys_qnxqz9Ed8KQ@mail.gmail.com>
Message-ID: <CAMuHMdUPXicL1+suMeYrXK7qEmLYE-1uuHpMys_qnxqz9Ed8KQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable R9A09G047 SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_073702_980871_73D10E2B 
X-CRM114-Status: GOOD (  16.04  )
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

On Tue, Dec 3, 2024 at 11:51=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable support for the Renesas RZ/G3E (R9A09G047) SoC in the ARM64
> defconfig.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.14.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

