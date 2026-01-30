Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DCEE6BF0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 13:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBf8C/0xR74j04aOxcYP8T2S3+hA9h8u2VJdmYV9Spg=; b=SKHF2mpuOtBhAJGOf/mDmDcofh
	4OcpZZvBX7g/7ZUJpCDK6TnYjzuvQkShpqnbHbvYUVSiAmqyAdN4Dnu1O+Xs/zGvnhhPrf9YBCwVL
	tBctyEyRhmzIc5EOfvexWIpU7sE5rqvXEVfVZr2IEhabXOY3MeIzwf3v5/P62E2AJZikdeeDztR89
	a7zIbCwX/PoZmARio21xFvdf60J59FARf+4EBAykTrYP0PVOf9EWyeC6BlaQVLwhWj3RCb3AgNUGK
	WN5uwgyDwZB6PGI5OYqjf9DQA+RP2HDcX9596PjBvLswLAA3FR4cHvfSXiKD18rEa8mUKbtsY0hc+
	IZ/rzMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloB5-00000001Vap-401A;
	Fri, 30 Jan 2026 13:04:47 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloB3-00000001Va4-0VhA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 13:04:46 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso257740466b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 05:04:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769778282; cv=none;
        d=google.com; s=arc-20240605;
        b=MZjjgMcR82TI+HLyY5YuzFowqegOpqX911P++PJUg64L5mLuRizBmau2GkhY8+Jlho
         6bvcBTHCsAKxwomHpc4egNzCI6pFIshgkDEOgppbk/j1OC2Q6gi+jTpix18Ry98PC4du
         vWgxxYeQd7hLZMHVVx7mT1OaoESxbO0VMH9eA09cT1O9bEVsxiqaPLgXl1B7vBQuvwmh
         X1yAqA0QkKCabhHWVZMjha3Lsijrd0JfUTvI2aFciSPBkGLEtlwItBFxiEL8fnI1angN
         D+L791EVNBxJj5aqXeogoR3gI1oB2z+q768T2/DdeasD2O8gJBk02hzu09AwnVTGjUl7
         uvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UBf8C/0xR74j04aOxcYP8T2S3+hA9h8u2VJdmYV9Spg=;
        fh=2IcFWYJDeukbMLh0IYwnPWF8QhKTqO6lPud4pRfFv0s=;
        b=EULUHhqhtnDFbuXLQl3LjXcceYhD+sLn+wmMvTq6N/Brz0hADNw+2/9z14bv7xVVUF
         AsGOkrhh6xlL1JN/ewRlnGXc5F1jQd6HIAEN4NvN/t9L00uinP+LqZMk6BQngRZHxkdV
         Y9FS1a3n/bWbHLPSO9pGQtz59NN7yTi/34Fnku7ElcWy8ZRNt6TY+IkcYpvE3YNLK2Rt
         Xs6JSt39WmyOHksw8sRAOOHu7y9ptqvARLrGuicuniMa1oTZqrm/1AT3hGCCl3kIBAce
         j09hl0XqitpaHsJT3g7GtuX8JJ6u0JAIVpL4F/RNc65b3vy55z9F1I6bN4apoDg+e/oh
         sp/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769778282; x=1770383082; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UBf8C/0xR74j04aOxcYP8T2S3+hA9h8u2VJdmYV9Spg=;
        b=EOnsxR2tWrB6/c1IUDIuBEKH3AFY8804EN9XvvR49MIg7b7SSZdLk3luNIwHvzTyYM
         7+vunr/VJx4JUziTkiVbongeJ4jSQjvd3k+wjeDGl3k8BptOIz9sSk3KcZldN/6GVdE2
         KmdjDUXibyiz9R1JtxBBx9qFqZaCDgGaG2+qVVa7k0y9Go4EQ/5Z9gX3qh8SBt5+eRt6
         Lx4tHpOaCUawlsWKkCJ3l19PzVx42rmalEsYfl7wwfIHcCwKh8Euqe30t1vgmyBywgHm
         nRTLE4jbHEWX8l1Hnao7vnh0M//KAAREfM1IqkXE8gkcW0oYDxqDgfEmAUGS1DZOQDQP
         Gwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769778282; x=1770383082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UBf8C/0xR74j04aOxcYP8T2S3+hA9h8u2VJdmYV9Spg=;
        b=fIHsNPbHEUZHSW66/hYZywR+EhTx9LMJk0POAy/sOSlwH2INHtmVlGhFANSIeMbbCV
         +Bqn93X7d8yQZNON5p2Dwk7sNmhxOn1T3XwO+qm+zyOJzCQqk4/kxthArUNNCeyoxVSS
         CngJA9clFncTZ8A0pSP5CFYqje/JW2SPg6IyaHiZCdELV9GK2L73is2dB+/lLzXTuXW+
         nbEVxYiIK0Fbuk1WE0SECaCnDOeKH14/5wvACnDV/pidPj5hxI4QPDDhv2GzQePZKl0k
         tlHJ4jaXRalqZXYhOhisgaboBVMX5iFG0jYOscb5M6+asPgkskH+48UYty+MbECu5lJB
         1y7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXN8Pf1tZ6fxjwWwXoWZXlEvvP/M2Nud4Niz94e5qGh0ajAhFLwXKzPh/12SEz91UKuixymYEzLjKtiKUyYX+iy@lists.infradead.org
