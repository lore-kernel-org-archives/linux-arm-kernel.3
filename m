Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E9AC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=; b=v2c8rg3RFKgStcE6YVO48fxdBX
	cOdeMT2FUKH6CcHfsSFc5/ReMTQx53VCowicSoG2NWaa7HPDxFFWoP91hNUlD5zaNc6uqjqycTWpk
	eF8d0mHlFBhMf3ZsQm/3Q14OI2ryRuRyn4w4XwYeWjGyEppJNnpsuqzGoHFwXTEm2jTsBfs3HBxTE
	0c4cT7Deh20VojNACUZh8bx0rmOO+XgwxizLdenKG3j/8X6Jsp4uTE2MmsCmwR4FitnXfRwtxDuNv
	UE4UrBwXhsHYpECHjEMIFNl/uUmMOEEJevBwd4q7BHOQAATUvl89tPHWQjgxD2szLdfthHDKTipBg
	dE1Gb5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WtN-0000000EFrg-3YoB;
	Fri, 18 Sep 2026 11:36:33 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WtL-0000000EFqT-2AU3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:36:33 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a6056c2064so707105a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 04:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789731389; cv=none;
        d=google.com; s=arc-20260327;
        b=MzrL7oiLj2cyfDAENhK7gaO7NEHT+6j7NmqGPA/fswedOuk7qGJbNNRcEJj9UlsFdi
         NFGVAWE4MaHJOfDJqrlCJ+K/61GPkoOIOPylm1WdvynymcJG077Lui27qOhCYj2kNUTp
         a53VwHaA9rME7bAB27ledn6txSuA4YZ9a2ONdv7+kDbEuSKGx2c4eEozgmJCeQioGKpM
         sTj+WkBwWoWdjikWykX2kDGJ+m6SzTS3UfiwLBvTdNQBUJax8hV16PHwyPqR0STTnfmt
         I0cl1vUsaUHbr0y7T9KbvB1cKyZU7mrXtyGjktkKEoLId3bpOSl+MF4dD2yP9M5AtO52
         Ey8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        fh=ugQSCzHqvx9qzoOKo014RLFGOPRWd6jDTd5S+XLyg+E=;
        b=KQiEfzaNMsYIxfkicSxfLNmZ4T+sJv3XPnosdaCyNMBJpfKzLKrRP2O1TPvP9Y3s07
         9pa4yISVwHRiyoyydETEqAut+Y1JRmNv+bYv/UgpU4bWzLIxt/mUzQqVLCzBxIOX+6Yj
         XeWfdabZcZ9uxssqv11a7yI48AV1xRztzE04NPFacXgyR92xptoCQHWeTNmaoZqFOv9c
         59co4iKlhahByY0kDfZ3yJfrIrGUGZCyi0KZ9gVdqDNVYYQwHZUKJB8hhFzyHewKWRAK
         MiqCgVRqx5p2BQZyq+7W03gf5U30csw61KuLwYpF2ZlwHm9//IcSE5pVqW08cP0f/22+
         dQFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731389; x=1790336189; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        b=e3FXbZIMCN4B/sf+DEIXj0bDMTp4k+cHSRqXszEmwhbvTNGZaDs5g5zbxA+3/51crA
         Oz/78heVQpt++zpUE1kAie7KEDXVdjw8kDjHzD7inABfnP70opaWl/o5uu5HAK7Xcu+5
         6EE5pver7uCUthOjoRHJoDrU8adxRyDbLQfNuDIh+9VCUKxSzB9IxVSc0AKnrtrBHI5W
         rG45WzFL4oZJxCorVWfLaKHt9m+8jd8Q5QDCFez9PHSHD9yLmKSY+DF4/DsW8pY4ZUuk
         ifstFcRJWUJyWOjzQRO2S/JRaqevqQxIpOIX1JpOuh+q9CPIrpppVa1qreXxiYUAWXpF
         wvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731389; x=1790336189;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGJXKehN7uzhcfBB0KBhZiEIw68JYp4Edf9oro8cdRI=;
        b=rOqqqGg56DasTCBse3AuHrtdc/T0qWmrzI0XALl+o1z+aO+IyXxn1VcYl1K6qvBI6h
         PjFUGJ9rrKGFigHy/c0sMDuyHRS7ni8Urgb8skzY/hW+xxhmefjWMO0vdphShZE0HQD/
         CqbVWk7aSU2MOz3E+CWN8YMBJTtqBtaadG2z0GMKRoBwoVx5ztaaqK7zQy1ZF8VMjkye
         bQGCgbUGMWlxeeSxPkzSCuCz1cN9PDD+qewkO4Wl+aKh4zqQxaUOUawUSyxF7tcZNLFv
         Inz3kzgVb4vgm9jsYhokDDOCvrKJ2+L7d5cOHoCBwVn0kayAmQV50BPISn/M1NGmNw3y
         L70g==
