Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C554CCF2F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXrxi/sUt3m+ih60Bf8tH6DyGI8ZFaGSjWDzM7R/mGQ=; b=okuGcmZ9AH0zTTI7bZdLEqm/Lk
	EDnA+gXFiK4COLAOnOX2TTfa5e0kgiGfd7jDjr8GN8ou6NSCuiEVDz6DgdTYfdpkxSkYooAsRYtXq
	cnOk8l3hm9gRVKGcs3L+mGWYB5ryl17mTJq0hdX3NFInApZzoI/+QBE8hDVrnxr7yKZt1g/IdIhWu
	T1MdXcxv31dITQ4uWdB/JZCUg3YffGaTW9XviLug0O93GsH9B/d3p0MwxzzBShnPdYqB0ym+681LT
	A8f5R7xdVUKsUEKmmEbCWAANB7H2AlRag+Zs00yArCP3X4G/jLw6D/o6gF9zDXM+94IiR50WzKUhL
	NdDvqIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhogQ-000000024FO-2ZHI;
	Mon, 19 Jan 2026 12:48:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofy-000000023pN-0unq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 12:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dXrxi/sUt3m+ih60Bf8tH6DyGI8ZFaGSjWDzM7R/mGQ=; b=UVTJdXo/bhv2j0EPiKWle8HEiS
	DV0CYqInzhJu+6GVxOCsmtctWpoNlEOHHWjioHF7ZoOldGiAZunQOPXWwXo0qQfnQyvMOmExQ0qRO
	TUkYyZOIXIH5F4dEmBOLFmNlaLErPz7a3DcSWyXVPsQ7dxR8ggSRkxhsIqMhGQNtzYmR8vMOr7rW7
	Pcp+exp1qjwrB4MXkLDDOvKhZ6ftmislOKObyQY6bhfsol+IjAIEi5eeufDdF2GbMmpR9cFS/mh7W
	bu+hHPLlY4mr4x+m24GkJpbBWvCtlzzDRxw/avEv5pZMOXsyifoq/DSkJbupxuwiA1LcZo8lEuT7c
	/JaziI6w==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhofv-0000000C6WO-0yY3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:48:08 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b870cbd1e52so623360266b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:48:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768826885; cv=none;
        d=google.com; s=arc-20240605;
        b=eqX7lbz+DDlXaLTlQyzhfkU1QjxmhCnd/Ir0w/ZC7Bg9oVUF7egd37OIkLfNneQ6OU
         H2L8TpGY1TBPfhONeqRsTcS5NrTdr+Kw3NswGYIhTxNhAI3I86lu7ivp9rAOkzWMwCog
         hdnwqsISMV2Eqg/kkHxMtOkF8TfsguHeTOLF4wlJt6Oo9BRmRWSfnI+uuFutXSCe5oO2
         g5++iG67SmGSJSjnECOOjMmRwzngeBA8FSusgpEne9vMljjeu9nfYpA0DRmWrtzjQ1xc
         7OKkF9yJpigH0vcEc5JJ2EyoeZfNAcVS76oCC6OlsAvEA7EO227Rx5Lz4GsCg0T3uWfZ
         BHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dXrxi/sUt3m+ih60Bf8tH6DyGI8ZFaGSjWDzM7R/mGQ=;
        fh=u3/kp8aY9ip+47BQAfkmQ+f6YRvRm9PDrpuZIuwzpfE=;
        b=RcG/DixmTSGHYii7C3qfh1np0Uzgxbn540v+0LdNKLvv5bGPYgzzh49SDcFgaX26xb
         E2+N6WfOcf5bnNbC/BE+51FfI2lrdj77qOPLj6k7gaDAHR6jrS8mt8YVQigRnhFQuyHo
         6U7hnoVu7AuRaMAtDH6omEDojp2mkzzKPh2pqoJDhmMr7cnd2OCMUqp4NA2cEMS6PTYI
         /J6lNLfRrT4IQWdw8+U3h1BBorsYLuRVONmpJDQE9xadlRB/l7fCXvWO/lSjbQQB4IfO
         g3RR9F4P8aIzLB2ZcOfb/Zfr9i4oo5HMVjeZSAaEFkj12ZTQRSGvAdHw1sCk7ctwvTqK
         Kk7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768826885; x=1769431685; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXrxi/sUt3m+ih60Bf8tH6DyGI8ZFaGSjWDzM7R/mGQ=;
        b=Tkt/ATRCZpFOptvWSUMZ1bd1srNIXTO4PPHFG1W7Q3XJRErWGeLCx/4GSv/zEauv7I
         ryVSwUWI6mJc48yb9sJ+rRug0GYDh0vAVQzMWr9EGI9ElOoBQQGRjVrmwbUgbAmbNzq2
         6bz38BnhODXB9+eRLrNYxlkc+qiRWM00Y11JulXJSImei4TDVDwoMMWi6C1ecljmDKoE
         4TlWPA4QrtTXu9zVORb1f4LqqBFTVlr2kvYFTxPR+cfRasjVpFz9MzFZYdPYzrOoRZ1G
         NA5ad1TExnZmmbL/Ltq9pIq1rNd7rc8k0VPr6iGVZUb7/KhpJhaRvJxJL2y5PVHS0NEL
         fG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826885; x=1769431685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXrxi/sUt3m+ih60Bf8tH6DyGI8ZFaGSjWDzM7R/mGQ=;
        b=OFkkjLzWhiqMec5TO3lgJXmT0AlBHFsXu2k9aIyrxzoDI/fRSYaBisftzKkUjE3eEI
         CvE/hqqcjAbtvKV+V39axWHP0g0c00UdafuJZkkmVmbILgA+3wMymoqiw5gLA3QZPrIh
         5fBZltVZ5okBwt5ceo6/zWqj0KQNWcJLn7yxUYqx+K5VNPb7DoGXUkq2+yrK+4VyxJ2E
         ciHbT8cuzXcXnHmuztFKDgcbCs7OTvL3uKwxI0GrfF1D0Z3Hm8LgFPDaV9TGjDpoq27E
         8npW6vUvsntBKrLeyO6gx3TLy4JNaOSNVQ04H9zYrtpt3Gu+Mj66wv39/mhEij/oPfBH
         p1NA==
