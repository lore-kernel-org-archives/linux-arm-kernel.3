Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E740FD377C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wbsQFL10vOCjR7gd2xx+GAzVqi7WDR9yfFR1BBQ+h4=; b=XGnN8OsFVFzhT9MKGS97OF6T4O
	iOqjPyKtjfEBpWj3mHTfKaacvV905CU4qHU3EIcTEJ5gAzK9UHDjSAkWlv15Ig62Eb23RI+koHvDW
	CIKJJ/LHWS/rxDTu4YvHJvXT+qiITYjv/VSxBhh3fG6m/alIgvpz80bK+blyTdCOpgowOZCYq5WS1
	qgiWIHFt4/iJddAIk0fbGtBahFTFcb7QyXQOSu1GtsRR304Bo4ZqqAMZCyWQff/rYx3mwBe++N9D9
	hFPAh8aGu16LA8Ykv/OkwHk3D3qeEnXJ/sG7S7oUeEgrWyxYPNOr5UBXFL63Xt13vYBvZU+AVfrMr
	0wg1vl4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIzY-00000004gtz-236T;
	Wed, 25 Feb 2026 17:48:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIzX-00000004gtn-2Ihm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8ECAC60053;
	Wed, 25 Feb 2026 17:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C02C116D0;
	Wed, 25 Feb 2026 17:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772041686;
	bh=1wbsQFL10vOCjR7gd2xx+GAzVqi7WDR9yfFR1BBQ+h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=okNZO/VmEPZrkpD8nxT5vi5jfjeRj5DqbaJDxE0MZa3Ty8btR8ITaF0lFsj5NHZH3
	 W1Mb26a9tgAPYGogKr0vqRovRgjSI6B+lWynyYBYEVB052fds3CCy3q04P0Fohpdn6
	 ozPmmrGkjjIlKUVgRvzXmybOSctAe4jCtENkmXGZRAXLTcTBt3cm9YqQu3Rlma1LAn
	 x2BV9t5iVLDMyyw1KRZ6q41x9YcxJzYXJFoquhYDnoWTQfCeq7Fzngjwo3s0wDHOtf
	 l5e9I5aGD6FH8FAzi0e37d1ZqDb4E+l9u7CCTZXZIr9F9F0uY7yUsJ4SP6WYfg7IEQ
	 QsbOD4S3hsJ2Q==
Date: Wed, 25 Feb 2026 17:47:58 +0000
From: Will Deacon <will@kernel.org>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Fuad Tabba <tabba@google.com>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Jean-Philippe Brucker <jpb@kernel.org>
Subject: Re: [PATCH] arm64: bpf: Fix UBSAN misaligned access in BPF JIT
Message-ID: <aZ81zpP6ooG_19cI@willie-the-truck>
References: <20260224093128.1926610-1-tabba@google.com>
 <c402e95a-26d3-47eb-8249-52ece97989d3@huaweicloud.com>
 <CA+EHjTyXWqnr4Cu_cZyxDCVNCxto9pJN0WS18S_ri824oQhwug@mail.gmail.com>
 <2d0c6893-d4a5-42bc-a480-55bc669da130@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d0c6893-d4a5-42bc-a480-55bc669da130@huaweicloud.com>
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

On Wed, Feb 25, 2026 at 05:46:52PM +0800, Xu Kuohai wrote:
> Interesting, I think the plt target should be 64-bit aligned to ensure
> atomic reading on arm64. It can be updated concurrently by WRITE_ONCE
> in the bpf_arch_text_poke function while the ldr instruction in the plt is
> executed. If it is not aligned correctly, the ldr may read a half-old
> half-new value, causing the plt to jump to an invalid destination.

Thanks for pointing that out; I hadn't realised that we patched live
PLTs!

> To avoid over-aligning the entire buffer, how about fixing the padding
> method in build_plt to just make the plt target aligned correctly?

Makes sense to me.

Will

