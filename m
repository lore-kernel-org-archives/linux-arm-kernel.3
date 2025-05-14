Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF669C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGZdJZIHRL1GtxweWrW4A40ao0eooBXQDxu8kYszvsY=; b=oEpK6AUCn1+d+CagJjkCXCCrVF
	qdp4MSARoL41eD/Xo9mlyKO91Vx4JkW5qfaUak/WfHeHXsdpfj5/X2LPz61pClrluzPWz0qfkeLII
	v7g03R79H1eamgFuljmL8NdiDVWpap6hICkWp3qiTFt6o8+zX1h6SnzwKLhX6+hhIpTrenPMZ+ZVQ
	+0/kL4k9VeOo6HEh5NfhVOYzDrzaLDm/qpEClEa0bWQnUAJeTh7uCqx/k/+bb46iG2O9Cp7y/1bXL
	V4siXIFIO42thGkw43ypu9nQ0hYIMQG9w8E2DsoEOWMBCLIorhnVnH2RCrerlBUgv0HalOfXiXbVE
	IcoUS4gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5xD-0000000EDuI-3Msb;
	Wed, 14 May 2025 06:50:59 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF5uh-0000000EDZf-0chj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 06:48:24 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-ad24ee085a8so505484766b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 23:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747205301; x=1747810101; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HGZdJZIHRL1GtxweWrW4A40ao0eooBXQDxu8kYszvsY=;
        b=c7t93oOdvL3E3kxrw6+Kf6dPX1etIjq9GT2pWQftjDRr8kCc7ZuEII+fOHbEuPChZH
         4QBdIdRmt8cqgH8rPt0bQVXyqOQ4n+F19U3uGijvSjDtdyQ+I9IBEhxeTrhcnmVYyNW6
         djWyETJaP/1JPdAEgQQkPoZhulFsZRUMDDHmRIZvPP6vVVhXAsKK/iToHfNkJv+r4SDy
         fJeeVrhP9TAKgE67+2roNpRRzSigYNhrgoDFThsyOspMi97enT85SebZnz2u59khLNWy
         yNrLKy2EafoMZ5cPmufkYeePnQmCpGsty0YHGZZeduJxi+yuO/tJAqx2OOJMxj6YxWQr
         zO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747205301; x=1747810101;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGZdJZIHRL1GtxweWrW4A40ao0eooBXQDxu8kYszvsY=;
        b=dNKDxfPWulIdnzJ9puX0D756g5VZ++vaIGij1LrsKQyyrbTCrJSz8PBmftXXdDwtk1
         NycRV17VjiOdnWSZoiY+pGf6Km+P+BJiifXRXSPumKPQghzQI37iQsTbupRsWrQCi30B
         7hxNrPVTYUDCVeBp4xlQl1iB/g74kZp5I4dI6xCflKT0FiimDhvEIgyTSxgFEuKEFru9
         JOIVF2n176xVx6OUln9S02uUjHCSqs2QAV2Hp++Y9n5G07FqRHZDIgf9Lku/Hi5mo6X3
         FOuWhtTCprspc6+IS8kAAJ4N4hUVVxur5M7h2+71XTIiK2UEFYE0TYPn8nkIQuXwDjrw
         ZntQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX9l1uJj4pwcXByqWm5H8j6op8gsIEnLLxDqUZceaMT7qtdktyLJewG0418QbdNL9jV6WR5SIpFzYqwbtVCG48@lists.infradead.org
X-Gm-Message-State: AOJu0YzTrJv2u0afrAjpdp+82CYlCnTSZwkPZhehLJS4dABvEkhH/f8L
	Lqfn+YoB/UwUlAHokKvRU8JVpBcYJnW9t5+4gx7sMM9yYyK/udw9XBzk0PhVfvz4qVCJGvCNNu2
	npirwrKsJp3jhqWiDDdS7PSTmfjc=
X-Gm-Gg: ASbGncukUcVe3MnX9rhqYcApOG2WkBPlAFNhNWpD4gbmW8pMZ636Ed3PyrAl5a8J3xg
	lSOdz2bzgF2oW4EgNDxnzcBrkQoxzW+0GwBbAHxaUlg7pBlxKfRbn5b7xN+7YHfP4dOibQMy3Hs
	479UOV6tJlFI1XRMl32DB7UNrGRbbXZ4yu8Usfv7xE6g==
X-Google-Smtp-Source: AGHT+IHR4iBb/I4Enb7BPpeT9sltrJqA0gSsnQXL1n3QG7K11/B1K1G20PjKfwnEwjCdCRskmsSlv58eOyHiQdilNDc=
X-Received: by 2002:a17:906:3bc8:b0:ad2:404d:cade with SMTP id
 a640c23a62f3a-ad4f72411e0mr183082466b.27.1747205301209; Tue, 13 May 2025
 23:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <20250501073603.1402960-12-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-12-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 14 May 2025 02:47:44 -0400
X-Gm-Features: AX0GCFun9-2MfM8_J1zhSkgZ3q4nYAOUK-g_v7fEm1Fc1hj9Yjf5b4J_glq1BvA
Message-ID: <CAP01T76jeSg3W-OyfBfSbAjpEhBr_h8rbS-Hubk6gDdrkeEj_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 11/11] bpf: Fall back to nospec for sanitization-failures
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
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Maximilian Ott <ott@cs.fau.de>, Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_234823_186839_B609AD06 
X-CRM114-Status: GOOD (  20.00  )
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

On Thu, 1 May 2025 at 04:10, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
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

Hm, now looking at this and thinking more about this, I think
recoverable error logic is probably ok as is.
Scratch my earlier suggestion about unconditional handling. I guess
what would be better would be
handling everything except fatal ones. In case of fatal ones we should
really quit verification and return.
We may make partial changes to verifier state / env and try to bail
out using -ENOMEM and -EFAULT.
So unconditional continuation would be problematic as we'd act in a
partial state never meant to be seen.

The logic otherwise looks ok, so:

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

>
> [...]
>

