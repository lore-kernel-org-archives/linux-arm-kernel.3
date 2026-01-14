Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2EBD29FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 11:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGVDUUpgpDLMWHZgDOLEkAjObayE3q3JK8jeYcF9PIs=; b=MLsmOFuAoUxpTHSU0HG2s1RaUS
	8E/f7RoOYE2tF5UojUnHCMP6iPwGD70EEeeXeYx+VTdAjI+XB3UZ37z/dCCcPPxChlaXgTQw5AXpG
	5/96yz4/fgouhTeQwcqkM4OJO2OR/mPSY4qE8wZsFCtHPwytmsnluoTgfqN/euAsfkAtmlr05W8vC
	OSsl1Pm4tcnl4aKbGGCYMRmS5brkp7bqpAPCGv2y1vdTXq/sUIO4Fjd/owg3Vtezlyeh4PBuJ1QDB
	lxLNeY6SH5x06x9nHgEVSqVWTsINXySZ14L2u0Wpw0elOKClH8Sc4SY2suyGWBnQjnWcExroKvBp2
	eScCfuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfz31-00000008xfh-3NvF;
	Wed, 14 Jan 2026 11:28:23 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfz2y-00000008xet-0wzv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 11:28:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so64315275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 03:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768390098; x=1768994898; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGVDUUpgpDLMWHZgDOLEkAjObayE3q3JK8jeYcF9PIs=;
        b=EtC82BemMauWmI21KchBrkWeY7VdYXdlDMuqIY62i0l71t2fiKeSnKrK4IfIungQqm
         uY8/ojLtd5hoWfkCOl1CO+yG3MkHN8Fr1D+MgF9diwe5QFsDslc3TU9oLmkDrv+vq8+0
         Wjx4WKl1hvvzN1lzm7/7CLgQWPrOxw1awCLGOtiK8AgUI5PFApbbjiagTG0ogt4GmkCB
         wZIR8JAnAvAa0NlHm0RuaTrRzS+o+P1gffYIA55E47bn/0bT3sPOL5ukL8gmF7e6pN6W
         67L4HtFO2zllWx8WQ7UVRi3ldJVV4COPL/wYQHOCOltRCyE6xqqF59e7my3YeTCjEiSe
         L82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768390098; x=1768994898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGVDUUpgpDLMWHZgDOLEkAjObayE3q3JK8jeYcF9PIs=;
        b=Xxhz2e0ene1fsffcZGIU6gWNC5iTIH7qKAPxveWNpldZe5BfCaK2hXeci4I7/yNItA
         pUX1DBY/sZdL9CpBtVre6R7+fsGcB2ikUC7QptFndbVFd+l2wYL1zPBuWhlUElA1XBV2
         YWL2mpTdMIZS3S0w2iDjbGuK4XS+alDcMfyHFbG/kG0rV/ALKl4oxTXbqxhIzUNx533h
         hu3Nj+aFUIEcPbNE3qtFUYflum+brIcR4GmGz7ukDFy89r9vQWVQy/htNaz5DNLSF8w0
         ur5V+MNGjYGkl8Z30hnkShTBbfU2YAkQcy0GFvqui9jG5Purb8ecUXNYNY9lw+SVFPx8
         U0OQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/NnAuMSAa9rvWU3K/54128ML7MIZSRwP+VHhB84JFtTLPer9kIOTzAeiDC6WrtaArWYt/NVFKnpFfR7Smzfhd@lists.infradead.org
X-Gm-Message-State: AOJu0YyzFqLAVuBo/0PJxxse7O5sE5rKNMHWR/mQ86pAPzLNvcn9ts42
	e5woUwbWqkztRq1lolURIFu4i8u4Fu7kFoQWuYwzhzr+qcMe3QFkG+Lb
