Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7104BC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 00:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTiGAPpOWMHzJ1rSyzTkVWuov0ND7qTYHfNAnzYv4pc=; b=lvckmj+Iu+K376aUoIaCu8UmCW
	nSL+4+pkgydsdveVee2UWEmlyAQ9qrNvgE1eU1bxXvuDcEUrFiqbn4DVOeNvqEPJa2pCdbG8vOS0I
	qCOxnoW19Nb0u0lR5LiwQuyZNtfBmxKKw/7F5IFkhH0A04mhsGP0/rpsaNd3it71pTDCCzLS/+cAp
	eefmHWSVnwCQLiZkCMuyUv/U/IGEeFs4p7iHBpVZ0zY5aixNC7x+DtzZSa6XEPeJ7wpkEvHagDyTh
	7UOp/857V/Zvhyuil8xnUxR+qaz4L3xQky5M6S47BBcEh+PksO8bgMGXturUL4QEXhlE2lKzIFn0Q
	mTK1+h2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWOcO-00000003iic-1UoP;
	Tue, 01 Jul 2025 00:13:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWOY4-00000003iXC-2e56
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 00:08:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64FBF60053;
	Tue,  1 Jul 2025 00:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBC7C4CEF0;
	Tue,  1 Jul 2025 00:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751328510;
	bh=bTiGAPpOWMHzJ1rSyzTkVWuov0ND7qTYHfNAnzYv4pc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aPWI4FcSQW/2KaQ5ixcbZiLQJx3Uc/RUyTDYlVNwuTv2tapP8T2u5TerprMY/Tzra
	 F7Rsxx9/sicfOHM5K9QjTWsVHoBHbMj5bK1zZIOkDcBKSZ31QPM9SnDtY16KK9GegU
	 63BebeZUwn2Rs55rjnx/GlXdnAQ5xDbUA3VoWrQU=
Date: Mon, 30 Jun 2025 17:08:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ryan.roberts@arm.com,
 david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 0/4] Optimize mprotect() for large folios
Message-Id: <20250630170828.f2c09168346c8c75c0ebcbc0@linux-foundation.org>
In-Reply-To: <daa7a396-5737-4b06-bb25-fb06dd7f803b@arm.com>
References: <20250628113435.46678-1-dev.jain@arm.com>
	<abb9d742-d7ee-4379-aa0c-9f5d68cd076f@lucifer.local>
	<daa7a396-5737-4b06-bb25-fb06dd7f803b@arm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 30 Jun 2025 17:13:07 +0530 Dev Jain <dev.jain@arm.com> wrote:

> @Andrew could you remove this from mm-new please?

Sure.

