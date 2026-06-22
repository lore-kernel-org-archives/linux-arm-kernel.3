Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE812CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 16:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkrUBunzzSd0lpNk16EVteU8HoOMNZNuJe8m7GqVJPA=; b=Fk60NuibexH8D+e48oT2ZZSKtA
	lykHy1fqLV0yo4+r3AvVHjK2r5qSTn3CHAJRfl2a4em6KwaTC3c7ZIpDpyj1IbT7JcUe3NXY6MCAe
	PIUNFfwYWnYsboii3u4RkVbRjQdLM1hlU4ndi226NB1hP2JifuoNhbmja/X/Ym35pKbprD/4wAGBQ
	QSfFX1K1OP9AX5L3QZeiB8AKY/f4I7kcF++Hgv3LIeaM+hOuKG1U6sSvphnpdebM/t4MLKat3o5FT
	NggN6fZ7dKhaDXz7As/KDJdmQmxedqxGKD0clYgIAasKDe948JKGcuJe3oDNKI1XUGChHWEeYGd8G
	VTQKU8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhvT-00000005DmO-1VTt;
	Mon, 22 Jun 2026 16:55:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhvR-00000005DmD-48kB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 16:55:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B85E3417EA;
	Mon, 22 Jun 2026 16:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3F51F000E9;
	Mon, 22 Jun 2026 16:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782147309;
	bh=tkrUBunzzSd0lpNk16EVteU8HoOMNZNuJe8m7GqVJPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zx4jUC0aWCq9VEBJoN0kOOYcuNOKSkjJSz+tdDvzkInO8/80PWmPij3R6QgCfsqJA
	 Ks+EYHJ2O+Idv5Oydi4cbp6Qq2+eowtNM3er63+S+6oUoAJfF4agBpyZU3i+PAvTGK
	 eiwCTwJslDKypU2fvhBUL0rKyUA+CRnjyzkXCNqyjtdETxDlJIMmJfJMFKXGUbX/XB
	 Cvrff97ZJ5ppUCNUOuQIYsUEihP9KZduCey39sBUCp9G1Qn285RDMJHjJqEjUi0i4U
	 ERu5PkCov6Dtbb6QmTDloCC60FozrSeBxYOvf76gCS/TPR8BpGPvj5j325lbBbUbrY
	 WRSuhKLQ9d9Ng==
Date: Mon, 22 Jun 2026 09:55:08 -0700
From: Oliver Upton <oupton@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org,
	jean-philippe.brucker@arm.com, andre.przywara@arm.com,
	suzuki.poulose@arm.com, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH kvmtool v2 7/7] arm64: Improve KVM_ARM_VCPU_PMU_V3_CTRL
 diagnostics
Message-ID: <ajlo7Arpi7XrGjFs@kernel.org>
References: <20260618155001.226266-1-alexandru.elisei@arm.com>
 <20260618155001.226266-8-alexandru.elisei@arm.com>
 <ajRBpMnlcNkhWzQL@kernel.org>
 <ajj6oGxytFm2NE4T@raptor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajj6oGxytFm2NE4T@raptor>
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

On Mon, Jun 22, 2026 at 10:04:32AM +0100, Alexandru Elisei wrote:
> Hi Oliver,
> 
> On Thu, Jun 18, 2026 at 12:06:12PM -0700, Oliver Upton wrote:
> > The whole if (ret) die_perror(...) thing is a bit repetetive IMO. A
> > treewide cleanup replacing this with macros would be nice, then you could
> > stringize the ioctl under the hood.
> 
> Thank you for having a look, that's a great idea, it will avoid out of bounds
> array access if KVM gets a new PMU ioctl and the name array is not updated at
> the same time - that's quite possible since ioctl numbers are pulled by running
> update_headers.sh, and the dependency is not obvious.
> 
> I think the compilation errors are a bit higher priority than this, and a
> treewide change would more involved, possibly involving a change in behaviour
> (the gic seems to propagate the error instead of calling die_perror(), for
> example), would you mind if for this series I'll only introduce the macro for
> the pmu and convert the rest of the code in a separate series?

Fine by me, thanks Alex :)

Best,
Oliver

