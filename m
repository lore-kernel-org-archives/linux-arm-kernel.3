Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92DDCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtMVlOhfl7dVywIUmoTG/iwD9ZKg/EsOsz1i8lgIOSU=; b=TNooFO3rsWwczNmIr81lCKIul1
	jzogm7NOMBuc/2fjG4QLk8NrmLMjrJ+KJNCKNIC4TM/VGtbjyt1mf+InZe3JP5LFb6FGirNqxmV5z
	3F2fN7IyU+XafWzWtl+GXel08yNqE8sjdTguMyFZoMFUPwXUn17PBkif3qwwcGZboG7iInzU59Xg9
	Bu4ix/wDhQ5DJfOeDA7+pX+nC48meW7W+lQ6flBgPpR+MITe3ttP897RW4oHW1jxZdF2GAceaCm3h
	Ytm3tDn2Gf3CrbHCXE2oLlAxIgHNTNl1oLi4zpJufe6ng4mlQ81JOL0o9DJlplxqC68OqpJfUJZRH
	iuqVmEmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6qI-000000010nD-3pmJ;
	Tue, 06 Oct 2026 15:12:35 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6qD-000000010ld-0n87
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 15:12:33 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8ac4806e210so9427837b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 08:12:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299548; cv=none;
        d=google.com; s=arc-20260327;
        b=Mtu7GNLDJcBl44TA+2m1WChRGX7c52wIs4ah9xhplOGc25aGZcy8Z5iU5o7Ce+2u1Q
         XiZ05hZfvc1+QOmR6T5y4d07F9x6hSIgkcfjDtZUsUa35zGit0prG+SPn14AqbGGkxRu
         5KT9zm055Y6+IwDToT2ST5HEgnsblU4gxOVQdMlWJTwT3Ih72dNkQpxHL6qD7qfsGmiN
         3ZDhRG2dQL1sC1GhweraNMHryqB2HnTmmBOm/kE34pWKE8oP0tKW7oUN3ZPQaU60ELps
         lY2jUz+6gYLc9WrD2lqMXohz02A0dLOzaCZ9IzroQdd+FGuG6GfkZY1UNQgeHVfjkgM2
         SIpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mtMVlOhfl7dVywIUmoTG/iwD9ZKg/EsOsz1i8lgIOSU=;
        fh=NSd5IWYx/xYkQ3E6WUeQ9a36PcKjJweYvNUzGCi+hxk=;
        b=OUOMTZ9Ma67YYvUbpyzDDS1RhQ++QDK8CFHrFiEF7YXWvoG+iG/SmEvDHOqa8NlHYf
         o7e6Hmn1+/K7P85Q6clApbxY1X52xVT/hN1d8v4rz7kZ0+FWw0w9HggIj9L+6WRZ2n1G
         2uWoGpEwed70wu+E4MW7z5Lw6WOxNMmowk7vTKel8MDzI1sJQ6Idd4Y4wAEGzt6oOydI
         Xaa1e+m17o8DaqLWKfI8q+UpVbjjCg154SIfPoHsKh58Hmb5hxyeleMZZYo2+cCW1TJ+
         SLgsJblw/eoE/3RoLL5DBTMslq1ljq0P4HRyFEfxUEQ/l6a5vM/3Rdj1vz0WCOgMHG7P
         FxoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791299548; x=1791904348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mtMVlOhfl7dVywIUmoTG/iwD9ZKg/EsOsz1i8lgIOSU=;
        b=PP5Iph8YRRjp8kd4VZrbA+DUJa7YhxK2b6eSeJCJB//qHcdQigHd8zhj6s99qN4jmW
         pEjsi6xx2i/fxqaM0C0myP7thHFz9jX0aB74+t2ywObgHxlkkz3ic7IyLsrjAig9XusK
         a+lsDzZFBoqcsJVngiQQszwKk2FGlPyzHeriH7fd6yabt5tNxwJNHEFmUfSzmv18ODWu
         nW6BDzf2AW+8BF8nLCQjTH0nXNg5X5P9dD3M9df6nE90naaHCHl4gxOvj9k/rzHdnxR5
         ynbr1ZHK0N81JraQn0e3FALlW9eY/mMt279wfbSdJw3wHcg1Pac99DBnVviCo6owVNtw
         Y5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299548; x=1791904348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtMVlOhfl7dVywIUmoTG/iwD9ZKg/EsOsz1i8lgIOSU=;
        b=TS5m/cB7lz2ttaXJF8YjKROfesieaQMKiKETWcvZ880FC4cLbyankkimyxGVyF0vXf
         IbLJKbvc1Q3UC5TxsY7rv5T0tbcdxeA7sYKR4Hwt+83YjYU7hb4GWUEAShKTU5MBY5WG
         ZnSbxLz64dJoA4TVBn4mnBU9rVCsiTnx6jFbu5AKvrB2/dDpLcVnd49FthWU6mOGNpOb
         ryC5DsIJrsbFH+jiKmDHJmqK73vkzUmjHjMLfopqzgwzCkdf+DgdpliLJFwur+RmqglG
         Z9hBigmiO1Eht4l1qRv9nAPu1jsIDWGvWOWb7u6C0OCIKQqfCVZqswMXA3CfCl/mUnCm
         0zig==
