Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB91D31A05
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 02:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rlgNdwYg/UPRcrtfVY6nMix7eUIHK4zpY8tIsFjEi0=; b=Z6+o3ldj0lgr3UieKiNGyuHBB9
	AZ17pWbE0naK602qdpSnhJXdwjJjmq0cB4SlaRsdlddCzeDvMaRTmTHjoR0dOAz3u0GLDClOG1X8A
	g6ECuW+3FEuXTsSeHedkMP6zotO8NtybUvESnoDPluG+HHVydbaXrWiNbTGgQejM4YYpVsz6JjOnK
	QLl1JjkktBQuF+DXVYcQCqnGxWY1vdNqa2jFlsSVqj2JLwx2GnTVZJ5KMoyQ3IqByC/SGtXPJUMMx
	Nn11G9r7xvGBVnN0W274zs0D2gS/DblmZ9TdjvYztONveXe1E1LI73wCJputoUWsQ9l6lfsNH5j8s
	rK2Z2DoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfqPN-00000007z3Y-3wGF;
	Wed, 14 Jan 2026 02:14:53 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfqPM-00000007z2n-0BjJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 02:14:53 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59b89e1cf34so515910e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 18:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768356889; cv=none;
        d=google.com; s=arc-20240605;
        b=MqK/fPeRgvFT3oMLKAJIFH2SVsfDfVCSc0Z7MOc/rWUzdPgg+/LGdXJ5uIjTKc4PSn
         QCKecRznAe6sDYD3xZUykiC5+9gU8OXtIFu8i+5qyEQB/RbJqH/PvTER4yypgzFzJzo3
         2dJGMt1AhHX2O3zRlu1JPicsrGT6/UNZmpxf7O/WjAKX9Kg7j/aNKguI1Xz8eYyxhcZN
         zluO4nMny9j1Xg/qqMhhR+CBZol3MIt7XwLtKGAfS31IVR7NcRCDT5sU7wFYe8y0c5T/
         Kymv62wn3yBPpJI1ifc5Af+x1F0z1+61azJSK+BrXb5PWYVSD2J9FQ05X8E7ermmQpQ0
         x/Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2rlgNdwYg/UPRcrtfVY6nMix7eUIHK4zpY8tIsFjEi0=;
        fh=JtDPTAxeQMBtiUH2zPHqWr27X18Hlo6yU6P53zBOcL8=;
        b=iC/rlzhQ7k84HcoYow1l6ITJQEa7Ioj6ujbkxv9LcY9KHh0Pg1nIuQet/vhbQOVYUX
         c4F67P1wFd1xL4SDMKGYcuc1gevoXFXVTp2aLtYUO161AwSltDWCX5LVsWbQOoJks4Cd
         d20b5Taob0PKZXBGVPALSTf8Wukme/Xs7MT9Z1gdZkr+YQDbE0Sba8QyFvPf64AjJTPX
         7TRmDwCc25MmllKV7FTFMN6M1S07IQWZ4XZzqu88q7YHBMRDsKaBUeM8Cagq57X9x84D
         UaTmKviWtWZR2olYQpC27jQBzGGb1OFJz5ZR0ORXtBw1quSrTbU8Ozjuc5qOZLoj5Sak
         FfoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768356889; x=1768961689; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rlgNdwYg/UPRcrtfVY6nMix7eUIHK4zpY8tIsFjEi0=;
        b=NVHAx2qKvU+SHGVpfwc6HxiPDEHsoNFmI/IOWqFQwcRF2M2Y+rP700HHQmsBMSsN4k
         qHQjyNiV3xb/q9c3VKoowxbC0ihEqIwL3pymjW/ncp38RakgMuYTK0egZWnB3kS9TE04
         0eMTIj2YpgdtIcfOFHfw/ZSnhhFdk0H1dHTAQ/nZG4VUXV2ggbFS48x/p9CaoI+ja+px
         gtieJVvA8o1uozkLu39z61xqK/LZV0garPZ5VDiGex5ZVZ9uUllzA9WmX5vVGQBnJV5+
         sELzKI/gAvDK2o1R3xf9eNGwHHNYcdDZJ48fpqrhQW+nL34sn6PtZOEY8shTcHXUTVW5
         7jSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768356889; x=1768961689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2rlgNdwYg/UPRcrtfVY6nMix7eUIHK4zpY8tIsFjEi0=;
        b=mzZW7evtDFexHOg952A143NW7klcMp4Wg6dzMZ2T2w6IMERqn6L/gcg7fxq4H6LMm6
         MBrMY8ShmCUWsYVB1KphZuNhfK+63zWoqi384Z80sf2QLCvC74azHiRq8B6vhbgtf7vi
         6ZsQQzsDb606NlUtnOMDxd+Zp6GTkbBHqg6mAtdy5qCFKxYrCU+d25CqaPKTWle9WawS
         7HuUYrOphu11j70eLd4cPMvA52LqbFFvOuH4KQecj7fCqlp6TpnZfYMyjuJ2dzYaw3bC
         x5MCgtG3dNWhUKD4EPF5xzAnvnHNfuWhL6ch8kNrVxICVyy4BnNTW9AGTn6tpN6TlfUx
         F4ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVhUlxjywhpgIuX1eHLFR0WgHVWM74gdTbhGu3E+GZZivjQpeb2LFQSJWj1IRVShHEkeVC8kptkYxRKB4z6BGqY@lists.infradead.org
