Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A784CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=; b=AUk95bYmQ5tO+2o8rH9M8W8+WM
	7M9t8XHXPizbvd9Fbh/5t4vG9KmLBrZ338rIkeVCXWKjfmHixLclRf0FvAixVEv3A48fYBBY8KIAU
	N8yAZFQA+tQH/8YYv3lX24cw/rGafkWramtApZRkHKVUIBwdS9QsBOeu2DNNcwD89XepMLC/tkx1A
	Vnx5uV1ykDyMpA4D1GhyRdNxxHy/8oldzBwl1IoDySZcRM7OkNKwFVdKi98KKcwjssBakzkttjTyG
	CEfCm1YZVF4HarR9mApkFfyPIYV7fObIWtH4+Z/fGHyzKg7DtVkfI2K2i2nMo/MEwyMe3m2wxuuFv
	kU6AG3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ0A-0000000AzAg-1NV2;
	Fri, 22 May 2026 13:33:22 +0000
Received: from mail-vs1-f47.google.com ([209.85.217.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ08-0000000AzA1-1du8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:33:21 +0000
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-63a3977145fso2339509137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456799; x=1780061599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=kLXA9K84CGNS+29EQYGW7X2mTVOiDW9ZVqytf2bW9uvAo2w/30teo84C5lvCetFZ+q
         /F64qMQ+sx/N5CA95iPE7689uAWuw4hfQuf4KpEqi95RJmXD6t2aHT75gKG0M01aP13r
         CdRPNco3Fl7j6So/2f3Izhp7qaO5EuqUwk8M6hWl2VadKl5UBZdBmckIxbWc72GijXyh
         +U6iJI6gw6PZlg17W7xZE9PD86c1F/I+6q5i6QhOrvbKkiFXg5LQf2qDNCh/Cxp2gxAD
         Xy1RqXxtt7XYPcv3S8UXvbHq0JcIHEuC/3nSEHDAgXCQwyVN6/vFOmy4o/Z8S50xKGN4
         9aEw==
X-Gm-Message-State: AOJu0YyJwygazbF9IOq9lCjcSwA+Gp7qJ01164+P49S04GGo5nWfVoul
	oVD4uUrVDqEgYi3XAFgHA6sz+EqMmadE+NHstspG1u2SKn4BBHAMCi0RBtJsZ9obUTU=
X-Gm-Gg: Acq92OEF06nogoVH4cplN2okzasg4m+5WiEPKLpXak8tTYIOkKjd4kECognZMyBke7R
	gxwrBEKelX5kDv18cIVarKnHwuQqhFID06fahkNJMLVIzYmxVD9jYHbKoOd9SWpNbuPh8YcRWm4
	1cCN+9ir7gbe2PkezaSQf4m24uhFLs3+MXbbfvmoimHAHsTGmNGlOQOXgJZ8i4PoWLc1z1fEpCM
	qY5ve6iUvJg0Bq/MX/OSsufUegDkk1P7EF8qdjYyBoASr8RVvj1GEenKynLN/+bM8G2keb3TEEQ
	uUupxx3UMrCUMI6oHH4aQiHi/IlD/dmQ5CBq8D90h1BZvVsB3dO5kDLkwKFFAJ4aj3opi87s5VC
	drkNX1eVL8ihf8hUIcEkR6Iq1AVV3dmB5t2nytndHaTR5GGfz43QmaGXGNIZhh0lyTKaL7irNEb
	SQrgwjqrjGsmNlr9SaGnZPi7Yvd5oapmf2J2jMEJx3SlkGcHflGOBuzOtTmQqLuG7GXc+EvUfxQ
	JM=
X-Received: by 2002:a05:6102:5241:b0:634:92c:bdce with SMTP id ada2fe7eead31-67c7300cf26mr1606863137.12.1779456799129;
        Fri, 22 May 2026 06:33:19 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fda9015b0sm1313486137.4.2026.05.22.06.33.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:18 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5751e12c524so2618329e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:33:18 -0700 (PDT)
X-Received: by 2002:a05:6122:a5d1:10b0:586:f3ee:2150 with SMTP id
 71dfb90a1353d-586f3ee2352mr748808e0c.13.1779456797851; Fri, 22 May 2026
 06:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org> <20260504225704.115125-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:33:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXU_Ro1GX3XTnh+RR4AngbU6K2GfUP8KbvKXPUUME70YA@mail.gmail.com>
X-Gm-Features: AVHnY4LG46fEPe2Suv0Wt0njTP4x5GX3t7XRY9QQB9dVjdHehcMT_3MRaFGgxVs
Message-ID: <CAMuHMdXU_Ro1GX3XTnh+RR4AngbU6K2GfUP8KbvKXPUUME70YA@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: renesas: ebisu: Rename clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_063320_430543_B5675663 
X-CRM114-Status: GOOD (  16.20  )
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

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