X-Gm-Message-State: AOJu0YyNzhlgnXrWSlv+NTQGkP2FbnlzRdp+gY9baj0U+bN9HlWNgiAb
	cnaIRRwhgZG0uh0xBxRhpTVgj4ALp6X826zH/fh+8WgZSvmmoUu6t/O9rd5vGa380Rig1oCH3jh
	7nmLOkINIqumitsEzfL6HllmV8ift6KR6bMwEw/UK
X-Gm-Gg: AZuq6aLAHAVOogThlLwVZk7sjdUAprfllNQucyz0jJA9iMnBXP4FAx8P6Qy+9IcTA+2
	IgKBq3em/ZmKI4DPBwC8GSnGAq9jP6hTb0LEPBK/Ib6psw9d4DLWwaSr3KXeqhBS7dHaBc3HfHe
	z+QlcgymnZm94gO8uKB5IDcr1Z7U8sdvRvZ044HTbxulhETXsujtXPTGi7B3ZA8jdY0x1sHy2df
	ySBhqkUx+tz7cLCiuMYjD8U09VzmDMFhd8Mwe6Rc3mrpgaxrEhghbh8uChbfjKmMzUGNn4qHkjU
	8wzG9zkPE2IhYWD84t3trojXLUkygurmog==
X-Received: by 2002:a17:907:704:b0:b88:3bb9:e2d1 with SMTP id
 a640c23a62f3a-b8dff8b1453mr142780166b.60.1769778281634; Fri, 30 Jan 2026
 05:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20260112165914.4086692-1-ben.horgan@arm.com> <20260112165914.4086692-30-ben.horgan@arm.com>
 <CALPaoCh+mRLJEfhKBve3hRf+vHHoObjvWRt74OfpopgtR9g9FQ@mail.gmail.com>
 <c157d2b6-7282-438f-b9e7-1a24be3fbf53@arm.com> <CALPaoCi0fR5sUVsjXi25XHBrhn3whFvKDpEvUGSM5Hjd2LZP6w@mail.gmail.com>
 <2ce2b78e-9a79-489d-813c-3ed6ced34f12@arm.com>
In-Reply-To: <2ce2b78e-9a79-489d-813c-3ed6ced34f12@arm.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 30 Jan 2026 14:04:29 +0100
X-Gm-Features: AZwV_Qgsp2QKetSJZCBE6HG-t_3ZxRz8uwHEr5HdiTUFCwojXmkqXvN5_gENpCw
Message-ID: <CALPaoCgfi8qgJi_yijJ5u933faMvCZCjdBOGCKxOd4uqwEJhyw@mail.gmail.com>
Subject: Re: [PATCH v3 29/47] arm_mpam: resctrl: Pick classes for use as mbm counters
To: Ben Horgan <ben.horgan@arm.com>
Cc: James Morse <james.morse@arm.com>, amitsinght@marvell.com, baisheng.gao@unisoc.com, 
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com, 
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com, 
	fenghuay@nvidia.com, gshan@redhat.com, jonathan.cameron@huawei.com, 
	kobak@nvidia.com, lcherian@marvell.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, punit.agrawal@oss.qualcomm.com, 
	quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com, 
	scott@os.amperecomputing.com, sdonthineni@nvidia.com, 
	tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com, 
	will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_050445_231285_AE9BE80D 
X-CRM114-Status: GOOD (  48.46  )
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

Hi Ben,

On Mon, Jan 26, 2026 at 5:00=E2=80=AFPM Ben Horgan <ben.horgan@arm.com> wro=
te:
>
> Hi Peter, James,
>
> On 1/19/26 12:47, Peter Newman wrote:
> > Hi James,
> >
> > On Mon, Jan 19, 2026 at 1:04=E2=80=AFPM James Morse <james.morse@arm.co=
m> wrote:
> >>
> >> Hi Peter,
> >>
> >> On 15/01/2026 15:49, Peter Newman wrote:
> >>> On Mon, Jan 12, 2026 at 6:02=E2=80=AFPM Ben Horgan <ben.horgan@arm.co=
m> wrote:
> >>>> From: James Morse <james.morse@arm.com>
> >>>>
> >>>> resctrl has two types of counters, NUMA-local and global. MPAM has o=
nly
> >>>> bandwidth counters, but the position of the MSC may mean it counts
> >>>> NUMA-local, or global traffic.
> >>>>
> >>>> But the topology information is not available.
> >>>>
> >>>> Apply a heuristic: the L2 or L3 supports bandwidth monitors, these a=
re
> >>>> probably NUMA-local. If the memory controller supports bandwidth mon=
itors,
> >>>> they are probably global.
> >>
> >>> Are remote memory accesses not cached? How do we know an MBWU monitor
> >>> residing on a cache won't count remote traffic?
> >>
> >> It will, yes you get double counting. Is forbidding both mbm_total and=
 mbm_local preferable?
