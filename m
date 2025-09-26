Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29DFCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 08:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY1rhcUMmAwK/dbcMND+DzQQ6f9robrwHJqphz6/mqQ=; b=lEzXByNzGjfgWt2LZQNeDfGRzp
	tB12PDxOZdiRuY8xPaYEVW/PqHZrsov5gcR1cy9wU0ai4Ji6bs5RNqHnpQGF74baUpoxrLpTh/71M
	6vvfZ5QnJXs7iNtWMnFGHeBeFSSWOCl0FKXPp/go6u4WIgN+7iJ6ts/jmaYW5g0yihLmV7GxmVCtO
	Pyc8/x4MPV4MqGyZVYced6r6fZUHtT3eQf+HAmEjZ0AEm3W6UEYtG9SYZswwbmEBF9/oWkkkU0IiA
	3qAVPwLMYIqMN+DgR//a8PNFzqnVD0y/9+pldOrL0t8tjda6D+G34zbEKMSy8yvN4LB/AZ8gBp0B5
	6BNwDT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v23u0-0000000HBt0-3g3z;
	Fri, 26 Sep 2025 08:34:04 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v23ty-0000000HBre-2RZN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 08:34:03 +0000
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8e1d6fd99c1so707917241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 01:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758875641; x=1759480441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fY1rhcUMmAwK/dbcMND+DzQQ6f9robrwHJqphz6/mqQ=;
        b=RR60yKBos5T2IIxH9eIUqz5mMYV1zMM3TZzmnfJ4xTI9v6veLXdl5/4w4G/I+33qEE
         iTzfFc/T0dfRtuxcUXk41NXR8x+V1Z0zURBN9QA9HDyuOMtaelJidFXlOqfy26Is1wZr
         7OypnJb81dxZZgg8/7zwrG50K2q38ly3T3aYy8ClGeiCPTpKrPGxfrYHh6NXIyxHjDMz
         29thjsDgqdJxWnZYenNYvqtRU2rCDjfh3x54INKmPE3IcGWBhWKAswR3oq6gRMbN81KN
         Z6xuYyHWAhsz/BPyYjD3nyiAlSeX1X9FsQzj0FfGPPQcGbA8i2rk9M0rWdjigmqbKtU8
         EkeA==
X-Gm-Message-State: AOJu0YzaZxiCQQ1Jq6FbYnFeudoCwqL5/V5eOM5I05Y/SRCLGJrEdT9L
	O4cEIR1kOcQ6P5fmhZXRu7tR9CKFfDXKkGWtlb/ATOO7DtvOPU2H3dKKskQLSb6D
X-Gm-Gg: ASbGncvk9S2+3aAwqVaBtRuRBQqY4WQ1YcjmAxCKBI3wHdz+sqABPDrnc5xlfBktGUX
	WdlRUvAZw20Tqpt0Qf4usfrOMM8lbb6dXa0mgyjwk7uLeGxejZ818RkCk1N3bbPVtssrPvGQ9Wy
	AuJQBaSsO9CJz6ElZIZAyhuJf01qsmc2UUHaDOyKyJA2En/Z6dl7aTA0Yoxqrq6b52oci7P/zUL
	qokVuCIzhbG0HFybHptb7zLGok2ylhHDpkOqDqve+sc1N0j3dvr86cT3Mf2c9Y0fw2cOJzkfgP+
	PYDdJNN8FAWe3gv6wLlYj/yi86jz22/KdmscABJUkRRNQc/0jo2v5skw7SXxhVvl4hhA22DoOfm
	4EMwr6U+QOM7QkppkeZ7UG9E2GxETwYTiDmhTWv+AQxwzDauUrca8u5/nw3dZ4g/JZH6+Pv8=
X-Google-Smtp-Source: AGHT+IHcGE7Yg1J8itqLj94H0W/xknsVBfYQo6pr4uko8Wt4UBtlHelqaO2VKckxFsNom77JnGE6WA==
X-Received: by 2002:a05:6102:54a0:b0:59e:68dd:4167 with SMTP id ada2fe7eead31-5acc680013bmr2657148137.7.1758875640687;
        Fri, 26 Sep 2025 01:34:00 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-91b198fe781sm328485241.3.2025.09.26.01.34.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:34:00 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-8e1d6fd99c1so707900241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 01:34:00 -0700 (PDT)
X-Received: by 2002:a05:6102:50a0:b0:520:a44f:3dd6 with SMTP id
 ada2fe7eead31-5acc83f7509mr2683165137.8.1758875640159; Fri, 26 Sep 2025
 01:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Sep 2025 10:33:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyWVU9Tzanq9OY2OZP92AMgYnZtYQZ8y=WsEiRxp6TjQ@mail.gmail.com>
X-Gm-Features: AS18NWCMHBoPzEWPgJF_9P05kxRIgT7Wocv9e9QW467a4AnZ2UK94rlvm-_zDZU
Message-ID: <CAMuHMdWyWVU9Tzanq9OY2OZP92AMgYnZtYQZ8y=WsEiRxp6TjQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_013402_623958_5A8AB5B3 
X-CRM114-Status: GOOD (  18.23  )
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

On Thu, 4 Sept 2025 at 22:28, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add DT overlay to bind RPi Display 2, both 5" and 7" variant, on
> Retronix R-Car V4H Sparrow Hawk board. All of display output, the
> touch controller, and backlight control have been tested.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: Build also the plain DTBO for each DTO. Each new DTO entry in the
>     Makefile has three lines, the DTBO, combined and DTB targets. This
>     is easy to miss, so note this down for myself.

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