X-Forwarded-Encrypted: i=1; AJvYcCXHzdhP5uOm8rRLtlWWa3etZ8QVz08ge2r1ACV4SEAdJPsE4BK8un891OHUAnuoHyrJQa7TXBlX8neBlXSm82zV@lists.infradead.org
X-Gm-Message-State: AOJu0YzK77nxmZsbVjBcjufabFw355wmqlHODTDv8r2+K+z8DfyejmJO
	RKwWsLZLj9APVJ9wSilieQWFQn6dLIXGt2iis8hByPiIVDnU72km3VrLaob3YA/RIz5QUZCxh3l
	buEY7dEBlGuepaTT+Ss3b+9nm/Cq+v+3x6YevX33O
X-Gm-Gg: AY/fxX441EQ9+8w7N5wi/rU+Fl9/0Tk26iagXqlhrVy0N+6p6NTuObyNL7Gxw9HqOZ/
	Uobs2hnAaDZCWlRCG5Pq2a1JTYAkxpA+L1a7TVIdfzvmd2tTW/cC5hr9x0P3X8C64U3cKcoXakG
	4TSYDkcfLy1NhrOf/qRDNxbp9uJ5ocOjUTiJVTzceoZjq+z7pUjenuqTCgQE/ky054PACj4/mar
	M7G7+Cp71hML137PT1GMDpr14QiobAXtbX6W8HZOPVAbzZiIdE6x986PLhNTMVkqgGSU+XwQU5S
	9ED1DxGotVAM4iK5uSfPzzXVToRXraaGFhzBCPdyI2Y4b1w=
X-Received: by 2002:a17:907:3f8a:b0:b87:7485:b4a8 with SMTP id
 a640c23a62f3a-b8792b3c4e1mr857024566b.0.1768826884302; Mon, 19 Jan 2026
 04:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20260112165914.4086692-1-ben.horgan@arm.com> <20260112165914.4086692-30-ben.horgan@arm.com>
 <CALPaoCh+mRLJEfhKBve3hRf+vHHoObjvWRt74OfpopgtR9g9FQ@mail.gmail.com> <c157d2b6-7282-438f-b9e7-1a24be3fbf53@arm.com>
