Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637B9E8FDD8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 12:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFczpWguGzhF64i1LzoHT3chL48is7quqBelng5MQSE=; b=kZOMv5u23Yng0/eXPteL3IGAc4
	LEtSbsXVdXMbfRDCbftfaDwUMQGCH5j8dQZb9iKNsjDKUG+FuFCLVAMIXwga4b9ihU3Q7gEAn0NDC
	Jjhj3pvNNRK3YQloFdSRUzXjDT7vC/LndA1KqBx6zw0WsAFFfn3hqn7KNr++tnMIcgiKvhk1e2NLW
	vhPeG7t/O9d6RL8LESUKpOEiM7baCTT7AcWunmWmbHPGvX8pNofnIK29J7Ox8GabNdo2xPIXraCZE
	IK+5fRwaYPCoj/MXP4C9whrCwk3J5lkUOHMzOJBQTbHQF4be7i7ls4Hk/jEoXSsoQ+a/RQNAmxa1b
	2kIv9j/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTCy-00000001vDi-3GU4;
	Sat, 27 Dec 2025 12:15:44 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTCv-00000001vDK-2abZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 12:15:42 +0000
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-459a258561cso1530086b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766837739; x=1767442539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eFczpWguGzhF64i1LzoHT3chL48is7quqBelng5MQSE=;
        b=g0o9QaxSO71SoFmdO+OF8Euwj/fMnhRGkthwTnT0jfod0wrbBXzSjW/alcDs8dut3H
         xCpzZyFIrgOPevwEg6cI7k2MoeLUy/fwsNAHEgnWJc4FJxw1WpXDQJFcU7sHaP2btzJZ
         1y4paA7KL4IMgmVhGjvMg602Gd8sozrKh/pryC34J09unP/CghPdR6doCvs2lOSFftiR
         PiJEuVD5zOVRrBDW2PoNafRAAYYG3kb+k9BiG4puTeXyjDW53NOp9IQmqS6QFLMCdWw3
         BxG/uqgRMZyVepqIY1xj6JiVgCZcqKMFR8XB8XyDfzAvUGztuTJ7ZF23jLgF1tJcbYzz
         +UfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMw9vw/lACyJvc6/XJdE+gZHHgqd6VWjRuVqyV/cDS6YCDDuKRXyruMEPuzy+mNw5kkAea8AikyV7nJUTkaYzm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+O1TttAV6kLa4Z9TSZB8IzBUNKBWk2JJ9bjOgtt/Roz4jdqyu
	M5Q0d44OF/S/HeqhBZB6uw9hulrkaw7zAdWQRcI4PHYq5lUiJfOVIb59Ts1NJqXD
X-Gm-Gg: AY/fxX7Zp2UJuRlNPMrM30p+fSnK0bC2KUbbbv7qNNOfxz05F0vnjSfHylLjCQLFtYb
	gvCV9eeI41449S2BydADFIsgy0HAKrIwi3wtikq30FSsmiy2ZvYxkNQHAvmXlSl4UBNOwRnoMgs
	KzSyaim/wcp5KRCa2g257onLWMzn4D6yoAz8rW99veCP0TixtOUud2l6N0u1K+hLSGiCI+Xd4hB
	/JftZ8EZOeycSqVJ1Yd8FN1kanQRHdFVLyFjmvcQ5TuxwADf4CSL/MVQPKzC+FAcqYK/jfhiHs5
	4Xqmr/B9sw/ihNGwgGClsj6gizIQU9JACE58hFYQRR2gbZB9Cxcbq9QvykHm4hP6pspAHNadY+b
	RnKzm0KJtnqccpDNmQZvel1tbXHYxScGT0F/UZ3NTt6Tu2kgrwVmEagDKZc0AupK6sMEmM0zWhX
	pkwLM9InK9iJTRFSEEInoG8IAnnFKLkj1SxDuBQ/g2kK+Zb2gG
