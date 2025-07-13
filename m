Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7F6C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 20:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8990dxjrznG0JSkj3aHxx+N6QWcYjYhaSbDc4HNWnps=; b=1iicfKyFvVyAAV2PMqXzrQQQRW
	KpVtFbs066kfLPLUFsN6kl7+iW9F9Tr7HGN0F9sBuWw2sOkI9nSK/u/AW4D0Gxu7bZp5NDqrRwZMR
	fNvM2cVlEgsF9cQ4aQKAg5QdJFv/40oSuZXTMMR0Bi4JRrDPU0bqluMoS9wbBhbXGxMuVfEKNrR4/
	Fpoon65FDT9wH5p7ZrKH1RIz5I/ikTHo+tqZFRq0sYJx8LVTHU9VczYVDVKhRuJCWE/1eWiBS0hLr
	Fxxk9BZmirCxrhzjNiaQ5GjrRbik5s0WTncMvaTvYmKrWQXmYz5Sryw3JsIA3746hoIPhwWUgeuH6
	RIlofouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub2vM-00000000Zsn-3hy6;
	Sun, 13 Jul 2025 20:03:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub2sw-00000000ZZK-3xO7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 20:01:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 539825C55C3;
	Sun, 13 Jul 2025 20:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E933C4CEE3;
	Sun, 13 Jul 2025 20:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752436877;
	bh=2zr47mFpEIUp6+WoMgmh+bczIGgMGmEmW+H3pXP+Vcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwN2eEvtsmiwgZQkmgiaqQbNqM8MNGEksgicOAw3CXZyNWVJCTtiO/rOFa59iocTw
	 oeiCaQWneW4Ladp8vl2yc+tvSHl7lvf8dzfHHR8fSvEFpxAlg+hk05j/zHVcDxx5Pe
	 yjFXCSKC0y/hF5H5gb/+yiiC1ks8N9/w96abk/KQn/yy6lj4hZy3GKIB5uofoEC09k
	 oooE/Og0l1GzZi4wxZw1Z+rT88bBDEEVRA8nAaDDWJS3hVJ3WzLpTFjnHyuRlya7/m
	 jwFecGhR7ON4O82hNPiUIaaoIH4VyLZYZ0Dp1pdw1CGdOaxbsUuVwp/YjgS0XTlg+E
	 SNA15WlKueFaw==
Date: Sun, 13 Jul 2025 21:01:12 +0100
From: Will Deacon <will@kernel.org>
To: DaeRo Lee <skseofh@gmail.com>
Cc: alexandru.elisei@arm.com, james.morse@arm.com, kernel-team@android.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, qperret@google.com,
	sebastianene@google.com, sudeep.holla@arm.com,
	suzuki.poulose@arm.com, tabba@google.com
Subject: Re: [PATCH v3 08/10] KVM: arm64: Handle FFA_MEM_LEND calls from the
 host
Message-ID: <aHQQiJr2xLe9KotP@willie-the-truck>
References: <aHOXzUvGaQ1Bz3jG@willie-the-truck>
 <20250713145957.623842-1-skseofh@naver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713145957.623842-1-skseofh@naver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_130119_025299_C46DE25E 
X-CRM114-Status: GOOD (  19.29  )
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

On Sun, Jul 13, 2025 at 11:59:57PM +0900, DaeRo Lee wrote:
> > > > Handle FFA_MEM_LEND calls from the host by treating them identically to
> > > > FFA_MEM_SHARE calls for the purposes of the host stage-2 page-table, but
> > > > forwarding on the original request to EL3.
> > > 
> > > I have a question about your patch.
> > > Does treating FFA_MEM_LEND as identical to FFA_MEM_SHARE imply that
> > > the host can still access the memory even after it has been lent?
> >
> > Only if your TZ implementation is broken and relies on the NS hypervisor
> > for isolation.
> 
> I believe pKVM is managing stage 2 isolation between Host and Non-secure Guest
> VMs or between Non-secure Guest VMs
> 
> <Quote DEN0140_FF-A_Memory Management Protocol>
> 2.2.1.2 Relayer responsibilities
> 10. Unmap the memory region from the translation regime of the Lender, if
> managed by the Relayer as specified in 1.2 Address translation regimes. This 
> must be done only if the memory region is in the Owner-EA state. This includes
> removing access to the memory region from any DMA capable devices assigned to 
> the Lender.
> 
> From the content, it seems that when performing a Lend operation, it's
> necessary to perform a Stage 2 unmap of the host memory area. Am I understanding
> this correctly?

No.

pKVM doesn't use FF-A to manage host/guest page ownership.

FF-A is only used for memory management with the Secure world, in which
case a LEND transaction will mean that the Secure world must prevent
Non-Secure access to the memory itself and not rely on pKVM to unmap
at stage-2.

Will

