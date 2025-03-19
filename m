Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223AAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 02:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeqBB++rcOx94nz1IuSE0ME1aOopqq+egTiTenlENkM=; b=rdrvksozYSVVEpEmCvxoIRzmrI
	cf7IT4McQeGbnybWzBJ1RBChomantjw/OMFSAPGfbuhaMrOrFaBmT7PO+VspbLHWVhNKV4q6294Z9
	CK/hYXQwMBP95toxizbkBB5JA9wR5PnX3biQeA8YMBcuIHZppg/Nu5VdCtyQbBCUgRb5oNbsLrTbN
	woYMuiddovhAUTbCqgKxP8NGaUVPxb4YuzkLxbGnb4Xuf1nqd9eQ2eEPvIJWuLlIFobvo8KlfPPmj
	+dyzwpQRXIbw49Rfjt+JVSOyg7wWZPvzXWwOkW8O0AzV5WrImU8JhLjAyGJwQ5nL9Jqw8ZmdxH8Kq
	qngNGX6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tujOF-00000007oaj-1oD7;
	Wed, 19 Mar 2025 02:42:43 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tujMY-00000007oOl-10FL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 02:40:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3913cf69784so5327701f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 19:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742352056; x=1742956856; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeqBB++rcOx94nz1IuSE0ME1aOopqq+egTiTenlENkM=;
        b=SjSA81BNJzqJWC1/O8Mo0kTx8tvigXg4zbjuySbp0aiA/zRQdSAUpO0n5COtLcWvBy
         H/RtvStgR+IgZfscIdyFijzIYlNXFaNRT4uXSQXwkmZpvtsAUUOowh8BdOnkQd+uwGi2
         nbhBHuLvKL3wL8UIJMSbIyj+BUkRjYgZg7KMe4tEpN6rUMYTksZfIWhZ52qwka9I1kgb
         naBxM/0Q6yiLKjAFDqcQA7qgKbLGeMqp1Q3OGqNQFu7k6M49vFVjYfMYrrgej4Hc6Jn+
         ZYk6PSrztnKrXTyBNhwjm/R1lnKeDwlezIO2WWSPi/xGW18TWC6wTXBFgyJ2IwGXZVZ1
         qvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742352056; x=1742956856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeqBB++rcOx94nz1IuSE0ME1aOopqq+egTiTenlENkM=;
        b=k/jrLXxnqOHbMJKqKTbAO3whRI9sKRkmlSv7zHzC3OZ+bDdGbgqFy2fVxb0QzT/652
         JfaBAPPBxQ3iE8aSUlxTBHkR61eRoEpIXOs8LhmbHLfWgZbMoU7uKgh03BuTeQt+8syh
         VlRYvG01uEgfk35n13Qzt8Wu9TP9MSsZ7dvT6oH4Pro2kQBwb1VNg/0bGRsLJulj1gB9
         i5e9lWHJNVcpu9V+F6VxrnpRYde63VRWK/Ssf5RuJGsm+s5vnh+ynlhwqurAT38jmgEO
         osDqAn+YdTEZZ2XLFuCWayI+1BoFVpzKWPipY0Pdh3voAYoKYyzHgIDGPW5xoK1oyMOq
         kbvA==
X-Forwarded-Encrypted: i=1; AJvYcCUmVdOi/OQBLy5K7e3KsS9mqVwIJSePxWVhZL9byaHZHBWFqv+gprZ3FVm2ZrNtT9Dmlve07FuB9Zk32j8r/LwC@lists.infradead.org
X-Gm-Message-State: AOJu0YxT1QD3m7krvvAj1eNrBI4tbIEsevLdSMqy3Qo+/KbCIDa1kNyu
	WJTBjBvkv4N/pNahXXoMl+kaOTGqyvrS+C15c3/C00Acyexg2BDJsG9SpHBhtmfGi9uhhAGNQWv
	HKzeWLr+RvZCCu5qvSlYY0dVf2XisHXdJ
