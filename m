Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6A8CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=; b=np4sO9KXiSqtf3DhzD6noR6rNt
	MNrw9yMninXMTU7VMLeK2t9gtMlhgxDwKIxrBt+ac4mxSRuL9lLTYN0cRzSry9u8AV6S9mObw29Z4
	1BfUs/sgVKSFI8B+SAguztzBH/uZqcBowzdKq8ISFzmVGZjkXuo6nceQifPFaGm0IMN4oV7G2DT8d
	VfGgOEWcMwsCpYNnaiXYOWNPkgVE1GdeCBZi+baE6xNLdlRhZFBQWtOCumrlSCNqlKuvkFTrON/fK
	B7TTeBI0OlcR4v68tCP6PRv6Ra5tSR75iI//UoVUMY4ny+PqUl1r60MNbE1wkrKKdmlFNKQ6FCd6s
	96PKU7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqylr-0000000Cuth-2kzJ;
	Tue, 26 Aug 2025 18:51:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqyj7-0000000CuQh-2dnU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 18:49:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-24611734e50so26145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 11:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756234141; x=1756838941; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
        b=jJ/dwj/AlFqnBpfUvJ5LJwfS+pj2hnPfW0zswMiU5UexA0WP88bYNn928kqWqifQUM
         /GwpHLwhhmEGN1esTPcZG+VC1m8eZMMJNK64akijE13umpu2Ggj8BMOq0t8Vsd3nwtzA
         5hRZGN0fBS9NNMTwYWF7aT9fHUfx/+/MmMcGLryT3kzkej7T86HkJJrSRKPzF5Q/ZURs
         a/dxCjZ7rVQugh9GUaM4AqsssTuR14hokAbddFiSdtUuh53HaBT/O4cAZRSRbTMRPn5h
         M5ozMEhJUKe+8OL9s/V25nzfoCOU2WiuYYtQmaIb0iqKbW43SvoOaFIFdLwu9Bh9WjwY
         TQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756234141; x=1756838941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
        b=nEBAnbNd8mbFFqNBKhKXhhgd+4nAM8WpLL+8mIMwy5EtT0UTTKHbgc71zS/GI7vkBb
         RY0IiT3tqJvtowfQAXYfTnScNddrv2LNpVgfk3v0Eamvt8TU5aRD92M9E39hLL3sP/ts
         ivEbi9WDZ7yjlmOcQS3woXZhnNkmCTfXN7R+9if6Hj30sgJnKSswCks+TkFTkRUP5pRa
         2JlrmIop2YPPEB2EBH6I0k6fgm42Ppyven2P+W8cN9QYbj9PCsBZTKOOATGCc5CMCW71
         lbRxuBF6vwgYtRuA2cANkqpvVAuTOlRWzLKyv5eKTBAkl2hyeg4QDA+Uvv4A3PuyY7vD
         HOdg==
X-Forwarded-Encrypted: i=1; AJvYcCU0DQx6L9dp9zJJU/ggKfFqf0afpQkBqLpZbUIvFvzfNfE3KJJj3dpfyAl89DjvW7CARazuvMrjNvxJJDh0/vv9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/5vBMpSm+l3g7Z+FhSYeiWDlVgSzIzg8zSjXi4wFxyNTEyebh
	4xt68v5C+7ngA0LmHvYyzG0P/+kr5VEx0jSridiqP7fkCIahV26ffIUDq/dFkp07TLcaW6/XR3j
	/cTOH1BAgnxEXXlxEjFH5Mg46oyJG2/6dW20HYhk3
X-Gm-Gg: ASbGnctrq2jP72PJtVrdt0ou0ZaRWQzZULgwzcK27bn2PhJ8GjAJjnckMnKBGiYHv/8
	CW9avofvoU1zd+WQ1fxvVL4VONMLuHkX1ImNLid3venwK/IcyfUPOZZS0MQYgRTTfpdp7N/51ZY
	FkyRhgVowY53WVAZGiAvWttSCP2JIUQRLzxJtxxd85OOzwLbTSEqpF3wL4HzN32Cwhv27jZ0g19
	8PccfhVXOeWry+f48HfReMhoPf/QZsWthLzPPsQOJJR+cwghoRBktdeAsZjBYE4
