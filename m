Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036A1C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:From:To:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q1tB+NUjtJN26A732RGBTVR5Zg/SUYLoRlN+gaghCLQ=; b=PsLUgE35L3wK5s8f9jPMjonMaY
	8QsN/Abgua5xsMH4bVRqTmb1V9aT6peHlKZNwzpacr2l/y3rSYD/b8TqdywBY+Sw5vu34Pta0xfQT
	3oDHMCAceUAdA5dlkv4mwKGES2gHi/KfbQ8Hl21BD4T9TsyDOzVaHDRrmbpQAe2xFS6KqnSlKtM9m
	Pc3zcxFPIkSEm6wLfrusFsWfrF2azhhO3AOi8EQHtBtggFtcKBj6Nh0M4/6iiWw3epxoztWMiCsSa
	lGpxTS9B6IgF37J5EhCaIRapici1hKxMzUw6c2TWSPdNr+3SZ1+MyrPpvj7D1Lpc3vOGe4tBeDXZP
	fFi1xICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dzq-00000004hjH-1HJw;
	Mon, 14 Sep 2026 21:13:50 +0000
Received: from mail-4323.protonmail.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Dzk-00000004hiv-1knN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:13:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gdead.co.uk;
	s=protonmail; t=1789420420; x=1789679620;
	bh=Q1tB+NUjtJN26A732RGBTVR5Zg/SUYLoRlN+gaghCLQ=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=MDWlfIqYxZG8Mcvf3bl08KZmmwKem41lSbV694Mbtw3awMvGys3Ag9glJTYxzX94d
	 VR0JF7pdae/NtpBfPLh57vj+PS0NU4vkLthFatnexbS1KMaDit+BWX/Q26/QvrB6os
	 onfAr3uQ26AYpxCA+PfBHjbeKg782lPI1c/DBAlnQdY9YAWgdNNhttXYRq/kvHBf1E
	 L7/6x2Ndbi9Wyzl1ZUOMZxmFdka7rzY/m/Ws3Zb6LKkzP7Hb31t1wGZFg+P3oHGki4
	 xglPDMWUFzpyuNxZvmCCMuD4Pp9WriVB8ZSjAR3cdcUIS3qLbsAGeMeHPIVIIgdpkb
	 xAAXbUHQKBt7w==
Date: Mon, 14 Sep 2026 21:13:36 +0000
To: linux-arm-kernel@lists.infradead.org
From: Trevor Hemsley <nospam@gdead.co.uk>
Subject: Possible scheduler bug on Rock 5B RK3588 on 7.2.5
Message-ID: <70e8e6c2-1130-41ff-b482-5081ea90119e@gdead.co.uk>
Feedback-ID: 206881191:user:proton
X-Pm-Message-ID: 15672b228227cae408b8b5e2ce517418deb917e0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_141345_486406_49825875 
X-CRM114-Status: GOOD (  20.53  )
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

Hi

