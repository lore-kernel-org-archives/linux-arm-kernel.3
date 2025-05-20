Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9242BC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGaDhBtg0n9ra9pI5cqVWokgALf7WrZel6+4231gxXA=; b=hnTUKaws5RSttEApI9v33t1OYG
	Nu6wZoZ8BHhf0B/wtPls+LgBNiiozXwMGWPh9G8FQcztJy+ObYSmIjEXhgNotBkDQdLJLtVrdd+Qv
	8QwgOuN9BuETfM6dBIE3UHBuM7h1CFO6/pw1Q+APqAYBVlrcw//VcTOyYDUxoJNZXK3xLhFH9xkmo
	2HhkA9NjuhMxnh3KU+A6zvnV3L+QFcBsw6qZZdD8J80yOLS5FHqEjSfdOmxiAe2WT+Df93APZKvGa
	5ub4TvETcTQAqn6ZvSwqIo/9US/hq3QBppQ8anZB8Cy3jet2OkIkvApkfhNrxUEh3Zco3aY99y1lh
	ZoT+S68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQyF-0000000Dhfa-2MfE;
	Tue, 20 May 2025 17:41:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQvH-0000000Dh8y-0wBp;
	Tue, 20 May 2025 17:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 875FD5C596D;
	Tue, 20 May 2025 17:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E04C4CEE9;
	Tue, 20 May 2025 17:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747762718;
	bh=VGaDhBtg0n9ra9pI5cqVWokgALf7WrZel6+4231gxXA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=W2dFTZpAcl9M+nfc1r9xaDZCJk8TLn67XmTY8rdFlL6tQ3H6x08/Itbbx3g/eApix
	 Dss9HxHoifsrAihzkzYOEEYsJ7bFueP8jkPDp20DleaNQ0gf5dy2hpkB3ZwCo0bQMS
	 pIe5ScVI19r2WcAY0fYDmxmzoLEvAg1Thy7i1o8rL7MfhB0M1UX+DVys/jR+lZGvwF
	 pQhnTVQtpx9hOzvQlgRlgLk9daRYqmLAP1Jscou9wWSfCATsexWNrPecHuHfaKNWBt
	 5OKdFpE5uZeb7rq7gEROMefo9pyMd/3R7yG31av6Ei3J9yUc+UGQlnfBFqj/6Lj1IL
	 +30Ae3besJmug==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: =?utf-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, Himanshu
 Chauhan
 <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, Xu Lu
 <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v4 1/4] riscv: add SBI SSE extension definitions
In-Reply-To: <20250516152355.560448-2-cleger@rivosinc.com>
References: <20250516152355.560448-1-cleger@rivosinc.com>
 <20250516152355.560448-2-cleger@rivosinc.com>
Date: Tue, 20 May 2025 19:38:35 +0200
Message-ID: <87ldqri3ms.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_103839_303535_AC96E75A 
X-CRM114-Status: UNSURE (   4.31  )
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

Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com> writes:

> Add needed definitions for SBI Supervisor Software Events extension [1].
> This extension enables the SBI to inject events into supervisor software
> much like ARM SDEI.
>
> [1] https://lists.riscv.org/g/tech-prs/message/515
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

After you reviewed the checkpatch output, feel free to add:

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>

