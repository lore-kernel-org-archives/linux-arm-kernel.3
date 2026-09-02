Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEA6C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZHue06ttO7W/vGqVbXWmhoXrVl0ujlXMWK0E0DYjQQ=; b=LKTCaOo0pXaxOLeyRQVBZ+vqRD
	attFJ3fg0G/yU6qM2iD3fxzgoASIAZ1se50KPtG/yg1lm6Wpnkr2FPaBqMF+prDzNWogy8GSfCdPW
	1JoViJJvd7F3Ezumvaxd+Y51tHcxD/tR/jFJa5dJtNBOoOQ4BIGLlCbwjEoJJfLKQh0xqdZ6L22jJ
	HDNCbgI400miQl5bMUDT8F+1hNLUJHTbfoLPWFYlSaoKvZDXNd2IKOQur6ndQDagcZSgYgI9G/fde
	fqDLGWjv8TqMzeG/ORXB/ya9+L5rYfSKRloPjnuzM58/BEiWZ3dE1lmham0DBz6pOjb//AKNbmiMl
	tzzQhc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kpv-0000000EmiW-2KnK;
	Wed, 02 Sep 2026 13:17:07 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1kps-0000000EmhG-1S09
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:17:05 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c2544ff970dso140665866b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788355022; cv=none;
        d=google.com; s=arc-20260327;
        b=QwqXBAb595Q22XluSDU1HpSdnUsf2ECeM2TzdbwrZ8pyiEDl4NRpXsW3nJ4sdsYugs
         8dNctiXJfqscbsWi53oz0l3+3Uu+TeRfc6FuimfZ+SsOx1IWvkXdt9c5IoZHi1dboCCv
         efQB77UANm9i674PzA9QoOJuwUXggvZaf2F4w2r26gL44kH8hS2BePR4HgijhpE8yWFd
         MSWiJtbLU5GJG2U352/ynwIsthAB/zQZdqwekbg9WG1s4lTtqVCyIvr7rMcj9VYnYs8P
         jrgjgUDcZFuX4lBY+4ueWLCfzpbKbejdzY7/rzYGQVqmOOlrh1ZCgawFBa0LZ3GSlxLw
         UrsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KZHue06ttO7W/vGqVbXWmhoXrVl0ujlXMWK0E0DYjQQ=;
        fh=680oKj0uOw19WbBsGd27zdPirPHykwo7MGzeZekxBic=;
        b=Sh3SODIDlzyNSUHegmmeIdtbxjDuZFlryMLT2m8Qz9Xv2WyWIQ9fVMAh5WMOr/lYvJ
         4cLKHrZKzZ9poQ0f2EWD1qiYvibiQzT+Z8h6KKnwtSit6u2RKZVu2sQ8d8nCL1T6wkwi
         d9/mbibxdU14RzzA2PV6Ix42ZUpkpLVDXUSWA63QE3b2HRJNUs75EAhnTQvnrzApA+9X
         2hWN+Gf1T7YUn1H7Z/FtbHKMzCHP9CfKSCfGPF+UEjhIAPUx3wGqkpFQBOYfAM3b1Xj2
         yqqRs9+7WN0/kjSLszT3GaJk6MZKxlycR7AAaGb1YSVfwKMtBpMF3NZfYy8H717AxZQY
         475Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355022; x=1788959822; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZHue06ttO7W/vGqVbXWmhoXrVl0ujlXMWK0E0DYjQQ=;
        b=j5Wl3LHykxe3UaOrxBm5sqBXmma302icRcdtggndegdLzoxLfuL9SJN3snYLc2+uV4
         fGS7f//8yehlz5mjaO0Mj5NNxmlkNTIGxIGXMlEpA7csWeFvKvpeA9PTaWAqu2bNPev/
         nEc22RvIDgxcMpjhKBwXVw3rgKEYiBwuVbNH4UTwZrtiErW3i6qsTxQDlYxomukpEt5M
         tGhKIivkaQllyyjY6aqNJBenVopwf9OM+UIMmVQpxrVG4xB+J5xWdxlZQe5EuT1O/9vP
         jRpT+FnhMZ6nAX54t7HiH47+375byuqBdwcvPUd45H6DYrv/tEh3be7Rg8/0kiFmnT1E
         r35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355022; x=1788959822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZHue06ttO7W/vGqVbXWmhoXrVl0ujlXMWK0E0DYjQQ=;
        b=VzI5sCwbialrYQ7MI24JBku+D54IB1caBOYxbsm/TvF38qT/GnTugspiqjDWaLaCi4
         KaC3c3C79rvIwgeSS8W61ei0JPigDAPOeWm4qwfi79hJVHVNiJsciVrkffgksKrArDCM
         Q5DtKJUP1nZi4W14LxzX2w3Agrn4J8o3N6xswGS93tv1jMmS8hoj2AWjQCcIZ4d9ywUO
         rZUJ3uYbCup+E3btK4JVycgLmqqECx9YKH6pErpu5A3PcAzuygVEDJnhkxmJlh1pKzP2
         2ZjqqyV8Z7JZ0jmOQslRqM3u7UPIZ7Xd8lEvDh0I/Znh1EVInuwwC42hU7YmmIS2MQuu
         ImFA==
