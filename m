Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2415CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 07:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuX2HRuY540gLLn3OBzHXp4J6+mRpc3xLSPypfFFPPU=; b=ZHkwgj5Leb69KGNU6vssS19uSs
	LafNrS4McqUdO7USZ3iXEDy5I5avzpAK/LOxx6ah32dqGAAOHTxCrtj5C9FvPahsPyQZJzfoeIMw1
	i5qnmNcy0qN0V6AWP+6Q7I9wvuZTP2WklTzKSPhhSGOvhypl6Kd/4FVibJ1j6Jk6vYcEUhXd2op7U
	XMV4uv7bx0YboG6E1ZqJ9g8q96jH7C8FdG9lCYTr9jrG64H0h2rtpN4MuJ+NgZuUVSlIJr6VqFXmZ
	Zr2DRH9iV+MJ/rTaYZBI+kN/wRbKcEUTRQxVzWVE+vpXksyPZZZmTBGUgmBkI0s6SM44bJyRSZK2g
	BZhv1nsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodR1-0000000CclC-3bV0;
	Wed, 20 Aug 2025 07:40:39 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodDb-0000000CbZD-2bSZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 07:26:48 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-333f8d39e94so46940011fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 00:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755674806; x=1756279606; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuX2HRuY540gLLn3OBzHXp4J6+mRpc3xLSPypfFFPPU=;
        b=SysHYb8KwVUQ85dXV8OK8KLromKfBVKnvSniZ5DLSEL2R+nG564P9n75qvR5LM0Cew
         Z6hBaQ51eg1bStY3yDnfExXcx2o+eVTHhvihLVyKznw5Y2DM0v/XkdFtMnGqDz6i6qkl
         TavMCxdoC5+NSs7SD/Ej2khkmgaWulTNUwaAdpuQtRv2zQM5hONSueaZ39l/2bAApPOU
         zX6YxHY7qMR23+au5An2KWOMMxFKxFIVHSXnFe+agfueXGyKSmW9PV23ZR1nU4oTcDDG
         BlO3Sxr3zx6HKRqxJXQCgR/Be70+/xGzoknYi+50elguReIG3u0eWIXd0BFNtZNxhWo9
         eE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755674806; x=1756279606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuX2HRuY540gLLn3OBzHXp4J6+mRpc3xLSPypfFFPPU=;
        b=uXT+pg/rIkKXUYD5zBK8Y7lky5EI64f5M3FJUVn2nmXU10d01yc+jYN4HqgDpqkuZ2
         QEI/MhYwi3NDzeV3+ee0BMYYBr83oUsYtxpSgl6qk6+WKVB0RmI8WOKO65Cs98JA8z7H
         JaqKT5uSr/hPZ15/ykxQ9r70t0CTxBvgmNG9TFExXKzjdDS3MgbJY7MGfa74i5pnA+co
         0IRWZ4rc0Zl9HfaV2AE6iYxflkn9X+T08eyJ1Zmy0wnYIEjqh4iGGdWhDWI+jdgQuJ3Z
         4MF8kivb2o4Rr50g51QYQ8ezeeYzPZfjFpaUy2S5LsQIJVG04/XiihCCORV2hCSnq9WW
         Vl7g==
X-Forwarded-Encrypted: i=1; AJvYcCWxxjMJ3DQUoJqjoHyO06YWXgSTg31zrYCJh3YOcLfMi2nB/dU2xsHfGcZDGH76puFshoZ3s0uFEqGBtJLTHu14@lists.infradead.org
X-Gm-Message-State: AOJu0YzOah+bbEBYmw2tfHh3WUhIY23uaOxS0oiRgsSGY8DcL9fWll0v
	fIDtPLldF4EeCbYHlyvX9zZmgsBMSToozCWGSL7J5gXEBabgrY4wfm8tTUKzHyVKwpw8b0+qwjc
	z4z8ENDsy+HgIPLgvx//KYV7+4crA8MhvjrhHivA+sQ==
X-Gm-Gg: ASbGnctvnoS046sPquIlbhOqBSZyohoteLgra6zM07U3K8e/hOw2mT2wnT3iMW/CG1i
	andnUoB4BDQfSHjaEpazR3Y0+RLYtOHEgKfFXWxQUfUI9/u6y1r7FL6mSHO5ou4qpJ9Bf4cDZ7P
	Sm9rycIFAOqo/o/SjXSWKkI6a/LwLQjGCBnIYHv4XIIk2EcsaZDidwMDRNAcyb02EEdWKBjV/oP
	kZ07X5wFLht
X-Google-Smtp-Source: AGHT+IFkIVL0QsIdOZQlW0D+lgAA1nsGZknVFkVpqjaB4S1VwEZ4JXZCYItH3d8xt7tCiiSuJNsOnXUlgb3FzUcPr1E=
X-Received: by 2002:a2e:be22:0:b0:332:2405:4d13 with SMTP id
 38308e7fff4ca-3353bea0a8fmr5933501fa.39.1755674805791; Wed, 20 Aug 2025
 00:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250818103931.1100084-1-richard@nod.at>
In-Reply-To: <20250818103931.1100084-1-richard@nod.at>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Aug 2025 09:26:34 +0200
X-Gm-Features: Ac12FXzmS-9yGVF-QG0jps5D9FFgyHp9dtJtJ14yfzuuesjlk_IGoKkXWSgMngU
Message-ID: <CACRpkdbwUU5TmeVhcSAZ_ZaFa5nGVtyFBjNXBwNMC5y38heELA@mail.gmail.com>
Subject: Re: [PATCH] ARM: ftrace: Implement HAVE_FUNCTION_GRAPH_FREGS
To: Richard Weinberger <richard@nod.at>
Cc: linux@armlinux.org.uk, rostedt@goodmis.org, mhiramat@kernel.org, 
	mark.rutland@arm.com, ardb@kernel.org, ebiggers@kernel.org, nathan@kernel.org, 
	dave@vasilevsky.ca, ruanjinjie@huawei.com, liuyuntao12@huawei.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Donglin Peng <pengdonglin@sangfor.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_002647_659257_5AF34EB2 
X-CRM114-Status: GOOD (  10.19  )
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

Unsolicited thread intervention:

Richard if you use ftrace on ARM a lot, have you looked into
patchable function entry as described by Mark Rutland for
ARM64 in this talk?
https://www.youtube.com/watch?v=p9cqUTF4I0w
(Described at 19:12 into the talk.)

I think it would be neat if we could do this on ARM32 as well
but I do not know how hard it would be.

Yours,
Linus Walleij