In-Reply-To: <c157d2b6-7282-438f-b9e7-1a24be3fbf53@arm.com>
From: Peter Newman <peternewman@google.com>
Date: Mon, 19 Jan 2026 13:47:52 +0100
X-Gm-Features: AZwV_QiZJBdvmI194c6LN0fqut2vJhOeVYj5jDyWBOT_GKG0XUzMZqV82Gtifu8
Message-ID: <CALPaoCi0fR5sUVsjXi25XHBrhn3whFvKDpEvUGSM5Hjd2LZP6w@mail.gmail.com>
Subject: Re: [PATCH v3 29/47] arm_mpam: resctrl: Pick classes for use as mbm counters
To: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>, amitsinght@marvell.com, baisheng.gao@unisoc.com, 
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
X-CRM114-CacheID: sfid-20260119_124807_348948_BE1D8898 
X-CRM114-Status: GOOD (  31.14  )
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

Hi James,

On Mon, Jan 19, 2026 at 1:04=E2=80=AFPM James Morse <james.morse@arm.com> w=
rote:
>
> Hi Peter,
>
> On 15/01/2026 15:49, Peter Newman wrote:
> > On Mon, Jan 12, 2026 at 6:02=E2=80=AFPM Ben Horgan <ben.horgan@arm.com>=
 wrote:
> >> From: James Morse <james.morse@arm.com>
> >>
> >> resctrl has two types of counters, NUMA-local and global. MPAM has onl=
y
> >> bandwidth counters, but the position of the MSC may mean it counts
> >> NUMA-local, or global traffic.
> >>
> >> But the topology information is not available.
> >>
> >> Apply a heuristic: the L2 or L3 supports bandwidth monitors, these are
> >> probably NUMA-local. If the memory controller supports bandwidth monit=
ors,
> >> they are probably global.
>
> > Are remote memory accesses not cached? How do we know an MBWU monitor
> > residing on a cache won't count remote traffic?
>
> It will, yes you get double counting. Is forbidding both mbm_total and mb=
m_local preferable?
>
> I think this comes from 'total' in mbm_total not really having the obviou=
s meaning of the
> word:
> If I have CPUs in NUMA-A and no memory controllers, then NUMA-B has no CP=
Us, and all the
> memory-controllers.
> With MPAM: we've only got one bandwidth counter, it doesn't know where th=
e traffic goes
> after the MSC. mbm-local on the L3 would reflect all the bandwidth, and m=
bm-total on the
> memory-controllers would have the  same number.
> I think on x86 mbm_local on the CPUs would read zero as zero traffic went=
 to the 'local'
> memory controller, and mbm_total would reflect all the memory bandwidth. =
(so 'total'
> really means 'other')

Our software is going off the definition from the Intel SDM:

"This event monitors the L3 external bandwidth satisfied by the local
memory. In most platforms that support this event, L3 requests are
likely serviced by a memory system with non-uniform memory
architecture. This allows bandwidth to off-package memory resources to
be tracked by subtracting local from total bandwidth (for instance,
bandwidth over QPI to a memory controller on another physical
processor could be tracked by subtraction).

On NUMA-capable hardware that can support this event where all memory
is local, mbm_local =3D=3D mbm_total, but in practice you can't read them
at the same time from userspace, so if you read mbm_total first,
you'll probably get a small negative result for remote bandwidth.

>
> I think what MPAM is doing here is still useful as a system normally has =
both CPUs and
> memory controllers in the NUMA nodes, and you can use this to spot a cont=
rol/monitor group
> on a NUMA-node that is hammering all the memory (outlier mbm_local), or t=
he same where a
> NUMA-node's memory controller is getting hammered by all the NUMA nodes (=
outlier
> mbm_total)
>
> I've not heard of a platform with both memory bandwidth monitors at L3 an=
d the memory
> controller, so this may be a theoretical issue.
>
> Shall we only expose one of mbm-local/total to prevent this being seen by=
 user-space?

I believe in the current software design, MPAM is only able to support
mbm_total, as an individual MSC (or class of MSCs with the same
configuration) can't separate traffic by destination, so it must be
the combined value. On a hardware design where MSCs were placed such
that one only counts local traffic and another only counts remote, the
resctrl MPAM driver would have to understand the hardware
configuration well enough to be able to produce counts following
Intel's definition of mbm_local and mbm_total.

Thanks,
-Peter