X-Google-Smtp-Source: AGHT+IG+ollMBmiaOYcyGD4fK0EXbH34IwD2F+IqBBnZbD5S5EK8GUe1Cco16tj20beWZxJ5YP1hQInru/5q0vhDcUY=
X-Received: by 2002:a17:903:228c:b0:243:afef:cd88 with SMTP id
 d9443c01a7336-2486395f193mr4627105ad.11.1756234140425; Tue, 26 Aug 2025
 11:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755096883.git.robin.murphy@arm.com> <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net> <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
In-Reply-To: <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 26 Aug 2025 11:48:48 -0700
X-Gm-Features: Ac12FXxL0fQGFTk6-3SCJz15Qd8Ums9V_bcQA6gIxaEwQacWk3scYfeQZZ7cYZQ
Message-ID: <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Robin Murphy <robin.murphy@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, will@kernel.org, 
	mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org, 
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_114901_677126_A28EEF0F 
X-CRM114-Status: GOOD (  38.70  )
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

On Tue, Aug 26, 2025 at 8:32=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2025-08-26 2:03 pm, Peter Zijlstra wrote:
> > On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> >> It may have been different long ago, but today it seems wrong for thes=
e
> >> drivers to skip counting disabled sibling events in group validation,
> >> given that perf_event_enable() could make them schedulable again, and
> >> thus increase the effective size of the group later. Conversely, if a
> >> sibling event is truly dead then it stands to reason that the whole
> >> group is dead, so it's not worth going to any special effort to try to
> >> squeeze in a new event that's never going to run anyway. Thus, we can
> >> simply remove all these checks.
> >
> > So currently you can do sort of a manual event rotation inside an
> > over-sized group and have it work.
> >
> > I'm not sure if anybody actually does this, but its possible.
> >
> > Eg. on a PMU that supports only 4 counters, create a group of 5 and
> > periodically cycle which of the 5 events is off.

I'm not sure this is true, I thought this would fail in the
perf_event_open when adding the 5th event and there being insufficient
counters for the group. Not all PMUs validate a group will fit on the
counters, but I thought at least Intel's core PMU would validate and
not allow this. Fwiw, the metric code is reliant on this behavior as
by default all events are placed into a weak group:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/metricgroup.c?h=3Dperf-tools-next#n631
Weak groups are really just groups that when the perf_event_open fails
retry with the grouping removed. PMUs that don't fail the
perf_event_open are problematic as the reads just report "not counted"
and the metric doesn't work. Sometimes the PMU can't help it due to
errata. There are a bunch of workarounds for those cases carried in
the perf tool, but in general weak groups working is relied upon:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/pmu-events.h?h=3Dperf-tools-next#n16

Thanks,
Ian

> > So I'm not against changing this, but changing stuff like this always
> > makes me a little fearful -- it wouldn't be the first time that when it
> > finally trickles down to some 'enterprise' user in 5 years someone come=
s
> > and finally says, oh hey, you broke my shit :-(
>
> Eww, I see what you mean... and I guess that's probably lower-overhead
> than actually deleting and recreating the sibling event(s) each time,
> and potentially less bother then wrangling multiple groups for different
> combinations of subsets when one simply must still approximate a complex
> metric that requires more counters than the hardware offers.
>
> I'm also not keen to break anything that wasn't already somewhat broken,
> especially since this patch is only intended as cleanup, so either we
> could just drop it altogether, or perhaps I can wrap the existing
> behaviour in a helper that can at least document this assumption and
> discourage new drivers from copying it. Am I right that only
> PERF_EVENT_STATE_{OFF,ERROR} would matter for this, though, and my
> reasoning for state <=3D PERF_EVENT_STATE_EXIT should still stand? As for
> the fiddly discrepancy with enable_on_exec between arm_pmu and others
> I'm not really sure what to think...
>
> Thanks,
> Robin.

