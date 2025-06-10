Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1BBC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 05:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6NSSSUaPkJ2Knx1I9AqaaAXzKIj7ARZfjyL5txYCRc=; b=tyrMmmTOjfLVfvzW2ysOaXpgh3
	PgpE8pIGF/ba7vy3e1EnA9iT9Oc5ZnJKTwI0ca8UvxwJPjl38W0cP1XEzqGTZ8zzZE8Ry5Y1LL0fg
	9YzkQ2Urj0WvK73mVFLU9DIYnyBhugyB25GBq++Z0+SzrtIkDJxEOsnE1JDi+IvBOVN0u5bDsYShv
	yQZLzvN30+AatgXB9vkIIFwWzilKx8PchtxpOZNO98kwYbga6VeYlLrp5ZIPIPh4STO4D2r+jlMjp
	4CZLyvuYmJDZxvzbs7J1evG3IWpDxDuA5oUsMZvXd/obFP3iCdDQLNmiuXFoP6LV3hLeWk3a84dEm
	ocwR2quw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrhH-00000005r6I-2ggI;
	Tue, 10 Jun 2025 05:38:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOraL-00000005qK5-0APj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 05:31:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-451d54214adso40890335e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 22:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749533503; x=1750138303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6NSSSUaPkJ2Knx1I9AqaaAXzKIj7ARZfjyL5txYCRc=;
        b=NX6UiHnJnj4GR8kigIiP01r02vfSmpetiBcVjISR+HccMBV0pwH4DhjcerMIIolZE3
         cU9Y6JjoHSfoVur09wPrgm8CAcheep09lFmS8abNm5c+rh+7Yt7PVnB1SrNIbzPSWwCr
         6I/5gU5dKAMPUCPlxVIek2ge9Pvzur6KJXkF1kW6ume4KY8AfAZeHds4k04gDzLWZdGn
         VQEuKivfaBlUeowU9gPWEcufOzznnnprI0IygU2EaVGRtwrIedirtgaBLwVjfOWBt+k3
         URJ9o5FGBoI6g1ULmJlx8HcRUTdrhBAzGZdCP1RAqdEZiigQX3kBHKZACAD2C4Zx996g
         2+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749533503; x=1750138303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6NSSSUaPkJ2Knx1I9AqaaAXzKIj7ARZfjyL5txYCRc=;
        b=lf2YtdNxG2W6qh6uqOJ08sHyWlPZSbJUzL16lSDaJ2Sbu5hIsdiqBdaKAKzba35/tJ
         pnFc57E+xtR9OwbqQoyFlpNzODr0VtcIEUMOyI+VHO4EtPcWJySB6Eqzm7LGXjI0T9Do
         7ihGabkWqeHQ6pNURyIAiwRkT5z11FrAIEp2HvsPLv0Gs2IiDdSm+1LQeUw9EbdQkvZy
         gWgEIixkVV0WTY9KRYquI5DwpUjWV6x3N4JF/9WefE3bADvrCbVFxOqu7fJnLzH2u8ur
         yiT4UVjgGfV949VFuzuu3PGCEdgYMylpeAJlzy+a8ZO8nSjzI4CFb9PoP+v7R62UORcI
         EsEA==
X-Forwarded-Encrypted: i=1; AJvYcCUN2k/G4VZwm55P16F0+XTJjJ84HOzLuqcGFQ0kVmTGbMlGzsCwpEqy23hGKbJUL5uBT+WEdGfNhoy2gv8BS6zU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3QAXq4sh58gmrsCcAcgHMHgJmpnbz7+CVDlCgnNrU6oR6DhIR
	GJF1WUMNpUdKsyTqRt/dDWt6TeUUvs1fg51GRmXoApZQ+tJdmnqDZJiDk5Ri2uGoEwEQub+u+qC
	ZnQIfQRToP+/HHyh4nbPhf45mrso3Rcg=