X-Gm-Gg: ASbGncvMe5JvSClf1DY29U67MKMOR4T/XSuoxpfRXC+sa5Fm1Vsg14JUxNl5VOZc+iG
	H8xfxE0qcYP8j2vCD1mFmnL14htpgYhPDvGOuz3wft3FGdZHkL4y8iCNWxTyZmftd2IKGsx/eiX
	Jevxde0+JT7+DynEEbS16kqFFjkDLPi8Ubvv6jYi7ofuOc6pntF6L5
X-Google-Smtp-Source: AGHT+IEq4Cvjw+V0zW8HacPzY7dpEsXkttELmIjzb3h1MDYt7G6p44IBkRudTjyMAKCZQZF68Vdm9Bd7RVSCNEeyHA4=
X-Received: by 2002:a05:6000:2a6:b0:391:2c0c:1247 with SMTP id
 ffacd0b85a97d-399739b7c7cmr810733f8f.1.1742352056133; Tue, 18 Mar 2025
 19:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
 <20250313175312.1120183-1-luis.gerhorst@fau.de> <20250313175312.1120183-2-luis.gerhorst@fau.de>
In-Reply-To: <20250313175312.1120183-2-luis.gerhorst@fau.de>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 18 Mar 2025 19:40:44 -0700
X-Gm-Features: AQ5f1Jql7yFmS7_MWNSMia475Ma-4TwbNZCE_S5_030qdEibYwvwxGNs5a0zSMA
Message-ID: <CAADnVQKL-NwxigMWM+U=n5ZXPG+xHYzSTEv0Rq8Y91m45eRJDw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 11/11] bpf: Fall back to nospec for spec path verification
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
	Henriette Herzog <henriette.herzog@rub.de>, Cupertino Miranda <cupertino.miranda@oracle.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, George Guo <guodongtai@kylinos.cn>, 
	WANG Xuerui <git@xen0n.name>, Tiezhu Yang <yangtiezhu@loongson.cn>, Maximilian Ott <ott@cs.fau.de>, 
	Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_194058_302203_35BCA4F0 
X-CRM114-Status: GOOD (  14.41  )
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

On Thu, Mar 13, 2025 at 10:57=E2=80=AFAM Luis Gerhorst <luis.gerhorst@fau.d=
e> wrote:
>
> This trades verification complexity for runtime overheads due to the
> nospec inserted because of the EINVAL.
>
> With increased limits this allows applying mitigations to large BPF
> progs such as the Parca Continuous Profiler's prog. However, this
> requires a jump-seq limit of 256k. In any case, the same principle
> should apply to smaller programs therefore include it even if the limit
> stays at 8k for now. Most programs in [1] only require a limit of 32k.

Do you mean that without this change the verifier needs 256k
jmp limit to load Parca's prog as unpriv due to speculative
path exploration with push_stack ?

And this change uses 4k as a trade-off between prog runtime
and verification time ?

But tracing progs use bpf_probe_read_kernel(), so they're never going
to be unpriv.

> @@ -2010,6 +2011,19 @@ static struct bpf_verifier_state *push_stack(struc=
t bpf_verifier_env *env,
>         struct bpf_verifier_stack_elem *elem;
>         int err;
>
> +       if (!env->bypass_spec_v1 &&
> +           cur->speculative &&

Should this be
(cur->speculative || speculative)
?

In general I'm not convinced that the approach is safe.

This recoverable EINVAL means that exploration under speculation
stops early, but there could be more branches and they won't be
sanitized with extra lfence.
So speculative execution can still happen at later insns.

Similar concern in patch 7:
+ if (state->speculative && cur_aux(env)->nospec)
+   goto process_bpf_exit;

One lfence at this insn doesn't stop speculation until the program end.
Only at this insn. The rest of the code is free to speculate.

The refactoring in patches 1-3 is nice.
Patches 4-5 are tricky and somewhat questionable, but make sense.
Patch 7 without early goto process_bpf_exit looks correct too,
Patch 8 is borderline. Feels like it's opening the door for
new vulnerabilities and space to explore for security researchers.
We disabled unpriv bpf by default and have no intentions to enable it.
Even if we land the whole thing the unpriv will stay disabled.
So trade offs don't appear favorable.

