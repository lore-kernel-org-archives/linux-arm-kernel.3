Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A527CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouo9AaSsF8ngv/27rIlwf+1t1Eq7caSAr7jrccNnoBo=; b=rbOPLlbzer81vS
	fM0C0GqO1SdZPXhIRo3nIdTBD3aYoMytT0fKnRXM2EYJEI6Eewo26jTb1HC714ls4ahZ8iYAnfhIF
	X/SdapJomu/wjbsc8Jk1NpPKOBPumDzqDuGvfxLvrnTTW0TD7ivW27i0ujwnSxz81KIG0QKTROYgj
	N8em4dNPjIT27CU7oLfn0CkXU3+nCS3Er6wNo0FlRtgFEMNULnxUhl46T6zUAGAUwQM0q1gZiNpxw
	v7AuQ28wOSELvjplF7Qk9cYypdOaZejm5Vjv25v6ZbrHYUC7lUBH+TSeWj8s0wPPVasDggLPV61qD
	q981pZWPFmgc6F8toVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPej-000000080ya-15uW;
	Wed, 24 Jun 2026 15:36:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPeg-000000080y1-19Va
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 15:36:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 045C125E1;
	Wed, 24 Jun 2026 08:36:41 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADA8A3F905;
	Wed, 24 Jun 2026 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782315405; bh=M50mZOnjSmcU5WbMjUBbVWCmMvSNyLoYovIMUHigCII=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=eDF/UWkJ1ftcZgGHDRFVOkZp7p939OiySPPJMXRgirVHoD/S3mZhG5XqG4z+vA11q
	 ZOzjODhiJywBROb4DUhD9hgJB2V5R0PKL5dWWgxByxMP76ladlXW0l4kOnPCfcoDCr
	 jXQyh12curLtGk8fOjT+S25mvfTvXEyWWA88wfL0=
Message-ID: <0b708c88-ff7c-40ff-8de8-800ab61677f0@arm.com>
Date: Wed, 24 Jun 2026 16:36:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 11/11] arm64: Inline el0_svc_common()
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-12-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20260511092103.1974980-12-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_083646_357844_0FEFCFEC 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, will@kernel.org, kees@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, oleg@redhat.com, linux-kernel@vger.kernel.org, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, linusw@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/05/2026 10:21, Jinjie Ruan wrote:
> After converting arm64 to Generic Entry framework, the compiler no longer
> inlines el0_svc_common() into its caller do_el0_svc(). This introduces
> a small but measurable overhead in the critical system call path.
>
> Manually forcing el0_svc_common() to be inlined restores the
> performance. Benchmarking with perf bench syscall basic on a
> Kunpeng 920 platform (based on v6.19-rc1) shows a ~1% performance
> uplift.
>
> Inlining this function reduces function prologue/epilogue overhead
> and allows for better compiler optimization in the hot system call
> dispatch path.
>
> | Metric     | W/O this patch | With this patch | Change    |
> | ---------- | -------------- | --------------- | --------- |
> | Total time | 2.195 [sec]    | 2.171 [sec]     |  ↓1.1%   |
> | usecs/op   | 0.219575       | 0.217192        |  ↓1.1%   |
> | ops/sec    | 4,554,260      | 4,604,225       |  ↑1.1%    |
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---

Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>