X-Forwarded-Encrypted: i=1; AKwUvBw8DbitIGIc5L8mDroSf9xl+Q1Kky+ecUa49Urso72zD01tw6d43qQ8WtglGNnavxeNx6U09HZFcdNHpE/TTPQA@lists.infradead.org
X-Gm-Message-State: AFq9FYKpWNp1ATrvqRHQtDkI+7i5OSon5ZvZJv1pbbhUFQuXfrPqWmS2
	X6JbHGKxhyo+Uc1uIpdiuAFQJzp/ezgg+haj4/sEMzFaxYcMHAtAtoj8TFrkLhlzlWvYdgULUqI
	lzx1F01bX4rdijIUvwdrlRY64qt773uvgWE+n8PiLiw==
X-Gm-Gg: AYBFou2SoCr3VNEzTMqHOER2g0NkVy7vHdzV2+y7xboXu4N0tCfM0brmw8ruMlIAT75
	TtnJUAgZS6tGBDNEMDh90JU4f8rQYEKByQUAhrFZDeCioEeyb6Yz5P82r64q6zr4ZdnKlxBdD1P
	B/EILUN6kbygnoRdSrN1lg+r1WAVPgd2eQPGa6nK765qGhdFLkFytTDvLBwPHfujwbSRGK/EuSI
	6pmMqfA7IipVQg5Oo7cYYE7yI/bo3GZ7SLtUwmnuhqbQgvFSn/2G9Htl2GqMR1FcZHoQssce7eA
	e8+hi6qTAJCtmnxVcV5GMpg4lr0RfTd4SNYACtW+/GLb/J5YNKGw/oCLlURm59lsU8fZViZVd8N
	DaxqhnLjVJ5xJEwJFE2xL
X-Received: by 2002:a05:690c:85:b0:883:768:7432 with SMTP id
 00721157ae682-8b04f441f91mr9459587b3.49.1791299547459; Tue, 06 Oct 2026
 08:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
 <asQcQIh56MV1OJur@lore-desk> <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
 <asSb3RNcityVg6ia@lore-desk> <CAEev2e8c6hZQQom6NV-URgdSoWiafCcRR3BtA6yxxqy7T-me8g@mail.gmail.com>
 <asUGoxyJWVcsYBWG@lore-desk>
