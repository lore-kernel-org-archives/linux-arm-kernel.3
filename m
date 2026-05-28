Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BD8CD6E44
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 13:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xB83MMQJtgx4blW20grTGAuXYxlz2Qs+h6trlIglCbE=; b=T66dEuRWnCP1KZRSHaCiFfZjoy
	9IjdMBrT9AaXzIqZ/qnHBAXqA7SHqAPJbZ6PynUZpSuF6xDbjtUwkYDCev68OHtx63F1L27ND+5A3
	4Tv8/eung0w+sX1jjdXBw/mjzZFmPeAuIAxP6kB+1WlLK7Un9Q1QAxeLAaRwa0dczERdvqZF69kAt
	8RSw56+GLBZIcx+/VVrsUKdCVp0X0ugp+22PF9T1q+A3QKG0ViVCZOtXljGU48FrB64XHyxGPgSxH
	KCUNkVDnOFqMOMHntayqij6EOv0wKTDGGZuTYBb26AFHg5H5zZ7osjLeX4HkSHO0JZQLPJxM6cY4f
	YzUkcj1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSb0g-00000005niN-29fE;
	Thu, 28 May 2026 13:42:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSb0d-00000005nhU-37Vr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 13:42:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08F9444714;
	Thu, 28 May 2026 13:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A28D1F000E9;
	Thu, 28 May 2026 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779975770;
	bh=xB83MMQJtgx4blW20grTGAuXYxlz2Qs+h6trlIglCbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jWvZy6tTmXv4uK2QplcSaUgWUJIz92z+wKhi/zAmihpjBB2KWHqGf0DEnVSVk86uq
	 r5QWeFDoBUFGX134RmM8ZrZqzSq5O+xqC3oSwjHcwiCuGknN2M2Ei+7GuQmYezX51O
	 ZMbnL31fhJM+I5/7JGBFWMA4I1wTvooBYYUBPOCJyY1ftNzU5p8Aw8ndPOKE8P9h9F
	 HrxVYcEdsWly+3Os4Az8KFMGTTmMylXV+WAUPWh/f2IZy0YC/DptI4AjBY/wmRpYb7
	 j7glSISlhcmTvsI3G0e2JzzFARtcEgq80GfqjV3Ln1BI/NNEkJpbI+S3jhxiSodW1A
	 X9gq3AzK6tBhg==
Date: Thu, 28 May 2026 14:42:45 +0100
From: Will Deacon <will@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Yonghong Song <yonghong.song@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH bpf-next v2 3/3] selftests/bpf: Enable stack argument
 tests for arm64
Message-ID: <ahhGVf3RSWuMk0ph@willie-the-truck>
References: <20260427234801.2104511-1-puranjay@kernel.org>
 <20260427234801.2104511-4-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427234801.2104511-4-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_064251_805435_42B119AC 
X-CRM114-Status: UNSURE (   9.88  )
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

On Mon, Apr 27, 2026 at 04:48:00PM -0700, Puranjay Mohan wrote:
> Now that arm64 supports stack arguments, enable the existing stack_arg,
> stack_arg_kfunc and verifier_stack_arg tests for __TARGET_ARCH_arm64.
> 
> Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  tools/testing/selftests/bpf/progs/btf__stack_arg_precision.c | 3 ++-
>  tools/testing/selftests/bpf/progs/stack_arg.c                | 3 ++-
>  tools/testing/selftests/bpf/progs/stack_arg_kfunc.c          | 3 ++-
>  tools/testing/selftests/bpf/progs/stack_arg_precision.c      | 3 ++-
>  tools/testing/selftests/bpf/progs/verifier_stack_arg.c       | 3 ++-
>  5 files changed, 10 insertions(+), 5 deletions(-)

Do any of these tests pass more than eight parameters? If not, then
they're not touching any of the stack stuff you added for arm64.

Will

