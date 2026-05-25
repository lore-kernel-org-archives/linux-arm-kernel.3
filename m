Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE517CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtRRktUFX7dimAvFD0k1txS2luZAEgC8WWdwifbSzBc=; b=HJ6gu0DCTMmlhR72kk4Axfvfxk
	WKpZsNtTtIcayKtCiqpVbdvnyQa1SJ1mYI/bxJiKxjGPifn5L0TftaLmU9mZ3lVk0ZeNM7oQrBss9
	tOdwNZa9/rQ8Y0YPpKRWTs7npFL8EXtDZymb5+uWesFNmEH/o/XPh44+vnfQMnRMszhabXCvrNrHL
	gNRgjR7IcA6E3bomMhyO8dCE4WCG6wSd7ECHesp6FG7NJV5F0QwxnIthyIz5SzghviZZ6wpdhu/x+
	HDRbNpD7L5LqNcbKeqs0XcR5C+ZT1kklBDmr4WG1prMTdX9mkACygjPqlLM4TMeBg5w6GA6i/2/Hp
	671vqBwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRdxq-00000000aFs-0pva;
	Mon, 25 May 2026 22:40:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRdxn-00000000aF3-1Ws0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 22:40:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so225ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 15:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779748797; cv=none;
        d=google.com; s=arc-20240605;
        b=C4OFYA0TFaev55V0IIwZIB3+gLoelxUZuTWAR0ki05h60ybvm0/uMI3ZYV17NYFa+A
         HliiIgmmKKvwWqPHBcTCXW3yI1y7Xp6TNcTUm3+7Hgva9ELHM0d4TYocTPMuZN5ROqT6
         Ij7sHoPZkgJuHZRdAf3oYH7gb2EBqW0f7pe4PRsqjb6uhaU8O3YSdkE+0SrCO+TgLgBb
         WXH6aS51P5VqcAMERtTU4Z/als2FlMhF72wxk3Yz0sUH9u+irEtwMppUhug1SZbMMMuF
         fUJNMYMwsioyDmyWPzY+3xhNFzFzQm0rM3RvabGRrMojuOm1FEnsqJ798YFNLkLydVX/
         JElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YtRRktUFX7dimAvFD0k1txS2luZAEgC8WWdwifbSzBc=;
        fh=GdqhT2sVvUeQpV/W8aGL2ZSdYPjLLGuUZdRcW4TYlfI=;
        b=Ki7WA3VxfPuJkYNvVgtpaDCPB4w/hWPiUucDxmzD0jpgOD9kuKJfh7CXZIz3OEtR4G
         JW1yJN9vVKssoggnvg2BMiv+eUYKeZzX/xqqbXQ9BlpMYmYrdG4hO9ZAshPxMhQ18Jyo
         5tpx3zGz+y3BucDFMW8F28thcgBUD/6n3AqCtaNof73A/Xgsen0/WWI+jbXy13wedIur
         K1/X1QKNYeaB9nlMGJyK+2jYj5jsIO2eo6Evhg95tD7FKrTDHDpAd2UWNJo6QIoFvRDD
         1A9xZaRqA6ivaJpjCZ3DxdGceq/eocQXx6xz9L06QzT+3+hI7IMDB6nezRQp/a6EinPP
         8HVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779748797; x=1780353597; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtRRktUFX7dimAvFD0k1txS2luZAEgC8WWdwifbSzBc=;
        b=e/6om3myrCNsqxOzDDjoqYMOOcZwRnQ/N6hG33ppxDVruyTH/WFrqCSAoFWCIpFTGh
         AQulAUloF55Y/d22fR2TbYa6mqN9bkVDmBcljTeE9oDZVwdR4EG5uH6rdlPOUg8L8XQL
         FoBRvQVZBvW3TND6OzQoQfQaQE4MVr6gHeVasBgb0xE8cKMWlXgn8DgC4I88LQ7M8FbB
         8aETZRo/Sz5pwyLP/25kU0yjeWxqcYKx8IOFeg8O5waAWSivYQKh/KN50jUK53VXt2Cm
         f/tm7p+AaYrk7sEBn66tuU4eTpSWN3u7VRlikd/HLwj07yuWikJl9NMPu3iNUODW2Tol
         M08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779748797; x=1780353597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YtRRktUFX7dimAvFD0k1txS2luZAEgC8WWdwifbSzBc=;
        b=JmJzNzBHujMD9Qu31+0enU3y7nCcRIdy1SCXeJaz1zT/QUyuKBmX0kgEvMXE1+956F
         Dk0R26hMVFeDXXLdbNmxsOOXgsAz/C2T4/E7jBuPiBVL+DxxSyqWiqviq4/47Kjd9DSr
         TsSiUoGK4joJgm4QX5EX2BMyw5leWYC3Diq1mPwhbBBh89bWUS6i2QaxfsKaHWuPDEx6
         IcUF22Oy04Su518SP7nT0qWjLOWSSti8z7503m+tl0VeD15Sjj7HCv5PEf/KMbmHjNq1
         PW1t6G7fONazglVRZ047T8tAYplK4sJiGmLr7+d/tI7mnJc3AGLwjj4T4M4anGBGEJrJ
         LBcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Wx0Z+Jgu1MsOX0ynmZMOo+BOqRCC9pUOAdgdzHRnKSMbX7VI3Otf/VtXKE9hlfd+UfxiYbruaUne5uyZqaz43@lists.infradead.org
