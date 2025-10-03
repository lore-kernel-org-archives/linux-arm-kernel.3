Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C713CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 06:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QYI64cW+XHmj+sby6MngC+206bn5fsu3IzSbvpr/6s=; b=etea6pplfQF1vXNlKFec4NeLib
	jgA8Fa6Ix2uy8eSWEMT+niXst2rMb7dWa2h/0kZOQ8ok32B9AXgpKFKnIHkVkJncf9w8jM73qFfvB
	eXXedKGxbZ1V55NzTafbmtSABL+qryHDjRrJ9jZbtOPoWYC52Xcbgm3db+1yl0/LtIbsiObekA+e+
	zK21cU752YVLSafPYmjsOAsjw44RlLgeWAzTtpjKUNMsKOiXezlKW5KLL6qXjk2TMjoTfkNfZAcGm
	+0OzCr9xSLXJKyhq/YqVZNweMJg76hP3WggVKFwY1Q+/9G9T1t5Vf1N0+of5Qi86lYXFi/c9ofkup
	ocJdmLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ZdE-0000000Bky4-16MH;
	Fri, 03 Oct 2025 06:51:08 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4Zd8-0000000BkwQ-0QQr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 06:51:06 +0000
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-890190da557so538940241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 23:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759474261; x=1760079061;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QYI64cW+XHmj+sby6MngC+206bn5fsu3IzSbvpr/6s=;
        b=sHCkmNZ5uKU6SZ9Oxe8AxVbJHFStchtEW7l8Wv+Nb/byfJqQybkNd0uYCrpGTfNbZs
         WX/cBGqc+LuEYiQDeves0iFERvA2aGvL4BYaruxqV8g/CA/BWL+z/jggGD9JTEAcBxck
         nz+gdjHeg8qMORlMhTEweLooIt4zqwFzd9QVVgjOwMz4m3ZNYO+KtBYUojUe75Hx/Cmc
         +K+aA0NKH5esyQLknAQUMCTXxDvAQz3Mxq0eGVOv2zcpDLZsZd34Mpo1bCx+ljLAtNEf
         jvqZ/G1Bj6rkVeh4G4121GUkqrDwIljvd+cgpRTikctA+0UgoVLQmffmGyv9ueieUIxy
         JHdA==
X-Forwarded-Encrypted: i=1; AJvYcCXKoBTWI86h09NFZAGOynUIt2fQdUpSdJrCu2UV6kPIf3cyA9UQp5HQI8st44IHwuEYFWZrWc0vMveJorSy5zhL@lists.infradead.org
X-Gm-Message-State: AOJu0YzOpmw1cCJelQaQW/BTxZOGBDAvPbKmpi7KZwprZlIXQD1t1+FC
	QhzLBw/Q6507BO/cJMSJWTX4pXfZvQUY+GPi+KPhYLKDuBZhTw7jMhDkltD/Gmk9hAo=
X-Gm-Gg: ASbGncueGrpfDr4wr5uowrp4rgNMHahIWMsiNlI1XE5SiexQe7zGc9bNYvV5NJVPbtO
	16OAlSSf+QQesfnlfxiM6r/Yf758auvjzvIMX9lBZZimwaJf0dA/hQVfkl4x34AHiopW3KnYhOV
	8YhFnTBPRRDH9RZO7aZPECnNbrG1SYRTZhqaBsNdH6z5psw/wXAAiNoGh73EFRvdF2+sfsCCO6j
	x8bx41HwPlYc1GyW1zeiA39fLFDeXk7pHtNDt4VbTqPuSj+dYaGnZkf8xpyNMWmN7RenHyGGVUe
	e1hM8v6GcVCw4rmuz9Zpc4/IPNXNqjjeam6XCbn+lk35Ty70xPq18UMhcgtvuo0Ju0mCukdxm9C
	7PO/YwcVM5sRzoLWqhaFJkWfgrSWdjUQdeDOsgRFZnRJeEpdw0atljkPYb761gaoA+tf796faIo
	BnKf90gs1s
X-Google-Smtp-Source: AGHT+IEbwRpzfVWpUs8vfZemgIvMcfgOftNHleMpZZ79uyTTnjcwZ/pEQIOdoTPavFcfObHlB6OMog==
X-Received: by 2002:a05:6102:8015:b0:5a2:8ace:c921 with SMTP id ada2fe7eead31-5d41cfd5822mr614789137.4.1759474260667;
        Thu, 02 Oct 2025 23:51:00 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce69b52sm1005993e0c.12.2025.10.02.23.50.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 23:50:59 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5d4018cb45fso791041137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 23:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbhj4DJ60oCaSXbsGeXgNG6cZoacCI9WvG9cJH1K4cqq/Urtxic5+Oa+bBg3hcIDMGXwvDVv0r5LitS8oiL6r4@lists.infradead.org
X-Received: by 2002:a67:e70f:0:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-5d41d0e7a0dmr687881137.16.1759474259285; Thu, 02 Oct 2025
 23:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251002142639.17082-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Oct 2025 08:50:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZke-=yvKTYdj_K2iRrtiQvw2_papQr92p7qFfMYt_qg@mail.gmail.com>
X-Gm-Features: AS18NWB3eHLy8T1jBKvTcs-a-FuOQsD2BAEeM1FO7vparrzr8v4t9PBKVzDwMXY
Message-ID: <CAMuHMdUZke-=yvKTYdj_K2iRrtiQvw2_papQr92p7qFfMYt_qg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: physmap: add 'clocks' and 'power-domains'
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_235102_136924_CA4C432B 
X-CRM114-Status: GOOD (  18.47  )
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

On Thu, 2 Oct 2025 at 16:26, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Physmap supports minimal PM since commit 0bc448b49e8a017e ("mtd: maps:
> physmap: Add minimal Runtime PM support"), so support it also when used
> in DT configurations.
>
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

