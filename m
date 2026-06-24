Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B90CDB481
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/l31aFoLkYXULxkiiaQW3tbp9T7vAp2eE+weh3Vyq4=; b=0RxQENkzSjN+Vc
	l8Ck+kd6bftlFmPOFUcqBfhqUxXaNuwzKL9W3EO3UjXA2h5unXfWdKWZg2lRR2fUJ2jrij4HDOMpm
	X42Rzi2Szfc/bvSGMZON3vJxJD+jrSQb9xAbovtGs985NdDs83AeQGuGH0rJ5syCaig4aB6rYU9Zf
	vBIOBHoENDJR957L80UX9s/sNu274zg7Uz4HVVadnydr+kn12FS8r6AsVzl5WNXyyKZagZIY6j6Y9
	eMnXEkB1tk1xJ93hD8kUukjRSrhxL4H8FbCFm8zsQEIHLB5YW8Vn/CSzW9VatloLj3+6ap+OgTubS
	Geh+02h0qkg00iJvJkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNuS-00000007qSM-2UbM;
	Wed, 24 Jun 2026 13:44:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNuH-00000007qPx-2EXo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:44:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CBC1266C;
	Wed, 24 Jun 2026 06:44:39 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9E1D3F905;
	Wed, 24 Jun 2026 06:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782308684; bh=uTY32MEl1Vm4FJTPumQMrUtcmDgw6VN8h11MTpuNDkQ=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=ftxD07VjruiMYBU0yi7F/6HvO4qUjhSEO6OgYINvgv++AdpKIbxj7mrlcbP1ngOTM
	 /5aECM3PExdqC+M4w8JhZ7PgLQwr2d7naCi3KhHFIaXYMDf7xbAu+2HtQKQmc8tKMx
	 wok9dn+s1ET7O2qc4S5d73Magv6u8fDc67xjMgUY=
Message-ID: <a3fd2dd2-1865-4f94-836b-7a651f5a8d8c@arm.com>
Date: Wed, 24 Jun 2026 14:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 05/11] arm64/ptrace: Use syscall_get_arguments()
 helper for audit
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-6-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20260511092103.1974980-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_064445_668228_76158000 
X-CRM114-Status: UNSURE (   8.08  )
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

On 11/05/2026 10:20, Jinjie Ruan wrote:
> Extract syscall_enter_audit() helper and use syscall_get_arguments()
> to get syscall arguments, matching the generic entry implementation.
>
> The new code:
> - Checks audit_context() first to avoid unnecessary memcpy when audit
>    is not active.
> - Uses syscall_get_arguments() helper instead of directly accessing
>    regs fields.
> - Is now exactly equivalent to generic entry's syscall_enter_audit().
>
> No functional changes.
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