X-Forwarded-Encrypted: i=1; AKwUvBzghJiYxdz/k63DLgvSX5zZkd6UAqSe4Bol98uKuPX4In0bqv02tvU2GObi2ONNx8mrQhVNaUord0RbpJY6PIWd@lists.infradead.org
X-Gm-Message-State: AFuF++lGXk8m97zmACdBybREYmeODW64G94iyTdwX4fftXAYlQIRok/W
	oT3nWUzgz02sNjvlv/hqAaTIdn90ErnixN48frjPfViQtUL8NCRsJGxaIdVxL1PG6OzX7GKZ5TJ
	fg3mqgYLSsJKfEg2soQOV674c2ZFYbzA=
X-Gm-Gg: AYBFou2I/cmyCkSqXT/yDkT3zu1AZQR3OQeDsgIahhKmEC0s7SM9H/BfaY8dKQ4//jt
	Q/u7xD+BlWLkUN7o95E2FfiG9C/bdc0rOnESNKq9KOdvtU1LWidUfYqahBWbu/V0ZtiTBvLS0o+
	xgznJxjirjldyfsSxFOBEUpfivZw51wzS06J4ouyL19NHZh6T13E0Z1swnVRKHkaHr7CrIC22iU
	pXkk/qtRnjwrHRYc3K7Y0xMdnH5IqdQ9LVj7w12Wowqg5sVvnA87WXx2f/Pje+tJ/HhuK6UJ6gd
	zrbR2Td1ONPVDSrjw+u6L4xF5KVC4qyjRr80QOxEKpNH6FhZ1SOC6LP+8Y+PRUWC8UII2/BRTSH
	LbFh/6eHRWGOBtYTgTQHBsGvp3kAkVD7Nfs9P/7Q7ZL+dBd98sLJTwHE8huVraOs=
X-Received: by 2002:a17:907:d38b:b0:c25:8c74:71ea with SMTP id
 a640c23a62f3a-c25d5287112mr273668066b.4.1788355021756; Wed, 02 Sep 2026
 06:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260828-b4-arm64-trans-pgd-va52-v1-1-a66644372673@debian.org>
In-Reply-To: <20260828-b4-arm64-trans-pgd-va52-v1-1-a66644372673@debian.org>
From: Yury MonZon <yurymonzon@gmail.com>
Date: Wed, 2 Sep 2026 15:16:49 +0200
X-Gm-Features: AcwNN1VtfmfTbIoiDKjqPuoUjg950MVEE4mAz3ATKtFCufnsCk6vjiJLDipjCqY
Message-ID: <CAKJryhb6Ey2tmTLPnPgB+PCA+0tDKX3fR=chH+BYijjeDjr38A@mail.gmail.com>
Subject: Re: [PATCH] arm64: trans_pgd: clone only the linear map that exists
 at runtime
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_061704_408438_05AF2C38 
X-CRM114-Status: GOOD (  24.85  )
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

I was trying to optimize that exact spot when I ran into your patch.
Thanks a ton, huge help!

Tested on Rockchip RK3576 (no FEAT_LPA2), 8GB, VA_BITS=3D52, 4K pages, load=
ing a
39MB image with kexec_load():

  trans_pgd_create_copy()    2.231s -> 0.132s
  page table pages                51276  -> 4110
  whole kexec -l                     2.65s  -> ~0.42s
  memory held while loaded ~300MB -> 87MB

I did 5 kexec jumps, including images whose device tree is assembled from a=
n
overlay so the segments land elsewhere, all booted fine.

before  2.416 2.428 2.466 2.635 2.693
after     0.408 0.414 0.414 0.417 0.419

Tested-by: Yury Smirnov <yurymonzon@gmail.com>

Thanks,
Yury


On Fri, Aug 28, 2026 at 11:28=E2=80=AFAM Breno Leitao <leitao@debian.org> w=
rote:
>
> kexec_file_load() fails on arm64 if we have CONFIG_ARM64_VA_BITS_52 but
> it runs on a !FEAT_LPA2 host (such as my loving Grace machine).
>
> That is because trans_pgd_create_copy() uses the compile time
> PAGE_OFFSET (VA 52) instead of the actual VA size (48 -- due to the lack
> of LPA2). With the fifth level folded, pgd_none() is always false, so
> the walk cannot skip the 15 extra PGDIR_SIZE slots, and they all alias
> back to the same table: the whole kernel page table gets cloned 16
> times, KASAN shadow included. Without KASAN it does not blow up, it just
> wastes ~RAM/32 in page tables.
>
> Fix it by copying the linear map that is the actual one, not the
> compiled one.
>
> Fixes: a6bbf5d4d9d1 ("arm64: mm: Add definitions to support 5 levels of p=
aging")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  arch/arm64/kernel/machine_kexec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machin=
e_kexec.c
> index c5693a32e49b0..8f9bc2327dc85 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -129,7 +129,8 @@ int machine_kexec_post_load(struct kimage *kimage)
>         }
>
>         /* Create a copy of the linear map */
> -       rc =3D trans_pgd_create_copy(&info, &trans_pgd, PAGE_OFFSET, PAGE=
_END);
> +       rc =3D trans_pgd_create_copy(&info, &trans_pgd,
> +                                  _PAGE_OFFSET(vabits_actual), PAGE_END)=
;
>         if (rc)
>                 return rc;
>         kimage->arch.ttbr1 =3D __pa(trans_pgd);
>
> ---
> base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
> change-id: 20260826-b4-arm64-trans-pgd-va52-0bb9b44dd896
>
> Best regards,
> --
> Breno Leitao <leitao@debian.org>
>
>

