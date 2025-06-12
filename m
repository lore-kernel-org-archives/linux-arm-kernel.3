Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66337C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 00:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCWdKGDkn0LPrrpZul9GwNXUtPRdna1q2f9cpPPTLvA=; b=L1/0IBeOGMjug+VpRAdZbGBsCW
	pd3uAm+V3snvCpWD4rRacSndpH/Nk1ephLnTL6HsPj6rs1KItStFMmUkZIgMw57FH7pNWVbVtYAO3
	3XVl5l1trbBszb1xAVzTnD6nHqd+8+3gE9oFYxEHCsz1Watx4FJlc7N5imDA2XZZvvkROJAU9E7xN
	V0Cq1U9IKI/e2AYwnwMflK8jSoLD07hHMoDCm+9vv8RyboS2pphB+ZhCbZqI5eRR/tGmID3jk+TWQ
	YeTqGrqqogeYEC2yz2nu2jUrx9bXqok0rLYQtwiATk5r98AuR6olOxYalLZBOZd72ukhH040+vs3J
	hCCCqapA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsDe-0000000EwlY-0KYu;
	Fri, 13 Jun 2025 00:24:30 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkFm-0000000Drwt-2uBG;
	Thu, 12 Jun 2025 15:54:11 +0000
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso1333570241.0;
        Thu, 12 Jun 2025 08:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749743649; x=1750348449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCWdKGDkn0LPrrpZul9GwNXUtPRdna1q2f9cpPPTLvA=;
        b=YLTCeZ3HXTRVzTi0gBW/RHUmNDf1H8glzY8MEYyX6UhigI6zk2T8648u/aIjGdUrAd
         R7wBRNNKXQygknFpQpAgNABvfayvjUEXKF6qftcYem9FSapG/9HxgwDGmWzO5QDZB5i7
         RO/9JjVzsam90MGfJnJ0vUP2s4aTVVpHuE8f3hEdBSmDFn7At+YBtTMJdHdPQUTrccmT
         2zSpVOBxGKcs8WMGCVZTl6PE1GCR6IGUAUC6ubWd8REIlgTRSguvWNy07Zg29U7inwAC
         rKKhPPJrnnTtEOHFlsaKW3nA/2C20cpv1eLf6u/hhaKnv0AugXIsIm9iywosdIwfodaB
         4jSg==
X-Forwarded-Encrypted: i=1; AJvYcCUTkop8/VEMWom/4geHtriX+ntuBB9QxPcrQBLEBwabDT9+IYqcGsgpXqni5Rag49I09Bu0rqeTVuiR57P/uu4=@lists.infradead.org, AJvYcCVFD68M1vkxwPiKuXEKmAflNC0p8OKSfv4mOOBLztUfjQLLal0OUTwsiRmBdorj5g193cgqwoUbTbJrru3taCPy@lists.infradead.org
X-Gm-Message-State: AOJu0YzwqYXvHW97G353sE2Bvhvd4bPj0meXeNwdZZKJC2xOhWc3dzFs
	y82PvkndCRNkcUFoexXBg3jdIrXkorwV17lAF3mOYJiWIfItQ93Qd/PgeKjYOCss
X-Gm-Gg: ASbGncvoWJuleB25jKQ64VFeHUiOvxWkRjbpONNhMt0HrkHoB0gdrFxaKprr9KcqiJb
	GwL/sCyGJVFzecLN1ZvGqxOP9a4BGdtJ1epnlXOCBXnUJ9RDjxLsv2LnXyYNiIbMomyCSegDYhM
	XTC382JcVvQ9qZQaqBUmF3Qc4HvsdMdPkqiNGGbSkfTp7tyxyG98Focr5m5Z3/trw/1RPYFW6HV
	OTBL6txu8snllzVTW9KbGhd9h6K25oBEXVlqEtfnc8k1ClKwGek08HeUS+GIBSm2UFYNN9OL9Bc
	czUiPBLaW73kd5mSrm8hpljlu3ajUBmB3G+qicr9evYe0LEdyQz8aBsG3vGz9k/LLwbNwrnXxPD
	JUnvIFwvB0cf2de2fvw6ZmkJZ
X-Google-Smtp-Source: AGHT+IHy7rM7dN5WWUDpSHm+bFd1+12mYW2HOcANIoOTxCQNBnuXr9ZCJe13Ty7CWgjWb8ZZxNsNGg==
X-Received: by 2002:a05:6122:82a2:b0:527:67d9:100d with SMTP id 71dfb90a1353d-5312db9ca02mr3639165e0c.4.1749743648711;
        Thu, 12 Jun 2025 08:54:08 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5312f49300csm343365e0c.3.2025.06.12.08.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:54:08 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e7b3363c5aso1294925137.1;
        Thu, 12 Jun 2025 08:54:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0viu9MLfFgfo2xl97sSVC1UD73eqeLBNbcRa74V9iqU8vLOGcq9BG7b5+xU9VdqGDl7i+20GUOhKFz4NXlXZN@lists.infradead.org, AJvYcCW34aHsFsHH2ofYIQZhYxL1wNSsC2j3LOojc0D5hji0SbsQzyEW3s2+sr30RYzVY3PvD/SptlOGSPsYPEkWW4Y=@lists.infradead.org
X-Received: by 2002:a05:6102:5113:b0:4e4:3c3a:f163 with SMTP id
 ada2fe7eead31-4e7cd7a4049mr3737309137.7.1749743648153; Thu, 12 Jun 2025
 08:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250610193403161UQCV5cVGXCRVDheTb7jvi@zte.com.cn>
In-Reply-To: <20250610193403161UQCV5cVGXCRVDheTb7jvi@zte.com.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 17:53:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2Ar95nrmH=NTwY+pkrg6nD-sNoVG7MJY7ofJF4N3bNA@mail.gmail.com>
X-Gm-Features: AX0GCFsIwHF9_aoZ54iuAPGFucIDRqFn8Tjpa14cAUcOdjFvqEv5PYmW-DjzBPU
Message-ID: <CAMuHMdV2Ar95nrmH=NTwY+pkrg6nD-sNoVG7MJY7ofJF4N3bNA@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: Use str_enable_disable-like helpers
To: shao.mingyin@zte.com.cn
Cc: ulf.hansson@linaro.org, changhuang.liang@starfivetech.com, 
	geert+renesas@glider.be, magnus.damm@gmail.com, heiko@sntech.de, 
	krzk@kernel.org, alim.akhtar@samsung.com, walker.chen@starfivetech.com, 
	sebastian.reichel@collabora.com, detlev.casanova@collabora.com, 
	finley.xiao@rock-chips.com, shawn.lin@rock-chips.com, pgwipeout@gmail.com, 
	qiu.yutan@zte.com.cn, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, yang.yang29@zte.com.cn, 
	xu.xin16@zte.com.cn, yang.tao172@zte.com.cn, ye.xingchen@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_085410_727347_294F5572 
X-CRM114-Status: GOOD (  18.71  )
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

Hi Mingyin,

On Tue, 10 Jun 2025 at 13:34, <shao.mingyin@zte.com.cn> wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> Replace ternary (condition ? "enable" : "disable") syntax and ternary
> (condition ? "on" : "off") syntax with helpers from
> string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
> v2:
>  %sable ==> %s in jh71xx_pmu_dev()

Thanks for the update!

While I already provided my Rb-tag on Krzysztof's original [1], your
version is whitespace-damaged (TABs replaced by spaces), and thus
cannot be applied.

[1] https://lore.kernel.org/all/CAMuHMdXJ57mATWW4AnBedn+D7TQ4PadkJ642daquFtAo=wZFrQ@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

