Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A65C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 13:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4njmjs5FEWBZVcqpZPtlDiz0Y1JpWUQ2Ktm5h9sD3k=; b=yH6ID5MaZhleBKzB8Ve79kaa7x
	zi+mC/ovmD/COkB3OeztsS9H32StapV5kzAkLdBy3UPA3GeTuqxEu+G5BEtLMKUEPMHUTMBK/DPAD
	FB2OohSliS9DTfvlAPNVTuDeKTjU+NBV8qw219jCvs93nOuE0lMrC19itd0zTcHjDQ6pkERGhe9Ox
	vxpZeFBYujG358oExGae7I8rKim6leR1/MIBgEq5dWPPi571VcohVVcS0CtyH+eBw3pvSqx8a2mXA
	dvEpk/HH+PjWLyg4Gz6s50Tt2wSubex5Z7JVZBtv4b5u4HO/ryn2Hx//CDqq4ohrNRpvqbha1IK3U
	Yu2dN0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lsj-0000000GFvs-2h5O;
	Fri, 18 Apr 2025 13:35:49 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5lpD-0000000GFH3-0ByP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 13:32:12 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so228570366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983129; x=1745587929; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b4njmjs5FEWBZVcqpZPtlDiz0Y1JpWUQ2Ktm5h9sD3k=;
        b=WwLoZ91JL+la5WTiE1fw1IanxVGEH03lfrZPRxyjUMvCfB/ZUy8ig1m0hiY7KHxSli
         Ne6TYE9QUGJfsjfnzGShcrdYNKjw3vnY97GKSJieSW6Xd9Qi+JKQtERHo/dF2CpYJv2Y
         hTvuC2Cxmyyixx4nnqZ8F2BoFQahGW3Ol6mRNo7PQNIzNeI2YW2RKC0VMFdi0XrASpJL
         FUN2NkOC+zCkCINxfp9BvnXOVcIa4wONXsE1r52CPMHwCDde4ufmwIhlHArBXffQzBwT
         1kELQo76Cc2wUcL2iOiXdhiTxUA0xi/RE1XVYGNDCgdv27JT3QNEYkPW1SwdHLtdX8BI
         pJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983129; x=1745587929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4njmjs5FEWBZVcqpZPtlDiz0Y1JpWUQ2Ktm5h9sD3k=;
        b=u7C5vDzUo/lSeadUXy3zmZSb8hMiONfz13mBlTcP5oqAJls7RdSz5wkmTliuB3VfYO
         DGKrMVUOX8ujIs2CRPKVx8apV7VKaeOlYkl5TQ/NDH/3/6fQYWlVWP1Gl2usSibE8E6d
         Ht95Jw6njd8x6Tk0ZnLKCfVMBHuAtudBcHAEj1wGAYDctZjpBV2xe+qOWBdl9HyG87hr
         Y7Y0nx2ichS7WrhMN/BjZVNhcMQlgWTyOIGZHeRN4wRBFr+Z/iO9wkUE5JpvFh5DoTNi
         j+fHZMhl6rEJRNn1vm+N1siGkAxtSnsY+Ovisbiyc2ojcNDb+BfSsk8MhrDf9Ai8REpg
         hyxw==
X-Forwarded-Encrypted: i=1; AJvYcCVa+fAoYDAHoEMCL46yv9nq1L69vvU+5Cp7NNi3l24yHFCAy0/cfL7S5QY+CbdFdtQ7PSuNbY8awCoEclEhkj11@lists.infradead.org
X-Gm-Message-State: AOJu0YwkNxd8XxzQ8M1Hnu/+O1B101mbi7ekIkvFJFOf0Kzpk/WcZ8S8
	TuVDpS6v+rofxfjyECI/mCq/lSDBVOi4iE+o2hVFI9M0gKQtB5Oc0S67Razb7nW7BI1XYaE72A7
	Z9mm3LF1R+IWWfgGlc5q2gAMOeig=
X-Gm-Gg: ASbGncsgNiZHmyJ0MXijM2dG7TFK6CzpCEfX393j2t9Aj8tnuxfoIEZWaDZTFKEfSem
	heclGPhPQuKS9eEGxo8H/OJge/6yPYOZcqH+m8XfGbeMKvyPBTeKQzfplsMPaWvDSRp+sCkPDJc
	O1kWdOPZHfesMXjPsDPqEl
X-Google-Smtp-Source: AGHT+IE5yZsOitApY6hlFkOYwOYpZYTB/YxlFvfZ57kvY4H+NoJApljac4H2AaCIqMz5qAQqGyh7Um3lY526ikobtao=
X-Received: by 2002:a17:907:7206:b0:aca:d560:d010 with SMTP id
 a640c23a62f3a-acb74e0261cmr227580366b.49.1744983129087; Fri, 18 Apr 2025
 06:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250410063754.5483-1-linux.amoon@gmail.com> <20250410063754.5483-3-linux.amoon@gmail.com>
 <aAIJJKGif3i3-97g@mai.linaro.org>
In-Reply-To: <aAIJJKGif3i3-97g@mai.linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 18 Apr 2025 19:01:52 +0530
X-Gm-Features: ATxdqUHZRAneISG_0dWfd2Uk4LjrjEG3JlIyII728_wOPaPTeWkKGUoSPf19fAc
Message-ID: <CANAwSgTpQ32XLfRpbngZkvw4ws_L7t2N6hQY0YNykZgZhGt3wg@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drivers/thermal/exymos: Remove redundant IS_ERR()
 checks for clk_sec clock
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_063211_089597_974F15DD 
X-CRM114-Status: GOOD (  13.93  )
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

Hi Daniel,

On Fri, 18 Apr 2025 at 13:41, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On Thu, Apr 10, 2025 at 12:07:49PM +0530, Anand Moon wrote:
> > Remove unnecessary IS_ERR() checks for the clk_sec clock,
> > the clk_enable() and clk_disable() functions can handle NULL clock
> > pointers, so the additional checks are redundant and have been removed
> > to simplify the code.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>
> Typo in the subject: s/exymos/exynos/
>
Thanks for your review comments.
Opps, I will fix this next version it got skipped.

Thanks

-Anand

