Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF615C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 21:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RN6NlWXNxbscB16yrp/7Xyb7tbAGCIZghMiPDdHQJK4=; b=R69vDChT1IyRSuKF09nLgbM88s
	/dxu5AezHPFcdTytzB9hW2gDnvhFmlCvEWsmDw6H24Icl2hyx/g7ED7Rf7wMJlDYMcZOIM45oMIpx
	rkfrvRx0TpROM6pRVxND/tduBdXod4PVH991ZuujSCpSYnIGIpo+2DGg1Mn1HjWNUOdF+icoY8lUd
	J5UXMfFK6IKbGEpgEoqBWJgLBgNRJb7rLKevLo4Vkdcld7zs7AYU+TcwYlhvfjd+DUfWVIgAdabpX
	Gqsbm0SfcxDzXouFMIWw4FRhkRlrkq7ONUhMUp97kD+4I5vlG6ZXW9kVL6artsf9jbQXdi5AVkpPb
	TfD95ptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5V31-00000001D0Z-1Y4j;
	Sat, 12 Sep 2026 21:14:07 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5V2y-00000001D0B-3hgf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 21:14:06 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49e6deb520eso9760155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 14:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789247642; x=1789852442; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RN6NlWXNxbscB16yrp/7Xyb7tbAGCIZghMiPDdHQJK4=;
        b=QEVTqp2NK5oyzNi09ZAHbt4iJiCgPLm0BQ2l2inz2KyU4+xG0rbOPbj16j48U/AAN3
         FlyELwyib8jOYzTSbZUFzEYifGAgwxwILzb+8UJXKG1fipK9YcVAerVH8AjynKxDtn8+
         0p50Ee26o7b1DHZJMS1saTcBX7MQW1m10RTLg99tGyBcGA2qMqjoJEgfA3exLWl+4/dv
         qrGeS/POLrMWSsbgRP9o+MyWm/lyVm/XBFVm25UF4yt2i/yL1c8J71GCljAjislt1hEE
         e7+V+zMBDoyGJY7tulhj+MJmwK2fAP3bJ3B2uO7eM8M4tBOlw1l5YR5oMAdBnqza9Zpy
         pzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789247642; x=1789852442;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RN6NlWXNxbscB16yrp/7Xyb7tbAGCIZghMiPDdHQJK4=;
        b=auEKvbpBWT5ueVNGhAB4GN+Sy1FpK/ylxGMafa4Cg8eSUL/sqsZkF4DCxbgku/1M9x
         TKpUntRoFl4KT/8r3WIQlux15axNaInF15Cfrt2ZqurlkZ5YbJHhsnl2NmRubP7oH3cB
         vth98N+DcwqeqZQrzRx0ATdXY+UqrMZQuteSogH3IZMQoiGWKVOhGZWvVUIq9Mmo5obu
         7utMeMUT7N+r8qblWNu7gyTw0dQiyDiA++9GjTNLQHT+tmOt92M7WcXdMBPZ1aMkd91U
         fFBFMOd+DgBDogICcgBGR1FBuI3i3x9pKNo3KZqnD2iuTmUeR/MFAvpK9gv6c88UnG9m
         3B1g==
X-Forwarded-Encrypted: i=1; AKwUvBzaIdecBi4y6JkVMV3vc+a9bJqdqR2M1p5IU0xW9uZqNH4WzBKVWpG7zYIO4HTWOQoIITZmPamrLdMra3mbBlhS@lists.infradead.org
X-Gm-Message-State: AFuF++l5wKoT0rvhropSaJTG51uvxzMXFlCvRxfYEMXdp5w26HD7cgTe
	/ft79+KmeF6pmNloor1Ncaj0xK8nbRinixU3wuyz6ewqZyu5l9V/quWI
X-Gm-Gg: AYBFou2dkkKxsmkUreEldiLhvH+k28tMzQX8YO2zFGAtW3+o05dHCWpjUB734R6K3TL
	I1X4QjuMfVgJbcmjEU72UOODlMwblLKd1PgrcYgMWGj3B7JwulzGIKDFzX76IhfMjlwvNmOEkB8
	hobEgJQeRxXnJJApivEWB8H8R5TpurNx66DdL9qngPRpC6nZsPzT1cvbizMukRYM2j56i1oYgfV
	AVbWlfvcBmfG8Xmo2UKo7o6l7yth3pr/fpSnLGVA1ToLEFE4JBxtTJ0iGwVr0mgjLuMEC6Il2+t
	EDxNeE7zyHK9DGLi4cQBZBJtW25xI8CaPyY5o9riiYLBJHvKGC9BtG3abVHw2RUJx0pKNPfwxUn
	2OOra0i9WQz8MsmgmUPA9kExz0xa1ILEplpamaox1cEooMkvEwOn1N6h/E3ARRNAGwYHcgDx6yg
	lRCc189ekYhnBateDtwyAW01zWuO6h6Yvc35ekmIPbF6BosJmg/Xzo9kedlN4Hnt4SaJ5qjrAzw
	F7a5OvhUUNY27YNaO2LMkR5JBaOC0/59c26
X-Received: by 2002:a05:600c:3513:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49e619d479emr105307385e9.29.1789247641902;
        Sat, 12 Sep 2026 14:14:01 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c39086sm240080175e9.10.2026.09.12.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 14:14:01 -0700 (PDT)
Date: Sat, 12 Sep 2026 22:14:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Josef Bacik
 <josef@toxicpanda.com>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, x86@kernel.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Puranjay Mohan
 <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, Andy
 Lutomirski <luto@kernel.org>, Josh Triplett <josh@joshtriplett.org>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang@linux.dev>, Juergen Gross <jgross@suse.com>, Luis
 Chamberlain <mcgrof@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
Message-ID: <20260912221400.4045198b@pumpkin>
In-Reply-To: <8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
	<20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
	<DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
	<14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
	<DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
	<8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_141404_970424_7480BC74 
X-CRM114-Status: GOOD (  11.89  )
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

On Sat, 12 Sep 2026 11:03:34 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> In the old kernels, yes, we have current->trc_reader_nesting++.
> In the newer kernels, Tasks Trace RCU is instead implemented in terms
> of SRCU-fast, which instead increments per-CPU counters.  Which among
> other thins is a bit faster and does not need to hook into the scheduler.

Isn't that rather architecture dependant?
It is fine on x86, but on arm incrementing a per-cpu variable is
significantly expensive.

David

