Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8F21093168
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yon6PYtk4fOFlVLRxERqANp3qEld/pf3TJ4Zh1FRxts=; b=GfYKAG+WNJf5u0XwWKLFDlzdOX
	sF+4Y8T1ftaZhN4zqL8a7onZSuiw62+EA04qx1scGB6yD5GtZkFe4CjF3kk07mtqLpESe6qfiEGTT
	owPBMDHFSfgd54HsMBw+MdNxbsn36Z9XEOqRZKBzh/bkaQOGHEhxBukvO4Ojwn55c+OjHoJ7dvPob
	urZY5JzgxeoqrZUr8WrC3Uxkkvz80EMm4UVq5OmyC6n5atYW71mofA2Z9hOL0WzFwFXLvsi2sugXu
	CKZgTqrozTMHn1ms3EPcnctSa1RLyYVayr9xey2GEwvZwp2g78y4QHe2fkjOPOs4/gAzF02WQeV9r
	bP+QRPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5P8L-00000003Yrs-0Smu;
	Wed, 25 Mar 2026 14:22:57 +0000
Received: from mail-vk1-f169.google.com ([209.85.221.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5P8J-00000003YrX-0o5P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:22:56 +0000
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56b8804f37cso2434270e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448574; x=1775053374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yon6PYtk4fOFlVLRxERqANp3qEld/pf3TJ4Zh1FRxts=;
        b=jsGCO8W+kaBNnQPy18bOGFN1cm3sV+r7AjFVoijdFtDiFknqFZRWAa3oQuSz40rAgf
         HErmTlTGQ8jKVLn2a5r3JXeezPC/ULerx/y6Va14jxWjI+NJd4xoS8XQhayiiOTEqFJW
         l8zZcsJSLtmCJBxI347mbc2IyiWKRfX/XDvgv5jgpwpiBOq5OLagwWokOqChJSxr5VnC
         dBQBnO1Le6vtiLarK8A4lvENItA4bWpA9DJx/JG9SB/5r9mDZtyTlzd2RZQgmyvuINOf
         M0dIZIpfEjKLIca+8aLlzBMH3MWdCEaeiv2iOUGlXxq/lS6AT68Ol4UthUfzteGIu2+f
         xWmQ==
X-Gm-Message-State: AOJu0Ywf/Nr5wEuAY3Inq3v2RW8g2JooCzemeoBcMYPAmlDgPEmx5FjM
	oYK0+xXvfDtIwHYL5Dwgx/FGLvRSEi70CUKUjGuR3Th6Uyi8zVBgpWCx2Kgr9YQcUjA=
X-Gm-Gg: ATEYQzy0wHqkCrLy8R+udK/WMAbn20NaMWOl11HVLi7SWQqcT56ls2EHkcHRulu/f/n
	RUhMYAaIyI44e7UxsdmshdkeqtITKthEuWeTbL+kDxAT+cUrprgyL7qqmDS/7r1hBtdRMhqNiwH
	C+D+IJFEwoi1zHLZXDthh34iS79Pn7EsxIhQRSOr93XWDpGVcSSjU/pkjwpE/vEZs78+1Zuhebf
	6RsfRTshH/gPbVoJBdU+khGGwaiOPzUKNTaDMMr5lhCWtYmSXfQeiwrBsQshV+mNraYOQeBBbA8
	90wzpwUPgmDNN3kGhRNEj7ifVN8OU/BUQJ0CCSYqLtESUnVQfh3pO+vdL5yzM4ubQIrOVU70Nfl
	7VHMCMoyUhPqvqd9XPa6MeLRYcAqyO1Oo2WAESZwMWTq7W78F2qd+NIYkqIqmjBYxJH1OLFAEpR
	uf8gKgrNnPpebsNdV7eQ49icbYjDcSTbVUpqAS6EF8+SJlXY1dEjuy58hlSe24
X-Received: by 2002:a05:6122:6611:b0:56b:814e:d35a with SMTP id 71dfb90a1353d-56d21f7bb81mr2123959e0c.8.1774448573507;
        Wed, 25 Mar 2026 07:22:53 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddb6cdf8sm19833583e0c.3.2026.03.25.07.22.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:22:53 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-94aca174532so1122700241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 07:22:53 -0700 (PDT)
X-Received: by 2002:a05:6102:442a:b0:602:9a1b:ce47 with SMTP id
 ada2fe7eead31-60378ff9e88mr1928806137.5.1774448572910; Wed, 25 Mar 2026
 07:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <20260313164008.40933-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:22:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLNk+WHsk=x0gcxPW9BwmVu0vvCsD2Qh9jwBx9KYP3Ww@mail.gmail.com>
X-Gm-Features: AQROBzCiHDWFWS4-xaGWn3qrV2TIjofyDBjJd04Uike4JhA4L7_5MYxpr4TAhvY
Message-ID: <CAMuHMdWLNk+WHsk=x0gcxPW9BwmVu0vvCsD2Qh9jwBx9KYP3Ww@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: Drop RTL8211E PHY C22 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072255_234318_BCA15464 
X-CRM114-Status: GOOD (  17.12  )
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

On Fri, 13 Mar 2026 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Realtek RTL8211E PHY schema indicates that compatible string
> "ethernet-phy-id001c.c915" must not be followed by any other
> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

