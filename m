Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E841E7E345
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQiSqxl/EeQIWuDkdITPLu7Bz6OtmpPC7WYHMXTOSFc=; b=JfcErxEkVpqEw3K3L7liJSwXgZ
	skHvFK3FpDT33pXpxTRW8GqQ70QG5kFovbG2h/83F7eQiHsLTsv/ljlbtB6rtA3x3qtyPERfeAqse
	H/tQeVmwpKj34SNgEwfLUhx8dowMQUEQr8fss3VQCtOud77dCKE9xpry/mMq5bPJhIezFQzBNaLzx
	E4zhqXHO1yyRL06JnB2ah2F9FOOGOY6fyKQznrtGUdcV9ywXksIJKsjcSdkjPyCuurKfdQBIXmz02
	WZ2NUCi8Tx01t7A4CLcnzjDnUquWY8cPq1kJyyeyFrvAGexKHXsrAawpoml946nZsK3Dv32ls0nys
	pEqIKIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ajt-00000001nFG-39tB;
	Fri, 03 Apr 2026 09:22:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ajt-00000001nEo-06X9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 03 Apr 2026 09:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RQiSqxl/EeQIWuDkdITPLu7Bz6OtmpPC7WYHMXTOSFc=; b=eK49susAS21oxeQWK9Xl/leT04
	WLUS6Zhst0YQ7e0di75zQ5hKG1ZGWFDk4IHPe4ihFKmtmb8I041OEfHH7GFDzbnlWBuV+IRJLhnXF
	UjveszzrAXldYTtNk1/xOjq5RYfTC662k0HyXrThEDH+N34pyQG0mwkCgyfkxyElaJpaB8vFei8OF
	Nxb6tMxvw5OtXEUVPKdSRYxSHwkal2zvc7paLCUBa2pdlNAZqkc2dYt8U7tityYAEbVU8krmgJfIA
	lIACM8HpsbHUGb1yzrLYdJgmzTVxDLC5wrtADdWqKqX5jXqOGT8/QA3DTEtXvKqE7NK46nsZjt3sp
	wKkpZU1A==;
Received: from mail-ua1-f41.google.com ([209.85.222.41])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ajq-00000003tdD-1DA4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:22:51 +0000
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94ac8cbf3feso1061126241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:22:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208168; x=1775812968;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQiSqxl/EeQIWuDkdITPLu7Bz6OtmpPC7WYHMXTOSFc=;
        b=q98vs8WPuYdYj8aUh23Zycu4FlnwgOkch3qtc2U1aJoVRbWVY24mtn3E+oHGlkkcP+
         3aDlDSDDlV2MiBXufBJeWNjrEx2R1RMpf3/rvVpnAnw7rY+PqGcgeRPHpM+g1SsWJ904
         /NZCKrHwYe02ls2TwMSy7u/+Eu5ntBi1Q9H3+Y8H+nWkSxE65CbNSuzCLnE/SFOE8SgK
         +c/V+LGNsXdxerZynvWRT2ug38sWrN4hFQXnHI8L8pjaQdU5q6TUGN/zS+W3oJWAnexZ
         UoPnhJeA5K7g3PbNFHxDR2v7MJBfAHIoAxokFhAo2oONnWCmnqPjnxhCzCYTVX8PHvh5
         kCZA==
X-Gm-Message-State: AOJu0YwWt6xbasWDLsQVBErsDlxucbYBmlSN6rjm8FHmbFKntzSsTxQh
	0vA+4v/IfytAOuItnNQ1P838wYaV89npgc+Y7Hlnr/Y93Hvcc0P7o7z3p2e4Lc1M
X-Gm-Gg: AeBDieueWtHJ5/BnUlq58ESmXOiuvuwA1e7YZqggOL65ud+NIS0SLUCYx5/xqvC6Hqz
	TwUGDPSzu/waaCCKYNdj/y1pY8YH/r1FXAi2hhMzNahR36CW9zrZ5uncEXpuX2s2/jyfm8gLNWF
	bnsZjVBA919DT/9qzjqvVRw6urCw47kUkj1RnerjgB73S4vbEV0I0h02D7OcW9q2Uw5GcVYGPE9
	TRcMMrOBu95v4XVIqi/ENWMoCWbomQLXUhbsfIBp9hLzOv4cpb8UFFOycQmMgVXN1//ZorWgZri
	wHnV2kQOZgAhWezP5Ufu/5a4IP/cABwNINoLDVNMqwgYleK7cc9uY0iEoslptnvHusbsPiyUPaD
	tLLd40ydz3lYgwPFtH3rSUVpohOd2w1t3RZ2gZxCQ1zQi7eyxstaT4EIzz/6TM1C9WTr2nH1TgH
	AUI5uSz65eBPf7ne5MS9d7jbrQ2FwMj0QtsS+N8YHv/sgDxFuLQQShKU9Qwrj5
X-Received: by 2002:a05:6102:5cc1:b0:602:813c:1b24 with SMTP id ada2fe7eead31-605a4d35185mr973898137.7.1775208168456;
        Fri, 03 Apr 2026 02:22:48 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb7ef8c2sm5709048241.3.2026.04.03.02.22.47
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:22:47 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-6057af134c5so1214849137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:22:47 -0700 (PDT)
X-Received: by 2002:a05:6102:148f:b0:605:85f9:453c with SMTP id
 ada2fe7eead31-605a50d3dcbmr853511137.26.1775208167106; Fri, 03 Apr 2026
 02:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:22:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZx2Sks_PqfUO5QRt30Sj4DgMc3k2zAB3o=UWgA6P1CA@mail.gmail.com>
X-Gm-Features: AQROBzDTpVIfWHVjgDI7Tc-gqwb92042C9npzZ6abPqPFd-FM0Csq_Yypvn33OY
Message-ID: <CAMuHMdXZx2Sks_PqfUO5QRt30Sj4DgMc3k2zAB3o=UWgA6P1CA@mail.gmail.com>
Subject: Re: [PATCH 3/6] ARM: dts: renesas: r8a7792: Add missing unit to bus node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_102250_425840_A59E089A 
X-CRM114-Status: GOOD (  16.50  )
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
> Add missing unit to bus node to fix the following DTC warning:
> "
> arch/arm/boot/dts/renesas/r8a7792.dtsi:89.12-94.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
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

