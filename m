Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69084D6DDC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 03:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCro3fmqeDuWdpLH9M0YZh3SiFmqpG56moMEi9XJsQM=; b=TgWYqAxl9vL7pWC0kZd1Z8arVE
	9JoL0JwOoXxS6gHz/NPUGj10nLl5lchmuMRaKKutLemZm3qIYRLYSJZW6vK07auDO7ClzK84Gf/Qa
	fLUJf6/IGA/V7ISk9/Nc4dNUVN6BtCmtPv9cZLuC8Nk+b0oYgXXF7z+vBC1h4L3JFs+lxxMkZLPxZ
	2fwZRxgYE0tbrTX1Ore4lZsEJinx3jP/hAb2SglJblZjrwFhyz9iyRNqo0F+AjltWxgTdBa7GYcxC
	MF742mqtaY0nqAfjU+Bi0+0osQkJ9dHPM/FP6LfghsTgWrmz0Dy6ZqCLa3NAzBNkuDdT3jOEnvAw8
	cDTo/k6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBmne-00000001SOx-3R5L;
	Fri, 15 Nov 2024 03:15:10 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBmmj-00000001SHT-1N4s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 03:14:14 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3a3b8b34be9so4438195ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 19:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731640450; x=1732245250; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCro3fmqeDuWdpLH9M0YZh3SiFmqpG56moMEi9XJsQM=;
        b=mU3eWg/CUbwwKSdDNRm41f7xogNKIvF67aCQ9x/TN+jQOWAYMOg1Y5mmxeHr+5dZv8
         DQ+UH131lihn1DvehcOb1E/lSWnKMsMAboTW5JKEAUEcbB7VdeulFiCm9VTWHoRoi80Y
         HG1S753gklKkGe9XpdAYupetfIIOI8F7ZPR1q7N8l1JRrTiKrY8Rxyc7Cz7LKGtv99yR
         3u7mJnshzNRDgFyjnL7pJEIqZ8AjtRMoFWcHnsRjK2qbbR4ZvbB9PUy3Sf+Kc3J3iAzt
         rOcRj7kvAySivUdz0wZvZcOFRm8BCEves1gvuci90SXJYDdRNMet+zSAjc6LEORM7E+Q
         oytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731640450; x=1732245250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCro3fmqeDuWdpLH9M0YZh3SiFmqpG56moMEi9XJsQM=;
        b=lLJE+MOS+sphg1VoEWn3ZXx4cBwkr+PX+yS8HjI3xhZ1XItWVTNaeOwIUeyOLa3zKo
         H81+GdbW2yZl1gmiizSm1ktvo2k89kjXrhszxOKYNsL7FKbSfSN6lS71ujzOEzW2vKEu
         IK3MHeBoPTctE4INjkBjyWLX/a6gXvWPQX4xBsiNHbKc+ygR0YsWE0v6JzFe7qw8pGjK
         4GBMJslhQtz+3bhuxX0y3sZxxLSy2LyMa0CikCthG+S1B2dOJq88Maqp3YXVRNQr9GLl
         CmL5xTzDqJb5nqkEcg1eYHjmZYfMuJ+xhsA75WYBDg0v5ZVpyNbnQDYUd+xr8D/vHtE6
         mhuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmRpo4xme/JSqjvZJTsxNpkq/8iOelYhCvcM5R4f2qDYnmUIoH0/J7B+GrP5EhXIH+yLmdYpZ4AWhCMMWQWKsr@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Jw/ofI6XVlQqZ+vN+JXaMn8RbaEXFl2/4vrNIMEXbLfiEdm8
	PGfx4//UUm+ld7i4G6PIVDXU9GSL9u6lk/zSoNsrHGkcSTb9nlH/zH/sCkoRGsKikanL0ZqDPpt
	Yf1+6nAWkM2jWneIbF2ulIl39cW4=
X-Google-Smtp-Source: AGHT+IGakNHerU2OxullmdN7ZvD8921ch3v64i1UwmySjiuo3QMqELJFXW71OGYOz/AjpdHrTb2E49J9y4Mvui7ae/k=
X-Received: by 2002:a05:6602:1686:b0:83a:b645:c902 with SMTP id
 ca18e2360f4ac-83e6c0c9d09mr170610539f.6.1731640450207; Thu, 14 Nov 2024
 19:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20241007132555.GA53279@francesco-nb> <20241112075958.GA8092@francesco-nb>
 <20241112092054.GA18139@francesco-nb>
In-Reply-To: <20241112092054.GA18139@francesco-nb>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 15 Nov 2024 11:13:58 +0800
Message-ID: <CAA+D8AO3a5WsZ4=V-9CDifDZYjJjwQmQQDDQM7ZKgZ6_-CNDPA@mail.gmail.com>
Subject: Re: clk_imx8mp_audiomix_runtime_resume Kernel panic regression on v6.12
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, abelvesa@kernel.org, 
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev, Adam Ford <aford173@gmail.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Mark Brown <broonie@kernel.org>, 
	ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_191413_403618_C74EEBE5 
X-CRM114-Status: GOOD (  20.52  )
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

On Tue, Nov 12, 2024 at 5:20=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> On Tue, Nov 12, 2024 at 08:59:58AM +0100, Francesco Dolcini wrote:
> > On Mon, Oct 07, 2024 at 03:25:55PM +0200, Francesco Dolcini wrote:
> > > it seems that an old regression is back on v6.12, reproduced on -rc2
> > > (not sure about rc1).
> > >
> > > The original report is from https://lore.kernel.org/all/2024042416472=
5.GA18760@francesco-nb/
> > > and it was fixed with https://lore.kernel.org/all/1715396125-3724-1-g=
it-send-email-shengjiu.wang@nxp.com/.
> > >
> > > Is it now back?
> >
> > I was able to reproduce this issue once more, this time with 6.11.7.
> > As I wrote in another email the issue is not systematic as it used to
> > be.
> >
> > Any idea?
>
> Frank, Shengjiu, could it be that the udelay(5) in imx_pgc_power_up() is
> too short and therefore we have such non-systematic failures?
>

Francesco,  it seems hard to reproduce it on my i.MX8MP-EVK board.

If it is easy to reproduce on your side, you can try to enlarge the delay
time to see if there is any improvement.

Thanks.

Best regards
Shengjiu Wang