X-Gm-Gg: ASbGncv0PK38UaTMOhiXx//5AElP7U7JJ9E2cci+URyNyFfA2OH0qrr84HaPfskxY9N
	Kzip4qMuU0POgHcM2c/QHmg+BKogQzswo9K0BYva3/rt5WZjp+znhAV5RzhfH3QqkMG5Bj1Qd5a
	vRkFsbKK5yLMK6Z2RRwxgo3EBdJJooJZCHIHEDD9xr4Al6El3sdqt0OW9SAJNvjp1ACokTW4rG
X-Google-Smtp-Source: AGHT+IGnCeVQwIATlfQCLPScvjR4zfSPZh3YpkxJkw/tAxQe10VCPdtaHGA0BCwCT9Hg5US8pQ1ILNVZfG578sV+3Yo=
X-Received: by 2002:a05:600c:34d2:b0:441:d4e8:76c6 with SMTP id
 5b1f17b1804b1-4531de9f85amr9648765e9.30.1749533502763; Mon, 09 Jun 2025
 22:31:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250603205800.334980-1-luis.gerhorst@fau.de> <20250603213232.339242-1-luis.gerhorst@fau.de>
In-Reply-To: <20250603213232.339242-1-luis.gerhorst@fau.de>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 9 Jun 2025 22:31:31 -0700
X-Gm-Features: AX0GCFu_O3ZRZr-RlnDuwnEJp2OCNNw_nXP9ivn8MSmq6jESTI3dBrI5bUO4Iuo
Message-ID: <CAADnVQLC_zViaCs5Huu63Jr2oCx1NGY3f_VCkJhrKvqst7HL=g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 9/9] bpf: Fall back to nospec for sanitization-failures
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_223145_079917_1B19C457 
X-CRM114-Status: GOOD (  20.69  )
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

On Tue, Jun 3, 2025 at 2:32=E2=80=AFPM Luis Gerhorst <luis.gerhorst@fau.de>=
 wrote:
>
> ALU sanitization was introduced to ensure that a subsequent ptr access
> can never go OOB, even under speculation. This is required because we
> currently allow speculative scalar confusion. Spec. scalar confusion is
> possible because Spectre v4 sanitization only adds a nospec after
> critical stores (e.g., scalar overwritten with a pointer).
>
> If we add a nospec before the ALU op, none of the operands can be
> subject to scalar confusion. As an ADD/SUB can not introduce scalar
> confusion itself, the result will also not be subject to scalar
> confusion. Therefore, the subsequent ptr access is always safe.
>
> We directly fall back to nospec for the sanitization errors
> REASON_BOUNDS, _TYPE, _PATHS, and _LIMIT, even if we are not on a
> speculative path.
>
> For REASON_STACK, we return the error -ENOMEM directly now. Previously,
> sanitize_err() returned -EACCES for this case but we change it to
> -ENOMEM because doing so prevents do_check() from falling back to a
> nospec if we are on a speculative path. This would not be a serious
> issue (the verifier would probably run into the -ENOMEM again shortly on
> the next non-speculative path and still abort verification), but -ENOMEM
> is more fitting here anyway. An alternative would be -EFAULT, which is
> also returned for some of the other cases where push_stack() fails, but
> this is more frequently used for verifier-internal bugs.
>
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Acked-by: Henriette Herzog <henriette.herzog@rub.de>
> Cc: Maximilian Ott <ott@cs.fau.de>
> Cc: Milan Stephan <milan.stephan@fau.de>
> ---
>  kernel/bpf/verifier.c                         | 89 ++++++-----------
>  .../selftests/bpf/progs/verifier_bounds.c     |  5 +-
>  .../bpf/progs/verifier_bounds_deduction.c     | 45 ++++++---
>  .../selftests/bpf/progs/verifier_map_ptr.c    | 20 +++-
>  .../bpf/progs/verifier_value_ptr_arith.c      | 97 ++++++++++++++++---
>  5 files changed, 160 insertions(+), 96 deletions(-)

I applied the first 8, but this patch had odd merge conflicts
and I didn't want to risk it. Please rebase.

