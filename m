Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BB4CF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+2RMibk5qCZlj/6zmvcs/X6W3gfpL9YpQv70ggfokw=; b=GacQqEMJd8bNib8oAxpv0GDD/E
	GWxXdwAsWPQTJ7fK3qIZx6+I7IAvOOHYyDIiSomhvwj6WJ0qSDmhrjRVej0X/qb3e5rT8DUNvoGfV
	UsJq7jlrgQhG8uTcIhBcpizsIWW6GBMYoF4QLoeQHsJPdk62ZoY/oSyOw+pxEBcbu8rMzH8DCe/I1
	Rpt/yWd9Kpnui/XPrddwH4WAPMfT7mAIBWqei96BLgocd7XziYKu254gIDq9RHJR/DNpNiv2VuJEg
	CQEJebnyKPTUOs2EeeV5Qy6dKE8R/3QL9Cx1SmlgXKqSOHpQW2MkWuK9bZlZV4YfppENd57uqJr/1
	EZXTSOjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkMj-00000003Vri-48zy;
	Wed, 19 Nov 2025 15:45:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkMf-00000003Vpy-2UI0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763567099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8+2RMibk5qCZlj/6zmvcs/X6W3gfpL9YpQv70ggfokw=;
	b=AeYttVC174L81fsSZCyrXbteruGobwH11N4VmTsj1LnLTBvGEfqKc5QUQdnF/cAOHKnku7
	VVFSf0XD48X+Q28ADTsihAeuFxwsvXdZfoJ0Vto3wS4n/5OX6w13FGA8Bti+B5MYKsq34z
	NFPKA4k39ov/fgx73H/KqrRffdW7j6s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-4qlrB7y6PCel633cWJdK1w-1; Wed, 19 Nov 2025 10:44:57 -0500
X-MC-Unique: 4qlrB7y6PCel633cWJdK1w-1
X-Mimecast-MFC-AGG-ID: 4qlrB7y6PCel633cWJdK1w_1763567096
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4779da35d27so35383225e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567096; x=1764171896;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kk13dNEBENY1o2hkoOmhPMN6DaHaKFtT0pxiR0fZhjU=;
        b=musjFOqG7+wdTH2SClU59V+FmH26VDio0pyyLmncaVVuuxU0gqeRO0sioStvRLJn+N
         ucYPPdbucuoD0CE6viQZbP8vuhS4MiGKeaw4FMBrZmtMxSj22pprMl6o+0E2TCkDSpC4
         OBGotXKuUs28BJ41y6uaWZLEF6iX64ySbczu3iMA9tq3yTFuVE3lzgofF+7X+fU3KKMc
         5q/CIgj20ig1wnBcO9alV6jwgsPpCSX8FwZZO9rt5j0EWaXhdb5jQvw2qkRShGZ9cBXR
         HVRdKmecJ7M0//q1NMFSk6tyVyvn/q1FggorW5wv6uM+65Z/F68U5IeeezsYRYvCBJMV
         5FrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp0FxBBJAPm8lX4yrLud1FiDBe2O9l0/RgMRdJ3b0lhC3X5IzT8JyfTXU/OSouxENZL5HMMTPf+1gTdgW9PMsC@lists.infradead.org
X-Gm-Message-State: AOJu0YwTEa+0Rvz07anRemh3jcMfRQ1s2Akxcns1DrxHaBoyJotg9nhM
	QGfV/ZBIcvPuj90J1FlMCpienklV+fRU98RQQ7znfbHiEW3Xrpv+CO1ED9feXsY9eyXAvPgHTiz
	/BAsRYNiXiCP6s7Sw2tYecC83UbPc9vOAKhz/TNSaHYhsij8v9HIDyGEJjfyQXBhGfbiDI064mS
	Cr
X-Gm-Gg: ASbGncsR6VGc8WWp8u3fb8kFDp8/6QIsLRHkHXchdSsCIk4XhX1dL7hS1SqgCp0TO3n
	hkw9xWYtAkCQKt055tqxrZQlCMbzhokYMyPF1HAZaYyjS+fHPnjUNM8WUkvtq7yun21l4LdvBmP
	RoCGGi6cqBgDVzK2N1t0CcNzxDxhQbelmncAlKgODiY1yjxXDRGm547cqB7MSPrmZ5E4bVvvm+k
	B2jxAR0uM9/dYfUBpj4o6kS0gdXNr9rAafXSsWSZ+eQIi+7bsRb+H0vL37JVuVZSR906Ochzwrm
	TD1N+Z6uShHfF21MiXoT2V77tX8RifLHLGjJBjUlDUuVdCXBKOhtbDtGlaakbHXgzZBETayM1Dq
	RpYtpJ/boZVBybyE0Yg/B3dspuYOQzWg/BbXNvZ1it8fmtXaHma5pKXlWMt46gYw5QOYoNX4=
