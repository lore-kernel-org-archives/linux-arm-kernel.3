Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96AFCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJClskWj/Yo+5yigeUe4lqV+RJq4jkVMM8DmVAlE+mY=; b=P8lCJ/kiXY2XpolKlfRrz+ZyS6
	PJIUEV3E2APjuyII0/PKtkMCFwynijMoDMFEz7QDlX7HpuMXE1CqODZmZx992HDhxzrW1nb8GjGba
	Wtayz6yUEFkqF0sI7nhXrsRVX3RIKMR0Z2hwTVh1WxcfAoIkvIW4upF5ivzD5x+NRz0FyiQXyKiEN
	AclSWHpvGNwSS019TLqL3kBdc1QVIkdVD/V/6KO7kgg8mzoL1Cbn1T11fVddYOJ4IHYVPtk9yzK5C
	jaHsxjQuLwjDmHFTbP2zzGyVfIXsPGAqWlyeuyBFKNGLYf4/Cl4D7AXRR0SNSNezqQUKICgJkNOea
	D0kr0CIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgNX-00000002SF6-1uor;
	Thu, 28 Aug 2025 17:25:39 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbtg-00000001aKB-3IAd;
	Thu, 28 Aug 2025 12:38:33 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-74526ca7a46so279469a34.2;
        Thu, 28 Aug 2025 05:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756384712; x=1756989512; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJClskWj/Yo+5yigeUe4lqV+RJq4jkVMM8DmVAlE+mY=;
        b=CK5F2zqrI9ujXJP1UPrWDMIIseOYBOiZXtdR9GdzdJYBWP30MJwPNNhW3pmOoGWRNn
         AVKaYjTSzXGAhQfKXiy3VO8nHr3VV0lkevQnfXDIqTXg6vJnXu78WhxtfQahNjNhDEUg
         YZGqMB3KZfjWC/H575gIdE1PjxnrFJrrWZmonF7oBNvmpJzbLLf646K9ENLP7xgH8EZc
         /Oqpiq6/CU3F5JVa8uQMitPAkJ9MgPLiSh0UfQBonHtywTm2YqlXx4jhqNRqtiUpeCn+
         cp91l8Jip91nHIEtieoeUk4esM5sYaGVJR8DDbiUfJfE+Wcs+qNs9XDQetVAqawLMXJt
         1cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756384712; x=1756989512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJClskWj/Yo+5yigeUe4lqV+RJq4jkVMM8DmVAlE+mY=;
        b=hJO6BGplnBNQgyeDgBDiCoUlBP6NajGslvDYD8kv/B1XTuE7ylBt+Rim3vmRVDDXoW
         EzmXf+LUSxvuN8Kxuk5got69A0iCkhs9yRBppnAPAfr/d+Tm+VxiIk8Pizl7yt0E5Xnn
         Q8RXPdoTbtf9D192xHEgOpQc7LRyM3FEO/rQMMaakaLxl+BuqePdskvgWbiN6itTQcmg
         O6q70Ye2m9xXYCQQaLNAKUuqM258tDZYdKfdrosKqPBAGAOY0zK+NkHYZwf60SZtkXOT
         iPzp5x4e+xGjRrTNHZy+QwVW1x/EYKBQeXKN2xYWlAAaNOw1Ge6mIcWn0c3cCUeZoWBO
         kthQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMoAoz8s4OoZMVPGeSERgL5pn2T80mmPfxmzYyfeFv/t9qfCbojF145eXkmuXDprQtTqVTHNlesc423ehub9KQ@lists.infradead.org, AJvYcCXkkWUxZFbvvLB0cMmAtwMdgG5gqDlIgAZ4aUasRFEvP2+DVwg750NUizWmHRwEWARpkQkrSvIeWMQGp2Yj5ug=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAZWUNJ4Z8OKOle7a+3Opyfd/KikOhTiOrLBxoTo2t1D7loebt
	baNuwKr8/5Won3RYJ983CuwHXcLVM9806urmpkBL3+TTTNHIoywa4uT/o95bwkZc/08qQSZnXla
	aWxPtkxSSw20FgEPkz+Pf8TtPponJ5Lg=
X-Gm-Gg: ASbGncsddfLxdm8c9aE6R8IX9fwD/dzuoFe4hC+qZFtiVzElWk4pVxPc2C+uyCwnhc9
	4RDshkCgQ6euqKJKYkXJAgkuVgKD1sQcIENetq/FR63c4qQogJoheWbiQqzVHYzivU+MUBKZBHs
	ViCRy34WhBPMnpN6NCEqa09uiEBRS/OwqiUVzvSPRegi2rXjV/XXcDLUz0Rc6pHfcPkSrJs5q9m
	4OLMu1Uih/PRrjcSg6aW1MYgb0eSvju9X28O/XzwMjx38PNZNXbmJfhHiPPpuCAKFEwtJh/0/y4
	YScP5g==
X-Google-Smtp-Source: AGHT+IF/GS0+mZiRHKPdFjRYR4nPczi7RTJNOvB33F+iBv1N/jZpN3PGk5i7rC3Y8dBBwD1JyXEFIJfGQ/0/V0o5aQ0=
X-Received: by 2002:a05:6808:21a0:b0:437:e44a:29b7 with SMTP id
 5614622812f47-437e44a2bafmr206189b6e.42.1756384711890; Thu, 28 Aug 2025
 05:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250828092224.46761-1-linmq006@gmail.com> <11d46e56-b8d9-4776-9969-d3767d8cda41@linux.dev>
In-Reply-To: <11d46e56-b8d9-4776-9969-d3767d8cda41@linux.dev>
From: =?UTF-8?B?5p6X5aaZ5YCp?= <linmq006@gmail.com>
Date: Thu, 28 Aug 2025 20:38:20 +0800
X-Gm-Features: Ac12FXzMEl9C0sc3SP4SKTkgGYa89sXNbErY56BFYrau2jcKn0zmozLXTXzcXTg
Message-ID: <CAH-r-ZH+0rsji1f9eEaVDtG3XcMCD_EnAHAMwr8DuqO4D4Ps=w@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: ti: Prevent divide-by-zero in cpts_calc_mult_shift()
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Grygorii Strashko <grygorii.strashko@ti.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_053832_821542_761C52AD 
X-CRM114-Status: GOOD (  10.93  )
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

Hi, Vadim

Vadim Fedorenko <vadim.fedorenko@linux.dev> =E4=BA=8E2025=E5=B9=B48=E6=9C=
=8828=E6=97=A5=E5=91=A8=E5=9B=9B 20:06=E5=86=99=E9=81=93=EF=BC=9A
>
> On 28/08/2025 10:22, Miaoqian Lin wrote:
> > cpts_calc_mult_shift() has a potential divide-by-zero in this line:
> >
> >          do_div(maxsec, freq);
> >
> > due to the fact that clk_get_rate() can return zero in certain error
> > conditions.
>
> Have you seen this happening in the real environment, or is it just
> analysis of the code? I don't see a reason for these "certain error
> conditions" to happen...

This is from code analysis, not from real environment.
The !CONFIG_HAVE_CLK version of clk_get_rate() returns zero.
With CONFIG_COMPILE_TEST && !CONFIG_HAVE_CLK could have the problem.
This may be theoretical.

