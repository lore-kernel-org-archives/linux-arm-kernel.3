Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA76BE7E350
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeTldaeFKLb1jw+lVjLCkjUpuPTt3MmHsJN8YKLGAfM=; b=wxEnWtEr7NeCWRX/vZzi5LUimB
	dh3by8u1kAloNOhlwIACHnSZI661FM3Rf7msUclve8D1w038lIiT6eYWmNSGs1vKyssPpYOPrbxLC
	7QjKiBVupDy1Zpglcrrh3kPWExpc8GvePqcxjyZ9Hb6sGpFeTMQX+Vx55qstylIazGuLXp7BAcfYJ
	whM/fBgkCpA5dJs29y/xt2foqt660vfzlKf/fBhThj1AokNHO3XLa/1FmjfmVeo6FdIf9NFSMYB+X
	6RyUQ0HflsjuQp0RfQqXiBVn0s39wfXF+D2dr76qkv8KAHkSVBGSGZqfxBHrMJdjsP790R1es8Wbe
	CBcDqrjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aQk-00000001lbg-2gld;
	Fri, 03 Apr 2026 09:03:06 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aQi-00000001lao-2JtO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:03:05 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-60591ade110so1009036137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775206983; x=1775811783;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeTldaeFKLb1jw+lVjLCkjUpuPTt3MmHsJN8YKLGAfM=;
        b=UfnMWWisUnnrceMq/Nk/b/Q70au4Rj5vwwoFNCUFm3bn7/UTtr2o5mYKAEPmHf8Wpy
         dWP1Hj7/xKwZudbrfTb4RqMaajl260PFy1pMhD0hZspZOEfy5jWMx7jIX+2zpAqGqksQ
         FzD94jx7k/S4wC0ozTybFNyJ/UcSDHGR6Hmv/2ygMUZAuJ0glezQ27L+0oNJ3VkU/1Ux
         RSzXYPuLYRqGYXfBLsIaN57iza8R2dg/kjXcn9y1QoMMug644EqKa88qlDdwCS+VexRf
         NkKhGpuN0zebdsbWXa6rAJwDds3AyGDKwi1998Eawz86dPSlWGZ3TrK8bfSNrWRekXlm
         myxg==
X-Gm-Message-State: AOJu0YxOJYfafTOTeONlh4Incfq56cevYWJMTBQjAI60z5BCpE6LUuGR
	jHSTLNQmCYZ5CjvqI5lYFAUV29DtnwyhSuZSM9uqLiqapqtuo1iIuakKVWO59kCA
X-Gm-Gg: AeBDiesauqRSSlruzwmdICDU96WJ7CHiLe7e514xlKhh/A0rr8aGtAG8gRpTgM4gAD1
	+9s4Ajqyxu0D4w4XWkSHYrh4WJtxFq2I3INeuyzF0mXn8tr5fMNX+BSNbgzS1a0DTvFo8/ihoxR
	Sal9nNyCB90RoS5I0deV5zVFnie0VstWcqMPpzY4ZyTkejBg2F7qHMBhp+AChMUUXzD+HoKCby8
	tBpEQyCftc4xgYJt9CND9rii3083EZq9nxC06wDdAdgi11qKNdRnGMNYuNqHF2BwugDsvQ4ACKi
	pWblOp6UDqLUIEEwAJtDTpxW0IvfDebjMzFlc9mYqT9YMQbz6Sc98yUd8iQKjzedg/VyRfzfuZs
	FeneJbkx+2xF0LqUqtrGNQaWxNPFJRLYXqX73zPrWXpz5btWG+3psUpOGn9U+570gHHN2JGfh5m
	QwPkk0WHdAhFKmre6Rf+0U75RK62igLwuulW4Hkq0pM3N0yod2is4nwYOrXvpX
X-Received: by 2002:a05:6102:358d:b0:5ff:be25:894a with SMTP id ada2fe7eead31-605a5139644mr879425137.32.1775206981441;
        Fri, 03 Apr 2026 02:03:01 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-605b214b45fsm586838137.5.2026.04.03.02.03.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:03:00 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9539d9f1675so1088236241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:03:00 -0700 (PDT)
X-Received: by 2002:a05:6102:801a:b0:605:8280:5e6b with SMTP id
 ada2fe7eead31-605a5006639mr842406137.16.1775206980479; Fri, 03 Apr 2026
 02:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org> <20260326042411.215241-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:02:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWrKfQSO4LHdDG6KV5tKahzpxN6073Mz4kjtF2MQRH_Q@mail.gmail.com>
X-Gm-Features: AQROBzDCJPmdFGO3WLCOdZ77NkJ3IqtNsdBGX_ONT98Xal23qSXaiQziWiGG0kg
Message-ID: <CAMuHMdVWrKfQSO4LHdDG6KV5tKahzpxN6073Mz4kjtF2MQRH_Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: Fix missing cells and reg in
 Salvator-X panel DTO
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_020304_590404_5D030B20 
X-CRM114-Status: GOOD (  17.26  )
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

On Thu, 26 Mar 2026 at 05:24, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing cells and reg DT property into Salvator-X panel DTO to fix
> the following warning:
>
> "
> arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
> "
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

