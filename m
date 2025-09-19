Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1984CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 11:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIkiBvMA6JeWONNzDm5/DzBhYza7SWGDeRUB71fxshg=; b=Xc2OeGKI/lOoUZHsDBs8dRwecb
	pLHE+2bMiFvRhNccDWrLxYbIqsPtBgJZjiUHcN1e2l1mmHYRfFFV6jB6kS0ztb6brsqZ5d4gRk948
	txSuxsscjwqUWBe2WmgYkLfArS7uy+W13IRROZiKDyyNn60moVwuYgoyhVh+XKZeF8V7RDwqEkouT
	hNJsUzf/ytOFWgokj98F/DY4h5bsqlk3AWO/MHl1Dgl2FV9ekQfp72AqVJd+1g/7F2rhLXwuw+BQk
	4FhdhyeQ3iUP5zJNOHkWzUklE0wuqTmaZwfn3H4jgiqwX2tJWzU7shwzyj4ohPWNEEVeHmbOdZRmr
	I9EmizKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZGv-00000002hXO-2p6L;
	Fri, 19 Sep 2025 11:27:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZGu-00000002hXD-0v2e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 11:27:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51AF860053;
	Fri, 19 Sep 2025 11:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C01C4CEF1;
	Fri, 19 Sep 2025 11:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758281243;
	bh=C7w7HkIT7yX2Ji+TqLNQ8VqWh4vuv3N2kHTkNH+vyH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KyDFhaX0ckf5/YrwFt0U5X9+9yhz7wuK1xRDrQby4m9loYda/mWYsYv9SY59N4gJ6
	 5d073ME7gJ1z9rA31EIzjFcxe4I3AVQIT/2NSGorRpYNEOtT+F8EhM2AZW46Dw/n0Z
	 vaGYR9Xfm5JfGdqLNtiL2cnXXVqj1BrqYqoU5i4BKvOWzGv2Yd7B4cAICNJ5fC+Vc8
	 uGGjcIe+DLFxmnd3I3SiLsEKP6g/IP4pH72Gg5RuodsraJis5EAIqdG5XWt1P3jcEV
	 Huk4QRaOzR7e3qPnBSCwxW8/GHEjjU+k0tlGpa0pNjQEMA5kAEawmKxX5Pe+HA5fh7
	 knPyNOYNgXPaA==
Date: Fri, 19 Sep 2025 12:27:17 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org, david@redhat.com,
	lorenzo.stoakes@oracle.com, ardb@kernel.org, dev.jain@arm.com,
	scott@os.amperecomputing.com, cl@gentwo.org,
	Yang Shi <yang@os.amperecomputing.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v8 0/5] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
Message-ID: <aM0-FQlepoxxGkRd@willie-the-truck>
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <175822779944.710258.10028837182267037801.b4-ty@kernel.org>
 <fc43aa07-d4ad-47d5-8381-61d4a9b8c467@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc43aa07-d4ad-47d5-8381-61d4a9b8c467@arm.com>
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

On Fri, Sep 19, 2025 at 11:08:47AM +0100, Ryan Roberts wrote:
> On 18/09/2025 22:10, Will Deacon wrote:
> > On Wed, 17 Sep 2025 12:02:06 -0700, Yang Shi wrote:
> >> On systems with BBML2_NOABORT support, it causes the linear map to be mapped
> >> with large blocks, even when rodata=full, and leads to some nice performance
> >> improvements.
> >>
> >> Ryan tested v7 on an AmpereOne system (a VM with 12G RAM) in all 3 possible
> >> modes by hacking the BBML2 feature detection code:
> >>
> >> [...]
> > 
> > Applied patches 1 and 3 to arm64 (for-next/mm), thanks!
> > 
> > [1/5] arm64: Enable permission change on arm64 kernel block mappings
> >       https://git.kernel.org/arm64/c/a660194dd101
> > [3/5] arm64: mm: support large block mapping when rodata=full
> >       https://git.kernel.org/arm64/c/a166563e7ec3
> > 
> > I also picked up the BBML allow-list addition (second patch) on
> > for-next/cpufeature.
> > 
> > The fourth patch ("arm64: mm: split linear mapping if BBML2 unsupported
> > on secondary CPUs") has some really horrible conflicts. These are partly
> > due to some of the type cleanups on for-next/mm but I think mainly due
> > to Kevin's kpti rework that landed after -rc1.
> 
> Thanks Will, although I'm nervous that without this patch, some platforms might
> not boot; Wikipedia tells me that there are some Google, Mediatek and Qualcomm
> SoCs that pair X4 CPUs (which is on the BBML2_NOABORT allow list) with A720
> and/or A520 (which are not). See previous mail at [1].

I'd be surprised if these SoCs are booting on the X4 but who knows.

Lemme have another look at applying the patch with fresh eyes, but I do
wonder whether having X4 on the allow list really makes any sense. Are
there any SoCs out there that _don't_ pair it with CPUs that aren't on
the allow list? (apologies for the double negative).

Will

