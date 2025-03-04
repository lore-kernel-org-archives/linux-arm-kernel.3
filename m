Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CB9C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 01:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sj01G89WSKsFpjf/wy7aY/kOlbTksiMMzEm1e033JpE=; b=MSPLdHs/N9e005yX5NW4lP0vIo
	kLQJoJHMaPd8my0sglmIxkqfyF1MWtBg9vacT4+o3AiVB0/cpIEpy6rOQ4QfEwXVF0dP0izKAXVE3
	om8dtvGMsFtPSieLlsi+LC3/Z161nKZ6/fjruYObHRXYGjQJmt5enH2Q29b0KAH2tLnIJ4vcM3ubS
	katdX35CyNsXUz6ZaXXqStrfgtYxM36UTXIs4kjZNxFp7KYBqmeTXwVkP8PzVXKjKpPYnK8zE8FVi
	er0lfZi7gkPK7TbJWTLHNJRJeyt46Yjp13iHPFUiOZlPTsNlpWwgMuikCkqKdZMSuH/Z1rxmyu41d
	ATOqDyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpH1L-00000002l6B-00H7;
	Tue, 04 Mar 2025 01:24:31 +0000
Received: from mail-yw1-x1142.google.com ([2607:f8b0:4864:20::1142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGzl-00000002kxD-0pwP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 01:22:54 +0000
Received: by mail-yw1-x1142.google.com with SMTP id 00721157ae682-6fd6f7f8df9so16510617b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 17:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741051372; x=1741656172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sj01G89WSKsFpjf/wy7aY/kOlbTksiMMzEm1e033JpE=;
        b=FVB17EAIB18mEe49Yc0b/qVQ1OyyhRFlu+MzP6T04x19dDi5WwVmam5MDVluup314/
         7pJ7OJ2Dfv8/zQK2r3GlnRGNjkrHSNho8wRTD85YyXLHHHySeAPEJ6r93ihbfoaN3JHH
         vXzSKZ16hbarcJosplhJAbZTF2V3Zr2AiQyxFWdYjDcvFHUaJqkZdiajGRubxuadMV0l
         ElA5z+y7IjDNuyqiJj45tOvmZSLOiolMoVJK+3lCcFoXLRXoUrY28xiS8nnbRHsiC5wN
         roaqxdgNoWnQX3g0qDLpBEJ3CiW7CY2y+aHkK1Vuki+vIZa/ibW6IE2Sw+tISqz5ITTW
         B+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741051372; x=1741656172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sj01G89WSKsFpjf/wy7aY/kOlbTksiMMzEm1e033JpE=;
        b=hFEGtjuIcsyzEN7UFNrdBqadTq0hBA9SHKAF/8MrtcI3UVeo658OII7TWE05hIvoGr
         UhDI3Xr5tr6AbjqW/stkkRmdij7W5NwS4pbHBe/iPwNOZNbLIOqD+1lD5WsgatEprgN4
         6SpDIKYtIWmLOlAZqz0dJYHmxIRB6IZ7Qwmc34ho4HvcSpvS5jD0cpCTVlYEa7ZQ1DXs
         jUG1+V4+UKPgaoCxFvxQV/UYC6PVaOO/5FUzRiCcD6DQs4ltwuc0IfekbVLFeorhCQmE
         sZ4BewPicAkG0YKCMOOqNA25nurWYYdA33ypibZGpukYIiEZNCxa+fxh/IfJ98H9hZ0n
         GYcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkJtZZxPx5GpG/oKfKXedmyKxRFEaVidcALkLHQCpu7/txjurdkMGKTMOs4GAZvsoJUPerzs/4hYyoLKOXilzH@lists.infradead.org
X-Gm-Message-State: AOJu0YzO6tXm4U01bBJREuGce2ONwcESJcP2yNY1c+uTZdLFdnE0mShK
	H+hprrZW7Np/DeWKcydD0GxgTgxMBxctw5H5tquYCbc8P9E4kxmQCz3YZG5Z1NeL0t+PMTGYpyx
	tXKUjbEVCaaHFiJhMJFT/R7cGBUo=
X-Gm-Gg: ASbGncuddvEDpAl/0VXXYxWDMuZjjH9N+MUq0wJA2ViJwSfO3UHyTFgOUgn0XiCSyi6
	rc4JLYllYrpNMZgHkvwGVOD7VkJrOfp6o5HlWg5UVX1fW6rA30lKdR3ZYhALRIKTHG6BQLq7gEQ
	VcYeeEgjkgXtbbsRy73MvviQz/uQ==
X-Google-Smtp-Source: AGHT+IElMAk21PoBw46zmvLTxOIKzrTm436wI79ItKGnS7B37hL1mh91tHN7JBEL3hC27FIUVigt3qCLJ8UVxsKzHIY=
X-Received: by 2002:a05:690c:802:b0:6f9:5552:6b20 with SMTP id
 00721157ae682-6fd93fe85c0mr16592127b3.0.1741051372144; Mon, 03 Mar 2025
 17:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-5-dongml2@chinatelecom.cn> <20250303214048.GA570570@google.com>
In-Reply-To: <20250303214048.GA570570@google.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Tue, 4 Mar 2025 09:21:15 +0800
X-Gm-Features: AQ5f1JpZvyop7dLuEaHSyJ9xfDPdFhBsxp1mwPgCCs2RQqwOnwzgm0G2X_76n64
Message-ID: <CADxym3Z76bm9wXPjX=9c95eZtWjODwz70xN1KUR92NuC6vzrwg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: implement per-function metadata storage for arm64
To: Sami Tolvanen <samitolvanen@google.com>
Cc: peterz@infradead.org, rostedt@goodmis.org, mark.rutland@arm.com, 
	alexei.starovoitov@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	mhiramat@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, davem@davemloft.net, 
	dsahern@kernel.org, mathieu.desnoyers@efficios.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, kees@kernel.org, 
	dongml2@chinatelecom.cn, akpm@linux-foundation.org, riel@surriel.com, 
	rppt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_172253_229449_C6AAB907 
X-CRM114-Status: GOOD (  18.88  )
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

On Tue, Mar 4, 2025 at 5:40=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> On Mon, Mar 03, 2025 at 09:28:37PM +0800, Menglong Dong wrote:
> > The per-function metadata storage is already used by ftrace if
> > CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS is enabled, and it store the pointe=
r
> > of the callback directly to the function padding, which consume 8-bytes=
,
> > in the commit
> > baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS").
> > So we can directly store the index to the function padding too, without
> > a prepending. With CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS enabled, the
> > function is 8-bytes aligned, and we will compile the kernel with extra
> > 8-bytes (2 NOPS) padding space. Otherwise, the function is 4-bytes
> > aligned, and only extra 4-bytes (1 NOPS) is needed.
> >
> > However, we have the same problem with Mark in the commit above: we can=
't
> > use the function padding together with CFI_CLANG, which can make the cl=
ang
> > compiles a wrong offset to the pre-function type hash. He said that he =
was
> > working with others on this problem 2 years ago. Hi Mark, is there any
> > progress on this problem?
>
> I don't think there's been much progress since the previous
> discussion a couple of years ago. The conclusion seemed to be
> that adding a section parameter to -fpatchable-function-entry
> would allow us to identify notrace functions while keeping a
> consistent layout for functions:
>
> https://lore.kernel.org/lkml/Y1QEzk%2FA41PKLEPe@hirez.programming.kicks-a=
ss.net/

Thank you for your information, which helps me a lot.
I'll dig deeper to find a way to keep CFI working together
with this function.

Thanks!
Menglong Dong

>
> Sami

