Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D677CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=; b=n3kFjMLKkn41oaxm9faJyotR/5
	0XGtxiCD8K/AcH7Cfe6a9gITi2OQS/eAKsEk+99f5YwR2hzdRaBAJnN3UnvmZgFEj+OFi/r+dDltd
	hPujqlFRDsBWoDJNiLW7TA3SnkEXlW7pJjm8SOXo5EA7TyW3RhZsDAbKUxgNvhOQ4/MbuHOFKEULz
	EXvlx7527RXZsJBsEu/PJGD/Z7YeD2R2h4yXb9Xgm0fSLOB6ns7H7YtY6McqDyULPx8/z0EGIYBVP
	HZO8F3eNTLs43zMYoAqPLsQHtUL3YSAw5VpsHDOa0MWMWP6aehrbZUWOFd09HVHBmzKUAVWgeH8Ew
	iGsfG9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqC7-00000005W3h-2KvI;
	Wed, 30 Sep 2026 09:01:43 +0000
Received: from mail-yx2-x0e.google.com ([2607:f8b0:4864:41::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqC5-00000005W39-1sCi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:01:42 +0000
Received: by mail-yx2-x0e.google.com with SMTP id 956f58d0204a3-672ce86b21aso5566742d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:01:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790758899; cv=none;
        d=google.com; s=arc-20260327;
        b=IAf2u6wJijKHj52ISP44OKdb7hASId+FOVTqfYV7W2p3PwM/imLfopBHZT8cGIbbMv
         nHvIGaD+1Gj/xXGkjql/vA/J2MjErSHUOzRmozDg068eDnEkD0qsB7CHqFzQ/6wFlAE2
         5YjO+9PGTsvGzVJhK30gzCRHVEKNU7763+vIutNZly5Sf1oGU8vAmXjqwdd7MHOMH6t8
         uz1x/+9H9BwPNqUCjItbJ1bWitTSJ8s7p9WyD/yTUrOwfERnv+XdbREqfNdBH79DDtD4
         HXRglvj+TKh5ADcSVntbN2v7sRXIBm/vkl5cKiisadYbJ5v02rXEnbbLD2XPLXelSLZw
         c3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=;
        fh=1sF9h2RIDCLix9g25CvpXHMWoW24ZX5WH2yos7vrKik=;
        b=oGUbYwoeE9QAiluR3GL2RZnLAN40+jUvi91zuT2VMYe8SpeWOG8GooBNvJSBLCaqCH
         MZesXgthdBypl5WVixFFR692z1qT7UTcafYQXfzqqlqI9EwDHUVPX/oUMu290+sMQeTP
         4s+/U8959WCLRnkQC4mXr2jUGw8aHmV9+Mgi3VBPCRuHVysbgfnYcoWbF1+rO28QeNEI
         t1Sqkb91AVgvzfszOfVyeFBuXzMlI64urMRa6ZxW3/Pb2/JNhXROzWClaP5TQRfn2FkY
         Vt5H1GPSDphUoNcwGqAlxkLXjBHKmdnZ0tzQqrZzJHl/uvD2lgbGCG/Au5cYrcYSizcE
         ANRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790758899; x=1791363699; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=;
        b=UErbwoWyV/QF76wPIwraPeRysNASg7Lk34jOxfljSxocOt4MozT30d4E2Yhi7is9Ze
         zpPFKs2su4qKHqV34+A0Rl+a5iZOGT/n7+/zTvQI16AUyYSZXr7j1Jku4KxTKSMH/NC2
         jG4JXewjro3NvxmO7La8dHEJUBPc6uqoM9iqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790758899; x=1791363699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OykS+SoJkr5JXEkWEawY2ny5Ghozx39KQAnc/vSe/EU=;
        b=lANeOwpnSejbmIZYagmEXWtQVngoVsML9Be4LNQn+Wd1+BBXSaw2pjK7LJmSgWdVfk
         VBxbKolmThKon2UR1r1fv7kZOmUNLt9giXRfteDAXE+1P6IaqJWZXJWVG5gHMh8oaoiE
         TaXatinhQGA5pUT47mkFk4w5Agc29f6LAsImx6U0T6hkBQXVNI2wY6DVNHc1ngBHkjVF
         jvekdjAkxCmAKYL8zEKkd+eLkKqrA+lqV4XdKgJOm5wp0eKX6fbb+K8yhiUd6NlG3oDG
         HgWdehnnPDUl/m+KAmaoNz21MWrJf8gWOzXfjdNssl1EM7o1RJxwkbTdFDbLVDznoxFc
         8rBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKUTN0atIfVqyXAc7kePCBJkL+wGY87FC4BcfwqBxXbzDQVR5N+giM9drHYZrsJOYarHb/yu4mj4y/sTRNI1gl@lists.infradead.org
X-Gm-Message-State: AFq9FYKe9G1C7WW/yhVbNBjjALgHjQi3GI9aJV87ZRlXKmpP5vIaz5x5
	GP26/pCAxV3qf34OlWQ1UIV0B7+FPD7+SQcBUPZCpoZj7XvzM60q3kfbV4mvXC+GWRG1Yo/k2e4
	7LMGwxZiG1c3YB6lm8B4Nn6py/munDqwbV+dSMobnTw==
X-Gm-Gg: AYBFou0NdOlw0DUj+ZkFklWjYMe367jdM0dyWrz0PDop7buChWWqF0fmu2kwOEUfSse
	oYgKfz5uY0Qpf9AE4oax0CoqT45pEip8Fo7pZMFT9LflpqC1ylEbwVIdkhTg5zTA19U7cq0zd2y
	RrlmsCSlgjcCikNaRKcKGXK8+sjo3sapoSAWSHinMQzqKn3ieHF/OIdqc1dqORy1B8b1LfDYN2T
	RMnjBPyuyopw9W4/hcOcL7b2YIZvfVJk0DzTulGYgmJyDZaZ3BDaMm1tZogvtwXzSy6e+yqMPk9
	tmV6cbxlYjLBKhaZST9GlCV1biAtGZnFavIepU+pY+w7V7U8X6VwVXevIe1WrQMydsOE7i/Frjb
	xegX/rE48ZpBs091vYurLu9CQU0bQ/lLS/iz9qif1fX0=
X-Received: by 2002:a05:690e:144c:b0:675:5fec:681d with SMTP id
 956f58d0204a3-6768346ceb9mr330443d50.78.1790758899672; Wed, 30 Sep 2026
 02:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com> <179070048452.199845.10870046832708018931.b4-ty@b4>
In-Reply-To: <179070048452.199845.10870046832708018931.b4-ty@b4>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 30 Sep 2026 11:01:28 +0200
X-Gm-Features: AclHuK_jgSkzAP6aG0bqXQrp3Gg_ntpz85heYxuGMY1RMPkv--ExXYz7UZJOjz0
Message-ID: <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
To: Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sebin Francis <sebin.francis@ti.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_020141_514853_BFEC902D 
X-CRM114-Status: GOOD (  17.71  )
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

Hi Brian,

On Tue, Sep 29, 2026 at 6:48=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
>
> On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> > Support spread spectrum clocking for i.MX8M PLLs
> >
> > The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> > PLLs (audio, video and DRAM). It has been tested for the video PLL on
> > boards using i.MX8MN and i.MX8MP.
> >
> > While at it, it validates the spread spectrum configuration in the clk
> > core before it reaches the providers, and fixes the i.MX SCMI OEM
> > extension, which converted the spread to the wrong unit.
> >
> > [...]
>
> Applied, thanks!
>
> [2/4] clk: validate spread spectrum configuration
>       commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88

Thanks for picking up patch 2/4.

I put the two fixes at the head of the series expecting them to go in toget=
her.
Am I missing something for 1/4?

And how should 3/4 and 4/4 be handled?

Thanks and regards,

Dario
>
> Best regards,
> --
> Brian Masney <bmasney@redhat.com>
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

