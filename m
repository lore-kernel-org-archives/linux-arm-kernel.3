Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D86C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFdlJ6N6MHe++MwGWkILbc9+cPIo/XiWxbVEpXS+OnQ=; b=bqK3FEbovb4VhQ7Fm+XSmvgYo8
	nTGYv+7jqA9zLxhQRAV8Y/ZGfTuo0bm5VH/HlarbQ42Ul7Gh4Yw4IDAh24EORNGQAY6QDvQWyhv4k
	3mJigpRPQLAAAhVmgV4QAoXT6oYreUiJz7kxF1Q1z5dlHA+sJFo0dzqN9eVjLFc9vdLjGBL9GpikI
	Ezrm4hxYSdEYXskHsujcSTLlusEPLg+2CMwpRNdYgVPcgDcuEf25piVYbCpxSWGvwuRSJQWpeTvr9
	rKEkxsDKDIfRNvZBPW3lvCZvq9C1o/bl/8aPiSgAQG+4VZFH/T9XljuIGzUc07toWzXwI6eSBBmyQ
	8n0iME9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGNO-0000000FySQ-0CEF;
	Wed, 14 May 2025 17:58:42 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFG0d-0000000Fs4Y-1Wvi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 17:35:12 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso135252a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 10:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747244109; x=1747848909; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EFdlJ6N6MHe++MwGWkILbc9+cPIo/XiWxbVEpXS+OnQ=;
        b=l9ZKOdXwKookM0IAZA8qyA88EgW6jz8QByW/m6acNtrUvsIuAYBMD8eqOzLQeXf7Zy
         VeimoMEQWSuC8UvlQpqTL6ughi/52ApzpuvYyKwQWtk8qo4WFtUzKdj7ueYVsIxXn20E
         8tPsFBhqfEQGwMAFMrAWwyDPEQeB6uBS/mn6M2UkfrxZHFUdZI65UnyZsTbTCzaU1bkx
         9qNMvsUc7DOROQbZxEu6vwlnwW1AvDcL4Op4IT5bMB8wDXf3bX3ywYxKQveile1XKn+5
         nO7RZtzguLt24WkuYzJ06ogIT+Empn5SWonEDUwO9q7TIoW/8OZC0cgqaEU53In18Acs
         nawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747244109; x=1747848909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFdlJ6N6MHe++MwGWkILbc9+cPIo/XiWxbVEpXS+OnQ=;
        b=Tp1FjJd9JL3qU5Jw556tU1NJps2Zl2d8Riadi9DqTsZV/6qG/LURlcebOlxlhad2oX
         RyZu8HQYpYUth6HVlAjZMMeuUDiyLB3PiRyEgR6Oy79ZhAD7DMv4JehxkOhjNb3XKvv7
         LA3YTqKJ1KnUhAwmRQg9jaSHBibmZcmUFe78FIkFNjFbV3bnw/LgMBAiKVSbgvdSWYtm
         M3Fv77dDFBfEFKItrPRCOUfK4V2w1cZ4ot8aUdaljUFvBosD0lmRmCIl7dA1jYUncJft
         awowMKoFxIo9MzKWaSZGxmUgttJtxWVK4X+WA1R+L1OBoPgHMNP1yY3ib9Uy0iIkGoUR
         6EEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi6UBxWXuhI9h2lYND+WK5pq2genGtDrAM4E2MWXpdFF25WKQrojfq+23ay7zGbaYD3mADf+Ss4EIwK0lFdcPk@lists.infradead.org
X-Gm-Message-State: AOJu0YysnXoXJiiAsaSsjiwSLn84uY3tLE13lbEFe9I3tZRNR6aawjNj
	2zJujUHhBOaAum/lwGC+i16Pg02WcgEZS//V1jWCnHRpZScAOSWGOpobJCXG006FJTlE6aU1nj9
	PBOdYMie5cW8MDV5JlRcJSnQwuzc=
X-Gm-Gg: ASbGncsSvsSBDNihcbEPDCJfV+EIX9mppnWLpUzVVHG/Jed4u4jaWxUupoDHzM7OmyR
	QIz7wsadjYkalEDnBupkyLu7qGCFcEIq7Qp91XQg1o1OzkSZ+ZZJ8C0YiFwwv8CypL7DYHPOBAo
	teQftrfKk/wbxZATFNvShz2xeLjGgIwcovTOBT2b06591Bhb+l