I recently acquired an 8GB Radxa Rock 5B (they're comparatively cheap),=20
which uses a Rockchip RK3588 chip and have installed armbian on there=20
and while stress testing the new machine I noticed something quite odd.=20
If I run `openssl speed -multi 8` then watch using top or btop that=20
shows individual cores, I see it start off using all 8 cores and then=20
just stop using one of them at random. Every few minutes it will flip=20
the inactive core to a different one but there is always one idle. It=20
seems to prefer the 0-3 slower cores to be idle but I've also seen it=20
pick the faster cores 4-7 and stop using those but once it starts it=20
seems to never use more than 87.5% cpu as one core is dropped from use.

I do not think this is a thermal problem as the cpu temp reported is < 57C.

I=E2=80=8B have also run `for i in {0..7}; do taskset -c $i openssl speed &=
=20
done` and this starts 8 processes and pins each process to a specific=20
core in which case they all run at 100%, all of the time. This seems to=20
me to indicate that it is a scheduler problem as I'm manually telling it=20
where to run it. That solves the problem but is unrealistic in real ife.

I have tested this on several armbian supplied kernels from 6.12.58 to=20
7.2.5 and the results are similar on all of them. After some period of=20
time, it will stop using one or more cores even though there are=20
dispatchable tasks waiting. I have also substituted `stress --cpu 8` for=20
openssl speed -multi 8 and the results are the same so that seems to=20
rule out an openssl bug. If I increase the number of tasks the problem=20
still occurs, I've used 8 9 10 11 and 12 and after a while - the more=20
the requested tasks the longer it takes - it still ends up giving up on=20
one core. I have also had reports from 2 other Rock 5B users that can=20
reproduce this behaviour, one even told me that his was idling 2 cores=20
(using a 7.1 kernel) and the other says it's better after installing=20
kernel 7.2.5 although that is not my experience. I've tested 6.12.58,=20
6.18.44, 7.1.8 and 7.2.5 with very little change in symptoms.

I also have an old Odroid HC1 which uses a Samsung Exynos 5422 and has a=20
similar 8 core big:little processor setup and is running Debian 13 with=20
a 6.12.107 kernel and this does not exhibit the problem. Same underlying=20
Debian 13 version on this as the Rock 5B. I tested the Rock 5B with the=20
6.12.58 armbian kernel as it was the most similar to the working one on=20
the HC1 in case it was some form of regression.

There are no diagnostic messages in the output from `dmesg -T`. If it=20
were thermal or some hardware problem I would expect to be told about it=20
there.

$=C2=A0 uname -a
Linux rock-5b 7.2.5-edge-rockchip64 #1 SMP PREEMPT Fri Sep 11 09:51:26=20
UTC 2026 aarch64 GNU/Linux

I caught it idling 2 cores for about 2 minutes:
top - 20:49:22 up=C2=A0 1:36,=C2=A0 3 users,=C2=A0 load average: 8.30, 8.31=
, 8.28
Tasks: 205 total,=C2=A0 =C2=A09 running, 196 sleeping,=C2=A0 =C2=A00 stoppe=
d,=C2=A0 =C2=A00 zombie
%Cpu0=C2=A0 :100.0 us,=C2=A0 0.0 sy,=C2=A0 0.0 ni,=C2=A0 0.0 id,=C2=A0 0.0 =
wa,=C2=A0 0.0 hi,=C2=A0 0.0 si,=C2=A0=20
0.0 st
%Cpu1=C2=A0 :=C2=A0 0.0 us,=C2=A0 0.0 sy,=C2=A0 0.0 ni, 99.7 id,=C2=A0 0.0 =
wa,=C2=A0 0.0 hi,=C2=A0 0.3 si,=C2=A0=20
0.0 st
%Cpu2=C2=A0 : 99.7 us,=C2=A0 0.0 sy,=C2=A0 0.0 ni,=C2=A0 0.0 id,=C2=A0 0.0 =
wa,=C2=A0 0.3 hi,=C2=A0 0.0 si,=C2=A0=20
0.0 st
%Cpu3=C2=A0 : 99.7 us,=C2=A0 0.0 sy,=C2=A0 0.0 ni,=C2=A0 0.0 id,=C2=A0 0.0 =
wa,=C2=A0 0.3 hi,=C2=A0 0.0 si,=C2=A0=20
0.0 st
%Cpu4=C2=A0 :100.0 us,=C2=A0 0.0 sy,=C2=A0 0.0 ni,=C2=A0 0.0 id,=C2=A0 0.0 =
wa,=C2=A0 0.0 hi,=C2=A0 0.0 si,=C2=A0=20
0.0 st
%Cpu5=C2=A0 :100.0 us,=C2=A0 0.0 sy,=C2=A0 0.0 ni,=C2=A0 0.0 id,=C2=A0 0.0 =
wa,=C2=A0 0.0 hi,=C2=A0 0.0 si,=C2=A0=20
0.0 st
%Cpu6=C2=A0 :=C2=A0 0.3 us,=C2=A0 0.0 sy,=C2=A0 0.0 ni, 99.7 id,=C2=A0 0.0 =
wa,=C2=A0 0.0 hi,=C2=A0 0.0 si,=C2=A0=20
0.0 st
%Cpu7=C2=A0 :100.0 us,=C2=A0 0.0 sy,=C2=A0 0.0 ni,=C2=A0 0.0 id,=C2=A0 0.0 =
wa,=C2=A0 0.0 hi,=C2=A0 0.0 si,=C2=A0=20
0.0 st

 =C2=A0 =C2=A01599 ?=C2=A0 =C2=A0 =C2=A0 =C2=A0 S=C2=A0 =C2=A0 =C2=A0 0:00=
=C2=A0 |=C2=A0 =C2=A0\_ sshd-session: trevor@pts/0
 =C2=A0 =C2=A01600 pts/0=C2=A0 =C2=A0 Ss=C2=A0 =C2=A0 =C2=A00:00=C2=A0 |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0\_ -bash
 =C2=A0 10802 pts/0=C2=A0 =C2=A0 S+=C2=A0 =C2=A0 =C2=A00:00=C2=A0 |=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\_ stress --cpu 8
 =C2=A0 10803 pts/0=C2=A0 =C2=A0 R+=C2=A0 =C2=A0 42:58=C2=A0 |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\_ stress --cpu 8
 =C2=A0 10804 pts/0=C2=A0 =C2=A0 R+=C2=A0 =C2=A0 43:40=C2=A0 |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\_ stress --cpu 8
 =C2=A0 10805 pts/0=C2=A0 =C2=A0 R+=C2=A0 =C2=A0 42:17=C2=A0 |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\_ stress --cpu 8
 =C2=A0 10806 pts/0=C2=A0 =C2=A0 R+=C2=A0 =C2=A0 43:00=C2=A0 |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\_ stress --cpu 8
 =C2=A0 10807 pts/0=C2=A0 =C2=A0 R+=C2=A0 =C2=A0 53:02=C2=A0 |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\_ stress --cpu 8
 =C2=A0 10808 pts/0=C2=A0 =C2=A0 R+=C2=A0 =C2=A0 55:12=C2=A0 |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\_ stress --cpu 8
 =C2=A0 10809 pts/0=C2=A0 =C2=A0 R+=C2=A0 =C2=A0 55:12=C2=A0 |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\_ stress --cpu 8
 =C2=A0 10810 pts/0=C2=A0 =C2=A0 R+=C2=A0 =C2=A0 47:29=C2=A0 |=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\_ stress --cpu 8

Still 8 threads running.

This looks like a kernel bug to me?

I'm writing from an email address that is not subscribed to=20
linux-arm-kernel as I looked at the archives and it's a bit too active=20
for me so if you have any questions or suggestions please include me direct=
.

Thanks

Trevor Hemsley


