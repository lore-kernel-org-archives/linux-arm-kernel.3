Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47741C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAhE2hvzxTYkRTXNnlbXymQxLrf75SVoPXCltrmDJvs=; b=cNxeVwGIQv/xFFbyapaH2pt5WG
	1ohlNMorFgV9RoiKGe7fIHdxDjCtJGkx5kQn3/+Tcouvw0TTu1v6cV7Q9O6bE7twlyKELwIzBXUpV
	t0+zLVVKwvMoMiexgvMOchqBn6j3L9t5sKJ0FOx9Io8ZnOWvIfB9BfjYFC+pTfw+3xtA6wUm4o2JJ
	e2swz6HIJkYPzUSMc1ovkGzwy3Rgzs8PVJX2D43C778CE7eUmiTcZsUWWuDPSdHbvxocyMmjY+8Gk
	449EBYTBPK/J/8BqZZQvsc9qds9JXPrgk7TwRv1E7tnr3m6E8q3SR+yJ+eeIGddG/4LZexot3cD7i
	0A7Fz4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uEC-0000000DlWq-0pvT;
	Thu, 24 Apr 2025 10:54:48 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tRm-0000000DbZw-2k1c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:04:48 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e573136107bso616175276.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745489085; x=1746093885; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gAhE2hvzxTYkRTXNnlbXymQxLrf75SVoPXCltrmDJvs=;
        b=C4mQFUwJc2l+6JtE9kAEbtFlXbi2q2XXDMyc2h+qkIA60wZh7wl6oK7GOY0KG4cJ/g
         PnEc6jQwGTKqk47YS1Vcj8CEZZMv5dYALhDkiIVTlfGNT8LSfdNL48Thp2POZ51GdUxh
         JONnEO3KJURFZkheRobAUwUBvOznxZFJqeX+lXJVS3Wd5Nc1VmCu3OKujkUBcjgvKvfD
         P5nA40UZEjWoB3LnWKaA+hM77F0VAYsQSpcZL+dj/iFKXX18NUU5RccyHbxzjRLkugFv
         NIBoObQ8oepQdIck+/PsDyMa5Ho0u/hLX7k/ulmEvLJGBqRJVflLLIc+VFSO2u4X64ri
         vd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489085; x=1746093885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAhE2hvzxTYkRTXNnlbXymQxLrf75SVoPXCltrmDJvs=;
        b=r2ONUKP6Rzmh+gpSvLC9p8dD69moNbf3+1CUheSmpkcVtsXgXPwLv7p9EJc1neEe3O
         dug69Fa+pJ5w+0559dyqTurGvgaiETYpttjN9Z/rXSkBDiP41P6r6Nmp/3ZRl4S6A4Ec
         biL7ZQgGR1zTmjWbblfDq2Fohm2rcRfC5CVH0SQhUJRfQt7OOLFBb2aJuAPPbgOPUfhc
         25ANsvHMqP262NIixNQ36my9BbSiKABA1K9S46hdrU8JA/icI9tAMvK34BAch56RRiVX
         qSyINRSORdBmc6HybwnsiYhrel0UAeWR3rntD7tZX1yH1MjELEtIY6NuFi1ndpWbwPF6
         FTZw==
X-Forwarded-Encrypted: i=1; AJvYcCUGQO+f4B0zmCG694MPUP9Fs9u9tVZxUKjQPJ1JkyAQgfpN1U4DnLPSIefToQfr1/lJdjwLwSGhGb4TVGybcGZT@lists.infradead.org
X-Gm-Message-State: AOJu0YzMQwJVh8KfpbtMsy/2WVPXlDKkBGNsdtv3PQYq1rNWXbcgjEPT
	0RwW749Ds46DuEyGqNf/PriCSMeiwlv5p+RjZZet/rst2pdg02WuZPTPp5VVKjy2OM+uJ1mEFvZ
	1j7y7rUA5x9hSMZeeYNG42jGwPnFM2Nd+Yx6ZxQ==
X-Gm-Gg: ASbGncsQH8P2zYncWLCWU8KewQxp+y/QgHbYWyf4VgYslK2nUjySvdFvSCCczS9EPj2
	7hWl6AMk/Vm8hRp71Twf4UCiBZM2ECQIyOCItJhhp5cM/deB6GR+5kwHk4FyaLjHQ9uRIoMe0T0
	nST+uEuYlgcTwnE9gDEv3uCuZQcRaPiQ7jMQ==
X-Google-Smtp-Source: AGHT+IHRN80V1KALg8QZOLapRyt4m3FJEY1PBgmKaeRU8QtTlcQsNpNO06R02rhYUFQKcspficc8vQEmJKzZwiZz8/c=
X-Received: by 2002:a05:690c:ed6:b0:703:c3ed:1f61 with SMTP id
 00721157ae682-7083ec82f04mr27461187b3.20.1745489085089; Thu, 24 Apr 2025
 03:04:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250318230042.3138542-1-sbellary@baylibre.com> <7h34efy1yb.fsf@baylibre.com>
In-Reply-To: <7h34efy1yb.fsf@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 12:04:08 +0200
X-Gm-Features: ATxdqUENVboYpckvehllaXvPNTBLeweZdKshsm3F8BsEr2O9Rx9nnzm5gOhifiU
Message-ID: <CAPDyKFrM7Qn2YtQKY+vCHP32Z_Ly-ECt=SU9EGojFu1ShktUpQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] PM: TI: AM335x: PM STANDBY fixes
To: Sukrut Bellary <sbellary@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Roger Quadros <rogerq@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Bajjuri Praneeth <praneeth@ti.com>, 
	Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_030446_698211_35D7674D 
X-CRM114-Status: GOOD (  20.44  )
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

On Fri, 11 Apr 2025 at 02:30, Kevin Hilman <khilman@baylibre.com> wrote:
>
> Sukrut Bellary <sbellary@baylibre.com> writes:
>
> > This patch series fixes the Power management issues on TI's am335x soc.
> >
> > on AM335x, the wakeup doesn't work in the case of STANDBY.
>
> This series is specifically targetted at the AM335x EVM (which I don't
> have to test), so I'd appreciate getting any test reports for this
> before I queue it up.
>
> For AM335x, I currently only have the ICEv2 and Beaglebone Black,
> neithor of which support suspend resume with RTC wake AFAICT.  If they
> do, please enlighten me. :)
>
> I was able to do a basic boot test on the 2 boards I have with this
> series applied on top of v6.15-rc1 and basic boot still works, but I was
> not able to test the PM path that's being changed here, so any tests on
> AM3 platforms that actually use this path are appreciated.
>
> Kevin

Is the pmdomain patch(3) ready to be applied here? Please let me know
if you want me to pick it up.

Kind regards
Uffe

