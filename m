Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5592CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 19:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGrKcUl/Wvx3TiCpmjIl2Pof2fd57towgC+IHdtL1ag=; b=4935ve5e+hkFkHiybYxJsyyhQH
	f5nvrEVSip+tvB7r1QUgS4uVQrziojRLxriVwihycnWIKe/Mk6aBr4GwfQ+tYOKroqtw8CkjoFOU2
	X02WpSD64wOj/nQiqoNj8utwtnnA27Xk6N3gnoFX9gSY1p+ZqAs88scGL16j9dmaeM9hPheBcsjp5
	RYWJqhh/uLuDAsVeYOWHsvtVdfT/epDLWkwu2GXdjAZa6151xF2Pb7Lts8s0TNHdlN4l2XXQfe/Qv
	T0sO/0BMzQ7n1XhxI6xSoGwcMrc+Y6RnW31MxUAsi2ZlrZlOiTQjkI5LzXkyKXKK4wkBLD4paJENg
	5aNCea0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHOJ-0000000EouB-0vHB;
	Wed, 13 Aug 2025 19:44:07 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umErh-0000000EVsZ-0EB7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 17:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1755104052;
	bh=WGrKcUl/Wvx3TiCpmjIl2Pof2fd57towgC+IHdtL1ag=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MuvLHElZGRDWFnCVT+NnlI4W1mHq8Ana3HPCeK9yoKM3itBo63t8EmK9V0Gjjig4N
	 aDnFxVINYAGe8PT4NaDbWoR7XM9bSscicq8jYUqq/EAPxHPr7sLS/oWfJ+RQScdTJO
	 x06fSt4M4hlFa/hNyjK4d/BfPPUfKxxh6torBlDk=
Received: by gentwo.org (Postfix, from userid 1003)
	id 88AB9401FB; Wed, 13 Aug 2025 09:54:12 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 87A7D4010E;
	Wed, 13 Aug 2025 09:54:12 -0700 (PDT)
Date: Wed, 13 Aug 2025 09:54:12 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Arnd Bergmann <arnd@arndb.de>
cc: Catalin Marinas <catalin.marinas@arm.com>, 
    Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org, 
    Linux-Arch <linux-arch@vger.kernel.org>, 
    linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
    Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Mark Rutland <mark.rutland@arm.com>, harisokn@amazon.com, 
    Alexei Starovoitov <ast@kernel.org>, 
    Kumar Kartikeya Dwivedi <memxor@gmail.com>, zhenglifeng1@huawei.com, 
    xueshuai@linux.alibaba.com, Joao Martins <joao.m.martins@oracle.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
    "Rafael J . Wysocki" <rafael@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 1/5] asm-generic: barrier: Add
 smp_cond_load_relaxed_timewait()
In-Reply-To: <67b6b738-0f1c-4dd4-817d-95f55ec9272b@app.fastmail.com>
Message-ID: <e4f4cc15-194a-5203-c9a8-c9cd0334a922@gentwo.org>
References: <20250627044805.945491-1-ankur.a.arora@oracle.com> <20250627044805.945491-2-ankur.a.arora@oracle.com> <aJXWyxzkA3x61fKA@arm.com> <877bz98sqb.fsf@oracle.com> <aJy414YufthzC1nv@arm.com> <67b6b738-0f1c-4dd4-817d-95f55ec9272b@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_100217_133538_99570CAA 
X-CRM114-Status: GOOD (  10.54  )
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

On Wed, 13 Aug 2025, Arnd Bergmann wrote:

> I think there is a reasonable chance that in the future we may want
> to turn the event stream off on systems that support WFET, since that
> is better for both low-power systems and virtual machines with CPU
> overcommit.

WFET is coming in with V9.something I believe so its good to be prepared
and it will simplify the logic.


