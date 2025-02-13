Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E4BC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 18:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ie3JzpPwAcx/4geWAE6zYb8hiTtsdSbYIX5JhTMAO3Q=; b=tbWqME4LHrqXLPSBKLsOrivczt
	O3qRQ/1MEc5P1o5anECr2iVphx3pJc+ATsjBD1ktQSJa0vDpA9zvGAXe4UpR0s6k3e18pWGl47oYr
	nzE1kQ9inV1CWmmkgqNAGJZ1ncDffMceLOyTHHB+RfX/ZITDGaUARXOH1mutAIjDBCK6VHGp9lhwH
	BXm8PiYVtInytEbk8vluoN5oQUfUi4NrJJY21RfHeQZOSKVB4/R4V+B/9SZ/Z8HWm3uQH9nIUtAez
	YOUv1lcgdJyXqzN9/LF9Gpz8usvvzCPCt1SCLIDgdSF3xpgmsVkz1XiPyhNduysO6NdcRu7LQm+x9
	1TAnNBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tidVl-0000000C78A-2iab;
	Thu, 13 Feb 2025 18:00:29 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ticj7-0000000BxI8-1Xmv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 17:10:14 +0000
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7be49f6b331so107208985a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 09:10:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466612; x=1740071412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ie3JzpPwAcx/4geWAE6zYb8hiTtsdSbYIX5JhTMAO3Q=;
        b=ioDJKwcVLfxZxqaaTk22cL42oHp+Y8qIVFvlCCmuqkpKONnGR1tRS8U0vs1loZDIL/
         2+eJ5tBea24mO9bSQXT+3M7W18xKnwf9P0sWpcZp0LRr3DV/5HtcqZXTJTqcb4AnR30e
         hUk0v2lPmyzcVeWkEFa8OiGtYWTfcDKEGBJEa+Qxk+dQkAqxqb7NNKIn9zw/IjQgcaTj
         SFZD1nF0P6WzG2ujKYYh6fhFrnPAH0z+gU1ZrnkY4sWSj+3AAtxdBQ6Hgj7tC6AmY7ri
         4/j+dmH2L3zD1TdmLwwDi28k1WN8w4VRUZf8jfmcCFaPGNcD9Xxz2Lm3ypZ6FE6cul2I
         xMoA==
X-Gm-Message-State: AOJu0Yxyp/HtwUGkBT19j0JZ0gg1cvZzGY6KIoE4hKgprIiIJ0K+O0rc
	61oCP7iC9brldhXLRWmp1MPuoqtEcG+3NmVr+dmxJFRGo1GicFSNQ0AaL17OhtA=
X-Gm-Gg: ASbGncsucFP15tFTgKwqZC+2oScwhCMoRDXkqLFim00cwgGfg9LO3slX9ylZXLJvLW8
	qLEUjvyBj2A5ae9tAlsXuaQIvDvI8riFD4g0ZIzTS6ISj9dAZAYfH119TJO8I8GIUo37btQ7fT5
	BhagMBRVk0MU0mWm8/GkUULHI1ZJg2zPluPiWL9h1rZ9vYYK9kC2VNa63coGhzztjaoKmcgSe+Y
	jkHk25TePhmx5Lxb6nwHrv1NAwSMKgFER7WH62EPUGQ70xxk9la3ZiO7om+hn2YnlYaxEMXcb3d
	OhPyCdXMk6AwdrQrsDGOXeYjJMkdQAIybFlQGBnVh0YnYPeqPwf+wgfu9Q==
X-Google-Smtp-Source: AGHT+IG6URuXO1I2+4uOUc7mvVK+0dAbrfKslbRkQmJ8pDI2pu5y/GIwR4K73Fqh/tzjORI7XbP+NA==
X-Received: by 2002:a05:620a:3908:b0:7c0:5eea:a70f with SMTP id af79cd13be357-7c06fce4b3dmr1103940985a.58.1739466611608;
        Thu, 13 Feb 2025 09:10:11 -0800 (PST)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c07c5f3608sm112256785a.8.2025.02.13.09.10.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 09:10:11 -0800 (PST)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7be8efa231aso123238985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 09:10:11 -0800 (PST)
X-Received: by 2002:a05:6214:c2e:b0:6d8:a8e1:b57b with SMTP id
 6a1803df08f44-6e46edb2ea2mr147644036d6.36.1739466611109; Thu, 13 Feb 2025
 09:10:11 -0800 (PST)
MIME-Version: 1.0
References: <20250209180616.160253-1-marek.vasut+renesas@mailbox.org> <20250209180616.160253-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250209180616.160253-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 18:09:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUC1F02oQ1pKZr5HY0sdKOFEQe8EcsccHZw1NcrRkdwsw@mail.gmail.com>
X-Gm-Features: AWEUYZlXRfidZ9xD_oiptzCynSGorb02SKh9tpjqSsp_85FHqgD9O05IG1SQrx0
Message-ID: <CAMuHMdUC1F02oQ1pKZr5HY0sdKOFEQe8EcsccHZw1NcrRkdwsw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: Add boot phase tags marking to
 Renesas RZ/G2
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_091013_406016_B085AB9E 
X-CRM114-Status: GOOD (  22.82  )
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

Hi Marek,

On Sun, 9 Feb 2025 at 19:06, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> bootph-all as phase tag was added to dt-schema (dtschema/schemas/bootph.yaml)
> to describe various node usage during boot phases with DT. Add bootph-all for
> all nodes that are used in the bootloader on Renesas RZ/G2 SoC.
>
> All SoC require CPG clock and its input clock, RST Reset, PFC pin control and
> PRR ID register access during all stages of the boot process, those are marked
> using bootph-all property, and so is the SoC bus node which contains these IP.
>
> Each board console UART is also marked as bootph-all to make it available in
> all stages of the boot process.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

>  arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi | 1 +
>  arch/arm64/boot/dts/renesas/hihope-common.dtsi      | 1 +
>  arch/arm64/boot/dts/renesas/r8a774a1.dtsi           | 8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi           | 8 ++++++++
>  arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts     | 1 +
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi           | 7 +++++++
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi           | 8 ++++++++

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

>  arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi    | 1 +

I will drop this part, as it is not related to RZ/G2, but belongs to
the RZ/G2L family, for which I expect a (larger) separate patch ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