X-Google-Smtp-Source: AGHT+IE+VwudLGlVqV7MTPJNv/2IatRwQ5fmgPNY2cQCAUPG/OX3YqdyDUfjFCe1H9Ew0BhHDSRLrN8kqa+WikFcqEc=
X-Received: by 2002:a17:907:8747:b0:ad2:4787:f1f4 with SMTP id
 a640c23a62f3a-ad4f7114433mr410241466b.15.1747244109100; Wed, 14 May 2025
 10:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
 <20250501073603.1402960-12-luis.gerhorst@fau.de> <CAP01T76jeSg3W-OyfBfSbAjpEhBr_h8rbS-Hubk6gDdrkeEj_Q@mail.gmail.com>
 <87ecwr14mt.fsf@fau.de>
In-Reply-To: <87ecwr14mt.fsf@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Wed, 14 May 2025 13:34:32 -0400
X-Gm-Features: AX0GCFtOVfH8muGhMGHBFxUVlaXx-8L6TgNxC77DPS2kBNNOVj7O1t8HiDkeHPo
Message-ID: <CAP01T75xiWn56dtpS06Vm9sMRfCBv+uHNe47Fh5hqu+4xCxOiw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250514_103511_408101_95BD45E1 
X-CRM114-Status: GOOD (  39.32  )
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

On Wed, 14 May 2025 at 13:30, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> Kumar Kartikeya Dwivedi <memxor@gmail.com> writes:
>
> (including relevant part from other message)
>
> > On Thu, 1 May 2025 at 04:00, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
> >
> >> +static bool error_recoverable_with_nospec(int err)
> >> +{
> >> +       /* Should only return true for non-fatal errors that are allowed to
> >> +        * occur during speculative verification. For these we can insert a
> >> +        * nospec and the program might still be accepted. Do not include
> >> +        * something like ENOMEM because it is likely to re-occur for the next
> >> +        * architectural path once it has been recovered-from in all speculative
> >> +        * paths.
> >> +        */
> >> +       return err == -EPERM || err == -EACCES || err == -EINVAL;
> >> +}
> >
> > Why can't we unconditionally do this? So the path with speculation
> > that encounters an error (even if EFAULT) is not explored for the
> > remaining pushed speculative states. If the error remains regardless
> > of speculation normal symbolic execution will encounter it. The
> > instructions only explored as part of speculative execution are not
> > marked as seen (see: sanitize_mark_insn_seen), so they'll be dead code
> > eliminated and the code doesn't reach the JIT, so no "unsafe gadget"
> > remains in the program where execution can be steered.
> >
> > So the simplest thing (without having to reason about these three
> > error codes, I'm sure things will get out of sync or we'll miss
> > potential candidates) is probably to just unconditionally mark
> > cur_aux(env)->nospec.
>
> [...]
>
> > Hm, now looking at this and thinking more about this, I think
> > recoverable error logic is probably ok as is.
> > Scratch my earlier suggestion about unconditional handling. I guess
> > what would be better would be
> > handling everything except fatal ones. In case of fatal ones we should
> > really quit verification and return.
> > We may make partial changes to verifier state / env and try to bail
> > out using -ENOMEM and -EFAULT.
> > So unconditional continuation would be problematic as we'd act in a
> > partial state never meant to be seen.
> >
> > The logic otherwise looks ok, so:
> >
> > Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> Thank you very much for having a look, so then I will leave it as is if
> I understand you correctly.
>
> Please let me know if "what would be better would be handling everything
> except fatal ones" was meant literally. Such a deny-list approach would
> likely be:
>
>   return err != -ENOMEM && err != -EFAULT;
>
> I initially decided to limit it to -EPERM, -EACCES, and -EINVAL as I was
> relatively confident all their cases were safe to "catch" and because it
> already had the desired effect for most real-world programs. However, if
> you find the deny-list approach easier to reason about, I can also do
> that. In that case, I will review the remaining errors (besides -EPERM,
> -EACCES, and -EINVAL) and make sure they can be caught.
>
> Also, thanks for the pointer regarding sanitize_check_bounds() (sorry
> for the delay; the message is still on my to-do list). I will address it
> in v4 if it is safe or send a separate fix if it is indeed a bug.

Yeahl, that's correct.

My only concern was if things shift around we return -EBUSY or whatever
(even though it's unlikely, but you get the idea) it will be missed
and we may break use cases we were permitting? Definitely need to be
careful either way, but I guess the surface of interaction for unpriv programs
is relatively set in stone so it won't matter too much.

It's probably better since you've audited paths returning that error
which do not leave things in a partial state. So I guess we should be
conservative and stick to the three you have right now.

