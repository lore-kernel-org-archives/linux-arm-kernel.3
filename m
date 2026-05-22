Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A3FCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=; b=W9eKBgQadsztYPMfPYgIuuigHE
	H41XvlalpRBPWWt4TGKoIMFeU9GjNpUpIhtPnD5jeIOrPERgVG+iZE4N3TL4ixt60YubEtARyTJzI
	ICQhjiAZ1+9GC/zifYnsp4wcORCdorvqCXd0fBm44/k3ge6Qr8KWFIHTPo/MONHYVVUdHYigJoIFa
	1rXBEVtSPh/k8UE/p5pyYsH5krSFNkjVWgQOHVxzcuOeukaD76spdr88QiE82rv2z0kaqm9QMwE+8
	mMgCyQpLC+PA13bJ+FKutjZ6oadLhKOKTIwX+6GfGtkT2BARIml94+Mz4mvQecaiYnF9pmU/k4JSx
	9v5aM/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ0j-0000000AzMK-0C0t;
	Fri, 22 May 2026 13:33:57 +0000
Received: from mail-vs1-f46.google.com ([209.85.217.46])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ0g-0000000AzKv-00t4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:33:55 +0000
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6314287380bso5335706137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456833; x=1780061633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=tKfWLNx0BoH2rys8HFUuNLqGDscomR5pT/3/MiGz3yLe6bp3L4ETWCAgrOq2/oc1p/
         LMc502zNUT/9EooIRicFl6+wIKxwveWdOKBY4M1U5bVI1WEmQjEJM2EBNfshoHAmVxsr
         XwEldShvQR94V/uKKJYdkrOxdFtN8zH6DCKYoFuZAXc0Oa7qJLxkdfq+itooI1bvnzvq
         /hTC3OGHaRp3R2FR6UinKgDmpUFsS2HW+9lIEVINqgdNoyMZa+ncvd9K8NT9BPPMrElh
         5fSn+vVLqqHPoC9iFlfLNUUIC5ifCSFohdm60p4Wr6XnnhxzdZ0pVq52vveXR8QagP8u
         tCDw==
X-Gm-Message-State: AOJu0YzivLsyZ9pbw4EiDGeHYeG2eGZVM9J3ezhVye6LyEh1qDSwXlTL
	Bdy9hdFIE5BLi2NVo4gMGBiIe19d9VANAFjP2HtHffXqnULZoa12q40k6fIamOzF0ME=
X-Gm-Gg: Acq92OGzev+iH2kHC6he/j/4Zn/Pi6nKf0x6yeRmFtStWc0gssjWkVjoVuBj56o9vzL
	FYCtcClmxKewGbCKyIV6a0ScSNeV68q/pcL+8C318Dk5F/xjyN9B+mBtswKdOQLRRqtG8l3qD++
	eOVZzrkoom4gswkYG6vuAiiMSsla5NZrdXJoH8LkA9ZrfFheZR7dFV5Dthvzf47AZtzmRYuIvzs
	Bppi7AMMKk6YaGNvZSryQ7eH5fl6MbQS/LPb1vh7JkCiHv+cC3FzR7aChYGR/hpwvgj+FNkY97T
	vZbN3xjcQkJ48QfntTWAg6iUXPLVthzuvub4jWhKzalUF7ny8IR9YfGl8nmsx4U4zoVi/t1/lS+
	cY56cJuyK2wn+03Z7r807E9Up4SK0gDcLl3ZzUlLkWY78uihCcn/jRM7dWkfkgcNe4KIrBntRYJ
	4MoPRkzlZHgqqNMls9w57+/2e+bMEndzl2tEYC1VHsfKVrXvOdTWDtBwZIUc43VaG4
X-Received: by 2002:a05:6102:5114:b0:633:7d88:c77d with SMTP id ada2fe7eead31-67c90853280mr1828907137.29.1779456832699;
        Fri, 22 May 2026 06:33:52 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fc9a0fd00sm1383564137.0.2026.05.22.06.33.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:51 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-57516bb40b9so5308395e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:33:51 -0700 (PDT)
X-Received: by 2002:a05:6122:3d0e:b0:575:22f2:a1f with SMTP id
 71dfb90a1353d-5865f726da6mr2054383e0c.4.1779456831104; Fri, 22 May 2026
 06:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org> <20260504225704.115125-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:33:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVeGsp+g2mGu7EQo6cN1v6-ectETVU+PtWUpznHboS-TQ@mail.gmail.com>
X-Gm-Features: AVHnY4KJmR-uF4CxL9myINVO4InRW9Xy-V6WIFG-Jxn6EItYI51QzaUkbyalZ7o
Message-ID: <CAMuHMdVeGsp+g2mGu7EQo6cN1v6-ectETVU+PtWUpznHboS-TQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: salvator-common: Rename
 clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_063354_044802_2AF4E271 
X-CRM114-Status: GOOD (  16.49  )
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

