Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6768FEA83B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1c0m0l0BFph+vxPq0JK9iSEmYMllvCkSTL83OQwQZ68=; b=kVaQ2L38G3rQKvOZ7GmjYN8Cfv
	DIjASxbvZSgTD2UZZCwMbx9+6sy34gxDyzdU+c2ej2JeeWSGKQICBuy8mMbIqvUMF535+LYbUKMyd
	TvDn2pvkgyUCdyFEEYFz5UbxPl9JGgqrt5UGnJmXWQA5mYNUqS7T4QDKwoUScqXaKU0PniEBblQSm
	zgWHRXBE5XcJu8fKXVr+yfRt5dQNM6qSRUzUzWgqgK1Jal9GhlHfo7xSArYnsumRCvMtrcI46l299
	tWg9D81MaO+pQ//fynHQKyLCAOn8vEKSdj7+xn3raKYP8WOOVE0Q1A6dyDEkn48c5B0lsOYKYSDzl
	xyfS+T2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LFA-000000036to-0OcQ;
	Wed, 25 Mar 2026 10:13:44 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LF6-000000036t0-1Tmo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 10:13:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774433611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1c0m0l0BFph+vxPq0JK9iSEmYMllvCkSTL83OQwQZ68=;
	b=SsU4PKv9+lZGDqr2EaxCrhvGpHfT5pV6z0OIDaxH+Z4kRtrwqm8MD0Q/el6No/iYD9/2Y3
	rl1oJIt/C3CHRAh6D1Hr5nWpEAThsnSoU8IId1jD+inQ7KIvZm2TjbhsUNlaxZo9XlhewW
	Q7HWh79GyA17l2p8AfB2a3l8EvkPKBs=
From: Leon Hwang <leon.hwang@linux.dev>
To: xukuohai@huaweicloud.com
Cc: a.s.protopopov@gmail.com,
	alexis.lothore@bootlin.com,
	andrii@kernel.org,
	ast@kernel.org,
	bjorn@kernel.org,
	bpf@vger.kernel.org,
	chleroy@kernel.org,
	daniel@iogearbox.net,
	davem@davemloft.net,
	eddyz87@gmail.com,
	gor@linux.ibm.com,
	hbathini@linux.ibm.com,
	hca@linux.ibm.com,
	hengqi.chen@gmail.com,
	iii@linux.ibm.com,
	johan.almbladh@anyfinetworks.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	list+bpf@vahedi.org,
	luke.r.nels@gmail.com,
	martin.lau@linux.dev,
	naveen@kernel.org,
	paulburton@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	udknight@gmail.com,
	xi.wang@gmail.com,
	yangtiezhu@loongson.cn,
	yonghong.song@linux.dev,
	Leon Hwang <leon.hwang@linux.dev>
Subject: Re: [PATCH bpf-next v10 4/5] bpf, x86: Emit ENDBR for indirect jump targets
Date: Wed, 25 Mar 2026 18:13:03 +0800
Message-ID: <20260325101303.232060-1-leon.hwang@linux.dev>
In-Reply-To: <20260324122052.342751-5-xukuohai@huaweicloud.com>
References: <20260324122052.342751-5-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_031341_115991_EA6DC227 
X-CRM114-Status: UNSURE (   6.88  )
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

On Tue, Mar 24, 2026 at 08:20:51PM +0800, Xu Kuohai wrote:
>From: Xu Kuohai <xukuohai@huawei.com>
>
>On CPUs that support CET/IBT, the indirect jump selftest triggers
>a kernel panic because the indirect jump targets lack ENDBR
>instructions.
>
>To fix it, emit an ENDBR instruction to each indirect jump target. Since
>the ENDBR instruction shifts the position of original jited instructions,
>fix the instruction address calculation wherever the addresses are used.
>
>For reference, below is a sample panic log.
>
> Missing ENDBR: bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x97/0xe1
> ------------[ cut here ]------------
> kernel BUG at arch/x86/kernel/cet.c:133!
> Oops: invalid opcode: 0000 [#1] SMP NOPTI
>
> ...
>
>  ? 0xffffffffc00fb258
>  ? bpf_prog_2e5f1c71c13ac3e0_big_jump_table+0x97/0xe1
>  bpf_prog_test_run_syscall+0x110/0x2f0
>  ? fdget+0xba/0xe0
>  __sys_bpf+0xe4b/0x2590
>  ? __kmalloc_node_track_caller_noprof+0x1c7/0x680
>  ? bpf_prog_test_run_syscall+0x215/0x2f0
>  __x64_sys_bpf+0x21/0x30
>  do_syscall_64+0x85/0x620
>  ? bpf_prog_test_run_syscall+0x1e2/0x2f0
>
>Fixes: 493d9e0d6083 ("bpf, x86: add support for indirect jumps")
>Reviewed-by: Anton Protopopov <a.s.protopopov@gmail.com>
>Signed-off-by: Xu Kuohai <xukuohai@huawei.com>

Acked-by: Leon Hwang <leon.hwang@linux.dev>

[...]

