Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAE8CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 00:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbMLU0DBTTE4ZUI3tpJtNUcx/FkgYHD5aLH5yKQ0ecU=; b=lP2Xtn94e7ZTeMvIkTLxKa8vVJ
	xk8ngt0Im2Y6Vv4EkHbhyRLRuzAAPc16BJNtAYvTWkWJzcYLPNC/QpLhVrHOHn732wnYIR6DY8eZQ
	dCsvGtERjQF/SZbKcQRzuZPOUimuw/jFfTiNaolUPlwohuV53FrsGiEq6nCLHdfOuBHsamrbs/7ZH
	DUBeYZBpjttbv8nvpMUgPzDBL0L5iTAsg60T6znGNBFDs8WrNMW+NqZ5sYGdfwaDv3oX2YWQiShom
	ErgEX93KFmhYfmVabzrrL1RQEusGrV3aESjvvzjwNHrjVwwOt7YPAhdokBuL9SN8f3KKbVGr2x6Xm
	1MKEpxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8SVB-0000000Eo7x-4AiU;
	Tue, 14 Oct 2025 00:02:53 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8SV9-0000000Eo6g-2Jsc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 00:02:52 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33428befc5bso10734360a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 17:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760400170; x=1761004970; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gbMLU0DBTTE4ZUI3tpJtNUcx/FkgYHD5aLH5yKQ0ecU=;
        b=wY6OcDhyiJ6wfd1LeAESA7WvDRtXZdFky0wtR9GIr1zqmcvf5f+KToUixS0/nmwPkT
         hZYif4+Zfq7w2fmU7U5EGWXkQHHPpj2Zgh196ogjUtdbUizLxbvuvMBhiEWroumPtdCO
         0r+8aDEiEqSvpy5DWTZ422ojNwuIRBFzLDk1+klm6LK7ggf0hU6Wsd6b70YcLnrYjWve
         6FrJgesMAPkYSipj115S4cIDTa2Efzzv8iYKx7GExN3MFh57nxFFYlgZrpMMEw8//muh
         8hNvVE7Dg47e6mmouia063zJFg+BtmLhaPNcQofsi8LvmqjX//VtxJNnNL9VMWmzhLHJ
         urAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760400170; x=1761004970;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gbMLU0DBTTE4ZUI3tpJtNUcx/FkgYHD5aLH5yKQ0ecU=;
        b=YDQQ4YLUkqC15/XY9r8cxyytrIm2a0LPKyp+L+saBdQZkEoiC9qm3ZFi/XznAC6VMt
         aX7DzzsF5zXcCIayIJAs0Lef1bssoITF/KTccQgYCzKJiZripxmfuAXb0HpXmh/2lcTE
         szFDD1QoNJlhAbwE3kfqZLZqHUDjXBWCJW8PSkYvj6JOYP9bGdB1xXq8EMxk9S4tyFlO
         cv20zJh8aGsOO+/9oW6uDYsEjPn718tmv4DOGuXFOqay3wjtjtUqvSP13BKC04wPubHA
         xlNCh2N39g32sCwsikJzwtowpT+DjZtyCA9mWvgBAY11gzz24jSoHLN2LYiK1nOAii4q
         p1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUhok8afzo4hzwAiTEFRGpupEGJoHoC/gQiGgmORELJnvsCry+GxV4GuUX+RpxV7vauupvgQ0BzeDGgfaEwLZUm@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5qCELZDjfBJkWrqhBnX+qulHCQ62RWN/+LTg3HnGfTLORhUxd
	e1pnc2PbCzh1NvcAi+as2/w975+YL2ZexHgZbBgTYzrMhLsve1ynafgY23quJEriuvyELWvIYzm
	AbZpPvQ==
X-Google-Smtp-Source: AGHT+IFj7XEk3dTkPnLos5082VprjEOkbmDHEla6HA+8/jfX0ozELV9F0rEtoGCDSVNCkEzGlN6/hN7WXyk=
X-Received: from pjzm8.prod.google.com ([2002:a17:90b:688:b0:33b:51fe:1a75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c89:b0:321:9366:5865
 with SMTP id 98e67ed59e1d1-33b513b4afemr31472790a91.33.1760400170137; Mon, 13
 Oct 2025 17:02:50 -0700 (PDT)
Date: Mon, 13 Oct 2025 17:02:48 -0700
In-Reply-To: <20251010153839.151763-17-vschneid@redhat.com>
Mime-Version: 1.0
References: <20251010153839.151763-1-vschneid@redhat.com> <20251010153839.151763-17-vschneid@redhat.com>
Message-ID: <aO2TKOY5JV9OoRUg@google.com>
Subject: Re: [PATCH v6 16/29] KVM: VMX: Mark __kvm_is_using_evmcs static key
 as __ro_after_init
From: Sean Christopherson <seanjc@google.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org, 
	x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>, Jann Horn <jannh@google.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, 
	Yair Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, 
	Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_170251_582857_5A1C0C7A 
X-CRM114-Status: GOOD (  13.47  )
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

On Fri, Oct 10, 2025, Valentin Schneider wrote:
> The static key is only ever enabled in
> 
>   __init hv_init_evmcs()
> 
> so mark it appropriately as __ro_after_init.
> 
> Reported-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> ---

Acked-by: Sean Christopherson <seanjc@google.com>

Holler if you want me to grab this for 6.19.  I assume the plan is to try and
take the whole series through tip?

