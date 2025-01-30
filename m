Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342DDC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 07:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLCh+tatBBGoG+KXA63+7xQMMZDdLguhv+Isvay7xM0=; b=zOlaD2VpXFUFDFqOSTAlHdmxkL
	eutdk+2fnczM4UHMR+4tqyd2zbnBx2JXbjN5uoW2wrBWS/Yalwb1nQS+K+UkPB9p7A8+IxzW8u7R0
	FVDOl5Y9fo2uADg4wy9cgyruCFTlGgAaOcCLdYObBcm6ioj43Rn6uyN3/+LJkDaDOb7KmrWYENOzQ
	QQWFYh1d246N+PWogfY+PYJUD0tC3rzvQXXWFCGJqHefEZi4qki91tqefSbXHbx+3xbxJEDTztVBt
	STUCX3FA7S5aUIkp7fMXYDOxqnVQLUNe4JycN5nYzfY3LvJ7jVOD+iJlYJjx4Rp4RgHZ2VKC0SJNL
	OgNVAgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdP4M-00000008Mkb-38oZ;
	Thu, 30 Jan 2025 07:34:34 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdP33-00000008Maq-0v4R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 07:33:14 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-219f6ca9a81so58825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 23:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738222392; x=1738827192; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DLCh+tatBBGoG+KXA63+7xQMMZDdLguhv+Isvay7xM0=;
        b=UhSKXZr4FXq8jAKd68bmwHLJmDRFqelytorhiI6C3AIV/42+MU3nhhgdrrYo6bHGFB
         TJPj+IXeI16tuCn0XIuB5mDj+LbiTq6Q7EDgfIjod3XgHgsMzdaadEFwz2owP1VbgMKH
         r0QCsSj+Wo34GEyEiEsn8JByN2hk2I2IQCycC5w+OCoZr9VoejF7U7U9FWmxYpypgIxY
         oeQPx0pPobtKdaTQO9uqGag8hEKJ781SePZK4P/7WXdTikFq2IGakk8DJLnfirpuUvu8
         Bpd3jjOTXw7fa7deo1Accken9tzGUBBnjDe3k6sfc3Cu577OYveCT0CugqWS6E5dQY5Y
         JUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738222392; x=1738827192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLCh+tatBBGoG+KXA63+7xQMMZDdLguhv+Isvay7xM0=;
        b=rQP5F7oj5wyUkoXgdr94F+xQuMmaHs708Cqafl4QIBHEnqL1T7I+GvNs0h8UWRmGzt
         aQpHN325/+GBhbHWcqdM6vM+RF/hEU/Z6V0ZtEj991UlY5i8ohZ/+r8WBl5uzNUZNJ+F
         FX3NIUS5Qse0Qgk18KoW8w8BPYTO48OFW2RedWHHPcL5ODXN62Yru1BCEpdGqlqF7NkD
         xRe/wIzGlxPAZMslZvuCsJ15cqs0s4OdwuRUGCVWCwDzpL1hgI4eLXuc/fVqAjCFyjcI
         nE4h/yi2yYfBOuxLu33hiY5VUXW4oVdSxAs6HE/7KgvK8YWKwSwKuG+/GG9KJ2Elol0F
         oZdA==
X-Forwarded-Encrypted: i=1; AJvYcCWIBtgyZaVGIqyUj2C3Il6iJtAI8Y6o+ptSD5cKR8wkfZSLOX3kpArEJKNWAzFWHT6zW7JgfiggGIiXWyCEhMIU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7R3lwka5OxcBiQjx85/xP3IfJyTRZq1kIYgtIMhrDegrezw6c
	Ez9ULDNVqJBUZvvLj37lYdXK0/HsJmNWbddJAg+J7MwDCfE7drQuPP7G5S79YB1m80Zju17+Xc3
	ab12I
X-Gm-Gg: ASbGncslpysyD1jNy4NFCxi7mS+FQfqlfqQixZ2j3f6eOlOKdSfEb536FjkE91N5AzO
	bg5OZsJ9yWEumHjfMbARdgxfHYNcxgugp9ynHTpj/u+Qs+ocBGicb1L9YCXeIyKIML2kyvUSNxa
	UHquvKj1uxAvv6uRxltysmvPIN4lFQREm+7NbC3aqLW7kzoJniuuzZG4YeurvqUeDggl9AY7Tzo
	ToU5c4Zr3VnZhraYz6w1UZNIXrowj7ZRYAVRZEGfNG1Qxknna/1r+pSKiJbgnVlULHzJUapurNN
	rV3umSlW+djcUAUVXQWuT4xQYMdE20OVEgj4uzy/XmEICoVgd9c=
