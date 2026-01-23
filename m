Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F6CD74EC2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 13:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uRZVas5P6xxkBpdwTHJQR+xs1A0EdTWP84ona+zohk=; b=JX6UHvCmum8nnNHgrzXQXnNO+o
	jgB0Nic+i2B6Z+8/oBlqFMQlHoVlSF/fCtr/PT3iCHCFpDRJIkRBjWOTV3EhgI14iPnvSWZPWNTAz
	MY550VpUYNRw4AbcsLdaaxru0DuCqsrl4zyyAo32oJ/UUaXRr+AZccfjTxlywA1swtd62FtHPlufK
	fEX1iwymn+ewckn10759xrTUIhjAb5ursridDSxYBgc2Xjb/MOJu9iFMchtfI+Vd84DOj+4vnd8xb
	v69zBWcjtMTQj4UuZ6sRwxNrybZX9ADUrv7nHqIeLwltVZUv+tEu4BzfPxKcftW4Dl115PzNzbMeT
	9YU4bsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHE0-00000008xmN-33t4;
	Fri, 23 Jan 2026 13:29:20 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHDy-00000008xlY-2MMY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 13:29:19 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93f64ae67dbso534626241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:29:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769174957; x=1769779757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uRZVas5P6xxkBpdwTHJQR+xs1A0EdTWP84ona+zohk=;
        b=pfi+uDN2KIeps89Y7So+uDmsTuxZN+bsntCsv866LcR6zRcvrJidztYZa/8IFwI3UW
         SBUROr5oujGUJDv6CYcX/Q2zgtw1aeR/IKMYV+uXkS4RYn/G3zfwiFxxCCaGTjnnvX20
         43MaXH9c7o6NBWS9QDylhEyK5/WuocsTU34a9BwpZb16yghfHbPSUMPM32b0gBjnQL87
         GubM61vkf3TJaC94F6LUMXAf0+MPMV14nLhKxaioMmeXx08wqtYwnspDQA1TXC6RevDi
         N1oRvIxnfJZHacffOS0VuwCzopfHMsgTNUubtnAvTkvMqMfvV9BhszmgEDZDggSMi/2l
         hiuw==
X-Gm-Message-State: AOJu0YwXqiFc7HO1t1OlXW6NeRJL499PFQxVeixhqBIAjrTDdtlrNjJF
	LWSksRFZuGF9kZqRLqIvjlUhHRtqb4l3iWCsYIX3xmjpjywadrbuMpmZvld7PiNW
X-Gm-Gg: AZuq6aLyUGN1m90mL5PfwxDmbAOq2Ds7Pf+AzcCgdIfZN019LvuAveSzgpAMqDLW9pX
	5klqbDqb2aL3k14v/zqMohQEpIjx9YdaZUbg5CfNPKTjRp3N2OD7e0c9BWhMdaDb4GhiBUfHksW
	JdGljT/tP6YtqfkcY2NAWdC9pZUXd2U+z1tGnX0O5cAPo84I9iw64+Gm2SQKzjwt0rX3h7e1QP4
	4d+7wcDYdN32Iwtdrw0GEBziSGtCAAnPn3m9vhtHQ73KV7cqMZK4B/J64mvokSeyBiYQvsyUaJo
	xDPCUwT3RzJ+aVfv41IIq0mTVQnRRUzF9ithBZ6Q+klOPPRRLRHQH2bV1uuSosE+tBEYo2k3KpU
	KT99usO7MzXbdXI/Akft/v/PBRlOvsuvwiic0Hp2w3/RhyN7k2GSfhCNNjueqWixKyzwzBMoc56
	LFKOxBbP/FPfFasqlsJllIkM4slXFdaM1WqgiCJzqLisb88epi
X-Received: by 2002:a05:6102:292c:b0:5f5:266a:d8ac with SMTP id ada2fe7eead31-5f54bd5abb5mr848625137.45.1769174957067;
        Fri, 23 Jan 2026 05:29:17 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e2aa79asm503659241.2.2026.01.23.05.29.15
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:29:16 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5f53021703aso755846137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 05:29:15 -0800 (PST)
X-Received: by 2002:a05:6102:12d9:b0:5f5:5c89:12e8 with SMTP id
 ada2fe7eead31-5f55c891584mr122473137.3.1769174954825; Fri, 23 Jan 2026
 05:29:14 -0800 (PST)
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:29:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWW6KwSXqKkYBGVDpbhSn+eznA1Y1-9iPs4jR9W9pJb3A@mail.gmail.com>
X-Gm-Features: AZwV_Qja41EG5GwRG8B7m5dFnkBsNMOHUZuH503OCKweOMnCriK-91TiyZZrpMw
Message-ID: <CAMuHMdWW6KwSXqKkYBGVDpbhSn+eznA1Y1-9iPs4jR9W9pJb3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] arm64: dts: renesas: r8a77951: Describe PCIe root ports
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_052918_594928_3DA9D1DD 
X-CRM114-Status: GOOD (  17.39  )
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

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add nodes which describe the root ports in the PCIe controller DT nodes.
> This can be used together with the pwrctrl driver to control clock and
> power supply to a PCIe slot.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

