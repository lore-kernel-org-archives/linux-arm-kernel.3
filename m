Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DA4D58D42
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 13:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoe9keCgOz8TdgaZeY2U5FChsOFwHzQn4aQ2XQc2oMk=; b=OcHJ3Y1Rm1kzylcj0QL5gqFFgA
	fduJKb0WSFH9JmZof/OT1OIWKoSbHd+gdczDrVqY6eb6Bjmi7PHZw7/YtVsn+5jAeVLLYNX97DrsR
	g9D9T4E0MWGtKeu3kcz00B7HXFD6jk/CsovFxN8BUmW8V4qx/4ttNKWIJCQbJ4iUnbmiFQXoGj6ks
	4HiXs1lCyDeAvvR1CbzQp/CHKzDNURYvjH/2AV8/eMoT0KjyoOWmb3kog91yN5gU1SlPvGFZR2uz1
	RGjloZKxIyQTerjBCDX1gX6uQZTwPofqHm4GdrXF4kb427iQAvDf2N62GmGZptdbLIn3ZchnIGWK+
	NPS0PtNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYuz-000000085ru-3EER;
	Mon, 25 Nov 2024 13:14:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYu1-000000085fI-370U;
	Mon, 25 Nov 2024 13:13:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 92F92A416C6;
	Mon, 25 Nov 2024 13:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F59C4CECE;
	Mon, 25 Nov 2024 13:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732540400;
	bh=zoe9keCgOz8TdgaZeY2U5FChsOFwHzQn4aQ2XQc2oMk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HUnFiL7mAae91KuKIjZq38fKCFSJ/xeAJC0MKHSCYoLch7XSINlDDErAkmEKfKrBl
	 7JuTksfjNvU+Dypx8p0EI/G2Fhzu9c8FHGOHjTRsxtkA6VLNB7Gy/Tskmtr9VySjLd
	 1/BwilXjzpT7eWAlgRWDMQVe6RXh1uSt11U6NtohY5ZZvTxLsSbPatv3SQLMVqkMnR
	 1GVIZ9VmtROba4i4EU1fuSctCl91TePgrrkXglv5+hmJlc3o//fcw0LB9Z5o8wnSYB
	 zY4qKyBWauQxBjUch391Y/FMHbdTpfMlXB+FVYUOR6QUhRl2qKkos6e6S6MjIiLwlQ
	 MF/4czrgX+pWA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alistair Popple <apopple@nvidia.com>, dan.j.williams@intel.com,
 linux-mm@kvack.org
Cc: Alistair Popple <apopple@nvidia.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, david@redhat.com,
 peterx@redhat.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 jhubbard@nvidia.com, hch@lst.de, david@fromorbit.com,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 25/25] Revert "riscv: mm: Add support for ZONE_DEVICE"
In-Reply-To: <f511de7cb9817e2e2fdd274ee842c228d699abea.1732239628.git-series.apopple@nvidia.com>
References: <cover.e1ebdd6cab9bde0d232c1810deacf0bae25e6707.1732239628.git-series.apopple@nvidia.com>
 <f511de7cb9817e2e2fdd274ee842c228d699abea.1732239628.git-series.apopple@nvidia.com>
Date: Mon, 25 Nov 2024 14:13:17 +0100
Message-ID: <878qt7zcb6.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_051321_844162_216FD168 
X-CRM114-Status: UNSURE (   4.58  )
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

Alistair Popple <apopple@nvidia.com> writes:

> DEVMAP PTEs are no longer required to support ZONE_DEVICE so remove
> them.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Chunyan Zhang <zhang.lyra@gmail.com>

Oh, we're getting the bit back! Thanks!

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>

