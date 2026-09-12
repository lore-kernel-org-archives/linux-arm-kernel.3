Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9303CC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 19:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mW9uIl4IQ84J3enCrJFqvgB+YMh25zxbJWRDQHZcYo=; b=zvsWV+i9u9uXLNtUFccaV9EoPu
	IOgEuuor8v76RcEn4vDGbuqwDoaw7XVBCr4f0OCyENTGaptSxgp9G/9iOW4x6TPcV0K2oou7Np9bS
	OehuNxPCnIidAtknCSTCYN1htTD2ZQwo491LMfwWRIS6o1S1Ga3aYCGF7T4tKcTjll9X2jCitNUFc
	P8ZXsNZssOXfyjixnA2+Jx0hn79Xq9Uk7QTGjveaDWAMJMqaMEckbX8jAzxwJVfJyII1wlFS0op/p
	lNJdK/NIZ8FxBReGEXnoHNzFzgGzSp9ULo1iL2D33dedCoIeabdLodVPlZaT43SKBQOMYH5YSC4TI
	q6+hY3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Tau-000000017Ik-3JDn;
	Sat, 12 Sep 2026 19:41:00 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Tat-000000017II-0BLv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 19:41:00 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7f4e729368fso2218621a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 12:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242058; x=1789846858; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/mW9uIl4IQ84J3enCrJFqvgB+YMh25zxbJWRDQHZcYo=;
        b=ptudEaLSPyQKkTkq+tn8c5lAr6aGr8SvVs0rWH7lV8RzOpbGb3cSrbSA7yYinEgnGV
         L9oRuO/S22akHH/rJ7Y4+B7L8uXRzDeSiOFQa3L4ZQ/NK3I3Urqbe5dfL6vRpZxabYLL
         Hrq8J+wLXTG1XzFBh5uiFGcQKkjy2kyOfyT8Z29WK4rhD6uIvz5EJlvKeOTdhlRsOcD5
         uLdaV/AInFT0BL4Nos/jUdN0FRmQPdB0EebgvLwYMgUHxYQvYmyB+DyWIzb8xosznmwE
         Uub43zry068P3G5FSBe2JvDgh5Pcmjz/GuvMwvit694r1b9baugE3xRcpUyIcLUv9REP
         W4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242058; x=1789846858;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mW9uIl4IQ84J3enCrJFqvgB+YMh25zxbJWRDQHZcYo=;
        b=Vzse96uHt7vZ27JUCGDOW2hI1XXbxya7dssApZOIiKI8lgxp2WEJg//rN4aosMps7h
         GSQACSq1KGgumLA1YJW8lQlK4ZQTemwtpvleTlXAfPmkhfko3sWzJS7obaDKeEbRWxyE
         TEdtYO8J2AjYtRM1liKck9teXv5+NNar12L0OZLs9M04F0GXmGf6x003vSK7U5CG2hi5
         Dc4rBwbxyfj8Wl8FR1v4dqoyRb861vsjLi+YGmnDfyWzH+CjyjPdsbUFir69VyaZQt4u
         ILQb3UEVMSy97bFfpolEh72WKhhkpJrVDzniuJjYPyB8geAa29+nT2KVuj7YVXpPHEbW
         Zv3A==
X-Forwarded-Encrypted: i=1; AKwUvBzOS8VPda6usA278b1fPsgOaLnHGZ6Z+hPQLPvH07jil0K95Z9nrLploIQwpZUsSuT9vabM/XqJsJrtGAyoSiaz@lists.infradead.org
X-Gm-Message-State: AFuF++ksNxtXkjKqiGnCf7PW8Yp0kLpsbnwarajNliXpmn8aOp8MPdgB
	NzQACvw0kkyo9gIHLTslNlUuuGRnvc6RMXd0ugGLlI1lmxFLogHXexCc