X-Forwarded-Encrypted: i=1; AKwUvBwYvs51OsckBKrLPX/O7On9Yk8iIpU6jbjodcLyXA1TrDqQj0zGzKN/GQhVbZRGFp0TapdSKNEDjznT4M6ibFjg@lists.infradead.org
X-Gm-Message-State: AFuF++nF3j+O00Ziv2kOA45E8tYkIfwAddoz8PGh8l2dUD5EGK2GKvEA
	8+9hahIevPYyDCU3x4aEwnvcXOLk27zskP/C/iqP8bUNyRLSuziWKPdWcGmC7PE5B2uXRAR9AAA
	Dee5mnYw0/0wr57tlqrhk/KwSJLvv4htX1cHqHLw=
X-Gm-Gg: AYBFou37OqXTPdVjtsExHqgG1n9CK/9RDUqSpVOFrKDYA7H73PT1iLmnCfsWu3Bcpx/
	/Dva5q0MRbCwazs0LLJlCbcV+QIQuA+Qf+6Vm9MQO/Bh7UJhDidTt3EmIteTG+BEnK/g1VN+M6Q
	/1enF/gc6hzF77LY3xk5841/d5r5tNT9Gcn7q84IvqPVa5QYIV3JiJ1JFPkyxqfTdKw5T0l3xL4
	JIcziJLTSs92mIQCjoL+CZsN2rn1KOVYrL1R+kU/t2qTXpQ37p+ljkBbqvyrl99v9aoeC+IJeLB
	HyQRA1URpOBIhs0mXH+hhNX7UuKtQ+kNBESWLQlnyDaaNZAGKi8FoqMEG60lVx8QaGpkhPWcUhe
	o8B6DeE3VWNZ+MZOm8st0WNMUG3Qg47pAJsiuvrbnkQ==
X-Received: by 2002:a17:907:948f:b0:c29:5d41:dfe8 with SMTP id
 a640c23a62f3a-c2a1582698fmr217595066b.43.1789731389390; Fri, 18 Sep 2026
 04:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-tonyk-syscall_table-v7-0-f4cd8f8e3265@igalia.com> <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
In-Reply-To: <20260917-tonyk-syscall_table-v7-11-f4cd8f8e3265@igalia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 18 Sep 2026 13:36:17 +0200
X-Gm-Features: AcwNN1W0uIsrBudlRZeSpl5_CSJhjtWRK4S-OK-90sOk1QFHdqx3jezfZnvgjR0
Message-ID: <CA+=Fv5To=fUfD+9OtAcNJcaquBy+xv6oNUFES6sVwpOKzH8qgw@mail.gmail.com>
Subject: Re: [PATCH v7 11/13] alpha: Define entry point for
 set_mempolicy_home_node syscall
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Arnd Bergmanon <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, kernel-dev@igalia.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-alpha@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_043631_967144_BF9EA310 
X-CRM114-Status: GOOD (  17.62  )
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

Hi Andr=C3=A9,

On Fri, Sep 18, 2026 at 1:47=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> Instead of explicitly defining set_mempolicy_home_node as sys_ni_sycall i=
n
> the syscall table, define it as the real syscall entry point,
> sys_set_mempolicy_home_node. As per commit fdb7d9b7acd0 ("alpha: remove
> DISCONTIGMEM and NUMA"), alpha doesn't have NUMA support, so none of the
> mempolicy sycalls will ever be compiled for alpha, resulting in the
> COND_SYSCALL() fallback being used to result in the sys_ni_syscall.
>
> There's no function change here, but this step helps to unify the syscall
> tables and create a common table to rule them all.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  arch/alpha/kernel/syscalls/syscall.tbl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/alpha/kernel/syscalls/syscall.tbl b/arch/alpha/kernel/s=
yscalls/syscall.tbl
> index 52e3538cc7df..8fc4701a6328 100644
> --- a/arch/alpha/kernel/syscalls/syscall.tbl
> +++ b/arch/alpha/kernel/syscalls/syscall.tbl
> @@ -489,7 +489,7 @@
>  # 557 reserved for memfd_secret
>  558    common  process_mrelease                sys_process_mrelease
>  559    common  futex_waitv                     sys_futex_waitv
> -560    common  set_mempolicy_home_node         sys_ni_syscall
> +560    common  set_mempolicy_home_node         sys_set_mempolicy_home_no=
de
>  561    common  cachestat                       sys_cachestat
>  562    common  fchmodat2                       sys_fchmodat2
>  563    common  map_shadow_stack                sys_map_shadow_stack
>
> --
> 2.55.0
>
>

Looks good to me.

Acked-by: Magnus Lindholm <linmag7@gmail.com>