In-Reply-To: <asUGoxyJWVcsYBWG@lore-desk>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 6 Oct 2026 10:12:16 -0500
X-Gm-Features: AclHuK-RCm43_jlNT_lFUhdrwLSuRNyZQs6NCda3layOtVwA4kmc3GhgcBuqpZ4
Message-ID: <CAEev2e_+Dcj60Rj2+_UD=3_kNQxLK4rmWTGK-dr-Ve9mGJBARg@mail.gmail.com>
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Jose Abreu <Jose.Abreu@synopsys.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <fustini@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_081231_183986_295ED0BE 
X-CRM114-Status: GOOD (  33.80  )
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

Helo Lorenzo,

On Tue, Oct 6, 2026 at 9:33=E2=80=AFAM Lorenzo Bianconi
<lorenzo.bianconi@oss.qualcomm.com> wrote:
>
> On Oct 06, Anirudh Srinivasan wrote:
> > Hi Lorenzo,
> >
> > On Tue, Oct 6, 2026 at 1:57=E2=80=AFAM Lorenzo Bianconi
> > <lorenzo.bianconi@oss.qualcomm.com> wrote:
> > >
> > > > Hi Lorenzo,
> > > >
> > > > On Mon, Oct 5, 2026 at 4:53=E2=80=AFPM Lorenzo Bianconi
> > > > <lorenzo.bianconi@oss.qualcomm.com> wrote:
> > > > >
> > > > > > On Tue, Sep 29, 2026 at 03:10:11PM +0200, Lorenzo Bianconi wrot=
e:
> > > > > > > stmmac_update_subsecond_increment() ignores the error returne=
d by
> > > > > > > stmmac_config_addend(), and stmmac_init_tstamp_counter() disc=
ards the
> > > > > > > addend and system time programming errors, always returning s=
uccess. A
> > > > > > > failure to program the addend (PTP_TCR_TSADDREG) or to initia=
lize the
> > > > > > > system time counter (PTP_TCR_TSINIT) is therefore silently sw=
allowed,
> > > > > > > leaving the hardware timestamp counter in a non-running or pa=
rtially
> > > > > > > configured state while the driver keeps operating as if times=
tamping
> > > > > > > were up. This matters for TAPRIO/EST offloading, which derive=
s the gate
> > > > > > > base time from the hardware timestamp counter.
> > > > > > >
> > > > > > > The same hooks are also called from the PHC callbacks: settim=
e64 and
> > > > > > > adjfine drop the error and report success to clock_settime() =
and
> > > > > > > clock_adjtime(), so a dead PTP reference clock goes unnoticed=
 by
> > > > > > > ptp4l/phc2sys.
> > > > > > >
> > > > > > > Return error codes from stmmac_update_subsecond_increment(),
> > > > > > > stmmac_init_tstamp_counter(), stmmac_dl_ts_coarse_set() and t=
he
> > > > > > > settime64/adjfine callbacks instead of silently returning suc=
cess. On
> > > > > > > failure, roll back the partially applied configuration so the=
 hardware
