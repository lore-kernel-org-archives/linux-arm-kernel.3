Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47099CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOIDrkK5xvT4oUVA/rPFV65xHWjcWcJWlBhzkHkilNc=; b=moAb2PJq5W9nt3OWEWTLb49RLD
	iWK920yCt9NPyhKjRh7/p7SCAs+VrNWO0jyGQJ9DcTw7a7t3lmeDUdq3Pyq96+1OCrVxYhPbFzB87
	8Q3VqMlr+UZ/60kdWaKS6tERszJhqO0exjJWYTaHTQsMB+S+C/w4siUV04oNel4hZaDt1dzZ4zvWV
	KtQN+BdfV14ZC7KysRPhkVtWZWWiwNwTh+LZuBlNo1djL9a8Rnj7ig2w8GRgJv1gfXPo1bf82JuIs
	GlR7VV6jAFLn3jDmx/Zkgzec9n+8xCAbw6bpuY0204VxNtaTT1FPvVhhPc86Wp+zbfXdlmT/l6/3w
	oitlltvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDxd-00000000LMz-0tXC;
	Tue, 19 May 2026 06:29:49 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDxb-00000000LLs-1Hi7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:29:48 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-6314c3818baso2549312137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 23:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779172186; cv=none;
        d=google.com; s=arc-20240605;
        b=B6C2OiBLItr3/VH8dnwj8Q0ARHu/wA50Y/3MJjnoycYxBVatN1XhqibRpy0PBXxCuJ
         6ln4IpcUHHY15xxCIqCkHXJjFGJtEI4CLMsmOcj8C+ysbRuSttW0eLo5tbBaW448o7aD
         aMDKWyFtpflXG7uk7XLE0ExzL9ormncEOTud6Lpi4kuT81jIzTHphfMRVmjjTsT5lagH
         TZEborlMtVIkD26pNDB8sNLx3mG9f7gr9H2pcQbfCAmhgQ9Sw9S/cJjihS4TOLwMgY+F
         ifTIghFJ6t8gPhfMLCBCdRDn9nYT/nfeAHUZgqQnE0QY01GQYjgvMgkj2Map+pChQzWl
         8NxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KOIDrkK5xvT4oUVA/rPFV65xHWjcWcJWlBhzkHkilNc=;
        fh=I+b5pYvyZcLeG0YwhBHP7T6ACtr6ZuhTWT602NJCdBQ=;
        b=S3MrdApMej4tAmEkwe4quTCYq6BirDzPmjH5U0mmyKC+qCQYvvsSKfgz8tXS2bFegn
         h89a01uKmXp47fYZS2AbEbk0T0oYnWxHft3OiViKKMR7NBPC1KGy8E69S0Bu5dL/3gFU
         4ooejH2G4gyvz08IAD0bvD+xC3Kr4LDREEAhEgUv7hFkJLIUdOspwGug8yjvJA8fpaQv
         cl6ooJj9husnxsP7F+49POCmBjwja3utrjxwDw54bbaQ2PM+1/G4qk/58VNTFKo5631Y
         sLwRBusiUnRJzjYNll8fNi9tc2H6qSlu1Ls2njWIKTpCAc+9ddhfkl+0nlnZPjQfqNWQ
         lmwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779172186; x=1779776986; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KOIDrkK5xvT4oUVA/rPFV65xHWjcWcJWlBhzkHkilNc=;
        b=OdSEls7zGg03qaXmte4J5yLOQyY6kJvJ3j4tsstnNcxPSt1fIWTPmyHQzFBvvrXg+m
         tSZm/qUmQckRVpkJuB0klX5uh4/P1Vft1DFhzuDiPA1gI2qAopjk58IQGIrfSad+w612
         uSNbuEBYA0fcbB+kgpTYN5GNtYPIbHTB0zQZUvtYSu+fDW4N6WqVvJz3K25XkupeNMZO
         p2bCJlGQl8uQIWTiV8s/DAosrdMADZ3B92Y4fXTZQH05468pD4DJl1G6nEED7d/3Bmee
         wudTEDO0OqXXlLbe0CJuneWqijhKjKq4CRru/AjH7ggxVW9AJFEb3fGY/bG7uXqXN/t2
         wjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779172186; x=1779776986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KOIDrkK5xvT4oUVA/rPFV65xHWjcWcJWlBhzkHkilNc=;
        b=IJdUF630n4Jp579mkTC8sb4cCgNRVqBeycn7uY13fyc5x5y4i9LcLA+Hwz4Ie5Q2ym
         P+vLiuv5sebJYFIC+toeTqW0bs4v81xJiymD+dZ1nDoCSVXGfexfwqwAKdY+f85evnIp
         8TG/CbEal2bQuoRoJDYk3vVhbjmwPmBOOQypXTnTrBwrgzS22so5+n0ouslcIsU4iVPr
         QbZp9Yc3aOLhkre7Y/vGR8gAc/jb1LxO1FuaJQlIPVj5cU5kmMmXoE9wXrhcK2VmfaIc
         uIu+kDiGq+nYMXNlyk43Cv42cZjvWJTzGMpLfk96YUJTPukT/w7pyauDT47wnbQj5Lbc
         cTxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RROq1ebF/lcv0pX2eSgrabHb6lxASLcKzC0FgA2HbnmPNg0i6tLo2/Q4ONSfujSMqnurWjy2voTmaSI2AAwOz@lists.infradead.org
