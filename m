Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EF9E7E345
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWOTSXRsWHBcjZnGGoJtQR/fyfNuqFqVCJ+5pGTBWnw=; b=nUL4IJmRRLcJ5Txt2QYWYsCWaX
	GbUtpgP129AkBSiFYF/ndvQVUexqjpaiaVpETIPR07KOS/oj3wrlDnannL0wHD50prDJsAhytyiqk
	AaXBwgbT3qFQhWco+Rv0dAjGn9PY5vXUixtGIr5MEnti3x1dQGOqkiVT9JLWTOPW83BEEBFMM2P7j
	11lbE5ny8FgDUZYFIS99YtC0JZsHC7Wy9MJJG5pgJBAN3FLCNUCUp1gHMMTpk1g4hogry+nwulVvr
	6w6Syk8+nU+zC+hNVBN6nVPfeDwk2ihhkp25euJ2fqU6kpcCmGsQxNqywafZahZRSK2xyWdIyUpex
	9DlEj7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8akz-00000001nYV-2HRu;
	Fri, 03 Apr 2026 09:24:01 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8akw-00000001nXo-3186
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:23:59 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56ce54c8c82so646788e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208237; x=1775813037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWOTSXRsWHBcjZnGGoJtQR/fyfNuqFqVCJ+5pGTBWnw=;
        b=Iu49Mp182xEiHfH8PEw812La5TCGdqg/N31iX6CjAm5P5DCR/oiCXU9cqsHwJIm952
         K8r5Zjy13ItyPaxidKDsV96lIM6sfYig1rNrCHoFxHMzrZOvhEbhIIJ0KKpwWJ1mdBnu
         x7gs1EtNM7Z5OVs9GWIFSEuzZDsVGYxrRVRg+Jx0biz9w5Tku+MAbekI+my7aqDepPjw
         yOUbbWQ+3w54mJjdZoQqjC0Cj2f3nL0RviYtEAhwvz2A9qXNI0J1J25fZl0tb048iNlR
         nuu3qTWU+L6FiGgrQ4NDRUHBmagrQvy03kFxQEAD2LoC7o0xxPNZMWLhp+RsGn9DVf5U
         6dtQ==
X-Gm-Message-State: AOJu0Yx115pv7ig/lVMwNrwlx2w1y1/8cwKLOqeXIJJo40JtIy3Yqb0G
	+vEldII3TZf79sHHYZ12VRz4eT774tenvxyAxZgcDevCmbNeuvvM3KlEVFypVLyZ
X-Gm-Gg: AeBDiev8DRYDI9lUXZKpC/cBFm0RH95QqPmRsx+NP6aOfjBo897F1FTam1UaNcuK/Su
	8pqU3BQ18CgIMbcbnPqLrKK8pqus1FxbH7gox3VRlRkfx5fm5Un0ZGXLZRGuW4/BAAym01Ic3gO
	0mPGXVtl/KJYptgSdV72kkeXWEV5xHe/m4h+woDWDIju/NYWkZ8MU8hEg+mH/EmW4FirQoYqh3I
	a+BgGJQ0Rc9apE2MNT7CuKZ4NaACnNNlRVFjC5zOdvxf7DF8dzzhdVxEf0ELtdg3dAbNjjC7K3T
	nXCqzgHRtuV32MPoTzYg2eos3Ztw4QpD3dNaWdqsIFXLASbaAcjwsrbKATdTESYlhZ5hI41oOSD
	eg9fdPVBTQOo8NNY8irXWUsIQOrmLwrDWglXv//gIm5SNADh9BfWns4pl4DyLz7SXRPCT8geDnE
	TGj6JNk071JUuRL74uBKepob2NozB1oS/xc4th79f103xcTBsdACCxtXR8GU17QKqUVjevkhM=
X-Received: by 2002:a05:6122:d1e:b0:56d:4511:9367 with SMTP id 71dfb90a1353d-56dab6275admr733855e0c.0.1775208237425;
        Fri, 03 Apr 2026 02:23:57 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9ba80290sm6462817e0c.3.2026.04.03.02.23.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:23:57 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-60580b17793so512838137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:23:56 -0700 (PDT)
X-Received: by 2002:a67:e718:0:b0:605:6089:6745 with SMTP id
 ada2fe7eead31-605a4e54dabmr739558137.9.1775208236667; Fri, 03 Apr 2026
 02:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:23:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVY8ZDeh8sGJkjtVj5e0EquhwhqeCo_T=CTdnDjKdRWvQ@mail.gmail.com>
X-Gm-Features: AQROBzCrzWEeQ4kO2P7sS9dJ5S9Z5ZtuN0jTbygabX6Hc16Zm1QvZSNSKwYRCCc
Message-ID: <CAMuHMdVY8ZDeh8sGJkjtVj5e0EquhwhqeCo_T=CTdnDjKdRWvQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] ARM: dts: renesas: genmai: Drop superfluous cells
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_022358_764374_0197E8AA 
X-CRM114-Status: GOOD (  15.53  )
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

On Sat, 28 Mar 2026 at 00:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Drop superfluous address-cells and size-cells to fix DTC warning:
> "
> arch/arm/boot/dts/renesas/r7s72100-genmai.dts:28.17-55.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

My bad...
Fixes: 30e0a8cf886cb459 ("ARM: dts: renesas: genmai: Add FLASH nodes")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

