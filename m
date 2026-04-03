Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0245DE7E35B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qGwkV+UjFh3ES3arE17ExSNnkFY3YqomwgIxcqNhunY=; b=B6WJLyQSRP1fqnqBdeDy/zx1SB
	qrf42lwLP7NgA4aF8c6WX29X8Tsh/7LaNAZ0FM91EtyijfipUifLTPC1+BCLwOlVzYo4VUENrpdEN
	nYNsjLYPFDavjzvWt0oOVG7+AM/1aRV0GIYnVKgzaOvwDuKDgIU4flX3imEMTGpMW00FXMC529jvD
	qAnWh6df9MTknl2+OYWYaDBpEOV5NV0f0QmTOztHD1QBSdAvLCS2Ts37Tjl8dWUFDUUlMWsRFmpd8
	nlh0qHejF/g1Y/+2U0eexmAkvYbiI0+l+SIMujdHDzNfOuf7it13VewJksOpi+TAuYmLtGcI+N5JR
	/8fZ34Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8alh-00000001niK-3mow;
	Fri, 03 Apr 2026 09:24:45 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8alf-00000001nhW-2AV5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:24:44 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-948029fb1f2so540366241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208282; x=1775813082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGwkV+UjFh3ES3arE17ExSNnkFY3YqomwgIxcqNhunY=;
        b=DAI72pE19fDgtJXEfL4nVWKAxnVETtzbFYm0lYghTTlvHDqRqBbtYqs08W+O+/Z1Hc
         92rSFsGY32KpXKOzgbAgsAH04NCWYU4pHAISy2tM5uxGwy4AnEtqtNSgD2XD9tYshSpH
         l+SaZIq5PvWNpd5eosKltrQKcR2n7fjhqjhOcede6rIl2ji9v51TT+UEHXbTQFAvr3HO
         ZkO8wUCcW4zU+h3sA+si0RtjCDS2C157w354tZoeK5F9xSoYUjAaEMO2WbbEyqHXlGwN
         qNU5WnMcGL8mbJY2ouY4k2WjgaaoCHUmaqlakM8qGvL/zhzx5QKI+Zv/GnMKfrzLlRsM
         G57w==
X-Gm-Message-State: AOJu0YyAq9IpeV6tFWBTiULwuEsH9OfomzMg4sYKC5g2vKH2ePsycn2R
	+JZgFwkspRom2TEeOOlKgCRqGHviw3rpjs1TqBKIzjVd9J65wDW8GUbMplooPvLR
X-Gm-Gg: AeBDievnv9KZbLbAEPnzNuHVxbZNspjKAEE0t6An3/iTx668ptuC61jkaDv+CYpk2Km
	lvd3JGf1CRYzpXP+BiSFWlmhz1OyS/cxfaiHZd5oKsUPnY0VOWI+CNhnkBSrhyTy/s+J7JgS4fb
	WphQCk1lbxWRo412uAQOOGsTAHQiSCu953MFrMIJ5T+9XH4e1N0vVtWWwRklswNr2iyL7cbQIb+
	vryqaVr6YhNbuYVGjGRKJ8sUSQ3C4UoD4GO0/qhdxtRCIp19ywsDlX7pg5YnFqhyjV9QBktndg+
	BkZWWqMbzIVighJSJW2Qv0k5Rafs+1OFsFSGkJRWrXVpt1ZF789V6192JPNH2T4qUogTZS4l34U
	PEq/tkLQg9KdnLyDCyKZhODUaTiqmWmimVCD0IDunC4qZ52sl82NEUFCZap5ncC7zj6T/GR9c7N
	joDWstJ/oA2kRlZuSG2Bcvb4XXq4eqAXOS1+pxWaUZE6McFMw9I7jO66q731Vrp2Fq
X-Received: by 2002:a05:6102:2923:b0:5ff:8b8:9f89 with SMTP id ada2fe7eead31-605a51de223mr738633137.35.1775208282238;
        Fri, 03 Apr 2026 02:24:42 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605830999f2sm6736665137.12.2026.04.03.02.24.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:24:41 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5673804da95so745242e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:24:41 -0700 (PDT)
X-Received: by 2002:a05:6122:4d19:b0:56d:9479:edbe with SMTP id
 71dfb90a1353d-56dab828397mr717575e0c.2.1775208281444; Fri, 03 Apr 2026
 02:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:24:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTMoGsv-7O_FvUd1pudKc5aPE9ZMUsh=WJVVEk2PwP5Q@mail.gmail.com>
X-Gm-Features: AQROBzA_E4MRqEH0wurp8MczanbrSi-ukqv2OYZut5h7OMTTpNrF8PdeZIFzPjU
Message-ID: <CAMuHMdVTMoGsv-7O_FvUd1pudKc5aPE9ZMUsh=WJVVEk2PwP5Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: renesas: rskrza1: Drop superfluous cells
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_022443_553417_8B13BF52 
X-CRM114-Status: GOOD (  15.83  )
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
> arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts:32.17-72.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

My bad...
Fixes: 98537eb77d3ef185 ("ARM: dts: renesas: rskrza1: Add FLASH nodes")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

