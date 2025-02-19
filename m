Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3272AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wHc9xYvlC/q6l0o0Am18i48IZTif6hhqEqLjIId9v8=; b=vG/rO+MHSGk7BWpNriiuPqGedj
	1iJSKBFxvieuCOg0jaR9fvEQQIUtK33DiQgS7bib5Boj6mGJBlJPe+KAI9Ipi2Nz8NPTPpx4q7pGM
	NuiPrR0Ts4iZqhi0B4NesgYNAs95S7EWt2/dTKdhAFBMqcbY1t/Ss53qewq0QJ+hgAHkUB17XNt2I
	DjPfxLwHZsU230WbsAorc+y6/xfGD94kv/ze5aqnNKp0ejllidxMgZsmmoyoHoBabFPuNWJroUJo+
	kJT3X5+cvaDwWiBo9uV12EqqLYxoyrHBpRIZVnahaa6YCC7wdyP9xjvnB2n/R8Gb42TgmkmrwRGXy
	Efrf9U8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkp6-0000000DDX1-1hlJ;
	Wed, 19 Feb 2025 14:13:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkklM-0000000DCSO-09x2;
	Wed, 19 Feb 2025 14:09:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 66890A427DF;
	Wed, 19 Feb 2025 14:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88685C4CED1;
	Wed, 19 Feb 2025 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739974158;
	bh=XltJ1uE6oJiW72uTsp9SrYcOrHJzHFDnZJnAMAUBblA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acUVZYzqAWbcvvKzl6CpR9f5/7Vrr3xgvB8rOS7mhJioQ8EbRLBSTpeq2HICycYiV
	 oJ59NEuQvlkJ+5C5H4H0oujqKYXh+kiYt+fX6gVaoX+vy/Cgl6aPL18Ccj6z4ESgfc
	 i6rwGjO/Af/76JpJWs7gNoov6dwDIHVwLUVHJlL7JLyfM5o7j10D/SEijAwXenL+ej
	 o+iK4JjxghZQjEZ2s5SotLHjrVTuPWdKVC3WOgh1QXCsFIsm0YwNS/DbC8Lw4vqFck
	 L/yZET9ERQBfsTzGnvjYdbpEtOfu1C3uzvwMUEbV8MmudDKE5F4JO9Fyt7uxeHiD0H
	 hI7hB4kktsANw==
Date: Wed, 19 Feb 2025 08:09:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Atish Patra <atishp@atishpatra.org>,
	Ian Rogers <irogers@google.com>,
	linux-arm-kernel@lists.infradead.org, weilin.wang@intel.com,
	Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org,
	Jiri Olsa <jolsa@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	Peter Zijlstra <peterz@infradead.org>,
	linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>,
	Will Deacon <will@kernel.org>, kvm-riscv@lists.infradead.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v4 04/21] dt-bindings: riscv: add Sxcsrind ISA extension
 description
Message-ID: <173997415655.2409606.4528669810137132252.robh@kernel.org>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-4-835cfa88e3b1@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-counter_delegation-v4-4-835cfa88e3b1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_060920_140738_0FF5BE06 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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


On Wed, 05 Feb 2025 23:23:09 -0800, Atish Patra wrote:
> Add the S[m|s]csrind ISA extension description.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


