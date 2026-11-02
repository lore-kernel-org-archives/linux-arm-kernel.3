Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E96606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XDF39vJG;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=iKvQtl60
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:
	Message-Id:Date:In-Reply-To:From:Cc:Content-Transfer-Encoding:Content-Type:
	Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fkdHJk8QQRuS99Uc5GE49DCjtU5u9to+Rk8I4s2WNPU=; b=XDF39vJGZoNix3
	nVyB+n2O+lD9Y327tMf3n7slYjoI+q1rXNGs0oQzOqRGeRcMmYTYfCm+bELIMWc3IR6lVHtg56deo
	PZAd5j3eUQS6erGdFh7+oZ+S+pXJZJe90TOtRPm3fKvllcToOkkwlh0fS8dZ6EWpmPLq5cWUCorUG
	wJxt8HUf/8W9l28XCwVF8ty8GONfQqrfzrYGkGLZnEKnVH/br8nXG38IsgAyW+otq1sBJZtozpSA2
	9IFgWa7gaKfoBDt6xJRuBs3MvksbJL1Q/v/kauZSTMrp7j5rQXUmI9wBYRYAUq7HXyWSxE2JD12e+
	ewMb2a8h7+hHmvRaDOtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNngA-0000000FuCn-3gcO;
	Mon, 02 Nov 2026 08:46:10 +0000
Received: from va-1-114.ptr.blmpb.com ([209.127.230.114])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNng7-0000000FuBo-3WAK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 08:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793609156; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=fkdHJk8QQRuS99Uc5GE49DCjtU5u9to+Rk8I4s2WNPU=;
 b=iKvQtl60VKC7KY5oseQXOFdHZCqTieWhzHEHaieKm4Q41DlL92H/kqzhHmZyJPnWEXEOkA
 r5VKrtqULsDEkv1Qb8u9k3Nk5e5RsorZUcW0dg6WLXXBBOStwbGB4wW2UWdh1zbc4GKd9h
 UJVsaqibFZMMHRDpKZglBwO9oj+Ek9bwc76owZxkLEVez46lJN+vFFiev0Eg+/EW7Bt3P9
 Oz+ez8v5HZtwwQ63J/uhQD61bvWk9tQL93dJKkfqWgaIA0OwUqn0ZlgE3zsm55dgyJGZya
 IsevLdpFMM00sSBXjn1yF4pBvZkrc86NfonPAGm+xwwFhdzgukzJSmGTL1OFSg==
X-Lms-Return-Path: <lba+26ae84dc2+b6dbc6+lists.infradead.org+zhaogongyi@bytedance.com>
To: "Jinjie Ruan" <ruanjinjie@huawei.com>, 
	"Catalin Marinas" <catalin.marinas@arm.com>
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a group-stop
Content-Type: text/plain; charset=UTF-8
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Content-Transfer-Encoding: 7bit
Cc: <will@kernel.org>, <mark.rutland@arm.com>, <oleg@redhat.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
In-Reply-To: <d8aced38-fb7a-4359-b3ab-c625faae5023@huawei.com>
Date: Mon, 2 Nov 2026 16:45:35 +0800
User-Agent: Mozilla Thunderbird
Message-Id: <8028d335-c304-49de-81fa-07fd446cf9d0@bytedance.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261023110710.10145-1-zhaogongyi@bytedance.com> <at-czRUYRPRxi9dy@arm.com> <d8aced38-fb7a-4359-b3ab-c625faae5023@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_004607_953068_9499E661 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinjie,


On 11/2/26 3:54 PM, Jinjie Ruan wrote:
> 
> I think maybe we can refer to ptrace_get_syscall_info_op()?
> 

Thanks for the suggestion.

I checked ptrace_get_syscall_info_op(). It is currently static to
kernel/ptrace.c and identifies a syscall stop only when
last_siginfo->si_code is SIGTRAP | 0x80.

The arm64 path here also needs to handle a syscall-exit-stop when the
tracer has not enabled PTRACE_O_TRACESYSGOOD. In that case, the tested
si_code is plain SIGTRAP. Reusing the current logic from
ptrace_get_syscall_info_op() would therefore fail to recognize that
syscall-exit-stop and could update orig_x0 from x0, which contains the
syscall return value at that point.

We could refactor the generic helper and consider recognizing plain
SIGTRAP there as well, but that would broaden this fix and potentially
change the behavior of PTRACE_GET_SYSCALL_INFO. For this patch, I think
the local check of last_siginfo, with bit 0x80 masked and ptrace_message 
checked for PTRACE_EVENTMSG_SYSCALL_EXIT, is the smaller and safer change.

Thanks,
Gongyi

