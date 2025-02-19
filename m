Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA37CC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aotvtXY5joSud1TxPceETpqMVazL9DPCFZ9MSGevTQM=; b=S7hCWNg2+DuKFElYe6QfivZiqI
	ToaD3vtiDMX0lPtXOqcWQ6KaPCjbNlu1TbODlLS7MiA3eH42KjtWMk00IXfo0wXGgN+BiYwVeb16F
	8Dd7d5mK+l6svb8RHwXLVIVQ2klQ/zMPl7c6ZkYEk8BdW4y6RLmag3Y41dsc8GQ92sQgP0sj/WXEc
	BQiXwHaDRyD4mGo9Ldic2CwX0i0VxkJ3xQszayv+D/X6XKtbcAKOz8Q2isJdNz1AkewLaG2N+ARi1
	6CZy4I48MUAbGX03lCVs+n8Si80fKkDvFnBjEXC/NldE4V39+pD9v0YV64VuwAIdg79BxI+4wxwwl
	oUiP+LRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkqZ-0000000DE1q-067y;
	Wed, 19 Feb 2025 14:14:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkklo-0000000DCZU-3d9V;
	Wed, 19 Feb 2025 14:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aotvtXY5joSud1TxPceETpqMVazL9DPCFZ9MSGevTQM=; b=R5jYSkgbYEyZUIXiBw9NNTNYt8
	ivDSS3gNfo9m91hGCZpI/QM6Dej1py2vex9Zv4S0R7T7HehTtMHSUG730GP7o0ZpknXFjZ+mME6vv
	9P60PsZ1zhJ/07+CgbZ7lm7sUMEf37oiYcIFSj25mj35sGfalY2CBf/gScogEXo6r680RFdo3/GuP
	LZzBcqEnAjCY8sVQY3XhhLbERiVbR1h4Skwr9Y1XSismntv2cb61G5I36e0NYGLE8F91j/gLhovRM
	i/aGrnriEFdOiIqQvXB8DEtpPcyawzErdmPGQL45VPr1sgFTsAuYvdcOsgxO/6xUjKsDCaHmTGovw
	ZsqfX33Q==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkklm-00000002AaK-0UK1;
	Wed, 19 Feb 2025 14:09:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E466A427DF;
	Wed, 19 Feb 2025 14:07:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65FDAC4CED1;
	Wed, 19 Feb 2025 14:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739974183;
	bh=JWgcAq5A9ztdHbWMUTio29UETb/IscdfA8OBtkFemUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TccyuFSRpBorHgFXQPF4jywQnxaSyjRv5kG0R1jqKWyU4qXc+AvWbZPQalZw47dNY
	 OIyGPzJhUXQrWy8URny+Ye7RihHebYiW0UsSKZCOe7SzmxKwsroHZhPWIgJqrwm7tO
	 w+f5r48Z4U/KBR7wKl5OsddGrT5Jiq7+apwAz3kkyOmUIjMPqxgUO9gVgi5hSyGJL4
	 /qs8Li8q3E432iMYZ4dvsHbL0Ymu6nVunLHBPYdZ1xsmtD3cdsjIwiRuvUhOPm1in5
	 He6Un2pb1KKcEuJxV9heTakSXyRZMo1BzaRq7puhdlvspqo+DvYQj80PmMMkrCByJx
	 EVxkVZcTdkhog==
Date: Wed, 19 Feb 2025 08:09:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: Will Deacon <will@kernel.org>, Conor Dooley <conor@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Ian Rogers <irogers@google.com>,
	linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>, kvm@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-riscv@lists.infradead.org,
	Peter Zijlstra <peterz@infradead.org>,
	Namhyung Kim <namhyung@kernel.org>, devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-perf-users@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Subject: Re: [PATCH v4 07/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
Message-ID: <173997417868.2413662.12513351374335592804.robh@kernel.org>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-7-835cfa88e3b1@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-counter_delegation-v4-7-835cfa88e3b1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_140946_318176_583429BC 
X-CRM114-Status: UNSURE (   9.53  )
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


On Wed, 05 Feb 2025 23:23:12 -0800, Atish Patra wrote:
> Add the description for Smcntrpmf ISA extension
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