> >>
> >> I think this comes from 'total' in mbm_total not really having the obv=
ious meaning of the
> >> word:
> >> If I have CPUs in NUMA-A and no memory controllers, then NUMA-B has no=
 CPUs, and all the
> >> memory-controllers.
> >> With MPAM: we've only got one bandwidth counter, it doesn't know where=
 the traffic goes
> >> after the MSC. mbm-local on the L3 would reflect all the bandwidth, an=
d mbm-total on the
> >> memory-controllers would have the  same number.
> >> I think on x86 mbm_local on the CPUs would read zero as zero traffic w=
ent to the 'local'
> >> memory controller, and mbm_total would reflect all the memory bandwidt=
h. (so 'total'
> >> really means 'other')
> >
> > Our software is going off the definition from the Intel SDM:
> >
> > "This event monitors the L3 external bandwidth satisfied by the local
> > memory. In most platforms that support this event, L3 requests are
> > likely serviced by a memory system with non-uniform memory
> > architecture. This allows bandwidth to off-package memory resources to
> > be tracked by subtracting local from total bandwidth (for instance,
> > bandwidth over QPI to a memory controller on another physical
> > processor could be tracked by subtraction).
>
> Indeed we should base our discussion on the event definition in the
> Intel SDM. For our reference, the description for the external bandwidth
> monitoring event (mbm_total) is:
>
> "This event monitors the L3 total external bandwidth to the next level
> of the cache hierarchy, including all demand and prefetch misses from
> the L3 to the next hierarchy of the memory system. In most platforms,
> this represents memory bandwidth."
>
> >
> > On NUMA-capable hardware that can support this event where all memory
> > is local, mbm_local =3D=3D mbm_total, but in practice you can't read th=
em
> > at the same time from userspace, so if you read mbm_total first,
> > you'll probably get a small negative result for remote bandwidth.
> >
> >>
> >> I think what MPAM is doing here is still useful as a system normally h=
as both CPUs and
> >> memory controllers in the NUMA nodes, and you can use this to spot a c=
ontrol/monitor group
> >> on a NUMA-node that is hammering all the memory (outlier mbm_local), o=
r the same where a
> >> NUMA-node's memory controller is getting hammered by all the NUMA node=
s (outlier
> >> mbm_total)
> >>
> >> I've not heard of a platform with both memory bandwidth monitors at L3=
 and the memory
> >> controller, so this may be a theoretical issue.
> >>
> >> Shall we only expose one of mbm-local/total to prevent this being seen=
 by user-space?
> >
> > I believe in the current software design, MPAM is only able to support
> > mbm_total, as an individual MSC (or class of MSCs with the same
> > configuration) can't separate traffic by destination, so it must be
> > the combined value. On a hardware design where MSCs were placed such
> > that one only counts local traffic and another only counts remote, the
> > resctrl MPAM driver would have to understand the hardware
> > configuration well enough to be able to produce counts following
> > Intel's definition of mbm_local and mbm_total.
>
> On a system with MSC measuring memory bandwidth on the L3 caches these
> MSC will measure all bandwidth to the next level of the memory hierarchy
> which matches the definition of mbm_total. (We assume any MSC on an L3
> is at the egress even though acpi/dt doesn't distinguish ingress and
> egress.)
>
> For MSC on memory controllers then they don't distinguish which L3 cache
> the traffic came from and so unless there is a single L3 then we can't
> use these memory bandwidth monitors as they count neither mbm_local nor
> mbm_total. When there is a single L3 (and no higher level caches) then
> it would match both mbm_total and mbm_local.

The text you quoted from Intel was in the context of the L3. I assume
if such an event were implemented at a different level of the memory
system, it would continue to refer to downstream bandwidth.

>
> Hence, I agree we should just use mbm_total and update the heuristics
> such that if the MSC are at the memory only consider them if there are
> no higher caches and a single L3.

That should be ok for now. If I see a system where this makes MBWU
counters inaccessible, we'll continue the discussion then.

>
> The introduction of ABMC muddies the waters as the "event_filter" file
> defines the meaning of mbm_local and mbm_total. In order to handle this
> file properly with MPAM, fs/resctrl changes are needed. We could either
> make "event_filter" show the bits that correspond to the mbm counter and
> unchangeable or decouple the "event_filter" part of ABMC from the
> counter assignment part. As more work is needed to not break abi here
> I'll drop the ABMC patches from the next respin of this series.

I would prefer if you can just leave out the event_filter or make it
unconfigurable on MPAM. The rest of the counter assignment seems to
work well.

Longer term, the event_filter interface is supposed to give us the
ability to define and name our own counter events, but we'll have to
find a way past the decision to define the event filters in terms
copy-pasted from an AMD manual.

Thanks,
-Peter