X-Received: by 2002:a05:600c:1d0e:b0:477:9cc3:7971 with SMTP id 5b1f17b1804b1-4779cc37a15mr119020645e9.20.1763567096229;
        Wed, 19 Nov 2025 07:44:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkP+NxoN8NdgRlSeWXCmLJ99Tn2hRpBffdqlJtKvc6mMNR3Hn0LkbgzbfrqY0lLueiMZLQiA==
X-Received: by 2002:a05:600c:1d0e:b0:477:9cc3:7971 with SMTP id 5b1f17b1804b1-4779cc37a15mr119020335e9.20.1763567095710;
        Wed, 19 Nov 2025 07:44:55 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10260adsm53340155e9.7.2025.11.19.07.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:44:54 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Andy Lutomirski <luto@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-mm@kvack.org, rcu@vger.kernel.org,
 the arch/x86 maintainers <x86@kernel.org>,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, Josh
 Poimboeuf <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd
 Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>, "Paul
 E. McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>, Steven
 Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, Sami
 Tolvanen <samitolvanen@google.com>, "David S. Miller"
 <davem@davemloft.net>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>,
 Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mel Gorman
 <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Masahiro
 Yamada <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [RFC PATCH v7 29/31] x86/mm/pti: Implement a TLB flush
 immediately after a switch to kernel CR3
In-Reply-To: <65ae9404-5d7d-42a3-969e-7e2ceb56c433@app.fastmail.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
 <20251114151428.1064524-9-vschneid@redhat.com>
 <65ae9404-5d7d-42a3-969e-7e2ceb56c433@app.fastmail.com>
Date: Wed, 19 Nov 2025 16:44:53 +0100
Message-ID: <xhsmhecpukowa.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _nQNCXZK9HQlBPsgksQk14QXtKNAv0e5O4WQsX2luDI_1763567096
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074501_708994_92E17D75 
X-CRM114-Status: GOOD (  23.49  )
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

On 19/11/25 06:31, Andy Lutomirski wrote:
> On Fri, Nov 14, 2025, at 7:14 AM, Valentin Schneider wrote:
>> Deferring kernel range TLB flushes requires the guarantee that upon
>> entering the kernel, no stale entry may be accessed. The simplest way to
>> provide such a guarantee is to issue an unconditional flush upon switchi=
ng
>> to the kernel CR3, as this is the pivoting point where such stale entrie=
s
>> may be accessed.
>>
>
> Doing this together with the PTI CR3 switch has no actual benefit: MOV CR=
3 doesn=E2=80=99t flush global pages. And doing this in asm is pretty gross=
.  We don=E2=80=99t even get a free sync_core() out of it because INVPCID i=
s not documented as being serializing.
>
> Why can=E2=80=99t we do it in C?  What=E2=80=99s the actual risk?  In ord=
er to trip over a stale TLB entry, we would need to deference a pointer to =
newly allocated kernel virtual memory that was not valid prior to our entry=
 into user mode. I can imagine BPF doing this, but plain noinstr C in the e=
ntry path?  Especially noinstr C *that has RCU disabled*?  We already can=
=E2=80=99t follow an RCU pointer, and ISTM the only style of kernel code th=
at might do this would use RCU to protect the pointer, and we are already d=
oomed if we follow an RCU pointer to any sort of memory.
>

So v4 and earlier had the TLB flush faff done in C in the context_tracking =
entry
just like sync_core().

My biggest issue with it was that I couldn't figure out a way to instrument
memory accesses such that I would get an idea of where vmalloc'd accesses
happen - even with a hackish thing just to survey the landscape. So while I
agree with your reasoning wrt entry noinstr code, I don't have any way to
prove it.
That's unlike the text_poke sync_core() deferral for which I have all of
that nice objtool instrumentation.

Dave also pointed out that the whole stale entry flush deferral is a risky
move, and that the sanest thing would be to execute the deferred flush just
after switching to the kernel CR3.

See the thread surrounding:
  https://lore.kernel.org/lkml/20250114175143.81438-30-vschneid@redhat.com/

mainly Dave's reply and subthread:
  https://lore.kernel.org/lkml/352317e3-c7dc-43b4-b4cb-9644489318d0@intel.c=
om/

> We do need to watch out for NMI/MCE hitting before we flush.


