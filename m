Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F4FC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=; b=Lv7R9CjAYol7e2SZXF1ehJXria
	vOafiiJclhwHflRoBVQe0uqzPL/vMIjQTvwWCOZO2ASh8v2wvfOM+9zffW4Y6Aa9N8DwFfNILddyA
	jnJgcTMBayxyoxP0rJQuyZK1/jLf4uuA63jPM/FX3GZG08goLur2Bl9N+MqNY6GtzTtrWZtPJda+D
	W70+oLkzlfOAGT2Akm4QQNA+HccYDJXTdAS6vYoH21BhR/gqPpGDIWGLxz/QH23Ww0mDeKUAwK9yz
	M9yVFBSSssTevTn18RutjnhdeHddNAsW3PbeRDbGkLZaT4DATiZcMX6NccRGRli94YOZdcH/oAOP5
	pZyF0CCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR80-0000000C20D-40tQ;
	Mon, 10 Aug 2026 14:37:24 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtR7y-0000000C1zc-0lQ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:37:23 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bfb3347dc4so1200953e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372641; x=1786977441;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzNCXQCO04CqdRN4JU2RpTNoOwr4IYw/G6qWE0jJmAY=;
        b=bBgxsCSNfHVnpvO4Olyf5WDknu7XThWKoZGUEs6fuS7EKDBJA+1E2PLGH+TQTHYGG6
         ntxwPyskWZC8904aQ6ravESAjAotykfR5XrGWIdsmCpz+cJkn6U4ID1jC895t5OImmSv
         Xx8g/fSMd64iEUCye0Wxgex876sdWGe5ZnceV1Gtg3enQsmoPvSsBEAQVjaCaD0cuH03
         j1S4MCPJMTLCC/mDlTzOnBGCrlHRsoTTSa00DgIDnXw1raUh9oqfetREe8zn/XpPQft+
         p+ackMVWnVB2qiF76EMkCtZ6F0P7KqoknfChjdnf+wgXbZuj16/sHqwYLsO5c16c7RhH
         vBKg==
X-Gm-Message-State: AOJu0YywfQjGymdftpbtVUZ8B7KwttLvN3zSaVCNsiTeXuYwhFJR5QGz
	2VtpDngJ01qnGaUTe4T6n5jHT+RIs08Jd14NntqRtIn3HMnUzspvZA6IlICKNwsZ
X-Gm-Gg: AR+sD10gqmPFaEQYMtjtZZASUEjAozvukIHeYZp2MAV6nTfVgTkESa8tka8HF8Fowwx
	6nKQTxHQrJMCcOQW29YUcfiUO4fEdrdho8y+qDPfjrWdKuMz/rKgNvZkQ1IsoZ28v/xcncVUbEj
	JrPm7IhYp0g/ILm3/kqSU/K5xfUU2sMqF23dedNSX6OeVqMJNfkCHE8zV2NHvHmqRTB9j45nOtt
	YEkF/kx+Fn3JM7n348KNYVks4xuj0vMJyxPbmImybzwYNzu6hgvS0uaJaK6Nn5VOyeVPHc8YXLa
	HsuNmB2OPLvY+Sej+S/7k1Jjukzfu3I9kA2tDZXadRGN90VNWOC/DnvaBkb2I1y19BcVljUkY9P
	TXt70WRVIeXq6lpG5/F/m2ziHd4Lxxjb3sGPM8KESOR77SAjbBhgTzmBFzUs6bDYbkUrFSK5v1U
	k4wfqpEYmodvx49jOgcgrb2kHSz89pfpE6mdlmYXAGEXWd0L+pi48rzCTJ6nKmtsI5jHwFBSjG3
	HoN5HbSlkcPOlYTmsXvyQDk2A==
X-Received: by 2002:a05:6122:e267:b0:5bf:ac34:ce26 with SMTP id 71dfb90a1353d-5c3d924f1d9mr6088087e0c.11.1786372641024;
        Mon, 10 Aug 2026 07:37:21 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40ae6aea8sm4382625e0c.3.2026.08.10.07.37.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:37:20 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-976ea28c65fso1119636241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:37:20 -0700 (PDT)
X-Received: by 2002:a05:6102:4425:b0:74f:4162:3f58 with SMTP id
 ada2fe7eead31-760e79de5admr11853771137.6.1786372640152; Mon, 10 Aug 2026
 07:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260714130429.11214-1-marek.vasut+renesas@mailbox.org> <20260714130429.11214-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130429.11214-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:37:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWF6hVJjfR4fBbNWJirG4mkvdEAwLYbZ1WcVyw7HvYWqw@mail.gmail.com>
X-Gm-Features: AUfX_myKId3XG_N8cJulSE8NHSJR1C4r8vD32EwncQ0VsveFleyngFJWCgOst34
Message-ID: <CAMuHMdWF6hVJjfR4fBbNWJirG4mkvdEAwLYbZ1WcVyw7HvYWqw@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm: dts: renesas: porter: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_073722_216673_EF1E3B34 
X-CRM114-Status: GOOD (  20.13  )
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

On Tue, 14 Jul 2026 at 15:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS does not indicate how long should
> the system wait after deassertion of the PHY reset and before start
> of communication with the PHY via MDIO. Opt for the same value as
> used for KSZ9031RNX, which is 300 us.
>
> The KSZ8041RNL reference manual [1] DS00002245C page 47 TABLE 7-10:
> POWER-UP/RESET TIMING PARAMETERS row tSR Stable supply voltages to
> reset high is at minimum 10 ms. Set the DT property reset-assert-us
> to 10ms because the KSZ8041RNL RM does not explicitly spell out how
> long the reset has to be asserted, but this at least covers the worst
> case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4, with the URL corrected.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