X-Gm-Message-State: AOJu0YyJYE/NWtKTtTa6Z8IqY6vXfbDg/ov5elA7ysrmsyzZx54eiOPr
	Dh1yunES2X1gEJTm8lN81zA2udyVrqDA221NJx7F3d/aXhw2opJ9YNySrHuNrr5Lkq4NdkLBGJ3
	BreZ8aAaDGVdY36AiFbpdsY6TicWQx3BWmMlQd9aW
X-Gm-Gg: Acq92OEXEpUvUDPUlljOhB5zZ5GAZ/u2RrFNrHVyWjY4MEdtYABGly4OWPCZtg+U5ei
	PzGV0BPdPBLD0yIMPM8gKr5EVaG8GdzXoCiAc0r45zlM3BztP3Cpi7uZHqSHG9oYtrljAHOHTVX
	Btnsjks9e7w2DIjH2RBh4di2wibaQ9ef3b3rY3AbgrkRYfAo2J9P0DhTaXrtwv+77wGe3Bgqch3
	RjuPhHCPorcTE9TfDAFt96wqxsI7UjS1hBSEQMhGfGWF4J0/6F+pPUQqcWrcGPaWTsLLtWhO1pL
	1FDS202yQUbqWCPFJG0=
X-Received: by 2002:a17:903:1252:b0:2b0:aee4:afe7 with SMTP id
 d9443c01a7336-2bebea02de3mr4131735ad.10.1779748796656; Mon, 25 May 2026
 15:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260428071903.1886173-1-irogers@google.com> <20260522220435.2378363-1-irogers@google.com>
 <ahStntuCibNk-IjO@x1> <ahSuZCJCQa4tE5aN@x1>
In-Reply-To: <ahSuZCJCQa4tE5aN@x1>
From: Ian Rogers <irogers@google.com>
Date: Mon, 25 May 2026 15:39:43 -0700
X-Gm-Features: AVHnY4KMYWv3qNKUqVnKwxsYEQRrbkKCgRv5srQjp63008XVUmADVFyVVV4IT_U
Message-ID: <CAP-5=fUF2DuHQL0A+QbcLqZwZQNmBEJXBAmD6YVYiQzE+1jDCw@mail.gmail.com>
Subject: Re: [PATCH v9 00/23] perf python: Modernize and extend Python API
 (Phase 1)
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: namhyung@kernel.org, adrian.hunter@intel.com, alice.mei.rogers@gmail.com, 
	dapeng1.mi@linux.intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_153959_443098_08D0A2A2 
X-CRM114-Status: GOOD (  23.83  )
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

On Mon, May 25, 2026 at 1:17=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Mon, May 25, 2026 at 05:14:25PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Fri, May 22, 2026 at 03:04:11PM -0700, Ian Rogers wrote:
> > > This series takes a different approach with some initial implementati=
on posted
> > > as an RFC last October:
> > > https://lore.kernel.org/linux-perf-users/20251029053413.355154-1-irog=
ers@google.com/
> > > with the motivation coming up on the mailing list earlier:
> > > https://lore.kernel.org/lkml/CAP-5=3DfWDqE8SYfOLZkg_0=3D4Ayx6E7O+h7uU=
p4NDeCFkiN4b7-w@mail.gmail.com/
>
> > > The ultimate goal is to remove the embedded libpython and libperl sup=
port from
> > > perf entirely, expanding the existing perf Python module to provide f=
ull access
> > > to perf data files and events, allowing scripts to be run as standalo=
ne Python
> > > applications.
>
> > I tried applying it now and got this:
>
> > Cover: ./v9_20260522_irogers_perf_python_modernize_and_extend_python_ap=
i_phase_1.cover
> >  Link: https://lore.kernel.org/r/20260522220435.2378363-1-irogers@googl=
e.com
> >  Base: not specified
> >        git am ./v9_20260522_irogers_perf_python_modernize_and_extend_py=
thon_api_phase_1.mbx
> > =E2=AC=A2 [acme@toolbx perf-tools-next2]$        git am ./v9_20260522_i=
rogers_perf_python_modernize_and_extend_python_api_phase_1.mbx
> > Applying: perf arch arm: Sort includes and add missed explicit dependen=
cies
> > Applying: perf arch x86: Sort includes and add missed explicit dependen=
cies
> > Applying: perf tests: Sort includes and add missed explicit dependencie=
s
> > Applying: perf script: Sort includes and add missed explicit dependenci=
es
> > Applying: perf util: Sort includes and add missed explicit dependencies
> > error: patch failed: tools/perf/util/evsel.c:11
> > error: tools/perf/util/evsel.c: patch does not apply
> > Patch failed at 0005 perf util: Sort includes and add missed explicit d=
ependencies
> > hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> > hint: When you have resolved this problem, run "git am --continue".
> > hint: If you prefer to skip this patch, run "git am --skip" instead.
> > hint: To restore the original branch and stop patching, run "git am --a=
bort".
> > hint: Disable this message with "git config set advice.mergeConflict fa=
lse"
> > =E2=AC=A2 [acme@toolbx perf-tools-next2]$ git am --abort
> > =E2=AC=A2 [acme@toolbx perf-tools-next2]$ git diff
> > =E2=AC=A2 [acme@toolbx perf-tools-next2]$
>
> > I agree with the intent and plan on reviewing and testing it.
>
> What I have now is at tmp.perf-tools-next if you wish to rebase from
> there,

Thanks Arnaldo, I'll do that.

Ian

> Regards,
>
> - Arnaldo

