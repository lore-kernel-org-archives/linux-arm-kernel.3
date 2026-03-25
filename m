Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7CCFEA83B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgOX2Ueq2+jdgqSbhNggaZUcUNC7RJqS127l3Eab4gA=; b=VaRTnDRflBj0voviZAmWSNASJ0
	vnFO2RcdBWYHVyk0TzXZF82IsSTRoFJrWd4brlW+rpWbH9V1oLie3nuL2m9GTyXrGhToz08u7Qu9R
	tbI9dMVLEwEN0ALLPliUvMtkgvdBdv/q+qnQezc2hn2ps7VhUO8ekJzYnY500tKZCQ0sY8+58EGmz
	4+BY7tKlIW4onyBJWGoyxdBxG5u0IAlTSDgXfgkoVPR2gjNKGxO4PiCGVdSv09mzXep5DVlqStfU3
	quD6XX+0eQl4ahUgxreU70+ltuPyul10nz3ph0oJ7nVXYUiJhq4LIHMkLe0dy+qbIi7xpDiLE7HGC
	pWKiFyKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LGf-0000000377V-2DWM;
	Wed, 25 Mar 2026 10:15:17 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LGc-00000003758-2u05
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 10:15:16 +0000
Message-ID: <c92395a7-5b56-415b-afe7-186b69c0a5e1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774433710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dgOX2Ueq2+jdgqSbhNggaZUcUNC7RJqS127l3Eab4gA=;
	b=QlgkJmdickflLaFfKx3wSePqh64y2bLOlWkY6yFHeG8ZzVP31aJMeNc572xoQFRhCGYDKF
	kwAq4R0G2EDBUA3MAQqZ2ce31T5qMqLJnZCpUvzJiLWZ5kzSQ61646XIuifUaY21CNr3pn
	StPmY8yn1+F9gGonqj1MgaiJPkAj+h8=
Date: Wed, 25 Mar 2026 18:14:52 +0800
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v10 5/5] bpf, arm64: Emit BTI for indirect jump
 target
Content-Language: en-US
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Yonghong Song <yonghong.song@linux.dev>,
 Puranjay Mohan <puranjay@kernel.org>,
 Anton Protopopov <a.s.protopopov@gmail.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Shahab Vahedi <list+bpf@vahedi.org>, Russell King <linux@armlinux.org.uk>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Hengqi Chen <hengqi.chen@gmail.com>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Paul Burton <paulburton@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Christophe Leroy <chleroy@kernel.org>, Naveen N Rao <naveen@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "David S . Miller" <davem@davemloft.net>, Wang YanQing <udknight@gmail.com>
References: <20260324122052.342751-1-xukuohai@huaweicloud.com>
 <20260324122052.342751-6-xukuohai@huaweicloud.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260324122052.342751-6-xukuohai@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_031514_885398_F85EC51C 
X-CRM114-Status: UNSURE (   8.00  )
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

On 24/3/26 20:20, Xu Kuohai wrote:
> From: Xu Kuohai <xukuohai@huawei.com>
> 
> On CPUs that support BTI, the indirect jump selftest triggers a kernel
> panic because there is no BTI instructions at the indirect jump targets.
> 
> Fix it by emitting a BTI instruction for each indirect jump target.
> 
> For reference, below is a sample panic log.
> 
> Internal error: Oops - BTI: 0000000036000003 [#1]  SMP
> ...
> Call trace:
>  bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x54/0xf8 (P)
>  bpf_prog_run_pin_on_cpu+0x140/0x468
>  bpf_prog_test_run_syscall+0x280/0x3b8
>  bpf_prog_test_run+0x22c/0x2c0
> 
> Fixes: f4a66cf1cb14 ("bpf: arm64: Add support for indirect jumps")
> Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com>
> Signed-off-by: Xu Kuohai <xukuohai@huawei.com>

Acked-by: Leon Hwang <leon.hwang@linux.dev>

> ---

[...]


