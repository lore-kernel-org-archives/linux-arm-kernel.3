Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CC4C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 02:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3E9pfv5IoCCsu+3HPCYQctwF4eS0EkJccI7K/G2Hrfc=; b=Z3Nx/zLkWz4WfnpTdBpVgssGy/
	DX936Yoc7EEyeSY57RXKfs5NrU71tI+nBqizXSbiRmuqvkFwgb/Yqya+OKRzEUQH6l9dXmc9sw5YB
	q+80P1F/A/x9y2K3SX1nFnm5ENgDFbWPGIMmfy08PhvIK0x17VUK8OFyIl0wXhrAtWKy7FNBaNcqo
	iQpLspdXeiiRvLr60jfY3aJxBhs2pUxavDg/KGP7va4CvwD9Mtk5yITA6d65un3xuWddlXiQk2gTt
	UkhI+8qg3oXrjmEwuMHGH3/+MdnyZqMpsRaSMW/sUHyaHdo85SfXPNguq1kcsJOPHwDlIQ0esqPoI
	5t0P+rxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvnXR-00000005LGI-3K7n;
	Mon, 17 Aug 2026 02:57:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvnXP-00000005LFw-1MIx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 02:57:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49557167508so28978375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Aug 2026 19:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786935441; cv=none;
        d=google.com; s=arc-20260327;
        b=MrPPBYg5NZS41lLW3l/pZb433r/Rv5DAbHxynePBZ3sjuFRDjZygDcWEZtuZYzcwoG
         zEoCpfo4KydFSWdc4m9o1Dzy39tf4br8vLm8c0onwT+XeFIm2euJUDCROoBkP6znViNd
         g17ygRQNLhvMtjEy4Qq/lYc2Qyh+hRmWRn98t1fjOsgYgqteuZ1eaMmZA3njzn96zoN/
         oTMaPD3ekodtJBL+7eC6Wd2lfHv/nwLpNwYf6SneYLWbvZZCmpcrOcdNhpMtY1Okdrgo
         NEIaKdczKT6JkYWNt2VJNxwXfJGyvXcKY2qKrlzvxiTJJUJwfao1QhxHSHxv1UBZzocE
         I7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3E9pfv5IoCCsu+3HPCYQctwF4eS0EkJccI7K/G2Hrfc=;
        fh=4l9oP0nSBGXYUJZc10XaKTZm4a1EvbSpEzmex8mwhIk=;
        b=oIZc4rzXaKGzKp4/8iWo0bAq1mxDSnX6vP6hKromuyZ124mfTsnqejKu+cPaJuJJSA
         PKn8Xd3Fpj9qIONKAnGaqBbQGMTj0DoR8+v+uwXr0HMiQ6C6iYQfOLg5SNyayfkXCPVK
         0w+CGplqGPWE+2MQb7uxabLMM/NX8iyrIk8ZELbRe8lmqg39+UxSpssO8SRP/4zARb6o
         vn7xKmm9VKY3lqp6+zo39ZtkNj43j/26mRnhQM1LZkETHerTDfPcbxpiamgXEl1g/dig
         uT/pbDt/7TaRIvK/FefVmvv3k2cmdMZuZm/EcYIXNSG8B9jv1URWc9Kbh/4qejwOaYwZ
         0Rxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786935441; x=1787540241; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3E9pfv5IoCCsu+3HPCYQctwF4eS0EkJccI7K/G2Hrfc=;
        b=ptTaihBls1UwVujyU4dUuN0/fF/zlo/n3I24QTHzeBZz13d7p+r2Qhh5jNvoZGlsIU
         MR2ack88YzRoxxkMliv1yKVpqlwBbPOu9FmqA8fqvuevy8NOFKEnuyPUNvGUZ1+LajxG
         MhwzZ/p1oOERN+uN7h/lkcf4CyH0/Yf8xkRtQReL84nmZIROf7dVJqYINWheFpdukAVH
         47MjQyJKoUGwsiTdY393nwe1bcfSZIFoX3mvG4uSIORr4FuAWWIIsNTQkNZ/7FWrTVh0
         V+CXFVhwsxrq+YtiaUgQKKKvpvv9WRcAUJ4ffhjvlHgMv9JD50I3you9kgzW8ObPihI8
         R2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786935441; x=1787540241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3E9pfv5IoCCsu+3HPCYQctwF4eS0EkJccI7K/G2Hrfc=;
        b=WVGwTvhi9E5BBVXaRm6SOYzVM+ftYHwSMyy6pKeimgVPOVX25Fne7fg3IHNDGe4CWu
         pdTUxvqoPSCaQEJomVqDF/lo6xtOcxOQHfqSARMV63oy8fhx+oIBP6OUcI68fqQlBete
         O57x1VqOjJuWdWHU0suYJbNHBCOC1RjZU4K4f5KhTKa4SJ7I4l6mViF7nC7Pxh/UjjT2
         VGZaExwIxR50XLJiS6vzHwHCn5IJCDOaBO21aIulPti5FWSBlYKr1jw62gypkT4MgOTb
         mAJVetHD8+fz4OyBbvssoceURp+YF3h27zc1XMDuLM7VwrSZKo12U5UKJ1dht2iYXepR
         Z+ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhFRKVSGBFpL9/+7sdAlM94mJCzyBdOvtHRPEJdYfTz3jEm6WPuyn3Tqi0tCkpbjHFJpnPjcWmYUu+kiag6daa@lists.infradead.org