X-Gm-Gg: AY/fxX71HtTIMETvJfGQUojX1H+K8IAYEtZqHUxPVBEjJBW6xQqiXguyc3UZfJgwmg4
	np15c/HGs/tRwW71FIEHA0orD4KG3jy83H/UaHHXKxyPTrmADmWo9uvx7ocQ7LVC2JOi7eZt6S5
	TtNC3TkcVs9WzkcuGpzQ1vLofbeN7kIe3FxuiJ04HMTJ7xpugEzYjjqOTntQ9GS6wu70l9kKAIv
	Edk/nC/IApCujp2siXCI1eufREpdUIGVlPDFc9+5oW/lQN2+/6I1ygOpPBD3KaPiAnb0nNJDROO
	VbSbRAA9IxHJyZ8v6LyiN+2nai50/loisRNUCBtFaCbHgoIpiig158iColsxBg2SN2yfhODqXeC
	D27GUX/H1r44ZHBvpG/S81lj1WdheD3jp5ZeG803Eh5KwsrlvhahWSpRxE1ZBNEVJVTAt84fVJ+
	8=
X-Received: by 2002:a05:600c:4f0b:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-47ee4819824mr18444405e9.18.1768390097518;
        Wed, 14 Jan 2026 03:28:17 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee54b90d5sm23620545e9.2.2026.01.14.03.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 03:28:17 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 14 Jan 2026 12:28:15 +0100
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Leon Hwang <leon.hwang@linux.dev>, bpf <bpf@vger.kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	kernel-patches-bot@fb.com
Subject: Re: [PATCH bpf-next 0/4] bpf: tailcall: Eliminate max_entries and
 bpf_func access at runtime
Message-ID: <aWd9z8GVYO12YsaH@krava>
References: <20260102150032.53106-1-leon.hwang@linux.dev>
 <CAADnVQJugf_t37MJbmvhrgPXmC700kJ25Q2NVGkDBc7dZdMTEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQJugf_t37MJbmvhrgPXmC700kJ25Q2NVGkDBc7dZdMTEQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_032820_282962_C9A9B0AC 
X-CRM114-Status: GOOD (  23.93  )
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

On Fri, Jan 02, 2026 at 04:10:01PM -0800, Alexei Starovoitov wrote:
> On Fri, Jan 2, 2026 at 7:01 AM Leon Hwang <leon.hwang@linux.dev> wrote:
> >
> > This patch series optimizes BPF tail calls on x86_64 and arm64 by
> > eliminating runtime memory accesses for max_entries and 'prog->bpf_func'
> > when the prog array map is known at verification time.
> >
> > Currently, every tail call requires:
> >   1. Loading max_entries from the prog array map
> >   2. Dereferencing 'prog->bpf_func' to get the target address
> >
> > This series introduces a mechanism to precompute and cache the tail call
> > target addresses (bpf_func + prologue_offset) in the prog array itself:
> >   array->ptrs[max_entries + index] = prog->bpf_func + prologue_offset
> >
> > When a program is added to or removed from the prog array, the cached
> > target is atomically updated via xchg().
> >
> > The verifier now encodes additional information in the tail call
> > instruction's imm field:
> >   - bits 0-7:   map index in used_maps[]
> >   - bits 8-15:  dynamic array flag (1 if map pointer is poisoned)
> >   - bits 16-31: poke table index + 1 for direct tail calls
> >
> > For static tail calls (map known at verification time):
> >   - max_entries is embedded as an immediate in the comparison instruction
> >   - The cached target from array->ptrs[max_entries + index] is used
> >     directly, avoiding the 'prog->bpf_func' dereference
> >
> > For dynamic tail calls (map pointer poisoned):
> >   - Fall back to runtime lookup of max_entries and prog->bpf_func
> >
> > This reduces cache misses and improves tail call performance for the
> > common case where the prog array is statically known.
> 
> Sorry, I don't like this. tail_calls are complex enough and
> I'd rather let them be as-is and deprecate their usage altogether
> instead of trying to optimize them in certain conditions.
> We have indirect jumps now. The next step is indirect calls.
> When it lands there will be no need to use tail_calls.
> Consider tail_calls to be legacy. No reason to improve them.

hi,
I'd like to make tail calls available in sleepable programs. I still
need to check if there's technical reason we don't have that, but seeing
this answer I wonder you'd be against that anyway ?

fyi I briefly discussed that with Andrii indicating that it might not
be worth the effort at this stage.

thanks,
jirka

