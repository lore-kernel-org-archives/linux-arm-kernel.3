Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76280C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YLzEa2NgKc01BCihyFFvuyxmNzf4DGeagOdMFCmVpEw=; b=yg5zte2vozefJq4BFKbiFynLgD
	ttmRKOJRW73rTUj5mMuqhUvRbE0NwfSp1ksz13ce9pOFwP3i/coVNvrJDpFAOSaMKe/Smw++0mN9X
	yEOLcFElV1547QzoFe52e9/Al82ZU4WHqfw62g0xJWd1IaT4ukRZHyd6Pg10eyYVz9mvw8uA7zyH/
	B85OwGvlMDBOJfVpr9xyp/0KwY3wHXUBmSL9SckDw18lA3CWUduRVehuaA5YzjdnUjLNTJImY6l34
	3S2vIveCgBy9Nu230r41Rw71R5oVfpiNWDs+DeebtacCUnU2qwfGcGzFK1SiEuY8O5zV658HqCOFJ
	A22Cgm/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wGT-00000004m9b-1e6h;
	Tue, 22 Sep 2026 08:54:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wGR-00000004m98-3ne3;
	Tue, 22 Sep 2026 08:54:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AA1260DDA;
	Tue, 22 Sep 2026 08:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A301F000FF;
	Tue, 22 Sep 2026 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067250;
	bh=YLzEa2NgKc01BCihyFFvuyxmNzf4DGeagOdMFCmVpEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eZBhPXfeygiiU2f/pWtXEIFzdO1vnHyv9utcEzx5sCi5XdKNrN9kNs6QgfMYMO2cl
	 JHdWSJG6JobZ2aIXM0UrxDOm/Nhuzxt9hTmfLApAHw2EqHRBVimWQRaS9tAfMLmfD6
	 A28ePCpBvIfXoIdtIPyuQ1qyX5YDEPfFQzjLOLakzjCh9L9y9ITyD/W6GuRURRZhn3
	 HG3zRcy7T1ZQr4VDjrCo+Vw8XsWqteTMKv/qE9J+UYlygb4nz3aKGuC3N0t5mEbeA7
	 DD7oe4nIcp45NiurQv8bVw4Z4TwyviX22YWABtkICBG7pYIyGUvp/BPbFddhgrwRa8
	 cftqB5tqV8T7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/9] of: reserved_mem: add dumpable flag to opt-in
 vmcore
To: robh@kernel.org, baoquan.he@linux.dev, rppt@kernel.org, "Wandun Chen" <chenwandun1@gmail.com>, m.szyprowski@samsung.com
Cc: mingo@redhat.com, saravanak@kernel.org, pjw@kernel.org, linux-riscv@lists.infradead.org, pasha.tatashin@soleen.com, kernel@xen0n.name, iommu@lists.linux.dev, ruirui.yang@linux.dev, tglx@kernel.org, devicetree@vger.kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, catalin.marinas@arm.com, dave.hansen@linux.intel.com, loongarch@lists.linux.dev, robin.murphy@arm.com, linux-kernel@vger.kernel.org, bp@alien8.de, pratyush@kernel.org, alex@ghiti.fr, chenhuacai@kernel.org, linux-arm-kernel@lists.infradead.org, hpa@zytor.com, linux-mm@kvack.org, kexec@lists.infradead.org, mark.rutland@arm.com, x86@kernel.org, akpm@linux-foundation.org, conor+dt@kernel.org, will@kernel.org
In-Reply-To: <20260922084256.1515554-7-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-7-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 08:54:08 +0000
Message-Id: <20260922085409.18A301F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> From: Wandun Chen <chenwandun@lixiang.com>
>=20
> Add a 'dumpable' flag to struct reserved_mem to decide whether a
> reserved area should be included in the kdump vmcore. Non-dumpable
> regions are later marked MEMBLOCK_NODUMP;the filtering itself happens
> in memblock, keeping the arch kdump code independent of the DT API.
>=20
> Most reserved regions are owned by devices and do not contain data
> useful for kernel crash analysis, so dumpable default to false.
> Reusable CMA regions are different: their pages are handed back to the
> buddy allocator and may contain key data for crash analysis, so set
> dumpable to true in rmem_cma_setup().
>=20
> The dumpable flag is also used to check /memreserve/ entries for overlap
> with other dumpable regions.
>=20
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922084256.1515=
554-1-chenwandun1@gmail.com?part=3D6


