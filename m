Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17717CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9nsZS9cf0Yesyto3hqsvaV4sJKL6LJk8tudSlukngM=; b=sWw5m7dOiZA5MwV9bn/8h3upXq
	hXCkVYJABXLpcZsN4nU80U6q2S6qdefFH6YBNJGdAzTrmnJcTAjB3nTZCuuB5QYMdGwYEOBaSkv+z
	+26tdnPnxUR8z/nKkT/MizO7gLcFwOaamCbbNnNJ31NfnN8ohydqDHeqCkTPSepFSU3V/8BfwSPG/
	PvfMSeQap/PQOYd/auLlA+AVo821wCI2Zv+AM1w43u2cdv/uX2+JVSL7mHrLBBiZKubiJ51QL8E/i
	Hp0dXgpu2hZ3eAtJYMQ5+ZXi6yz89fvFD0j/h3l5eFC/Jg36L1dmkdPJ1Bf0XKizfXxUaBV3x29S/
	3qCRihRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVir-00000002OiO-0E94;
	Wed, 22 Oct 2025 10:05:37 +0000
Received: from mail-vs1-f41.google.com ([209.85.217.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVio-00000002Ohh-0zc9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:05:36 +0000
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5a46c3b3a5bso2946320137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 03:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761127533; x=1761732333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9nsZS9cf0Yesyto3hqsvaV4sJKL6LJk8tudSlukngM=;
        b=g0TbM05gRJIAXxom4KZ/ax8yQYLOjL/N/anmRNYYrBepqQUyyboD08MoSINZDtqhat
         6NBG2wyY5ZlVGEZCSh0SqgEuKkNfgZKL2GSTAyvHL3Di09Nw45rty9qTFk6d1fCBBcin
         kSKwhymfcl9B9e8y40I4TCK2F9PAPiBP9MCxkA7lYPvshBGoAGhoA88+mUxbjS7iKrL+
         Z/SXVXUpQ2JITdKm8P1KSU5WTKDQT+uSjWEUaTZC1+jN51dUlFEK6vyVi7/zuHesUaQf
         xeabtDmMSJN5/DJNeVUtK5DVbQyYHQyoIO1IWReiCkQODv/OOL6F/owPa3ydKc0X6qA4
         wgcA==
X-Forwarded-Encrypted: i=1; AJvYcCU+i2oI8ApBOqHqOVjO/2ZIsnn7zmPrVtaV8cGDnaYio67AlcwlWJw/yBYCrcZFumD9l9LdqT+jDB7VAFiNWKhQ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnz6d1iPeziTQipWDoIyIuEEln0rvtNAxnJhOCHQhnNYPlGWMI
	tlTwfSUZfMPy9ysEuOJEGCzf6PO+I2cY8yVhxGYvGlUIPd32AVjmijQkDXArBDY6
X-Gm-Gg: ASbGncsXWa2NMz2fThgtPuBFxqDAxOTkbUYKCLjJINPMv4A5A3XRzt7GF82f4Jmzr6E
	Oyd8vRH8eyhvVq5lBoDAg57Ld1uq9HSZur1rKSWgd8cFcPrPPuOXM4liArdhE7JHJ1VPj2DaiZY
	ELV/cHpLeUCOZcVmd4YAi3PDkdvqPxsgRLrxQdHlxfuHaO2PC7P7bkhBRMXgoDG0lXLAS6uRvIh
	ANviv3wcmVWiLLtfx1MsRBMlXafJ0432vsVAX42rfHMB2lenLKnTuyzM0vMA5NfGfi+rwkcm/sH
	3AXEmyBO/UBLEvRfN4IeVvismNrJ1Z2m36nlL0gjBYzBeuOYWhRs2XhjQ7tQlAf3ir4zo7mWM1r
	nlr4cnfZIUYUmFpTs2l/sQ/V9i8xm3mdBXbIxZZZdXN8WJdFVQnqj4X5kJKq6csdOxKyDcA3jmQ
	YGtkFPq1MxAbokOcuuH2Ul44v7nxjVOpEHDOekDQ==
X-Google-Smtp-Source: AGHT+IF58xKJKGCC32vW7eEUckeFecwqnLows0SMEupmp/cqI8bE7UjH2EaC4ryNajBRf2ycsLl4YQ==
X-Received: by 2002:a05:6102:548c:b0:52a:1ff2:da15 with SMTP id ada2fe7eead31-5d7dd5a6916mr5334039137.15.1761127532765;
        Wed, 22 Oct 2025 03:05:32 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-932c3e32dd3sm4320201241.11.2025.10.22.03.05.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 03:05:31 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-932cb562289so1149798241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 03:05:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfXbzEGd1T5bsJtn5XEw89uUJQIVIosMEISmEWmBADugzqJZhQSoiZqPf3+/N4wYgspC26FrN/Gb2Q8kDs9r0P@lists.infradead.org
X-Received: by 2002:a05:6102:32d3:b0:5d6:fcd:dc86 with SMTP id
 ada2fe7eead31-5d7dd568745mr5376089137.4.1761127531051; Wed, 22 Oct 2025
 03:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20251020101311.256819-1-richard.genoud@bootlin.com> <20251020101311.256819-6-richard.genoud@bootlin.com>
In-Reply-To: <20251020101311.256819-6-richard.genoud@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 12:05:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVf2dgWqsfVt9HCytJmmRLYiCkhzSJVp3drZ6KDq0Wwg@mail.gmail.com>
X-Gm-Features: AS18NWDWB3ss9iz68cJvppf6RUhrU6v4v0GhpWefkhntn5szf5Osn3JvNoovQ3I
Message-ID: <CAMuHMdUVf2dgWqsfVt9HCytJmmRLYiCkhzSJVp3drZ6KDq0Wwg@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] mtd: rawnand: sunxi: rework pattern found registers
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_030534_282067_C3E8D3EF 
X-CRM114-Status: GOOD (  18.38  )
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

On Tue, 21 Oct 2025 at 22:51, Richard Genoud <richard.genoud@bootlin.com> wrote:
> On H6/H616, the register ECC_PAT_FOUND is at its own address, and not
> part of ECC status register.
> So, introduce the pattern found register offset in sunxi_nfc_caps, along
> with its mask.
>
> Also, introduce a non compile-time field_get() because FIELD_GET() and
> u32_get_bits() don't work with non compile-time constant.
> https://lore.kernel.org/lkml/cover.1739540679.git.geert+renesas@glider.be/

FTR, v4 at
https://lore.kernel.org/all/cover.1760696560.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