> > > > > > > and the driver bookkeeping stay consistent, and report the re=
ason
> > > > > > > through the devlink extack. Also guard against a zero sub-sec=
ond
> > > > > > > increment, which would otherwise divide by zero when computin=
g the
> > > > > > > addend.
> > > > > > >
> > > > > > > Reset the persistent timestamping state (hwts_tx_en, hwts_rx_=
en,
> > > > > > > tstamp_config, systime_flags and tsfupdt_coarse) when (re)ini=
tializing
> > > > > > > timestamping, so a failed init does not leave TX/RX timestamp=
ing
> > > > > > > enabled on a counter that never started.
> > > > > > >
> > > > > > > Fixes: cc4c9001ce31 ("net: stmmac: Switch stmmac_hwtimestamp =
to generic HW Interface Helpers")
> > > > > > > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcom=
m.com>
> > > > > > > ---
> > > > > > > Changes in v3:
> > > > > > > - Do not run stmmac_config_addend() in
> > > > > > >   stmmac_update_subsecond_increment() error path.
> > > > > > > - Return error from stmmac_adjust_freq() and stmmac_set_time(=
).
> > > > > > > - Reset hw ts configuration in stmmac_init_timestamping().
> > > > > > > - Link to v2: https://lore.kernel.org/r/20260924-stmmac-ptp-a=
dded-systime-error-v2-1-beb2a6b5f866@oss.qualcomm.com
> > > > > > >
> > > > > > > Changes in v2:
> > > > > > > - Initialize sec_inc to 0 in stmmac_restore_subsecond_increme=
nt()
> > > > > > >   routine.
> > > > > > > - Link to v1: https://lore.kernel.org/r/20260920-stmmac-ptp-a=
dded-systime-error-v1-1-8ac9e7a3fce2@oss.qualcomm.com
> > > > > > > ---
> > > > > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 106 ++++=
++++++++++++------
> > > > > > >  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  10 +-
> > > > > > >  2 files changed, 84 insertions(+), 32 deletions(-)
> > > > > >
> > > > > > Hello, I'm noticing that after this patch was merged into linux=
-next,
> > > > > > boot seems to hang when ip=3Ddhcp is used because ethernet isn'=
t working
> > > > > > on the TH1520 Lichee Pi 4a. These lines get printed in a loop o=
ver and
> > > > > > over
> > > > > >
> > > > > > IP-Config: end0 hardware address 72:ca:a8:eb:27:[   24.872982] =
thead-dwmac ffe7070000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
> > > > > > f2 mtu 1500 DHCP
> > > > > > [   24.900412] thead-dwmac ffe7070000.ethernet end0: PHY [stmma=
c-0:01] driver [RTL8211F Gigabit Ethernet] (irq=3DPOLL)
> > > > > > [   24.912780] dwmac1000: Master AXI performs any burst length
> > > > > > [   24.912801] thead-dwmac ffe7070000.ethernet end0: No Safety =
Features support found
> > > > > > [   25.010229] thead-dwmac ffe7070000.ethernet end0: PTP init f=
ailed
> > > > > > SIOCSIFFLAGS: Connection timed out
> > > > >
> > > > > Hi Anirudh,
> > > > >
> > > > > based on the reported error, stmmac_init_tstamp_counter() fails w=
ith
> > > > > -ETIMEDOUT. In particular this can occurs if:
> > > > >
> > > > > stmmac_init_tstamp_counter()
> > > > >  -> stmmac_update_subsecond_increment() -> stmmac_config_addend()=
 -> -ETIMEDOUT
> > > > >  -> stmmac_init_systime() -> -ETIMEDOUT
> > > > >
> > > > > I guess we should understand which one is failing and why it is f=
ailing.
> > > >
> > > > It seems like both are timing out, both config_addend
> > > > (PTP_TCR_TSADDREG) and init_systime (PTP_TCR_TSINIT).
> > >
> > > It seems hw timestamping has never worked on this board, it was just
> > > undiscovered since stmmac_init_tstamp_counter() was not reporting any
> > > error before (this is exactly the goal of this patch).
> > >
> > > What are the output for:
> > > - IEEE 1588-2002 Time Stamp
> > > - IEEE 1588-2008 Advanced Time Stamp
> > >
> > > root@rb3-gen2:~# grep 'Time Stamp' /sys/kernel/debug/stmmaceth/eth0/d=
ma_cap
> > > IEEE 1588-2002 Time Stamp: N
> > > IEEE 1588-2008 Advanced Time Stamp: Y
> >
> > This is what I see
> >
> > root@debian-trixie-riscv64:/# grep 'Time Stamp'
> > /sys/kernel/debug/stmmaceth/end0/dma_cap
> > IEEE 1588-2002 Time Stamp: N
> > IEEE 1588-2008 Advanced Time Stamp: Y
>
> Unfortunately I do not have this board for debugging. The first idea
> I got is maybe 100ms is too small for this SoC? Can you please try to
> increase it to like 500ms?

That doesn't help either.

Maybe someone more familiar with this board/has used PTP on it before
can help out understanding why this is happening. Maybe this is some
issue to do with clocks.

Regards
Anirudh