X-Gm-Message-State: AOJu0YzOnoHmFQCWufYLaxxuD+2/PE4bZiKwix//2TAP2w/yzjKV3yJb
	+scglyKR34L6QWayhstkCB8EuZuBxxZwJgHz1tehOjM++Ht+c8J1fRlnffEzmnjK8AAcw3qcbov
	K+TfqYdHBSC4F9d0TNMRoOqdvteOlGB0=
X-Gm-Gg: AY/fxX5u0svUm4QCFOuBN53lgEpdyALwv26PBMrmhdtg+EbKGxrS8vhHp6Y3Mnr1715
	G0dcaT9PsSUAjC0WEkjqd0JHcg1UKTTNISYc96vy3k34u9tIj3T4wUukS4eHj7mXzdC2dOiZBFG
	lhf+YYzLhXpM1hyJrud7TJFLQKIBUmthx4qbt4DMY1z2SLfa5/scS3lTtBaKb6CkkHZZLmPT5p5
	8coR7u1JxCAxJfIhqApyQGKAIAhATz6ClqI8Rx1u5/DzMLS29Ax0rkU9UeKZcEI4fZgr3hK
X-Received: by 2002:a2e:be1a:0:b0:37b:9b58:dd05 with SMTP id
 38308e7fff4ca-3836079ddb6mr1473281fa.7.1768356888859; Tue, 13 Jan 2026
 18:14:48 -0800 (PST)
MIME-Version: 1.0
References: <20260114013745.133439-1-zhaoyang.huang@unisoc.com>
In-Reply-To: <20260114013745.133439-1-zhaoyang.huang@unisoc.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Wed, 14 Jan 2026 10:14:37 +0800
X-Gm-Features: AZwV_QiLdZdxshJuYSDeRADDklOHNYiq_8g4SnnkyIdHZ678QqA5GTz0iSRheKY
Message-ID: <CAGWkznE7Aa1tXcCvYJxFsrDWeD0eAL16ArJbrb6dyFo7quJ8Lw@mail.gmail.com>
Subject: Re: [PATCH] arch: arm64: set __nocfi on swsusp_arch_resume
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, James Morse <james.morse@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	steve.kang@unisoc.com, jeson.gao@unisoc.com, xuewen.yan@unisoc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_181452_130550_99D6BF1B 
X-CRM114-Status: GOOD (  21.79  )
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

loop James Morse

On Wed, Jan 14, 2026 at 9:38=E2=80=AFAM zhaoyang.huang
<zhaoyang.huang@unisoc.com> wrote:
>
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>
> A DABT is reported[1] on an android based system when resume from hiberat=
e,
> which is root caused as CFI will plant stub code[2] to verify the
> swsusp_arch_suspend_exit's authentication, where the hash value is stored
> before the page that alloced by create_safe_exec_page. We also have
> tried to copy the hash value together with the function but get failed si=
nce
> the value is not on the desired position(src_start - 4). So we solve
> this issue by setting __nocfi on swsusp_arch_resume and it works.
>
> [1]
> [   22.991934][    T1] Unable to handle kernel paging request at virtual =
address 0000000109170ffc
> [   22.991934][    T1] Mem abort info:
> [   22.991934][    T1]   ESR =3D 0x0000000096000007
> [   22.991934][    T1]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> [   22.991934][    T1]   SET =3D 0, FnV =3D 0
> [   22.991934][    T1]   EA =3D 0, S1PTW =3D 0
> [   22.991934][    T1]   FSC =3D 0x07: level 3 translation fault
> [   22.991934][    T1] Data abort info:
> [   22.991934][    T1]   ISV =3D 0, ISS =3D 0x00000007, ISS2 =3D 0x000000=
00
> [   22.991934][    T1]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
> [   22.991934][    T1]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D=
 0
