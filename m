Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7971D36129
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 02:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+BC9bKNYRzaIUhTatFOzGkofunov+kcpxiHDzejgjs=; b=KJ6Q7cT69H9ZPzRUxH/w/53W73
	2QNVaL+cgIMPtsR3Y46mRTLvRK3SlkMjudGdXlOKW4emYwcuJB7XPeS4SWD3dx487H7CWsnhzGmDh
	Ih8NfZ01T4Cs4/dl+ORVs9j5i14uniwJv2N61VtT1MfDmHRlvjsUxMNg07fhZj0c0/YDk5wxYyTSi
	yvBIIcaTdONO8BG9uO60VcINp4tHwOCUz9dTxNmo/ef3LoBpzA52Ra3xcFZaMJpBZQI1TzWgn7K1q
	4ZL3MQh/miGm0lL5YTwk+D593hL/JY7IGFqRI+MT+mhoH2c3+Cyfj6Jmngwg3HKl5/ZRquAFZAGr1
	dg8ofGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VXh-00000001Q0a-2fdG;
	Wed, 06 Nov 2024 02:13:09 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VVw-00000001PeI-3dYu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 02:11:22 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2e2ed59a35eso4902896a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 18:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730859080; x=1731463880; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+BC9bKNYRzaIUhTatFOzGkofunov+kcpxiHDzejgjs=;
        b=OVlAdEX1rpsY791qAXW700jaR2gvR/XrSEBccQQ5fbaIIMsz1pdYtITNqade4XuXc3
         D5oDhXPmkeW8JVNy1/NdXrGzvhBhJi5ikLNYyGMyzBB4jCf7XhcJbSyIfSY+K2CHkYUl
         KeMmCzP2XgsaLQuDgUjf73EVtdlj+6yfBFjlv85rGpSXhxqV840pZRVOuZY1GhUYrg8D
         nTDEx5qzWTtGG5zHO40gv0vfN0jIAjou6ET1xi8/K+KaQ4nelahkdXMABZ1HaHRe9z5g
         fsMSKhLoIJI4BFqJHAVFYxenKys0wuZ7FI4roxyQOHHgs38iXKNl2f7r/HRW56FALfX7
         TdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730859080; x=1731463880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+BC9bKNYRzaIUhTatFOzGkofunov+kcpxiHDzejgjs=;
        b=Pcti8PoNOYlj9GzVqjmv4A8ZY8Bl25NqgZA1iRfFjPiO0NTDqo8MXOO/xoSkmD51YF
         Xp4T0qDzCE8VEzO98NNjA2AA2gJLKSA4MIdeMptCSttlvi6KPjGZUZdquOr62X4LPjOA
         jvVFvNJ68+tKPSWsRiFOHh12UW3w0N6iYttTgeg1x4O5BzuqNg0z3ZErvOttWvYaEnLy
         JZ1XVJy9XFxiyzSO8m+yJn6wHzQX5Oy2bmOlljD2eGt+jm994bpGY85eS6eaPjfn9YDl
         g1lHQOorRE8ZBfygALYoR4dvqNxMc0eEGMuKTC76ge4ga/KrzaCXiK2ypxJblRkkf7Kz
         OocA==
X-Forwarded-Encrypted: i=1; AJvYcCXQyx3ZABTrE1jphZUiLjt+8f6Jrg5RgGK4BhLtVI8iFw9b038u4J9wJPxXD2t7v8n42UTWpMAovmx9NmmW9yJE@lists.infradead.org
X-Gm-Message-State: AOJu0YzswpQW6K7iG0GvjyOfKjW4p5SFipYcUC6C7iNUK0JDS2T/M+6c
	Ggwyh/x3KiIy57t4Qr0mDXi/+jl/3SEO71OUfYiTutcQPfBJHUFjFrz/VE2MS2k8vGRxMqZA/Gh
	MUQ7bglRtoV0frRg7whMNtuTU+mI=
X-Google-Smtp-Source: AGHT+IGhuQ0Ki8lFJVw8HHIMRmUd846pjUdGQf6LulmYw2lSFPmOAplOZpFFGIuvUvpuGEld1hpQerhc+3AfhlnAJUo=
X-Received: by 2002:a17:90b:3848:b0:2e2:aef9:8f60 with SMTP id
 98e67ed59e1d1-2e8f0d531ffmr41021824a91.0.1730859079752; Tue, 05 Nov 2024
 18:11:19 -0800 (PST)
MIME-Version: 1.0
References: <CAEf4BzarhiBHAQXECJzP5e-z0fbSaTpfQNPaSXwdgErz2f0vUA@mail.gmail.com>
 <ZyH_fWNeL3XYNEH1@krava>
In-Reply-To: <ZyH_fWNeL3XYNEH1@krava>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 5 Nov 2024 18:11:07 -0800
Message-ID: <CAEf4BzZTTuBdCT2Qe=n7gqhf3yENZwHYUdsrQP9WfaEC4C35rw@mail.gmail.com>
Subject: Re: The state of uprobes work and logistics
To: Jiri Olsa <olsajiri@gmail.com>, Ingo Molnar <mingo@kernel.org>
Cc: Peter Ziljstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liao Chang <liaochang1@huawei.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"linux-perf-use." <linux-perf-users@vger.kernel.org>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_181120_952321_BE1E5DB4 
X-CRM114-Status: GOOD (  17.90  )
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

On Wed, Oct 30, 2024 at 2:42=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Wed, Oct 16, 2024 at 12:35:21PM -0700, Andrii Nakryiko wrote:
>
> SNIP
>
> >   - Jiri Olsa's uprobe "session" support ([5]). This is less
> > performance focused, but important functionality by itself. But I'm
> > calling this out here because the first two patches are pure uprobe
> > internal changes, and I believe they should go into tip/perf/core to
> > avoid conflicts with the rest of pending uprobe changes.
> >
> > Peter, do you mind applying those two and creating a stable tag for
> > bpf-next to pull? We'll apply the rest of Jiri's series to
> > bpf-next/master.
>
>
> Hi Ingo,
> there's uprobe session support change that already landed in tip tree,
> but we have bpf related changes that need to go in through bpf-next tree
>
> could you please create the stable tag that we could pull to bpf-next/mas=
ter
> and apply the rest of the uprobe session changes in there?

Ping. We (BPF) are blocked on this, we can't apply Jiri's uprobe
session series ([0]), until we merge two of his patches that landed
into perf/core. Can we please get a stable tag which we can use to
pull perf/core's patches into bpf-next/master?

  [0] https://lore.kernel.org/all/20241018204109.713820-1-jolsa@kernel.org/

>
> thanks,
> jirka

