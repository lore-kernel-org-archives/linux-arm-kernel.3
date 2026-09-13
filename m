Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0809CC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8/tv6bYjr/JxaCBgXPuXjqSK44p/M/ZKAj7rPsQHeE=; b=iCw0lYDa3JDZxzqOcDHAtWRzHB
	4pzjElKePfCHn+sz9SAi3d1N5wU5LO7Uxx6e30vro5EYkKGS/+eu950dvJEwnXRYaXKqJJ17T6OVR
	NKi+00aDEi4uRUL1rdSfukwuj/aICCUxKKM3hnRkUvWLcRtAHjcFvptl9V0jitfxLWYnsZuwKiTgu
	m1XXMB1ifQjc0hP9vey1UIFmdWKnXIBsqGX0mqc7oh4bl0L6whpgkulCdfJtCC6zaMWuzaluzPKIz
	ecBQ8/5+B/Yb01G++9GqYez6vTBExRyDoNMPoivOkAf8bx8BRKCPv3Y5ckzPjf/PmhIKezi9Im56g
	ol8po+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5iOU-00000001cRK-24D4;
	Sun, 13 Sep 2026 11:29:10 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5iOR-00000001cQo-2khV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 11:29:08 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d37b5so7344925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 04:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789298946; x=1789903746; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U8/tv6bYjr/JxaCBgXPuXjqSK44p/M/ZKAj7rPsQHeE=;
        b=tFFgjr7RK7fjafTM66HRxYo9kbSiu+Ecjo74q8G2WJdYHxiXQu9ZCapE0erR+bQhgP
         rBudbIidz3kTSf9UMgVBLVXAdxZmiqMoQ7GkXw2TWDDBAqafAvVEIH1upGzJUbWL7MPT
         J9YkCE8tAYapkVH+25ELBMgHHNWStKFsYOQtc4ueNRnSnSHJ7uKX4hG7rx/wgSawjXru
         vQ0aqhsz3op8QldBYlTaSRKP6/wP2L3P9J5QSmWa17Y/apE8zEilOG5HTjW6yNl0CB8T
         Aqg38U8kg94kBsg9ksxhhqucaED6EuXyPJwL2emmYLH2PkjT2bsQyOaks2jbb1J4LY6/
         Dshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789298946; x=1789903746;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U8/tv6bYjr/JxaCBgXPuXjqSK44p/M/ZKAj7rPsQHeE=;
        b=E4gOuCgbMDhjq0e8k9DAGPKKvDdkMRWo4JEhyIUtgITkp2o4LAt14Lsmgk1gQaSpEu
         QSEXc0T3DfFIAjQJiCBnXmIG0dhF39dpPVq939GgYPrENWOyxRxhNGgyr3trqtbq0/90
         O6+C4vdtUap7orxlARyOEKWCLkuCCaZ8k2CpGDjb1Kq2XRNuZ+mQQWjkqUcP5VGNpCt9
         QgMV+PPGiq32/3mt7bVgYntYePN3RIdB4oqQS0DM78+wHmZcMqLdi7QQm3ohdJ3Ddrw+
         UQvI2ko0REAOvD3omFsR3yj0dexvRo6kyDeNoJIwtXgtmNs8zqyAAHBjX0jMeui484dL
         JkLg==
X-Forwarded-Encrypted: i=1; AKwUvByuSbZ56VWtBr1ePkYHws+ir6dDtO9sZUTOh/X98KmpPNMj/y3g0q2zYTscu9OJgDYaMH90IJS8Pdo0JhVpHyQZ@lists.infradead.org
X-Gm-Message-State: AFuF++mONtMOz/jMKUHna0z27cJNlxRfylBLSY7Oq0a9m8VLeCLEr8OV
	moh4XjB00WZ+fun5BEvFjw/58Yl1jO4Vo6GpEJBJAeFTDgkTtEZlpcgd
X-Gm-Gg: AYBFou1XlvnG+Cq4zxWefGLUUlwkd3nH2F95FI3WdNw0rbz0H9uweX2or/8+4NoF4Dm
	V4IfP4rI/kyq0iO6gBz6/0MoUAcTrpEPRsCa5k/v2vhPLXaGkc4HjIENlyDtuWLZ9a354NKXlPu
	/ebdJ5S4PQgSs9PI3MbM3TX9tJ8equdocbRVFCCnCvv5e/9WqMmA0JbyVHL0EvP6P8jh3lIfMwN
	4nVzhQY83Kkmyt8AzZAAlthW7ZnEU80wgHHK2GmEY93hlWNpJL/aoRtXAy31FTPe47FQTfciPou
	xqQLo5JdUmc4IjmJglX5Hg4QXkNpga5t6iJAph+G+DvHu5Ii4Nof+IZEdd3tBD4YBkaIYKqTb/r
	VeZgFSjBB4VhEEPOmKr+EyoJaid0da4ydnED+v0hrpxZJUFv3fnnaepiFZn4V4Wg6gVncnVJvbj
	8pnZ9KYrUmgLyDirEbQ8nYki3VcFuKNIjN2P183AjzPLfWWuF9QoDwKJrl6PtJ+x0+WhkWW+D82
	SFmpZSDpcl8AQqCXGs9zVXJ9dgGIWWpVT0H
X-Received: by 2002:a05:600c:4ecc:b0:49e:6be6:d783 with SMTP id 5b1f17b1804b1-49e6be6d9dbmr138768675e9.0.1789298945625;
        Sun, 13 Sep 2026 04:29:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm17806381f8f.10.2026.09.13.04.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 04:29:05 -0700 (PDT)
Date: Sun, 13 Sep 2026 12:28:59 +0100
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
Message-ID: <20260913122859.4d5067cd@pumpkin>
In-Reply-To: <ffffa178-c475-4249-a609-c5d222704987@paulmck-laptop>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
	<20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
	<DLD0OHX8C4ME.VNR49VC2UYH4@gmail.com>
	<14cb8a91-497d-49f5-aa20-c6cb8b9a27fc@paulmck-laptop>
	<DLDICNLENSRI.2R6EJ0ZFJE45T@gmail.com>
	<8c51a669-eb6b-455b-a829-b537da5209f8@paulmck-laptop>
	<20260912221400.4045198b@pumpkin>
	<ffffa178-c475-4249-a609-c5d222704987@paulmck-laptop>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_042907_714265_B3CC9C9E 
X-CRM114-Status: GOOD (  19.95  )
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

On Sat, 12 Sep 2026 15:31:24 -0700
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> On Sat, Sep 12, 2026 at 10:14:00PM +0100, David Laight wrote:
> > On Sat, 12 Sep 2026 11:03:34 -0700
> > "Paul E. McKenney" <paulmck@kernel.org> wrote:
> >   
> > > In the old kernels, yes, we have current->trc_reader_nesting++.
> > > In the newer kernels, Tasks Trace RCU is instead implemented in terms
> > > of SRCU-fast, which instead increments per-CPU counters.  Which among
> > > other thins is a bit faster and does not need to hook into the scheduler.  
> > 
> > Isn't that rather architecture dependant?
> > It is fine on x86, but on arm incrementing a per-cpu variable is
> > significantly expensive.  
> 
> Last I heard, slow ARM increments of per-CPU variables were to be a
> transitory phenomemon.  Plus changes late last year greatly sped up the
> per-CPU increment operations.

There are some unapplied patches to improve per-cpu operations for both
arm64 and s390.
Without those preemption has to be disabled (in current->xxx) which requires
a conditional call in the preempt enable path.

David

> Plus this change removed some hundreds
> of lines of RCU code.
> 
> 							Thanx, Paul
> 