X-Gm-Gg: AYBFou1MZVc1uqo73PPn3yx1KF9BGPqdXly/VfsTv0qBwq3gWrGoFHvXdbw7Y4VOJ5+
	arpoJiSK31Bn3GhLuCCTRBF8Fklgsy11DK5n1rp9gCqXsR+WVQmw52d2rBqSJO/uN4d7WfR/aro
	80g/ubKEveaE37P1OGUMWVlOxzPHow6hz8j1Xbmxk5kJ3CSCiQDfjeuP2J6bX7WZ/0uupQ2IbCD
	Ndr0Utgbdud2NMLXgBpHpIVW/Ciz8kRxqMdxr+xsBDOx8KzLtoGuNvKMg6Zl+NfKu865PKjC3dx
	O1YgmYYoZoXKAnjdRsve0EMZmGp3pVrbu3F4v/0BhfFdpOT/ejNTDJxOmtC+7ksVFdQBnd+Ym4k
	M+oSXTD9JT7g8HtIFYQFnUtwtT6FmVARQgVu0YWtmDG1rSi/nqISt07RqLWFCqczV3/PrZxSEtL
	y/wzE8avFAL8Eea1v12q4r8vIHRXISBmQOn/LAy1aS06b7L4hT8jNUZ16c7TCGDJDThjrjTz/rO
	Ahh2VzfPNx13AJ2LVcPv3Qxm07B/vbOFQAMsy8CoTg/3zT1mgF6Z0Pp3Fh1NFNH+yeJQ0e0bn0=
X-Received: by 2002:a05:6820:f034:b0:6c0:c954:e534 with SMTP id 006d021491bc7-6c0c9550c4dmr5760632eaf.38.1789242057820;
        Sat, 12 Sep 2026 12:40:57 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:5::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c0996dc5a6sm6404372eaf.6.2026.09.12.12.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 12:40:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 12:40:55 -0700
Message-Id: <DLDLDGTSBHA0.32TYNBSKKPFXH@gmail.com>
Cc: "Josef Bacik" <josef@toxicpanda.com>, "Frederic Weisbecker"
 <frederic@kernel.org>, "Neeraj Upadhyay" <neeraj.upadhyay@kernel.org>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Boqun Feng" <boqun@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>, "Peter Zijlstra"
 <peterz@infradead.org>, "Steven Rostedt" <rostedt@goodmis.org>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, <x86@kernel.org>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>, "Andy
 Lutomirski" <luto@kernel.org>, "Josh Triplett" <josh@joshtriplett.org>,
 "Uladzislau Rezki" <urezki@gmail.com>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Lai Jiangshan" <jiangshanlai@gmail.com>,
 "Zqiang" <qiang.zhang@linux.dev>, "Juergen Gross" <jgross@suse.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, <linux-kernel@vger.kernel.org>,
 <rcu@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <paulmck@kernel.org>
X-Mailer: aerc
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com> <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com> <DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com> <14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop> <DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com> <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
In-Reply-To: <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_124059_088165_3A4C852E 
X-CRM114-Status: GOOD (  15.93  )
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

On Sat Sep 12, 2026 at 11:03 AM PDT, Paul E. McKenney wrote:
>
> In the old kernels, yes, we have current->trc_reader_nesting++.
> In the newer kernels, Tasks Trace RCU is instead implemented in terms
> of SRCU-fast, which instead increments per-CPU counters.  Which among
> other thins is a bit faster and does not need to hook into the scheduler.

old kernels? I'm confused.
rcu_read_lock_trace() in bpf-next is doing t->trc_reader_nesting++
and then calls __srcu_read_lock_fast().

Are you talking about some RCU branch that you target for next merge window=
?

>
> So we have several ways forward:
>
> 1.	Revert the implementation of RCU Tasks Trace in terms of
> 	SRCU-fast, and use the existing current->trc_reader_nesting++,
> 	as you suggest.
>
> 2.	Deprecate RCU Tasks Trace entirely in favor of RCU Tasks
> 	augmented by rcu_tasks_trampoline_enter() and friends, as
> 	I was suggesting.
>
> 3.	Implement rcu_tasks_trampoline_enter() in terms of SRCU-fast,
> 	keeping the speedup, and put a synchronize_srcu() in the
> 	RCU Tasks grace-period mechanism.  This again deprecates
> 	RCU Tasks Trace entirely in favor of the augmented RCU Tasks.
>
> 4.	It is always good to explicitly state the apparent status quo,
> 	which involves redundant trampoline entry/exit overhead.
>
> 5.	As always, your additional ideas here!
>
> 							Thanx, Paul