X-Gm-Message-State: AOJu0YwKKXVBM7Sh6XrQU/9Al2SUQ3ImcsRab6Np183bxLSbHYF2bXqv
	FvmcczFTryuL84lmdNoT9TMMEJvDgv48Qwz65c0jPeFR7fGgJJgn0WAT1gJxq0ooDDOhlqAmJsx
	MbFHfOxJx09o38p4YQj4yPZM571rRqjhmOK4hEwk0
X-Gm-Gg: Acq92OGsHqS42nE8krGjNNUl+Es6yvVVaoJwUGHBWCthR45ErHShj8r4jiW/LIjanoe
	O7F99imKtsn487g+7MDMbQCyXi65ArBta5Y05+HjBWiDr53zP+eRj3WCpQrno5tuuzEJzzD9Q9J
	10Ndgb2t4idFJnmOHWzS6ZEMwSkKgjKUhckxgLxlvBsIeYBWg8tlpdFcMucRwM9o985tujdUt5e
	V7UJrnynvayhpU3Kt7GdlzXg+gtSB9wP8LXS8m9UwGPwdumf9ZJwjYk9Vxnqi0C8WJCI7kT6iTx
	5IfbyWTUy6RFyv9XPA==
X-Received: by 2002:a05:6102:8029:b0:632:d8d5:2908 with SMTP id
 ada2fe7eead31-63a3fb923edmr8764523137.26.1779172185387; Mon, 18 May 2026
 23:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <20260428183643.3796063-9-dylanbhatch@google.com> <afTYzAF_x41pyilu@J2N7QTR9R3>
In-Reply-To: <afTYzAF_x41pyilu@J2N7QTR9R3>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Mon, 18 May 2026 23:29:34 -0700
X-Gm-Features: AVHnY4J27tyQp05kCz-lzjHHD3sgwRY6rb9HPySm6bAi_CgKxNVRppKxUDePNlg
Message-ID: <CADBMgpxZ+Lh7uvPXT63XvKfxe_OpcqGN2EZAQ3PZiWvLiv3Cjg@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] unwind: arm64: Use sframe to unwind interrupt frames
To: Mark Rutland <mark.rutland@arm.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_232947_379659_76112DA6 
X-CRM114-Status: GOOD (  17.20  )
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

Hi Mark,

I'm sending a v6 shortly that should address all/most of your
feedback, but I wanted to circle back on a question you had:

On Fri, May 1, 2026 at 9:46=E2=80=AFAM Mark Rutland <mark.rutland@arm.com> =
wrote:
> > +     /*
> > +      * Consume RA and FP from the stack. The frame record puts FP at =
a lower
> > +      * address than RA, so we always read FP first.
> > +      */
> > +     if (frame.fp.rule & UNWIND_RULE_DEREF &&
> > +         !get_word(&state->common, &fp))
> > +             return -EINVAL;
>
> Why is this get_word() rather than get_consume_word()?

I use get_word() here because get_consume_word(), in calling
unwind_consume_stack() under the hood, consumes the stack up to the
given address+size such that another unwind step cannot consume it
again. If the subsequent call to get_consume_word() fails, the stack
needs to be in a state such that we can fall back on a frame pointer
unwind. But if we were to use get_consume_word() here, the fallback
call to kunwind_next_frame_record() would not be able to consume the
FP from the stack because it would already have been consumed by the
failed call to unwind_next_frame_sframe().

By only calling get_consume_word() on the RA at the end, we defer
making any changes to the underlying unwind state stack until we are
sure the SFrame unwind step will succeed.

>
> > +
> > +     if (frame.ra.rule & UNWIND_RULE_DEREF &&
> > +         get_consume_word(&state->common, &ra))
> > +             return -EINVAL;
> > +
> > +     state->common.pc =3D ra;
> > +     state->common.sp =3D cfa;

Please let me know if this reasoning seems sound.

Thanks,
Dylan

