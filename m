Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2ACC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wy27XylQTJtJ3Y2kpD07918dwUDlxLsdszQfEU+FnpI=; b=mpgxfNImIu+U3faslSgfbripA1
	5T2dxmNLLuju2BIb/syIB54aQxSQ7KWQbq1Ml0xGiy37uNu7TDoIzpg1vVv3/ei3o6v8WnKxvOoES
	pAK3vNPwHdegN332d2pudCJiU2RDFa0WAtNbXqAIAB/9H9VZ1TNDP6mZMdDyYJOxwp624+i4ebDGm
	dMwvwqiL3Gry4kWkgOudcFI53QjeNpEheRbQBfCa53fsUhR+fDuGwITeYNAfzcoHCvj4rsqwoySXq
	l8ksXTvaYmihlHVIMJeyygJv6J9t82gR3He0QJWrqnhDPz+B50o6mmozv2QCZLOWeejZZe7Y0iwfh
	2TsrV0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfcE-0000000C1Me-3Wb9;
	Mon, 06 Jul 2026 09:27:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfcE-0000000C1MT-0Axz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:27:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D9ED41FC3
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 09:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730FC1F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Mon,  6 Jul 2026 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783330069;
	bh=wy27XylQTJtJ3Y2kpD07918dwUDlxLsdszQfEU+FnpI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ADhw3IVvIBJqwuZaCa9VifOmk4K0PmBXgNAAdXRtR3o1lRi9Qd8v+WEb6LQScrw87
	 4U3Xgw+5gvSY+5+PlHxtJ/gK6wpFsYFCpWniDa3uVgB4XNXbZCDCSZV8fdwhXK2jJH
	 DPlCkUoEY4fct+hRQa1WOm7C5g4Cr1C5ETvy3Iar79747XpVGrGv3B5vVb3wgmCds1
	 Oa5b4YeWIRQsD86cFrayRkKXlhx6hFgnH2u187qWs8QnHtafBUmAyoy94WIyCdZHU5
	 v0NLm9/5UdgjHJ9SbIVK1tVlWLdLbxr+vyX3j1uAhJlD3Fi7OUw5pk6y9fBhGEyUC0
	 AyopSRtUNKQRQ==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e7632b193so163701485a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:27:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoeISRcAdovoE0OPEU8LATEaWXZ3dR2UE8HPZczU3zN9szYpEa7FCDYFdVqciL82gxOB/Y2vjfDEI5B1jKJJS3Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwqAa42i+xGaaipWzA0yH/mTWdJVqS5cMKEWOGpjdOwPZnVh/gV
	0Da9EzMdl1N7CTbQ1j2bRJd+ujkjG1dRWb/OJoNVY1WnfZSn6TXiC8Q6qPUQp6SaM3LpyViJhtX
	2IUXV6C811az5qjEwRDwQdnmLtCkPNYU=
X-Received: by 2002:a05:620a:459f:b0:92e:70e9:6865 with SMTP id
 af79cd13be357-92e9a4eb48dmr1255848285a.59.1783330068520; Mon, 06 Jul 2026
 02:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260706084232.177786-1-jiangwen6@xiaomi.com> <20260706084232.177786-7-jiangwen6@xiaomi.com>
In-Reply-To: <20260706084232.177786-7-jiangwen6@xiaomi.com>
From: Barry Song <baohua@kernel.org>
Date: Mon, 6 Jul 2026 17:27:06 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w-vUV=-EQd1fDJ5K71b=a606NPrzEubtdmBGteOmasfQ@mail.gmail.com>
X-Gm-Features: AVVi8CdSZB9L0QzLhUWUjoEAyLiw0cSdtQRCJLhNwBUlc06gVCP3iTKrXFbv1G0
Message-ID: <CAGsJ_4w-vUV=-EQd1fDJ5K71b=a606NPrzEubtdmBGteOmasfQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] mm/vmalloc: align vm_area so vmap() can batch mappings
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org, 
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, david@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rppt@kernel.org, ryan.roberts@arm.com, dev.jain@arm.com, 
	shanghaoqiang@xiaomi.com, Wen Jiang <jiangwen6@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jul 6, 2026 at 4:44=E2=80=AFPM Wen Jiang <jiangwenxiaomi@gmail.com>=
 wrote:
>
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
>
> Try to align the vmap virtual address to PMD_SHIFT or a
> larger PTE mapping size hinted by the architecture, so
> contiguous pages can be batch-mapped when setting PMD or
> PTE entries. We do not expect any significant overhead for
> this.
>
> Add __get_vm_area_node_aligned_caller() as a wrapper over
> __get_vm_area_node() to simplify repeated calls with fixed
> arguments.
>
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>\

please collect Uladzislau's reviewed-by tags [1].
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
also to other patches with tags gotten in v4.

You can use b4 which will help collect tags automatically.

[1] https://lore.kernel.org/linux-mm/aj6m1cFUTlr_DCdj@milan/

> ---
>  mm/vmalloc.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)

