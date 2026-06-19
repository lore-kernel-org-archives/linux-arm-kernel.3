Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426EDCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oy4khWhmG8SG6J19dWJnQfN4DUKYCIX4D5weoKLMQgs=; b=W3WvJZyj4YfY9l4tQZWSNPtBO/
	EYqad3zbCGiKoTSGpvMl2LJUrOWsyc0wjrqp8riyugFD1m2qn9Jda2d7bj3HiYznQz3Pa3g/lnB4/
	bnHJhbo+e12cB1p8eLs9U6J3eH174SqorFPrkfT5yqatktSD+4SBR+CdfyVL2kitW5pRkfurSMDZ/
	3txrUjydqkrBIx5APRa1ouahKLGLkLultOd1cDiwfSimsx0xPOn8355HQBasAY5XWWcMMl0eCne9h
	J5514Ee3hvyujzHEwGSbanwwFE0VQMrCCYrS/YOV6PUchjMB2inYFF318eCuuhgxOeWEc8QWo3SPg
	yJva9BCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waa6C-00000002ZWi-3bWy;
	Fri, 19 Jun 2026 14:21:36 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waa68-00000002ZVk-38Vo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 14:21:35 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bbe617d624so1245885e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781878891; x=1782483691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oy4khWhmG8SG6J19dWJnQfN4DUKYCIX4D5weoKLMQgs=;
        b=iB6qsBb5O4GXwnsqLc1P2E3etrNpD/DAi4fq+w89JstsqH+TOwqdtRm9MCARuNAN/R
         /2uoKTx1xtVIym91U/8XSdLWQGtin6jOXsMpkUmAz60wpYHQeAiP6FLyn2/nFnadnsBK
         dXF4wCqKCZYt7Z0mHY+FEMUovrq5S8/pWj17OrfC+kR2TCmaABAM4tTTXWP/K1CYYgft
         EEPG58LonDMRq3kdGYie4LiRn1H58Qm79FuKex53HsfzCdeWFcPH5JG1wW0RPm31LC95
         x4o7a+NKY+QdAN9WETivjb/zPegZfqWPXDlCIausPEhb5x0yZ6KpZb9gU7LFMTjZrWhe
         Xf8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ax4eRgs45ErUkRfUpLmaSMPWOxXqJlfC0b7VIy/22/9ejNv8T8I2QbtzEeOlhhquMmMTYdDrMEzulmSqEVbVI@lists.infradead.org
X-Gm-Message-State: AOJu0YxTk04gsIlTbyPQStLjredKdRdz/FbF24Rzzv9Elr+uYEmO9a5H
	jCWB92a6J7HkRMQEoZTdUKr3Wa6o5uMIjwfzdhD9KqTWhERH61/pKSsHUlMp83SC
X-Gm-Gg: AfdE7ck+wqyN3V/c5fRwQJq7hZ8csz8bSDzEzS/qcrgq4ULRmedu8WvBHZBTosaicux
	QNNU+LkSpU9TV6fAC7rrySVmt76yOggAAWeP2NACYDiC4Eyzy6rcvMek89CnImMo5wSfq3w4TEZ
	9QPyCK7gJoRHqSSPeGGH2Mwey0q4CceoXkOG8CtPY1Mjr/S55WPyoVEvsxPsBNEnrx5auskmePx
	nWw9L0fNwxVeSKZV6GqQudHJGBuwer6OX8ybYj42qSwEZS4Wp4L4T8/rSEgvfFhLdsgH0WAy2CE
	ETYjxwQHafjqjJ8VDh3prxhWZpYMgdNFFlhJgZj3KPaD3im1gzMLScACy0/lRV8CWP/DI0L375Q
	dSKg5m36D5MUyFgeclgaAHZnP/hfX02JjYSalfeS614VtpBpTxB6AC4Gkjcu0tX9RAJ4oEkb70j
	RyWjAzvMC3lbwa+zCGsIu41I8ZlifnTQcumt6vW80/XlqhinRPpw==
X-Received: by 2002:ac5:c9a4:0:b0:59e:2a50:39ab with SMTP id 71dfb90a1353d-5bbeaecd481mr1147071e0c.2.1781878891079;
        Fri, 19 Jun 2026 07:21:31 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbea3ce355sm1955147e0c.15.2026.06.19.07.21.30
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 07:21:30 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-966db0b76daso1996835241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 07:21:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9K/rhVlHIxG9gaAc7NyIu7CTa0IJAZUfZZYlv+/QiNe4j6VFxBlstrhUYm+khFlXCBlKnB7r3OMtVDUOhafhdj@lists.infradead.org
X-Received: by 2002:a05:6102:ad1:b0:6c9:d9f3:1e20 with SMTP id
 ada2fe7eead31-72a293dfd7emr1104952137.15.1781878890690; Fri, 19 Jun 2026
 07:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
 <20260429-defconfig-v2-4-e4ed4186028b@oss.qualcomm.com> <CAMuHMdVH6-5ZAjTyF3m=wF5-XiSDqwcgRhZWxJv6y0FoCnk4MA@mail.gmail.com>
 <ed070807-d2dd-4f0b-9ba1-8d2c8c93c30e@oss.qualcomm.com> <b04972c7-2c5e-40fe-a8a6-7ade300cd4b2@app.fastmail.com>
In-Reply-To: <b04972c7-2c5e-40fe-a8a6-7ade300cd4b2@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jun 2026 16:21:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnR38X-Baqzb0Dm+Mq3=LH6RFt+7=wU46DrkP2gqiWbQ@mail.gmail.com>
X-Gm-Features: AVVi8CcX7ozhPh8JhyNR7a8r_7a1qss6QfZz7-KfzrH_7gCDXRho6nLaKkb4lJo
Message-ID: <CAMuHMdXnR38X-Baqzb0Dm+Mq3=LH6RFt+7=wU46DrkP2gqiWbQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: defconfig: Drop unused Ethernet vendors
To: Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_072133_138777_4B3083D6 
X-CRM114-Status: GOOD (  24.18  )
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

Hi Arnd,

On Fri, 19 Jun 2026 at 15:54, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Jun 19, 2026, at 15:11, Krzysztof Kozlowski wrote:
> > On 19/06/2026 12:12, Geert Uytterhoeven wrote:
> >>> +# CONFIG_NET_VENDOR_ACTIONS is not set
> >>> +# CONFIG_NET_VENDOR_ADAPTEC is not set
> >>> +# CONFIG_NET_VENDOR_AGERE is not set
> >>> +# CONFIG_NET_VENDOR_ALACRITECH is not set
> >>> +# CONFIG_NET_VENDOR_ALLWINNER is not set
> >>
> >> [...]
> >>
> >> I am not sure this new policy is a good idea: none of this affects
> >
> > I would not call it new policy. Just an idea which got accepted. :)
>
> I think when we originally added the CONFIG_NET_VENDOR_xxx symbols,
> the idea would be that we would one day change them to
> default-disabled, but that never happened, and generally causes
> more problems than it solves.

Yeah. While "make oldconfig" would handle that fine, all defconfigs would
need an update.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

