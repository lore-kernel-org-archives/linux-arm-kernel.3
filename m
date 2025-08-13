Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A4BC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnlFfu7fx2zDGb6puNkcBG8WEMDnuOsjkStSJt7ZaHo=; b=dEFo3Yf7zPFHWfLxyA3S1CC3k9
	FKckunn/DHPP7rbE7CkBWZOWUkGTfCX8Tc9z/3/KKyD0AA27Ofq2PEwOCJLql3AeQWh1gXGCmPitr
	4v78/QsscSXpM5ooacOE9yaJyuEXv4iXrrfZsD0cTv9s7XiCRjrQ2efN91sSNTfpbuSnBrP1Utxn2
	Nrac9LBH/TbDAK6/w4OF/VWR9+wnJiL1WFKiCKsEx/Dtb7dw+Z59tMxFumFboDkl/YcSfPRp83msl
	0ePzrULrZSnJZXBneHAFFOBpXc5ZMfHp3WrSRf2pAe+kmmt7nQohMiZfi38k64nqPtT1QO7eYQXXG
	r1szxiIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBHl-0000000DjHv-1nyd;
	Wed, 13 Aug 2025 13:12:57 +0000
Received: from mail-vs1-f48.google.com ([209.85.217.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umADS-0000000Darm-40il
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 12:04:28 +0000
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4fc18de8e1bso2188042137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 05:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755086665; x=1755691465;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnlFfu7fx2zDGb6puNkcBG8WEMDnuOsjkStSJt7ZaHo=;
        b=izggyiWALg0rxPmkLzz8xj0MSFqwScRsJm3d+7jmPS8PXPjUwosTgE7qd1vUmllRds
         8xXAty2gIkO78rIVQE/qawAq/0dbHvl+nkVgi0m74KXnmzgUwGp5aKYYkrM6veeAyjGo
         d16Uy4+RLbjfRFTQVpXHcLEWnR1KMIwQXuXQzzMXUrElc/iWL4iStkZv3TSZneu6XPsn
         gErPbYIxThjvZZdbsjYuFhBgLBKA3m0ZVzCgcy8dzfRFvwSjGxlLPGjB4jE19WAc+cry
         dWUsJ6m5MFQgkUOGG6ZyTnnHlIQDGDKhOVQUDlhI0MpQ4/n16PGCayk2xmCgnRiDRfk2
         TRAA==
X-Forwarded-Encrypted: i=1; AJvYcCW3H4niWiIdZGfFfEtLvEK0/c5t8jZ/u/Z9JL1sWZLP4FBx80nManyq0+VKdsm+Wkl4TG6jq2hjL64HYohWlv/4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Ps5aAnYFnkJJaoNdeZp9OSv4Gmnc1HTp9midftz2Iws4qmpy
	vg2rQEd3GXMzmwlQiKgcYk4Y4nXORm4W8xFa0aM+z0Zd5p3pzmC55GBn3BTFps5S
X-Gm-Gg: ASbGncttIb+ts0LjvzT022jb3LUolU2I+tsYohm8f/5hmPtmeopDvxDea4uP50RbVqb
	9bVHGe9cPpg1Ruo3Erv9J362wr27jPxYcqVDlD51F0GG4A4z760if9S+0cSA+mwVvZ/I8KcMLIz
	27NaWLAy4xJF+kEBRCcqYOwxVKJKi4MRnXmkarYXqhPXjCgQWoZzfnn7S7b/lvCKHGKKWtE1y37
	kHSlqmLa+pkCtcKIse9aqPbYnJV5lyIjnAXQn62PRG0BeKdCaveg0suUR+VmLb+rpJMAbKGZ+o4
	c7kVdURBXH3268yATEXjgRJkJ+5y1A7xENodYNvt1qG0nlo1NdkHNf2oOcTIRjyD9Z6u8feTq8b
	3E0A+w3QGX0FZqZV+BQm9SN+jWUFlC/7dX18JE6z+cro7cCebDabXUWoQQt0u
X-Google-Smtp-Source: AGHT+IEotmaEHq0h6IiJXqJuF60sJFeH9yEtYW9dw6ktnDgyXf0YGMPdqExIRxx6SIuvMkOUXMkfuQ==
X-Received: by 2002:a05:6102:f89:b0:4f1:7946:ed52 with SMTP id ada2fe7eead31-50e4eee6610mr983209137.12.1755086665376;
        Wed, 13 Aug 2025 05:04:25 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-50ab957df3asm1494839137.16.2025.08.13.05.04.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 05:04:24 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-88bd5f7e43cso2025861241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 05:04:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaOqzLp3FqXhNO0bSqhrWU0RjGNgg0Fy30oOGJU11AXUMjqivDk1RrmonQwo1bFjvQPXl5+VzNizIt/rbt3HZg@lists.infradead.org
X-Received: by 2002:a05:6102:e0e:b0:4e7:bf03:cd79 with SMTP id
 ada2fe7eead31-50e4e5d2141mr911079137.5.1755086663571; Wed, 13 Aug 2025
 05:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
In-Reply-To: <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Aug 2025 14:04:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHZZByTDhKUW4=vX45h7AJNXNzjHQSXMfEV=mdc8NCVw@mail.gmail.com>
X-Gm-Features: Ac12FXy-RTF6MSiz3MwhGjbIrkTvy8VuSBzBu0kMtbvvXbrItd-2qk19ZqkwC4Y
Message-ID: <CAMuHMdUHZZByTDhKUW4=vX45h7AJNXNzjHQSXMfEV=mdc8NCVw@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Lubomir Rintel <lkundrak@v3.sk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_050427_008834_5BA6C82D 
X-CRM114-Status: GOOD (  26.05  )
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

Hi Ulf,

On Wed, 9 Jul 2025 at 13:31, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > Changes in v3:
> >         - Added a couple of patches to adress problems on some Renesas
> >         platforms. Thanks Geert and Tomi for helping out!
> >         - Adressed a few comments from Saravanna and Konrad.
> >         - Added some tested-by tags.
>
> I decided it was time to give this a try, so I have queued this up for
> v6.17 via the next branch at my pmdomain tree.
>
> If you encounter any issues, please let me know so I can help to fix them.

FTR, I discovered two more issues with clock drivers registering a
genpd OF provider from CLK_OF_DECLARE(), which is now too early:
  1. drivers/clk/mmp/clk-of-mmp2.c,
  2. drivers/clk/renesas/clk-mstp.c.

I have submitted a fix for the second driver: "[PATCH] clk: renesas:
mstp: Add genpd OF provider at postcore_initcall()"
https://lore.kernel.org/all/81ef5f8d5d31374b7852b05453c52d2f735062a2.1755073087.git.geert+renesas@glider.be

I don't have MMP2 hardware, I guess it needs a similar fix.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

