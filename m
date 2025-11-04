Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77DACCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pO6dE6UElPiJpkG1mq8m4CRYqFTl9ZYqxqWs3yM4h1o=; b=0CPLy6rLV/PIzTgDRPlhR9FY14
	b62V2DyV15fUDHG8hCxGwG+NiwuL6o47rKaMMyamx45vu/ZCfoaJK8qpzppCDCw9p2Tgz/wjqFDoF
	A9M7HnA+NsZZenQfLVYNowXm9KYS2TV6bnCcfIkiqoU4fxV4qFknxrswObWdQEadySxYQ2kOzPqiE
	DRoldoBe14GtzGOhXCb6ZcTgpafV7zkf8c2U2ciRBjVtHHGnpggBuwPL8jrQmUX12EWPYJxLy0Euf
	2uIhWQ6xvkRZDU1WXyF7NW1pgbZxUJCsE8zEAhVTVw2uLg1SklETHREseBnIxQpzCDjxRBbXveqwu
	0slbUSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGD36-0000000BW1T-2lpb;
	Tue, 04 Nov 2025 09:09:56 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGD34-0000000BW0v-1l5C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 09:09:55 +0000
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-930ff50d181so4646109241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 01:09:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762247393; x=1762852193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pO6dE6UElPiJpkG1mq8m4CRYqFTl9ZYqxqWs3yM4h1o=;
        b=e9E34Q5aePyUoEYGf+nw7M+u+5F/524mpQXWMA5EYRWO18W61BQcSgzVhxNqZw2Vht
         Mc4HHWwlem+eQrUJScL7oNuW5f9k7GZdHgJE+MK4pMRHhr6fQs2lVoAHgenmoMDM7VPd
         4ebKWvkbDypqftK3I7RJtYfjBY/LGMKAPG470Zw20AMaa0hzcit7KF725w6M03bNMZe0
         sMQH1zphWJAQODWg4Frrfn6SlePBDjUQEFFLmhClACFfOD+lydAmIIgcpaIVJ6OCdTTE
         6MORRIy/9U3CJugNsajR9YX4oQ/SG+lJnw0Vvr51ZMiayTFvoNZLijA/FwiMULOAlQEx
         M+fw==
X-Gm-Message-State: AOJu0Yy4MAQ9e/kLctAbDPEgn8/NXHWwRHhLacVUFhF0Ahn1Ul/9T4nH
	wkS8aRnFam7+L4O0rv/zPiVkL5AHPhEj9qBc04DwcIRaBZQ4APdht178audzUjoO
X-Gm-Gg: ASbGnctjcgmSXDTFzt9+AOKKWItIqMlE1jM3AxeCDy+hJiBB/ZUmK3rm5BOgB3VCRm/
	Ph1RKKXoYWxrxV/DDwJ0F9lDI7p7XTX8UGWgVSUn95gJAQlZiCHFqco3c0FSBQIGKPAqn8NeGXT
	wHTvJQqR3MGHxYVIOhdyxQmq1k8nG99fIgmsUYG8BdFbOmP3SHFubxLYfMkLc4PAYm/z+OsRlka
	wET4olQ0JiZPjxSBYUF04LvMBBhJk3LuJpnTUYNPfMfVIG5exrI+xl5q8VONnNlMCMWg+zqI+F9
	pDu0oXwHz3NqBjNxVEbM0HLEIwRZjwMKVVP7JFTmDOj/yXqEM8pET/iGWKlEvpAvOU5EePozpPu
	vvurSiw/XHRbbn3jGFucc0O/rt5cvMbPh/bUcKCtt3pJ9OYqclhr+9lbu4O3Bjv3BelYaDnsZEr
	eAsF1X0BjqUEy0zZ2wYaQq7LOI5dltrF+R280QUg==
X-Google-Smtp-Source: AGHT+IFg/+NVD0kBhUzw7YPb2q+PqOhjApmlLyJy2q7jI9O93I2BMWxOyTCYg2oKuTONGkJ5nmc55g==
X-Received: by 2002:a05:6102:94c:b0:5db:cf38:f505 with SMTP id ada2fe7eead31-5dbcf38fa04mr2944280137.20.1762247392679;
        Tue, 04 Nov 2025 01:09:52 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93542b72575sm912013241.13.2025.11.04.01.09.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:09:52 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-58de3ab1831so4965268137.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 01:09:52 -0800 (PST)
X-Received: by 2002:a05:6102:dcc:b0:5db:ecde:5ae7 with SMTP id
 ada2fe7eead31-5dbecde6663mr1599267137.32.1762247049753; Tue, 04 Nov 2025
 01:04:09 -0800 (PST)
MIME-Version: 1.0
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org> <20251103200800.173440-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200800.173440-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Nov 2025 10:03:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQJJYzdWD3tufU5wVxy1OLfZEXh_KbkjTdaY4XJwKyOQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmlcpVQIRAtDzcmHfsASxj-kOO0XENw5qhpcWFOCPThzyKdxDz-JN4eLYI
Message-ID: <CAMuHMdXQJJYzdWD3tufU5wVxy1OLfZEXh_KbkjTdaY4XJwKyOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77965: Add GE7800 GPU node
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
X-CRM114-CacheID: sfid-20251104_010954_477651_42A7741F 
X-CRM114-Status: GOOD (  16.35  )
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
> Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
To be queued in renesas-devel for v6.19, pending acceptance of the
DT bindings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

