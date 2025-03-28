Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B7FC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHMi97rW5XnYmsHSdrUIP8vR+FvAoZCe/aUt1UwDlcM=; b=XcvEvbyQ1sVgCmvOU7Ew64PPzQ
	L4E1frScFWKNT2vJJML4M5Pl1wJCHLTI/9t1lcZHat0YenxkbuYPK5lz+/cfjcjMcM3Jtym1+Rsuz
	fkC3Qq1bGKdtcQBfk0UMQQN1ExkoH7WUOajRsUAz9emCbhTtSNFvQqfB/PbRcCSbdKmpzXte14ELi
	tDPhIum+ZPDqPBYvmopLW1yLOWiNG9HvnojVmw71wCClBxuianBRN+8fkGys/xXd6sI12r7/qUBC+
	RtZe0lqxaJC/bRmmHv6nHvQ5fJ9KAcHAFP+sFkuukFfwknSlu1h+a7/i1SNRmbtbk/F9I5HJfTzGn
	xfNt3xOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyC2E-0000000Dp7M-1mwD;
	Fri, 28 Mar 2025 15:54:18 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBLH-0000000Dif1-1o4H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 15:09:56 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-476805acddaso25028911cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 08:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743174594; x=1743779394; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHMi97rW5XnYmsHSdrUIP8vR+FvAoZCe/aUt1UwDlcM=;
        b=bg79o9GSgcl4OgZpxy/Yv/BzNCzv4m+U/4pk2484iVKpuqiOddBkkcYGWGygOSyyWn
         cS82ZCgd5Qsecmqtq4dFO5Dl+EoTlfh3O6MquaAMUSd91VYtv2NKeXMPU95lgssYqXwU
         nsQmpEmgBef/llkYJbTalskiVm/65rOVwnri1ubwfecpW6itfNIxV2Lrvg3kNyMeo0QL
         3ihZv07mOdSHNJlwiW+oDsZD8Fk0P/LuDgpa6OcACxNsweyh4ydOc/4VFAUtcF4yyTJc
         FH3pzrFM7UIk0Y4dTnMTGyeCzRF6j1pWOuTG+jxJaKy/nb/A8UM6KFzwqnnrRguQ4ug9
         OONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174594; x=1743779394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHMi97rW5XnYmsHSdrUIP8vR+FvAoZCe/aUt1UwDlcM=;
        b=Z3HbrtwtiweNHroyku+1BQaDhVtGD+cvaVB6a2FUJqIz/YcVaL0qhaMMKp93C8XGUr
         ekxagIXtUNnes/b46KZE6+9zgnDR4M+zFunDjmuljvUcYIunRmWxkd2UvCpV9rgwghWt
         pWddgIZ0U6rowX4eFW6IMTzesI6qglDHUEafD9/0dTGYYrIlIVGWMOVqdLGsIWO/A7yp
         Dyd1TG+l7gKST26YNwJ+AHwh+5pUHcCG0Zoohq4WlQc7MYPCnNcbCp3cQIZ5lDJC3EzD
         aNVB84192nD+NlFSxwxoeGXK7QmOxWqfzpZTOwhSLzsy0Ndfp43YBJanEhtOOO+U1qz4
         bZfg==
X-Forwarded-Encrypted: i=1; AJvYcCVNA0KRd4Q4WrOf8xGgLZ+87f+aK+eTChspgNmHRTv+VoV3D7A/PtPxxCOzwclM1zt/RSmIiKWOKbssbO3yGqf2@lists.infradead.org
X-Gm-Message-State: AOJu0YyKi0X/x5dxyTdkedJccEYyFSr63TJTfbQ6WclAszgPVqJ/WNMM
	DAlfvI0zgxtuEbCeCswvRsGkwuVXzK5Z9u7Gi1cisSx+kD0JRASUVYB5yi2fBoIf2pwDR8jW7IE
	1GImr1fJIvPIF66aNTNrTa6AP2OQ=
X-Gm-Gg: ASbGncsFanBTKovi9JI8IMYWglU48T4SPfHxYwrcsW5fDX81WeOvfFGTa3CYZ/kQxsA
	qMIopVmnHkg0wPCjApkypK8sws9xkKJ8ZPJJZ7mi1ar8x1+klOGJDDDorBL8kXHlVfUGiTMR2mC
	BXQ6ZxfVgQW1Ujx+keQFKcX69ZBtWn9rVhh0NLnwqOyMR2yO8/+fD2DRAx
X-Google-Smtp-Source: AGHT+IG4QqpaNQDy731U58i3bQqCRBN4wxgf2WnACwyQB2g5h8HohI9uM8ZQbNABaLBYgrNgY/+RPwYvoW7m6YupGso=
X-Received: by 2002:a05:622a:580c:b0:476:b3f0:a905 with SMTP id
 d75a77b69052e-4776e07acccmr119111651cf.8.1743174594347; Fri, 28 Mar 2025
 08:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-16-prabhakar.mahadev-lad.rj@bp.renesas.com> <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
In-Reply-To: <41c6f512-47a5-4723-bbdc-64ed85ae8391@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 28 Mar 2025 15:09:28 +0000
X-Gm-Features: AQ5f1JorkyU3M-MDsNZEjTYwlCJiHquCQUVcPMiTcuQthITmDLDNSbYjZqb0KuM
Message-ID: <CA+V-a8sT3sV4D-i84G8D1q1s_PBGCQagc=YGSvTfTWVYJsHoeA@mail.gmail.com>
Subject: Re: [PATCH 15/15] arm64: defconfig: Enable Renesas RZ/V2N SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_080955_471694_629442A6 
X-CRM114-Status: GOOD (  18.65  )
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

Hi Krzysztof,

Thank you for the review.

On Thu, Mar 27, 2025 at 7:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/03/2025 15:39, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable support for the Renesas RZ/V2N (R9A09G056) SoC in the ARM64
> > defconfig.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfi=
g
> > index 11e7d0ad8656..c7b41f86c128 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1483,6 +1483,7 @@ CONFIG_ARCH_R9A07G054=3Dy
> >  CONFIG_ARCH_R9A08G045=3Dy
> >  CONFIG_ARCH_R9A09G011=3Dy
> >  CONFIG_ARCH_R9A09G047=3Dy
> > +CONFIG_ARCH_R9A09G056=3Dy
>
> So the pattern will keep growing and none of you will ever bother to fix
> it, because you have your patchset to throw over the wall.
>
We are working on this internally, upon approval this change won't be
needed anymore for the new Renesas SoCs.

Cheers,
Prabhakar