X-Google-Smtp-Source: AGHT+IH5higWfmFnzSitzbfsTpQ4bOUaU7G1pq/1sdHp/Rzfav41S+E9L8qHtNnC3Ekz5/AFDn4wwg==
X-Received: by 2002:a05:6808:191b:b0:453:58dc:c006 with SMTP id 5614622812f47-457b20f55b9mr9426288b6e.3.1766837739457;
        Sat, 27 Dec 2025 04:15:39 -0800 (PST)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-457b3ba4221sm11982948b6e.3.2025.12.27.04.15.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 04:15:38 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7c6d13986f8so6467295a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 04:15:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXkcBVP4h0A/isXwUjlvFE+HidQj1Wc8nL+2KM6zSI1YchWauxfjhtO1FrTI6wSPcF7qmoXX82GlY7srJ7zhK/7@lists.infradead.org
X-Received: by 2002:a05:6830:4c0e:b0:7c6:9fcf:85d8 with SMTP id
 46e09a7af769-7cc65e7369cmr17793573a34.15.1766837738220; Sat, 27 Dec 2025
 04:15:38 -0800 (PST)
MIME-Version: 1.0
References: <20251202004223.108388-1-leo.yeo@luaberry.com>
In-Reply-To: <20251202004223.108388-1-leo.yeo@luaberry.com>
From: Leo Yeo <leo.yeo@luaberry.com>
Date: Sat, 27 Dec 2025 21:15:27 +0900
X-Gmail-Original-Message-ID: <CAMV_mXF-X968OQQ4zAqjXNjfAFZJ=bU5EJ1371RMOF-m0pK3Jg@mail.gmail.com>
X-Gm-Features: AQt7F2poZX_nrgKcS_IUowTD6o9oSFocjoSIDsTm3KhCuR3mnDqPbRpKFNm1c_8
Message-ID: <CAMV_mXF-X968OQQ4zAqjXNjfAFZJ=bU5EJ1371RMOF-m0pK3Jg@mail.gmail.com>
Subject: Re: [PATCH] arm64: mm: prevent context switching during idmap is mapped
To: catalin.marinas@arm.com, will@kernel.org
Cc: ryan.roberts@arm.com, akpm@linux-foundation.org, david@kernel.org, 
	kevin.brodsky@arm.com, dev.jain@arm.com, quic_zhenhuah@quicinc.com, 
	lorenzo.stoakes@oracle.com, yang@os.amperecomputing.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041541_709024_1CFA1C44 
X-CRM114-Status: GOOD (  22.59  )
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

On Tue, Dec 2, 2025 at 9:43=E2=80=AFAM Jeongin Yeo <leo.yeo@luaberry.com> w=
rote:
>
>  cpu_install_idmap replaces ttbr0 to install idmap. replace_phys uses
>  idmap_cpu_replace_ttbr1 which is located in idmap,
>  thus it requires ttbr0 to point idmap.
>
>  However, if a kernel task has switched out right after
>  cpu_install_idmap, when kernel task is loaded, its ttbr0 is
>  mapped to reserved_pg_dir which doesn't contain any idmap
>  functions.
>  Therefore, the kernel task cannot find any functions to run,
>  causing memory fault.
>
>  As far as I can verify from the current arm64 tree,
>  no in-tree caller invokes this function from a preemptible context.
>
>  Nevertheless, future work might allow this function to be called in
>  preemptive state. Encapsulating the idmap sequence with
>  preempt_disable() and preempt_enable() prevents this possible problem.

Hi,

Gentle ping on this patch (sent on Dec 1).
Is there any feedback or concerns I should address?

Thanks.

>
> Signed-off-by: Jeongin Yeo <leo.yeo@luaberry.com>
> ---
>  arch/arm64/mm/mmu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 2ba01dc8ef82..c3da836ebe8d 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -29,6 +29,7 @@
>  #include <linux/mm_inline.h>
>  #include <linux/pagewalk.h>
>  #include <linux/stop_machine.h>
> +#include <linux/preempt.h>
>
>  #include <asm/barrier.h>
>  #include <asm/cputype.h>
> @@ -2136,7 +2137,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
>                 ttbr1 |=3D TTBR_CNP_BIT;
>
>         replace_phys =3D (void *)__pa_symbol(idmap_cpu_replace_ttbr1);
> -
> +       preempt_disable();
>         cpu_install_idmap();
>
>         /*
> @@ -2148,6 +2149,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
>         local_daif_restore(daif);
>
>         cpu_uninstall_idmap();
> +       preempt_enable();
>  }
>
>  #ifdef CONFIG_ARCH_HAS_PKEYS
> --
> 2.43.0
>

