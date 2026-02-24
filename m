Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD00EFB7E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 02:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYRZ99KL1yINLei2Vk29C2qJPrL7JdHX8hSgaz+HhLE=; b=GigN4opG1QfV5sMDdoAhcqqEvR
	FE+qN3jeQy3ZBzav22TYnXiG3MjuX68jSKzcLtNWQuv14H97xChQTtHmgvs/KUZSgcYETSFg01cBb
	Ruk2aGZrrbw3YLZmwwDrsfGiVr8C85xOCs5OzWf7bXENVSO3SAm2WSXvAUMza97ukhl0IvK7EM8iG
	+pfkAnJZiMD3h37dF0ORs8bQ2nCXQBBryerBPxtc+pdnNA1EMP9pWaJOvz65+morwpKWXv5uN5Frz
	16N6zVE0omr06PdEboUejkFN114qyTemjuNonPUWQJocxZbrPI8uelRSmIpoUsy+hfrYa27i9BXj8
	+jEbBU2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhkc-00000001KPW-1f6p;
	Tue, 24 Feb 2026 02:02:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhkZ-00000001KOG-3q94
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 02:02:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 742EC4452C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 02:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5C1C4AF0E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 02:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771898531;
	bh=HI15qPZpODUUYmT3koZ5s3kfYeK07PPTFU7DvVv4qdc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GjSAE+Gzvl7MTKyXrXtFonZmUs9umZp2h+IMq3fABO4JJCL1aoEZElxco7fD7vQRn
	 fGUnZwCnZAujrJY8Czuc1Meo7Mo/EDCH9oysx1oTesTFcA4hg9hJXUqfz3UfFujXXk
	 3DZbodxSpPhUywtjZ8xtXY7ik3H5N2dcgpQGY/2diAtPqtp/W+ajXsF2CPkKnRK9lG
	 tC/1KhyBGXh9nKWRSC3AnogrQsvf/c6r0MvKOpQbgE8zGHb0+/jntXgRIsayK2iqJh
	 zjjbPgkyhAijWs0ICN+FAEGdrgwoX+DopxZ1wyxAszLPv5JcT/NZIhQP5Z69haxY0u
	 IotkJQWZUIPSg==
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-436234ef0f0so3209011f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 18:02:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVlPdqNY1/FURzOPYy+ub2WJoPzcL20ITrGSrsmYW1vQiMFdk6pn4QngsHTyHztiFwfr6UoJogz5q3WaDP0+Vsd@lists.infradead.org
X-Gm-Message-State: AOJu0YxxGE5r87GBowViuusk3wZx+c/Om+lFzdF/B2qXYxp1OxkKD3dp
	31ap3e8As9QINrnbuDVaY1oDOLw5sRKnPlr3QG54KALOhdf4zs82JoE1B7qN590jdasi2ippue8
	ceybW0ru9Q3mjW3q7hEjAs06/cJDb7kk=
X-Received: by 2002:a05:6000:4201:b0:3ec:db87:e5f4 with SMTP id
 ffacd0b85a97d-4396f15d10cmr18428515f8f.7.1771898529711; Mon, 23 Feb 2026
 18:02:09 -0800 (PST)
MIME-Version: 1.0
References: <20260220090922.1506-1-jszhang@kernel.org> <20260220090922.1506-2-jszhang@kernel.org>
In-Reply-To: <20260220090922.1506-2-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 24 Feb 2026 10:01:57 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRq+Pp0AC4jFDQdSsQv8x_XWV4o1UrRGcrkAJD2238MSg@mail.gmail.com>
X-Gm-Features: AaiRm51r629qqEXKS58ilHPH1EHwU6F6qXM6VgeaCXkG7tSCgEZ_ZRupW9dwMWo
Message-ID: <CAJF2gTRq+Pp0AC4jFDQdSsQv8x_XWV4o1UrRGcrkAJD2238MSg@mail.gmail.com>
Subject: Re: [PATCH 1/3] vmlinux.lds.h: add _handle_arch_irq RUNTIME_CONST section
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_180212_030844_E5BEEC5B 
X-CRM114-Status: GOOD (  15.56  )
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

On Fri, Feb 20, 2026 at 5:27=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> We will use the runtime constant to optimize the handle_arch_irq
> accessing. This is preparation patch.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  include/asm-generic/vmlinux.lds.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmli=
nux.lds.h
> index eeb070f330bd..c4af2c7d0eed 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -973,7 +973,8 @@
>                 RUNTIME_CONST(shift, d_hash_shift)                      \
>                 RUNTIME_CONST(ptr, dentry_hashtable)                    \
>                 RUNTIME_CONST(ptr, __dentry_cache)                      \
> -               RUNTIME_CONST(ptr, __names_cache)
> +               RUNTIME_CONST(ptr, __names_cache)                       \
> +               RUNTIME_CONST(ptr, _handle_arch_irq)
>
>  /* Alignment must be consistent with (kunit_suite *) in include/kunit/te=
st.h */
>  #define KUNIT_TABLE()                                                  \
> --
> 2.51.0
>
Reviewed by: Guo Ren (Alibaba Damo Academy) <guoren@kernel.org>

--=20
Best Regards
 Guo Ren

