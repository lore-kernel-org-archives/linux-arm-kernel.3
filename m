Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADA7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZM23pMml37op4okXxniC3lYPw0eUd7wKPUTu+RhmK8=; b=sYK5E3jMT+1/NECQ1YAZP5VVsZ
	7+7Eov4qov4y24pcUvwiOUka5+EmkLI+u0MpCZk74Q72uV7lSZey8T5jcRNV3PN9+8yxcSh/69Np+
	59rHr6qI86aWoZaHCzLQAswmo6aLoa554TGQ9ZN0VTunB2tiaaZJ99JBmhrfJSE3v220JYyVFaw6x
	ybbm2gmKnpgYWOgY1vKn5TtzzkvrFJqo0fS/TLWKl+k1LkX797Qa9/1gRgP+eEjixaSbW/lMZ52Cr
	gSFYCp5dqRCnLklWerw80plrFHLyoweBBi1bu6ypfMP/rT8AhwgyoAM+EyCm3FpjlKVUVAF+WtHuT
	MK3xSpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1XV-0000000G3cH-1ga8;
	Fri, 14 Feb 2025 19:39:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1W3-0000000G3OC-013r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 19:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ECC05A432C7;
	Fri, 14 Feb 2025 19:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2DFC4AF09;
	Fri, 14 Feb 2025 19:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739561902;
	bh=V9sAZVtvPpbSHwjX3+ZKyFuEV2FgXN7gDRROnOTXxIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZnhThuL1rcyP/53Er7fRg9dl+i87uptxy5JQc7SC4U6VmxXJ+WDod5dQKlypT9FeX
	 j84/E3srsPnLeibvW05a7qQd6yW7DfP9qhQY8kti0796mhX2AnWAK1N5CCbmk1ZJZm
	 GLM6JpU50PhHU01Ab3frOCCpEWSIO8AsC0J8b82gmgQJJMebcU1WlIUapLTvpAjv5n
	 m6KDXAL0CXO+GEqzCLB7T1yaudSUIhnp+00c3K4/EYEMTB83+DTP4onhooYBeG00hf
	 LqMauNPIGSrgMOtWZxmc9Jp7NLCQlMQ9O65BXS/qRw2+4fmL4BK1vWGcT9ZkQ+o3K8
	 gLVdiRpc9Jp8g==
Date: Fri, 14 Feb 2025 11:38:19 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Indu Bhagat <indu.bhagat@oracle.com>, Song Liu <song@kernel.org>,
	Weinan Liu <wnliu@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <20250214193819.22yet42umilpugv5@jpoimboe>
References: <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <20250212234946.yuskayyu4gx3ul7m@jpoimboe>
 <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
 <20250213024507.mvjkalvyqsxihp54@jpoimboe>
 <CAPhsuW4iDuTBfZowJRhxLFyK=g=s+-pK2Eq4+SNj9uL99eNkmw@mail.gmail.com>
 <3069bb9c-6245-4754-a187-ac8253103d32@oracle.com>
 <mb61pa5apc610.fsf@kernel.org>
 <f8d93a1b-3ad0-4e19-846f-c08d9cb19f48@oracle.com>
 <d91eba9a-dbd1-488f-8e1b-bc5121c30cd1@oracle.com>
 <mb61p1pw0qrpi.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mb61p1pw0qrpi.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_113823_106830_49517F67 
X-CRM114-Status: UNSURE (   9.14  )
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

On Fri, Feb 14, 2025 at 06:58:01PM +0000, Puranjay Mohan wrote:
> and the linker script has this line:
> 
> .sframe : AT(ADDR(.sframe) - 0) { __start_sframe_header = .; KEEP(*(.sframe)) __stop_sframe_header = .; }
> 
> So, do can you suggest the best way to fix these warnings?

Just add *(.init.sframe) like so:

.sframe : AT(ADDR(.sframe) - 0) { __start_sframe_header = .; KEEP(*(.sframe) *(.init.sframe)) __stop_sframe_header = .; }

-- 
Josh

