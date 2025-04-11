Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC524C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eht9iaQ6o1fN2gEoUHVMqICYWehtz7ZUwi+FbnEXgE=; b=ds4nH1S1sba6sDC8wJA5P9XVsk
	LFgjLWbLdtcGEYqnnGEYLV34YD/CUku6I3+WnLzTV56m/BbCP7gGfepPKO4F3XFfjjzcA+2/UiNE7
	5+Rb3Z6FvhHUFUKIcADRJuXFjwsIA7cogyiwe0mn8jevBU8JIONdQlSZ6NQDbE2Kx+MPMk4YowV8Y
	aR6Do6IXgY67oonqc2kOdUcH+0CssHZtFPBveT57uqFfWNTIqYdV8L0ARJYQPc8tY2m6VleFyKcZa
	lq9d90S3XrE7Lbozf2UfsYX00fIjt/Lt2L2SQogMkuP5q4vnqOsEfynJqnV4rBYNNZBe5Mtx4VyVN
	Oi9vZ4JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IPv-0000000EZ4b-0Jfb;
	Fri, 11 Apr 2025 17:43:51 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3IHW-0000000EXqK-3fOG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 17:35:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2242ac37caeso9445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744392909; x=1744997709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eht9iaQ6o1fN2gEoUHVMqICYWehtz7ZUwi+FbnEXgE=;
        b=xp7ZlXZwWuhN4Y0h9A5ERyM4efEq/90xwQsvwy4tikMVFE6kxP7ihBJUgD+cNFbmy0
         NEE3JwLvLWxPpRxIM577//RJG2b+KiElWSdznhjHxXd07wzQBlSnlVGwoMMRT15FOqUI
         F/bNwkcPxrRNyOwFsOgmZvwTZDMlZY3spxTyutTEHs+NMdqXGJhs/p4B+Yi0rudw/Cp3
         aQC8OJWAPk60QqwC5SBFDtuZ2jIfRWySYVLixsRPLnrllCBVMVmiP5F+UrxNag9fIU2Y
         pYc9zZAzEIaZhAYbxlHo80aVs22GGpgFv4aa+npB5whSrNPm1ZwPArqm6pzftCNmizOS
         /RTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744392909; x=1744997709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+eht9iaQ6o1fN2gEoUHVMqICYWehtz7ZUwi+FbnEXgE=;
        b=rkFu2VQ0j24rKUq4mnmPJObfgFcqwhDeJ2e2jFLG9w/B7+Wns+q7/XTsBub5G1yMqI
         rQTt9klX2f0OhMsZBMvkpbGwPi7dVhlKfmV11kjP5k1o8lvI12q66XfbH+ofy4YKOETX
         sGmzFVwARjxGTJYh5pNWZgddIlXvm63D46FPo8xYEcVkv+7RcWUDi7seezG478ZP1/c0
         Fc6hZVbvTf4icgOkH1B6rbBDYS7ARjzpdmwkRC+0GR8B/k0kB2oJ9rKhxAxf9dgi7eZQ
         IiBjcxaA5x2+nJJMo52kyp1jLIM93J+wcsKKLOyCqmjf3bHhGBx3k+/GLkU1SvDaIDk+
         81gQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9GeGveJSNVoiP+4vC7jqlyv8mRLy0Q5mjeYhwdbH9zBE8UttMw8ZXKxwb9k8uZz7twsPODxUDmJuZeJWdTljN@lists.infradead.org
X-Gm-Message-State: AOJu0YwlGLm43MQ4qw9HYDY2BZ/eXO+7eyLrHzeg/u446izRkE/CeW8A
	lbTYB1uTcPf37FQW8vMhgl5WYBdYWm11T9HL0LLHRGTb49yLoyZRRp6hISWgzTxYX6qeFSFpgGV
	59L0TxbnEuGal4oRa8F4BZI8GdArv8jJ9ffxl
X-Gm-Gg: ASbGnctONgC+1Lit5bTWuWW3ICQT+qSVX2BZS8acVdAKoKHvsPVj49+5mtNgt6JDGLi
	u8blTnURgjdfiXwd92EeHiiv9kiwO6+MnEsXn7Ww/hRkiIoKOtqlWWH4Kuis/gxcdDNhqlq9lKG
	ReWJ3kE1atJNdT4pSxzk/fNy0=
X-Google-Smtp-Source: AGHT+IFsqGb2NI4C998L4eRk5pxG9ZDV+EPyXU0sBnQYjqjaZsqLTIZPs5b8kewYg6GP32+Vd/vVcfo+p6pguFqbuOY=
X-Received: by 2002:a17:902:c40e:b0:216:21cb:2e06 with SMTP id
 d9443c01a7336-22bea920b31mr3043845ad.19.1744392908956; Fri, 11 Apr 2025
 10:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250408171530.140858-1-mark.barnett@arm.com> <Z_ZcRiHTGljxEEdN@gmail.com>
 <2fa741d8-13c7-49c0-a6c5-540a7c2cf3a7@arm.com>
In-Reply-To: <2fa741d8-13c7-49c0-a6c5-540a7c2cf3a7@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 11 Apr 2025 10:34:56 -0700
X-Gm-Features: ATxdqUEZa_1pWKSod4wY40ZarBa-DN6S4qpDe5Ur1LE7Pb1ofS8DC8N_Fn09SwQ
Message-ID: <CAP-5=fUukVQMRHUQ9Mpx38H-7VNLt4mDj-jaYgn8Tf4zjecD-A@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] A mechanism for efficient support for per-function metrics
To: Mark Barnett <mark.barnett@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, ben.gainey@arm.com, 
	deepak.surti@arm.com, ak@linux.intel.com, will@kernel.org, 
	james.clark@arm.com, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_103510_916572_B7204866 
X-CRM114-Status: GOOD (  17.78  )
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

On Fri, Apr 11, 2025 at 4:08=E2=80=AFAM Mark Barnett <mark.barnett@arm.com>=
 wrote:
> Tool Integration
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> We've been using a python script to process the data into a report. We
> can look at implementing this directly in perf report, if that is
> required. However, I'm nervous about making the new feature the default
> behaviour for the tool.
>
> This feature has been integrated into our tools [1] for the last 12
> months, and has received a lot of testing on Arm Neoverse hardware.
> Other platforms have received less rigorous testing. In my opinion, more
> work would be needed to validate the PMU hardware & software
> characteristics of other architectures before this can be made the defaul=
t.

Hi Mark,

Wrt testing, in v6.14 we've fixed up the python scripting with perf a
bit more and there is an example that parses an event and then dumps
samples here:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/python/tracepoint.py?h=3Dperf-tools-next
There is also the perf script integration for things like flame graphs:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/scripts/python/flamegraph.py?h=3Dperf-tools-next#n96

I don't think work should be gated on cleaning up perf report, top,
etc. which still needs clean up for things like hybrid events. As the
histograms should use the sample's period then I believe things should
just work in much the same way as leader sampling can work. It'd be
worth checking.

Thanks,
Ian

