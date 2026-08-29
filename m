Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C343C61DDE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 22:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQnJuD+BPGQBF7rfni0A/KmSwUG6YkQKLCt4vUrM/bo=; b=GsXMUjfsqaQGJLD7jOg7TmG8hG
	i9avSuy5w7U+zI6XAahHAM2HtSQcnZ710JYxtXMriYk9OljG9RyEf8M77AQur/+fid9kpa9ro7krt
	50VOuxGdJZEp3lwd8wuqSqIEhduwQbGjztinjN3lENZWPN/mJhjRNfHqzae2237sRlAItReL0b6yP
	/vAGYW+KqUAa1perbP2LTTzqsC3BAMTNaoH+B4WV0ocqAQV4p5wj1FH9BIRBFguB800wjUPxJVRiO
	W0tSLJHFvAxkoAGMMUcbMKLAVWRfF1QSz9gYkypPj6YZCWjwCUIfHI6oeVyleJf4WWUdx5Eim/Eax
	DFv33VQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0R5o-00000007Lv7-3Ypm;
	Sat, 29 Aug 2026 22:00:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0R5m-00000007Lu6-2ZAS;
	Sat, 29 Aug 2026 22:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=wQnJuD+BPGQBF7rfni0A/KmSwUG6YkQKLCt4vUrM/bo=; b=Js1UJoPKOfEHMGQOg87SKX9bxK
	/2s7G1BJ9LV47M6RpZFAM3rTqVJ4mwXemCDYBbXyIrxyC/Yun7FhMWvNLh1ECwlV259ZLY1vShQtT
	quCFoTrYfMIgZ4TIH4rMVAbmAkaxvXeQRDSNYMIPxvwUXVS/5m1oETvlQS4CdSMsbDRkPWBDejDvf
	TBpCUOehdumIJNr3Jfhbu79KryMwhMDWvSOHn5KwEKPyZk9QyHfgRBVPMyvfVY8ifk4kIzhANyW2D
	sg41H4OANc6ZRdWnPHqXzyhHsR5Xye88MmchNkuhapMzr30VXlL3++SqagTH8w/Nnebz1rXeF1JDP
	+HSJqqCg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Russell King <linux@armlinux.org.uk>, jbx6244@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>,
 Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH] ARM: rockchip: smp: enable CPU1 for rk3066a
Date: Sat, 29 Aug 2026 23:59:55 +0200
Message-ID: <2667576.VLH7GnMWUR@diego>
In-Reply-To: <20260829-cpu-v1-1-33dca576db92@gmail.com>
References: <20260829-cpu-v1-1-33dca576db92@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_150002_757072_A36C1315 
X-CRM114-Status: GOOD (  15.72  )
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

Am Samstag, 29. August 2026, 01:40:57 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Johan Jonker via B4 Relay:
> From: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
>=20
> RK3066a CPU1 fails to come online. Fix by using
> a similar mailbox construction as in use with
> other Rockchip SoCs.

"RK3066 CPU1 fails to come online with recent kernels....[rest]" or so
and also please use the line length up a resonable length like around 70
to 75 characters.

Also, is it known, why that happens - i.e. what changed?

> Signed-off-by: H=C3=BCseyin BIYIK <boogiepop@gmx.com>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  arch/arm/mach-rockchip/platsmp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/pl=
atsmp.c
> index f659d894bfae..d7d080c29f3c 100644
> --- a/arch/arm/mach-rockchip/platsmp.c
> +++ b/arch/arm/mach-rockchip/platsmp.c
> @@ -133,7 +133,8 @@ static int rockchip_boot_secondary(unsigned int cpu, =
struct task_struct *idle)
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (read_cpuid_part() !=3D ARM_CPU_PART_CORTEX_A9) {
> +	if (read_cpuid_part() !=3D ARM_CPU_PART_CORTEX_A9 ||
> +	    of_machine_is_compatible("rockchip,rk3066a")) {
>  		/*
>  		 * We communicate with the bootrom to active the cpus other
>  		 * than cpu0, after a blob of initialize code, they will

isn't now the only user of the old system the RK3188?

With both rk3066 and rk3188 from a similar time, I'd assume both could
be switch and thus the the now unused code removed?

I've never thought to look into that ... need to find my RK3188 board :-)


Heiko



