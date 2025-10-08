Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6969BCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 03:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zx04ah/IYXegpf5FVcljzAJSZIUmnHslBnom7Csei1k=; b=Kl9MaImW/IrcFGpJPoeG2negmT
	6j5DbkwvTtic2eQT0B1xomwBZbxlHMP6ByyYSdq54uY/QSTq2gRmJSqzy/Sp2yTm/K0+Ys8F5l2cu
	jPn6bZZntou4mcaZsEmM6nnw4KGR6BwdxsqK+9IjxypI/7cropD/i2dToknHmlLhTTqD/ocyjG8Ts
	eWx0rzRvkplGhd6T/tct6WN644V1ATREcWLDOkq7pB617EeGTANcmj+KkXsEh8fUPh3VzkTCTd17l
	fpHvdoXUl6fhzAoRrdB2Hrv+K1GIU237xgiQ0GvYv42yeHzvaZksGxit8xt04Qdan8b0d/yuB5jmo
	EOUUxVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6KzM-000000037xV-2slv;
	Wed, 08 Oct 2025 03:37:16 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6KzK-000000037x8-2UXU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 03:37:15 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-631df7b2dffso1133710a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 20:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759894632; x=1760499432; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zx04ah/IYXegpf5FVcljzAJSZIUmnHslBnom7Csei1k=;
        b=FlUYCyhEEWp4oafMGr4XjQBj4CbAETvydKzNC6TDw3+fottZCQB7ZkKrLXfkwQeA9V
         0cF17fNwVf+IvqGbTeS+QEsqcn77H7IssZXB+X68uGnUR2n3jcd4Hk3hR4ifjG/Skv7+
         ntdqVn61Fauewjy8HYO+FjGKzuXx1tQ8nDmlXp3xqPBzfLsAEITvW0hPKhP4R5+0l4cT
         FX7EYUi1Gt5gs7jfSPE9RVsJvtcrOk4TuYESXQzBHlop/NUy2tBAzy3fKa8tRIQqUuIn
         7pOfXZ7wJMKBH8QfpjreWFqdyL1ibwPcV+Nqr1TAGuTNFoRc2I4KKQ6yDScgXtfvTrgk
         L84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759894632; x=1760499432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zx04ah/IYXegpf5FVcljzAJSZIUmnHslBnom7Csei1k=;
        b=Kzq+yVm6miX9h7R+/KeaG9gv2LV42OlfjNoDivDv3Q1FemthcfDq6dDmwUwMsW7V9f
         7bvjlWjT/5Y7Rt5kXSxjybyLm59zAFYPEL+91OqVg+bKrV/dA3vzq7x4FYWDuN9VoKL7
         8YCcw/UE6yz3QghDpwsaLMrwQlYRUAeql4WkPKrvaLo5zwVhgkIhuKy55fGcm+fXP6ug
         N/bjK5CgiMkPDZ5uMrvcy039tt3lEHp9EexcDJl/n/cY4+6SF9exGNPdOO913I1M7dDt
         tnJSist1eDR3kn4G+bj3+kKwsnO5uksKdhyjm5jfZMoVQAXRVyMQUZ76dzWqBXquzV90
         347Q==
X-Forwarded-Encrypted: i=1; AJvYcCWL7od1WMaEE5F+cXFDfgzHaMYBe1Cjy65V2wpsnrmCYFAFSLv/z+5tHohGkSuaYEmqE46OYJcPZVuTVmEXHkh7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwsl4Q709bJodV7YJXCgKzovlcV/Spv4BY04RyxU6crhLBCQkb
	1nB0QfrLJDL5hSUG4kD0oF9XsOZ2WnLIt62tXohb5Run7zWuXDqq+tNegpiRjzu1colsyPGK8mf
	rq08bd+sKUuczrMlRjukLb5eT1chbHgQ=
X-Gm-Gg: ASbGncuRQm3HM5o2Cpd9VYfD6ZgE+2MF2PgKHR7xY+lBEdii5yPCxl2VZ1ZMVvw4UVf
	rE3+p5vTD/dUWkgbQicTQ1NO1QFUxSQNqHxQA23syi1pe7LmW6Snu36afiAe+LW7BXzF7SdKsah
	IUJ2kGh+fmMZ7fk9yh72Ovv9LbWJcPKGSW3vZk4wHjzmvhE3TFgVyRsupP2jPXIgYY883qzlRB3
	x6GjotOAFgB79XaHg9Dz2DnxD3R7n32B3wimPrcO7LqdWGvqImyzrLoiVi+pqVwLQ==
X-Google-Smtp-Source: AGHT+IFdakwpHCbhBv8L8ewQ8YL1xFOcXFkqwuOUaP1m0nKJBrxbVsaF6mhz+pLN4b219pRES/JDwQc0A3VoDQDnZvo=
X-Received: by 2002:a05:6402:4019:b0:639:e04d:b0cd with SMTP id
 4fb4d7f45d1cf-639e04db5bdmr313287a12.10.1759894631994; Tue, 07 Oct 2025
 20:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250924145552.55058-1-sidharthseela@gmail.com> <c87d45dc-d545-4359-9e2f-11e43a45859f@linuxfoundation.org>
In-Reply-To: <c87d45dc-d545-4359-9e2f-11e43a45859f@linuxfoundation.org>
From: Sidharth Seela <sidharthseela@gmail.com>
Date: Wed, 8 Oct 2025 09:07:00 +0530
X-Gm-Features: AS18NWAJtkfAkiglYcQF83q4sQMGaqHzh0wb2Unau5kJ3UCJfzcYdxQwGuDuKzM
Message-ID: <CAJE-K+A_xFPPDbPFQiOwH5nUJdrrGHxvV9xVppXWTNJ5g2bUHw@mail.gmail.com>
Subject: Re: [PATCH RESEND] clk: at91: sam9x7: Use kmalloc_array() instead of kmalloc()
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_203714_639069_F6AFD687 
X-CRM114-Status: GOOD (  10.46  )
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

On Wed, Oct 8, 2025 at 2:36=E2=80=AFAM Shuah Khan <skhan@linuxfoundation.or=
g> wrote:
> This following line doesn't belong in commit log.

This was one of my early patches. It won't happen again.

> Can you add details on how you tested this patch and also how
> you found the problem to begin with.

I used grep to find instances of kmalloc and went through the ones
with size calculations inside them.
I did compile testing, My mistake, I forgot to add request for test.
I would like to retract this patch for the same.

--=20
Thanks,
Sidharth Seela
www.realtimedesign.org

