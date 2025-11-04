Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F1CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 09:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H67jLGC2+nP+gJvVX0MRHo5Sws7Lcd+OKCPJPF9TIMI=; b=ScDECpKeh26tdrjzu24UyTXNYp
	r5DDhsxHJAbQyck/6rGkwRontY3LEz104QIRXS/UpiZ6o40+VJdWECGSCUw68MQk0dBV1uR6Mfhlt
	xWYQVjdfT/UlMKgWrlQmn3WZV7PY4JkwsldHB32u4J5t0uFV4gMb8PhVW7bkDc0PLII9eOMpUYx9Q
	nTUpvfSZgfL7+2Dhc1TGpiBaa2d9hM0/Ty8+BArQ0B4tExRzaKrU6MSw4igdriUOiefQany6F9jdj
	nrr4HUddeWSUWBuxKCFtaZoDcNO2ZzOxBh/RxaXG/OFpHUUD30NMqpCKC0uaKEt8sJl8TS/9QIOHa
	57dZ54ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCvd-0000000BUeR-0fi3;
	Tue, 04 Nov 2025 09:02:13 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCva-0000000BUdx-2BtW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 09:02:11 +0000
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dbd8bb36fcso2002139137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 01:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762246929; x=1762851729;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H67jLGC2+nP+gJvVX0MRHo5Sws7Lcd+OKCPJPF9TIMI=;
        b=UIUUThotDcOJ9zbvoyLkMUVlBm1m3lqbO3TYd9g+9J2jwcnhMj32vb7GI4WmCH4waI
         LOX0c9f1YJugco8kT3PvcBhWacc1AbGS2h8v7oZjbDQYAsrbMWEW/5IRXwuwE1aXiJOd
         YK4aCuN1Vcv6KiQ1jx83hUZUXlagGWKb33HdKSPPa8oFjRWPeYbpp7YftSA2B7neO5dS
         F2TVuV/SgG8jdXGoUNfNaEcS8Z5SRnSjqWS3UZiRT+JFUndsVFegbOI/yjiViFZrcQOl
         eQ85yTIufbSqCVFt8pCy+ZkZCBvzQahwRRGzBsOcLk/CPMx2zx6NVIWvV8moZ5BH0zrF
         KD+w==
X-Gm-Message-State: AOJu0Yx0z10e9a7HVW4RDh5kUxsTBlNhoqV3u5rI9+cA8eVHgutQkEul
	/qNGFPFAZai5ysO3LzK09F4KkD+x2kcURwwwNR5C76DdX2aOGsRssRLR/YJOMM3l
X-Gm-Gg: ASbGncsTXnC/hQLZlW+2SwO40CWIoPZrbHFXB7XdYBRu5dT9Eo/PHTLoZ8mzI5nn5sr
	VgMt1yHbGQTj9gmGA9hLcn2aSFAcux6UzCEnRYR1R6vdiffETA1RoD4FyP8uhj1sU6At8axgEGT
	sK10xMjhGWVPtlJCDum52aHBIBZ4rkonxAVJNA0XkGVQcZY+syrfbxBcIC7g1Y0j5/yw8mQ0Icy
	bTlNqeVER8wWIHGOXW3V0soCG7W4GEsnDfuqUHxDRWpIbkqfn6Xtl+nZ+H1q++nH4H1rEzlFQGM
	nOYXRJz2LL3IPmSokjCKDINKXulahKnzqscZPBjRfZkyliVAn8Go6goEbk2XBuZ7DmxIEuH7R1V
	MCUQXKl8tyW5mlHb1idAOVN1nR3wgvnPKATH908VJD2+w7W+oKytXxH4bzkyoG6sf7C7xkS2+Lb
	2uGAA6UJKsJTQY91L/9C7tNV8wElKEWe6LicBPJw==
X-Google-Smtp-Source: AGHT+IELikIV321dsUU1awwX7sxF7VMj/8InWSxVx9r21ctAdnujIEZjSJaWQGYUHSVMwqZvbzYM2A==
X-Received: by 2002:a05:6102:83ca:b0:5db:3569:9059 with SMTP id ada2fe7eead31-5dbf7bd9a50mr611477137.17.1762246928828;
        Tue, 04 Nov 2025 01:02:08 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dbf30e2763sm919801137.2.2025.11.04.01.02.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:02:08 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-9354847e338so247392241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 01:02:08 -0800 (PST)
X-Received: by 2002:a05:6102:442c:b0:5b8:e08f:eb38 with SMTP id
 ada2fe7eead31-5dbf7d63c3bmr753205137.14.1762246928045; Tue, 04 Nov 2025
 01:02:08 -0800 (PST)
MIME-Version: 1.0
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Nov 2025 10:01:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUoVrMCcN0yY6BNrgXxFFPP-uJSAssZVrSWBSPtTr9DwQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnnwTsbga4_ceAKrw3IqMNP5c9B4ptZmLIuqnx7fLogJkKsw0-FT6vmR8I
Message-ID: <CAMuHMdUoVrMCcN0yY6BNrgXxFFPP-uJSAssZVrSWBSPtTr9DwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_010210_563193_6A458623 
X-CRM114-Status: GOOD (  16.73  )
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

On Mon, 3 Nov 2025 at 21:08, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

