Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBC6CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vB9mXiKGH//ZjNPXu2UbFkQNzxkm6NBQrA35JISHdMI=; b=YqCFuiLN00BaNdwWlbPgYHgDwL
	RmMsu7/1Gy+9g11as5wUPhPzHz/KAoh1Dy9uYrYnqkDCUbSHGv97vKjrAX10+ZCI4BmKP3VoN+4hr
	+HyWzPY+qPkCgVf6h49+jXV32TtMR35Fv8FmihTdOCy12zskxo3t+M+tT4kdTwkr6X9QmGDNlWeGe
	zvsSgVSA4pWNGri2ILWeGMIBDuNcikOYWKBx5d1awpeo76W250BCAEXN3SFI2WXB4y7wldJjfCYLa
	xGthd0iWtVco7FUH5jCk74XstBNBjN/7Vtx7SKnVJVgNUj4faSzWtYs4WDDUCUXu17nDirawIEK29
	jPDQvs+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVdi-00000002NCq-1ItD;
	Wed, 22 Oct 2025 10:00:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVdg-00000002NCA-2qqq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:00:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1783361D03;
	Wed, 22 Oct 2025 10:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D775C4CEE7;
	Wed, 22 Oct 2025 10:00:14 +0000 (UTC)
Date: Wed, 22 Oct 2025 11:00:12 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Yang Shi <shy828301@gmail.com>, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] arm64: mte: Do not warn if the page is already tagged in
 copy_highpage()
Message-ID: <aPirLHXGEQ2AUzzy@arm.com>
References: <20251021181353.3842660-1-catalin.marinas@arm.com>
 <CAHbLzkpd8awNe=bZVv9fTux+Fx-HT8qL4ENZ-uC4YcPjf9e=KQ@mail.gmail.com>
 <b9520113-9236-4157-a4ab-fd6908f1b577@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9520113-9236-4157-a4ab-fd6908f1b577@huawei.com>
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

On Wed, Oct 22, 2025 at 02:19:19PM +0800, Kefeng Wang wrote:
> On 2025/10/22 3:00, Yang Shi wrote:
> > On Tue, Oct 21, 2025 at 11:14 AM Catalin Marinas
> > <catalin.marinas@arm.com> wrote:
> > > The arm64 copy_highpage() assumes that the destination page is newly
> > > allocated and not MTE-tagged (PG_mte_tagged unset) and warns
> > > accordingly. However, following commit 060913999d7a ("mm: migrate:
> > > support poisoned recover from migrate folio"), __folio_mc_copy() is
> 
> no "__" prefix

Yes, I got lost in underscores. Thanks.

-- 
Catalin