X-Gm-Message-State: AOJu0YxVyKN3NtqRR0dp7RHKjWKuWjNUfkcy/KtDX/YJnLBgz9GOYjvU
	2KpuAx1tJ21J9QWhIqdmUz2TbJ0AUIunIQiNVVwI0+k7+7Dhj4fUYGMwXZpQIoO960xbM+p/1rT
	QdU11ktqJaFOurCsUlFVpp4AhBpVdOOg=
X-Gm-Gg: AR+sD12CAULmQA5DAqKq8jYqZNXaNbOxEDTunYbpKsSoU5CBtpNiTMK4pUDeEhFEPQF
	2zy17uJQpIygZ9rsRh4cclLfH5NIxNQW1iBZmV2DBKQ6/7yUBSR3AC7haOA5Fm0RoHwhrgtRV5u
	TKbm56pIWxRW9MtTUmLkA5TyBMx4kqJjtJm4hYvF078/z/h3zV8fISiDTMSmFmFkR7D4XzoaxUt
	fCDrgCDluhHJrDlP4Xle9f+JwGuxBm1TaiPNC320z1mfjqjEYWqUTZEX1XATQYYIsRydiIPslxQ
	doKHPi8C9k5v9MwqbDF4omHasp7rhJYHRvtRe742l3XdMrlDyW2Y0qV/IKs1VpbBQH621H+4n+M
	mrA==
X-Received: by 2002:a05:600c:4e13:b0:498:11b5:3ff7 with SMTP id
 5b1f17b1804b1-499879bd2e1mr332951265e9.18.1786935440695; Sun, 16 Aug 2026
 19:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260816142222.689624-1-kunwu.chan@linux.dev> <20260816165630.84808-1-sj@kernel.org>
In-Reply-To: <20260816165630.84808-1-sj@kernel.org>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Mon, 17 Aug 2026 10:57:09 +0800
X-Gm-Features: AcwNN1Wv4FilngBM7zb7KtysHXMyaR6NdUjrcCRsxZOtSQWQVLsk7gEZuLi0ywA
Message-ID: <CAN_Opa-aEvmx7Y0xPXHvhaOurt2-nnDMxLjGaHCdMXDsQC=2Xw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] mm/damon/perf: add ARM SPE AUX backend
To: SJ Park <sj@kernel.org>
Cc: will@kernel.org, mark.rutland@arm.com, akpm@linux-foundation.org, 
	shuah@kernel.org, kunwu.chan@linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	damon@lists.linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	lianux.mm@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_195723_412156_94A7CF41 
X-CRM114-Status: GOOD (  24.71  )
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

Hello SJ,

On Mon, Aug 17, 2026 at 12:56=E2=80=AFAM SJ Park <sj@kernel.org> wrote:
>
> Hello Kunwu,
>
> On Sun, 16 Aug 2026 22:22:17 +0800 Kunwu Chan <kunwu.chan@gmail.com> wrot=
e:
>
> > From: Kunwu Chan <kunwu.chan@gmail.com>
> >
> > This series adds an AUX trace-buffer backend to the DAMON perf
> > observability framework, enabling ARM SPE (Statistical Profiling
> > Extension) to deliver hardware-sampled access reports into DAMON's
> > existing SPSC report ring.
>
> Awesome.  Thank you for making this.  This will make DAMON be more useful=
 on
> ARM machines.

Thanks for the feedback.

>
> >
> > Patch 2 touches drivers/perf/arm_spe_pmu.c to expose the PMU matcher.
> > This change is tightly coupled with the DAMON AUX backend.  ARM SPE
> > PMU driver maintainers only need to review patch 2.
> >
> > This series is based on the Ravi's hardware-sampled access reports
> > branch [1], and depends on the perf AUX kernel-consumer RFC series [2].
> > The dependencies is not upstream yet, so this series remains RFC.
>
> Unfortunately I haven't had a time to thoroughly read the dependent patch=
es.  I
> believe the basic idea of this patch series is aligned with the ongoing D=
AMON
> extension roadmap [1], though.  That is, this series is supposed to be a =
part
> of the milestone 3.  We are currently at the near end of milestone 1, and=
 aim
> to complete milestone 2 by the time around next year's LSFMMBPF.

One clarification on the architecture: the AUX backend is intended as a
transport/front-end for damon_report_access(), rather than a separate
reporting path. spe_submit() ultimately calls
damon_report_access(&report), and the AUX path shares the same SPSC
report ring and kdamond_check_reported_accesses() consumer with the
existing overflow-callback path. The main difference is the producer
context: the overflow path enqueues from NMI context, while the AUX path
enqueues from kdamond process context.

The perf AUX kernel-consumer API is still an upstream dependency, so there
is no specific part that needs your review right now. The implementation is
already functional and tested on Kunpeng 920, and I can rebase and resend
once the dependency chain is ready and the relevant DAMON infrastructure
has landed.

Separately, the DAMON perf observability framework
(CONFIG_DAMON_PERF_OBSERVE) was developed in parallel with the AUX backend
and is already implemented. It provides the observability infrastructure
used by both the existing overflow path and the new AUX path, including
per-CPU pipeline counters, debugfs statistics, and tracepoints. This work i=
s
independent of the AUX transport, and I will post it shortly as a standalon=
e
series.

Thanks,
Kunwu

>
> I will hold review of this series for now, and take more time on making
> milestones 1 and 2 for thier planned delivery timeline.  Sorry for being =
a
> bottleneck of your work, and thanks in advance for your patience.
>
> Please feel free to let me know if you have specific parts that need my r=
eview
> right now, though.  Otherwise, please make sure this is aligned with the
> roadmap until we finish the milestone 2.  I do want ARM SPE support of DA=
MON.
>
> [1] https://lore.kernel.org/all/20260525225208.1179-1-sj@kernel.org/
>
>
> Thanks,
> SJ
>
> [...]