> [   22.991934][    T1] [0000000109170ffc] user address but active_mm is s=
wapper
> [   22.991934][    T1] Internal error: Oops: 0000000096000007 [#1] PREEMP=
T SMP
> [   22.991934][    T1] Dumping ftrace buffer:
> [   22.991934][    T1]    (ftrace buffer empty)
> [   22.991934][    T1] Modules linked in:
> [   22.991934][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.98-a=
ndroid15-8-g0b1d2aee7fc3-dirty-4k #1 688c7060a825a3ac418fe53881730b355915a4=
19
> [   22.991934][    T1] Hardware name: Unisoc UMS9360-base Board (DT)
> [   22.991934][    T1] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -S=
SBS BTYPE=3D--)
> [   22.991934][    T1] pc : swsusp_arch_resume+0x2ac/0x344
> [   22.991934][    T1] lr : swsusp_arch_resume+0x294/0x344
> [   22.991934][    T1] sp : ffffffc08006b960
> [   22.991934][    T1] x29: ffffffc08006b9c0 x28: 0000000000000000 x27: 0=
000000000000000
> [   22.991934][    T1] x26: 0000000000000000 x25: 0000000000000000 x24: 0=
000000000000820
> [   22.991934][    T1] x23: ffffffd0817e3000 x22: ffffffd0817e3000 x21: 0=
000000000000000
> [   22.991934][    T1] x20: ffffff8089171000 x19: ffffffd08252c8c8 x18: f=
fffffc080061058
> [   22.991934][    T1] x17: 00000000529c6ef0 x16: 00000000529c6ef0 x15: 0=
000000000000004
> [   22.991934][    T1] x14: ffffff8178c88000 x13: 0000000000000006 x12: 0=
000000000000000
> [   22.991934][    T1] x11: 0000000000000015 x10: 0000000000000001 x9 : f=
fffffd082533000
> [   22.991934][    T1] x8 : 0000000109171000 x7 : 205b5d3433393139 x6 : 3=
92e32322020205b
> [   22.991934][    T1] x5 : 000000010916f000 x4 : 000000008164b000 x3 : f=
fffff808a4e0530
> [   22.991934][    T1] x2 : ffffffd08058e784 x1 : 0000000082326000 x0 : 0=
00000010a283000
> [   22.991934][    T1] Call trace:
> [   22.991934][    T1]  swsusp_arch_resume+0x2ac/0x344
> [   22.991934][    T1]  hibernation_restore+0x158/0x18c
> [   22.991934][    T1]  load_image_and_restore+0xb0/0xec
> [   22.991934][    T1]  software_resume+0xf4/0x19c
> [   22.991934][    T1]  software_resume_initcall+0x34/0x78
> [   22.991934][    T1]  do_one_initcall+0xe8/0x370
> [   22.991934][    T1]  do_initcall_level+0xc8/0x19c
> [   22.991934][    T1]  do_initcalls+0x70/0xc0
> [   22.991934][    T1]  do_basic_setup+0x1c/0x28
> [   22.991934][    T1]  kernel_init_freeable+0xe0/0x148
> [   22.991934][    T1]  kernel_init+0x20/0x1a8
> [   22.991934][    T1]  ret_from_fork+0x10/0x20
> [   22.991934][    T1] Code: a9400a61 f94013e0 f9438923 f9400a64 (b85fc11=
0)
>
> [2]
> 0xffffffd08064a878 <swsusp_arch_resume+596>:    mov     x0, x24
> 0xffffffd08064a87c <swsusp_arch_resume+600>:    mov     x1, x20
> 0xffffffd08064a880 <swsusp_arch_resume+604>:    mov     x2, x21
> 0xffffffd08064a884 <swsusp_arch_resume+608>:    mov     x3, x22
> 0xffffffd08064a888 <swsusp_arch_resume+612>:    mov     x4, x23
> 0xffffffd08064a88c <swsusp_arch_resume+616>:    ldur    w16, [x25, #-4]
> 0xffffffd08064a890 <swsusp_arch_resume+620>:    movk    w17, #0x5d7b
> 0xffffffd08064a894 <swsusp_arch_resume+624>:    movk    w17, #0xb6ad, lsl=
 #16
> 0xffffffd08064a898 <swsusp_arch_resume+628>:    cmp     w16, w17
> 0xffffffd08064a89c <swsusp_arch_resume+632>:    b.eq    0xffffffd08064a8a=
4 <swsusp_arch_resume+640>  // b.none
> 0xffffffd08064a8a0 <swsusp_arch_resume+636>:    brk     #0x8239
> 0xffffffd08064a8a4 <swsusp_arch_resume+640>:    blr     x25
>
> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> ---
>  arch/arm64/kernel/hibernate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.=
c
> index 18749e9a6c2d..9717568518ba 100644
> --- a/arch/arm64/kernel/hibernate.c
> +++ b/arch/arm64/kernel/hibernate.c
> @@ -402,7 +402,7 @@ int swsusp_arch_suspend(void)
>   * Memory allocated by get_safe_page() will be dealt with by the hiberna=
te code,
>   * we don't need to free it here.
>   */
> -int swsusp_arch_resume(void)
> +int __nocfi swsusp_arch_resume(void)
>  {
>         int rc;
>         void *zero_page;
> --
> 2.25.1
>