X-Google-Smtp-Source: AGHT+IGtAQyWP4E3jsq2fUXxPPBesuF/fheiJwtNQUCgGQWBzEClyXLLlz+nAdz/kOBuE6N6Xda0bw==
X-Received: by 2002:a17:902:740c:b0:21d:dd8f:6e09 with SMTP id d9443c01a7336-21de36189ecmr1296665ad.1.1738222392075;
        Wed, 29 Jan 2025 23:33:12 -0800 (PST)
Received: from google.com (55.131.16.34.bc.googleusercontent.com. [34.16.131.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de33000e0sm7571625ad.167.2025.01.29.23.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 23:33:11 -0800 (PST)
Date: Thu, 30 Jan 2025 07:33:07 +0000
From: Peilin Ye <yepeilin@google.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	David Vernet <void@manifault.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Quentin Monnet <qmo@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>,
	Neel Natu <neelnatu@google.com>,
	Benjamin Segall <bsegall@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Yingchi Long <longyingchi24s@ict.ac.cn>
Subject: Re: [PATCH bpf-next v1 8/8] bpf, docs: Update instruction-set.rst
 for load-acquire and store-release instructions
Message-ID: <Z5srM--fdH_JAgYT@google.com>
References: <cover.1737763916.git.yepeilin@google.com>
 <e2072e24a6773b346f2a71c80b6a28d5b98e6194.1737763916.git.yepeilin@google.com>
 <CAADnVQ+hi3918DUyA7bs4Va9NdNqXJg-R4A45n_MHGTikYaOSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQ+hi3918DUyA7bs4Va9NdNqXJg-R4A45n_MHGTikYaOSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_233313_280044_95ADB3E5 
X-CRM114-Status: GOOD (  17.90  )
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

+Cc: Yingchi Long

On Wed, Jan 29, 2025 at 04:44:02PM -0800, Alexei Starovoitov wrote:
> On Fri, Jan 24, 2025 at 6:19 PM Peilin Ye <yepeilin@google.com> wrote:
> > +Atomic load and store operations
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +To encode an atomic load or store operation, the lowest 8 bits of the 'imm'
> > +field are divided as follows::
> > +
> > +  +-+-+-+-+-+-+-+-+
> > +  | type  | order |
> > +  +-+-+-+-+-+-+-+-+
> > +
> > +**type**
> > +  The operation type is one of:
> > +
> > +.. table:: Atomic load and store operation types
> > +
> > +  ============  =====  ============
> > +  type          value  description
> > +  ============  =====  ============
> > +  ATOMIC_LOAD   0x1    atomic load
> > +  ATOMIC_STORE  0x2    atomic store
> > +  ============  =====  ============
> > +
> > +**order**
> > +  The memory order is one of:
> > +
> > +.. table:: Memory orders
> > +
> > +  =======  =====  =======================
> > +  order    value  description
> > +  =======  =====  =======================
> > +  RELAXED  0x0    relaxed
> > +  ACQUIRE  0x1    acquire
> > +  RELEASE  0x2    release
> > +  ACQ_REL  0x3    acquire and release
> > +  SEQ_CST  0x4    sequentially consistent
> > +  =======  =====  =======================
> 
> I understand that this is inspired by C,
> but what are the chances this will map meaningfully to hw?
> What JITs suppose to do with all other combinations ?

For context, those memorder flags were added after a discussion about
the SEQ_CST case on GitHub [1].

Do you anticipate we'll ever need BPF atomic seq_cst load/store
instructions?

If yes, I think we either:

  (a) add more flags to imm<4-7>: maybe LOAD_SEQ_CST (0x3) and
      STORE_SEQ_CST (0x6); need to skip OR (0x4) and AND (0x5) used by
      RMW atomics
  (b) specify memorder in imm<0-3>

I chose (b) for fewer "What would be a good numerical value so that RMW
atomics won't need to use it in imm<4-7>?" questions to answer.

If we're having dedicated fields for memorder, I think it's better to
define all possible values once and for all, just so that e.g. 0x2 will
always mean RELEASE in a memorder field.  Initially I defined all six of
them [2], then Yonghong suggested dropping CONSUME [3].

[1] https://github.com/llvm/llvm-project/pull/108636#discussion_r1817555681
[2] https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2023/n4950.pdf#page=1817
[3] https://github.com/llvm/llvm-project/pull/108636#discussion_r1819380536

Thanks,
Peilin Ye


