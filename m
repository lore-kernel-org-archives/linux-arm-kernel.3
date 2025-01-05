Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD04E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 02:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUhUFqDCLLYcCKnTvKrRzZf5y8VDBYHwWNIj7mYbRr8=; b=DfHfds0DoMCKQJa8znJNqEvmr3
	byZ8xkjLjgbOig86jvcxtOFAAEC5mRtu95D4G8wewU3lYLmKMwMvJXAPMGj0sAKL36MAhpNZoWuIS
	sObMSpwD3MpOueWLWeqrEabMa+XS/mSFPfzfL1BYpfAm5+8wFzdFdjJbp8lNBeF6a8/XWLLEf1ktm
	GfHfcRiDQS+u7SP2c7dH8ly0Rl38/l06czD1ufyBxWz5JJn4jpvoxwfwlWJWFwTO0EaAd7j33UGqg
	vAIV+Ywsj+UTujYf6LSJ/9nAIL3nHO1MteZReWtRiBY69OuWOrkKC+bDESSmF3OxfjZegT5KbG5ID
	3AL78ciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUGev-0000000G44Y-2a2A;
	Sun, 05 Jan 2025 02:46:33 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUGdh-0000000G3qI-1YeI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 02:45:19 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e398484b60bso16675829276.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 18:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736045116; x=1736649916; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUhUFqDCLLYcCKnTvKrRzZf5y8VDBYHwWNIj7mYbRr8=;
        b=ejcSVKw2rjf70qvQSovfhZEAlOS6iegpdx8h+aRqIzEV4Qt9WmjdVAk6zdymwTAy1C
         CCV83jLr7yYZAW5VoEnQ/5O0NKrn9tIG1+QrDmB34hvHX7cT+QOG9JMRUhZYEKPL4WG0
         0oCmA4WT7ZelhrdIgnNd1NFwt62oMuyL1oFs4eQmN4Yk2On89djg81Op54/LFLpCKARJ
         Wb9xqElmCg301fu9L6I/RJJHAdQRH2Xr6cDkqFDQBbzBuWCVIpE09qZfDQV3fj2e7p0I
         jRBCnxiTT6xkI8wQJUd5jTi/kyaaLEcG1BRPzxzCm6f8SNKGn4rlgUvUomqJyyQNY9dt
         1GGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736045116; x=1736649916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUhUFqDCLLYcCKnTvKrRzZf5y8VDBYHwWNIj7mYbRr8=;
        b=bITYAQiLFV6iBFk3FXZJNn4FMyQLcmHPB7ATqpoyYdYX0GnWO/vNK9zVC6PXoYRfGN
         /QUudC2nsjcP1zEINzMeAsC4mHMGpIPIovT+U3SMZhBGq9iNlGQCAH7HRIbzAmBOaqM7
         FmbFDWrnj2Jjuf5xqAp88kVwevbmcnJs4Lk7589VPCw7tNI9xIJdlRpZYe/mbMzFm7u1
         YXxRziNbcByEoTmOVMInXuHneTnRMHCWapb5zCf8DWDWov+HmQveK1qD0FkxymJ2ILtO
         HLKvokm6R/yGvPTddeJtWA21QFYi+Jdc3hs0hPG40e5iW6xor1WULfFjdJIFt6R7Yee0
         XTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzwmYo272oEXJYRLrvp2Ji9mZ3OaBWXvPt4ALIxWS6cz2gpFmOXkX36/7yoNL4uLoeFP74oLazSucICCQOaLzH@lists.infradead.org
X-Gm-Message-State: AOJu0YwS+crSu5gSssf2cKOyzOs91/PruU7ZXruepsxWskVvmH+s+ZT0
	EXyii1PeesmtXCQUdBuZj47jsYz3+xUNlpQJ26FyRYUCL0AVCDaStoHMWjZ3tiMFrIf3Nlm67MG
	u5BNI9TiHMT8M9SVAsqx8GowK4lefCzEi7IKa
X-Gm-Gg: ASbGncsoxFCBBv+gCyamTBxOyyVd5Et529+05I1Hrf0tYltnzp0TbpoN/OFHY+rv5ZU
	jMj9NnMOuuMusRTjCEXvIjNKN5K+KQ8NF0m6L
X-Google-Smtp-Source: AGHT+IGThgi8HmQDrrdLZKo7/6iXHtT/+1efSKbFMBP4wTU/9vzStB4XDWagUs38rOJg1HKyWbfdsUnbP2IRzhgHd+w=
X-Received: by 2002:a05:690c:4b05:b0:6ef:801f:437d with SMTP id
 00721157ae682-6f3f820e12amr435589197b3.26.1736045115828; Sat, 04 Jan 2025
 18:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20241223070650.2810747-1-luogengkun@huaweicloud.com> <20241223070650.2810747-2-luogengkun@huaweicloud.com>
In-Reply-To: <20241223070650.2810747-2-luogengkun@huaweicloud.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sat, 4 Jan 2025 21:45:05 -0500
Message-ID: <CAHC9VhRRu-UYEV_-0-QgOZ3ByVwp-ZdEphmsvy4NcdqynH_tDg@mail.gmail.com>
Subject: Re: [PATCH linux-next 1/2] perf: Remove unnecessary parameter of
 security check
To: Luo Gengkun <luogengkun@huaweicloud.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, will@kernel.org, 
	jmorris@namei.org, serge@hallyn.com, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, stephen.smalley.work@gmail.com, 
	omosnace@redhat.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_184517_765541_77457B90 
X-CRM114-Status: GOOD (  12.45  )
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

On Mon, Dec 23, 2024 at 1:57=E2=80=AFAM Luo Gengkun <luogengkun@huaweicloud=
.com> wrote:
>
> It seems that the attr parameter was never been used in security
> checks since it was first introduced by:
>
> commit da97e18458fb ("perf_event: Add support for LSM and SELinux checks"=
)
>
> so remove it.
>
> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
> ---
>  arch/x86/events/intel/bts.c     |  2 +-
>  arch/x86/events/intel/core.c    |  2 +-
>  arch/x86/events/intel/p4.c      |  2 +-
>  drivers/perf/arm_spe_pmu.c      |  4 ++--
>  include/linux/lsm_hook_defs.h   |  2 +-
>  include/linux/perf_event.h      | 10 +++++-----
>  include/linux/security.h        |  5 ++---
>  kernel/events/core.c            | 14 +++++++-------
>  kernel/trace/trace_event_perf.c |  4 ++--
>  security/security.c             |  5 ++---
>  security/selinux/hooks.c        |  2 +-
>  11 files changed, 25 insertions(+), 27 deletions(-)

This patch seems fine to me from a LSM and SELinux perspective, but
I'd want to see an ACK from the perf folks before I merge this.

I'll also leave patch 2/2 for the perf folks as it seems largely
unrelated to this patch.

--=20
paul-moore.com

